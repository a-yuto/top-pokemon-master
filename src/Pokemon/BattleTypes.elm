module Pokemon.BattleTypes exposing 
    ( BattleKata
    , IndividualValues
    , EffortValues
    , BattleStats
    , Nature(..)
    , StatType(..)
    , calculateRealStats
    , calculateHP
    , calculateStat
    , getNatureBonus
    , defaultIVs
    , emptyEVs
    , initBattleKata
    )

import Pokemon.Types exposing (Pokemon)


type alias BattleKata =
    { pokemonId : Int
    , nature : Nature
    , moves : List Int          -- 最大4つ
    , effortValues : EffortValues
    , individualValues : IndividualValues
    , heldItemId : Maybe Int
    }


-- 個体値は0-31の範囲
type alias IndividualValues =
    { hp : Int
    , attack : Int
    , defense : Int
    , specialAttack : Int
    , specialDefense : Int
    , speed : Int
    }


-- 努力値は各ステータス0-252、合計510まで
type alias EffortValues =
    { hp : Int
    , attack : Int
    , defense : Int
    , specialAttack : Int
    , specialDefense : Int
    , speed : Int
    }


type alias BattleStats =
    { hp : Int
    , attack : Int
    , defense : Int
    , specialAttack : Int
    , specialDefense : Int
    , speed : Int
    }


type Nature
    = Hardy      -- がんばりや（補正なし）
    | Lonely     -- さみしがり（攻撃↑防御↓）
    | Brave      -- ゆうかん（攻撃↑素早さ↓）
    | Adamant    -- いじっぱり（攻撃↑特攻↓）
    | Naughty    -- やんちゃ（攻撃↑特防↓）
    | Bold       -- ずぶとい（防御↑攻撃↓）
    | Docile     -- すなお（補正なし）
    | Relaxed    -- のんき（防御↑素早さ↓）
    | Impish     -- わんぱく（防御↑特攻↓）
    | Lax        -- のうてんき（防御↑特防↓）
    | Timid      -- おくびょう（素早さ↑攻撃↓）
    | Hasty      -- せっかち（素早さ↑防御↓）
    | Serious    -- まじめ（補正なし）
    | Jolly      -- ようき（素早さ↑特攻↓）
    | Naive      -- むじゃき（素早さ↑特防↓）
    | Modest     -- ひかえめ（特攻↑攻撃↓）
    | Mild       -- おっとり（特攻↑防御↓）
    | Quiet      -- れいせい（特攻↑素早さ↓）
    | Bashful    -- てれや（補正なし）
    | Rash       -- うっかりや（特攻↑特防↓）
    | Calm       -- おだやか（特防↑攻撃↓）
    | Gentle     -- おとなしい（特防↑防御↓）
    | Sassy      -- なまいき（特防↑素早さ↓）
    | Careful    -- しんちょう（特防↑特攻↓）
    | Quirky     -- きまぐれ（補正なし）


type StatType
    = Attack
    | Defense
    | SpecialAttack
    | SpecialDefense
    | Speed


-- 実例: 種族値45, 個体値31, 努力値0, 性格補正なし, Lv50 → 65
calculateRealStats : BattleKata -> Pokemon -> BattleStats
calculateRealStats kata pokemon =
    let
        level = 50  -- 競技ルールに準拠
        baseStats = pokemon.stats
    in
    { hp = calculateHP baseStats.hp kata.individualValues.hp kata.effortValues.hp level
    , attack = calculateStat baseStats.attack kata.individualValues.attack kata.effortValues.attack level kata.nature Attack
    , defense = calculateStat baseStats.defense kata.individualValues.defense kata.effortValues.defense level kata.nature Defense
    , specialAttack = calculateStat baseStats.specialAttack kata.individualValues.specialAttack kata.effortValues.specialAttack level kata.nature SpecialAttack
    , specialDefense = calculateStat baseStats.specialDefense kata.individualValues.specialDefense kata.effortValues.specialDefense level kata.nature SpecialDefense
    , speed = calculateStat baseStats.speed kata.individualValues.speed kata.effortValues.speed level kata.nature Speed
    }


calculateHP : Int -> Int -> Int -> Int -> Int
calculateHP base iv ev level =
    ((base * 2 + iv + (ev // 4)) * level) // 100 + level + 10


calculateStat : Int -> Int -> Int -> Int -> Nature -> StatType -> Int
calculateStat base iv ev level nature statType =
    let
        baseValue = ((base * 2 + iv + (ev // 4)) * level) // 100 + 5
        natureBonus = getNatureBonus nature statType
    in
    round (toFloat baseValue * natureBonus)


-- 性格補正は1.1/0.9（10%増減）がゲームバランス上の標準
getNatureBonus : Nature -> StatType -> Float
getNatureBonus nature statType =
    case (nature, statType) of
        -- Lonely: 攻撃↑防御↓
        (Lonely, Attack) -> 1.1
        (Lonely, Defense) -> 0.9
        
        -- Brave: 攻撃↑素早さ↓
        (Brave, Attack) -> 1.1
        (Brave, Speed) -> 0.9
        
        -- Adamant: 攻撃↑特攻↓
        (Adamant, Attack) -> 1.1
        (Adamant, SpecialAttack) -> 0.9
        
        -- Naughty: 攻撃↑特防↓
        (Naughty, Attack) -> 1.1
        (Naughty, SpecialDefense) -> 0.9
        
        -- Bold: 防御↑攻撃↓
        (Bold, Defense) -> 1.1
        (Bold, Attack) -> 0.9
        
        -- Relaxed: 防御↑素早さ↓
        (Relaxed, Defense) -> 1.1
        (Relaxed, Speed) -> 0.9
        
        -- Impish: 防御↑特攻↓
        (Impish, Defense) -> 1.1
        (Impish, SpecialAttack) -> 0.9
        
        -- Lax: 防御↑特防↓
        (Lax, Defense) -> 1.1
        (Lax, SpecialDefense) -> 0.9
        
        -- Timid: 素早さ↑攻撃↓
        (Timid, Speed) -> 1.1
        (Timid, Attack) -> 0.9
        
        -- Hasty: 素早さ↑防御↓
        (Hasty, Speed) -> 1.1
        (Hasty, Defense) -> 0.9
        
        -- Jolly: 素早さ↑特攻↓
        (Jolly, Speed) -> 1.1
        (Jolly, SpecialAttack) -> 0.9
        
        -- Naive: 素早さ↑特防↓
        (Naive, Speed) -> 1.1
        (Naive, SpecialDefense) -> 0.9
        
        -- Modest: 特攻↑攻撃↓
        (Modest, SpecialAttack) -> 1.1
        (Modest, Attack) -> 0.9
        
        -- Mild: 特攻↑防御↓
        (Mild, SpecialAttack) -> 1.1
        (Mild, Defense) -> 0.9
        
        -- Quiet: 特攻↑素早さ↓
        (Quiet, SpecialAttack) -> 1.1
        (Quiet, Speed) -> 0.9
        
        -- Rash: 特攻↑特防↓
        (Rash, SpecialAttack) -> 1.1
        (Rash, SpecialDefense) -> 0.9
        
        -- Calm: 特防↑攻撃↓
        (Calm, SpecialDefense) -> 1.1
        (Calm, Attack) -> 0.9
        
        -- Gentle: 特防↑防御↓
        (Gentle, SpecialDefense) -> 1.1
        (Gentle, Defense) -> 0.9
        
        -- Sassy: 特防↑素早さ↓
        (Sassy, SpecialDefense) -> 1.1
        (Sassy, Speed) -> 0.9
        
        -- Careful: 特防↑特攻↓
        (Careful, SpecialDefense) -> 1.1
        (Careful, SpecialAttack) -> 0.9
        
        -- 補正なしの性格とその他のケース
        _ -> 1.0


defaultIVs : IndividualValues
defaultIVs =
    { hp = 31
    , attack = 31
    , defense = 31
    , specialAttack = 31
    , specialDefense = 31
    , speed = 31
    }


emptyEVs : EffortValues
emptyEVs =
    { hp = 0
    , attack = 0
    , defense = 0
    , specialAttack = 0
    , specialDefense = 0
    , speed = 0
    }


initBattleKata : Int -> BattleKata
initBattleKata pokemonId =
    { pokemonId = pokemonId
    , nature = Hardy
    , moves = []
    , effortValues = emptyEVs
    , individualValues = defaultIVs
    , heldItemId = Nothing
    }