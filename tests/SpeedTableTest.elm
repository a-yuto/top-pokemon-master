module SpeedTableTest exposing (..)

import Expect
import Test exposing (..)
import Pokemon.Types exposing (Pokemon, Stats, PokemonType(..))
import Route.SpeedTable exposing (calculateSpeedForConfiguration, SpeedConfiguration(..), truncatePokemonName, calculatePositionSimple, findMinSpeedSimple, findMaxSpeedSimple, assignVerticalOffsetsSimple, calculateBaseStat, SimpleSpeedData)


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
                        allPositive = List.all isPositiveSpeed speeds
                    in
                    Expect.equal True allPositive
            ]

        , describe "truncatePokemonName"
            [ test "truncates name to 2 characters in compact mode" <|
                \_ ->
                    Expect.equal "ガブ" (truncatePokemonName True "ガブリアス")

            , test "does not truncate name in normal mode" <|
                \_ ->
                    Expect.equal "ガブリアス" (truncatePokemonName False "ガブリアス")

            , test "handles short names correctly in compact mode" <|
                \_ ->
                    Expect.equal "ピ" (truncatePokemonName True "ピ")

            , test "handles empty string" <|
                \_ ->
                    Expect.equal "" (truncatePokemonName True "")
            ]

        , describe "calculatePositionSimple"
            [ test "calculates 0% position for minimum speed" <|
                \_ ->
                    Expect.equal 0.0 (calculatePositionSimple 50 50 100)

            , test "calculates 100% position for maximum speed" <|
                \_ ->
                    Expect.equal 100.0 (calculatePositionSimple 100 50 100)

            , test "calculates 50% position for middle speed" <|
                \_ ->
                    Expect.equal 50.0 (calculatePositionSimple 75 50 100)

            , test "handles equal min and max speeds" <|
                \_ ->
                    Expect.equal 50.0 (calculatePositionSimple 80 80 80)
            ]

        , describe "findMinSpeedSimple and findMaxSpeedSimple"
            [ test "finds minimum speed correctly" <|
                \_ ->
                    let
                        speedData = createTestSpeedDataList
                        minSpeed = findMinSpeedSimple speedData
                    in
                    Expect.equal 5 minSpeed

            , test "finds maximum speed correctly" <|
                \_ ->
                    let
                        speedData = createTestSpeedDataList
                        maxSpeed = findMaxSpeedSimple speedData
                    in
                    Expect.equal 160 maxSpeed

            , test "handles empty list with default values" <|
                \_ ->
                    let
                        emptyList = []
                        minSpeed = findMinSpeedSimple emptyList
                        maxSpeed = findMaxSpeedSimple emptyList
                    in
                    let
                        isMinCorrect = minSpeed == 0
                        isMaxCorrect = maxSpeed == 200
                        bothCorrect = isMinCorrect && isMaxCorrect
                    in
                    Expect.equal True bothCorrect
            ]

        , describe "assignVerticalOffsetsSimple"
            [ test "assigns offsets to overlapping Pokemon" <|
                \_ ->
                    let
                        duplicateSpeedData = createDuplicateSpeedData
                        withOffsets = assignVerticalOffsetsSimple duplicateSpeedData
                        offsetList = List.map getVerticalOffset withOffsets
                        expectedOffsets = [0, 25]
                    in
                    Expect.equal expectedOffsets offsetList

            , test "handles single Pokemon without duplicates" <|
                \_ ->
                    let
                        singleData = [createSimpleSpeedData createTestGarchomp 102]
                        withOffsets = assignVerticalOffsetsSimple singleData
                        garchomp = getFirstSimpleSpeedData withOffsets
                    in
                    case garchomp of
                        Just pokemon ->
                            Expect.equal 0 pokemon.verticalOffset

                        Nothing ->
                            Expect.fail "Expected at least one Pokemon"
            ]

        , describe "calculateBaseStat"
            [ test "calculates base stat correctly for level 50" <|
                \_ ->
                    let
                        result = calculateBaseStat 100 31 252 50 1.1 1.5
                        expectedCalculation = round (toFloat (((100 * 2 + 31 + (252 // 4)) * 50) // 100 + 5) * 1.1 * 1.5)
                    in
                    Expect.equal expectedCalculation result

            , test "calculates with no nature or item multiplier" <|
                \_ ->
                    let
                        result = calculateBaseStat 100 31 0 50 1.0 1.0
                        expectedCalculation = ((100 * 2 + 31 + 0) * 50) // 100 + 5
                    in
                    Expect.equal expectedCalculation result

            , test "handles minimum base stat" <|
                \_ ->
                    let
                        result = calculateBaseStat 1 0 0 50 1.0 1.0
                        expectedMinimum = ((1 * 2 + 0 + 0) * 50) // 100 + 5
                    in
                    Expect.equal expectedMinimum result
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


-- Additional helper functions for new tests
createTestSpeedDataList : List SimpleSpeedData
createTestSpeedDataList =
    [ createSimpleSpeedData createTestGarchomp 102
    , createSimpleSpeedData createTestShuckle 5
    , createSimpleSpeedData createTestNinjask 160
    , createSimpleSpeedData (createTestPokemonWithSpeed 50) 50
    , createSimpleSpeedData (createTestPokemonWithSpeed 150) 150
    ]


createSimpleSpeedData : Pokemon -> Int -> SimpleSpeedData
createSimpleSpeedData pokemon speed =
    { pokemon = pokemon
    , speed = speed
    , verticalOffset = 0
    }


createDuplicateSpeedData : List SimpleSpeedData
createDuplicateSpeedData =
    [ createSimpleSpeedData createTestGarchomp 100
    , createSimpleSpeedData createTestDragonite 100
    ]


createTestDragonite : Pokemon
createTestDragonite =
    { id = 149
    , name = "カイリュー"
    , englishName = "Dragonite"
    , pokemonType = FlyingDragon
    , stats = Stats 91 134 95 100 100 80
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


getOffsetForPokemon : String -> List SimpleSpeedData -> Int
getOffsetForPokemon targetName speedDataList =
    case List.filter (hasSameName targetName) speedDataList of
        first :: _ ->
            first.verticalOffset

        [] ->
            -1


hasSameName : String -> SimpleSpeedData -> Bool
hasSameName targetName speedData =
    speedData.pokemon.name == targetName


getFirstSimpleSpeedData : List SimpleSpeedData -> Maybe SimpleSpeedData
getFirstSimpleSpeedData speedDataList =
    case speedDataList of
        first :: _ ->
            Just first

        [] ->
            Nothing


isPositiveSpeed : Int -> Bool
isPositiveSpeed speed =
    speed > 0


getVerticalOffset : SimpleSpeedData -> Int
getVerticalOffset speedData =
    speedData.verticalOffset