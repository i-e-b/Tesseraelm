
port title : Signal String
port title = always "Tesseraelm" <~ every second

{--
 - The plan:
 -
 - Build a board filled with random tiles (could build backwards later)
 - Handle interaction in phases of idle, selected, animate
 -}

type Point = {x:Int, y:Int}
type Start = Point
type Dest = Point
type Dests = [Point]
type Prop = Float

data Phase = Idle | Selected Start Dests | Animate Start Dest Prop
data Tile =   Red | Blue | Yellow
            | Green | Orange | Pink
            | Grey

type Board = [[Tile]]

type Game = {board:Board, phase:Phase}

-- One tile landing on another. Illegal is `Nothing`
addTiles : Tile -> Tile -> Maybe Tile
addTiles a b = 
    let is x y = (x == a && y == b) || (x == b && y == a)
        same = a == b
    in  if
        | same -> Just a
        | is Red Yellow -> Just Orange
        | is Yellow Blue -> Just Green
        | is Red Blue -> Just Pink
        | is Red Green -> Just Grey
        | is Blue Orange -> Just Grey
        | is Yellow Pink -> Just Grey
        | otherwise -> Nothing

-- How to do the board? I don't *want* just an array of arrays...
-- Maybe a quad-tree?

{-- -- Text and drawing styles, background --
main = layers
    [ tiledImage 640 480 "/imgs/SandStone.jpg"
    , width 640 . centered <| style titleStyle (toText "Tesserae")
    , shapes
    ]

titleStyle : Style
titleStyle = 
    { typeface = [ "Times New Roman", "serif" ]
    , height   = Just 72
    , color    = black
    , bold     = True
    , italic   = False
    , line     = Nothing
    }

--outline = path [ (50,50), (50,-50), (-50,-50), (-50,50), (50,50) ]
outline = path [ (50,50), (25,-50), (-25,-50), (-50,50), (50,50) ]

shapes = collage 200 420
         [ outline |> traced (dashed black) |> move (0, -110)
         , outline |> traced (dotted black)
         , outline |> filled black          |> move (0, 110)
         ]
-}
{--}-- Flipping animation --
main = lift shapes (foldp (+) 0 (fps 15))

flipSpeed = 1 / 250

outline t = 
  let x = abs (sin (t * flipSpeed)) * 20
      y = cos (t * flipSpeed) * 100
  in path [ (50,50), (50 + x, 50 - y), (-50 - x, 50 - y), (-50,50), (50,50) ]

shapes t = collage 300 300 [outline t |> filled black]
--}
