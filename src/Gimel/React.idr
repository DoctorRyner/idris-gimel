module Gimel.React

import Js.Array
import Js.Object
import Js.Dom
import Js.FFI
import Js.Uuid

public export
data ReactElement : Type

public export
data ReactClass : Type

export
text : String -> ReactElement
text = unsafeCoerce

%foreign "browser:lambda:(x, props, children) => require('react').createElement(x, props, children)"
js_createElement : ReactClass -> Object -> Array ReactElement -> ReactElement

%foreign "browser:lambda:(x, props) => require('react').createElement(x, props)"
js_createElementChildless : ReactClass -> Object -> ReactElement

export
createElement : ReactClass -> List Object -> List ReactElement -> ReactElement
createElement x props []       = js_createElementChildless x (fromList props)
createElement x props children = js_createElement x (fromList props) (fromList children)

export
%foreign (js "x => x")
classFromTag : String -> ReactClass

export
el : String -> List Object -> List ReactElement -> ReactElement
el tag = createElement (classFromTag tag)

export
fc : IO ReactElement -> ReactElement
fc m = createElement (unsafeCoerce m) [] []

export
%foreign "browser:lambda:() => require('react').Fragment"
fragmentClass : ReactClass

%foreign (req "react" "f" "useEffect(f)")
prim__useEffect : IO () -> PrimIO ()

export
useEffect : IO () -> IO ()
useEffect = primIO . prim__useEffect

%foreign (req "react" "(_, x)" "useState(x)")
prim__useState : a -> PrimIO (Array AnyPtr)

%foreign (js "(_, f, arg) => f(arg)")
prim__call : AnyPtr -> a -> PrimIO ()

export
call : AnyPtr -> a -> IO ()
call f = primIO . prim__call f

export
useState : a -> IO (a, (a -> a) -> IO ())
useState initialState = do
    stateAndSetStateArrayRepresentation <- primIO $ prim__useState initialState
    let state    = index 0 stateAndSetStateArrayRepresentation
        setState = index 1 stateAndSetStateArrayRepresentation
    pure ( unsafeCoerce state
         , call setState
         )

%foreign (req "react-dom" "(el, root)" "render(el, root)")
prim__render : ReactElement -> HtmlElement -> PrimIO ()

export
render : ReactElement -> HtmlElement -> IO ()
render el = primIO . prim__render el