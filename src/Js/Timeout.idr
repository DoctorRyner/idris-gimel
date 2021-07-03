module Js.Timeout

%foreign "javascript:lambda:(f, timeout) => setTimeout(f, timeout)"
prim__setTimeout : IO () -> Double -> PrimIO ()

export
setTimeout : IO () -> Double -> IO ()
setTimeout f = primIO . prim__setTimeout f