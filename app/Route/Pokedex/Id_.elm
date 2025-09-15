module Route.Pokedex.Id_ exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Pages.Url
import PagesMsg exposing (PagesMsg)
import UrlPath
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { id : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


pages : BackendTask FatalError (List RouteParams)
pages =
    BackendTask.succeed
        [ { id = "1" }
        , { id = "25" }
        ]


type alias Data =
    { pokemon : Pokemon
    }


type alias Pokemon =
    { id : String
    , name : String
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    let
        pokemon =
            if routeParams.id == "1" then
                { id = "1", name = "フシギダネ" }
            else if routeParams.id == "25" then
                { id = "25", name = "ピカチュウ" }
            else
                { id = routeParams.id, name = "不明なポケモン" }
    in
    BackendTask.succeed { pokemon = pokemon }


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Top Pokemon"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "Top Pokemon logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "ポケモン詳細"
        , locale = Nothing
        , title = app.data.pokemon.name ++ " - ポケモン図鑑"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = app.data.pokemon.name ++ " - ポケモン図鑑"
    , body =
        [ Html.h1 [] [ Html.text <| app.data.pokemon.name ++ "の詳細ページ" ]
        , Html.p [] [ Html.text <| "ID: " ++ app.data.pokemon.id ]
        , Html.p [] [ Html.text "準備中..." ]
        ]
    }