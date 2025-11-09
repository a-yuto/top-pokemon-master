module SpeedQuizHelperTest exposing (suite)

import Array
import Expect exposing (Expectation)
import Pokemon.BattleTypes exposing (BattleKata, initBattleKata)
import Pokemon.Types exposing (Pokemon)
import Pokemon.UsageData as UsageData
import Route.SpeedQuiz exposing (getArrayElementSafely, getDefaultPokemon, getPokemonFromKata)
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


getTopUsagePokemon : Maybe Pokemon
getTopUsagePokemon =
    case UsageData.selectTop150Pokemon of
        [] ->
            Nothing

        head :: _ ->
            Just head
