# Step 1 findings: shell + KnoxUI Canvas2D shim, checked against the real game

docs/design/KNOX_OS_WEB_PDA_PLAN_2026-09-26.md §7 step 1.

## What was built

`web/knox-os-pda/index.html` loads `KnoxUI.lua` and `OrganiserFont.lua`
byte-for-byte unmodified (copied verbatim from
`mod/common/media/lua/{client,shared}/ConspiracyFiles/`) into fengari, and
routes its three real draw-call targets (`drawRect`, `drawRectBorder`,
`drawTextureScaled`) plus the global `getTexture` through a small Canvas2D
shim onto a native 160x160 canvas, scaled 3x by a fixed CSS transform
(§3). The real glyph PNGs (`media/ui/CFOrg/**`) are copied verbatim as the
shim's texture source — no re-drawn or approximated glyphs.

## Two real bugs found and fixed while building it

1. **Argument-index bug in the shim (not in KnoxUI.lua).** The adapter Lua
   calls `panel:drawRect(x,y,w,h,a,r,g,b)` as a plain 8-argument function
   (method-colon syntax already consumes `self` before the call), but the
   shim's JS callback read Lua stack indices 2-9 as if a 9th argument (a
   `self` receiver) were present. Fixed to read indices 1-8.
2. **`source-atop` compositing bug.** Tinting a glyph's white-on-transparent
   PNG to a target colour by drawing it then filling with
   `globalCompositeOperation = 'source-atop'` composites against whatever
   the **destination canvas already has** — and since the canvas already had
   an opaque background fill everywhere, every glyph tint filled its entire
   bounding rectangle solid instead of just the letter shape. Fixed by
   tinting on a small offscreen buffer that starts transparent every time,
   then drawing the tinted result onto the real canvas with normal
   compositing.

Both were caught by comparing actual pixel data (`getImageData`) against
what the real, unmodified `KnoxUI.lua` was actually being told to draw
(confirmed via temporary console logging of every draw call's real
arguments) — not by assuming the shim was correct because no error was
thrown.

## The real-game comparison

The real Knox.OS was opened live (`ConspiracyFiles.OrganiserScreen.open()`,
the same call `tools/autotest/checks/organiser.lua` already uses) on a fresh
save and screenshotted (`tools/autotest/pz.sh shot`) after tapping into the
FILES program from the launcher grid:

- `knox-os-web-step1-real-game-files.png` — the real game's FILES screen.
- `knox-os-web-step1-browser-render.png` — the browser shell's render of a
  hand-picked FILES fixture (no real evidence existed on this fresh save to
  render instead — an honest limitation, not a stand-in for the real
  content bridge, which is step 2's job).

**What matches**: the dark title-bar band with light (`K.GLASS`) text on the
left and a status word on the right; the light sage-green background fill;
the dimmed footer line with its divider rule above it. All three are the
same widget-kit calls (`K.titleBar`, `K.fill`, `K.foot`) producing
structurally identical output in both.

**What isn't compared here**: row rendering, since the real save's FILES
program was empty ("Nothing recorded yet.") — nothing to compare pixel-for-
pixel against my hand-picked two-row fixture. That comparison is real work
for step 3 (the fidelity check against `docs/management/evidence/linux-
autotest/`'s actual captured PDA state, per §2.2's trace-replay design) once
step 2 bridges in real mystery content.

## `test/fixtures/*.lua` are the wrong fixtures — a real correction

The build order's own step 1 wording called for checking "more than one
fixture from `test/fixtures/*.lua`" against the real game. Reading those
four files before using them found they are **not** rendering fixtures at
all: `case_digest.lua` is a hash-digest utility, `generator_unsteered_digest.lua`
is a table of regression hashes for the *legacy* case generator,
`synthetic_locations.lua` is invented map data for that same legacy
generator's site placement, and `generated_session.lua` builds a real
legacy case through `Generator.build`/`Session`. All four exist to prove
the **old** case generator hasn't silently changed — none of them touch
`KnoxUI.lua`, `Ledger.lua`, or any Vocabulary-shaped mystery, and none
produce anything to render on a Knox.OS screen. Using them here would have
been going through the motions without actually checking anything.

The substitute that actually serves the same purpose — proving the ported
widget kit is not exercising just one lucky code path — is two genuinely
different real screens, each built from real `KnoxUI.lua` calls and
checked against a live screenshot from the actual game:

1. **FILES, empty state** (above) — `K.titleBar` + `K.fill` + `K.foot`.
2. **The launcher grid** — `K.status` + `K.grid` + `K.foot`, built with the
   real program list and order from `KnoxApps.lua`'s own `A.programs`
   (`FILES, THREADS, NAMES, PLACES, DATES, TO DO, NOTES, SETUP, HELP,
   SITES`) and the real icon textures
   (`media/ui/CFOrg/icons/2x/*.png`), opened live
   (`ConspiracyFiles.OrganiserScreen.open()`) and screenshotted at its real
   measured glass size — 160 native pixels wide, **211 tall, not 160
   square** (read live from `OrganiserScreen.window.context`, correcting
   an assumption this plan had carried since its first draft). Compare
   `knox-os-web-step1-real-game-launcher.png` against
   `knox-os-web-step1-browser-render-launcher.png`: the 3-column icon
   grid, every icon shape, the selected/inverted FILES cell, the "All ▾"
   category selector, the battery, and the footer text all match.
