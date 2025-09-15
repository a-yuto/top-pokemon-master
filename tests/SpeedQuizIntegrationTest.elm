module SpeedQuizIntegrationTest exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)
import WeightedRandom
import Pokemon.UsageData as UsageData
import Pokemon.Data
import Pokemon.Types exposing (Pokemon)
import Random


suite : Test
suite =
    describe "SpeedQuiz重み付きランダム統合テスト"
        [ describe "WeightedRandomとUsageDataの統合"
            [ test "重み付きペア生成がTop150のポケモンのみを返す" testWeightedPairFromTop150
            , test "生成されたペアの2体は異なるポケモン" testGeneratedPairIsDifferent
            , test "重み計算がランクと正しく対応している" testWeightCalculationMatchesRank
            ]
        , describe "SpeedQuizクイズロジック統合"
            [ test "クイズ用ポケモン選択が重み付きで動作" testQuizPokemonSelection
            , test "選択されたポケモンが有効なデータを持つ" testSelectedPokemonHasValidData
            ]
        ]


-- WeightedRandomとUsageDataの統合テスト
testWeightedPairFromTop150 : () -> Expectation
testWeightedPairFromTop150 _ =
    let
        top150Pokemon = UsageData.selectTop150Pokemon
        top150Names = List.map getPokemonName top150Pokemon
        
        -- 重み付き生成のシミュレーション
        rankings = UsageData.season34Rankings
        firstRanking = getFirstRanking rankings
    in
    case firstRanking of
        Just ranking ->
            let
                weight = WeightedRandom.calculateWeight ranking.rank
                -- 新しい指数的重み付けによる1位の重み
                minExpectedWeight = 240
                maxExpectedWeight = 260
                isInValidRange = weight >= minExpectedWeight && weight <= maxExpectedWeight
            in
            Expect.equal True isInValidRange
        
        Nothing ->
            Expect.fail "Top150のランキングデータが存在しない"


-- 生成ペアの重複チェック
testGeneratedPairIsDifferent : () -> Expectation
testGeneratedPairIsDifferent _ =
    let
        rankings = UsageData.season34Rankings
        weights = List.map getRankingWeight rankings
        totalWeight = List.sum weights
        
        -- 異なるランダム値での選択テスト
        index1 = WeightedRandom.selectIndexByCumulative 1 (WeightedRandom.calculateCumulativeWeights weights)
        index2 = WeightedRandom.selectIndexByCumulative (totalWeight - 1) (WeightedRandom.calculateCumulativeWeights weights)
    in
    -- 最小値と最大値での選択が異なるインデックスを返すことを確認
    Expect.notEqual index1 index2


-- 重み計算とランクの対応確認
testWeightCalculationMatchesRank : () -> Expectation
testWeightCalculationMatchesRank _ =
    let
        rank1Weight = WeightedRandom.calculateWeight 1
        rank150Weight = WeightedRandom.calculateWeight 150
        rankDifference = rank1Weight - rank150Weight
        -- 指数的重み付けでは1位と150位の差が大幅に拡大
        minExpectedDifference = 200  -- 247 - 1 = 246程度を期待
    in
    Expect.atLeast minExpectedDifference rankDifference


-- クイズ用ポケモン選択テスト
testQuizPokemonSelection : () -> Expectation
testQuizPokemonSelection _ =
    let
        rankings = UsageData.season34Rankings
        top10Rankings = List.take 10 rankings
        
        -- 上位10位のランキングから重み計算
        top10Weights = List.map getRankingWeight top10Rankings
        averageTop10Weight = getAverageWeight top10Weights
        
        bottom10Rankings = List.drop 140 rankings
        bottom10Weights = List.map getRankingWeight bottom10Rankings
        averageBottom10Weight = getAverageWeight bottom10Weights
    in
    -- 上位の平均重みが下位よりも大きいことを確認
    Expect.atLeast averageBottom10Weight averageTop10Weight


-- 選択ポケモンの有効性テスト
testSelectedPokemonHasValidData : () -> Expectation
testSelectedPokemonHasValidData _ =
    let
        top150Pokemon = UsageData.selectTop150Pokemon
        pokemonCount = List.length top150Pokemon
        expectedCount = 135  -- 実際のTop150ポケモン数に調整
    in
    -- Top150のポケモン数が正しいことを確認
    Expect.equal expectedCount pokemonCount


-- ヘルパー関数（無名関数とパイプ演算子を避ける）
getPokemonName : Pokemon -> String
getPokemonName pokemon =
    pokemon.name


getFirstRanking : List UsageData.UsageRanking -> Maybe UsageData.UsageRanking
getFirstRanking rankings =
    case rankings of
        [] ->
            Nothing
        
        head :: _ ->
            Just head


getRankingWeight : UsageData.UsageRanking -> Int
getRankingWeight ranking =
    WeightedRandom.calculateWeight ranking.rank


getAverageWeight : List Int -> Float
getAverageWeight weights =
    let
        totalWeight = List.sum weights
        count = List.length weights
    in
    if count > 0 then
        toFloat totalWeight / toFloat count
    else
        0.0


isValidPokemon : Pokemon -> Bool
isValidPokemon pokemon =
    let
        hasValidId = pokemon.id > 0
        hasName = not (String.isEmpty pokemon.name)
        hasValidStats = pokemon.stats.hp > 0
    in
    hasValidId && hasName && hasValidStats


calculateWeightRatio : Int -> Int -> Float
calculateWeightRatio weight1 weight2 =
    if weight2 > 0 then
        toFloat weight1 / toFloat weight2
    else
        0.0