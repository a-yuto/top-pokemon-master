module UsageDataTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Pokemon.UsageData as UsageData


suite : Test
suite =
    describe "UsageData module tests"
        [ test "season34Rankings should have 150 entries" <|
            \_ ->
                List.length UsageData.season34Rankings
                    |> Expect.equal 150
        
        , test "top rank should be ディンルー with pokemonId 1003" <|
            \_ ->
                case List.head UsageData.season34Rankings of
                    Just firstRank ->
                        Expect.all
                            [ \ranking -> Expect.equal 1 ranking.rank
                            , \ranking -> Expect.equal 1003 ranking.pokemonId
                            , \ranking -> Expect.equal "ディンルー" ranking.name
                            ] firstRank
                    
                    Nothing ->
                        Expect.fail "No rankings found"
        
        , test "selectTop10 should return exactly 10 rankings" <|
            \_ ->
                List.length UsageData.selectTop10
                    |> Expect.equal 10
        
        , test "findRankByPokemonId should find ディンルー at rank 1" <|
            \_ ->
                UsageData.findRankByPokemonId 1003
                    |> Expect.equal (Just 1)
                    
        , test "findRankByPokemonId should return Nothing for non-existent pokemon" <|
            \_ ->
                UsageData.findRankByPokemonId 9999
                    |> Expect.equal Nothing
        ]