module Route.Pokedex exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (..)
import Html.Attributes as Attr
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Pokemon.Data exposing (allPokemon)
import Pokemon.Types exposing (Pokemon, typeToString)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { pokemonList : List Pokemon
    }


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    BackendTask.succeed
        { pokemonList = allPokemon
        }


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
        , description = "ポケモン図鑑一覧"
        , locale = Nothing
        , title = "ポケモン図鑑 - Top Pokemon"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "ポケモン図鑑"
    , body =
        [ div [ Attr.class "pokedex-container" ]
            [ h1 [] [ text "ポケモン図鑑" ]
            , div [ Attr.class "pokedex-stats" ]
                [ text ("全 " ++ String.fromInt (List.length app.data.pokemonList) ++ " 匹のポケモン") ]
            , div [ Attr.class "pokemon-grid" ]
                (List.map viewPokemonCard app.data.pokemonList)
            ]
        ]
    }


viewPokemonCard : Pokemon -> Html msg
viewPokemonCard pokemon =
    a
        [ Attr.href ("/pokedex/" ++ String.fromInt pokemon.id)
        , Attr.class "pokemon-card"
        ]
        [ div [ Attr.class "pokemon-number" ]
            [ text ("#" ++ String.padLeft 4 '0' (String.fromInt pokemon.id)) ]
        , div [ Attr.class "pokemon-sprite-container" ]
            [ img
                [ Attr.src ("/images/pokemon/sprites/" ++ String.fromInt pokemon.id ++ ".png")
                , Attr.alt pokemon.name
                , Attr.class "pokemon-sprite"
                ]
                []
            ]
        , div [ Attr.class "pokemon-name" ]
            [ text pokemon.name ]
        , div [ Attr.class "pokemon-types" ]
            (viewTypes [typeToString pokemon.pokemonType])
        , div [ Attr.class "pokemon-stats-preview" ]
            [ div [ Attr.class "stat-row" ]
                [ span [ Attr.class "stat-label" ] [ text "HP" ]
                , span [ Attr.class "stat-value" ] [ text (String.fromInt pokemon.stats.hp) ]
                ]
            , div [ Attr.class "stat-row" ]
                [ span [ Attr.class "stat-label" ] [ text "攻撃" ]
                , span [ Attr.class "stat-value" ] [ text (String.fromInt pokemon.stats.attack) ]
                ]
            , div [ Attr.class "stat-row" ]
                [ span [ Attr.class "stat-label" ] [ text "防御" ]
                , span [ Attr.class "stat-value" ] [ text (String.fromInt pokemon.stats.defense) ]
                ]
            , div [ Attr.class "stat-row" ]
                [ span [ Attr.class "stat-label" ] [ text "特攻" ]
                , span [ Attr.class "stat-value" ] [ text (String.fromInt pokemon.stats.specialAttack) ]
                ]
            , div [ Attr.class "stat-row" ]
                [ span [ Attr.class "stat-label" ] [ text "特防" ]
                , span [ Attr.class "stat-value" ] [ text (String.fromInt pokemon.stats.specialDefense) ]
                ]
            , div [ Attr.class "stat-row" ]
                [ span [ Attr.class "stat-label" ] [ text "素早さ" ]
                , span [ Attr.class "stat-value" ] [ text (String.fromInt pokemon.stats.speed) ]
                ]
            , div [ Attr.class "stat-row stat-total" ]
                [ span [ Attr.class "stat-label" ] [ text "合計" ]
                , span [ Attr.class "stat-value" ] 
                    [ text (String.fromInt 
                        (pokemon.stats.hp 
                        + pokemon.stats.attack 
                        + pokemon.stats.defense 
                        + pokemon.stats.specialAttack 
                        + pokemon.stats.specialDefense 
                        + pokemon.stats.speed)) 
                    ]
                ]
            ]
        ]


viewTypes : List String -> List (Html msg)
viewTypes types =
    List.map
        (\typeStr ->
            span
                [ Attr.class ("type-badge type-" ++ String.toLower typeStr) ]
                [ text typeStr ]
        )
        types