module Vector exposing
    ( Vector
    , sum
    )


type alias Vector =
    { x : Float
    , y : Float
    }


sum : Vector -> Vector -> Vector
sum a b =
    Vector (a.x + b.x) (a.y + b.y)
