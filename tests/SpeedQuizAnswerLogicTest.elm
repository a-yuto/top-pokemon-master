module SpeedQuizAnswerLogicTest exposing (suite)

import Expect exposing (Expectation)
import Pokemon.BattleTypes exposing (BattleKata, initBattleKata)
import Pokemon.Data exposing (findPokemonById)
import Pokemon.Types exposing (Pokemon, PokemonType(..), Stats)
import Route.SpeedQuiz exposing (isBaseStatsSelectionCorrect, isRealStatsSelectionCorrect)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "SpeedQuiz answer evaluation"
        [ test "base stats selection is incorrect when speeds match" baseStatsSelectionRequiresSameButton
        , test "base stats selection is correct for faster pokemon" baseStatsSelectionChoosesFasterPokemon
        , test "real stats selection is incorrect when speeds match" realStatsSelectionRequiresSameButton
        , test "real stats selection is correct for faster kata" realStatsSelectionChoosesFasterPokemon
        ]


baseStatsSelectionRequiresSameButton : () -> Expectation
baseStatsSelectionRequiresSameButton _ =
    let
        pokemon1 = createTestPokemon 9001 "Alpha" 100
        pokemon2 = createTestPokemon 9002 "Beta" 100
        isCorrect = isBaseStatsSelectionCorrect pokemon1 pokemon2 pokemon1.id
    in
    Expect.equal False isCorrect


baseStatsSelectionChoosesFasterPokemon : () -> Expectation
baseStatsSelectionChoosesFasterPokemon _ =
    let
        pokemon1 = createTestPokemon 9003 "Gamma" 105
        pokemon2 = createTestPokemon 9004 "Delta" 95
        isCorrect = isBaseStatsSelectionCorrect pokemon1 pokemon2 pokemon1.id
    in
    Expect.equal True isCorrect


realStatsSelectionRequiresSameButton : () -> Expectation
realStatsSelectionRequiresSameButton _ =
    case findPokemonById 25 of
        Just pokemon ->
            let
                kata1 = buildBattleKata pokemon.id 0
                kata2 = buildBattleKata pokemon.id 0
                isCorrect = isRealStatsSelectionCorrect kata1 kata2 kata1.pokemonId
            in
            Expect.equal False isCorrect

        Nothing ->
            Expect.fail "Expected Pikachu to exist in data set"


realStatsSelectionChoosesFasterPokemon : () -> Expectation
realStatsSelectionChoosesFasterPokemon _ =
    case findPokemonById 6 of
        Just pokemon ->
            let
                kataSlow = buildBattleKata pokemon.id 0
                kataFast = buildBattleKata pokemon.id 252
                isCorrect = isRealStatsSelectionCorrect kataFast kataSlow kataFast.pokemonId
            in
            Expect.equal True isCorrect

        Nothing ->
            Expect.fail "Expected Charizard to exist in data set"


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


buildBattleKata : Int -> Int -> BattleKata
buildBattleKata pokemonId speedEv =
    let
        baseKata = initBattleKata pokemonId
        baseEffort = baseKata.effortValues
        updatedEffort =
            { baseEffort | speed = speedEv }
    in
    { baseKata | effortValues = updatedEffort }
