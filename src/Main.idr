module Main

import Gimel.Attribute
import Gimel.Cmd
import Gimel.Engine
import Gimel.Html
import Gimel.React
import Gimel.Types
import Js.Console
import Js.Timeout

data Event = Inc | Dec
 
record Model where
  constructor MkModel
  counterValue : Int

init : Model
init = MkModel 0

inputTest : Html Event
inputTest = fc $ pure $ el "input" [] []

view : Model -> Html Event
view model = div []
    [ button [onClick Inc] [text "+"]
    , textS model.counterValue
    , button [onClick Dec] [text "-"]
    , inputTest
    ]

update : Model -> Event -> Update Model Event
update model = \case
    Inc => pure $ {counterValue $= (+  1)} model
    Dec => pure $ {counterValue $= (+ -1)} model

main : IO ()
main = run {init, view, update}