# Fieldnote PDA — standalone test mod

A separate, self-contained Project Zomboid Build 42.20 mod that draws the
rectangle-built PDA from `design/manifest.json` using **only native
`drawRect` calls and built-in UI text**. No textures, no SVG, no PNG at
runtime. It does **not** touch the Conspiracy-Files mod or the current PDA.

The LCD is drawn as a blank filled rectangle and nothing hardware ever
enters it. No branding, no handwriting pad. Wear scuffs are on by default,
as the manifest's `default_visibility` says, and can be toggled.

```
tools/fieldnote-test/
  design/                      the package's manifest.json + DESIGN.md + reference PNG
  build_fieldnote.py           manifest.json  ->  Geometry.lua  (the ONLY way geometry changes)
  FieldnoteTest/               the mod itself (copy this folder)
    42/mod.info
    common/media/lua/shared/Fieldnote/Geometry.lua    GENERATED - do not edit
    common/media/lua/client/Fieldnote/Panel.lua       the renderer + input
    common/media/lua/client/Fieldnote/Fieldnote.lua   entry point, opens on game start
  probe.lua                    eval-channel checks used by boot_test.sh
  boot_test.sh                 boots a real game and proves the contract
```

## What was verified against the installed game, not from memory

| Call | Verified signature | Consequence |
|---|---|---|
| `ISUIElement:drawRect` | `(x, y, w, h, a, r, g, b)` | **alpha first** |
| `ISUIElement:drawText` | `(str, x, y, r, g, b, a, font)` | **alpha last** |
| `zombie.ui.TextManager` | `MeasureStringX(UIFont, String)` | centring |
| `zombie.ui.TextManager` | `MeasureStringYOffset` + `MeasureStringYReal` | **the baseline** — see below |
| `UIFont` | `Small`, `Medium` exist | "UI Small" → `UIFont.Small` |

The palette is kept as `{r,g,b,a}` and reordered per call in `Panel.lua`.
That difference between the two draw calls is exactly why the design refused
to fix an argument order.

**The one thing the package said needed eyes — resolved from the bytecode.**
`drawText` anchors by the *top* of the glyph box; the design gives
*baselines*, and PZ exposes no ascent directly. The first live render used
`getFontHeight` and every label landed ~10px high, on its icon; `MeasureStringY`
overshot too (it is the full box). Disassembling
`AngelCodeFont.getHeight(str, real, offset)` shows it tracks the highest ink
row and the lowest: `MeasureStringYOffset` returns the rows *above* the ink and
`MeasureStringYReal` the ink height, so their sum is the ink bottom — the
baseline of a descender-free caps label. Labels are placed at
`baseline − (YOffset + YReal)`, and `boot_test.sh` now **asserts** every
label's top sits below its icon rather than leaving it to a screenshot.

## Install

**LINUX dev machine** — the harness does it for you (see Test). To do it by
hand, copy (do not symlink — item scripts fail through a link) the mod folder:

```bash
rsync -a --delete tools/fieldnote-test/FieldnoteTest/ ~/Zomboid/mods/FieldnoteTest/
```

**WINDOWS play machine** — copy the `FieldnoteTest` folder to
`C:\Users\<you>\Zomboid\mods\FieldnoteTest\`, then enable **Fieldnote PDA
(test)** in the game's Mods menu. It coexists with Conspiracy-Files; enable
both or either.

## Test

Automated, on the LINUX dev machine, through the same harness as every other
check (boots a real game, ~4 minutes):

```bash
tools/fieldnote-test/boot_test.sh --hidden
```

It proves: the mod loads and opens; it draws with and without wear; every
manifest hitbox resolves at both ends of its half-open box and not one pixel
past; the rocker divider row `y=577` is inactive; a key's face takes its
pressed colour while held and restores on release; a click dispatches exactly
once and a drag off the key dispatches nothing; no hardware primitive enters
the LCD; every key label sits below its icon (the baseline rule, measured); no
errors inside the mod. A screenshot lands in
`dev/eval/linux/runs/<session>-fieldnote.png` and an evidence file in
`docs/management/evidence/linux-autotest/`.

By hand, in-game, from the debug console:

```lua
Fieldnote.toggle()      -- show / hide
Fieldnote.zoom()        -- cycle 1x / 2x / 3x   (or Fieldnote.zoom(2))
Fieldnote.wear(false)   -- pristine housing;  Fieldnote.wear(true) restores scuffs
```

Every button press prints `[FIELDNOTE] press: <id> -> <action>` to the
console. Nothing is wired to a game action — deliberately, per the design.

## Replace the current PDA (NOT done — for approval)

The panel's public surface was shaped to mirror `ConspiracyFiles.OrganiserScreen`
so the swap is small. Three changes, in order:

1. **Geometry.** Point `OrganiserScreen` at `Fieldnote.Panel.metrics().lcd`
   instead of `Generated/OrganiserCase.lua`'s `glass`. The LCD is
   `320 × 422` at `(40, 50)` — the same 320-wide canvas the type was cut
   for, so Knox.OS's own drawing needs **no** change beyond its origin. The
   case hit boxes (`Case.buttons`) become `Geometry.controls`.

2. **Input.** `Fieldnote.Panel.onAction(action, id)` is the single dispatch
   point. Map it onto the existing `Screen:press(id)`:

   | Fieldnote control | label | action | Knox.OS |
   |---|---|---|---|
   | C09 (far left) | HOME | home | MENU — the launcher |
   | C10 (left inner) | *blank* | unassigned | nothing, deliberately |
   | C11 (right inner) | *blank* | unassigned | nothing, deliberately |
   | C12 (far right) | BACK | back | BACK |
   | rocker_up / rocker_down | — | scroll_up / scroll_down | UP / DOWN |

   Settled by the owner on 2026-09-13 (P4-R87). The rocker taking up and down
   is what frees the two inner keys; MENU and BACK have to live on keys
   because there is no power tab and MENU is also how the device wakes. The
   inner two keep their moulded faces and depress, but print nothing and do
   nothing until play shows what they are for — a key that prints a word and
   does something else is worse than a key that prints nothing. They still
   dispatch `unassigned`, so a press shows up in the log while the owner is
   working out what he reaches for.

3. **Art.** `build_organiser_case.py`, the four `art/organiser-case-*.png`
   exports and `media/ui/CFOrg/case_*.png` become unused and can be
   removed. The lamp overlay, if kept, is one `drawRect` over the LCD.

Do **not** do any of this until the test build is approved in-game. The
whole point of this folder is that it can be looked at first.
