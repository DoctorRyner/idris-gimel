module Gimel.Sub

import Gimel.Cmd

export
data SubStatus
    = Active (IO ())
    | Inactive

export
record SubInstance model event where
    constructor MkSubInstance
    checkCondition : model -> Bool
    enable         : model -> (event -> IO ()) -> IO (IO ())
    status         : SubStatus

export
data Sub model event
    = MkSub (SubInstance model event)
    | Always (model -> Cmd event)
    | Batch (List (Sub model event))

export
Semigroup (Sub model event) where
    (<+>) x y = Batch [x, y]

export
Monoid (Sub model event) where
    neutral = Batch []

mkSub : (  model
        -> (event -> IO ())
        -> IO (IO ())
        )
     -> Sub model event
mkSub enable = MkSub $ MkSubInstance {checkCondition = const True, status = Inactive, enable}

enableWhen : (model -> Bool) -> Sub model event -> Sub model event
enableWhen checkCondition (MkSub inst) = MkSub $ {checkCondition := checkCondition} inst
enableWhen _                         x = x

always : (model -> Cmd event) -> Sub model event
always = Always

logModel : Show model => Sub model event
logModel = Always $ MkCmd . const . print . show

execEvents : List event -> Sub model event
execEvents events = mkSub \_, runEvent => do
    traverse_ runEvent events
    pure $ pure ()

runCmds : List (Cmd event) -> Sub model event
runCmds cmds = mkSub \_, runEvent => do
    traverse_ (\(MkCmd f) => f runEvent) cmds
    pure $ pure ()