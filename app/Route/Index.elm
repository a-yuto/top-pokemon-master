module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Pages.Url
import PagesMsg exposing (PagesMsg)
import UrlPath
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { message : String
    }


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.buildNoState { view = view }
        (RouteBuilder.single
            { head = head
            , data = data
            })


data : BackendTask FatalError Data
data =
    BackendTask.andMap
        (BackendTask.succeed "Hello!")
        (BackendTask.succeed Data)


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Top Pokemon Master"
        , image =
            { url = Pages.Url.fromPath (UrlPath.join [ "images", "icon-png.png" ])
            , alt = "Top Pokemon Master"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "ポケモン対戦の素早さ判定を学べるツール集"
        , locale = Nothing
        , title = "Top Pokemon Master"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "Top Pokemon Master"
    , body =
        [ Html.h1 [] [ Html.text "Top Pokemon Master" ]
        , Html.p []
            [ Html.text "ポケモン対戦の素早さ判定を学べるツール集"
            ]
        , Html.h2 [] [ Html.text "ツール一覧" ]
        , Html.ul []
            [ Html.li []
                [ Route.SpeedQuiz
                    |> Route.link [] [ Html.text "素早さクイズ" ]
                , Html.text " - 種族値・実数値での素早さ比較クイズ"
                ]
            , Html.li []
                [ Route.SpeedTable
                    |> Route.link [] [ Html.text "素早さ表" ]
                , Html.text " - 使用率Top50ポケモンの素早さ散布図"
                ]
            , Html.li []
                [ Route.Search
                    |> Route.link [] [ Html.text "ポケモン検索" ]
                , Html.text " - ポケモンを検索"
                ]
            , Html.li []
                [ Route.Pokedex
                    |> Route.link [] [ Html.text "ポケモン図鑑" ]
                , Html.text " - 全ポケモンの図鑑一覧"
                ]
            ]
        ]
    }
