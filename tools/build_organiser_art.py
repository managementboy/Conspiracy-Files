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
# Proportions taken from the owner's own drawing (2026-09-12): a plain grey
# shell with a thick, even bezel, a tall screen opening, four soft-cornered keys
# in a row along the foot, and a small tab on the right edge. No rocker and no
# separate power key on the face - the tab is the power, held for the lamp.
#
# The glass is 160 wide, as the original's was, and taller than square because
# the drawing is: more lines of the survivor's writing, which is no loss.
W, H = 199, 281             # the case, in native pixels
GLASS = (20, 19, 159, 207)  # x, y, w, h - the screen opening in the drawing
BTN0 = 33                   # a key is a wide, soft-cornered rectangle now
BTN = BTN0
BTN_H = 20
BTNS = {"MODE": (24, 246), "PREV": (62, 246), "NEXT": (100, 246), "INDEX": (138, 246)}
LABELS = {"MODE": "FILES", "PREV": "NAMES", "NEXT": "DATES", "INDEX": "TO DO"}
POWER = (193, 196, 6, 22)   # the tab on the right edge
LED = (188, 8, 5)
ROCKER = None               # the drawing has none; the keys and the glass suffice
ROCKER_GAP = 0

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
    # The shell: one flat grey slab with generous rounded corners.
    d.rounded_rectangle([0, 0, W * s - 1, H * s - 1], radius=12 * s, fill=SHELL,
                        outline=EDGE, width=max(1, s // 2))
    # A soft inner edge, the way moulded plastic catches light along a bezel.
    d.rounded_rectangle([3 * s, 3 * s, (W - 3) * s, (H - 3) * s], radius=10 * s,
                        outline=SHELL_HI, width=max(1, s // 2))
    # The screen opening: a deep well, then the glass.
    gx, gy, gw, gh = [v * s for v in GLASS]
    d.rounded_rectangle([gx - 3 * s, gy - 3 * s, gx + gw + 3 * s, gy + gh + 3 * s],
                        radius=3 * s, fill=WELL)
    d.rectangle([gx, gy, gx + gw, gy + gh], fill=GLASS_FILL)
    # Four soft-cornered keys along the foot.
    face = ImageFont.truetype(os.path.join(REPO, "mod/common/media/fonts/palm-os.otf"), 16 * s)
    for name, (bx, by) in BTNS.items():
        x, y = bx * s, by * s
        d.rounded_rectangle([x, y, x + BTN * s, y + BTN_H * s], radius=5 * s,
                            fill=DEEP, outline=EDGE, width=max(1, s // 2))
        label = LABELS[name]
        tw = face.getlength(label)
        d.text((x + (BTN * s - tw) / 2, y + (BTN_H * s - 11 * s) / 2), label,
               font=face, fill=(232, 232, 230, 255))
    # The tab on the right edge: power, and the lamp when held.
    px, py, pw, ph = [v * s for v in POWER]
    d.rounded_rectangle([px, py, px + pw, py + ph], radius=2 * s, fill=DEEP,
                        outline=EDGE, width=max(1, s // 2))
    lx, ly, ld = [v * s for v in LED]
    d.ellipse([lx, ly, lx + ld, ly + ld], fill=WELL)
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
        pressed_rect(scale, BTN, BTN_H, 5).save(os.path.join(OUT, "press_%dx.png" % scale))
        pressed_rect(scale, BTN, BTN_H, 5).save(os.path.join(OUT, "rocker_%dx.png" % scale))
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
            f.write(" {id=\"%s\",x=%d,y=%d,w=%d,h=%d,round=true},\n" % (name, x, y, BTN, BTN_H))
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
