module Route.SpeedTable exposing
    ( ActionData
    , Data
    , Model
    , Msg
    , SimpleSpeedData
    , SpeedConfiguration(..)
    , assignHorizontalOffsetsSimple
    , calculateBaseStat
    , calculateHorizontalOffset
    , calculateSpeedForConfiguration
    , calculateVerticalPosition
    , findMaxSpeedSimple
    , findMinSpeedSimple
    , route
    , truncatePokemonName
    )

import BackendTask exposing (BackendTask)
import Dict exposing (Dict)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Pokemon.Types exposing (Pokemon)
import Pokemon.UsageData exposing (selectTop50Pokemon)
import RouteBuilder exposing (App, StatefulRoute, single)
import Shared
import UrlPath exposing (UrlPath)
import View exposing (View)


type alias Model =
    { isCompactMode : Bool
    }


type Msg
    = ToggleCompactMode


type alias RouteParams =
    {}


type alias Data =
    { pokemon : List Pokemon
    }


type alias ActionData =
    {}


type alias SimpleSpeedData =
    { pokemon : Pokemon
    , speed : Int
    , baseSpeed : Int
    , horizontalOffset : Int
    }


type alias ColumnDefinition =
    { label : String
    , speedData : List SimpleSpeedData
    }


type SpeedConfiguration
    = BaseEV0
    | MaxEV252
    | MaxEVWithNature
    | MaxEVWithNatureAndItem


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    let
        definition =
            single
                { data = data
                , head = head
                }
    in
    RouteBuilder.buildWithLocalState
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
        definition


init : App Data ActionData RouteParams -> Shared.Model -> ( Model, Effect Msg )
init _ _ =
    ( { isCompactMode = False }, Effect.none )


update : App Data ActionData RouteParams -> Shared.Model -> Msg -> Model -> ( Model, Effect Msg )
update _ _ msg model =
    case msg of
        ToggleCompactMode ->
            ( { model | isCompactMode = not model.isCompactMode }, Effect.none )


subscriptions : RouteParams -> UrlPath -> Shared.Model -> Model -> Sub Msg
subscriptions _ _ _ _ =
    Sub.none


data : BackendTask FatalError Data
data =
    BackendTask.succeed { pokemon = selectTop50Pokemon }


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head _ =
    let
        summary =
            Seo.summary
                { canonicalUrlOverride = Nothing
                , siteName = "Pokemon Master"
                , image =
                    { url = Pages.Url.fromPath (UrlPath.join [ "images", "icon-png.png" ])
                    , alt = "Speed Comparison"
                    , dimensions = Nothing
                    , mimeType = Nothing
                    }
                , description = "Compare Pokemon speed stats for multiple configurations."
                , locale = Nothing
                , title = "Speed Comparison - Pokemon Master"
                }
    in
    Seo.website summary


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view static _ model =
    { title = "Speed Comparison"
    , body = [ viewSpeedComparison model static.data.pokemon ]
    }


viewSpeedComparison : Model -> List Pokemon -> Html (PagesMsg Msg)
viewSpeedComparison model pokemonList =
    let
        baseEV0Column = createColumnDefinition "努力値0" (createBaseEV0ColumnData pokemonList)
        maxEV252Column = createColumnDefinition "努力値252" (createMaxEV252ColumnData pokemonList)
        maxEVWithNatureColumn = createColumnDefinition "努力値252 性格1.1倍" (createMaxEVWithNatureColumnData pokemonList)
        maxEVWithNatureAndItemColumn = createColumnDefinition "努力値252 性格1.1倍 持ち物1.5倍" (createMaxEVWithNatureAndItemColumnData pokemonList)
        columnList =
            [ baseEV0Column
            , maxEV252Column
            , maxEVWithNatureColumn
            , maxEVWithNatureAndItemColumn
            ]
        minSpeed = determineOverallMinimum columnList
        maxSpeed = determineOverallMaximum columnList
        axisTicks = generateAxisTicks minSpeed maxSpeed
        columnViews = buildColumnViews model.isCompactMode minSpeed maxSpeed axisTicks columnList
    in
    div [ class "speed-comparison-container" ]
        [ h1 [] [ text "Speed Comparison Board" ]
        , p [] [ text "使用率上位50匹の素早さを4種類の設定で縦方向に比較できます。" ]
        , viewCompactModeToggle model.isCompactMode
        , div [ class "speed-comparison-visual" ]
            (viewSpeedAxis minSpeed maxSpeed axisTicks :: columnViews)
        ]


viewCompactModeToggle : Bool -> Html (PagesMsg Msg)
viewCompactModeToggle isCompactMode =
    div [ class "compact-mode-toggle" ]
        [ label []
            [ input
                [ type_ "checkbox"
                , checked isCompactMode
                , onClick (PagesMsg.fromMsg ToggleCompactMode)
                ]
                []
            , span [ class "toggle-label" ] [ text "名前を短縮表示" ]
            ]
        ]


createColumnDefinition : String -> List SimpleSpeedData -> ColumnDefinition
createColumnDefinition label speedDataList =
    { label = label
    , speedData = speedDataList
    }


createBaseEV0ColumnData : List Pokemon -> List SimpleSpeedData
createBaseEV0ColumnData pokemonList =
    List.map createBaseEV0SpeedData pokemonList


createMaxEV252ColumnData : List Pokemon -> List SimpleSpeedData
createMaxEV252ColumnData pokemonList =
    List.map createMaxEV252SpeedData pokemonList


createMaxEVWithNatureColumnData : List Pokemon -> List SimpleSpeedData
createMaxEVWithNatureColumnData pokemonList =
    List.map createMaxEVWithNatureSpeedData pokemonList


createMaxEVWithNatureAndItemColumnData : List Pokemon -> List SimpleSpeedData
createMaxEVWithNatureAndItemColumnData pokemonList =
    List.map createMaxEVWithNatureAndItemSpeedData pokemonList


buildColumnViews : Bool -> Int -> Int -> List Int -> List ColumnDefinition -> List (Html (PagesMsg Msg))
buildColumnViews isCompactMode minSpeed maxSpeed axisTicks columnDefinitions =
    List.map (buildColumnView isCompactMode minSpeed maxSpeed axisTicks) columnDefinitions


buildColumnView : Bool -> Int -> Int -> List Int -> ColumnDefinition -> Html (PagesMsg Msg)
buildColumnView isCompactMode minSpeed maxSpeed axisTicks columnDefinition =
    viewSpeedColumn isCompactMode columnDefinition minSpeed maxSpeed axisTicks


viewSpeedAxis : Int -> Int -> List Int -> Html msg
viewSpeedAxis minSpeed maxSpeed axisTicks =
    let
        tickViews = List.map (viewAxisTick minSpeed maxSpeed) axisTicks
    in
    div [ class "speed-axis" ]
        tickViews


viewAxisTick : Int -> Int -> Int -> Html msg
viewAxisTick minSpeed maxSpeed tickValue =
    let
        position = calculateVerticalPosition tickValue minSpeed maxSpeed
        positionText = String.fromFloat position ++ "%"
        tickLabel = String.fromInt tickValue
    in
    div
        [ class "speed-axis-tick"
        , style "top" positionText
        ]
        [ span [ class "speed-axis-mark" ] []
        , span [ class "speed-axis-label" ] [ text tickLabel ]
        ]


viewSpeedColumn : Bool -> ColumnDefinition -> Int -> Int -> List Int -> Html (PagesMsg Msg)
viewSpeedColumn isCompactMode columnDefinition minSpeed maxSpeed axisTicks =
    let
        sortedAscending = List.sortBy .speed columnDefinition.speedData
        sortedDescending = List.reverse sortedAscending
        withOffsets = assignHorizontalOffsetsSimple sortedDescending
        guidelineViews = List.map (viewColumnGuideline minSpeed maxSpeed) axisTicks
        pokemonViews = List.map (viewPokemonPointSimple isCompactMode minSpeed maxSpeed) withOffsets
    in
    div [ class "speed-column" ]
        [ div [ class "speed-column-header" ] [ text columnDefinition.label ]
        , div [ class "speed-column-body" ]
            [ div [ class "speed-column-guidelines" ] guidelineViews
            , div [ class "speed-column-points" ] pokemonViews
            ]
        ]


viewColumnGuideline : Int -> Int -> Int -> Html msg
viewColumnGuideline minSpeed maxSpeed tickValue =
    let
        position = calculateVerticalPosition tickValue minSpeed maxSpeed
        positionText = String.fromFloat position ++ "%"
    in
    div
        [ class "speed-column-guideline"
        , style "top" positionText
        ]
        []


viewPokemonPointSimple : Bool -> Int -> Int -> SimpleSpeedData -> Html (PagesMsg Msg)
viewPokemonPointSimple isCompactMode minSpeed maxSpeed speedData =
    let
        verticalPosition = calculateVerticalPosition speedData.speed minSpeed maxSpeed
        horizontalOffset = speedData.horizontalOffset
        displayName = truncatePokemonName isCompactMode speedData.pokemon.name
        horizontalPositionText =
            if horizontalOffset >= 0 then
                "calc(50% + " ++ String.fromInt horizontalOffset ++ "px)"
            else
                "calc(50% - " ++ String.fromInt (abs horizontalOffset) ++ "px)"

        tooltip =
            speedData.pokemon.name
                ++ " / "
                ++ speedData.pokemon.englishName
                ++ " : "
                ++ String.fromInt speedData.speed
                ++ " (基礎 "
                ++ String.fromInt speedData.baseSpeed
                ++ ")"

        compactClass =
            if isCompactMode then
                "pokemon-point compact"
            else
                "pokemon-point"
    in
    div
        [ class compactClass
        , style "top" (String.fromFloat verticalPosition ++ "%")
        , style "left" horizontalPositionText
        , title tooltip
        ]
        [ div [ class "pokemon-name" ] [ text displayName ]
        , div [ class "pokemon-speed" ] [ text (String.fromInt speedData.speed) ]
        , div [ class "pokemon-base-speed" ] [ text ("基礎 " ++ String.fromInt speedData.baseSpeed) ]
        ]


createBaseEV0SpeedData : Pokemon -> SimpleSpeedData
createBaseEV0SpeedData pokemon =
    createSpeedDataWithConfiguration pokemon BaseEV0


createMaxEV252SpeedData : Pokemon -> SimpleSpeedData
createMaxEV252SpeedData pokemon =
    createSpeedDataWithConfiguration pokemon MaxEV252


createMaxEVWithNatureSpeedData : Pokemon -> SimpleSpeedData
createMaxEVWithNatureSpeedData pokemon =
    createSpeedDataWithConfiguration pokemon MaxEVWithNature


createMaxEVWithNatureAndItemSpeedData : Pokemon -> SimpleSpeedData
createMaxEVWithNatureAndItemSpeedData pokemon =
    createSpeedDataWithConfiguration pokemon MaxEVWithNatureAndItem


createSpeedDataWithConfiguration : Pokemon -> SpeedConfiguration -> SimpleSpeedData
createSpeedDataWithConfiguration pokemon configuration =
    { pokemon = pokemon
    , speed = calculateSpeedForConfiguration pokemon configuration
    , baseSpeed = pokemon.stats.speed
    , horizontalOffset = 0
    }


calculateSpeedForConfiguration : Pokemon -> SpeedConfiguration -> Int
calculateSpeedForConfiguration pokemon configuration =
    let
        baseSpeed = pokemon.stats.speed
        level = 50
        individualValue = 31
    in
    case configuration of
        BaseEV0 ->
            calculateBaseStat baseSpeed individualValue 0 level 1.0 1.0

        MaxEV252 ->
            calculateBaseStat baseSpeed individualValue 252 level 1.0 1.0

        MaxEVWithNature ->
            calculateBaseStat baseSpeed individualValue 252 level 1.1 1.0

        MaxEVWithNatureAndItem ->
            calculateBaseStat baseSpeed individualValue 252 level 1.1 1.5


calculateBaseStat : Int -> Int -> Int -> Int -> Float -> Float -> Int
calculateBaseStat baseStat individualValue effortValue level natureMultiplier itemMultiplier =
    let
        baseCalculation =
            ((baseStat * 2 + individualValue + (effortValue // 4)) * level) // 100 + 5
        withNature = toFloat baseCalculation * natureMultiplier
        withItem = withNature * itemMultiplier
    in
    round withItem


calculateVerticalPosition : Int -> Int -> Int -> Float
calculateVerticalPosition speedValue minSpeed maxSpeed =
    let
        range = toFloat (maxSpeed - minSpeed)
        offset = toFloat (speedValue - minSpeed)
    in
    if range == 0 then
        50.0
    else
        100.0 - ((offset / range) * 100.0)


assignHorizontalOffsetsSimple : List SimpleSpeedData -> List SimpleSpeedData
assignHorizontalOffsetsSimple speedDataList =
    let
        groupSizes = calculateGroupSizes speedDataList
        assignStep speedData state =
            assignOffsetToSpeedData speedData groupSizes state

        initialState =
            ( Dict.empty, [] )

        finalState =
            List.foldl assignStep initialState speedDataList
    in
    case finalState of
        ( _, reversedList ) ->
            List.reverse reversedList


assignOffsetToSpeedData :
    SimpleSpeedData
    -> Dict Int Int
    -> ( Dict Int Int, List SimpleSpeedData )
    -> ( Dict Int Int, List SimpleSpeedData )
assignOffsetToSpeedData speedData groupSizes ( usedCounts, assignedList ) =
    let
        speedValue = speedData.speed
        totalCount =
            case Dict.get speedValue groupSizes of
                Just count ->
                    count

                Nothing ->
                    1

        usedCount =
            case Dict.get speedValue usedCounts of
                Just count ->
                    count

                Nothing ->
                    0

        offset = calculateHorizontalOffset usedCount totalCount
        updatedSpeedData = { speedData | horizontalOffset = offset }
        updatedUsedCounts = Dict.insert speedValue (usedCount + 1) usedCounts
    in
    ( updatedUsedCounts, updatedSpeedData :: assignedList )


calculateGroupSizes : List SimpleSpeedData -> Dict Int Int
calculateGroupSizes speedDataList =
    let
        updateGroupSizes speedData currentDict =
            let
                speedValue = speedData.speed
                existingCount =
                    case Dict.get speedValue currentDict of
                        Just value ->
                            value

                        Nothing ->
                            0
            in
            Dict.insert speedValue (existingCount + 1) currentDict
    in
    List.foldl updateGroupSizes Dict.empty speedDataList


calculateHorizontalOffset : Int -> Int -> Int
calculateHorizontalOffset index groupSize =
    let
        spacing = 48
        centerOffset = ((groupSize - 1) * spacing) // 2
        rawOffset = index * spacing
    in
    rawOffset - centerOffset


findMinSpeedSimple : List SimpleSpeedData -> Int
findMinSpeedSimple speedDataList =
    let
        speeds = List.map .speed speedDataList
    in
    case List.minimum speeds of
        Just value ->
            value

        Nothing ->
            0


findMaxSpeedSimple : List SimpleSpeedData -> Int
findMaxSpeedSimple speedDataList =
    let
        speeds = List.map .speed speedDataList
    in
    case List.maximum speeds of
        Just value ->
            value

        Nothing ->
            200


determineOverallMinimum : List ColumnDefinition -> Int
determineOverallMinimum columnDefinitions =
    let
        collectMinimum columnDefinition =
            findMinSpeedSimple columnDefinition.speedData

        minimumValues = List.map collectMinimum columnDefinitions
    in
    case List.minimum minimumValues of
        Just value ->
            value

        Nothing ->
            0


determineOverallMaximum : List ColumnDefinition -> Int
determineOverallMaximum columnDefinitions =
    let
        collectMaximum columnDefinition =
            findMaxSpeedSimple columnDefinition.speedData

        maximumValues = List.map collectMaximum columnDefinitions
    in
    case List.maximum maximumValues of
        Just value ->
            value

        Nothing ->
            200


generateAxisTicks : Int -> Int -> List Int
generateAxisTicks minSpeed maxSpeed =
    if maxSpeed <= minSpeed then
        [ minSpeed ]
    else
        let
            stepCount =
                3

            difference = maxSpeed - minSpeed
            rawStep = difference // stepCount
            baseStep =
                if rawStep <= 0 then
                    1
                else
                    rawStep

            step = baseStep * 3
            buildTick index =
                minSpeed + index * step

            indices = List.range 0 stepCount
            preliminaryTicks = List.map buildTick indices
            ticksWithMax =
                if List.member maxSpeed preliminaryTicks then
                    preliminaryTicks
                else
                    preliminaryTicks ++ [ maxSpeed ]
        in
        removeDuplicateTicks (List.sort ticksWithMax)


removeDuplicateTicks : List Int -> List Int
removeDuplicateTicks sortedTicks =
    case sortedTicks of
        [] ->
            []

        first :: rest ->
            first :: removeDuplicateTicks (dropWhileEqual first rest)


dropWhileEqual : Int -> List Int -> List Int
dropWhileEqual target remaining =
    case remaining of
        [] ->
            []

        first :: rest ->
            if first == target then
                dropWhileEqual target rest
            else
                first :: rest


truncatePokemonName : Bool -> String -> String
truncatePokemonName isCompactMode name =
    if isCompactMode then
        String.left 2 name
    else
        name
