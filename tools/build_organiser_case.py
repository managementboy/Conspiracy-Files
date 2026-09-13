#!/usr/bin/env python3
"""Turn the owner's drawing of the case into the mod's art and geometry.

    tools/build_organiser_case.py

The source of truth is art/organiser-case.svg, exported by the owner to
art/organiser-case-1x.png .. -4x.png at 96/192/288/384 DPI. This writes the
mod's art and the geometry that puts the hit boxes on it.

It used to upscale ONE 305x444 png with Lanczos, so every size above 1x was a
blurry enlargement of a small bitmap and the vector art was never used at all
(owner, 2026-09-13: "the idea of the svg was to use it as to build the PDA
resizable"). Now each size is its own render, crisp at every step.

Everything is measured out of the drawing, in the drawing's own pixels. The
screen opening is a hole, and a hole is unambiguous. The keys ARE now found
automatically too - an earlier attempt read the shading between them as an
edge, which is why they were hand-measured, but hand-measured numbers silently
stopped matching the moment the owner redrew the case: they still described a
305-wide shell when the new one is 296 wide, putting every hit box several
pixels out and the power tab off the edge of the picture entirely. Blobs of
raised, lighter moulding are found by connected component rather than by
thresholding a column profile, which is what defeated the first attempt.
"""
from PIL import Image
from collections import deque
import os

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
def src(scale):
    return os.path.join(REPO, "art/organiser-case-%dx.png" % scale)
OUT = os.path.join(REPO, "mod/common/media/ui/CFOrg")
LUA = os.path.join(REPO, "mod/common/media/lua/shared/ConspiracyFiles/Generated/OrganiserCase.lua")
SCALES = (1, 2, 3, 4)

# Left to right, which is the order the drawing puts them in and the order the
# owner named them (2026-09-13): the menu, the two that move, and back.
KEY_IDS = ["MODE", "PREV", "NEXT", "INDEX"]

# No power tab, and no power light. The owner's redrawn case has neither
# (2026-09-13: "no power button. we change the button mapping. menu turns the
# device on again"), so MENU wakes it and idling switches it off. A control
# drawn on a case that does not have one is a lie about the object.

def screen_hole(img):
    """The screen is the transparent region that the outside cannot reach."""
    w, h = img.size
    px = img.load()
    clear = lambda x, y: px[x, y][3] < 60
    seen = [[False] * w for _ in range(h)]
    q = deque()
    for x in range(w):
        for y in (0, h - 1):
            if clear(x, y) and not seen[y][x]:
                seen[y][x] = True; q.append((x, y))
    for y in range(h):
        for x in (0, w - 1):
            if clear(x, y) and not seen[y][x]:
                seen[y][x] = True; q.append((x, y))
    while q:
        x, y = q.popleft()
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nx, ny = x + dx, y + dy
            if 0 <= nx < w and 0 <= ny < h and clear(nx, ny) and not seen[ny][nx]:
                seen[ny][nx] = True; q.append((nx, ny))
    # Rows of the hole, then the longest run of FULL-WIDTH rows. A drawing has
    # specks - a few stray transparent pixels near the keys - and taking the
    # bounding box of everything stretched the glass down over the bezel
    # (owner, 2026-09-12: "the glas goes to far down").
    rows = {}
    for y in range(h):
        xs = [x for x in range(w) if clear(x, y) and not seen[y][x]]
        if xs:
            rows[y] = (min(xs), max(xs), len(xs))
    if not rows:
        raise SystemExit("no screen opening found in the drawing")
    widest = max(r[2] for r in rows.values())
    best = run = None
    for y in sorted(rows):
        if rows[y][2] >= widest * 0.98:
            run = run or [y, y]
            run[1] = y
        elif run:
            if not best or run[1] - run[0] > best[1] - best[0]:
                best = run
            run = None
    if run and (not best or run[1] - run[0] > best[1] - best[0]):
        best = run
    top, bottom = best
    x0 = min(rows[y][0] for y in range(top, bottom + 1))
    x1 = max(rows[y][1] for y in range(top, bottom + 1))
    return x0, top, x1 - x0 + 1, bottom - top + 1

def keys(img):
    """The keys, measured out of the drawing.

    A key is a raised pad, so it is lighter than the recess around it: in the
    lower part of the case they are the bright blobs. Found as connected
    components rather than by thresholding a column profile, because the
    shading BETWEEN two keys also clears a column threshold - which is what
    made the first attempt at this give up and hand-measure instead.
    """
    px = img.load()
    W, H = img.size
    y0 = int(H * 0.72)                     # below the screen, whatever its size
    lit = []
    for y in range(y0, H):
        for x in range(W):
            p = px[x, y]
            if p[3] > 128:
                lit.append((p[0] + p[1] + p[2]) / 3.0)
    if not lit:
        return []
    lo, hi = min(lit), max(lit)
    thr = lo + (hi - lo) * 0.55
    def bright(x, y):
        p = px[x, y]
        return p[3] > 128 and (p[0] + p[1] + p[2]) / 3.0 > thr
    seen = [[False] * (H - y0) for _ in range(W)]
    found = []
    for sy in range(y0, H):
        for sx in range(W):
            if seen[sx][sy - y0] or not bright(sx, sy):
                continue
            q = deque([(sx, sy)])
            seen[sx][sy - y0] = True
            minx = maxx = sx
            miny = maxy = sy
            area = 0
            while q:
                x, y = q.popleft()
                area += 1
                minx, maxx = min(minx, x), max(maxx, x)
                miny, maxy = min(miny, y), max(maxy, y)
                for nx, ny in ((x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)):
                    if 0 <= nx < W and y0 <= ny < H and not seen[nx][ny - y0] and bright(nx, ny):
                        seen[nx][ny - y0] = True
                        q.append((nx, ny))
            found.append((minx, miny, maxx - minx + 1, maxy - miny + 1, area))
    # The case shoulder is bright too, but it runs off the edge of the picture.
    found = [f for f in found if f[0] > 0 and f[0] + f[2] < W and f[4] >= W * H * 0.0008]
    if not found:
        return []
    widths = sorted(f[2] for f in found)
    med = widths[len(widths) // 2]
    found = [f for f in found if abs(f[2] - med) <= med * 0.4]
    found.sort(key=lambda f: f[0])
    # They are one row of identical mouldings, so a key that reads a few pixels
    # short because of a gradient takes the row's height rather than its own.
    if found:
        ys = sorted(f[1] for f in found)
        hs = sorted(f[3] for f in found)
        y = ys[len(ys) // 2]
        h = hs[len(hs) // 2]
        found = [(f[0], y, f[2], h) for f in found]
    return found

def main():
    missing = [s for s in SCALES if not os.path.exists(src(s))]
    if missing:
        raise SystemExit("missing art: " + ", ".join(os.path.basename(src(s)) for s in missing))
    base = Image.open(src(1)).convert("RGBA")
    W, H = base.size
    gx, gy, gw, gh = screen_hole(base)
    found = keys(base)
    if len(found) != len(KEY_IDS):
        raise SystemExit("found %d keys in the drawing, expected %d - the art "
                         "changed shape; look at it before trusting this"
                         % (len(found), len(KEY_IDS)))
    os.makedirs(OUT, exist_ok=True)

    for scale in SCALES:
        art = Image.open(src(scale)).convert("RGBA")
        # Each size is the owner's own render, not an upscale of the small one.
        # It is drawn into a box of exactly w*scale x h*scale, so a pixel of
        # rounding in the export cannot move the glass.
        want = (W * scale, H * scale)
        if art.size != want:
            art = art.resize(want, Image.LANCZOS)
        # The glass is a hole, so fill it: the shell must not be see-through.
        sx, sy, sw, sh = gx * scale, gy * scale, gw * scale, gh * scale
        Image.Image.paste(art, Image.new("RGBA", (sw, sh), (168, 178, 150, 255)), (sx, sy))
        art.save(os.path.join(OUT, "case_%dx.png" % scale))
        # A pressed key: the same shape, darkened, drawn over the art.
        kw, kh = found[0][2] * scale, found[0][3] * scale
        Image.new("RGBA", (kw, kh), (26, 26, 28, 150)).save(
            os.path.join(OUT, "press_%dx.png" % scale))

    with open(LUA, "w") as f:
        f.write("-- GENERATED by tools/build_organiser_case.py from art/organiser-case-*.png.\n")
        f.write("-- Do not edit by hand; redraw the art and run the tool.\n--\n")
        f.write("-- The owner's own drawing of the machine, exported from\n")
        f.write("-- art/organiser-case.svg at 96/192/288/384 DPI (2026-09-13). The screen\n")
        f.write("-- opening and the keys are both FOUND in the picture, so redrawing the\n")
        f.write("-- case moves the hit boxes with it instead of leaving them behind.\n")
        f.write("--\n-- No power tab: MENU wakes the machine and idling switches it off.\n")
        f.write("local M={w=%d,h=%d,scales={%s}}\n" % (W, H, ",".join(str(s) for s in SCALES)))
        f.write("M.glass={x=%d,y=%d,w=%d,h=%d}\n" % (gx, gy, gw, gh))
        f.write("M.buttons={\n")
        for name, (x, y, w, h) in zip(KEY_IDS, found):
            f.write(' {id="%s",x=%d,y=%d,w=%d,h=%d,round=true},\n' % (name, x, y, w, h))
        f.write("}\n")
        f.write("return M\n")
    print("case %dx%d, glass %d,%d %dx%d, keys: %s"
          % (W, H, gx, gy, gw, gh,
             " ".join("%s@%d,%d %dx%d" % (n, k[0], k[1], k[2], k[3])
                      for n, k in zip(KEY_IDS, found))))

if __name__ == "__main__":
    main()
