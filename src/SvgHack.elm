module SvgHack exposing
    ( fill
    , height
    , rect
    , width
    , x
    , y
    )

import Sprite


type Attrs
    = X String
    | Y String
    | Width String
    | Height String
    | Fill String


fill : String -> Attrs
fill name =
    Fill name


x : String -> Attrs
x n =
    X n


y : String -> Attrs
y n =
    Y n


width : String -> Attrs
width n =
    Width n


height : String -> Attrs
height n =
    Height n


rect : List Attrs -> List Int -> Sprite.Rect
rect attrs _ =
    let
        colori =
            attrs
                |> List.filter isColor
                |> List.head
                |> Maybe.withDefault (Fill "black")
                |> toSpriteColor

        xi =
            attrs
                |> List.filter isX
                |> List.head
                |> Maybe.withDefault (X "0")
                |> attrsToInt

        yi =
            attrs
                |> List.filter isY
                |> List.head
                |> Maybe.withDefault (Y "0")
                |> attrsToInt

        widthi =
            attrs
                |> List.filter isWidth
                |> List.head
                |> Maybe.withDefault (Width "0")
                |> attrsToInt

        heighti =
            attrs
                |> List.filter isHeight
                |> List.head
                |> Maybe.withDefault (Height "0")
                |> attrsToInt
    in
    Sprite.Rect xi yi widthi heighti colori


toSpriteColor : Attrs -> Sprite.Color
toSpriteColor attr =
    case attr of
        Fill color ->
            Sprite.Any color

        _ ->
            Sprite.Black


attrsToInt : Attrs -> Int
attrsToInt attr =
    let
        n =
            case attr of
                X i ->
                    String.toInt i

                Y i ->
                    String.toInt i

                Width i ->
                    String.toInt i

                Height i ->
                    String.toInt i

                _ ->
                    Just 0
    in
    Maybe.withDefault 0 n // 10


isColor : Attrs -> Bool
isColor attr =
    case attr of
        Fill _ ->
            True

        _ ->
            False


isX : Attrs -> Bool
isX attr =
    case attr of
        X _ ->
            True

        _ ->
            False


isY : Attrs -> Bool
isY attr =
    case attr of
        Y _ ->
            True

        _ ->
            False


isWidth : Attrs -> Bool
isWidth attr =
    case attr of
        Width _ ->
            True

        _ ->
            False


isHeight : Attrs -> Bool
isHeight attr =
    case attr of
        Height _ ->
            True

        _ ->
            False
