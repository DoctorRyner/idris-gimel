module Js.Uuid

%foreign """
javascript:lambda:() =>
    ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
        (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    )
"""
prim__uuidv4 : PrimIO String

export
uuidv4 : IO String
uuidv4 = primIO prim__uuidv4