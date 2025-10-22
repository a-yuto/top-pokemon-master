module SpeedTableTest exposing (..)

import Expect
import Pokemon.Types exposing (Pokemon, PokemonType(..), Stats)
import Route.SpeedTable exposing (SimpleSpeedData, SpeedConfiguration(..), assignHorizontalOffsetsSimple, calculateBaseStat, calculateHorizontalOffset, calculateSpeedForConfiguration, calculateVerticalPosition, findMaxSpeedSimple, findMinSpeedSimple, truncatePokemonName)
import Test exposing (..)


suite : Test
suite =
    describe "SpeedTable calculations"
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
                        configurations = [ BaseEV0, MaxEV252, MaxEVWithNature, MaxEVWithNatureAndItem ]
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

        , describe "calculateVerticalPosition"
            [ test "places minimum speed at the bottom" <|
                \_ ->
                    Expect.equal 100.0 (calculateVerticalPosition 50 50 120)

            , test "places maximum speed at the top" <|
                \_ ->
                    Expect.equal 0.0 (calculateVerticalPosition 120 50 120)

            , test "places mid point in the middle" <|
                \_ ->
                    Expect.equal 50.0 (calculateVerticalPosition 85 50 120)

            , test "returns center for identical min and max" <|
                \_ ->
                    Expect.equal 50.0 (calculateVerticalPosition 90 90 90)
            ]

        , describe "findMinSpeedSimple and findMaxSpeedSimple"
            [ test "finds minimum speed from list" <|
                \_ ->
                    let
                        speedDataList = createTestSpeedDataList
                        minSpeed = findMinSpeedSimple speedDataList
                    in
                    Expect.equal 5 minSpeed

            , test "finds maximum speed from list" <|
                \_ ->
                    let
                        speedDataList = createTestSpeedDataList
                        maxSpeed = findMaxSpeedSimple speedDataList
                    in
                    Expect.equal 200 maxSpeed

            , test "returns defaults when list is empty" <|
                \_ ->
                    let
                        emptyList = []
                        minSpeed = findMinSpeedSimple emptyList
                        maxSpeed = findMaxSpeedSimple emptyList
                        minCorrect = minSpeed == 0
                        maxCorrect = maxSpeed == 200
                    in
                    Expect.equal True (minCorrect && maxCorrect)
            ]

        , describe "assignHorizontalOffsetsSimple"
            [ test "assigns symmetric offsets to overlapping Pokemon" <|
                \_ ->
                    let
                        duplicateSpeedData = createDuplicateSpeedData
                        withOffsets = assignHorizontalOffsetsSimple duplicateSpeedData
                        offsetList = List.map getHorizontalOffset withOffsets
                    in
                    Expect.equal [ -24, 24 ] offsetList

            , test "handles single Pokemon without duplicates" <|
                \_ ->
                    let
                        singleData = [ createSimpleSpeedData createTestGarchomp 200 ]
                        withOffsets = assignHorizontalOffsetsSimple singleData
                        maybeFirst = getFirstSimpleSpeedData withOffsets
                    in
                    case maybeFirst of
                        Just first ->
                            Expect.equal 0 first.horizontalOffset

                        Nothing ->
                            Expect.fail "Expected data for single Pokemon"

            , test "assigns consistent offsets for the same Pokemon across datasets" <|
                \_ ->
                    let
                        firstDataset = createConsistentOffsetDatasetA
                        secondDataset = createConsistentOffsetDatasetB
                        firstOffsets = assignHorizontalOffsetsSimple firstDataset
                        secondOffsets = assignHorizontalOffsetsSimple secondDataset
                        offsetA = getOffsetForPokemon "ガブリアス" firstOffsets
                        offsetB = getOffsetForPokemon "ガブリアス" secondOffsets
                    in
                    Expect.equal offsetA offsetB

            , test "sorts Pokemon by speed descending before assigning offsets" <|
                \_ ->
                    let
                        dataset = createSortingVerificationDataset
                        withOffsets = assignHorizontalOffsetsSimple dataset
                        names = List.map getPokemonNameFromSimpleSpeedData withOffsets
                    in
                    Expect.equal [ "テッカニン", "ガブリアス", "カイリュー" ] names

            , test "spreads three identical speeds evenly" <|
                \_ ->
                    let
                        tripleData = createTripleDuplicateSpeedData
                        withOffsets = assignHorizontalOffsetsSimple tripleData
                        offsetList = List.map getHorizontalOffset withOffsets
                    in
                    Expect.equal [ -48, 0, 48 ] offsetList
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

        , describe "calculateHorizontalOffset"
            [ test "returns zero offset for a single entry" <|
                \_ ->
                    Expect.equal 0 (calculateHorizontalOffset 0 1)

            , test "places two entries symmetrically" <|
                \_ ->
                    let
                        firstOffset = calculateHorizontalOffset 0 2
                        secondOffset = calculateHorizontalOffset 1 2
                    in
                    Expect.equal True (firstOffset == -24 && secondOffset == 24)

            , test "places three entries symmetrically" <|
                \_ ->
                    let
                        firstOffset = calculateHorizontalOffset 0 3
                        secondOffset = calculateHorizontalOffset 1 3
                        thirdOffset = calculateHorizontalOffset 2 3
                        condition =
                            firstOffset == -48 && secondOffset == 0 && thirdOffset == 48
                    in
                    Expect.equal True condition
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
    createTestPokemonWithIdAndSpeed 999 speedStat


createTestPokemonWithIdAndSpeed : Int -> Int -> Pokemon
createTestPokemonWithIdAndSpeed pokemonId speedStat =
    { id = pokemonId
    , name = "テストポケモン" ++ String.fromInt pokemonId
    , englishName = "TestPokemon" ++ String.fromInt pokemonId
    , pokemonType = NormalType
    , stats = Stats 100 100 100 100 100 speedStat
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


isPositiveSpeed : Int -> Bool
isPositiveSpeed speed =
    speed > 0


createSimpleSpeedData : Pokemon -> Int -> SimpleSpeedData
createSimpleSpeedData pokemon speedValue =
    { pokemon = pokemon
    , speed = speedValue
    , baseSpeed = pokemon.stats.speed
    , horizontalOffset = 0
    }


createTestSpeedDataList : List SimpleSpeedData
createTestSpeedDataList =
    [ createSimpleSpeedData createTestGarchomp 102
    , createSimpleSpeedData createTestShuckle 5
    , createSimpleSpeedData createTestNinjask 200
    , createSimpleSpeedData (createTestPokemonWithSpeed 50) 50
    , createSimpleSpeedData (createTestPokemonWithSpeed 180) 180
    ]


createDuplicateSpeedData : List SimpleSpeedData
createDuplicateSpeedData =
    [ createSimpleSpeedData createTestGarchomp 150
    , createSimpleSpeedData createTestNinjask 150
    ]


createTripleDuplicateSpeedData : List SimpleSpeedData
createTripleDuplicateSpeedData =
    [ createSimpleSpeedData createTestGarchomp 180
    , createSimpleSpeedData createTestNinjask 180
    , createSimpleSpeedData createTestDragonite 180
    ]


createConsistentOffsetDatasetA : List SimpleSpeedData
createConsistentOffsetDatasetA =
    [ createSimpleSpeedData createTestGarchomp 120
    , createSimpleSpeedData createTestShuckle 40
    , createSimpleSpeedData createTestDragonite 90
    ]


createConsistentOffsetDatasetB : List SimpleSpeedData
createConsistentOffsetDatasetB =
    [ createSimpleSpeedData createTestGarchomp 130
    , createSimpleSpeedData createTestShuckle 35
    , createSimpleSpeedData createTestDragonite 100
    ]


createSortingVerificationDataset : List SimpleSpeedData
createSortingVerificationDataset =
    [ createSimpleSpeedData createTestDragonite 160
    , createSimpleSpeedData createTestGarchomp 185
    , createSimpleSpeedData createTestNinjask 205
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
    case List.filter (hasTargetName targetName) speedDataList of
        first :: _ ->
            first.horizontalOffset

        [] ->
            -1


getHorizontalOffset : SimpleSpeedData -> Int
getHorizontalOffset speedData =
    speedData.horizontalOffset


getFirstSimpleSpeedData : List SimpleSpeedData -> Maybe SimpleSpeedData
getFirstSimpleSpeedData speedDataList =
    case speedDataList of
        first :: _ ->
            Just first

        [] ->
            Nothing


getPokemonNameFromSimpleSpeedData : SimpleSpeedData -> String
getPokemonNameFromSimpleSpeedData speedData =
    speedData.pokemon.name


hasTargetName : String -> SimpleSpeedData -> Bool
hasTargetName targetName speedData =
    speedData.pokemon.name == targetName
