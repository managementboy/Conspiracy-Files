#!/usr/bin/env python3
"""Draw the organiser's case, and tell the Lua where every part of it sits.

    tools/build_organiser_art.py

The game's Lua can only fill rectangles - no rounded corners, no circles - so a
case drawn in code comes out as a stack of grey plates (owner, 2026-09-12:
"that looks nothing like your or my mockup organizer screen. All sqare"). The
shell is therefore a picture, like the inventory icon, and the screen draws
text over it.

Geometry lives HERE and is emitted as Lua, so the art and the hit boxes can
never drift apart.

Outputs (generated, committed):
    mod/common/media/ui/CFOrg/case_<scale>x.png     the whole shell
    mod/common/media/ui/CFOrg/press_<scale>x.png    a pressed round button
    mod/common/media/ui/CFOrg/rocker_<scale>x.png   a pressed rocker half
    mod/common/media/ui/CFOrg/power_<scale>x.png    a pressed power key
    mod/common/media/ui/CFOrg/led_<scale>x.png      the light, lit
    .../lua/shared/ConspiracyFiles/Generated/OrganiserCase.lua
"""
from PIL import Image, ImageDraw, ImageFont
import os

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
OUT = os.path.join(REPO, "mod/common/media/ui/CFOrg")
LUA = os.path.join(REPO, "mod/common/media/lua/shared/ConspiracyFiles/Generated/OrganiserCase.lua")
SCALES = (2, 3, 4)
SS = 4                      # supersample, so curves are smooth at every scale

# The real thing had a 160 x 160 screen, so that is the glass, and everything
# else is measured around it (owner, 2026-09-12). The whole case is then scaled
# up by a whole number, never stretched.
W, H = 182, 242             # the case, in native pixels (room for real labels)
GLASS = (11, 26, 160, 160)  # x, y, w, h - the original's own screen
BTN0 = 14                   # round button diameter
BTN = BTN0
# Mirrored about the centre line: the right-hand pair sat 28 px from the edge
# while the left pair sat 14 (owner, 2026-09-12: "buttons are not alligned").
# Spread so the labels do not run into each other: a real label needs the room
# a two-pixel one did not.
BTNS = {"MODE": (9, 198), "PREV": (47, 198), "NEXT": (W - 47 - BTN0, 198), "INDEX": (W - 9 - BTN0, 198)}
# Palm's own buttons carried a label under the key; the guidelines call for the
# frequent commands to be one press, named, not hidden in a menu.
# A Palm's four keys opened its four applications - Date, Address, To Do, Memo
# - and so do these. The launcher is a tap on the title bar, as Home was a tap
# on the silkscreen. Owner, 2026-09-12: "what do we need the buttons in the
# middle for now that we have a touch screen?" - the rocker is what you use
# when you cannot aim: walking, or with something coming.
LABELS = {"MODE": "FILES", "PREV": "NAMES", "NEXT": "DATES", "INDEX": "TO DO"}
ROCKER = ((W - 34) // 2, 198, 34, 9)   # x, y, w, h of the upper half; lower half sits 11 below
ROCKER_GAP = 11
POWER = (13, 9, 20, 9)
LED = (39, 10, 7)            # x, y, diameter

# The Palm III was graphite, not green: a dark neutral grey case with slightly
# lighter grey keys, a near-black screen surround, and only the LCD itself in
# that pale grey-green (owner, 2026-09-12).
SHELL = (78, 79, 82, 255)
SHELL_HI = (92, 93, 96, 255)
EDGE = (26, 26, 28, 255)
DEEP = (56, 57, 60, 255)
WELL = (40, 40, 43, 255)
GLASS_FILL = (168, 178, 150, 255)
LED_ON = (214, 88, 72, 255)

def draw_case(scale):
    s = scale * SS
    img = Image.new("RGBA", (W * s, H * s), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    r = 9 * s
    d.rounded_rectangle([0, 0, W * s - 1, H * s - 1], radius=r, fill=SHELL, outline=EDGE, width=max(1, s // 2))
    # A lighter band down the top third: cheap plastic caught the light.
    d.rounded_rectangle([2 * s, 2 * s, (W - 2) * s, 20 * s], radius=4 * s, fill=SHELL_HI)
    # Screen well, then the glass inside it.
    gx, gy, gw, gh = [v * s for v in GLASS]
    d.rounded_rectangle([gx - 2 * s, gy - 2 * s, gx + gw + 2 * s, gy + gh + 2 * s], radius=2 * s, fill=WELL)
    d.rectangle([gx, gy, gx + gw, gy + gh], fill=GLASS_FILL)
    # Power key and the light beside it.
    px, py, pw, ph = [v * s for v in POWER]
    d.rounded_rectangle([px, py, px + pw, py + ph], radius=3 * s, fill=DEEP, outline=EDGE, width=max(1, s // 2))
    # The light sits in a dark well, or it reads as a dot floating on the plastic.
    lx, ly, ld = [v * s for v in LED]
    d.ellipse([lx - s, ly - s, lx + ld + s, ly + ld + s], fill=(20, 20, 22, 255))
    d.ellipse([lx, ly, lx + ld, ly + ld], fill=WELL)
    # Four round buttons.
    for _, (bx, by) in BTNS.items():
        bx, by = bx * s, by * s
        d.ellipse([bx, by, bx + BTN * s, by + BTN * s], fill=DEEP, outline=EDGE, width=max(1, s // 2))
    # Labels, in the device's own face, under each key.
    # Full size, not half: the labels were legible only to someone who knew
    # what they said (owner, 2026-09-12).
    face = ImageFont.truetype(os.path.join(REPO, "mod/common/media/fonts/palm-os.otf"), 16 * s)
    for name, (bx, by) in BTNS.items():
        label = LABELS[name]
        tw = face.getlength(label)
        d.text((bx * s + (BTN * s - tw) / 2, (by + BTN - 1) * s), label, font=face, fill=(24, 24, 26, 255))
    # The rocker, two pills.
    rx, ry, rw, rh = [v * s for v in ROCKER]
    for offset in (0, ROCKER_GAP * s):
        d.rounded_rectangle([rx, ry + offset, rx + rw, ry + offset + rh], radius=3 * s,
                            fill=DEEP, outline=EDGE, width=max(1, s // 2))
    return img.resize((W * scale, H * scale), Image.LANCZOS)

def pressed_round(scale):
    s = scale * SS
    img = Image.new("RGBA", (BTN * s, BTN * s), (0, 0, 0, 0))
    ImageDraw.Draw(img).ellipse([0, 0, BTN * s - 1, BTN * s - 1], fill=EDGE)
    return img.resize((BTN * scale, BTN * scale), Image.LANCZOS)

def pressed_rect(scale, w, h, radius=3):
    s = scale * SS
    img = Image.new("RGBA", (w * s, h * s), (0, 0, 0, 0))
    ImageDraw.Draw(img).rounded_rectangle([0, 0, w * s - 1, h * s - 1], radius=radius * s, fill=EDGE)
    return img.resize((w * scale, h * scale), Image.LANCZOS)

def led(scale):
    s = scale * SS
    d = LED[2]
    img = Image.new("RGBA", (d * s, d * s), (0, 0, 0, 0))
    ImageDraw.Draw(img).ellipse([0, 0, d * s - 1, d * s - 1], fill=LED_ON)
    return img.resize((d * scale, d * scale), Image.LANCZOS)

def main():
    os.makedirs(OUT, exist_ok=True)
    for scale in SCALES:
        draw_case(scale).save(os.path.join(OUT, "case_%dx.png" % scale))
        pressed_round(scale).save(os.path.join(OUT, "press_%dx.png" % scale))
        pressed_rect(scale, ROCKER[2], ROCKER[3]).save(os.path.join(OUT, "rocker_%dx.png" % scale))
        pressed_rect(scale, POWER[2], POWER[3]).save(os.path.join(OUT, "power_%dx.png" % scale))
        led(scale).save(os.path.join(OUT, "led_%dx.png" % scale))
    with open(LUA, "w") as f:
        f.write("-- GENERATED by tools/build_organiser_art.py. Do not edit by hand.\n--\n")
        f.write("-- Where every part of the case sits, in native pixels: the art and the\n")
        f.write("-- hit boxes come from one source so they cannot drift apart.\n")
        f.write("local M={w=%d,h=%d,scales={2,3}}\n" % (W, H))
        f.write("M.glass={x=%d,y=%d,w=%d,h=%d}\n" % GLASS)
        f.write("M.button=%d\n" % BTN)
        f.write("M.buttons={\n")
        for name, (x, y) in BTNS.items():
            f.write(" {id=\"%s\",x=%d,y=%d,w=%d,h=%d,round=true},\n" % (name, x, y, BTN, BTN))
        f.write(" {id=\"UP\",x=%d,y=%d,w=%d,h=%d},\n" % ROCKER)
        f.write(" {id=\"DOWN\",x=%d,y=%d,w=%d,h=%d},\n" % (ROCKER[0], ROCKER[1] + ROCKER_GAP, ROCKER[2], ROCKER[3]))
        f.write(" {id=\"POWER\",x=%d,y=%d,w=%d,h=%d},\n" % POWER)
        f.write("}\n")
        f.write("M.led={x=%d,y=%d,d=%d}\n" % LED)
        f.write("return M\n")
    print("case %dx%d native, glass %s, %d controls" % (W, H, GLASS, len(BTNS) + 3))

if __name__ == "__main__":
    main()

# --- Application icons -------------------------------------------------------
# The Palm launcher is a grid of small monochrome icons with the name beneath
# (Palm OS UI Guidelines; the classic 160x160 launcher used three columns).
# These are drawn on a 22 x 22 native grid, 1-bit, scaled by whole numbers.
ICON = 22
ICONS = ("files", "names", "dates", "todo", "help")

def draw_icon(name, scale):
    s = scale * SS
    img = Image.new("RGBA", (ICON * s, ICON * s), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    ink = (26, 26, 28, 255)
    w = max(1, s)
    if name == "files":
        # A sheet with a folded corner and ruled lines.
        d.polygon([(3*s,1*s),(14*s,1*s),(19*s,6*s),(19*s,21*s),(3*s,21*s)], outline=ink, width=w)
        d.line([(14*s,1*s),(14*s,6*s),(19*s,6*s)], fill=ink, width=w)
        for i in range(4):
            d.line([(6*s,(9+3*i)*s),(16*s,(9+3*i)*s)], fill=ink, width=w)
    elif name == "names":
        # A card with a head and shoulders, and two ruled lines beside it.
        d.rectangle([2*s,3*s,20*s,19*s], outline=ink, width=w)
        d.ellipse([5*s,6*s,10*s,11*s], outline=ink, width=w)
        d.arc([4*s,11*s,11*s,18*s], 200, 340, fill=ink, width=w)
        d.line([(13*s,8*s),(18*s,8*s)], fill=ink, width=w)
        d.line([(13*s,12*s),(18*s,12*s)], fill=ink, width=w)
    elif name == "dates":
        # A month block with its two binder rings.
        d.rectangle([2*s,4*s,20*s,20*s], outline=ink, width=w)
        d.line([(2*s,9*s),(20*s,9*s)], fill=ink, width=w)
        d.line([(7*s,1*s),(7*s,5*s)], fill=ink, width=w)
        d.line([(15*s,1*s),(15*s,5*s)], fill=ink, width=w)
        for row in range(2):
            for col in range(3):
                x, y = (5 + col*5)*s, (12 + row*4)*s
                d.rectangle([x, y, x+2*s, y+2*s], fill=ink)
    elif name == "help":
        # A question mark in a rounded box, as the system's own info icon was.
        d.rounded_rectangle([2*s,2*s,20*s,20*s], radius=4*s, outline=ink, width=w)
        d.arc([7*s,6*s,15*s,13*s], 150, 360, fill=ink, width=w)
        d.line([(11*s,12*s),(11*s,15*s)], fill=ink, width=w)
        d.rectangle([10*s,16*s,12*s,18*s], fill=ink)
    elif name == "todo":
        # A list with two ticks.
        d.rectangle([3*s,2*s,19*s,20*s], outline=ink, width=w)
        for i in range(3):
            y = (6 + 5*i)*s
            d.rectangle([6*s,y,9*s,y+3*s], outline=ink, width=w)
            d.line([(11*s,y+1*s),(16*s,y+1*s)], fill=ink, width=w)
            if i < 2:
                d.line([(6*s,y+1*s),(7*s,y+3*s),(9*s,y)], fill=ink, width=w)
    return img.resize((ICON * scale, ICON * scale), Image.LANCZOS)

def build_icons():
    for scale in SCALES:
        folder = os.path.join(OUT, "icons", "%dx" % scale)
        os.makedirs(folder, exist_ok=True)
        for name in ICONS:
            draw_icon(name, scale).save(os.path.join(folder, "%s.png" % name))
    print("icons: %d at %s, %d px native" % (len(ICONS), SCALES, ICON))

build_icons()
