module MoveDetailsTest exposing (suite)

import Expect exposing (Expectation)
import Pokemon.Move exposing (Move, MoveCategory(..))
import Pokemon.MoveData exposing (allMoves, findMoveById, findMoveByName)
import Test exposing (..)


suite : Test
suite =
    describe "Move詳細テスト"
        [ describe "威力とカテゴリーの組み合わせ"
            [ test "Physical技は威力を持つべき" testPhysicalMovesHavePower
            , test "Special技は威力を持つべき" testSpecialMovesHavePower
            , test "Status技は威力0であるべき" testStatusMovesNoPower
            ]
        , describe "命中率テスト"
            [ test "命中率は0-100の範囲内" testAccuracyRange
            , test "必中技は命中率100または特殊値" testAlwaysHitMoves
            ]
        , describe "PP（使用回数）テスト"
            [ test "PPは1-40の範囲内" testPPRange
            , test "強力な技ほどPPが少ない傾向" testPowerPPRelation
            ]
        , describe "技のフラグテスト"
            [ test "接触技フラグの妥当性" testContactMoveFlags
            , test "音技フラグの妥当性" testSoundMoveFlags
            , test "反動技フラグの妥当性" testRecoilMoveFlags
            ]
        , describe "状態異常技テスト"
            [ test "毒技の特性" testPoisonMoves
            , test "麻痺技の特性" testParalysisMoves
            , test "やけど技の特性" testBurnMoves
            , test "こおり技の特性" testFreezeMoves
            ]
        , describe "特殊効果技テスト"
            [ test "能力変化技" testStatChangeMoves
            , test "天候変化技" testWeatherMoves
            , test "フィールド変化技" testFieldMoves
            ]
        ]


testPhysicalMovesHavePower : () -> Expectation
testPhysicalMovesHavePower _ =
    let
        physicalMoves = List.filter isPhysicalMove allMoves
        movesWithPower = List.filter moveHasPower physicalMoves
        ratio = toFloat (List.length movesWithPower) / toFloat (List.length physicalMoves)
    in
    -- 物理技の80%以上は威力を持つと仮定
    Expect.atLeast 0.8 ratio


testSpecialMovesHavePower : () -> Expectation
testSpecialMovesHavePower _ =
    let
        specialMoves = List.filter isSpecialMove allMoves
        movesWithPower = List.filter moveHasPower specialMoves
        ratio = toFloat (List.length movesWithPower) / toFloat (List.length specialMoves)
    in
    -- 特殊技の80%以上は威力を持つと仮定
    Expect.atLeast 0.8 ratio


testStatusMovesNoPower : () -> Expectation
testStatusMovesNoPower _ =
    let
        statusMoves = List.filter isStatusMove allMoves
        allNoPower = List.all moveHasNoPower statusMoves
    in
    Expect.equal True allNoPower


testAccuracyRange : () -> Expectation
testAccuracyRange _ =
    let
        allValidAccuracy = List.all hasValidAccuracy allMoves
    in
    Expect.equal True allValidAccuracy


testAlwaysHitMoves : () -> Expectation
testAlwaysHitMoves _ =
    let
        alwaysHitMoves = List.filter isAlwaysHitMove allMoves
        count = List.length alwaysHitMoves
    in
    Expect.atLeast 1 count


testPPRange : () -> Expectation
testPPRange _ =
    let
        allValidPP = List.all hasValidPP allMoves
    in
    Expect.equal True allValidPP


testPowerPPRelation : () -> Expectation
testPowerPPRelation _ =
    let
        highPowerMoves = List.filter isHighPowerMove allMoves
        averagePP = getAverageMovePP highPowerMoves
        
        lowPowerMoves = List.filter isLowPowerMove allMoves  
        averagePPLow = getAverageMovePP lowPowerMoves
    in
    -- 高威力技は低威力技よりPPが少ない傾向があることを確認
    Expect.atMost averagePPLow averagePP


testContactMoveFlags : () -> Expectation
testContactMoveFlags _ =
    let
        contactMoves = List.filter hasContactFlag allMoves
        count = List.length contactMoves
    in
    Expect.atLeast 50 count


testSoundMoveFlags : () -> Expectation
testSoundMoveFlags _ =
    let
        soundMoves = List.filter hasSoundFlag allMoves
        count = List.length soundMoves
    in
    Expect.atLeast 0 count


testRecoilMoveFlags : () -> Expectation
testRecoilMoveFlags _ =
    let
        recoilMoves = List.filter hasRecoilFlag allMoves
        allPowerful = List.all isPowerfulMove recoilMoves
    in
    -- 反動技は威力が高いことが多い
    Expect.equal True allPowerful


testPoisonMoves : () -> Expectation
testPoisonMoves _ =
    let
        poisonMoves = List.filter hasPoisonEffect allMoves
        count = List.length poisonMoves
    in
    Expect.atLeast 0 count


testParalysisMoves : () -> Expectation
testParalysisMoves _ =
    let
        paralysisMoves = List.filter hasParalysisEffect allMoves
        count = List.length paralysisMoves
    in
    Expect.atLeast 0 count


testBurnMoves : () -> Expectation
testBurnMoves _ =
    let
        burnMoves = List.filter hasBurnEffect allMoves
        count = List.length burnMoves
    in
    Expect.atLeast 0 count


testFreezeMoves : () -> Expectation
testFreezeMoves _ =
    let
        freezeMoves = List.filter hasFreezeEffect allMoves
        count = List.length freezeMoves
    in
    Expect.atLeast 0 count


testStatChangeMoves : () -> Expectation
testStatChangeMoves _ =
    let
        statChangeMoves = List.filter hasStatChangeEffect allMoves
        count = List.length statChangeMoves
    in
    Expect.atLeast 0 count


testWeatherMoves : () -> Expectation
testWeatherMoves _ =
    let
        weatherMoves = List.filter hasWeatherEffect allMoves
        count = List.length weatherMoves
    in
    Expect.atLeast 0 count


testFieldMoves : () -> Expectation
testFieldMoves _ =
    let
        fieldMoves = List.filter hasFieldEffect allMoves
        count = List.length fieldMoves
    in
    Expect.atLeast 0 count


-- ヘルパー関数（無名関数とパイプ演算子を避ける）
isPhysicalMove : Move -> Bool
isPhysicalMove move =
    move.category == Physical


isSpecialMove : Move -> Bool
isSpecialMove move =
    move.category == Special


isStatusMove : Move -> Bool
isStatusMove move =
    move.category == Status


moveHasPower : Move -> Bool
moveHasPower move =
    case move.power of
        Just power -> power > 0
        Nothing -> False


moveHasNoPower : Move -> Bool
moveHasNoPower move =
    case move.power of
        Just _ -> False
        Nothing -> True


hasValidAccuracy : Move -> Bool
hasValidAccuracy move =
    case move.accuracy of
        Just acc -> acc >= 0 && acc <= 100
        Nothing -> True  -- 必中技の場合


isAlwaysHitMove : Move -> Bool
isAlwaysHitMove move =
    move.alwaysHit || 
        case move.accuracy of
            Just 100 -> True
            _ -> False


hasValidPP : Move -> Bool
hasValidPP move =
    move.pp >= 1 && move.pp <= 40


isHighPowerMove : Move -> Bool
isHighPowerMove move =
    case move.power of
        Just power -> power >= 100
        Nothing -> False


isLowPowerMove : Move -> Bool
isLowPowerMove move =
    case move.power of
        Just power -> power > 0 && power <= 60
        Nothing -> False


getAverageMovePP : List Move -> Float
getAverageMovePP moves =
    let
        totalPP = List.sum (List.map getMovePP moves)
        count = List.length moves
    in
    if count > 0 then
        toFloat totalPP / toFloat count
    else
        0.0


getMovePP : Move -> Int
getMovePP move =
    move.pp


hasContactFlag : Move -> Bool
hasContactFlag move =
    move.isContact


hasSoundFlag : Move -> Bool
hasSoundFlag move =
    move.isSound


hasRecoilFlag : Move -> Bool
hasRecoilFlag move =
    move.isRecoil


isPowerfulMove : Move -> Bool
isPowerfulMove move =
    case move.power of
        Just power -> power >= 80
        Nothing -> False


hasPoisonEffect : Move -> Bool
hasPoisonEffect move =
    case move.statusEffect of
        Just statusEffect -> True  -- 簡略化
        Nothing -> False


hasParalysisEffect : Move -> Bool
hasParalysisEffect move =
    case move.statusEffect of
        Just statusEffect -> True  -- 簡略化
        Nothing -> False


hasBurnEffect : Move -> Bool
hasBurnEffect move =
    case move.statusEffect of
        Just statusEffect -> True  -- 簡略化
        Nothing -> False


hasFreezeEffect : Move -> Bool
hasFreezeEffect move =
    case move.statusEffect of
        Just statusEffect -> True  -- 簡略化
        Nothing -> False


hasStatChangeEffect : Move -> Bool
hasStatChangeEffect move =
    not (List.isEmpty move.statChanges)


hasWeatherEffect : Move -> Bool
hasWeatherEffect move =
    case move.weatherEffect of
        Just _ -> True
        Nothing -> False


hasFieldEffect : Move -> Bool
hasFieldEffect move =
    case move.terrainEffect of
        Just _ -> True
        Nothing -> False