#!/usr/bin/env python3
"""Draw the organiser's application icons.

    tools/build_organiser_art.py

This file used to draw the CASE as well, and then only kept the code for its
measurements after the case became the owner's own SVG. Both are gone: the
device is the Fieldnote design, drawn at runtime from its manifest with native
rectangles, so there is no case picture and no case geometry to generate
(P4-R87..R90). tools/build_organiser_case.py, the SVG, its four PNG exports
and the eight case/press/rocker/power textures went with it.

What survives is the icon set, which IS drawn in code because it has to be
pixel art on a 1-bit screen: whole squares, no curves, enlarged with NEAREST.

Outputs (generated, committed):
    mod/common/media/ui/CFOrg/icons/<scale>x/<name>.png
"""
from PIL import Image, ImageDraw
import os

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
OUT = os.path.join(REPO, "mod/common/media/ui/CFOrg")

# --- Application icons -------------------------------------------------------
# The Palm launcher is a grid of small monochrome icons with the name beneath
# (Palm OS UI Guidelines; the classic 160x160 launcher used three columns).
#
# ONE RULE, and the owner had to say it out loud before it was followed
# (2026-09-13: "our lcd is pixelated, round curves are a no go"): this is a
# 1-bit LCD, so an icon is made of whole square pixels and nothing else.
#
# That forbids three things this file used to do:
#   * ellipse() and arc() - a curve on a pixel grid is a lie about the screen
#   * rounded_rectangle() - same
#   * drawing big and resizing down with LANCZOS, which is ANTI-ALIASING and
#     was quietly turning every edge into soft grey
#
# So: draw at native 22x22 with rectangles and straight lines, then enlarge
# with NEAREST, which repeats pixels instead of blending them. Every size is
# the same picture with bigger squares, exactly like the Palm typeface beside
# it.
ICON = 22
ICONS = ("files", "names", "places", "dates", "todo", "notes", "help", "sites", "setup")
# The icons live ON the LCD, so they are drawn at the CONTENT scale, not the
# device scale - the same set the typeface beside them needs (P4-R89). Keep
# this equal to build_palm_font.py's SCALES or the launcher loses its icons at
# whichever combination of device size and font size is missing.
ICON_SCALES = (1, 2, 3, 4, 6, 9)

def draw_icon(name, scale):
    """One icon, drawn at native size in whole pixels, then enlarged."""
    img = Image.new("RGBA", (ICON, ICON), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    ink = (26, 26, 28, 255)
    def box(x0, y0, x1, y1, fill=False):
        d.rectangle([x0, y0, x1, y1], outline=None if fill else ink,
                    fill=ink if fill else None, width=1)
    def hline(x0, x1, y): d.rectangle([x0, y, x1, y], fill=ink)
    def vline(x, y0, y1): d.rectangle([x, y0, x, y1], fill=ink)

    if name == "files":
        # A sheet with a stepped corner - the fold, in squares.
        box(3, 1, 18, 20)
        for i in range(4):
            vline(18 - i, 1, 1 + i)          # the corner cut, as a staircase
            hline(18 - i, 18, 1 + i)
        for i in range(5):
            hline(6, 15, 7 + 2 * i)
    elif name == "names":
        # A card: a blocky head and shoulders, and two ruled lines.
        box(2, 3, 19, 19)
        box(6, 6, 9, 9, fill=True)           # head: a square, not a circle
        box(5, 11, 10, 16, fill=True)        # shoulders: a slab
        hline(13, 17, 8)
        hline(13, 17, 12)
    elif name == "places":
        # A pin over a baseline: a square head and a stepped point.
        box(7, 2, 14, 9)
        box(10, 5, 11, 6, fill=True)
        for i in range(3):                    # the point, tapering in steps
            hline(8 + i, 13 - i, 10 + i)
        box(10, 13, 11, 13, fill=True)
        hline(3, 18, 19)
    elif name == "dates":
        # A month block with two binder tabs and a grid of days.
        box(2, 4, 19, 20)
        hline(2, 19, 8)
        vline(7, 1, 4)
        vline(14, 1, 4)
        for row in range(2):
            for col in range(3):
                x, y = 5 + col * 5, 11 + row * 4
                box(x, y, x + 2, y + 2, fill=True)
    elif name == "todo":
        # A list with ticks, drawn as two straight strokes.
        box(3, 2, 18, 20)
        for i in range(3):
            y = 5 + 5 * i
            box(6, y, 9, y + 3)
            hline(11, 16, y + 1)
            if i < 2:
                for k in range(2): d.point((6 + k, y + 1 + k), fill=ink)
                for k in range(3): d.point((8 - k, y + 2 - k), fill=ink)
    elif name == "notes":
        # A memo pad: ruled, with a torn-off bottom edge. The first try laid a
        # pencil across a page and the owner could not read it (2026-09-13) -
        # at 22 pixels a pencil is four dots and a guess. A ragged tear is a
        # silhouette, and a silhouette survives being small.
        vline(3, 2, 16)
        vline(18, 2, 16)
        hline(3, 18, 2)
        for i in range(4):
            hline(6, 15, 5 + 3 * i)
        tooth = (0, 1, 2, 1)                  # the tear, in whole pixels
        for i, x in enumerate(range(3, 19)):
            vline(x, 16, 17 + tooth[i % 4])
    elif name == "help":
        # A question mark in a SQUARE box. The old one used a rounded box and
        # an arc, which is exactly what the owner objected to.
        box(2, 2, 19, 19)
        hline(8, 13, 6)
        vline(13, 6, 9)
        hline(10, 13, 9)
        vline(10, 9, 12)
        box(10, 14, 11, 15, fill=True)
    elif name == "sites":
        # A flag planted in the ground: this is the debug program that says
        # where the papers actually are, and a marked spot is a flag. It was a
        # map with a cross through it, which read as neither (owner,
        # 2026-09-13). Distinct from PLACES, which is a pin.
        box(6, 3, 15, 9, fill=True)           # the flag, solid so it reads
        for i in range(3):                    # a swallowtail, in steps
            vline(15 - i, 3 + i, 3 + i)
            vline(15 - i, 9 - i, 9 - i)
        vline(5, 2, 18)                       # the pole
        hline(2, 19, 19)                      # the ground
        hline(3, 8, 18)                       # its base
    elif name == "setup":
        # Three slider tracks with a handle on each: what a settings icon was
        # before anyone drew a cogwheel, and it says "sizes" rather than
        # "machinery". Palm had a Prefs application; this is it.
        for i, at in enumerate((6, 13, 8)):
            y = 4 + i * 6
            hline(3, 18, y + 2)              # the track
            box(at, y, at + 2, y + 4, fill=True)   # the handle
    # NEAREST: repeat the pixels, never blend them.
    if scale != 1:
        img = img.resize((ICON * scale, ICON * scale), Image.NEAREST)
    return img

def build_icons():
    for scale in ICON_SCALES:
        folder = os.path.join(OUT, "icons", "%dx" % scale)
        os.makedirs(folder, exist_ok=True)
        for name in ICONS:
            draw_icon(name, scale).save(os.path.join(folder, "%s.png" % name))
    print("icons: %d at %s, %d px native" % (len(ICONS), ICON_SCALES, ICON))

build_icons()
