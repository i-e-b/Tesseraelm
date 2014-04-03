
port title : Signal String
port title = always "Tesseraelm" <~ every second

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

{- -- Flipping animation --
main = lift shapes (every millisecond)

flipSpeed = 1 / 2500

outline t = 
  let x = abs (cos (t * flipSpeed)) * 50
      y = cos (t * flipSpeed) * 100
  in path [ (50,50), (x, 50 - y), (-x, 50 - y), (-50,50), (50,50) ]

shapes t = collage 300 300 [outline t |> filled black]
-}
