module App.Events where

import Prelude ((==))
import App.Routes (Route)
import App.State (State(..))
import Data.Function (($))
import Network.HTTP.Affjax (AJAX)
import Pux (EffModel, noEffects)

data Event = PageView Route | UpdateCode String | Validate

type AppEffects fx = (ajax :: AJAX | fx)

foldp :: ∀ fx. Event -> State -> EffModel State Event (AppEffects fx)
foldp (PageView route) (State st) = noEffects $ State st { route = route, loaded = true }
foldp (UpdateCode code) (State st) = noEffects $ State st { code = code }
foldp Validate (State st) = noEffects $ State st { valid = st.code == "riffraff" }
