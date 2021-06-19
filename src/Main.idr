module Main

import Gimel.Attribute
import Gimel.Application
import Gimel.Engine
import Gimel.Html
import Gimel.React
import Js.Console
import Js.Dom

data Event = Inc | Dec

record Model where
  constructor MkModel
  counterValue : Int

init : Model
init = MkModel 0

view : Model -> Html Event
view model = fc $ do
    useEffect $ print "Idris Gimel useEffect react hook test"

    pure $ div'
        [ button_ [onClick Inc] $ text "+"
        , textS model.counterValue
        , button_ [onClick Dec] $ text "-"
        , h1 [style $ "color" =: "blue"] [text "KEK"]
        ]

update : Model -> Event -> Model
update model event = case event of
  Inc => {counterValue $= (+  1)} model
  Dec => {counterValue $= (+ -1)} model

app : Application Model Event
app = MkApplication init view update

main : IO ()
main = render (reactElementFromApplication app) !(getElementById "app-root")