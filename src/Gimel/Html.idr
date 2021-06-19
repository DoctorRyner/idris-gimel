module Gimel.Html

import Gimel.Attribute
import Gimel.React

export
data Html event
  = Text String
  | Component ReactClass (List (Attribute event)) (List (Html event))
  | RawComponent ReactElement

-- Helpers

export
text : String -> Html event
text = Text

export
textS : Show a => a -> Html event
textS = text . show

export
el : String -> List (Attribute event) -> List (Html event) -> Html event
el tag = Component (classFromTag tag)

export
el_ : String -> List (Attribute event) -> Html event -> Html event
el_ tag attrs child = Component (classFromTag tag) attrs [child]

export
el' : String -> List (Html event) -> Html event
el' tag = Component (classFromTag tag) []

export
rawComponent : ReactElement -> Html event
rawComponent = RawComponent

export
component : ReactClass -> List (Attribute event) -> List (Html event) -> Html event
component = Component

export
toReactElement : (event -> IO ()) -> Html event -> ReactElement
toReactElement runEvent = \case
    Text s                       => text s
    RawComponent reactElement    => reactElement
    Component class attrs childs =>
        createElement
            class
            (map (toObject runEvent) attrs)
            (map (toReactElement runEvent) childs)

export
fc : IO (Html event) -> Html event
fc eff = rawComponent $ fc $ do
    html <- eff
    pure $ toReactElement (const $ pure ()) html

-- Tags

export
a_ : List (Attribute event) -> Html event -> Html event
a_ = el_ "a"

export
a : List (Attribute event) -> List (Html event) -> Html event
a = el "a"

export
a' : List (Html event) -> Html event
a' = el' "a"

export
abbr_ : List (Attribute event) -> Html event -> Html event
abbr_ = el_ "abbr"

export
abbr : List (Attribute event) -> List (Html event) -> Html event
abbr = el "abbr"

export
abbr' : List (Html event) -> Html event
abbr' = el' "abbr"

export
acronym_ : List (Attribute event) -> Html event -> Html event
acronym_ = el_ "acronym"

export
acronym : List (Attribute event) -> List (Html event) -> Html event
acronym = el "acronym"

export
acronym' : List (Html event) -> Html event
acronym' = el' "acronym"

export
address_ : List (Attribute event) -> Html event -> Html event
address_ = el_ "address"

export
address : List (Attribute event) -> List (Html event) -> Html event
address = el "address"

export
address' : List (Html event) -> Html event
address' = el' "address"

export
applet_ : List (Attribute event) -> Html event -> Html event
applet_ = el_ "applet"

export
applet : List (Attribute event) -> List (Html event) -> Html event
applet = el "applet"

export
applet' : List (Html event) -> Html event
applet' = el' "applet"

export
article_ : List (Attribute event) -> Html event -> Html event
article_ = el_ "article"

export
article : List (Attribute event) -> List (Html event) -> Html event
article = el "article"

export
article' : List (Html event) -> Html event
article' = el' "article"

export
aside_ : List (Attribute event) -> Html event -> Html event
aside_ = el_ "aside"

export
aside : List (Attribute event) -> List (Html event) -> Html event
aside = el "aside"

export
aside' : List (Html event) -> Html event
aside' = el' "aside"

export
audio_ : List (Attribute event) -> Html event -> Html event
audio_ = el_ "audio"

export
audio : List (Attribute event) -> List (Html event) -> Html event
audio = el "audio"

export
audio' : List (Html event) -> Html event
audio' = el' "audio"

export
b_ : List (Attribute event) -> Html event -> Html event
b_ = el_ "b"

export
b : List (Attribute event) -> List (Html event) -> Html event
b = el "b"

export
b' : List (Html event) -> Html event
b' = el' "b"

export
base_ : List (Attribute event) -> Html event -> Html event
base_ = el_ "base"

export
base : List (Attribute event) -> List (Html event) -> Html event
base = el "base"

export
base' : List (Html event) -> Html event
base' = el' "base"

export
basefont_ : List (Attribute event) -> Html event -> Html event
basefont_ = el_ "basefont"

export
basefont : List (Attribute event) -> List (Html event) -> Html event
basefont = el "basefont"

export
basefont' : List (Html event) -> Html event
basefont' = el' "basefont"

export
bdi_ : List (Attribute event) -> Html event -> Html event
bdi_ = el_ "bdi"

export
bdi : List (Attribute event) -> List (Html event) -> Html event
bdi = el "bdi"

export
bdi' : List (Html event) -> Html event
bdi' = el' "bdi"

export
bdo_ : List (Attribute event) -> Html event -> Html event
bdo_ = el_ "bdo"

export
bdo : List (Attribute event) -> List (Html event) -> Html event
bdo = el "bdo"

export
bdo' : List (Html event) -> Html event
bdo' = el' "bdo"

export
big_ : List (Attribute event) -> Html event -> Html event
big_ = el_ "big"

export
big : List (Attribute event) -> List (Html event) -> Html event
big = el "big"

export
big' : List (Html event) -> Html event
big' = el' "big"

export
blockquote_ : List (Attribute event) -> Html event -> Html event
blockquote_ = el_ "blockquote"

export
blockquote : List (Attribute event) -> List (Html event) -> Html event
blockquote = el "blockquote"

export
blockquote' : List (Html event) -> Html event
blockquote' = el' "blockquote"

export
body_ : List (Attribute event) -> Html event -> Html event
body_ = el_ "body"

export
body : List (Attribute event) -> List (Html event) -> Html event
body = el "body"

export
body' : List (Html event) -> Html event
body' = el' "body"

export
button_ : List (Attribute event) -> Html event -> Html event
button_ = el_ "button"

export
button : List (Attribute event) -> List (Html event) -> Html event
button = el "button"

export
button' : List (Html event) -> Html event
button' = el' "button"

export
canvas_ : List (Attribute event) -> Html event -> Html event
canvas_ = el_ "canvas"

export
canvas : List (Attribute event) -> List (Html event) -> Html event
canvas = el "canvas"

export
canvas' : List (Html event) -> Html event
canvas' = el' "canvas"

export
caption_ : List (Attribute event) -> Html event -> Html event
caption_ = el_ "caption"

export
caption : List (Attribute event) -> List (Html event) -> Html event
caption = el "caption"

export
caption' : List (Html event) -> Html event
caption' = el' "caption"

export
center_ : List (Attribute event) -> Html event -> Html event
center_ = el_ "center"

export
center : List (Attribute event) -> List (Html event) -> Html event
center = el "center"

export
center' : List (Html event) -> Html event
center' = el' "center"

export
cite_ : List (Attribute event) -> Html event -> Html event
cite_ = el_ "cite"

export
cite : List (Attribute event) -> List (Html event) -> Html event
cite = el "cite"

export
cite' : List (Html event) -> Html event
cite' = el' "cite"

export
code_ : List (Attribute event) -> Html event -> Html event
code_ = el_ "code"

export
code : List (Attribute event) -> List (Html event) -> Html event
code = el "code"

export
code' : List (Html event) -> Html event
code' = el' "code"

export
col_ : List (Attribute event) -> Html event -> Html event
col_ = el_ "col"

export
col : List (Attribute event) -> List (Html event) -> Html event
col = el "col"

export
col' : List (Html event) -> Html event
col' = el' "col"

export
colgroup_ : List (Attribute event) -> Html event -> Html event
colgroup_ = el_ "colgroup"

export
colgroup : List (Attribute event) -> List (Html event) -> Html event
colgroup = el "colgroup"

export
colgroup' : List (Html event) -> Html event
colgroup' = el' "colgroup"

export
data_ : List (Attribute event) -> List (Html event) -> Html event
data_ = el "data"

export
data' : List (Html event) -> Html event
data' = el' "data"

export
datalist_ : List (Attribute event) -> Html event -> Html event
datalist_ = el_ "datalist"

export
datalist : List (Attribute event) -> List (Html event) -> Html event
datalist = el "datalist"

export
datalist' : List (Html event) -> Html event
datalist' = el' "datalist"

export
dd_ : List (Attribute event) -> Html event -> Html event
dd_ = el_ "dd"

export
dd : List (Attribute event) -> List (Html event) -> Html event
dd = el "dd"

export
dd' : List (Html event) -> Html event
dd' = el' "dd"

export
del_ : List (Attribute event) -> Html event -> Html event
del_ = el_ "del"

export
del : List (Attribute event) -> List (Html event) -> Html event
del = el "del"

export
del' : List (Html event) -> Html event
del' = el' "del"

export
details_ : List (Attribute event) -> Html event -> Html event
details_ = el_ "details"

export
details : List (Attribute event) -> List (Html event) -> Html event
details = el "details"

export
details' : List (Html event) -> Html event
details' = el' "details"

export
dfn_ : List (Attribute event) -> Html event -> Html event
dfn_ = el_ "dfn"

export
dfn : List (Attribute event) -> List (Html event) -> Html event
dfn = el "dfn"

export
dfn' : List (Html event) -> Html event
dfn' = el' "dfn"

export
dialog_ : List (Attribute event) -> Html event -> Html event
dialog_ = el_ "dialog"

export
dialog : List (Attribute event) -> List (Html event) -> Html event
dialog = el "dialog"

export
dialog' : List (Html event) -> Html event
dialog' = el' "dialog"

export
dir_ : List (Attribute event) -> Html event -> Html event
dir_ = el_ "dir"

export
dir : List (Attribute event) -> List (Html event) -> Html event
dir = el "dir"

export
dir' : List (Html event) -> Html event
dir' = el' "dir"

export
div_ : List (Attribute event) -> Html event -> Html event
div_ = el_ "div"

export
div : List (Attribute event) -> List (Html event) -> Html event
div = el "div"

export
div' : List (Html event) -> Html event
div' = el' "div"

export
dl_ : List (Attribute event) -> Html event -> Html event
dl_ = el_ "dl"

export
dl : List (Attribute event) -> List (Html event) -> Html event
dl = el "dl"

export
dl' : List (Html event) -> Html event
dl' = el' "dl"

export
dt_ : List (Attribute event) -> Html event -> Html event
dt_ = el_ "dt"

export
dt : List (Attribute event) -> List (Html event) -> Html event
dt = el "dt"

export
dt' : List (Html event) -> Html event
dt' = el' "dt"

export
em_ : List (Attribute event) -> Html event -> Html event
em_ = el_ "em"

export
em : List (Attribute event) -> List (Html event) -> Html event
em = el "em"

export
em' : List (Html event) -> Html event
em' = el' "em"

export
embed_ : List (Attribute event) -> Html event -> Html event
embed_ = el_ "embed"

export
embed : List (Attribute event) -> List (Html event) -> Html event
embed = el "embed"

export
embed' : List (Html event) -> Html event
embed' = el' "embed"

export
fieldset_ : List (Attribute event) -> Html event -> Html event
fieldset_ = el_ "fieldset"

export
fieldset : List (Attribute event) -> List (Html event) -> Html event
fieldset = el "fieldset"

export
fieldset' : List (Html event) -> Html event
fieldset' = el' "fieldset"

export
figcaption_ : List (Attribute event) -> Html event -> Html event
figcaption_ = el_ "figcaption"

export
figcaption : List (Attribute event) -> List (Html event) -> Html event
figcaption = el "figcaption"

export
figcaption' : List (Html event) -> Html event
figcaption' = el' "figcaption"

export
figure_ : List (Attribute event) -> Html event -> Html event
figure_ = el_ "figure"

export
figure : List (Attribute event) -> List (Html event) -> Html event
figure = el "figure"

export
figure' : List (Html event) -> Html event
figure' = el' "figure"

export
font_ : List (Attribute event) -> Html event -> Html event
font_ = el_ "font"

export
font : List (Attribute event) -> List (Html event) -> Html event
font = el "font"

export
font' : List (Html event) -> Html event
font' = el' "font"

export
footer_ : List (Attribute event) -> Html event -> Html event
footer_ = el_ "footer"

export
footer : List (Attribute event) -> List (Html event) -> Html event
footer = el "footer"

export
footer' : List (Html event) -> Html event
footer' = el' "footer"

export
form_ : List (Attribute event) -> Html event -> Html event
form_ = el_ "form"

export
form : List (Attribute event) -> List (Html event) -> Html event
form = el "form"

export
form' : List (Html event) -> Html event
form' = el' "form"

export
frame_ : List (Attribute event) -> Html event -> Html event
frame_ = el_ "frame"

export
frame : List (Attribute event) -> List (Html event) -> Html event
frame = el "frame"

export
frame' : List (Html event) -> Html event
frame' = el' "frame"

export
frameset_ : List (Attribute event) -> Html event -> Html event
frameset_ = el_ "frameset"

export
frameset : List (Attribute event) -> List (Html event) -> Html event
frameset = el "frameset"

export
frameset' : List (Html event) -> Html event
frameset' = el' "frameset"

export
h1_ : List (Attribute event) -> Html event -> Html event
h1_ = el_ "h1"

export
h1 : List (Attribute event) -> List (Html event) -> Html event
h1 = el "h1"

export
h1' : List (Html event) -> Html event
h1' = el' "h1"

export
h2_ : List (Attribute event) -> Html event -> Html event
h2_ = el_ "h2"

export
h2 : List (Attribute event) -> List (Html event) -> Html event
h2 = el "h2"

export
h2' : List (Html event) -> Html event
h2' = el' "h2"

export
h3_ : List (Attribute event) -> Html event -> Html event
h3_ = el_ "h3"

export
h3 : List (Attribute event) -> List (Html event) -> Html event
h3 = el "h3"

export
h3' : List (Html event) -> Html event
h3' = el' "h3"

export
h4_ : List (Attribute event) -> Html event -> Html event
h4_ = el_ "h4"

export
h4 : List (Attribute event) -> List (Html event) -> Html event
h4 = el "h4"

export
h4' : List (Html event) -> Html event
h4' = el' "h4"

export
h5_ : List (Attribute event) -> Html event -> Html event
h5_ = el_ "h5"

export
h5 : List (Attribute event) -> List (Html event) -> Html event
h5 = el "h5"

export
h5' : List (Html event) -> Html event
h5' = el' "h5"

export
h6_ : List (Attribute event) -> Html event -> Html event
h6_ = el_ "h6"

export
h6 : List (Attribute event) -> List (Html event) -> Html event
h6 = el "h6"

export
h6' : List (Html event) -> Html event
h6' = el' "h6"

export
head_ : List (Attribute event) -> Html event -> Html event
head_ = el_ "head"

export
head : List (Attribute event) -> List (Html event) -> Html event
head = el "head"

export
head' : List (Html event) -> Html event
head' = el' "head"

export
header_ : List (Attribute event) -> Html event -> Html event
header_ = el_ "header"

export
header : List (Attribute event) -> List (Html event) -> Html event
header = el "header"

export
header' : List (Html event) -> Html event
header' = el' "header"

export
hr_ : List (Attribute event) -> Html event -> Html event
hr_ = el_ "hr"

export
hr : List (Attribute event) -> List (Html event) -> Html event
hr = el "hr"

export
hr' : List (Html event) -> Html event
hr' = el' "hr"

export
html_ : List (Attribute event) -> Html event -> Html event
html_ = el_ "html"

export
html : List (Attribute event) -> List (Html event) -> Html event
html = el "html"

export
html' : List (Html event) -> Html event
html' = el' "html"

export
i_ : List (Attribute event) -> Html event -> Html event
i_ = el_ "i"

export
i : List (Attribute event) -> List (Html event) -> Html event
i = el "i"

export
i' : List (Html event) -> Html event
i' = el' "i"

export
iframe_ : List (Attribute event) -> Html event -> Html event
iframe_ = el_ "iframe"

export
iframe : List (Attribute event) -> List (Html event) -> Html event
iframe = el "iframe"

export
iframe' : List (Html event) -> Html event
iframe' = el' "iframe"

export
ins_ : List (Attribute event) -> Html event -> Html event
ins_ = el_ "ins"

export
ins : List (Attribute event) -> List (Html event) -> Html event
ins = el "ins"

export
ins' : List (Html event) -> Html event
ins' = el' "ins"

export
kbd_ : List (Attribute event) -> Html event -> Html event
kbd_ = el_ "kbd"

export
kbd : List (Attribute event) -> List (Html event) -> Html event
kbd = el "kbd"

export
kbd' : List (Html event) -> Html event
kbd' = el' "kbd"

export
label_ : List (Attribute event) -> Html event -> Html event
label_ = el_ "label"

export
label : List (Attribute event) -> List (Html event) -> Html event
label = el "label"

export
label' : List (Html event) -> Html event
label' = el' "label"

export
legend_ : List (Attribute event) -> Html event -> Html event
legend_ = el_ "legend"

export
legend : List (Attribute event) -> List (Html event) -> Html event
legend = el "legend"

export
legend' : List (Html event) -> Html event
legend' = el' "legend"

export
li_ : List (Attribute event) -> Html event -> Html event
li_ = el_ "li"

export
li : List (Attribute event) -> List (Html event) -> Html event
li = el "li"

export
li' : List (Html event) -> Html event
li' = el' "li"

export
link_ : List (Attribute event) -> Html event -> Html event
link_ = el_ "link"

export
link : List (Attribute event) -> List (Html event) -> Html event
link = el "link"

export
link' : List (Html event) -> Html event
link' = el' "link"

export
main_ : List (Attribute event) -> Html event -> Html event
main_ = el_ "main"

export
main : List (Attribute event) -> List (Html event) -> Html event
main = el "main"

export
main' : List (Html event) -> Html event
main' = el' "main"

export
map_ : List (Attribute event) -> Html event -> Html event
map_ = el_ "map"

export
map : List (Attribute event) -> List (Html event) -> Html event
map = el "map"

export
map' : List (Html event) -> Html event
map' = el' "map"

export
mark_ : List (Attribute event) -> Html event -> Html event
mark_ = el_ "mark"

export
mark : List (Attribute event) -> List (Html event) -> Html event
mark = el "mark"

export
mark' : List (Html event) -> Html event
mark' = el' "mark"

export
meta_ : List (Attribute event) -> Html event -> Html event
meta_ = el_ "meta"

export
meta : List (Attribute event) -> List (Html event) -> Html event
meta = el "meta"

export
meta' : List (Html event) -> Html event
meta' = el' "meta"

export
meter_ : List (Attribute event) -> Html event -> Html event
meter_ = el_ "meter"

export
meter : List (Attribute event) -> List (Html event) -> Html event
meter = el "meter"

export
meter' : List (Html event) -> Html event
meter' = el' "meter"

export
nav_ : List (Attribute event) -> Html event -> Html event
nav_ = el_ "nav"

export
nav : List (Attribute event) -> List (Html event) -> Html event
nav = el "nav"

export
nav' : List (Html event) -> Html event
nav' = el' "nav"

export
noframes_ : List (Attribute event) -> Html event -> Html event
noframes_ = el_ "noframes"

export
noframes : List (Attribute event) -> List (Html event) -> Html event
noframes = el "noframes"

export
noframes' : List (Html event) -> Html event
noframes' = el' "noframes"

export
noscript_ : List (Attribute event) -> Html event -> Html event
noscript_ = el_ "noscript"

export
noscript : List (Attribute event) -> List (Html event) -> Html event
noscript = el "noscript"

export
noscript' : List (Html event) -> Html event
noscript' = el' "noscript"

export
object_ : List (Attribute event) -> Html event -> Html event
object_ = el_ "object"

export
object : List (Attribute event) -> List (Html event) -> Html event
object = el "object"

export
object' : List (Html event) -> Html event
object' = el' "object"

export
ol_ : List (Attribute event) -> Html event -> Html event
ol_ = el_ "ol"

export
ol : List (Attribute event) -> List (Html event) -> Html event
ol = el "ol"

export
ol' : List (Html event) -> Html event
ol' = el' "ol"

export
optgroup_ : List (Attribute event) -> Html event -> Html event
optgroup_ = el_ "optgroup"

export
optgroup : List (Attribute event) -> List (Html event) -> Html event
optgroup = el "optgroup"

export
optgroup' : List (Html event) -> Html event
optgroup' = el' "optgroup"

export
option_ : List (Attribute event) -> Html event -> Html event
option_ = el_ "option"

export
option : List (Attribute event) -> List (Html event) -> Html event
option = el "option"

export
option' : List (Html event) -> Html event
option' = el' "option"

export
output_ : List (Attribute event) -> Html event -> Html event
output_ = el_ "output"

export
output : List (Attribute event) -> List (Html event) -> Html event
output = el "output"

export
output' : List (Html event) -> Html event
output' = el' "output"

export
p_ : List (Attribute event) -> Html event -> Html event
p_ = el_ "p"

export
p : List (Attribute event) -> List (Html event) -> Html event
p = el "p"

export
p' : List (Html event) -> Html event
p' = el' "p"

export
param_ : List (Attribute event) -> Html event -> Html event
param_ = el_ "param"

export
param : List (Attribute event) -> List (Html event) -> Html event
param = el "param"

export
param' : List (Html event) -> Html event
param' = el' "param"

export
picture_ : List (Attribute event) -> Html event -> Html event
picture_ = el_ "picture"

export
picture : List (Attribute event) -> List (Html event) -> Html event
picture = el "picture"

export
picture' : List (Html event) -> Html event
picture' = el' "picture"

export
pre_ : List (Attribute event) -> Html event -> Html event
pre_ = el_ "pre"

export
pre : List (Attribute event) -> List (Html event) -> Html event
pre = el "pre"

export
pre' : List (Html event) -> Html event
pre' = el' "pre"

export
progress_ : List (Attribute event) -> Html event -> Html event
progress_ = el_ "progress"

export
progress : List (Attribute event) -> List (Html event) -> Html event
progress = el "progress"

export
progress' : List (Html event) -> Html event
progress' = el' "progress"

export
q_ : List (Attribute event) -> Html event -> Html event
q_ = el_ "q"

export
q : List (Attribute event) -> List (Html event) -> Html event
q = el "q"

export
q' : List (Html event) -> Html event
q' = el' "q"

export
rp_ : List (Attribute event) -> Html event -> Html event
rp_ = el_ "rp"

export
rp : List (Attribute event) -> List (Html event) -> Html event
rp = el "rp"

export
rp' : List (Html event) -> Html event
rp' = el' "rp"

export
rt_ : List (Attribute event) -> Html event -> Html event
rt_ = el_ "rt"

export
rt : List (Attribute event) -> List (Html event) -> Html event
rt = el "rt"

export
rt' : List (Html event) -> Html event
rt' = el' "rt"

export
ruby_ : List (Attribute event) -> Html event -> Html event
ruby_ = el_ "ruby"

export
ruby : List (Attribute event) -> List (Html event) -> Html event
ruby = el "ruby"

export
ruby' : List (Html event) -> Html event
ruby' = el' "ruby"

export
s_ : List (Attribute event) -> Html event -> Html event
s_ = el_ "s"

export
s : List (Attribute event) -> List (Html event) -> Html event
s = el "s"

export
s' : List (Html event) -> Html event
s' = el' "s"

export
samp_ : List (Attribute event) -> Html event -> Html event
samp_ = el_ "samp"

export
samp : List (Attribute event) -> List (Html event) -> Html event
samp = el "samp"

export
samp' : List (Html event) -> Html event
samp' = el' "samp"

export
script_ : List (Attribute event) -> Html event -> Html event
script_ = el_ "script"

export
script : List (Attribute event) -> List (Html event) -> Html event
script = el "script"

export
script' : List (Html event) -> Html event
script' = el' "script"

export
section_ : List (Attribute event) -> Html event -> Html event
section_ = el_ "section"

export
section : List (Attribute event) -> List (Html event) -> Html event
section = el "section"

export
section' : List (Html event) -> Html event
section' = el' "section"

export
select_ : List (Attribute event) -> Html event -> Html event
select_ = el_ "select"

export
select : List (Attribute event) -> List (Html event) -> Html event
select = el "select"

export
select' : List (Html event) -> Html event
select' = el' "select"

export
small_ : List (Attribute event) -> Html event -> Html event
small_ = el_ "small"

export
small : List (Attribute event) -> List (Html event) -> Html event
small = el "small"

export
small' : List (Html event) -> Html event
small' = el' "small"

export
source_ : List (Attribute event) -> Html event -> Html event
source_ = el_ "source"

export
source : List (Attribute event) -> List (Html event) -> Html event
source = el "source"

export
source' : List (Html event) -> Html event
source' = el' "source"

export
span_ : List (Attribute event) -> Html event -> Html event
span_ = el_ "span"

export
span : List (Attribute event) -> List (Html event) -> Html event
span = el "span"

export
span' : List (Html event) -> Html event
span' = el' "span"

export
strike_ : List (Attribute event) -> Html event -> Html event
strike_ = el_ "strike"

export
strike : List (Attribute event) -> List (Html event) -> Html event
strike = el "strike"

export
strike' : List (Html event) -> Html event
strike' = el' "strike"

export
strong_ : List (Attribute event) -> Html event -> Html event
strong_ = el_ "strong"

export
strong : List (Attribute event) -> List (Html event) -> Html event
strong = el "strong"

export
strong' : List (Html event) -> Html event
strong' = el' "strong"

export
style_ : List (Attribute event) -> Html event -> Html event
style_ = el_ "style"

export
style : List (Attribute event) -> List (Html event) -> Html event
style = el "style"

export
style' : List (Html event) -> Html event
style' = el' "style"

export
sub_ : List (Attribute event) -> Html event -> Html event
sub_ = el_ "sub"

export
sub : List (Attribute event) -> List (Html event) -> Html event
sub = el "sub"

export
sub' : List (Html event) -> Html event
sub' = el' "sub"

export
summary_ : List (Attribute event) -> Html event -> Html event
summary_ = el_ "summary"

export
summary : List (Attribute event) -> List (Html event) -> Html event
summary = el "summary"

export
summary' : List (Html event) -> Html event
summary' = el' "summary"

export
sup_ : List (Attribute event) -> Html event -> Html event
sup_ = el_ "sup"

export
sup : List (Attribute event) -> List (Html event) -> Html event
sup = el "sup"

export
sup' : List (Html event) -> Html event
sup' = el' "sup"

export
svg_ : List (Attribute event) -> Html event -> Html event
svg_ = el_ "svg"

export
svg : List (Attribute event) -> List (Html event) -> Html event
svg = el "svg"

export
svg' : List (Html event) -> Html event
svg' = el' "svg"

export
table_ : List (Attribute event) -> Html event -> Html event
table_ = el_ "table"

export
table : List (Attribute event) -> List (Html event) -> Html event
table = el "table"

export
table' : List (Html event) -> Html event
table' = el' "table"

export
tbody_ : List (Attribute event) -> Html event -> Html event
tbody_ = el_ "tbody"

export
tbody : List (Attribute event) -> List (Html event) -> Html event
tbody = el "tbody"

export
tbody' : List (Html event) -> Html event
tbody' = el' "tbody"

export
td_ : List (Attribute event) -> Html event -> Html event
td_ = el_ "td"

export
td : List (Attribute event) -> List (Html event) -> Html event
td = el "td"

export
td' : List (Html event) -> Html event
td' = el' "td"

export
template_ : List (Attribute event) -> Html event -> Html event
template_ = el_ "template"

export
template : List (Attribute event) -> List (Html event) -> Html event
template = el "template"

export
template' : List (Html event) -> Html event
template' = el' "template"

export
textarea_ : List (Attribute event) -> Html event -> Html event
textarea_ = el_ "textarea"

export
textarea : List (Attribute event) -> List (Html event) -> Html event
textarea = el "textarea"

export
textarea' : List (Html event) -> Html event
textarea' = el' "textarea"

export
tfoot_ : List (Attribute event) -> Html event -> Html event
tfoot_ = el_ "tfoot"

export
tfoot : List (Attribute event) -> List (Html event) -> Html event
tfoot = el "tfoot"

export
tfoot' : List (Html event) -> Html event
tfoot' = el' "tfoot"

export
th_ : List (Attribute event) -> Html event -> Html event
th_ = el_ "th"

export
th : List (Attribute event) -> List (Html event) -> Html event
th = el "th"

export
th' : List (Html event) -> Html event
th' = el' "th"

export
thead_ : List (Attribute event) -> Html event -> Html event
thead_ = el_ "thead"

export
thead : List (Attribute event) -> List (Html event) -> Html event
thead = el "thead"

export
thead' : List (Html event) -> Html event
thead' = el' "thead"

export
time_ : List (Attribute event) -> Html event -> Html event
time_ = el_ "time"

export
time : List (Attribute event) -> List (Html event) -> Html event
time = el "time"

export
time' : List (Html event) -> Html event
time' = el' "time"

export
title_ : List (Attribute event) -> Html event -> Html event
title_ = el_ "title"

export
title : List (Attribute event) -> List (Html event) -> Html event
title = el "title"

export
title' : List (Html event) -> Html event
title' = el' "title"

export
tr_ : List (Attribute event) -> Html event -> Html event
tr_ = el_ "tr"

export
tr : List (Attribute event) -> List (Html event) -> Html event
tr = el "tr"

export
tr' : List (Html event) -> Html event
tr' = el' "tr"

export
track_ : List (Attribute event) -> Html event -> Html event
track_ = el_ "track"

export
track : List (Attribute event) -> List (Html event) -> Html event
track = el "track"

export
track' : List (Html event) -> Html event
track' = el' "track"

export
tt_ : List (Attribute event) -> Html event -> Html event
tt_ = el_ "tt"

export
tt : List (Attribute event) -> List (Html event) -> Html event
tt = el "tt"

export
tt' : List (Html event) -> Html event
tt' = el' "tt"

export
u_ : List (Attribute event) -> Html event -> Html event
u_ = el_ "u"

export
u : List (Attribute event) -> List (Html event) -> Html event
u = el "u"

export
u' : List (Html event) -> Html event
u' = el' "u"

export
ul_ : List (Attribute event) -> Html event -> Html event
ul_ = el_ "ul"

export
ul : List (Attribute event) -> List (Html event) -> Html event
ul = el "ul"

export
ul' : List (Html event) -> Html event
ul' = el' "ul"

export
var_ : List (Attribute event) -> Html event -> Html event
var_ = el_ "var"

export
var : List (Attribute event) -> List (Html event) -> Html event
var = el "var"

export
var' : List (Html event) -> Html event
var' = el' "var"

export
video_ : List (Attribute event) -> Html event -> Html event
video_ = el_ "video"

export
video : List (Attribute event) -> List (Html event) -> Html event
video = el "video"

export
video' : List (Html event) -> Html event
video' = el' "video"

export
wbr_ : List (Attribute event) -> Html event -> Html event
wbr_ = el_ "wbr"

export
wbr : List (Attribute event) -> List (Html event) -> Html event
wbr = el "wbr"

export
wbr' : List (Html event) -> Html event
wbr' = el' "wbr"

-- Special cases

export
img : List (Attribute event) -> Html event
img attrs = el "img" attrs []

export
input : List (Attribute event) -> Html event
input attrs = el "input" attrs []

export
br : Html event
br = el "br" [] []

export
area : List (Attribute event) -> Html event
area attrs = el "area" attrs []