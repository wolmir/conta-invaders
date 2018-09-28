module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Random
import Svg as Svg
import Svg.Attributes as SvgAttrs



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { dieFace : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model 1
    , Cmd.none
    )



-- UPDATE


type Msg
    = Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model
            , Random.generate NewFace (Random.int 1 6)
            )

        NewFace newFace ->
            ( Model newFace
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ renderCloudy

        --      , renderFroggy
        --      , renderSquidy
        --      , renderShippy
        ]


renderCloudy : Html Msg
renderCloudy =
    Svg.svg
        [ SvgAttrs.width "120"
        , SvgAttrs.height "80"
        , SvgAttrs.viewBox "0 0 120 120"
        ]
        [ Svg.rect
            [ SvgAttrs.x "40"
            , SvgAttrs.y "0"
            , SvgAttrs.width "40"
            , SvgAttrs.height "10"
            ]
            []
        , Svg.rect
            [ SvgAttrs.x "10"
            , SvgAttrs.y "10"
            , SvgAttrs.width "100"
            , SvgAttrs.height "10"
            ]
            []
        ]
