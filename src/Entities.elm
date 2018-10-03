module Entities exposing
    ( Entity(..)
    , Status(..)
    , Thing
    , ageUp
    , alienShot
    , cannon
    , cannonShot
    , cloudy
    , collide
    , eivind
    , froggy
    , jostein
    , moveAround
    , ole
    , render
    , setVelocity
    , shippy
    , squiddy
    , tom
    , wall
    )

import ArcadeAnimation exposing (Frame(..))
import Drawings
import QuadTree exposing (buildBoundingBox, intersectBoundingBoxes)
import Sprite exposing (Sprite)
import Svg exposing (Svg)
import Vector exposing (Vector)



-- THING


type Status
    = Alive
    | Dead


type Bullet
    = AlienBullet
    | CannonBullet


type Entity
    = Shot Bullet
    | Squiddy
    | Froggy
    | Cloudy
    | Shippy
    | Wall
    | Cannon
    | Explosion
    | Conta Person


type Person
    = Ole
    | Eivind
    | Tom
    | Jostein


type alias Thing =
    { entity : Entity
    , position : Vector
    , status : Status
    , velocity : Vector
    , age : Int
    }


type alias Aftermath =
    { firstList : List Thing
    , secondList : List Thing
    }


collide : List Thing -> List Thing -> Aftermath
collide first second =
    let
        ( collidedFirst, collidedSecond ) =
            first
                |> List.filterMap (collided second)
                |> List.unzip

        resolvedFirst =
            List.map resolveCollision collidedFirst

        resolvedSecond =
            List.map resolveCollision collidedSecond

        remainingFirst =
            List.filter (\p -> not (List.member p collidedFirst)) first

        remainingSecond =
            List.filter (\p -> not (List.member p collidedSecond)) second
    in
    Aftermath (remainingFirst ++ resolvedFirst) (remainingSecond ++ resolvedSecond)


resolveCollision : Thing -> Thing
resolveCollision thing =
    case thing.entity of
        Wall ->
            thing

        Shot _ ->
            { thing | status = Dead }

        _ ->
            explosion thing.position


collided : List Thing -> Thing -> Maybe ( Thing, Thing )
collided things element =
    things
        |> List.filter (detectIntersection element)
        |> List.head
        |> Maybe.map (\thing -> ( element, thing ))


detectIntersection : Thing -> Thing -> Bool
detectIntersection a b =
    let
        ( awidth, aheight ) =
            getSize a.entity

        ax =
            a.position.x

        ay =
            a.position.y

        adx =
            ax + awidth

        ady =
            ay + aheight

        ( bwidth, bheight ) =
            getSize b.entity

        bx =
            b.position.x

        by =
            b.position.y

        bdx =
            bx + bwidth

        bdy =
            by + bheight

        boxa =
            buildBoundingBox ax adx ay ady

        boxb =
            buildBoundingBox bx bdx by bdy
    in
    intersectBoundingBoxes boxa boxb


ageUp : Thing -> Thing
ageUp thing =
    let
        status =
            case thing.entity of
                Shot _ ->
                    if thing.position.x < 0 || thing.position.x > 180 || thing.position.y < 0 || thing.position.y > 200 then
                        Dead

                    else
                        Alive

                Conta _ ->
                    if thing.age > 250 then
                        Dead

                    else
                        Alive

                Explosion ->
                    if thing.age > 10 then
                        Dead

                    else
                        Alive

                _ ->
                    Alive
    in
    case thing.status of
        Dead ->
            thing

        Alive ->
            { thing | age = modBy 1000 (thing.age + 1), status = status }


setVelocity : Float -> Float -> Thing -> Thing
setVelocity x y thing =
    { thing | velocity = Vector x y }


getSize : Entity -> ( Float, Float )
getSize entity =
    case entity of
        Shot _ ->
            ( 1, 3 )

        Wall ->
            ( 20, 23 )

        Cannon ->
            ( 15, 7 )

        Shippy ->
            ( 16, 14 )

        _ ->
            ( 12, 12 )


moveAround : Thing -> Thing
moveAround thing =
    case thing.entity of
        Shot _ ->
            { thing | position = Vector.sum thing.position thing.velocity }

        Conta _ ->
            { thing | position = Vector.sum thing.position thing.velocity }

        Cannon ->
            { thing | position = Vector.sum thing.position thing.velocity }

        _ ->
            thing


thingFrame : Thing -> Frame
thingFrame { entity, age } =
    case entity of
        Shot bullet ->
            case bullet of
                CannonBullet ->
                    SingleFrame Drawings.cannonShot

                AlienBullet ->
                    DoubleFrame 20 Drawings.alienShot1 Drawings.alienShot2

        Squiddy ->
            DoubleFrame 80 Drawings.squiddy1 Drawings.squiddy2

        Cloudy ->
            DoubleFrame 80 Drawings.cloudy1 Drawings.cloudy2

        Froggy ->
            DoubleFrame 80 Drawings.froggy1 Drawings.froggy2

        Wall ->
            SingleFrame Drawings.wall

        Shippy ->
            SingleFrame Drawings.shippy

        Cannon ->
            SingleFrame Drawings.cannon

        Explosion ->
            SingleFrame Drawings.explosion

        Conta person ->
            case person of
                Ole ->
                    SingleFrame Drawings.ole

                Eivind ->
                    SingleFrame Drawings.eivind

                Jostein ->
                    SingleFrame Drawings.jostein

                Tom ->
                    SingleFrame Drawings.tom


render : Thing -> Sprite
render thing =
    let
        frame =
            thingFrame thing

        x =
            round thing.position.x

        y =
            round thing.position.y
    in
    ArcadeAnimation.render x y thing.age frame


createThing : Entity -> Vector -> Vector -> Int -> Thing
createThing ent pos vel age =
    { age = age
    , entity = ent
    , status = Alive
    , position = pos
    , velocity = vel
    }


explosion : Vector -> Thing
explosion position =
    createThing Explosion position (Vector 0 0) 0


squiddy : Float -> Float -> Thing
squiddy x y =
    createThing Squiddy (Vector x y) (Vector 0 0) 0


froggy : Float -> Float -> Thing
froggy x y =
    createThing Froggy (Vector x y) (Vector 0 0) 0


cloudy : Float -> Float -> Thing
cloudy x y =
    createThing Cloudy (Vector x y) (Vector 0 0) 0


shippy : Float -> Float -> Thing
shippy x y =
    createThing Shippy (Vector x y) (Vector 0 0) 0


wall : Float -> Float -> Thing
wall x y =
    createThing Wall (Vector x y) (Vector 0 0) 0


cannonShot : Float -> Float -> Thing
cannonShot x y =
    createThing (Shot CannonBullet) (Vector x y) (Vector 0 -1.5) 0


alienShot : Float -> Float -> Thing
alienShot x y =
    createThing (Shot AlienBullet) (Vector x y) (Vector 0 1.5) 0


cannon : Float -> Float -> Thing
cannon x y =
    createThing Cannon (Vector x y) (Vector 0 0) 0


ole : Float -> Float -> Thing
ole x y =
    createThing (Conta Ole) (Vector x y) (Vector -1 0) 0


eivind : Float -> Float -> Thing
eivind x y =
    createThing (Conta Eivind) (Vector x y) (Vector -1 0) 0


jostein : Float -> Float -> Thing
jostein x y =
    createThing (Conta Jostein) (Vector x y) (Vector -1 0) 0


tom : Float -> Float -> Thing
tom x y =
    createThing (Conta Tom) (Vector x y) (Vector -1 0) 0
