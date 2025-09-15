module MoveDataTest exposing (suite)

import Expect
import Pokemon.Move exposing (MoveCategory(..))
import Pokemon.MoveData exposing (allMoves, findMoveById, findMoveByName)
import Test exposing (..)


suite : Test
suite =
    describe "Pokemon.MoveData"
        [ describe "findMoveById"
            [ test "should return a move for valid ID" testGetMoveById
            , test "should return Nothing for invalid ID" testInvalidMoveId
            ]
        , describe "findMoveByName"
            [ test "should find move by name" testFindMoveByName
            , test "should return Nothing for non-existent move name" testNonExistentMoveName
            ]
        , describe "allMoves"
            [ test "should contain at least 800 moves" testMoveCount
            , test "should have unique IDs" testUniqueMoveIds
            , test "all moves should have valid categories" testValidCategories
            ]
        ]


testGetMoveById : () -> Expect.Expectation
testGetMoveById _ =
    let
        maybeMove = findMoveById 1
    in
    case maybeMove of
        Just move ->
            if move.id == 1 then
                Expect.pass
            else
                Expect.fail "Move ID doesn't match"
        
        Nothing ->
            Expect.fail "Expected to find a move with ID 1"


testInvalidMoveId : () -> Expect.Expectation
testInvalidMoveId _ =
    let
        result = findMoveById 99999
    in
    Expect.equal Nothing result


testFindMoveByName : () -> Expect.Expectation
testFindMoveByName _ =
    let
        maybeMove = findMoveByName "はたく"
    in
    case maybeMove of
        Just move ->
            Expect.pass
        
        Nothing ->
            Expect.fail "Expected to find はたく"


testNonExistentMoveName : () -> Expect.Expectation
testNonExistentMoveName _ =
    let
        result = findMoveByName "InvalidMoveName"
    in
    Expect.equal Nothing result


testMoveCount : () -> Expect.Expectation
testMoveCount _ =
    let
        count = List.length allMoves
    in
    Expect.atLeast 800 count


testUniqueMoveIds : () -> Expect.Expectation
testUniqueMoveIds _ =
    let
        ids = List.map getMoveId allMoves
        uniqueIds = removeDuplicateMoveIds ids []
        originalCount = List.length ids
        uniqueCount = List.length uniqueIds
    in
    Expect.equal originalCount uniqueCount


testValidCategories : () -> Expect.Expectation
testValidCategories _ =
    let
        allValid = List.all hasValidCategory allMoves
    in
    Expect.equal True allValid


-- Helper functions
getMoveId : Pokemon.Move.Move -> Int
getMoveId move =
    move.id


removeDuplicateMoveIds : List Int -> List Int -> List Int
removeDuplicateMoveIds list acc =
    case list of
        [] ->
            List.reverse acc
        
        head :: tail ->
            if List.member head acc then
                removeDuplicateMoveIds tail acc
            else
                removeDuplicateMoveIds tail (head :: acc)


hasValidCategory : Pokemon.Move.Move -> Bool
hasValidCategory move =
    case move.category of
        Physical ->
            True
        
        Special ->
            True
        
        Status ->
            True