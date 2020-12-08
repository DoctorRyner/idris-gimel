module Main

import ReactDOM
import Js.Dom
import Js.Console
import Gimel.Html
import Gimel.Attribute
import Gimel.Application
import Gimel.Engine

data Event = Inc | Dec

record Model where
  constructor MkModel
  counterValue : Double

init : Model
init = MkModel 0.0

view : Model -> Html Event
view model = div'
  [ button_ [onClick Inc] $ text "+"
  , textS model.counterValue
  , button_ [onClick Dec] $ text "-"
  ]

update : Model -> Event -> Model
update model event = case event of
  Inc => record {counterValue $= (+  1.0)} model
  Dec => record {counterValue $= (+ -1.0)} model

app : Application Model Event
app = MkApplication init view update

main : IO ()
main = render (reactElementFromApplication app) !(getElementById "app-root")
