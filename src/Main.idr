module Main

import Gimel.Cmd
import Gimel.Engine
import Gimel.Types
import Gimel.Sub

data Event
    = Inc
    | Dec

record Model where
    constructor MkModel
    counterValue : Int

init : Model
init = MkModel
    { counterValue = 0
    }

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

subs : Sub Model Event
subs = neutral

main : IO ()
main = run {init, view, update, subs}