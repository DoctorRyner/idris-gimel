module Gimel.Update

import Gimel.Cmd

public export
record UpdateM event model' where
    constructor MkUpdateM
    model : model'
    cmds  : List (Cmd event)

public export
Update : Type -> Type -> Type
Update model' event = UpdateM event model'

export
Functor (UpdateM event) where
    map f update = {model $= f} update

export
Applicative (UpdateM event) where
    pure model = MkUpdateM {model, cmds = []}

export
Monad (UpdateM event) where
    (>>=) update f = {cmds $= (++ update.cmds)} (f update.model)

export
none : model' -> event -> Update model' event
none model = pure . const model

export
withCmds : model' -> List (Cmd event) -> Update model' event
withCmds = MkUpdateM