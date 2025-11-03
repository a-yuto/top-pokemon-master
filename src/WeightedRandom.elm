module WeightedRandom exposing 
    ( calculateWeight
    , calculateWeightSafely
    , calculateCumulativeWeights
    , selectIndexByCumulative
    , generateWeightedPokemonPair
    , generateWeightedBattleKataPair
    , BattleKataConfig
    )

import Random
import Array
import Pokemon.Types exposing (Pokemon)
import Pokemon.UsageData as UsageData
import Pokemon.Data
import Pokemon.BattleTypes exposing (BattleKata, Nature(..), EffortValues, defaultIVs, initBattleKata)


-- 実例: calculateWeight 1 → 256, calculateWeight 30 → 35, calculateWeight 150 → 1
calculateWeight : Int -> Int
calculateWeight rank =
    let
        -- 競技環境の使用率を反映: 上位ほど指数的に高い重み
        exponent = 8.0 - (toFloat rank) / 20.0
        exponentialWeight = 2.0 ^ exponent
    in
    max 1 (round exponentialWeight)


calculateWeightSafely : Int -> Maybe Int
calculateWeightSafely rank =
    if isValidRank rank then
        Just (calculateWeight rank)
    else
        Nothing


isValidRank : Int -> Bool
isValidRank rank =
    rank >= 1 && rank <= 150


-- 実例: [10, 20, 30] → [10, 30, 60]
calculateCumulativeWeights : List Int -> List Int
calculateCumulativeWeights weights =
    buildCumulativeWeights weights


calculateCumulativeWeightsHelper : List Int -> Int -> List Int -> List Int
calculateCumulativeWeightsHelper weights accumulator result =
    case weights of
        [] ->
            List.reverse result
        
        head :: tail ->
            let
                newAccumulator = accumulator + head
            in
            calculateCumulativeWeightsHelper tail newAccumulator (newAccumulator :: result)


buildCumulativeWeights : List Int -> List Int
buildCumulativeWeights weights =
    calculateCumulativeWeightsHelper weights 0 []


-- 実例: randomValue=25, cumulative=[10,30,60] → index=1
selectIndexByCumulative : Int -> List Int -> Int
selectIndexByCumulative randomValue cumulativeWeights =
    findIndexInCumulative randomValue cumulativeWeights 0


findIndexInCumulative : Int -> List Int -> Int -> Int
findIndexInCumulative randomValue weights currentIndex =
    case weights of
        [] ->
            0
        
        head :: tail ->
            if randomValue <= head then
                currentIndex
            else
                findIndexInCumulative randomValue tail (currentIndex + 1)


-- 使用率に基づく重み付きポケモン選択（上位30位が65%の確率で出現）
generateWeightedPokemonPair : Random.Generator (Pokemon, Pokemon)
generateWeightedPokemonPair =
    let
        rankings = UsageData.season34Rankings
        weights = List.map getRankingWeight rankings
        cumulativeWeights = buildCumulativeWeights weights
        totalWeight = getTotalWeight cumulativeWeights
        
        pokemonGenerator = 
            Random.map (selectPokemonByWeight cumulativeWeights rankings) (Random.int 1 totalWeight)
        
        pairGenerator = 
            Random.map2 createValidPokemonPair pokemonGenerator pokemonGenerator
    in
    Random.andThen ensureUniquePair pairGenerator


-- ランキングから重み取得
getRankingWeight : UsageData.UsageRanking -> Int
getRankingWeight ranking =
    calculateWeight ranking.rank


-- 累積重み配列から総重み取得
getTotalWeight : List Int -> Int
getTotalWeight cumulativeWeights =
    case List.reverse cumulativeWeights of
        [] ->
            0
        
        lastWeight :: _ ->
            lastWeight


-- 重み付き選択によるポケモン取得
selectPokemonByWeight : List Int -> List UsageData.UsageRanking -> Int -> Maybe Pokemon
selectPokemonByWeight cumulativeWeights rankings randomValue =
    let
        selectedIndex = selectIndexByCumulative randomValue cumulativeWeights
        selectedRanking = getListElementAt selectedIndex rankings
    in
    case selectedRanking of
        Just ranking ->
            Pokemon.Data.findPokemonByName ranking.name
        
        Nothing ->
            Nothing


-- リストから指定インデックスの要素取得
getListElementAt : Int -> List a -> Maybe a
getListElementAt index list =
    case List.drop index list of
        [] ->
            Nothing
        
        head :: _ ->
            Just head


-- 有効なポケモンペア作成
createValidPokemonPair : Maybe Pokemon -> Maybe Pokemon -> Maybe (Pokemon, Pokemon)
createValidPokemonPair maybePokemon1 maybePokemon2 =
    case (maybePokemon1, maybePokemon2) of
        (Just pokemon1, Just pokemon2) ->
            Just (pokemon1, pokemon2)
        
        _ ->
            Nothing


ensureUniquePair : Maybe (Pokemon, Pokemon) -> Random.Generator (Pokemon, Pokemon)
ensureUniquePair maybePair =
    case maybePair of
        Just (pokemon1, pokemon2) ->
            if pokemon1.id == pokemon2.id then
                generateWeightedPokemonPair  -- 重複の場合は再生成
            else
                Random.constant (pokemon1, pokemon2)
        
        Nothing ->
            generateWeightedPokemonPair  -- 無効な場合は再生成


-- 競技環境でよく使われる型を定義するための設定
-- "AS珠"のような名前は人間が識別しやすくするため
type alias BattleKataConfig =
    { name : String
    , nature : Nature
    , effortValues : EffortValues
    , heldItemId : Maybe Int
    }


-- 2段階選択: 1.使用率による重み付きポケモン選択 → 2.そのポケモンの型からランダム選択
-- これにより競技環境に近い出題頻度を実現
generateWeightedBattleKataPair : Random.Generator (BattleKata, BattleKata)
generateWeightedBattleKataPair =
    let
        battleKataGenerator = Random.andThen selectRandomBattleKataVariation generateWeightedPokemon
        
        pairGenerator = 
            Random.map2 createValidBattleKataPair battleKataGenerator battleKataGenerator
    in
    Random.andThen ensureUniqueBattleKataPair pairGenerator


generateWeightedPokemon : Random.Generator Pokemon
generateWeightedPokemon =
    let
        rankings = List.take 50 UsageData.season34Rankings
        weights = List.map getRankingWeight rankings
        cumulativeWeights = buildCumulativeWeights weights
        totalWeight = getTotalWeight cumulativeWeights

        pokemonGenerator =
            Random.map (selectPokemonByWeight cumulativeWeights rankings) (Random.int 1 totalWeight)
    in
    Random.map extractPokemonFromMaybe pokemonGenerator


extractPokemonFromMaybe : Maybe Pokemon -> Pokemon
extractPokemonFromMaybe maybePokemon =
    case maybePokemon of
        Just pokemon -> pokemon
        Nothing -> getDefaultPokemon (Array.fromList UsageData.selectTop50Pokemon)


getDefaultPokemon : Array.Array Pokemon -> Pokemon
getDefaultPokemon pokemonArray =
    case Array.get 0 pokemonArray of
        Just pokemon ->
            pokemon

        Nothing ->
            -- FixMe: データ不整合時のハードコードされたフォールバック
            { id = 1003
            , name = "ディンルー"
            , englishName = "ディンルー"
            , pokemonType = Pokemon.Types.GroundDark
            , stats = { hp = 155, attack = 110, defense = 125, specialAttack = 55, specialDefense = 80, speed = 45 }
            , preEvolutionId = Nothing
            , evolutionMethods = []
            }


selectRandomBattleKataVariation : Pokemon -> Random.Generator BattleKata
selectRandomBattleKataVariation pokemon =
    let
        variations = getPokemonVariations pokemon.name
        variationCount = List.length variations
    in
    if variationCount > 0 then
        Random.map (createBattleKataFromConfig pokemon.id) (selectRandomConfig variations variationCount)
    else
        Random.constant (createDefaultBattleKata pokemon.id)


selectRandomConfig : List BattleKataConfig -> Int -> Random.Generator BattleKataConfig
selectRandomConfig configs count =
    Random.map (getConfigAt configs) (Random.int 0 (count - 1))


getConfigAt : List BattleKataConfig -> Int -> BattleKataConfig
getConfigAt configs index =
    case List.drop index configs of
        head :: _ -> head
        [] -> getDefaultConfig


createBattleKataFromConfig : Int -> BattleKataConfig -> BattleKata
createBattleKataFromConfig pokemonId config =
    { pokemonId = pokemonId
    , nature = config.nature
    , moves = []
    , effortValues = config.effortValues
    , individualValues = defaultIVs
    , heldItemId = config.heldItemId
    }


-- ToDo: 実際の競技環境データで置き換える
getPokemonVariations : String -> List BattleKataConfig
getPokemonVariations pokemonName =
    case pokemonName of
        "ディンルー" ->
            [ { name = "HB252しんちょう", nature = Careful, effortValues = hpSpecialDefenseEVs, heldItemId = Nothing }
            , { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing }
            ]

        "パオジアン" ->
            [ { name = "CS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "ガブリアス" ->
            [ { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing }
            ]

        "バドレックス" ->
            [ { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CSおくびょうスカーフ", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "バドレックス(黒馬)" ->
            [ { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CSおくびょうスカーフ", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "ヘイラッシャ" ->
            [ { name = "HD252しんちょう", nature = Careful, effortValues = hpSpecialDefenseEVs, heldItemId = Nothing } ]

        "ハバタクカミ" ->
            [ { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing } ]

        "コライドン" ->
            [ { name = "AS252ようきスカーフ", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "AS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "アルセウス" ->
            [ { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252ひかえめ", nature = Modest, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "ミライドン" ->
            [ { name = "AS252おくびょうスカーフ", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252ひかえめ", nature = Modest, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "ウーラオス" ->
            [ { name = "AS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "ランドロス" ->
            [ { name = "AS252いじっぱりスカーフ", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing }
            ]

        "ランドロス(霊獣)" ->
            [ { name = "AS252いじっぱりスカーフ", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing }
            ]

        "キラフロル" ->
            [ { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "HB252ずぶとい", nature = Bold, effortValues = hpDefenseEVs, heldItemId = Nothing }
            ]

        "ホウオウ" ->
            [ { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "グライオン" ->
            [ { name = "HS252ようき", nature = Jolly, effortValues = hpSpeedEVs, heldItemId = Nothing }
            , { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing }
            ]

        "ザシアン" ->
            [ { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "AS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "カイリュー" ->
            [ { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing } ]

        "ミミッキュ" ->
            [ { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing }
            , { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "オーガポン" ->
            [ { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing }
            , { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "カイオーガ" ->
            [ { name = "CS252ひかえめ", nature = Modest, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252おくびょうスカーフ", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "ドオー" ->
            [ { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "キョジオーン" ->
            [ { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "ブリジュラス" ->
            [ { name = "HB252ずぶとい", nature = Bold, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "ガチグマ" ->
            [ { name = "HC252ひかえめ", nature = Modest, effortValues = hpSpecialAttackEVs, heldItemId = Nothing }
            , { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing }
            ]

        "オオニューラ" ->
            [ { name = "AS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "オーロンゲ" ->
            [ { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "テツノワダチ" ->
            [ { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing } ]

        "メタモン" ->
            [ { name = "変幻自在", nature = Serious, effortValues = emptyEVs, heldItemId = Nothing } ]

        "ルナアーラ" ->
            [ { name = "HC252ひかえめ", nature = Modest, effortValues = hpSpecialAttackEVs, heldItemId = Nothing }
            , { name = "CS252ひかえめ", nature = Modest, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252おくびょうスカーフ", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "ママンボウ" ->
            [ { name = "HB252のんき", nature = Relaxed, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "モモワロウ" ->
            [ { name = "HB252わんぱく", nature = Impish, effortValues = hpDefenseEVs, heldItemId = Nothing }
            , { name = "HS252おくびょう", nature = Timid, effortValues = hpSpeedEVs, heldItemId = Nothing }
            ]

        "ムゲンダイナ" ->
            [ { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252ひかえめ", nature = Modest, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "バドレックス(白馬)" ->
            [ { name = "HA252ゆうかん", nature = Brave, effortValues = hpAttackEVs, heldItemId = Nothing } ]

        "イーユイ" ->
            [ { name = "CS252ひかえめ", nature = Modest, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            , { name = "CS252おくびょうスカーフ", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "ハッサム" ->
            [ { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing } ]

        "ラウドボーン" ->
            [ { name = "HB252ずぶとい", nature = Bold, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "アシレーヌ" ->
            [ { name = "HC252ひかえめ", nature = Modest, effortValues = hpSpecialAttackEVs, heldItemId = Nothing } ]

        "デオキシス(アタック)" ->
            [ { name = "AS252むじゃき", nature = Naive, effortValues = attackSpeedEVs, heldItemId = Nothing } ]

        "ベトベトン(アローラ)" ->
            [ { name = "HD252しんちょう", nature = Careful, effortValues = hpSpecialDefenseEVs, heldItemId = Nothing } ]

        "チオンジェン" ->
            [ { name = "HD252しんちょう", nature = Careful, effortValues = hpSpecialDefenseEVs, heldItemId = Nothing } ]

        "アルセウス(地面)" ->
            [ { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing } ]

        "ドーブル" ->
            [ { name = "HS252ようき", nature = Jolly, effortValues = hpSpeedEVs, heldItemId = Nothing } ]

        "ガオガエン" ->
            [ { name = "HD252しんちょう", nature = Careful, effortValues = hpSpecialDefenseEVs, heldItemId = Nothing } ]

        "ゴリランダー" ->
            [ { name = "HA252いじっぱり", nature = Adamant, effortValues = hpAttackEVs, heldItemId = Nothing } ]

        "ルギア" ->
            [ { name = "HB252ずぶとい", nature = Bold, effortValues = hpDefenseEVs, heldItemId = Nothing }
            , { name = "CS252おくびょう", nature = Timid, effortValues = specialAttackSpeedEVs, heldItemId = Nothing }
            ]

        "マタドガス(ガラル)" ->
            [ { name = "HB252ずぶとい", nature = Bold, effortValues = hpDefenseEVs, heldItemId = Nothing } ]

        "キノガッサ" ->
            [ { name = "AS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "テツノブジン" ->
            [ { name = "AS252いじっぱり", nature = Adamant, effortValues = attackSpeedEVs, heldItemId = Nothing }
            , { name = "AS252ようき", nature = Jolly, effortValues = attackSpeedEVs, heldItemId = Nothing }
            ]

        "テラパゴス" ->
            [ { name = "HC252ひかえめ", nature = Modest, effortValues = hpSpecialAttackEVs, heldItemId = Nothing } ]

        "ネクロズマ" ->
            [ { name = "HC252ひかえめ", nature = Modest, effortValues = hpSpecialAttackEVs, heldItemId = Nothing } ]

        _ ->
            [ getDefaultConfigForPokemon pokemonName ]


-- AS252振り（物理アタッカー用）
attackSpeedEVs : EffortValues
attackSpeedEVs =
    { hp = 0, attack = 252, defense = 0, specialAttack = 0, specialDefense = 4, speed = 252 }


hpDefenseEVs : EffortValues
hpDefenseEVs =
    { hp = 252, attack = 0, defense = 252, specialAttack = 0, specialDefense = 4, speed = 0 }


hpSpecialDefenseEVs : EffortValues
hpSpecialDefenseEVs =
    { hp = 252, attack = 0, defense = 4, specialAttack = 0, specialDefense = 252, speed = 0 }


hpAttackEVs : EffortValues
hpAttackEVs =
    { hp = 252, attack = 252, defense = 0, specialAttack = 0, specialDefense = 4, speed = 0 }


hpSpecialAttackEVs : EffortValues
hpSpecialAttackEVs =
    { hp = 252, attack = 0, defense = 0, specialAttack = 252, specialDefense = 4, speed = 0 }


hpSpeedEVs : EffortValues
hpSpeedEVs =
    { hp = 252, attack = 0, defense = 4, specialAttack = 0, specialDefense = 0, speed = 252 }


specialAttackSpeedEVs : EffortValues
specialAttackSpeedEVs =
    { hp = 4, attack = 0, defense = 0, specialAttack = 252, specialDefense = 0, speed = 252 }


getDefaultConfig : BattleKataConfig
getDefaultConfig =
    { name = "標準型", nature = Hardy, effortValues = emptyEVs, heldItemId = Nothing }


getDefaultConfigForPokemon : String -> BattleKataConfig
getDefaultConfigForPokemon pokemonName =
    { name = "標準型", nature = Hardy, effortValues = attackSpeedEVs, heldItemId = Nothing }


emptyEVs : EffortValues
emptyEVs =
    { hp = 0, attack = 0, defense = 0, specialAttack = 0, specialDefense = 0, speed = 0 }


createDefaultBattleKata : Int -> BattleKata
createDefaultBattleKata pokemonId =
    initBattleKata pokemonId


createValidBattleKataPair : BattleKata -> BattleKata -> Maybe (BattleKata, BattleKata)
createValidBattleKataPair kata1 kata2 =
    Just (kata1, kata2)


ensureUniqueBattleKataPair : Maybe (BattleKata, BattleKata) -> Random.Generator (BattleKata, BattleKata)
ensureUniqueBattleKataPair maybePair =
    case maybePair of
        Just (kata1, kata2) ->
            if kata1.pokemonId == kata2.pokemonId then
                generateWeightedBattleKataPair
            else
                Random.constant (kata1, kata2)

        Nothing ->
            generateWeightedBattleKataPair
