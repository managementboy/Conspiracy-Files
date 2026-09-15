# Fieldnote PDA — the organiser's case, and the tools that generate it

The rectangle-built housing from `design/manifest.json`, drawn with **only
native `drawRect` calls and the mod's own pixel typeface**. No textures for the
hardware, no SVG, no PNG at runtime, and nothing measured from the player's
machine.

**It began as a standalone test mod so it could be looked at before it replaced
anything.** The owner approved it in his own play (2026-09-13) and it became the
organiser's case: `ConspiracyFiles.OrganiserScreen` draws it and takes its keys.
The test mod and its stand-alone window are gone (the window lasted until
2026-09-15, kept alive only by the check below). What is left in this folder is
the design package, the generator and the check.

The LCD is drawn as a blank filled rectangle and nothing hardware ever
enters it. No branding, no handwriting pad. Wear scuffs are on by default,
as the manifest's `default_visibility` says, and can be toggled.

```
tools/fieldnote-test/
  design/                      the package's manifest.json + DESIGN.md + reference PNG
  build_fieldnote.py           manifest.json  ->  Geometry.lua  (the ONLY way geometry changes)
  probe.lua                    eval-channel checks used by boot_test.sh
  boot_test.sh                 boots a real game and proves the contract on the organiser

mod/common/media/lua/shared/Fieldnote/Geometry.lua    GENERATED - do not edit
mod/common/media/lua/client/Fieldnote/Panel.lua       draws the case (S.render); no window of its own
mod/common/media/lua/client/ConspiracyFiles/OrganiserScreen.lua   the window: keys, glass, sizes
```

## What was verified against the installed game, not from memory

| Call | Verified signature | Consequence |
|---|---|---|
| `ISUIElement:drawRect` | `(x, y, w, h, a, r, g, b)` | **alpha first** |
| `ISUIElement:drawText` | `(str, x, y, r, g, b, a, font)` | **alpha last** |
| `ISUIElement:drawTextureScaled` | `(t, x, y, w, h, a, r, g, b)` | **alpha first** |

The palette is kept as `{r,g,b,a}` and reordered per call in `Panel.lua`.
That difference between the two draw calls is exactly why the design refused
to fix an argument order.

**The label baseline problem, and why it no longer exists.** The design gives
*baselines*; `drawText` anchors by the *top* of the glyph box and PZ exposes no
ascent. That was solved by disassembling `AngelCodeFont.getHeight(str, real,
offset)`, and it was still machine-dependent: the same code cleared the icons
here and collided with them on the owner's 4K machine, because the game's font
metrics were the only input to this device that came from the player's
settings.

So the legends moved to the mod's own pixel face (P4-R90). The cell is 11px
with its baseline at `ascent` and every capital inks rows 2..8, so a legend
sits at `baseline − ascent` and draws identically on every machine — 5px clear
of its icon, everywhere.

The legend pictures exist at 1x, 2x and 3x. The machine also comes at half and
one-and-a-half size (P4-R99); at those sizes a legend uses the next picture up,
drawn at the machine's size. Before 2026-09-15 it looked for `0.5x` and `1.5x`
folders that were never built, and HOME and BACK were not drawn at those sizes.

## Install

Nothing to install: the case is part of Conspiracy-Files.

**WINDOWS play machine** — if a `FieldnoteTest` folder is still in
`C:\Users\<you>\Zomboid\mods\` from the old instructions, delete it and disable
**Fieldnote PDA (test)** in the Mods menu: it would draw a second, blank device
on screen.

## Test

Automated, on the LINUX dev machine, through the same harness as every other
check (boots a real game, ~4 minutes; also run by `tools/autotest/suite.sh`):

```bash
tools/fieldnote-test/boot_test.sh --hidden
```

It opens the organiser and proves, on that window: it draws its case with and
without wear; at every machine size (0.5x to 3x) every key resolves at both
ends of its half-open box and not one pixel past, and a press there lands on
that key; every legend letter has a picture at every machine size; the rocker
divider row `y=577` is inactive; a key's face takes its pressed colour while
held and restores after; a click dispatches exactly once; a release off the key,
on the glass or on another key, dispatches nothing; no hardware primitive
enters the LCD; every key label sits below its icon; no errors inside the mod.
A screenshot lands in `dev/eval/linux/runs/<session>-fieldnote.png` and an
evidence file in `docs/management/evidence/linux-autotest/`.
`tools/autotest/prove.py --only key-drag-off key-half-open legend-sizes` shows
the check fails when each of those is broken.

By hand, in-game, from the debug console:

```lua
ConspiracyFiles.OrganiserScreen.open()
ConspiracyFiles.OrganiserScreen.zoom(0.5)   -- 0.5, 1, 1.5, 2 or 3
Fieldnote.Panel.showWear=false              -- pristine housing; true restores scuffs
```

## It replaced the old PDA case — done, 2026-09-13

Kept as the record of what changed.

1. **Geometry.** `OrganiserScreen` draws into `Fieldnote`'s `320 x 422` LCD at
   `(40, 50)`. The old `Generated/OrganiserCase.lua` and its `glass` are gone,
   and so is the whole SVG-to-four-PNG-exports chain: `build_organiser_case.py`,
   `art/organiser-case.svg`, its four exports and the eight case, press, rocker
   and power textures. `build_organiser_art.py` keeps its icon builder, which
   is pixel art drawn in code and always was.

2. **Input.** The six controls, per P4-R87:

   | Fieldnote control | label | action | Knox.OS |
   |---|---|---|---|
   | C09 (far left) | HOME | home | MENU — the launcher |
   | C10 (left inner) | *blank* | unassigned | nothing, deliberately |
   | C11 (right inner) | *blank* | unassigned | nothing, deliberately |
   | C12 (far right) | BACK | back | BACK |
   | rocker_up / rocker_down | — | scroll_up / scroll_down | UP / DOWN |

   The rocker taking up and down is what frees the two inner keys; MENU and
   BACK have to live on keys because there is no power tab and MENU is also how
   the device wakes. The inner two keep their moulded faces and depress, but
   print nothing and do nothing until play shows what they are for. A key acts
   when it is let go over the key it went down on; sliding off cancels it.

3. **Sizes.** Two independent controls (P4-R89, P4-R99): how big the machine is
   drawn, and how big its type is. SETUP holds both, and the case's
   bottom-right corner drags, snapping to the machine sizes.

The lamp is one `drawRect` over the LCD, as it always was; the design has no
lamp control and no power tab, so a held MENU still lights it (P4-R84).
