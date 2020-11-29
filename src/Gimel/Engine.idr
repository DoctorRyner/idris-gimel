module Gimel.Engine

import React
import Gimel.Application
import Gimel.Html
import Js.Console
import Js.FFI
import Data.Vect

export
reactElementFromApplication : Application model event -> ReactElement
reactElementFromApplication application = fc $ do
  (state, setState) <- useState application.init

  let
    runEvent : event -> IO ()
    runEvent event = do
      let nextModel = application.update state event

      setState nextModel

  pure $
    toReactElement
      runEvent
      (application.view state)
