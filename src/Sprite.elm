module Sprite exposing
    ( Color(..)
    , Rect
    , Sprite(..)
    , rect
    , scale
    , toSvg
    , translate
    , translateX
    , translateY
    , withColor
    )

import Svg exposing (Svg)
import Svg.Attributes as SvgAttrs



-- COLOR


{-| Defines allk the valid colors.
-}
type Color
    = White
    | Black
    | Any String


{-| Tranforms a color into its svg counterpart string.
-}
colorToStr : Color -> String
colorToStr color =
    case color of
        White ->
            "white"

        Black ->
            "black"

        Any hex ->
            hex



-- RECT


{-| Defines a rectangle structure.
-}
type alias Rect =
    { x : Int
    , y : Int
    , width : Int
    , height : Int
    , color : Color
    }


{-| Rectangle with a default color
-}
rect : Int -> Int -> Int -> Int -> Rect
rect x y width height =
    Rect x y width height White


{-| Scales a rectangle by given factor.
-}
rectScale : Int -> Rect -> Rect
rectScale factor rectangle =
    { x = rectangle.x * factor
    , y = rectangle.y * factor
    , width = rectangle.width * factor
    , height = rectangle.height * factor
    , color = rectangle.color
    }


{-| Translate rectangle by given units along x axis.
-}
rectTranslateX : Int -> Rect -> Rect
rectTranslateX units rectangle =
    { rectangle | x = rectangle.x + units }


{-| Translate rectangle by given units along y axis.
-}
rectTranslateY : Int -> Rect -> Rect
rectTranslateY units rectangle =
    { rectangle | y = rectangle.y + units }


{-| Translate rectangle by given units along x and y axis.
-}
rectTranslate : Int -> Int -> Rect -> Rect
rectTranslate dx dy rectangle =
    { rectangle | x = rectangle.x + dx, y = rectangle.y + dy }


{-| Transforms a rectangle into an Svg rectangle
-}
rectToSvg : Color -> Rect -> Svg msg
rectToSvg color rectangle =
    Svg.rect
        [ SvgAttrs.x (String.fromInt rectangle.x)
        , SvgAttrs.y (String.fromInt rectangle.y)
        , SvgAttrs.width (String.fromInt rectangle.width)
        , SvgAttrs.height (String.fromInt rectangle.height)
        , SvgAttrs.fill (colorToStr rectangle.color)
        ]
        []



-- SPRITE


{-| Defines the sprite structure.
-}
type Sprite
    = Sprite Color (List Rect)


{-| Scales a sprite by a given factor.
-}
scale : Int -> Sprite -> Sprite
scale factor (Sprite color list) =
    Sprite color (List.map (rectScale factor) list)


{-| Translates sprite by given units along x axis.
-}
translateX : Int -> Sprite -> Sprite
translateX units (Sprite color list) =
    Sprite color (List.map (rectTranslateX units) list)


{-| Translates sprite by given units along y axis.
-}
translateY : Int -> Sprite -> Sprite
translateY units (Sprite color list) =
    Sprite color (List.map (rectTranslateY units) list)


{-| Translates sprite by given units along x and y axis
-}
translate : Int -> Int -> Sprite -> Sprite
translate x y (Sprite color list) =
    Sprite color (List.map (rectTranslate x y) list)


{-| Adds a color to the sprite
-}
withColor : Color -> Sprite -> Sprite
withColor color (Sprite _ list) =
    Sprite color list


{-| Returns a list of SVG rectangles from the sprite's definition.
-}
toSvg : Sprite -> Svg msg
toSvg (Sprite color list) =
    Svg.g
        []
        (List.map (rectToSvg color) list)
