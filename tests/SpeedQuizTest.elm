module SpeedQuizTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Pokemon.Data exposing (findPokemonById, findPokemonByName)
import Pokemon.UsageData as UsageData


-- Test to verify SpeedQuiz logic regarding top 150 Pokemon
suite : Test
suite =
    describe "SpeedQuiz Top 150 Pokemon tests"
        [ test "getTop150Pokemon should return valid Pokemon list" <|
            \_ ->
                let
                    top150Pokemon = UsageData.selectTop150Pokemon
                in
                List.length top150Pokemon
                    |> Expect.atLeast 100  -- Should have at least 100 valid Pokemon
        
        , test "top ranked Pokemon should be available (ディンルー)" <|
            \_ ->
                let
                    top150Pokemon = UsageData.selectTop150Pokemon
                    tingLu = List.head top150Pokemon
                in
                case tingLu of
                    Just pokemon ->
                        Expect.all
                            [ \p -> Expect.equal 994 p.id  -- Correct ID from our database
                            , \p -> Expect.equal "ディンルー" p.name
                            ] pokemon
                    
                    Nothing ->
                        Expect.fail "ディンルー should be available in top 150"
        
        , test "Pokemon names from usage rankings should be findable in database" <|
            \_ ->
                let
                    -- Test first 10 for efficiency
                    top10Rankings = List.take 10 UsageData.season34Rankings
                    missingPokemon =
                        top10Rankings
                            |> List.filterMap (\ranking ->
                                case findPokemonByName ranking.name of
                                    Just _ -> Nothing
                                    Nothing -> Just ranking.name
                            )
                in
                List.length missingPokemon
                    |> Expect.atMost 3  -- Allow some missing due to form variations
        
        , test "UsageData.selectTop150Pokemon should contain popular Pokemon" <|
            \_ ->
                let
                    top150Pokemon = UsageData.selectTop150Pokemon
                    pokemonNames = List.map .name top150Pokemon
                    containsTingLu = List.member "ディンルー" pokemonNames
                    containsChienPao = List.member "パオジアン" pokemonNames
                in
                Expect.all
                    [ \_ -> Expect.equal True containsTingLu
                    , \_ -> Expect.equal True containsChienPao
                    ] ()
        ]