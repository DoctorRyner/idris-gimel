module Main

import Gimel.Attribute
import Gimel.Engine
import Gimel.Html
import Gimel.React
import Gimel.Types
import Js.Console

data Event = Inc | Dec
 
record Model where
  constructor MkModel
  counterValue : Int

init : Model
init = MkModel 0

%foreign "javascript:lambda:(f, timeout) => setTimeout(f, timeout)"
prim__setTimeout : IO () -> Double -> PrimIO ()

setTimeout : IO () -> Double -> IO ()
setTimeout f = primIO . prim__setTimeout f

view : Model -> Html Event
view model = fc $ do
    useEffect $ print "Idris Gimel useEffect react hook test"

    pure $ div'
        [ button_ [onClick Inc] $ text "+"
        , textS model.counterValue
        , button_ [onClick Dec] $ text "-"
        , h1
            [ style $ fromList
                [ "color"           =: "blue"
                , "backgroundColor" =: "black"
                ]
            ]
            [text "KEK"]
        ]

update : Model -> Event -> Update Model Event
update model = \case
    Inc => pure $ {counterValue $= (+ 1)} model
        -- setTimeout (print $ show model.counterValue) 2000
    Dec => pure $ {counterValue $= (+ -1)} model

main : IO ()
main = run {init, view, update}