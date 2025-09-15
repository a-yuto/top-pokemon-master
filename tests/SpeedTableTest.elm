module SpeedTableTest exposing (..)

import Expect
import Test exposing (..)
import Pokemon.Types exposing (Pokemon, Stats, PokemonType(..))
import Route.SpeedTable exposing (calculateSpeedForConfiguration, SpeedConfiguration(..))


suite : Test
suite =
    describe "SpeedTable calculation tests"
        [ describe "calculateSpeedForConfiguration"
            [ test "calculates BaseEV0 correctly for Garchomp" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        expectedSpeed = calculateExpectedBaseEV0 garchomp.stats.speed
                    in
                    Expect.equal expectedSpeed (calculateSpeedForConfiguration garchomp BaseEV0)

            , test "calculates MaxEV252 correctly for Garchomp" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        expectedSpeed = calculateExpectedMaxEV252 garchomp.stats.speed
                    in
                    Expect.equal expectedSpeed (calculateSpeedForConfiguration garchomp MaxEV252)

            , test "calculates MaxEVWithNature correctly for Garchomp" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        expectedSpeed = calculateExpectedMaxEVWithNature garchomp.stats.speed
                    in
                    Expect.equal expectedSpeed (calculateSpeedForConfiguration garchomp MaxEVWithNature)

            , test "calculates MaxEVWithNatureAndItem correctly for Garchomp" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        expectedSpeed = calculateExpectedMaxEVWithNatureAndItem garchomp.stats.speed
                    in
                    Expect.equal expectedSpeed (calculateSpeedForConfiguration garchomp MaxEVWithNatureAndItem)

            , test "BaseEV0 is always less than MaxEV252" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        baseEV0Speed = calculateSpeedForConfiguration garchomp BaseEV0
                        maxEV252Speed = calculateSpeedForConfiguration garchomp MaxEV252
                    in
                    Expect.lessThan maxEV252Speed baseEV0Speed

            , test "MaxEV252 is always less than MaxEVWithNature" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        maxEV252Speed = calculateSpeedForConfiguration garchomp MaxEV252
                        maxEVWithNatureSpeed = calculateSpeedForConfiguration garchomp MaxEVWithNature
                    in
                    Expect.lessThan maxEVWithNatureSpeed maxEV252Speed

            , test "MaxEVWithNature is always less than MaxEVWithNatureAndItem" <|
                \_ ->
                    let
                        garchomp = createTestGarchomp
                        maxEVWithNatureSpeed = calculateSpeedForConfiguration garchomp MaxEVWithNature
                        maxEVWithNatureAndItemSpeed = calculateSpeedForConfiguration garchomp MaxEVWithNatureAndItem
                    in
                    Expect.lessThan maxEVWithNatureAndItemSpeed maxEVWithNatureSpeed

            , test "calculates correctly for slow Pokemon like Shuckle" <|
                \_ ->
                    let
                        shuckle = createTestShuckle
                        baseEV0Speed = calculateSpeedForConfiguration shuckle BaseEV0
                        expectedSpeed = calculateExpectedBaseEV0 shuckle.stats.speed
                    in
                    Expect.equal expectedSpeed baseEV0Speed

            , test "calculates correctly for fast Pokemon like Ninjask" <|
                \_ ->
                    let
                        ninjask = createTestNinjask
                        maxEVWithNatureAndItemSpeed = calculateSpeedForConfiguration ninjask MaxEVWithNatureAndItem
                        expectedSpeed = calculateExpectedMaxEVWithNatureAndItem ninjask.stats.speed
                    in
                    Expect.equal expectedSpeed maxEVWithNatureAndItemSpeed

            , test "handles edge case of minimum speed stat (5)" <|
                \_ ->
                    let
                        minSpeedPokemon = createTestPokemonWithSpeed 5
                        baseEV0Speed = calculateSpeedForConfiguration minSpeedPokemon BaseEV0
                        expectedMinSpeed = calculateExpectedBaseEV0 5
                    in
                    Expect.equal expectedMinSpeed baseEV0Speed

            , test "all configurations produce positive speeds" <|
                \_ ->
                    let
                        testPokemon = createTestPokemonWithSpeed 1
                        configurations = [BaseEV0, MaxEV252, MaxEVWithNature, MaxEVWithNatureAndItem]
                        speeds = List.map (calculateSpeedForConfiguration testPokemon) configurations
                        allPositive = List.all (\speed -> speed > 0) speeds
                    in
                    Expect.equal True allPositive
            ]
        ]


-- Helper functions for expected calculations
calculateExpectedBaseEV0 : Int -> Int
calculateExpectedBaseEV0 baseSpeed =
    let
        level = 50
        iv = 31
        ev = 0
        baseCalculation = ((baseSpeed * 2 + iv + (ev // 4)) * level) // 100 + 5
    in
    round (toFloat baseCalculation * 1.0 * 1.0)


calculateExpectedMaxEV252 : Int -> Int
calculateExpectedMaxEV252 baseSpeed =
    let
        level = 50
        iv = 31
        ev = 252
        baseCalculation = ((baseSpeed * 2 + iv + (ev // 4)) * level) // 100 + 5
    in
    round (toFloat baseCalculation * 1.0 * 1.0)


calculateExpectedMaxEVWithNature : Int -> Int
calculateExpectedMaxEVWithNature baseSpeed =
    let
        level = 50
        iv = 31
        ev = 252
        baseCalculation = ((baseSpeed * 2 + iv + (ev // 4)) * level) // 100 + 5
    in
    round (toFloat baseCalculation * 1.1 * 1.0)


calculateExpectedMaxEVWithNatureAndItem : Int -> Int
calculateExpectedMaxEVWithNatureAndItem baseSpeed =
    let
        level = 50
        iv = 31
        ev = 252
        baseCalculation = ((baseSpeed * 2 + iv + (ev // 4)) * level) // 100 + 5
    in
    round (toFloat baseCalculation * 1.1 * 1.5)


-- Test Pokemon creation helpers
createTestGarchomp : Pokemon
createTestGarchomp =
    { id = 445
    , name = "ガブリアス"
    , englishName = "Garchomp"
    , pokemonType = GroundDragon
    , stats = Stats 108 130 95 80 85 102
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


createTestShuckle : Pokemon
createTestShuckle =
    { id = 213
    , name = "ツボツボ"
    , englishName = "Shuckle"
    , pokemonType = BugRock
    , stats = Stats 20 10 230 10 230 5
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


createTestNinjask : Pokemon
createTestNinjask =
    { id = 291
    , name = "テッカニン"
    , englishName = "Ninjask"
    , pokemonType = FlyingBug
    , stats = Stats 61 90 45 50 50 160
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


createTestPokemonWithSpeed : Int -> Pokemon
createTestPokemonWithSpeed speedStat =
    { id = 999
    , name = "テストポケモン"
    , englishName = "TestPokemon"
    , pokemonType = NormalType
    , stats = Stats 100 100 100 100 100 speedStat
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }