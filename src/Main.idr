module Main

import Gimel.Attribute
import Gimel.Cmd
import Gimel.Engine
import Gimel.Html
import Gimel.React
import Gimel.Types

data Event = Inc | Dec

record Model where
  constructor MkModel
  counterValue : Int

init : Model
init = MkModel {counterValue = 0}

view : Model -> Html Event
view model = concat
    [ h1' [text "Counter"]
    , button [onClick Inc] [text "+"]
    , textS model.counterValue
    , button [onClick Dec] [text "-"]
    ]

update : Model -> Event -> Update Model Event
update model = \case
    Inc => pure $ {counterValue $= (+  1)} model
    Dec => pure $ {counterValue $= (+ -1)} model

main : IO ()
main = run {init, view, update}