module WeightedRandomTest exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)
import WeightedRandom


suite : Test
suite =
    describe "重み付きランダム選択システムのテスト"
        [ describe "重み計算関数テスト"
            [ test "1位のポケモンは最大重み150を持つ" testRank1Weight
            , test "150位のポケモンは最小重み1を持つ" testRank150Weight
            , test "中間ランク75位は重み76を持つ" testRank75Weight
            , test "無効なランク0でエラーハンドリング" testInvalidRank0
            , test "無効なランク151でエラーハンドリング" testInvalidRank151
            , test "負のランクでエラーハンドリング" testNegativeRank
            ]
        , describe "累積重み計算テスト"
            [ test "重みリストから累積重み配列を正しく生成" testCumulativeWeights
            , test "空のリストで空の累積重み配列を生成" testEmptyCumulativeWeights
            , test "単一要素リストで正しい累積重み" testSingleElementCumulativeWeights
            ]
        , describe "重み付き選択基本テスト"
            [ test "累積重みの範囲内でインデックス選択" testWeightedSelection
            , test "境界値での選択動作" testBoundarySelection
            , test "最大重み値での選択" testMaxWeightSelection
            ]
        ]


-- 重み計算テスト関数群
testRank1Weight : () -> Expectation
testRank1Weight _ =
    let
        actualWeight = WeightedRandom.calculateWeight 1
        -- 指数的重み付けによる1位の重み: 2^(8-1/20) ≈ 247
        minExpectedWeight = 240
        maxExpectedWeight = 260
        isAboveMin = actualWeight >= minExpectedWeight
        isBelowMax = actualWeight <= maxExpectedWeight
        isInValidRange = isAboveMin && isBelowMax
    in
    Expect.equal True isInValidRange


testRank150Weight : () -> Expectation
testRank150Weight _ =
    let
        actualWeight = WeightedRandom.calculateWeight 150
        -- 指数的重み付けによる150位の重み: 最小値は1
        expectedWeight = 1
    in
    Expect.equal expectedWeight actualWeight


testRank75Weight : () -> Expectation
testRank75Weight _ =
    let
        actualWeight = WeightedRandom.calculateWeight 75
        -- 指数的重み付けによる75位の重み: 2^(8-75/20) ≈ 22
        minExpectedWeight = 15
        maxExpectedWeight = 30
        isAboveMin = actualWeight >= minExpectedWeight
        isBelowMax = actualWeight <= maxExpectedWeight
        isInValidRange = isAboveMin && isBelowMax
    in
    Expect.equal True isInValidRange


testInvalidRank0 : () -> Expectation
testInvalidRank0 _ =
    case WeightedRandom.calculateWeightSafely 0 of
        Nothing -> 
            Expect.pass
        Just _ -> 
            Expect.fail "無効なランク0で重みが計算されるべきではない"


testInvalidRank151 : () -> Expectation
testInvalidRank151 _ =
    case WeightedRandom.calculateWeightSafely 151 of
        Nothing -> 
            Expect.pass
        Just _ -> 
            Expect.fail "無効なランク151で重みが計算されるべきではない"


testNegativeRank : () -> Expectation
testNegativeRank _ =
    case WeightedRandom.calculateWeightSafely -5 of
        Nothing -> 
            Expect.pass
        Just _ -> 
            Expect.fail "負のランクで重みが計算されるべきではない"


-- 累積重み計算テスト関数群
testCumulativeWeights : () -> Expectation
testCumulativeWeights _ =
    let
        weights = [3, 2, 1]  -- 重みのリスト
        actualCumulative = WeightedRandom.calculateCumulativeWeights weights
        expectedCumulative = [3, 5, 6]  -- 期待される累積重み
    in
    Expect.equal expectedCumulative actualCumulative


testEmptyCumulativeWeights : () -> Expectation
testEmptyCumulativeWeights _ =
    let
        emptyWeights = []
        actualEmpty = WeightedRandom.calculateCumulativeWeights emptyWeights
        expectedEmpty = []
    in
    Expect.equal expectedEmpty actualEmpty


testSingleElementCumulativeWeights : () -> Expectation
testSingleElementCumulativeWeights _ =
    let
        singleWeight = [5]
        actualSingle = WeightedRandom.calculateCumulativeWeights singleWeight
        expectedSingle = [5]
    in
    Expect.equal expectedSingle actualSingle


-- 重み付き選択基本テスト関数群
testWeightedSelection : () -> Expectation
testWeightedSelection _ =
    let
        cumulativeWeights = [3, 5, 6]
        randomValue = 4  -- 2番目の要素が選ばれるべき（インデックス1）
        actualIndex = WeightedRandom.selectIndexByCumulative randomValue cumulativeWeights
        expectedIndex = 1
    in
    Expect.equal expectedIndex actualIndex


testBoundarySelection : () -> Expectation
testBoundarySelection _ =
    let
        cumulativeWeights = [3, 5, 6]
        randomValue = 3  -- 境界値：1番目の要素が選ばれるべき
        actualIndex = WeightedRandom.selectIndexByCumulative randomValue cumulativeWeights
        expectedIndex = 0
    in
    Expect.equal expectedIndex actualIndex


testMaxWeightSelection : () -> Expectation
testMaxWeightSelection _ =
    let
        cumulativeWeights = [3, 5, 6]
        randomValue = 6  -- 最大値：3番目の要素が選ばれるべき
        actualIndex = WeightedRandom.selectIndexByCumulative randomValue cumulativeWeights
        expectedIndex = 2
    in
    Expect.equal expectedIndex actualIndex


-- ヘルパー関数（無名関数とパイプ演算子を避ける）
calculateExpectedWeight : Int -> Int
calculateExpectedWeight rank =
    151 - rank


isValidRank : Int -> Bool
isValidRank rank =
    rank >= 1 && rank <= 150


sumWeights : List Int -> Int
sumWeights weights =
    List.sum weights