module PokemonTypesTest exposing (suite)

import Expect exposing (Expectation)
import Pokemon.Types exposing (PokemonType(..), typeToString, Stats)
import Test exposing (..)


suite : Test
suite =
    describe "Pokemon.Types"
        [ describe "PokemonType variants"
            [ test "should have all 18 basic types" testBasicTypes
            , test "should have dual type combinations" testDualTypes
            , test "should handle single types correctly" testSingleTypes
            ]
        , describe "typeToString function"
            [ test "should convert basic types to strings" testTypeToStringBasic
            , test "should convert dual types to strings" testTypeToStringDual
            , test "should handle all type variants" testTypeToStringAllVariants
            ]
        , describe "Stats type"
            [ test "should create valid stats record" testStatsRecord
            , test "should handle zero values" testStatsZeroValues
            , test "should handle maximum values" testStatsMaxValues
            ]
        ]


testBasicTypes : () -> Expectation
testBasicTypes _ =
    let
        basicTypes = 
            [ NormalType, FightingType, FlyingType, PoisonType, GroundType
            , RockType, BugType, GhostType, SteelType, FireType, WaterType
            , GrassType, ElectricType, PsychicType, IceType, DragonType
            , DarkType, FairyType
            ]
        
        allValidStrings = List.all hasValidTypeString basicTypes
    in
    Expect.equal True allValidStrings


testDualTypes : () -> Expectation
testDualTypes _ =
    let
        dualTypes = 
            [ GrassPoison, FireFlying, WaterGround, ElectricFlying, FlyingPsychic
            , BugRock, GroundRock, PoisonGhost, IceFlying, FlyingDragon
            ]
        
        allValidStrings = List.all hasValidTypeString dualTypes
    in
    Expect.equal True allValidStrings


testSingleTypes : () -> Expectation
testSingleTypes _ =
    let
        fireTypeString = typeToString FireType
        waterTypeString = typeToString WaterType
        grassTypeString = typeToString GrassType
    in
    Expect.all
        [ \_ -> Expect.notEqual "" fireTypeString
        , \_ -> Expect.notEqual "" waterTypeString  
        , \_ -> Expect.notEqual "" grassTypeString
        , \_ -> Expect.notEqual fireTypeString waterTypeString
        ] ()


testTypeToStringBasic : () -> Expectation
testTypeToStringBasic _ =
    let
        normalString = typeToString NormalType
        fireString = typeToString FireType
        waterString = typeToString WaterType
        grassString = typeToString GrassType
        electricString = typeToString ElectricType
    in
    Expect.all
        [ \_ -> Expect.equal "ノーマル" normalString
        , \_ -> Expect.equal "ほのお" fireString
        , \_ -> Expect.equal "みず" waterString
        , \_ -> Expect.equal "くさ" grassString
        , \_ -> Expect.equal "でんき" electricString
        ] ()


testTypeToStringDual : () -> Expectation
testTypeToStringDual _ =
    let
        grassPoisonString = typeToString GrassPoison
        fireFlying = typeToString FireFlying
        waterGround = typeToString WaterGround
    in
    Expect.all
        [ \_ -> Expect.equal "くさ/どく" grassPoisonString
        , \_ -> Expect.equal "ほのお/ひこう" fireFlying
        , \_ -> Expect.equal "みず/じめん" waterGround
        ] ()


testTypeToStringAllVariants : () -> Expectation
testTypeToStringAllVariants _ =
    let
        allTypes = getAllPokemonTypes
        allStrings = List.map typeToString allTypes
        nonEmptyStrings = List.filter isNonEmptyString allStrings
        originalCount = List.length allStrings
        nonEmptyCount = List.length nonEmptyStrings
    in
    Expect.equal originalCount nonEmptyCount


testStatsRecord : () -> Expectation
testStatsRecord _ =
    let
        stats = Stats 100 120 80 90 85 95
        validStats = isValidStats stats
    in
    Expect.equal True validStats


testStatsZeroValues : () -> Expectation
testStatsZeroValues _ =
    let
        zeroStats = Stats 0 0 0 0 0 0
        validStats = areStatsNonNegative zeroStats
    in
    Expect.equal True validStats


testStatsMaxValues : () -> Expectation
testStatsMaxValues _ =
    let
        maxStats = Stats 255 255 255 255 255 255
        validStats = isValidStats maxStats
    in
    Expect.equal True validStats


-- ヘルパー関数（無名関数とパイプ演算子を避ける）
hasValidTypeString : PokemonType -> Bool
hasValidTypeString pokemonType =
    let
        typeString = typeToString pokemonType
    in
    not (String.isEmpty typeString)


getAllPokemonTypes : List PokemonType
getAllPokemonTypes =
    [ NormalType, FightingType, FlyingType, PoisonType, GroundType
    , RockType, BugType, GhostType, SteelType, FireType, WaterType
    , GrassType, ElectricType, PsychicType, IceType, DragonType
    , DarkType, FairyType, GrassPoison, FireFlying, WaterGround
    , ElectricFlying, FlyingPsychic, BugRock, GroundRock, PoisonGhost
    , IceFlying, FlyingDragon, PsychicSteel, FireSteel, WaterIce
    , GrassSteel, NormalElectric, PsychicFairy, BugSteel, FightingRock
    , FireGhost, IcePsychic, GroundDragon, FlyingDark, SteelFairy
    ]


isNonEmptyString : String -> Bool
isNonEmptyString str =
    not (String.isEmpty str)


isValidStats : Stats -> Bool
isValidStats stats =
    areStatsNonNegative stats && areStatsReasonable stats


areStatsNonNegative : Stats -> Bool
areStatsNonNegative stats =
    stats.hp >= 0 && stats.attack >= 0 && stats.defense >= 0 
        && stats.specialAttack >= 0 && stats.specialDefense >= 0 
        && stats.speed >= 0


areStatsReasonable : Stats -> Bool
areStatsReasonable stats =
    stats.hp <= 255 && stats.attack <= 255 && stats.defense <= 255
        && stats.specialAttack <= 255 && stats.specialDefense <= 255
        && stats.speed <= 255