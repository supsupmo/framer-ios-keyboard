# iOS Keyboard for Framer 3
Because sometimes we all need to simulate typing in our framer prototypes.

## How to use with Framer Studio

* Create a new Framer project
* Download `iphone6Keyboard.coffee` and `iphone6Keyboard.jpg`, put both files in the `module` folder of the project
* At the top of your code, write `keyboard = require "iphone6Keyboard"`

## Demo GIF

_Coming soon_

## Usage

Available commands

```
# At the top of your code
keyboard = require "iphone6Keyboard"

# Somewhere below
keyboard.create()       # Creates the keyboard (hidden)

keyboard.show()         # Animates keyboard up
keyboard.show(true)     # Immediately shows keyboard
keyboard.hide()         # Animates keyboard down
keyboard.hide(true)     # Immediately hides keyboard

keyboard.keyPress("j")  # Simulate the pressing of j
```

## Notes

* Currently, `keyPress` supports the `a-z` and `space` keys.
* Only the iPhone6 keyboard has been implemented. User demand will create motivation for me to create keyboards for the other iPhones as well.
* The animation curve used for the keyboard show/hide animation is close but not exactly the same as what's on the phone. If anyone knows the actual timing and bezier-curve numbers, please let me know.