module SpeedQuizHelperTest exposing (suite)

import Array
import Expect exposing (Expectation)
import Pokemon.BattleTypes exposing (BattleKata, initBattleKata, calculateRealStats)
import Pokemon.Data exposing (findPokemonById)
import Pokemon.Types exposing (Pokemon, PokemonType(..), Stats)
import Pokemon.UsageData as UsageData
import Route.SpeedQuiz exposing
    ( calculateBaseSpeedDifference
    , calculateBattleSpeedDifference
    , getArrayElementSafely
    , getDefaultPokemon
    , getPokemonFromKata
    , selectClosestBattleKataPair
    , selectClosestPokemonPair
    )
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "SpeedQuiz helper functions"
        [ test "getPokemonFromKata returns the matching Pokemon for a valid id" getPokemonFromKataReturnsPokemon
        , test "getPokemonFromKata falls back to the top usage Pokemon when id is missing" getPokemonFromKataFallsBackToUsage
        , test "getDefaultPokemon returns the first Pokemon from a non-empty array" getDefaultPokemonFromNonEmptyArray
        , test "getDefaultPokemon returns Dinlu when the array is empty" getDefaultPokemonFromEmptyArray
        , test "getArrayElementSafely returns a Pokemon inside the valid range" getArrayElementSafelyWithinRange
        , test "getArrayElementSafely returns Dinlu when index is out of range" getArrayElementSafelyOutOfRange
        , test "calculateBaseSpeedDifference returns absolute difference" calculateBaseSpeedDifferenceTest
        , test "calculateBattleSpeedDifference reflects real stats gap" calculateBattleSpeedDifferenceTest
        , test "selectClosestPokemonPair chooses the pair with the smallest gap" selectClosestPokemonPairTest
        , test "selectClosestBattleKataPair chooses the pair with the smallest gap" selectClosestBattleKataPairTest
        ]


getPokemonFromKataReturnsPokemon : () -> Expectation
getPokemonFromKataReturnsPokemon _ =
    let
        battleKata = initBattleKata 1003
        pokemon = getPokemonFromKata battleKata
    in
    Expect.equal 1003 pokemon.id


getPokemonFromKataFallsBackToUsage : () -> Expectation
getPokemonFromKataFallsBackToUsage _ =
    let
        battleKata = initBattleKata 999999
        pokemon = getPokemonFromKata battleKata
        maybeTopPokemon = getTopUsagePokemon
    in
    case maybeTopPokemon of
        Just topPokemon ->
            Expect.equal topPokemon.id pokemon.id

        Nothing ->
            Expect.fail "UsageData.selectTop150Pokemon should contain at least one Pokemon"


getDefaultPokemonFromNonEmptyArray : () -> Expectation
getDefaultPokemonFromNonEmptyArray _ =
    let
        maybeTopPokemon = getTopUsagePokemon
    in
    case maybeTopPokemon of
        Just topPokemon ->
            let
                pokemonArray = Array.fromList UsageData.selectTop150Pokemon
                defaultPokemon = getDefaultPokemon pokemonArray
            in
            Expect.equal topPokemon.id defaultPokemon.id

        Nothing ->
            Expect.fail "UsageData.selectTop150Pokemon should contain at least one Pokemon"


getDefaultPokemonFromEmptyArray : () -> Expectation
getDefaultPokemonFromEmptyArray _ =
    let
        emptyArray = Array.fromList []
        defaultPokemon = getDefaultPokemon emptyArray
    in
    Expect.equal 1003 defaultPokemon.id


getArrayElementSafelyWithinRange : () -> Expectation
getArrayElementSafelyWithinRange _ =
    let
        maybePokemon = getArrayElementSafely 0
        maybeTopPokemon = getTopUsagePokemon
    in
    case ( maybePokemon, maybeTopPokemon ) of
        ( Just selectedPokemon, Just topPokemon ) ->
            Expect.equal topPokemon.id selectedPokemon.id

        ( _, _ ) ->
            Expect.fail "Expected both the selected Pokemon and top Pokemon to be available"


getArrayElementSafelyOutOfRange : () -> Expectation
getArrayElementSafelyOutOfRange _ =
    let
        maybePokemon = getArrayElementSafely 9999
        maybeTopPokemon = getTopUsagePokemon
    in
    case ( maybePokemon, maybeTopPokemon ) of
        ( Just selectedPokemon, Just topPokemon ) ->
            Expect.equal topPokemon.id selectedPokemon.id

        ( _, _ ) ->
            Expect.fail "Expected both the selected Pokemon and top Pokemon to be available"


calculateBaseSpeedDifferenceTest : () -> Expectation
calculateBaseSpeedDifferenceTest _ =
    let
        fastPokemon = createTestPokemon 1 "Fast" 120
        slowPokemon = createTestPokemon 2 "Slow" 95
        difference = calculateBaseSpeedDifference fastPokemon slowPokemon
        expected =
            abs (toFloat fastPokemon.stats.speed - toFloat slowPokemon.stats.speed)
                / (toFloat fastPokemon.stats.speed + toFloat slowPokemon.stats.speed)
    in
    Expect.within (Expect.Absolute 0.0001) expected difference


calculateBattleSpeedDifferenceTest : () -> Expectation
calculateBattleSpeedDifferenceTest _ =
    case findPokemonById 25 of
        Just pokemon ->
            let
                kataSlow = buildBattleKataWithSpeedEv 25 0
                kataFast = buildBattleKataWithSpeedEv 25 252
                slowStats = calculateRealStats kataSlow pokemon
                fastStats = calculateRealStats kataFast pokemon
                expectedDifference =
                    abs (toFloat fastStats.speed - toFloat slowStats.speed)
                        / (toFloat fastStats.speed + toFloat slowStats.speed)
                actualDifference = calculateBattleSpeedDifference kataFast kataSlow
            in
            Expect.within (Expect.Absolute 0.0001) expectedDifference actualDifference

        Nothing ->
            Expect.fail "Expected to find Pokemon id 25 for battle speed difference test"


selectClosestPokemonPairTest : () -> Expectation
selectClosestPokemonPairTest _ =
    let
        pairLarge =
            ( createTestPokemon 10 "LargeA" 80
            , createTestPokemon 11 "LargeB" 120
            )

        pairMedium =
            ( createTestPokemon 12 "MediumA" 100
            , createTestPokemon 13 "MediumB" 115
            )

        pairSmall =
            ( createTestPokemon 14 "SmallA" 108
            , createTestPokemon 15 "SmallB" 110
            )

        maybePair = selectClosestPokemonPair [ pairLarge, pairMedium, pairSmall ]
    in
    case maybePair of
        Just ( pokemon1, pokemon2 ) ->
            let
                difference = calculateBaseSpeedDifference pokemon1 pokemon2
                expected =
                    abs (toFloat pokemon1.stats.speed - toFloat pokemon2.stats.speed)
                        / (toFloat pokemon1.stats.speed + toFloat pokemon2.stats.speed)
            in
            Expect.within (Expect.Absolute 0.0001) expected difference

        Nothing ->
            Expect.fail "Expected selectClosestPokemonPair to return a pair"


selectClosestBattleKataPairTest : () -> Expectation
selectClosestBattleKataPairTest _ =
    case ( findPokemonById 6, findPokemonById 25 ) of
        ( Just charizard, Just pikachu ) ->
            let
                pairLarge =
                    ( buildBattleKataWithSpeedEv charizard.id 0
                    , buildBattleKataWithSpeedEv charizard.id 252
                    )

                kataSameA = buildBattleKataWithSpeedEv pikachu.id 0
                kataSameB = buildBattleKataWithSpeedEv pikachu.id 0
                pairSmall = ( kataSameA, kataSameB )
                maybePair = selectClosestBattleKataPair [ pairLarge, pairSmall ]
            in
            case maybePair of
                Just ( kata1, kata2 ) ->
                    let
                        difference = calculateBattleSpeedDifference kata1 kata2
                    in
                    Expect.equal 0 difference

                Nothing ->
                    Expect.fail "Expected selectClosestBattleKataPair to return a pair"

        _ ->
            Expect.fail "Expected to find Pokemon data for ids 6 and 25"


getTopUsagePokemon : Maybe Pokemon
getTopUsagePokemon =
    case UsageData.selectTop150Pokemon of
        [] ->
            Nothing

        head :: _ ->
            Just head


createTestPokemon : Int -> String -> Int -> Pokemon
createTestPokemon pokemonId name speedValue =
    { id = pokemonId
    , name = name
    , englishName = name
    , pokemonType = NormalType
    , stats = createStats speedValue
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }


createStats : Int -> Stats
createStats speedValue =
    { hp = 60
    , attack = 60
    , defense = 60
    , specialAttack = 60
    , specialDefense = 60
    , speed = speedValue
    }


buildBattleKataWithSpeedEv : Int -> Int -> BattleKata
buildBattleKataWithSpeedEv pokemonId speedEv =
    let
        baseKata = initBattleKata pokemonId
        baseEffort = baseKata.effortValues
        updatedEffort =
            { baseEffort
                | speed = speedEv
            }
    in
    { baseKata | effortValues = updatedEffort }
