module Gimel.React

import Js.Array
import Js.Object
import Js.Dom
import Js.FFI

public export
data ReactElement : Type

public export
data ReactClass : Type

export
text : String -> ReactElement
text = unsafeCoerce

%foreign (req "react" "(x, props, children)" "createElement(x, props, children)")
js_createElement : ReactClass -> Object -> Array ReactElement -> ReactElement

export
createElement : ReactClass -> List Object -> List ReactElement -> ReactElement
createElement x props = js_createElement x (fromList props) . fromList

export
%foreign (js "x => x")
classFromTag : String -> ReactClass

export
el : String -> List Object -> List ReactElement -> ReactElement
el tag = createElement (classFromTag tag)

export
%foreign (req "react" "f" "createElement(f, {}, [])")
fc : IO ReactElement -> ReactElement

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