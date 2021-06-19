module Gimel.Cmd

public export
data Cmd event = MkCmd ((event -> IO ()) -> IO ())

export
cmd : IO () -> Cmd event
cmd eff = MkCmd \_ => eff