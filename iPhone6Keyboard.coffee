###
    iOS Keyboard for Framer
    http://github.com/supsupmo/iPhone6Keyboard-for-framer
###

# =======================================================
# Vars

iPhone6Keyboard = {}
keyboard = null
keyboardUp = false


# =======================================================
# Functions

iPhone6Keyboard.create = ->

    # TODO: Add other iPhone factors if there's demand

    props = iPhone6Props
    keyboard = new Layer
        height: props.height, width: props.width, y: props.screenHeight
        image: "modules/iphone6Keyboard.jpg"

    keyboard.states.animationOptions = {
        # TODO: Mimic the actual timing & curve
        time: props.keyboardSpeed, curve: "ease-in-out"
    }

    keyboard.states.add({
        show: { y: props.screenHeight - props.height }
    })


iPhone6Keyboard.keyPress = (letter) ->
    overlay = new Layer
        superLayer: keyboard, x: 0, y: 0, borderRadius: 6,
        width: iPhone6KeyProps.width, height: iPhone6KeyProps.height,
        backgroundColor: "rgba(0, 0, 0, 0.25)", opacity: 0

    overlay.x = iPhone6KeyLocation[letter].x if iPhone6KeyLocation[letter]
    overlay.y = iPhone6KeyLocation[letter].y if iPhone6KeyLocation[letter]
    overlay.width = iPhone6KeyLocation[letter].width if iPhone6KeyLocation[letter] and iPhone6KeyLocation[letter].width

    aTime = 0.05
    bDelay = 0.1
    bTime = 0.25

    animationA = new Animation({
        layer: overlay
        properties: { opacity: 1 }
        time:   aTime
        curve:  "linear"
    })

    animationB = new Animation({
        layer: overlay
        properties: { opacity: 0 }
        delay:  bDelay
        time:   bTime
        curve:  "linear"
    })

    animationA.on(Events.AnimationEnd, animationB.start)
    delay = aTime + bDelay + bTime
    animationB.on(Events.AnimationEnd, delayDestroy(delay, overlay))
    animationA.start()


delayDestroy = (delay, layer) ->
    Utils.delay delay, ->
        layer.destroy()


iPhone6Keyboard.show = (immediate = false) ->
    if immediate
        keyboard.states.switchInstant("show")
    else
        keyboard.states.switch("show")
    keyboardUp = true


iPhone6Keyboard.hide = (immediate = true) ->
    if immediate
        keyboard.states.switchInstant("default")
    else
        keyboard.states.switch("default")
    keyboardUp = false


# =======================================================
# Properties

iPhone6Props =
    height: 516
    width: 750
    screenHeight: 1334
    screenWidth: 750
    keyboardSpeed: 0.35

iPhone6KeyProps =
    margin: 12, width: 63, height: 84,
    row1y: 104, row1x: 6,
    row2x: 43,  row2y: 212,
    row3x: 118, row3y: 320

iPhone6KeyLocation =
    # First Row of Keys
    q: "x": iPhone6KeyProps.row1x, "y": iPhone6KeyProps.row1y
    w: "x": iPhone6KeyProps.row1x + (1 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    e: "x": iPhone6KeyProps.row1x + (2 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    r: "x": iPhone6KeyProps.row1x + (3 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    t: "x": iPhone6KeyProps.row1x + (4 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    y: "x": iPhone6KeyProps.row1x + (5 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    u: "x": iPhone6KeyProps.row1x + (6 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    i: "x": iPhone6KeyProps.row1x + (7 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    o: "x": iPhone6KeyProps.row1x + (8 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    p: "x": iPhone6KeyProps.row1x + (9 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row1y
    # Second Row of Keys
    a: "x": iPhone6KeyProps.row2x + (0 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row2y
    s: "x": iPhone6KeyProps.row2x + (1 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row2y
    d: "x": iPhone6KeyProps.row2x + (2 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row2y
    f: "x": iPhone6KeyProps.row2x + (3 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row2y
    g: "x": iPhone6KeyProps.row2x + (4 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row2y
    h: "x": iPhone6KeyProps.row2x + (5 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row2y
    j: "x": iPhone6KeyProps.row2x + (6 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row2y
    k: "x": iPhone6KeyProps.row2x + (7 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row2y
    l: "x": iPhone6KeyProps.row2x + (8 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row2y
    # Third Row of Keys
    z: "x": iPhone6KeyProps.row3x + (0 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row3y
    x: "x": iPhone6KeyProps.row3x + (1 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row3y
    c: "x": iPhone6KeyProps.row3x + (2 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)), "y": iPhone6KeyProps.row3y
    v: "x": iPhone6KeyProps.row3x + (3 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row3y
    b: "x": iPhone6KeyProps.row3x + (4 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row3y
    n: "x": iPhone6KeyProps.row3x + (5 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row3y
    m: "x": iPhone6KeyProps.row3x + (6 * (iPhone6KeyProps.width + iPhone6KeyProps.margin)) + 1, "y": iPhone6KeyProps.row3y
    # Misc Keys
    " ": "x": 268, "y": 424, "width": 289



_.extend(exports, iPhone6Keyboard)