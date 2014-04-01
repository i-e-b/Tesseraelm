
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
         [ outline |> traced (dashed black)  |> move (0, -110)
         , outline |> traced (dotted black)
         , outline |> traced (solid  black)   |> move (0, 110)
         ]
