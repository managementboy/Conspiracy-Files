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
W, H = 182, 236             # the case, in native pixels
GLASS = (11, 26, 160, 160)  # x, y, w, h - the original's own screen
BTN = 14                    # round button diameter
BTNS = {"MODE": (14, 200), "PREV": (36, 200), "NEXT": (118, 200), "INDEX": (140, 200)}
# Palm's own buttons carried a label under the key; the guidelines call for the
# frequent commands to be one press, named, not hidden in a menu.
LABELS = {"MODE": "VIEW", "PREV": "PREV", "NEXT": "NEXT", "INDEX": "LIST"}
ROCKER = (74, 200, 34, 9)   # x, y, w, h of the upper half; lower half sits 11 below
ROCKER_GAP = 11
POWER = (13, 9, 20, 9)
LED = (39, 10, 7)            # x, y, diameter

SHELL = (110, 118, 100, 255)
SHELL_HI = (128, 136, 116, 255)
EDGE = (38, 42, 34, 255)
DEEP = (74, 82, 64, 255)
WELL = (60, 67, 52, 255)
GLASS_FILL = (185, 196, 160, 255)
LED_ON = (216, 92, 76, 255)

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
    lx, ly, ld = [v * s for v in LED]
    d.ellipse([lx, ly, lx + ld, ly + ld], fill=WELL, outline=EDGE, width=max(1, s // 2))
    # Four round buttons.
    for _, (bx, by) in BTNS.items():
        bx, by = bx * s, by * s
        d.ellipse([bx, by, bx + BTN * s, by + BTN * s], fill=DEEP, outline=EDGE, width=max(1, s // 2))
    # Labels, in the device's own face, under each key.
    face = ImageFont.truetype(os.path.join(REPO, "mod/common/media/fonts/palm-os.otf"), 16 * s // 2)
    for name, (bx, by) in BTNS.items():
        label = LABELS[name]
        tw = face.getlength(label)
        d.text((bx * s + (BTN * s - tw) / 2, (by + BTN + 1) * s), label, font=face, fill=EDGE)
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
