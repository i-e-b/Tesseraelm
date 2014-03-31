


main = layers
    [ tiledImage 640 480 "/imgs/SandStone.jpg"
    , width 640 . centered <| style titleStyle (toText "Tesserae")
    ]

titleStyle : Style
titleStyle = 
    { typeface = [ "Times New Roman", "serif" ]
    , height   = Just 18
    , color    = white
    , bold     = True
    , italic   = False
    , line     = Nothing
    }
