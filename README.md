Template package for writing headless Elm
===

This is a sample package that demonstrates how to write an application that can
be run via node. It works by:

* Building an elm bundle to `build/elm-bundle.js`
* Using `index.js` to bootstrap the Elm application
* Using ports to communicate back and forth between Javascript and Elm
* Using Html.App.programWithFlags to supply Elm with input when it starts

Given this setup, its pretty easy to start swapping things out. For example, you
could use something like JS Commander to write your applicaiton help menu and
modify the Flags type in Elm to take parameters in from the command line (with
type safety!). The only weird part is the `view` function. Since it uses the
`Html` module for the program type it still takes in a `view`, it just never
gets embedded into anything.


## Running

Just execute `make name=MyName` in the root of this workspace. Checkout the `Makefile` to
see what that does. You'll see the following.

```bash
elm make ./src/elm/Main.elm --output build/elm-bundle.js
Success! Compiled 1 module.
Successfully generated build/elm-bundle.js
node ./index.js Anthony
listening for elm messages
Elm said: { message: 'Hello Anthony', times: 1 }
Javascript said: { message = "Hey elm!", times = 2 }
Elm said: { message: 'Hey Javascript...', times: 3 }
Javascript said: { message = "Hey elm!", times = 4 }
Elm said: { message: 'Hey Javascript...', times: 5 }
Javascript said: { message = "Hey elm!", times = 6 }
Elm said: { message: 'Hey Javascript...', times: 7 }
```
