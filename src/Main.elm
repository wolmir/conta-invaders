module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Array
import Browser
import Browser.Events exposing (onAnimationFrameDelta, onKeyDown, onKeyUp)
import Drawings
import Entities exposing (Entity(..), Status(..), Thing)
import Html exposing (..)
import Html.Events exposing (keyCode)
import Json.Decode as Decode
import Random
import Sprite
import String
import Svg exposing (Svg)
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
    { frameCounter : Int
    , leftPressed : Float
    , rightPressed : Float
    , spacePressed : Bool
    , cannon : Thing
    , cannonShots : List Thing
    , things : List Thing
    }


init : () -> ( Model, Cmd Msg )
init _ =
    let
        cannon =
            Entities.cannon 90 180

        squiddies =
            List.range 0 10
                |> List.map (\i -> Entities.squiddy (20 + 12 * toFloat i) 30)

        froggies1 =
            List.range 0 10
                |> List.map (\i -> Entities.froggy (15 + 14 * toFloat i) 45)

        froggies2 =
            List.range 0 10
                |> List.map (\i -> Entities.froggy (15 + 14 * toFloat i) 60)

        cloudies1 =
            List.range 0 10
                |> List.map (\i -> Entities.cloudy (15 + 14 * toFloat i) 75)

        cloudies2 =
            List.range 0 10
                |> List.map (\i -> Entities.cloudy (15 + 14 * toFloat i) 90)

        aliens =
            List.concat [ squiddies, froggies1, froggies2, cloudies1, cloudies2 ]

        walls =
            [ Entities.wall 20 150, Entities.wall 80 150, Entities.wall 140 150 ]

        listOfThings =
            List.concat [ aliens, walls ]
    in
    ( { frameCounter = 0
      , leftPressed = 0
      , rightPressed = 0
      , spacePressed = False
      , cannon = cannon
      , cannonShots = []
      , things = listOfThings
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = Tick Float
    | MoveLeft Bool
    | MoveRight Bool
    | Shoot Bool
    | Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick delta ->
            let
                collided =
                    Entities.collide model.cannonShots model.things

                updateFn =
                    \col ->
                        col
                            |> List.map (Entities.moveAround << Entities.ageUp)
                            |> List.filter (\e -> e.status == Alive)

                newShots =
                    collided
                        |> .firstList
                        |> updateFn

                newThings =
                    collided
                        |> .secondList
                        |> updateFn

                moreThings =
                    if model.frameCounter == 1125 then
                        Entities.ole 200 5 :: newThings

                    else if model.frameCounter == 2250 then
                        Entities.eivind 200 5 :: newThings

                    else if model.frameCounter == 3375 then
                        Entities.jostein 200 5 :: newThings

                    else if model.frameCounter == 0 then
                        Entities.tom 200 5 :: newThings

                    else
                        newThings
            in
            ( { model
                | frameCounter = modBy 5000 (model.frameCounter + 1)
                , cannon =
                    model.cannon
                        |> Entities.setVelocity (model.rightPressed - model.leftPressed) 0
                        |> Entities.ageUp
                        |> Entities.moveAround
                , things = moreThings
                , cannonShots = newShots
              }
            , Cmd.none
            )

        MoveLeft on ->
            let
                keyState =
                    if on then
                        1

                    else
                        0
            in
            ( { model | leftPressed = keyState }, Cmd.none )

        MoveRight on ->
            let
                keyState =
                    if on then
                        1

                    else
                        0
            in
            ( { model | rightPressed = keyState }, Cmd.none )

        Shoot on ->
            let
                ( x, y ) =
                    ( model.cannon.position.x + 7, model.cannon.position.y - 1 )

                withShot =
                    if on && not model.spacePressed then
                        Entities.cannonShot x y :: model.cannonShots

                    else
                        model.cannonShots
            in
            ( { model | cannonShots = withShot, spacePressed = on }, Cmd.none )

        Noop ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ onAnimationFrameDelta Tick
        , onKeyUp (Decode.map (key False) keyCode)
        , onKeyDown (Decode.map (key True) keyCode)
        ]


key : Bool -> Int -> Msg
key on keycode =
    case keycode of
        37 ->
            MoveLeft on

        39 ->
            MoveRight on

        32 ->
            Shoot on

        _ ->
            Noop



-- VIEW


view : Model -> Html Msg
view model =
    Svg.svg
        [ SvgAttrs.width "540"
        , SvgAttrs.height "600"
        ]
        [ renderField
        , model.cannon
            :: List.concat [ model.things, model.cannonShots ]
            |> renderThings
        ]


renderThings : List Thing -> Svg msg
renderThings things =
    Svg.g []
        (things
            |> List.map (Sprite.toSvg << Sprite.scale 3 << Entities.render)
        )


renderField : Svg msg
renderField =
    Svg.rect
        [ SvgAttrs.x "0"
        , SvgAttrs.y "0"
        , SvgAttrs.width "100%"
        , SvgAttrs.height "100%"
        , SvgAttrs.fill "#333333"
        ]
        []
