module Gimel.React.Router

import Gimel.React
import Gimel.Attribute
import Gimel.Html

export
%foreign "browser:lambda:() => require('react-router-dom').BrowserRouter"
browserRouterClass : ReactClass

export
browserRouter : List (Attribute event) -> List (Html event) -> Html event
browserRouter = component browserRouterClass

export
%foreign "browser:lambda:() => require('react-router-dom').Switch"
SwitchClass : ReactClass

export
Switch : List (Attribute event) -> List (Html event) -> Html event
Switch = component SwitchClass

export
%foreign "browser:lambda:() => require('react-router-dom').Route"
RouteClass : ReactClass

export
Route : List (Attribute event) -> List (Html event) -> Html event
Route = component RouteClass