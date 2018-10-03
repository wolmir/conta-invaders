module Drawings exposing
    ( alienShot1
    , alienShot2
    , cannon
    , cannonShot
    , cloudy1
    , cloudy2
    , eivind
    , explosion
    , froggy1
    , froggy2
    , jostein
    , ole
    , shippy
    , squiddy1
    , squiddy2
    , tom
    , wall
    )

import Eivind
import Jostein
import Ole
import Sprite
import Tom


ole : Sprite.Sprite
ole =
    Ole.ole


eivind : Sprite.Sprite
eivind =
    Eivind.eivind


jostein : Sprite.Sprite
jostein =
    Jostein.jostein


tom : Sprite.Sprite
tom =
    Tom.tom


cloudy1 : Sprite.Sprite
cloudy1 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 4 0 4 1
        , Sprite.rect 1 1 10 1
        , Sprite.rect 0 2 12 1
        , Sprite.rect 0 3 3 1
        , Sprite.rect 5 3 2 1
        , Sprite.rect 9 3 3 1
        , Sprite.rect 0 4 12 1
        , Sprite.rect 2 5 3 1
        , Sprite.rect 7 5 3 1
        , Sprite.rect 1 6 2 1
        , Sprite.rect 5 6 2 1
        , Sprite.rect 9 6 2 1
        , Sprite.rect 2 7 2 1
        , Sprite.rect 8 7 2 1
        ]


cloudy2 : Sprite.Sprite
cloudy2 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 4 0 4 1
        , Sprite.rect 1 1 10 1
        , Sprite.rect 0 2 12 1
        , Sprite.rect 0 3 3 1
        , Sprite.rect 5 3 2 1
        , Sprite.rect 9 3 3 1
        , Sprite.rect 0 4 12 1
        , Sprite.rect 3 5 2 1
        , Sprite.rect 7 5 2 1
        , Sprite.rect 2 6 2 1
        , Sprite.rect 5 6 2 1
        , Sprite.rect 8 6 2 1
        , Sprite.rect 0 7 2 1
        , Sprite.rect 10 7 2 1
        ]


froggy1 : Sprite.Sprite
froggy1 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 2 0 1 1
        , Sprite.rect 8 0 1 1
        , Sprite.rect 3 1 1 1
        , Sprite.rect 7 1 1 1
        , Sprite.rect 2 2 7 1
        , Sprite.rect 1 3 2 1
        , Sprite.rect 4 3 3 1
        , Sprite.rect 8 3 2 1
        , Sprite.rect 0 4 11 1
        , Sprite.rect 0 5 1 1
        , Sprite.rect 2 5 7 1
        , Sprite.rect 10 5 1 1
        , Sprite.rect 0 6 1 1
        , Sprite.rect 2 6 1 1
        , Sprite.rect 8 6 1 1
        , Sprite.rect 10 6 1 1
        , Sprite.rect 3 7 2 1
        , Sprite.rect 6 7 2 1
        ]


froggy2 : Sprite.Sprite
froggy2 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 2 0 1 1
        , Sprite.rect 8 0 1 1
        , Sprite.rect 0 1 1 1
        , Sprite.rect 3 1 1 1
        , Sprite.rect 7 1 1 1
        , Sprite.rect 10 1 1 1
        , Sprite.rect 0 2 1 1
        , Sprite.rect 2 2 7 1
        , Sprite.rect 10 2 1 1
        , Sprite.rect 0 3 3 1
        , Sprite.rect 4 3 3 1
        , Sprite.rect 8 3 3 1
        , Sprite.rect 0 4 11 1
        , Sprite.rect 1 5 9 1
        , Sprite.rect 2 6 1 1
        , Sprite.rect 8 6 1 1
        , Sprite.rect 1 7 1 1
        , Sprite.rect 9 7 1 1
        ]


squiddy1 : Sprite.Sprite
squiddy1 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 3 0 2 1
        , Sprite.rect 2 1 4 1
        , Sprite.rect 1 2 6 1
        , Sprite.rect 0 3 2 1
        , Sprite.rect 3 3 2 1
        , Sprite.rect 6 3 2 1
        , Sprite.rect 0 4 8 1
        , Sprite.rect 1 5 1 1
        , Sprite.rect 3 5 2 1
        , Sprite.rect 6 5 1 1
        , Sprite.rect 0 6 1 1
        , Sprite.rect 7 6 1 1
        , Sprite.rect 1 7 1 1
        , Sprite.rect 6 7 1 1
        ]


squiddy2 : Sprite.Sprite
squiddy2 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 3 0 2 1
        , Sprite.rect 2 1 4 1
        , Sprite.rect 1 2 6 1
        , Sprite.rect 0 3 2 1
        , Sprite.rect 3 3 2 1
        , Sprite.rect 6 3 2 1
        , Sprite.rect 0 4 8 1
        , Sprite.rect 2 5 1 1
        , Sprite.rect 5 5 1 1
        , Sprite.rect 1 6 1 1
        , Sprite.rect 3 6 2 1
        , Sprite.rect 6 6 1 1
        , Sprite.rect 0 7 1 1
        , Sprite.rect 2 7 1 1
        , Sprite.rect 5 7 1 1
        , Sprite.rect 7 7 1 1
        ]


shippy : Sprite.Sprite
shippy =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 5 0 6 1
        , Sprite.rect 3 1 10 1
        , Sprite.rect 2 2 12 1
        , Sprite.rect 1 3 2 1
        , Sprite.rect 4 3 2 1
        , Sprite.rect 7 3 2 1
        , Sprite.rect 10 3 2 1
        , Sprite.rect 13 3 2 1
        , Sprite.rect 0 4 16 1
        , Sprite.rect 2 5 3 1
        , Sprite.rect 7 5 2 1
        , Sprite.rect 11 5 3 1
        , Sprite.rect 3 6 1 1
        , Sprite.rect 12 6 1 1
        ]


cannon : Sprite.Sprite
cannon =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 7 0 1 1
        , Sprite.rect 6 1 3 1
        , Sprite.rect 1 2 13 1
        , Sprite.rect 0 3 15 1
        , Sprite.rect 0 4 15 1
        , Sprite.rect 0 5 15 1
        , Sprite.rect 0 6 15 1
        ]


wall : Sprite.Sprite
wall =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 3 0 14 1
        , Sprite.rect 2 1 16 1
        , Sprite.rect 1 2 18 1
        , Sprite.rect 0 3 20 1
        , Sprite.rect 0 4 20 1
        , Sprite.rect 0 5 20 1
        , Sprite.rect 0 6 20 1
        , Sprite.rect 0 7 8 1
        , Sprite.rect 12 7 8 1
        , Sprite.rect 0 8 7 1
        , Sprite.rect 13 8 7 1
        , Sprite.rect 0 9 6 1
        , Sprite.rect 14 9 6 1
        , Sprite.rect 0 10 5 1
        , Sprite.rect 15 10 5 1
        , Sprite.rect 0 11 4 1
        , Sprite.rect 16 11 4 1
        , Sprite.rect 0 12 4 1
        , Sprite.rect 16 12 4 1
        , Sprite.rect 0 13 4 1
        , Sprite.rect 16 13 4 1
        , Sprite.rect 0 14 4 1
        , Sprite.rect 16 14 4 1
        ]


cannonShot : Sprite.Sprite
cannonShot =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 0 0 1 3 ]


alienShot1 : Sprite.Sprite
alienShot1 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 0 0 1 1
        , Sprite.rect 1 1 1 1
        , Sprite.rect 2 2 1 1
        , Sprite.rect 1 3 1 1
        , Sprite.rect 0 4 1 1
        , Sprite.rect 1 5 1 1
        , Sprite.rect 2 6 1 1
        ]


alienShot2 : Sprite.Sprite
alienShot2 =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 1 1 1 1
        , Sprite.rect 0 2 1 1
        , Sprite.rect 1 3 1 1
        , Sprite.rect 2 4 1 1
        , Sprite.rect 1 5 1 1
        , Sprite.rect 0 6 1 1
        , Sprite.rect 1 7 1 1
        ]


explosion : Sprite.Sprite
explosion =
    Sprite.Sprite Sprite.White
        [ Sprite.rect 0 0 1 1
        , Sprite.rect 1 1 1 1
        , Sprite.rect 3 1 1 1
        , Sprite.rect 4 0 1 1
        , Sprite.rect 1 3 1 1
        , Sprite.rect 0 4 1 1
        , Sprite.rect 3 3 1 1
        , Sprite.rect 4 4 1 1
        ]
