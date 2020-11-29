module Gimel.Application

import Gimel.Html

public export
record Application model event where
  constructor MkApplication
  init : model
  view : model -> Html event
  update : model -> event -> model
