module Gimel.Attribute

import Js.Console
import Js.Object

export
data Attribute event = MkAttribute ((event -> IO ()) -> Object)

export
attribute : String -> a -> Attribute event
attribute key val = MkAttribute $ \_ => key =: val

export
(=:) : String -> a -> Attribute event
(=:) = attribute

export
eventAttribute : String -> ((event -> IO ()) -> IO ()) -> Attribute event
eventAttribute name action = MkAttribute $ \runEvent => name =: action runEvent

export
toObject : (event -> IO ()) -> Attribute event -> Object
toObject runEvent (MkAttribute f) = f runEvent

-- Events

export
onClick : event -> Attribute event
onClick event = eventAttribute "onClick" ($ event)

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
