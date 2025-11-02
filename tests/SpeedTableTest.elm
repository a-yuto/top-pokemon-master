module SpeedTableTest exposing (..)

import Expect
import Pokemon.Types exposing (Pokemon, PokemonType(..), Stats)
import Route.SpeedTable exposing (SimpleSpeedData, SpeedConfiguration(..), calculateBaseStat, calculateSpeedForConfiguration, calculateVerticalPosition, findMaxSpeedSimple, findMinSpeedSimple, groupSpeedDataBySpeed, truncatePokemonName)
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

        , describe "groupSpeedDataBySpeed"
            [ test "groups multiple Pokemon with identical speed into one card" <|
                \_ ->
                    let
                        speedList = createDuplicateSpeedData
                        grouped = groupSpeedDataBySpeed speedList
                        cardCount = List.length grouped
                        firstCard = List.head grouped
                        entryCount =
                            case firstCard of
                                Just card ->
                                    List.length card.entries

                                Nothing ->
                                    0
                    in
                    Expect.equal ( 1, 2 ) ( cardCount, entryCount )

            , test "orders grouped cards by speed descending" <|
                \_ ->
                    let
                        dataset = createSortingVerificationDataset
                        grouped = groupSpeedDataBySpeed dataset
                        speeds = List.map (.speed) grouped
                    in
                    Expect.equal [ 205, 185, 160 ] speeds

            , test "sorts entries inside a card alphabetically by name" <|
                \_ ->
                    let
                        dataset = createTripleDuplicateSpeedData
                        grouped = groupSpeedDataBySpeed dataset
                        names =
                            case grouped of
                                card :: _ ->
                                    List.map (\entry -> entry.pokemon.name) card.entries

                                [] ->
                                    []
                    in
                    Expect.equal [ "カイリュー", "ガブリアス", "テッカニン" ] names
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
