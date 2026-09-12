#!/usr/bin/env python3
"""Ship the Palm OS face to the game as one of its OWN fonts.

    tools/build_palm_font.py

The game keeps its fonts in media/fonts/<LANG>/<UI scale>/ as BMFont pages, and
names them in media/fonts/<LANG>/fonts.txt. A mod may override both, so rather
than drawing letters by hand the organiser can hand the game a real font and
then use getTextManager() like anything else - proper measuring, proper
wrapping, one draw call per string.

The font enum is fixed in the engine, so ours takes over a slot the game barely
uses: Cred2, which vanilla spends on the credits screen. Nothing else in the
game or in this mod asks for it.

The face is "Palm OS" by Damien Guard (CC BY-SA 3.0, see CREDITS.md). It is a
pixel font, so each UI scale is the native 11px line enlarged by a whole number
with nearest-neighbour - never re-rendered at a larger point size, which would
soften it.

Outputs (generated, committed):
    mod/common/media/fonts/EN/{1x,2x,3x,4x}/palmos.fnt + palmos_0.png
    mod/common/media/fonts/EN/fonts.txt      (vanilla manifest, Cred2 repointed)
"""
from PIL import Image, ImageDraw, ImageFont
import os, shutil

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
SRC = os.path.join(REPO, "mod/common/media/fonts/palm-os.otf")
OUT = os.path.join(REPO, "mod/common/media/fonts/EN")
GAME = os.environ.get("PZ_HOME", os.path.expanduser(
    "~/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid"))
VANILLA = os.path.join(GAME, "media/fonts/EN/fonts.txt")
SIZE = 16              # the point size where this face lands exactly on its grid
FIRST, LAST = 32, 126
SCALES = (1, 2, 3, 4)  # the game's UI scale folders
SLOT = "Cred2"

def page_for(glyphs, scale):
    cell_h = glyphs["line"] * scale
    side = 64
    while True:
        x = y = 0
        fits, rows = True, {}
        for code, (advance, img) in glyphs["cells"].items():
            w = advance * scale
            if x + w > side:
                x, y = 0, y + cell_h
            if y + cell_h > side:
                fits = False
                break
            rows[code] = (x, y)
            x += w
        if fits:
            return side, rows
        side *= 2

def main():
    font = ImageFont.truetype(SRC, SIZE)
    ascent, descent = font.getmetrics()
    line = ascent + descent
    cells = {}
    for code in range(FIRST, LAST + 1):
        ch = chr(code)
        advance = int(round(font.getlength(ch)))
        img = Image.new("L", (max(advance, 1), line), 0)
        ImageDraw.Draw(img).text((0, 0), ch, font=font, fill=255)
        cells[code] = (advance, img.point(lambda v: 255 if v > 127 else 0))
    glyphs = {"line": line, "ascent": ascent, "cells": cells}

    for scale in SCALES:
        side, spots = page_for(glyphs, scale)
        page = Image.new("RGBA", (side, side), (0, 0, 0, 0))
        for code, (advance, img) in cells.items():
            if advance == 0:
                continue
            big = img.resize((advance * scale, line * scale), Image.NEAREST)
            white = Image.new("RGBA", big.size, (255, 255, 255, 255))
            page.paste(white, spots[code], big)
        folder = os.path.join(OUT, "%dx" % scale)
        os.makedirs(folder, exist_ok=True)
        page.save(os.path.join(folder, "palmos_0.png"))
        with open(os.path.join(folder, "palmos.fnt"), "w") as f:
            f.write('info face="Palm OS" size=%d bold=0 italic=0 charset="ANSI" unicode=0 '
                    'stretchH=100 smooth=0 aa=1 padding=0,0,0,0 spacing=0,0 outline=0\n'
                    % (line * scale))
            f.write("common lineHeight=%d base=%d scaleW=%d scaleH=%d pages=1 packed=0 "
                    "alphaChnl=0 redChnl=4 greenChnl=4 blueChnl=4\n"
                    % (line * scale, ascent * scale, side, side))
            f.write('page id=0 file="palmos_0.png"\n')
            f.write("chars count=%d\n" % len(cells))
            for code in sorted(cells):
                advance, _ = cells[code]
                x, y = spots[code]
                f.write("char id=%-4d x=%-5d y=%-5d width=%-5d height=%-5d xoffset=0 "
                        "yoffset=0 xadvance=%-5d page=0 chnl=15\n"
                        % (code, x, y, advance * scale, line * scale, advance * scale))
            f.write("kernings count=0\n")

    # The manifest is one file, so ours is the game's with a single entry moved.
    with open(VANILLA) as f:
        manifest = f.read()
    head, tail = manifest.split("font %s\n" % SLOT, 1)
    body, rest = tail.split("}", 1)
    manifest = head + "font %s\n{\n    fnt = palmos.fnt,\n    img = palmos_0.png,\n}" % SLOT + rest
    with open(os.path.join(OUT, "fonts.txt"), "w") as f:
        f.write(manifest)
    print("line %d px, %d glyphs, scales %s, slot %s" % (line, len(cells), SCALES, SLOT))

if __name__ == "__main__":
    main()
