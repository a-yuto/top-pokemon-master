module Route.SpeedQuiz exposing
    ( ActionData
    , Data
    , Model
    , Msg
    , route
    , shouldRevealRealStats
    , getPokemonFromKata
    , getDefaultPokemon
    , getArrayElementSafely
    )

import Array
import BackendTask exposing (BackendTask)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Pokemon.Data exposing (findPokemonById)
import Pokemon.Types exposing (Pokemon, PokemonType(..))
import Pokemon.UsageData as UsageData
import Pokemon.BattleTypes exposing (BattleKata, calculateRealStats, Nature(..), getNatureBonus, StatType(..))
import WeightedRandom
import Process
import Random
import RouteBuilder exposing (App, StatefulRoute)
import Shared
import Task
import UrlPath exposing (UrlPath)
import View exposing (View)


type alias Model =
    { quizMode : QuizMode
    , currentQuestion : Maybe Question
    , previousQuestion : Maybe Question
    , totalQuestions : Int
    , correctAnswers : Int
    , showResult : Bool
    , lastResult : Maybe Result
    , isWaitingForNext : Bool
    }


type QuizMode
    = BaseStatsMode
    | RealStatsMode


type alias Question =
    { mode : QuizMode
    , questionData : QuestionData
    }


-- 2つのモードを統合することで、同一画面でシームレスなモード切り替えを実現
type QuestionData
    = BaseStatsData Pokemon Pokemon
    | RealStatsData BattleKata BattleKata


type Result
    = Correct
    | Incorrect


type Msg
    = ChangeMode QuizMode
    | SelectPokemon Pokemon
    | SelectBattleKata BattleKata
    | SelectSame
    | GenerateNewQuestion
    | NewQuestion Question
    | ShowNextQuestion


type alias RouteParams =
    {}


type alias Data =
    {}


type alias ActionData =
    {}


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildWithLocalState
            { init = init
            , update = update
            , view = view
            , subscriptions = subscriptions
            }


init : App Data ActionData RouteParams -> Shared.Model -> ( Model, Effect Msg )
init app shared =
    ( { quizMode = BaseStatsMode
      , currentQuestion = Nothing
      , previousQuestion = Nothing
      , totalQuestions = 0
      , correctAnswers = 0
      , showResult = False
      , lastResult = Nothing
      , isWaitingForNext = False
      }
    , Effect.fromCmd (Random.generate NewQuestion (generateRandomQuestion BaseStatsMode))
    )


update : App Data ActionData RouteParams -> Shared.Model -> Msg -> Model -> ( Model, Effect Msg )
update app shared msg model =
    case msg of
        ChangeMode newMode ->
            ( { model 
                | quizMode = newMode
                , currentQuestion = Nothing
                , showResult = False
                , isWaitingForNext = False
              }
            , Effect.fromCmd (Random.generate NewQuestion (generateRandomQuestion newMode))
            )

        NewQuestion question ->
            ( { model 
                | currentQuestion = Just question
                , isWaitingForNext = False
              }
            , Effect.none
            )

        GenerateNewQuestion ->
            ( model, Effect.fromCmd (Random.generate NewQuestion (generateRandomQuestion model.quizMode)) )

        SelectPokemon selectedPokemon ->
            case model.currentQuestion of
                Just question ->
                    case question.questionData of
                        BaseStatsData pokemon1 pokemon2 ->
                            let
                                isCorrect =
                                    (selectedPokemon.id == pokemon1.id && pokemon1.stats.speed > pokemon2.stats.speed)
                                        || (selectedPokemon.id == pokemon2.id && pokemon2.stats.speed > pokemon1.stats.speed)
                                        || (selectedPokemon.id == pokemon1.id && pokemon1.stats.speed == pokemon2.stats.speed)
                                        || (selectedPokemon.id == pokemon2.id && pokemon1.stats.speed == pokemon2.stats.speed)
                            in
                            handleQuizResult model isCorrect
                        
                        _ ->
                            ( model, Effect.none )
                
                Nothing ->
                    ( model, Effect.none )

        SelectBattleKata selectedKata ->
            case model.currentQuestion of
                Just question ->
                    case question.questionData of
                        RealStatsData kata1 kata2 ->
                            let
                                pokemon1 = getPokemonFromKata kata1
                                pokemon2 = getPokemonFromKata kata2
                                realStats1 = calculateRealStats kata1 pokemon1
                                realStats2 = calculateRealStats kata2 pokemon2
                                
                                isCorrect =
                                    (selectedKata.pokemonId == kata1.pokemonId && realStats1.speed > realStats2.speed)
                                        || (selectedKata.pokemonId == kata2.pokemonId && realStats2.speed > realStats1.speed)
                                        || (selectedKata.pokemonId == kata1.pokemonId && realStats1.speed == realStats2.speed)
                                        || (selectedKata.pokemonId == kata2.pokemonId && realStats1.speed == realStats2.speed)
                            in
                            handleQuizResult model isCorrect
                        
                        _ ->
                            ( model, Effect.none )
                
                Nothing ->
                    ( model, Effect.none )

        SelectSame ->
            case model.currentQuestion of
                Just question ->
                    let
                        isCorrect = isSpeedEqual question
                    in
                    handleQuizResult model isCorrect
                
                Nothing ->
                    ( model, Effect.none )

        ShowNextQuestion ->
            ( model
            , Effect.fromCmd (Random.generate NewQuestion (generateRandomQuestion model.quizMode))
            )


subscriptions : RouteParams -> UrlPath -> Shared.Model -> Model -> Sub Msg
subscriptions routeParams path shared model =
    Sub.none


data : BackendTask FatalError Data
data =
    BackendTask.succeed {}


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Top Pokemon"
        , image =
            { url = Pages.Url.fromPath (UrlPath.join [ "images", "icon-png.png" ])
            , alt = "Top Pokemon logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "ポケモン素早さクイズ"
        , locale = Nothing
        , title = "ポケモン素早さクイズ - Top Pokemon"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view app shared model =
    { title = "ポケモン素早さクイズ"
    , body =
        [ Html.div [ Attr.class "speed-quiz-container" ]
            [ viewQuizHeader model
            , viewQuizArea model
            ]
        ]
    }


viewQuizHeader : Model -> Html (PagesMsg Msg)
viewQuizHeader model =
    let
        correctRate =
            if model.totalQuestions == 0 then
                0
            else
                toFloat model.correctAnswers / toFloat model.totalQuestions * 100
    in
    Html.div [ Attr.class "quiz-header" ]
        [ Html.h1 [] [ Html.text "ポケモン素早さクイズ" ]
        , viewModeSelector model
        , Html.div [ Attr.class "score-display" ]
            [ Html.text <|
                "累積: "
                    ++ String.fromInt model.correctAnswers
                    ++ "/"
                    ++ String.fromInt model.totalQuestions
                    ++ "問正解 ("
                    ++ String.fromInt (round correctRate)
                    ++ "%)"
            ]
        ]


viewModeSelector : Model -> Html (PagesMsg Msg)
viewModeSelector model =
    Html.map PagesMsg.fromMsg <|
        Html.div [ Attr.class "mode-selector" ]
            [ Html.div [ Attr.class "mode-buttons" ]
                [ Html.button
                    [ Html.Events.onClick (ChangeMode BaseStatsMode)
                    , Attr.class <|
                        if model.quizMode == BaseStatsMode then
                            "mode-button active"
                        else
                            "mode-button"
                    , Attr.disabled model.isWaitingForNext
                    ]
                    [ Html.text "種族値クイズ" ]
                , Html.button
                    [ Html.Events.onClick (ChangeMode RealStatsMode)
                    , Attr.class <|
                        if model.quizMode == RealStatsMode then
                            "mode-button active"
                        else
                            "mode-button"
                    , Attr.disabled model.isWaitingForNext
                    ]
                    [ Html.text "実数値クイズ" ]
                ]
            , Html.div [ Attr.class "mode-description" ]
                [ Html.text <|
                    case model.quizMode of
                        BaseStatsMode ->
                            "ポケモンの種族値での素早さを比較します"
                        
                        RealStatsMode ->
                            "努力値・性格・個体値を含む実数値での素早さを比較します"
                ]
            ]


viewQuizArea : Model -> Html (PagesMsg Msg)
viewQuizArea model =
    case model.currentQuestion of
        Just question ->
            Html.div [ Attr.class "quiz-area" ]
                [ viewPokemonBattle question model
                , viewResult model.previousQuestion model
                ]

        Nothing ->
            Html.div [ Attr.class "quiz-area" ]
                [ Html.p [] [ Html.text "問題を準備中..." ]
                ]


viewPokemonBattle : Question -> Model -> Html (PagesMsg Msg)
viewPokemonBattle question model =
    case question.questionData of
        BaseStatsData pokemon1 pokemon2 ->
            Html.div [ Attr.class "pokemon-battle" ]
                [ viewPokemonButton pokemon1 model
                , Html.div [ Attr.class "vs-text" ] [ Html.text "VS" ]
                , viewPokemonButton pokemon2 model
                , Html.map PagesMsg.fromMsg 
                    (Html.div [ Attr.class "same-speed-container" ]
                        [ Html.button
                            [ Html.Events.onClick SelectSame
                            , Attr.class "same-speed-button"
                            , Attr.disabled model.isWaitingForNext
                            ]
                            [ Html.text "同じ速さ" ]
                        ])
                ]
        
        RealStatsData kata1 kata2 ->
            Html.div [ Attr.class "pokemon-battle" ]
                [ viewBattleKataButton kata1 model
                , Html.div [ Attr.class "vs-text" ] [ Html.text "VS" ]
                , viewBattleKataButton kata2 model
                , Html.map PagesMsg.fromMsg 
                    (Html.div [ Attr.class "same-speed-container" ]
                        [ Html.button
                            [ Html.Events.onClick SelectSame
                            , Attr.class "same-speed-button"
                            , Attr.disabled model.isWaitingForNext
                            ]
                            [ Html.text "同じ速さ" ]
                        ])
                ]


viewPokemonButton : Pokemon -> Model -> Html (PagesMsg Msg)
viewPokemonButton pokemon model =
    Html.map PagesMsg.fromMsg 
        (Html.button
            [ Html.Events.onClick (SelectPokemon pokemon)
            , Attr.class "pokemon-button"
            , Attr.disabled model.isWaitingForNext
            ]
            [ Html.text pokemon.name
            ])


shouldRevealRealStats : Bool -> Bool
shouldRevealRealStats isWaitingForNext =
    isWaitingForNext


-- 実数値モードの素早さは解答後にのみ表示
viewBattleKataButton : BattleKata -> Model -> Html (PagesMsg Msg)
viewBattleKataButton kata model =
    let
        pokemon = getPokemonFromKata kata
        -- 実例: Lv50, 種族値45, 努力値0, 個体値31, 性格補正なし → 65
        realStats = calculateRealStats kata pokemon
        speedEffortValue = kata.effortValues.speed
        natureBonus = getNatureBonus kata.nature Speed
        isNeutralNature = natureBonus == 1
        bonusText =
            if isNeutralNature then
                "1.0"
            else
                String.fromFloat natureBonus
        natureLabel =
            case kata.nature of
                Hardy -> "がんばりや"
                Lonely -> "さみしがり"
                Brave -> "ゆうかん"
                Adamant -> "いじっぱり"
                Naughty -> "やんちゃ"
                Bold -> "ずぶとい"
                Docile -> "すなお"
                Relaxed -> "のんき"
                Impish -> "わんぱく"
                Lax -> "のうてんき"
                Timid -> "おくびょう"
                Hasty -> "せっかち"
                Serious -> "まじめ"
                Jolly -> "ようき"
                Naive -> "むじゃき"
                Modest -> "ひかえめ"
                Mild -> "おっとり"
                Quiet -> "れいせい"
                Bashful -> "てれや"
                Rash -> "うっかりや"
                Calm -> "おだやか"
                Gentle -> "おとなしい"
                Sassy -> "なまいき"
                Careful -> "しんちょう"
                Quirky -> "きまぐれ"
        heldItemDescription =
            case kata.heldItemId of
                Just _ ->
                    "持ち物補正: あり"

                Nothing ->
                    "持ち物補正: なし"
        effortDescription = "努力値(素早さ): " ++ String.fromInt speedEffortValue
        natureDescription = "性格補正: " ++ bonusText ++ "倍 (" ++ natureLabel ++ ")"
        detailElements =
            [ Html.div [ Attr.class "pokemon-name" ] [ Html.text pokemon.name ]
            , Html.div [ Attr.class "kata-detail" ] [ Html.text effortDescription ]
            , Html.div [ Attr.class "kata-detail" ] [ Html.text natureDescription ]
            , Html.div [ Attr.class "kata-detail" ] [ Html.text heldItemDescription ]
            ]
        elementsWithResult =
            if shouldRevealRealStats model.isWaitingForNext then
                detailElements
                    ++ [ Html.div [ Attr.class "speed-value" ]
                            [ Html.text ("素早さ: " ++ String.fromInt realStats.speed) ]
                       ]
            else
                detailElements
    in
    Html.map PagesMsg.fromMsg 
        (Html.button
            [ Html.Events.onClick (SelectBattleKata kata)
            , Attr.class "pokemon-button"
            , Attr.disabled model.isWaitingForNext
            ]
            [ Html.div [] elementsWithResult ]
        )


viewResult : Maybe Question -> Model -> Html (PagesMsg Msg)
viewResult previousQuestion model =
    Html.map PagesMsg.fromMsg <|
        case ( model.showResult, model.lastResult, previousQuestion ) of
            ( True, Just result, Just question ) ->
                Html.div [ Attr.class "quiz-result" ]
                [ Html.div
                    [ Attr.class <|
                        case result of
                            Correct ->
                                "result-text correct"

                            Incorrect ->
                                "result-text incorrect"
                    ]
                    [ Html.div [ Attr.class "result-icon" ]
                        [ Html.text <|
                            case result of
                                Correct ->
                                    "◯"

                                Incorrect ->
                                    "✕"
                        ]
                    , Html.div [ Attr.class "result-message" ]
                        [ Html.text <|
                            case result of
                                Correct ->
                                    "正解！"

                                Incorrect ->
                                    "不正解"
                        ]
                    ]
                , viewSpeedComparison question
                ]

            _ ->
                Html.text ""


viewSpeedComparison : Question -> Html msg
viewSpeedComparison question =
    case question.questionData of
        BaseStatsData pokemon1 pokemon2 ->
            Html.div [ Attr.class "speed-values" ]
                [ Html.text <|
                    pokemon1.name
                        ++ ": "
                        ++ String.fromInt pokemon1.stats.speed
                        ++ " / "
                        ++ pokemon2.name
                        ++ ": "
                        ++ String.fromInt pokemon2.stats.speed
                ]
        
        RealStatsData kata1 kata2 ->
            let
                pokemon1 = getPokemonFromKata kata1
                pokemon2 = getPokemonFromKata kata2
                realStats1 = calculateRealStats kata1 pokemon1
                realStats2 = calculateRealStats kata2 pokemon2
            in
            Html.div [ Attr.class "speed-values" ]
                [ Html.text <|
                    pokemon1.name
                        ++ ": "
                        ++ String.fromInt realStats1.speed
                        ++ " / "
                        ++ pokemon2.name
                        ++ ": "
                        ++ String.fromInt realStats2.speed
                ]


-- 解答結果を処理して2秒後に次の問題へ自動遷移
handleQuizResult : Model -> Bool -> ( Model, Effect Msg )
handleQuizResult model isCorrect =
    let
        newCorrectAnswers =
            if isCorrect then
                model.correctAnswers + 1
            else
                model.correctAnswers

        result =
            if isCorrect then
                Correct
            else
                Incorrect
    in
    ( { model
        | totalQuestions = model.totalQuestions + 1
        , correctAnswers = newCorrectAnswers
        , showResult = True
        , lastResult = Just result
        , previousQuestion = model.currentQuestion
        , isWaitingForNext = True
      }
    , Effect.fromCmd (Process.sleep 2000 |> Task.perform showNextQuestionTask)
    )


isSpeedEqual : Question -> Bool
isSpeedEqual question =
    case question.questionData of
        BaseStatsData pokemon1 pokemon2 ->
            pokemon1.stats.speed == pokemon2.stats.speed
        
        RealStatsData kata1 kata2 ->
            let
                pokemon1 = getPokemonFromKata kata1
                pokemon2 = getPokemonFromKata kata2
                realStats1 = calculateRealStats kata1 pokemon1
                realStats2 = calculateRealStats kata2 pokemon2
            in
            realStats1.speed == realStats2.speed


getPokemonFromKata : BattleKata -> Pokemon
getPokemonFromKata kata =
    case findPokemonById kata.pokemonId of
        Just pokemon -> pokemon
        Nothing -> getDefaultPokemon (Array.fromList UsageData.selectTop150Pokemon)


showNextQuestionTask : () -> Msg
showNextQuestionTask _ =
    ShowNextQuestion


getArrayElement : Int -> Array.Array a -> Maybe a
getArrayElement index array =
    Array.get index array


getDefaultPokemon : Array.Array Pokemon -> Pokemon
getDefaultPokemon pokemonArray =
    case Array.get 0 pokemonArray of
        Just pokemon ->
            pokemon
        
        Nothing ->
            -- フォールバック: ディンルー (使用率1位)
            { id = 1003
            , name = "ディンルー"
            , englishName = "ディンルー"
            , pokemonType = GroundDark
            , stats = { hp = 155, attack = 110, defense = 125, specialAttack = 55, specialDefense = 80, speed = 45 }
            , preEvolutionId = Nothing
            , evolutionMethods = []
            }


getArrayElementSafely : Int -> Maybe Pokemon
getArrayElementSafely index =
    let
        pokemonArray = Array.fromList UsageData.selectTop150Pokemon
        maybePokemon = Array.get index pokemonArray
    in
    case maybePokemon of
        Just pokemon ->
            Just pokemon
        
        Nothing ->
            Just (getDefaultPokemon pokemonArray)




generateRandomQuestion : QuizMode -> Random.Generator Question
generateRandomQuestion mode =
    case mode of
        BaseStatsMode ->
            Random.map (convertPairToQuestion mode) WeightedRandom.generateWeightedPokemonPair

        RealStatsMode ->
            Random.map (convertBattleKataPairToQuestion mode) WeightedRandom.generateWeightedBattleKataPair


convertPairToQuestion : QuizMode -> (Pokemon, Pokemon) -> Question
convertPairToQuestion mode (pokemon1, pokemon2) =
    { mode = mode
    , questionData = BaseStatsData pokemon1 pokemon2
    }


convertBattleKataPairToQuestion : QuizMode -> (BattleKata, BattleKata) -> Question
convertBattleKataPairToQuestion mode (kata1, kata2) =
    { mode = mode
    , questionData = RealStatsData kata1 kata2
    }
