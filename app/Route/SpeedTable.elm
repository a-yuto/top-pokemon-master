module Route.SpeedTable exposing
    ( ActionData
    , Data
    , Model
    , Msg
    , SimpleSpeedData
    , GroupedSpeedCard
    , GroupedPokemonEntry
    , SpeedConfiguration(..)
    , calculateBaseStat
    , calculateSpeedForConfiguration
    , calculateVerticalPosition
    , findMaxSpeedSimple
    , findMinSpeedSimple
    , groupSpeedDataBySpeed
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
    }


type alias ColumnDefinition =
    { label : String
    , speedData : List SimpleSpeedData
    }


type alias GroupedPokemonEntry =
    { pokemon : Pokemon
    , baseSpeed : Int
    }


type alias GroupedSpeedCard =
    { speed : Int
    , entries : List GroupedPokemonEntry
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
        sortedDescending =
            columnDefinition.speedData
                |> List.sortBy .speed
                |> List.reverse

        groupedCards = groupSpeedDataBySpeed sortedDescending
        guidelineViews = List.map (viewColumnGuideline minSpeed maxSpeed) axisTicks
        pokemonViews = List.map (viewGroupedSpeedCard isCompactMode minSpeed maxSpeed) groupedCards
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


viewGroupedSpeedCard : Bool -> Int -> Int -> GroupedSpeedCard -> Html (PagesMsg Msg)
viewGroupedSpeedCard isCompactMode minSpeed maxSpeed groupedCard =
    let
        verticalPosition = calculateVerticalPosition groupedCard.speed minSpeed maxSpeed
        positionText = String.fromFloat verticalPosition ++ "%"
        tooltip = buildGroupedTooltip groupedCard.entries groupedCard.speed
        entryViews = List.map (viewGroupedEntry isCompactMode) groupedCard.entries
        cardClass =
            if isCompactMode then
                "speed-card compact"
            else
                "speed-card"
    in
    div
        [ class cardClass
        , style "top" positionText
        , style "left" "50%"
        , style "transform" "translate(-50%, -50%)"
        , title tooltip
        ]
        [ div [ class "speed-card-speed" ] [ text (String.fromInt groupedCard.speed) ]
        , ul [ class "speed-card-entry-list" ] entryViews
        ]


viewGroupedEntry : Bool -> GroupedPokemonEntry -> Html msg
viewGroupedEntry isCompactMode entry =
    let
        displayName = truncatePokemonName isCompactMode entry.pokemon.name
        baseStatText = "基礎 " ++ String.fromInt entry.baseSpeed
    in
    li [ class "speed-card-entry" ]
        [ span [ class "speed-card-entry-name" ] [ text displayName ]
        , span [ class "speed-card-entry-base" ] [ text baseStatText ]
        ]


buildGroupedTooltip : List GroupedPokemonEntry -> Int -> String
buildGroupedTooltip entries speedValue =
    let
        buildLine entry =
            entry.pokemon.name
                ++ " / "
                ++ entry.pokemon.englishName
                ++ " (基礎 "
                ++ String.fromInt entry.baseSpeed
                ++ ")"

        lines = List.map buildLine entries
        joined = String.join ", " lines
    in
    "実数値 " ++ String.fromInt speedValue ++ " : " ++ joined


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


groupSpeedDataBySpeed : List SimpleSpeedData -> List GroupedSpeedCard
groupSpeedDataBySpeed speedDataList =
    let
        accumulate speedData accumulatedGroups =
            let
                entry =
                    { pokemon = speedData.pokemon
                    , baseSpeed = speedData.baseSpeed
                    }

                existing =
                    Dict.get speedData.speed accumulatedGroups
                        |> Maybe.withDefault []

                updated = entry :: existing
            in
            Dict.insert speedData.speed updated accumulatedGroups

        groupedDict =
            List.foldl accumulate Dict.empty speedDataList

        toGroupedCard ( speedValue, entries ) =
            let
                sortedEntries =
                    entries
                        |> List.sortBy (\entry -> ( entry.pokemon.name, entry.baseSpeed ))
            in
            { speed = speedValue
            , entries = sortedEntries
            }
    in
    groupedDict
        |> Dict.toList
        |> List.sortBy Tuple.first
        |> List.reverse
        |> List.map toGroupedCard


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
