module Route.SpeedTable exposing (ActionData, Data, Model, Msg, route, SpeedConfiguration(..), calculateSpeedForConfiguration, truncatePokemonName, calculatePositionSimple, findMinSpeedSimple, findMaxSpeedSimple, assignVerticalOffsetsSimple, calculateBaseStat, SimpleSpeedData)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import PagesMsg exposing (PagesMsg)
import Pages.PageUrl exposing (PageUrl)
import RouteBuilder exposing (App)
import Effect exposing (Effect)
import RouteBuilder exposing (StatefulRoute, single)
import Shared
import View exposing (View)
import Pokemon.Types exposing (Pokemon, Stats)
import Pokemon.UsageData exposing (selectTop50Pokemon)
import Pages.Url
import UrlPath exposing (UrlPath)


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


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    single
        { data = data
        , head = head
        }
        |> RouteBuilder.buildWithLocalState
            { view = view
            , init = init
            , update = update
            , subscriptions = subscriptions
            }


init : App Data ActionData RouteParams -> Shared.Model -> ( Model, Effect Msg )
init app shared =
    ( { isCompactMode = False }, Effect.none )


update : App Data ActionData RouteParams -> Shared.Model -> Msg -> Model -> ( Model, Effect Msg )
update app shared msg model =
    case msg of
        ToggleCompactMode ->
            ( { model | isCompactMode = not model.isCompactMode }, Effect.none )


subscriptions : RouteParams -> UrlPath -> Shared.Model -> Model -> Sub Msg
subscriptions routeParams urlPath shared model =
    Sub.none


data : BackendTask FatalError Data
data =
    BackendTask.succeed { pokemon = selectTop50Pokemon }


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Pokemon Master"
        , image =
            { url = Pages.Url.fromPath (UrlPath.join [ "images", "icon-png.png" ])
            , alt = "Speed Comparison Table"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Compare Pokemon speed stats with different configurations"
        , locale = Nothing
        , title = "Speed Comparison Table - Pokemon Master"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view static shared model =
    { title = "Speed Comparison Table"
    , body = [ viewSpeedTable model static.data.pokemon ]
    }


type SpeedConfiguration
    = BaseEV0
    | MaxEV252
    | MaxEVWithNature
    | MaxEVWithNatureAndItem


viewSpeedTable : Model -> List Pokemon -> Html (PagesMsg Msg)
viewSpeedTable model pokemonList =
    let
        baseEV0Data = List.map createBaseEV0SpeedData pokemonList
        maxEV252Data = List.map createMaxEV252SpeedData pokemonList
        maxEVWithNatureData = List.map createMaxEVWithNatureSpeedData pokemonList
        maxEVWithNatureAndItemData = List.map createMaxEVWithNatureAndItemSpeedData pokemonList

        baseEV0WithOffset = assignVerticalOffsetsSimple baseEV0Data
        maxEV252WithOffset = assignVerticalOffsetsSimple maxEV252Data
        maxEVWithNatureWithOffset = assignVerticalOffsetsSimple maxEVWithNatureData
        maxEVWithNatureAndItemWithOffset = assignVerticalOffsetsSimple maxEVWithNatureAndItemData

        allSpeeds = List.concat
            [ List.map .speed baseEV0WithOffset
            , List.map .speed maxEV252WithOffset
            , List.map .speed maxEVWithNatureWithOffset
            , List.map .speed maxEVWithNatureAndItemWithOffset
            ]
        minSpeed = List.minimum allSpeeds |> Maybe.withDefault 0
        maxSpeed = List.maximum allSpeeds |> Maybe.withDefault 200
    in
    div [ class "speed-scatter-container" ]
        [ h1 [] [ text "Speed Scatter Plot" ]
        , p [] [ text "素早さ実数値の散布図（使用率Top50）" ]
        , viewCompactModeToggle model.isCompactMode
        , div [ class "scatter-plot-wrapper" ]
            [ viewFourRows model.isCompactMode baseEV0WithOffset maxEV252WithOffset maxEVWithNatureWithOffset maxEVWithNatureAndItemWithOffset minSpeed maxSpeed
            ]
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
            , span [ class "toggle-label" ]
                [ text "名前を短縮表示" ]
            ]
        ]


type alias MultiSpeedData =
    { pokemon : Pokemon
    , baseEV0 : Int
    , maxEV252 : Int
    , baseEV0Offset : Int
    , maxEV252Offset : Int
    }


type alias SimpleSpeedData =
    { pokemon : Pokemon
    , speed : Int
    , verticalOffset : Int
    }


createMultiSpeedData : Pokemon -> MultiSpeedData
createMultiSpeedData pokemon =
    { pokemon = pokemon
    , baseEV0 = calculateSpeedForConfiguration pokemon BaseEV0
    , maxEV252 = calculateSpeedForConfiguration pokemon MaxEV252
    , baseEV0Offset = 0
    , maxEV252Offset = 0
    }


createBaseEV0SpeedData : Pokemon -> SimpleSpeedData
createBaseEV0SpeedData pokemon =
    { pokemon = pokemon
    , speed = calculateSpeedForConfiguration pokemon BaseEV0
    , verticalOffset = 0
    }


createMaxEV252SpeedData : Pokemon -> SimpleSpeedData
createMaxEV252SpeedData pokemon =
    { pokemon = pokemon
    , speed = calculateSpeedForConfiguration pokemon MaxEV252
    , verticalOffset = 0
    }


createMaxEVWithNatureSpeedData : Pokemon -> SimpleSpeedData
createMaxEVWithNatureSpeedData pokemon =
    { pokemon = pokemon
    , speed = calculateSpeedForConfiguration pokemon MaxEVWithNature
    , verticalOffset = 0
    }


createMaxEVWithNatureAndItemSpeedData : Pokemon -> SimpleSpeedData
createMaxEVWithNatureAndItemSpeedData pokemon =
    { pokemon = pokemon
    , speed = calculateSpeedForConfiguration pokemon MaxEVWithNatureAndItem
    , verticalOffset = 0
    }


assignVerticalOffsetsSimple : List SimpleSpeedData -> List SimpleSpeedData
assignVerticalOffsetsSimple speedDataList =
    let
        groupedBySpeed = groupBySpeedSimple speedDataList
        withOffsets = List.concatMap assignOffsetsToGroupSimple groupedBySpeed
    in
    withOffsets


groupBySpeedSimple : List SimpleSpeedData -> List (List SimpleSpeedData)
groupBySpeedSimple speedDataList =
    let
        sortedData = List.sortBy .speed speedDataList
        groupHelper currentSpeed currentGroup groups remainingData =
            case remainingData of
                [] ->
                    if List.isEmpty currentGroup then
                        groups
                    else
                        currentGroup :: groups

                first :: rest ->
                    if first.speed == currentSpeed then
                        groupHelper currentSpeed (first :: currentGroup) groups rest
                    else
                        let
                            newGroups =
                                if List.isEmpty currentGroup then
                                    groups
                                else
                                    currentGroup :: groups
                        in
                        groupHelper first.speed [first] newGroups rest
    in
    case sortedData of
        [] ->
            []

        first :: rest ->
            groupHelper first.speed [first] [] rest


assignOffsetsToGroupSimple : List SimpleSpeedData -> List SimpleSpeedData
assignOffsetsToGroupSimple group =
    List.indexedMap (\index item -> { item | verticalOffset = index * 25 }) group


assignMultipleVerticalOffsets : List MultiSpeedData -> List MultiSpeedData
assignMultipleVerticalOffsets speedDataList =
    let
        baseEV0GroupedBySpeed = groupBySpeedMulti .baseEV0 speedDataList
        maxEV252GroupedBySpeed = groupBySpeedMulti .maxEV252 speedDataList

        withBaseEV0Offsets = List.concatMap (assignOffsetsToGroupMulti .baseEV0 updateBaseEV0Offset) baseEV0GroupedBySpeed
        withAllOffsets = List.concatMap (assignOffsetsToGroupMulti .maxEV252 updateMaxEV252Offset) maxEV252GroupedBySpeed
    in
    mergeOffsets withBaseEV0Offsets withAllOffsets speedDataList


groupBySpeedMulti : (MultiSpeedData -> Int) -> List MultiSpeedData -> List (List MultiSpeedData)
groupBySpeedMulti speedSelector speedDataList =
    let
        sortedData = List.sortBy speedSelector speedDataList
        groupHelper currentSpeed currentGroup groups remainingData =
            case remainingData of
                [] ->
                    if List.isEmpty currentGroup then
                        groups
                    else
                        currentGroup :: groups

                first :: rest ->
                    if speedSelector first == currentSpeed then
                        groupHelper currentSpeed (first :: currentGroup) groups rest
                    else
                        let
                            newGroups =
                                if List.isEmpty currentGroup then
                                    groups
                                else
                                    currentGroup :: groups
                        in
                        groupHelper (speedSelector first) [first] newGroups rest
    in
    case sortedData of
        [] ->
            []

        first :: rest ->
            groupHelper (speedSelector first) [first] [] rest


assignOffsetsToGroupMulti : (MultiSpeedData -> Int) -> (Int -> MultiSpeedData -> MultiSpeedData) -> List MultiSpeedData -> List MultiSpeedData
assignOffsetsToGroupMulti speedSelector offsetUpdater group =
    List.indexedMap (\index item -> offsetUpdater (index * 25) item) group


updateBaseEV0Offset : Int -> MultiSpeedData -> MultiSpeedData
updateBaseEV0Offset offset speedData =
    { speedData | baseEV0Offset = offset }


updateMaxEV252Offset : Int -> MultiSpeedData -> MultiSpeedData
updateMaxEV252Offset offset speedData =
    { speedData | maxEV252Offset = offset }


mergeOffsets : List MultiSpeedData -> List MultiSpeedData -> List MultiSpeedData -> List MultiSpeedData
mergeOffsets baseOffsets maxOffsets originalData =
    originalData


findMinSpeedSimple : List SimpleSpeedData -> Int
findMinSpeedSimple speedDataList =
    List.map .speed speedDataList
        |> List.minimum
        |> Maybe.withDefault 0


findMaxSpeedSimple : List SimpleSpeedData -> Int
findMaxSpeedSimple speedDataList =
    List.map .speed speedDataList
        |> List.maximum
        |> Maybe.withDefault 200


viewFourRows : Bool -> List SimpleSpeedData -> List SimpleSpeedData -> List SimpleSpeedData -> List SimpleSpeedData -> Int -> Int -> Html (PagesMsg Msg)
viewFourRows isCompactMode baseEV0Data maxEV252Data maxEVWithNatureData maxEVWithNatureAndItemData minSpeed maxSpeed =
    div []
        [ viewSpeedRow isCompactMode "努力値252 + 性格1.1倍 + 持ち物1.5倍" maxEVWithNatureAndItemData minSpeed maxSpeed
        , viewSpeedRow isCompactMode "努力値252 + 性格1.1倍" maxEVWithNatureData minSpeed maxSpeed
        , viewSpeedRow isCompactMode "努力値252" maxEV252Data minSpeed maxSpeed
        , viewSpeedRow isCompactMode "努力値0" baseEV0Data minSpeed maxSpeed
        ]


viewTwoRows : Bool -> List SimpleSpeedData -> List SimpleSpeedData -> Int -> Int -> Html (PagesMsg Msg)
viewTwoRows isCompactMode baseEV0Data maxEV252Data minSpeed maxSpeed =
    div []
        [ viewSpeedRow isCompactMode "努力値252" maxEV252Data minSpeed maxSpeed
        , viewSpeedRow isCompactMode "努力値0" baseEV0Data minSpeed maxSpeed
        ]


viewSpeedRow : Bool -> String -> List SimpleSpeedData -> Int -> Int -> Html (PagesMsg Msg)
viewSpeedRow isCompactMode label speedDataList minSpeed maxSpeed =
    let
        sortedSpeedData = List.sortBy .speed speedDataList |> List.reverse
        pokemonElements = List.map (viewPokemonPointSimple isCompactMode minSpeed maxSpeed) sortedSpeedData
    in
    div [ class "single-row-container" ]
        [ div [ class "row-label-fixed" ] [ text label ]
        , div [ class "single-row" ]
            [ div [ class "row-points" ] pokemonElements
            ]
        ]


viewSingleRow : List SimpleSpeedData -> Int -> Int -> Html (PagesMsg Msg)
viewSingleRow speedDataList minSpeed maxSpeed =
    let
        pokemonElements = List.map (viewPokemonPointSimple False minSpeed maxSpeed) speedDataList
    in
    div [ class "single-row-container" ]
        [ div [ class "row-label-fixed" ] [ text "努力値0" ]
        , div [ class "single-row" ]
            [ div [ class "row-points" ] pokemonElements
            ]
        ]


viewPokemonPointSimple : Bool -> Int -> Int -> SimpleSpeedData -> Html (PagesMsg Msg)
viewPokemonPointSimple isCompactMode minSpeed maxSpeed speedData =
    let
        horizontalPosition = calculatePositionSimple speedData.speed minSpeed maxSpeed
        verticalOffset = speedData.verticalOffset
        displayName = truncatePokemonName isCompactMode speedData.pokemon.name
        compactClass =
            if isCompactMode then
                "pokemon-point compact"
            else
                "pokemon-point"
    in
    div
        [ class compactClass
        , style "left" (String.fromFloat horizontalPosition ++ "%")
        , style "top" ("calc(50% + " ++ String.fromInt verticalOffset ++ "px)")
        , style "transform" "translateY(-50%) translateX(-50%)"
        , title (speedData.pokemon.name ++ " (" ++ String.fromInt speedData.speed ++ " - offset: " ++ String.fromInt verticalOffset ++ ")")
        ]
        [ div [ class "pokemon-name" ] [ text displayName ]
        , div [ class "pokemon-speed" ] [ text (String.fromInt speedData.speed) ]
        , div [ class "pokemon-base-speed" ] [ text ("(" ++ String.fromInt speedData.pokemon.stats.speed ++ ")") ]
        ]


truncatePokemonName : Bool -> String -> String
truncatePokemonName isCompactMode name =
    if isCompactMode then
        String.left 2 name
    else
        name


calculatePositionSimple : Int -> Int -> Int -> Float
calculatePositionSimple speedValue minSpeed maxSpeed =
    let
        range = toFloat (maxSpeed - minSpeed)
        offset = toFloat (speedValue - minSpeed)
    in
    if range == 0 then
        50.0
    else
        (offset / range) * 100.0


calculateSpeedForConfiguration : Pokemon -> SpeedConfiguration -> Int
calculateSpeedForConfiguration pokemon config =
    let
        baseSpeed = pokemon.stats.speed
        level = 50
        iv = 31
    in
    case config of
        BaseEV0 ->
            calculateBaseStat baseSpeed iv 0 level 1.0 1.0

        MaxEV252 ->
            calculateBaseStat baseSpeed iv 252 level 1.0 1.0

        MaxEVWithNature ->
            calculateBaseStat baseSpeed iv 252 level 1.1 1.0

        MaxEVWithNatureAndItem ->
            calculateBaseStat baseSpeed iv 252 level 1.1 1.5


calculateBaseStat : Int -> Int -> Int -> Int -> Float -> Float -> Int
calculateBaseStat base iv ev level natureMultiplier itemMultiplier =
    let
        baseCalculation = ((base * 2 + iv + (ev // 4)) * level) // 100 + 5
        withNature = toFloat baseCalculation * natureMultiplier
        withItem = withNature * itemMultiplier
    in
    round withItem