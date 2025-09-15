module EdgeCaseTest exposing (suite)

import Expect exposing (Expectation)
import Pokemon.Data exposing (allPokemon, findPokemonById, findPokemonByName)
import Pokemon.MoveData exposing (allMoves, findMoveById, findMoveByName)
import Pokemon.AbilityData exposing (allAbilities, findAbilityById, findAbilityByName)
import Pokemon.Types exposing (Pokemon)
import Pokemon.Move exposing (Move)
import Pokemon.UsageData as UsageData
import Test exposing (..)


suite : Test
suite =
    describe "エラーハンドリングとエッジケース"
        [ describe "境界値テスト"
            [ test "負のIDで検索" testNegativeId
            , test "0のIDで検索" testZeroId
            , test "最大整数値のIDで検索" testMaxIntId
            ]
        , describe "空文字列・特殊文字テスト"
            [ test "空文字列で検索" testEmptyString
            , test "空白文字で検索" testWhitespaceString
            , test "特殊文字で検索" testSpecialCharacters
            , test "非常に長い文字列で検索" testVeryLongString
            ]
        , describe "データ整合性テスト"
            [ test "全ポケモンのIDが正の整数" testAllPokemonValidIds
            , test "全技のIDが正の整数" testAllMovesValidIds
            , test "全特性のIDが正の整数" testAllAbilitiesValidIds
            , test "ポケモンの名前が空でない" testAllPokemonNamesNotEmpty
            ]
        , describe "UsageDataエッジケース"
            [ test "存在しないポケモン名でランク検索" testNonExistentPokemonRank
            , test "存在しないIDでランク検索" testNonExistentIdRank
            , test "負の値でgetTopN" testNegativeTopN
            , test "0でgetTopN" testZeroTopN
            ]
        , describe "重複データチェック"
            [ test "ポケモンIDに重複がない" testNoPokemonIdDuplicates
            , test "技IDに重複がない" testNoMoveIdDuplicates
            , test "特性IDに重複がない" testNoAbilityIdDuplicates
            ]
        ]


testNegativeId : () -> Expectation
testNegativeId _ =
    let
        pokemonResult = findPokemonById -1
        moveResult = findMoveById -1
        abilityResult = findAbilityById -1
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testZeroId : () -> Expectation
testZeroId _ =
    let
        pokemonResult = findPokemonById 0
        moveResult = findMoveById 0
        abilityResult = findAbilityById 0
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testMaxIntId : () -> Expectation
testMaxIntId _ =
    let
        maxInt = 2147483647
        pokemonResult = findPokemonById maxInt
        moveResult = findMoveById maxInt
        abilityResult = findAbilityById maxInt
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testEmptyString : () -> Expectation
testEmptyString _ =
    let
        pokemonResult = findPokemonByName ""
        moveResult = findMoveByName ""
        abilityResult = findAbilityByName ""
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testWhitespaceString : () -> Expectation
testWhitespaceString _ =
    let
        pokemonResult = findPokemonByName "   "
        moveResult = findMoveByName " \t\n "
        abilityResult = findAbilityByName "　　　"
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testSpecialCharacters : () -> Expectation
testSpecialCharacters _ =
    let
        pokemonResult = findPokemonByName "@#$%^&*()"
        moveResult = findMoveByName "!@#$%^&*"
        abilityResult = findAbilityByName "<>?:{}|"
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testVeryLongString : () -> Expectation
testVeryLongString _ =
    let
        longString = String.repeat 1000 "あいうえおかきくけこ"
        pokemonResult = findPokemonByName longString
        moveResult = findMoveByName longString
        abilityResult = findAbilityByName longString
    in
    Expect.all
        [ \_ -> Expect.equal Nothing pokemonResult
        , \_ -> Expect.equal Nothing moveResult
        , \_ -> Expect.equal Nothing abilityResult
        ] ()


testAllPokemonValidIds : () -> Expectation
testAllPokemonValidIds _ =
    let
        allValidIds = List.all hasValidPokemonId allPokemon
    in
    Expect.equal True allValidIds


testAllMovesValidIds : () -> Expectation
testAllMovesValidIds _ =
    let
        allValidIds = List.all hasValidMoveId allMoves
    in
    Expect.equal True allValidIds


testAllAbilitiesValidIds : () -> Expectation
testAllAbilitiesValidIds _ =
    let
        allValidIds = List.all hasValidAbilityId allAbilities
    in
    Expect.equal True allValidIds


testAllPokemonNamesNotEmpty : () -> Expectation
testAllPokemonNamesNotEmpty _ =
    let
        allValidNames = List.all hasValidPokemonName allPokemon
    in
    Expect.equal True allValidNames


testNonExistentPokemonRank : () -> Expectation
testNonExistentPokemonRank _ =
    let
        result = UsageData.findRankByPokemonName "存在しないポケモン"
    in
    Expect.equal Nothing result


testNonExistentIdRank : () -> Expectation
testNonExistentIdRank _ =
    let
        result = UsageData.findRankByPokemonId 99999
    in
    Expect.equal Nothing result


testNegativeTopN : () -> Expectation
testNegativeTopN _ =
    let
        result = UsageData.selectTopN -5
        isEmpty = List.isEmpty result
    in
    Expect.equal True isEmpty


testZeroTopN : () -> Expectation
testZeroTopN _ =
    let
        result = UsageData.selectTopN 0
        isEmpty = List.isEmpty result
    in
    Expect.equal True isEmpty


testNoPokemonIdDuplicates : () -> Expectation
testNoPokemonIdDuplicates _ =
    let
        ids = List.map getPokemonId allPokemon
        uniqueIds = removeDuplicates ids []
        originalCount = List.length ids
        uniqueCount = List.length uniqueIds
    in
    Expect.equal originalCount uniqueCount


testNoMoveIdDuplicates : () -> Expectation
testNoMoveIdDuplicates _ =
    let
        ids = List.map getMoveId allMoves
        uniqueIds = removeDuplicates ids []
        originalCount = List.length ids
        uniqueCount = List.length uniqueIds
    in
    Expect.equal originalCount uniqueCount


testNoAbilityIdDuplicates : () -> Expectation
testNoAbilityIdDuplicates _ =
    let
        ids = List.map getAbilityId allAbilities
        uniqueIds = removeDuplicates ids []
        originalCount = List.length ids
        uniqueCount = List.length uniqueIds
    in
    Expect.equal originalCount uniqueCount


-- ヘルパー関数（無名関数とパイプ演算子を避ける）
hasValidPokemonId : Pokemon -> Bool
hasValidPokemonId pokemon =
    pokemon.id > 0


hasValidMoveId : Move -> Bool
hasValidMoveId move =
    move.id > 0


hasValidAbilityId : Pokemon.AbilityData.Ability -> Bool
hasValidAbilityId ability =
    ability.id > 0


hasValidPokemonName : Pokemon -> Bool
hasValidPokemonName pokemon =
    not (String.isEmpty pokemon.name) && not (String.isEmpty pokemon.englishName)


getPokemonId : Pokemon -> Int
getPokemonId pokemon =
    pokemon.id


getMoveId : Move -> Int
getMoveId move =
    move.id


getAbilityId : Pokemon.AbilityData.Ability -> Int
getAbilityId ability =
    ability.id


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