module App.View.Homepage where

import Prelude  ((>>>), show, const)
import App.Events (Event(..))
import App.State (State(..))
import Control.Bind (discard)
import Data.Function (($))
import Pux.DOM.HTML (HTML)
import Pux.DOM.Events (onInput, onClick, targetValue)
import Text.Smolder.HTML
import Text.Smolder.HTML.Attributes (href, className)
import Text.Smolder.Markup ((#!), (!), text)

view :: State -> HTML Event
view (State s) =
  div do
    p $ text $ show $ s.valid
    p $ text $ s.code
    textarea #! onInput (targetValue >>> UpdateCode) $ text $ s.code
    button #! onClick (const Validate) $ text "Validate"
