module PokemonDataTest exposing (suite)

import Expect
import Pokemon.Data exposing (allPokemon, findPokemonById, findPokemonByName)
import Pokemon.Types exposing (PokemonType(..))
import Test exposing (..)


suite : Test
suite =
    describe "Pokemon.Data"
        [ describe "findPokemonById"
            [ test "should return Bulbasaur for ID 1" testGetBulbasaurById
            , test "should return Pikachu for ID 25" testGetPikachuById
            , test "should return Nothing for invalid ID" testInvalidId
            ]
        , describe "findPokemonByName"
            [ test "should find Pokemon by Japanese name" testFindByJapaneseName
            , test "should return Nothing for non-existent name" testNonExistentName
            ]
        , describe "allPokemon"
            [ test "should contain at least 1000 Pokemon" testPokemonCount
            , test "should have unique IDs" testUniqueIds
            , test "all Pokemon should have valid stats" testValidStats
            ]
        ]


testGetBulbasaurById : () -> Expect.Expectation
testGetBulbasaurById _ =
    let
        maybePokemon = findPokemonById 1
    in
    case maybePokemon of
        Just pokemon ->
            if pokemon.id == 1 && pokemon.name == "フシギダネ" && pokemon.englishName == "フシギダネ" && pokemon.pokemonType == GrassPoison then
                Expect.pass
            else
                Expect.fail "Pokemon properties don't match expected values for Bulbasaur"
        
        Nothing ->
            Expect.fail "Expected to find Bulbasaur with ID 1"


testGetPikachuById : () -> Expect.Expectation
testGetPikachuById _ =
    let
        maybePokemon = findPokemonById 25
    in
    case maybePokemon of
        Just pokemon ->
            if pokemon.id == 25 && pokemon.name == "ピカチュウ" && pokemon.englishName == "ピカチュウ" && pokemon.pokemonType == ElectricType then
                Expect.pass
            else
                Expect.fail "Pokemon properties don't match expected values for Pikachu"
        
        Nothing ->
            Expect.fail "Expected to find Pikachu with ID 25"


testInvalidId : () -> Expect.Expectation
testInvalidId _ =
    let
        result = findPokemonById 99999
    in
    Expect.equal Nothing result


testFindByJapaneseName : () -> Expect.Expectation
testFindByJapaneseName _ =
    let
        maybePokemon = findPokemonByName "フシギダネ"
    in
    case maybePokemon of
        Just pokemon ->
            Expect.equal 1 pokemon.id
        
        Nothing ->
            Expect.fail "Expected to find Bulbasaur by Japanese name"


testNonExistentName : () -> Expect.Expectation
testNonExistentName _ =
    let
        result = findPokemonByName "InvalidPokemonName"
    in
    Expect.equal Nothing result


testPokemonCount : () -> Expect.Expectation
testPokemonCount _ =
    let
        count = List.length allPokemon
    in
    Expect.atLeast 1000 count


testUniqueIds : () -> Expect.Expectation
testUniqueIds _ =
    let
        ids = List.map getId allPokemon
        uniqueIds = removeDuplicates ids []
        originalCount = List.length ids
        uniqueCount = List.length uniqueIds
    in
    Expect.equal originalCount uniqueCount


testValidStats : () -> Expect.Expectation
testValidStats _ =
    let
        allValid = List.all isValidPokemon allPokemon
    in
    Expect.equal True allValid


-- Helper functions
getId : Pokemon.Types.Pokemon -> Int
getId pokemon =
    pokemon.id


removeDuplicates : List Int -> List Int -> List Int
removeDuplicates list acc =
    case list of
        [] ->
            List.reverse acc
        
        head :: tail ->
            if List.member head acc then
                removeDuplicates tail acc
            else
                removeDuplicates tail (head :: acc)


isValidPokemon : Pokemon.Types.Pokemon -> Bool
isValidPokemon pokemon =
    pokemon.stats.hp > 0
        && pokemon.stats.attack >= 0
        && pokemon.stats.defense >= 0
        && pokemon.stats.specialAttack >= 0
        && pokemon.stats.specialDefense >= 0
        && pokemon.stats.speed >= 0