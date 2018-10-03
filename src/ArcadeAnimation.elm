module ArcadeAnimation exposing
    ( Frame(..)
    , render
    )

import Sprite exposing (Sprite)


type Frame
    = SingleFrame Sprite
    | DoubleFrame Int Sprite Sprite


render : Int -> Int -> Int -> Frame -> Sprite
render x y counter frame =
    case frame of
        SingleFrame sprite ->
            sprite
                |> Sprite.translate x y
                |> Sprite.withColor Sprite.White

        DoubleFrame duration sprite1 sprite2 ->
            let
                base =
                    duration // 2

                currentSprite =
                    if modBy duration counter > base then
                        sprite2

                    else
                        sprite1
            in
            currentSprite
                |> Sprite.translate x y
                |> Sprite.withColor Sprite.White
