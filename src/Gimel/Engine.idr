module Gimel.Engine

import Data.Vect
import Gimel.Application
import Gimel.Html
import Gimel.React
import Gimel.Update
import Js.Console
import Js.Dom
import Js.FFI

export
reactElementFromApplication : Application model' event -> ReactElement
reactElementFromApplication application = fc $ do
    (state, setState) <- useState application.init

    let runEvent : event -> IO ()
        runEvent event = setState $ \currentState => unsafePerformIO $ do
            let update = application.update currentState event
            pure update.model

    pure $ toReactElement runEvent $ application.view state

export
runApp : Application model' event -> IO ()
runApp application =
  render (reactElementFromApplication application)
         !(getElementById "app-root")

export
run : (init : model')
   -> (view : model' -> Html event)
   -> (update : model' -> event -> Update model' event)
   -> IO ()
run init view update = runApp $ MkApplication {init, view, update}