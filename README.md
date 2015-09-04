# iOS Keyboard for Framer 3
Because sometimes we all need to simulate typing in our framer prototypes.

## How to use with Framer Studio

* Create a new Framer project
* Download `iPhone6Keyboard.coffee` and `iPhone6Keyboard.jpg`, put both files in the `module` folder of the project
* At the top of your code, write `keyboard = require "iPhone6Keyboard"`

## Demo GIF

![](https://github.com/supsupmo/ios-keyboard-for-framer/blob/master/demo/iPhone6.gif)

The GIF is a little faster than the actual default animation. Here's a more [realistic demo](https://github.com/supsupmo/ios-keyboard-for-framer/blob/master/demo/iPhone6.mov?raw=true), if you're interested.

## Usage

Available commands

```
# At the top of your code
keyboard = require "iPhone6Keyboard"

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
* Only the iPhone 6 keyboard has been implemented. If there's demand, I'll create keyboards for the other iPhones as well.
* The animation curve used for the keyboard show/hide animation is close but not exactly the same as what's implemented on the phone. If anyone knows the actual timing and bezier-curve numbers, please let me know.

Reach me (@MosesTing)[https://www.twitter.com/mosesting]. Cheers!
