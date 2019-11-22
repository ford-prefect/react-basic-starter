module Components.Counter where

import Prelude

import React.Basic (Component, JSX, StateUpdate(..), createComponent, make, runUpdate)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)

type Props = { }

data Action
  = Increment
  | Decrement

component :: Component Props
component = createComponent "Counter"

counter :: Props -> JSX
counter = make component { initialState, render }
  where
    update self action =
      Update $ case action of
                    Decrement -> self.state - 1
                    Increment -> self.state + 1

    send = runUpdate update

    initialState = 0

    render self =
      R.div_
        [ R.button
            { onClick: capture_ $ send self Decrement
            , children: [ R.text "--" ]
            }
        , R.text (show self.state)
        , R.button
            { onClick: capture_ $ send self Increment
            , children: [ R.text "++" ]
            }
        ]
