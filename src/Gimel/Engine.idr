module Gimel.Engine

import Data.Vect
import Gimel.Application
import Gimel.Html
import Gimel.React
import Js.Console
import Js.FFI

export
reactElementFromApplication : Application model event -> ReactElement
reactElementFromApplication application = fc $ do
    (model, setState) <- useState application.init

    let runEvent : event -> IO ()
        runEvent event = do
            nextModel <- application.update model event

            setState $ const nextModel

    pure $
      toReactElement
        runEvent
        (application.view model)