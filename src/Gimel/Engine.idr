module Gimel.Engine

import Data.Vect
import Gimel.Application
import Gimel.Cmd
import Gimel.Html
import Gimel.React
import Gimel.Update
import Gimel.Sub
import Js.Console
import Js.Dom
import Js.FFI
import Js.Timeout
import Data.IORef

export
reactElementFromApplication : Application model' event -> ReactElement
reactElementFromApplication application = fc $ do
    (state, setState) <- useState application.init

    let runEvent : event -> IO ()
        runEvent event = setState $ \currentState => unsafePerformIO $ do
            let update = application.update currentState event

            -- Run cmds asynchronously
            traverse_ (\(MkCmd f) => setTimeout (f runEvent) 0) update.cmds

            pure update.model

    pure $ toReactElement runEvent (application.view state)

export
reactElementFromApplication2 : Application model' event -> ReactElement
reactElementFromApplication2 application = fc $ do
    modelRef <- newIORef application.init

    (state, modifyState) <- useState application.init

    let runCmds : List (Cmd event) -> (event -> IO ()) -> IO ()
        runCmds cmds runEvent = traverse_ (\(MkCmd f) => setTimeout (f runEvent) 0) cmds

        runEvent : event -> IO ()
        runEvent event = do
            model <- readIORef modelRef

            let update = application.update model event

            writeIORef modelRef update.model

            modifyState $ const update.model

            runCmds update.cmds runEvent

    pure $ toReactElement runEvent (application.view state)

export
runApp : Application model' event -> IO ()
runApp application =
  render (reactElementFromApplication2 application)
         !(getElementById "app-root")

export
run : (init : model')
   -> (view : model' -> Html event)
   -> (update : model' -> event -> Update model' event)
   -> (subs : Sub model' event)
   -> IO ()
run init view update subs = runApp $ MkApplication {init, view, update, subs}