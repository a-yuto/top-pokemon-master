module BattleTypesTest exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)
import Pokemon.BattleTypes exposing (..)
import Pokemon.Types exposing (Pokemon, Stats, PokemonType(..))


suite : Test
suite =
    describe "BattleTypes実数値計算テスト"
        [ describe "HP計算テスト"
            [ test "HP種族値100、個体値31、努力値252でHP207" testHPCalculation
            , test "HP種族値50、個体値31、努力値0でHP125" testHPMinimumCalculation
            , test "HP種族値255、個体値31、努力値252でHP362" testHPMaximumCalculation
            ]
        , describe "通常ステータス計算テスト"
            [ test "攻撃種族値130、いじっぱり、個体値31、努力値252で200" testAttackAdamantCalculation
            , test "特攻種族値130、ひかえめ、個体値31、努力値252で200" testSpecialAttackModestCalculation
            , test "素早さ種族値100、ようき、個体値31、努力値252で167" testSpeedJollyCalculation
            , test "防御種族値100、性格補正なし、個体値31、努力値0で120" testDefenseNeutralCalculation
            ]
        , describe "性格補正テスト"
            [ test "いじっぱり性格で攻撃1.1倍、特攻0.9倍" testAdamantNature
            , test "ひかえめ性格で特攻1.1倍、攻撃0.9倍" testModestNature
            , test "ようき性格で素早さ1.1倍、特攻0.9倍" testJollyNature
            , test "がんばりや性格で全て1.0倍" testHardyNature
            ]
        , describe "BattleKata統合テスト"
            [ test "ガブリアスの実数値計算" testGarchompRealStats
            , test "パオジアンの実数値計算" testChienPaoRealStats
            ]
        ]


-- テスト用のサンプルポケモン作成
createTestPokemon : String -> Stats -> Pokemon
createTestPokemon name stats =
    { id = 1
    , name = name
    , englishName = name
    , pokemonType = NormalType
    , stats = stats
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


-- HP計算テスト
testHPCalculation : () -> Expectation
testHPCalculation _ =
    let
        base = 100
        iv = 31
        ev = 252
        level = 50
        result = calculateHP base iv ev level
        expected = 207  -- ((100*2+31+252/4)*50)/100+50+10 = 207
    in
    Expect.equal expected result


testHPMinimumCalculation : () -> Expectation
testHPMinimumCalculation _ =
    let
        base = 50
        iv = 31
        ev = 0
        level = 50
        result = calculateHP base iv ev level
        expected = 125  -- ((50*2+31+0)*50)/100+50+10 = 125
    in
    Expect.equal expected result


testHPMaximumCalculation : () -> Expectation
testHPMaximumCalculation _ =
    let
        base = 255  -- 最大種族値（ハピナス）
        iv = 31
        ev = 252
        level = 50
        result = calculateHP base iv ev level
        expected = 362  -- ((255*2+31+252/4)*50)/100+50+10 = 362
    in
    Expect.equal expected result


-- 通常ステータス計算テスト
testAttackAdamantCalculation : () -> Expectation
testAttackAdamantCalculation _ =
    let
        base = 130  -- ガブリアスの攻撃種族値
        iv = 31
        ev = 252
        level = 50
        nature = Adamant
        result = calculateStat base iv ev level nature Attack
        expected = 200  -- ((130*2+31+252/4)*50)/100+5 = 182, 182*1.1 = 200
    in
    Expect.equal expected result


testSpecialAttackModestCalculation : () -> Expectation
testSpecialAttackModestCalculation _ =
    let
        base = 130  -- サザンドラの特攻種族値
        iv = 31
        ev = 252
        level = 50
        nature = Modest
        result = calculateStat base iv ev level nature SpecialAttack
        expected = 200  -- ((130*2+31+252/4)*50)/100+5 = 182, 182*1.1 = 200
    in
    Expect.equal expected result


testSpeedJollyCalculation : () -> Expectation
testSpeedJollyCalculation _ =
    let
        base = 100
        iv = 31
        ev = 252
        level = 50
        nature = Jolly
        result = calculateStat base iv ev level nature Speed
        expected = 167  -- ((100*2+31+252/4)*50)/100+5 = 152, 152*1.1 = 167
    in
    Expect.equal expected result


testDefenseNeutralCalculation : () -> Expectation
testDefenseNeutralCalculation _ =
    let
        base = 100
        iv = 31
        ev = 0
        level = 50
        nature = Hardy  -- 補正なし
        result = calculateStat base iv ev level nature Defense
        expected = 120  -- ((100*2+31+0)*50)/100+5 = 120
    in
    Expect.equal expected result


-- 性格補正テスト
testAdamantNature : () -> Expectation
testAdamantNature _ =
    let
        attackBonus = getNatureBonus Adamant Attack
        specialAttackBonus = getNatureBonus Adamant SpecialAttack
        speedBonus = getNatureBonus Adamant Speed
    in
    let
        attackCorrect = abs (attackBonus - 1.1) < 0.001
        specialAttackCorrect = abs (specialAttackBonus - 0.9) < 0.001
        speedCorrect = abs (speedBonus - 1.0) < 0.001
        allCorrect = attackCorrect && specialAttackCorrect && speedCorrect
    in
    Expect.equal True allCorrect


testModestNature : () -> Expectation
testModestNature _ =
    let
        attackBonus = getNatureBonus Modest Attack
        specialAttackBonus = getNatureBonus Modest SpecialAttack
        speedBonus = getNatureBonus Modest Speed
        attackCorrect = abs (attackBonus - 0.9) < 0.001
        specialAttackCorrect = abs (specialAttackBonus - 1.1) < 0.001
        speedCorrect = abs (speedBonus - 1.0) < 0.001
        allCorrect = attackCorrect && specialAttackCorrect && speedCorrect
    in
    Expect.equal True allCorrect


testJollyNature : () -> Expectation
testJollyNature _ =
    let
        speedBonus = getNatureBonus Jolly Speed
        specialAttackBonus = getNatureBonus Jolly SpecialAttack
        attackBonus = getNatureBonus Jolly Attack
        speedCorrect = abs (speedBonus - 1.1) < 0.001
        specialAttackCorrect = abs (specialAttackBonus - 0.9) < 0.001
        attackCorrect = abs (attackBonus - 1.0) < 0.001
        allCorrect = speedCorrect && specialAttackCorrect && attackCorrect
    in
    Expect.equal True allCorrect


testHardyNature : () -> Expectation
testHardyNature _ =
    let
        attackBonus = getNatureBonus Hardy Attack
        defenseBonus = getNatureBonus Hardy Defense
        speedBonus = getNatureBonus Hardy Speed
        specialAttackBonus = getNatureBonus Hardy SpecialAttack
        specialDefenseBonus = getNatureBonus Hardy SpecialDefense
        attackCorrect = abs (attackBonus - 1.0) < 0.001
        defenseCorrect = abs (defenseBonus - 1.0) < 0.001
        speedCorrect = abs (speedBonus - 1.0) < 0.001
        specialAttackCorrect = abs (specialAttackBonus - 1.0) < 0.001
        specialDefenseCorrect = abs (specialDefenseBonus - 1.0) < 0.001
        allCorrect = attackCorrect && defenseCorrect && speedCorrect && specialAttackCorrect && specialDefenseCorrect
    in
    Expect.equal True allCorrect


-- BattleKata統合テスト
testGarchompRealStats : () -> Expectation
testGarchompRealStats _ =
    let
        -- ガブリアス: HP108 攻撃130 防御95 特攻80 特防85 素早さ102
        garchomp = createTestPokemon "ガブリアス"
            { hp = 108
            , attack = 130
            , defense = 95
            , specialAttack = 80
            , specialDefense = 85
            , speed = 102
            }
        
        -- いじっぱり AS252振り
        kata =
            { pokemonId = 445
            , nature = Adamant
            , moves = []
            , effortValues = { hp = 0, attack = 252, defense = 0, specialAttack = 0, specialDefense = 4, speed = 252 }
            , individualValues = defaultIVs
            , heldItemId = Nothing
            }
        
        realStats = calculateRealStats kata garchomp
        
        -- 期待値（ポケモン対戦でよく見る数値）
        expectedStats =
            { hp = 183      -- HP: 108種族値
            , attack = 200  -- 攻撃: 130種族値、いじっぱり、252振り
            , defense = 115 -- 防御: 95種族値、振りなし
            , specialAttack = 90  -- 特攻: 80種族値、いじっぱりで下降、振りなし
            , specialDefense = 106 -- 特防: 85種族値、4振り
            , speed = 154   -- 素早さ: 102種族値、252振り
            }
    in
    Expect.equal expectedStats realStats


testChienPaoRealStats : () -> Expectation
testChienPaoRealStats _ =
    let
        -- パオジアン: HP80 攻撃120 防御80 特攻90 特防65 素早さ135
        chienPao = createTestPokemon "パオジアン"
            { hp = 80
            , attack = 120
            , defense = 80
            , specialAttack = 90
            , specialDefense = 65
            , speed = 135
            }
        
        -- ようき AS252振り
        kata =
            { pokemonId = 1002
            , nature = Jolly
            , moves = []
            , effortValues = { hp = 0, attack = 252, defense = 0, specialAttack = 0, specialDefense = 4, speed = 252 }
            , individualValues = defaultIVs
            , heldItemId = Nothing
            }
        
        realStats = calculateRealStats kata chienPao
        
        -- 期待値
        expectedStats =
            { hp = 155      -- HP: 80種族値
            , attack = 172  -- 攻撃: 120種族値、252振り
            , defense = 100 -- 防御: 80種族値、振りなし
            , specialAttack = 99  -- 特攻: 90種族値、ようきで下降、振りなし
            , specialDefense = 86  -- 特防: 65種族値、4振り
            , speed = 206   -- 素早さ: 135種族値、ようき、252振り
            }
    in
    Expect.equal expectedStats realStats


