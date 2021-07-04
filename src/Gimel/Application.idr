module Gimel.Application

import Gimel.Html
import Gimel.Update
import Gimel.Sub

public export
record Application model event where
    constructor MkApplication
    init   : model
    view   : model -> Html event
    update : model -> event -> UpdateM event model
    subs   : Sub model event
