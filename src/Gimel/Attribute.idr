module Gimel.Attribute

import Gimel.Cmd
import public Js.Object

public export
data Attribute event = MkAttribute ((event -> IO ()) -> Object)

export
attribute : String -> a -> Attribute event
attribute key val = MkAttribute $ \_ => key =: val

export
(=:) : String -> a -> Attribute event
(=:) = attribute

export
eventAttribute : String -> Cmd event -> Attribute event
eventAttribute name (MkCmd action) = MkAttribute $ \runEvent => name =: action runEvent

export
toObject : (event -> IO ()) -> Attribute event -> Object
toObject runEvent (MkAttribute f) = f runEvent

-- Helpers

%foreign "javascript:lambda:e => e.target.value"
targetValueOf : Object -> String

stringEvent : String -> (String -> event) -> Attribute event
stringEvent eventName f = MkAttribute $ \runEvent =>
    eventName =: \e => unsafePerformIO $ runEvent $ f $ targetValueOf e

-- Events

export
onClick : event -> Attribute event
onClick event = eventAttribute "onClick" $ MkCmd ($ event)

export
onInput : (String -> event) -> Attribute event
onInput = stringEvent "onInput"

-- Attributes

export
class : String -> Attribute event
class = ("class" =:)

export
id : String -> Attribute event
id = ("id" =:)

export
style : Object -> Attribute event
style = ("style" =:)