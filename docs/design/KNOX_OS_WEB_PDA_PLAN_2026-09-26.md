# Knox.OS in a browser — a standalone 1:1 copy of the PDA

Owner, 2026-09-26: *"plan a 1:1 copy of our PDA that runs on a chrome based
browser outside our game. Testing of misteries and UI in it without running
the game. Should run right out of GitHub or as standalone download."*

This is the plan. Nothing in it is built yet.

## 1. What "the PDA" actually is

There is no file literally named "PDA" in the mod. The device is **Knox.OS**,
a fake 1990s Palm-style organiser rendered on a fixed **160 x 160 native-pixel
glass**, scaled up by whole numbers (`docs/design/KNOX_OS.md`, "The canvas").
The code splits cleanly into two layers, and that split is what makes a web
copy possible at all:

- **Pure Lua, no PZ dependency**: `Vocabulary.lua`, `Ledger.lua`,
  `Interpreter.lua`, `Linter.lua`, `Spoilage.lua`, `ShapeCard.lua`,
  `DiversityGuard.lua`, `Threads.lua`, and the widget kit `KnoxUI.lua` (a
  context object plus rect-fill/rect-border/text/hit-test primitives — "one
  file: a list of widgets, a hit test, and a draw"). None of this calls a
  Java/Kahlua API.
- **PZ glue**: `OrganiserScreen.lua` (`ISPanel`, mouse handlers, the actual
  `getTexture`/`drawRect` calls) and `Organiser.lua` (equip-in-hand mechanics,
  "a stylus needs a hand"). This layer has no meaning outside the game and is
  not worth porting.
- **`KnoxApps.lua`** (the "programs": Files, Names, Dates, Threads, Places,
  Notes, To-do, Setup, Help, and a debug-only Sites screen) sits in between:
  its list-building logic is pure, but it reads live session state
  (`EvidenceRows`, `Generated/Questions`, `Calendar`, `SuccessiveCases`,
  `Threads`) that only exists inside a running game.

A 1:1 web copy means: pixel-identical 160x160 glass, the same widget kit, the
same fonts, the same programs, and — because the logic layer is already pure
Lua — the **same real mystery logic**, not a static mockup of it. Rendering a
mystery's Files/Threads/Dates screens from an actual `Ledger` and
`Interpreter.visibleReveals` call is what makes this useful for testing, not
just for looking at.

## 2. What ports, what doesn't

| Module | Porting plan |
|---|---|
| `Vocabulary.lua`, `Ledger.lua`, `Interpreter.lua`, `Linter.lua`, `Spoilage.lua`, `ShapeCard.lua`, `DiversityGuard.lua` | Manual 1:1 port to plain JS. Each is small, already data-shaped (plain tables/functions, no metatables), and each already has an offline test file (`test/mystery_*.lua`) whose assertions translate directly into a JS test — the port is checked against the same proofs, not new ones. |
| `Threads.lua` | Same: pure Lua, ports the same way, including the rotating `CLOSING`/`STILL`/`SET_ASIDE`/`RAN_OUT` voice strings verbatim (DR-20260920-NO-CONCLUSION: grouping must never read as "solved"). |
| `KnoxUI.lua` | Ports 1:1: `drawRect`/`drawRectBorder`/`drawTextureScaled`/hit-test become Canvas2D calls with the same signatures. The per-glyph PNGs it loads (`media/ui/CFOrg/{1x,2x,3x,b1x}/<code>.png`) are already plain PNGs — copied as-is, no format conversion. |
| `KnoxApps.lua` | Ports the list-building logic; the live-session reads (`EvidenceRows`, `Generated/Questions`, `Calendar`, `SuccessiveCases`) are replaced by a small mock data layer fed from a loaded mystery fixture (§4) rather than a running game. |
| `OrganiserScreen.lua`, `Organiser.lua` | **Not ported.** Replaced by plain browser click/keydown handlers that call into the same `KnoxUI` hit-test contract the game code already uses — the equip-in-hand risk mechanic has no meaning with the game not running, and the plan does not pretend otherwise. |

## 3. Architecture

A static site, zero build step, plain HTML + CSS + Canvas2D + `<script>` tags
in dependency order (no ES module `import`, no bundler) — chosen specifically
so the same files work two ways with no separate build:

- **Out of GitHub**: GitHub Pages served from a `docs/` folder or a
  `gh-pages` branch, reachable at a URL with zero install.
- **As a standalone download**: the same folder, zipped, opens by
  double-clicking `index.html` — which rules out `fetch()` of local JSON
  (blocked under `file://` in Chrome) and rules out ES modules (also blocked
  under `file://` without a server). Fixtures and glyph data ship as inline
  `<script>` JS objects, not fetched files, so both delivery paths run the
  identical code with no conditional.

Proposed layout: `web/knox-os-pda/` —
```
index.html
knox-ui.js          -- ported KnoxUI.lua
knox-apps.js         -- ported KnoxApps.lua
mystery-engine.js     -- ported Vocabulary/Ledger/Interpreter/Linter/Spoilage/ShapeCard/DiversityGuard
pz-shim.js            -- the handful of stubbed globals (getDebug, isClient, isServer) as a debug toggle
fixtures/*.js         -- exported mystery content (§4), one file per mystery
assets/CFOrg/...      -- the glyph PNGs, copied verbatim
```

## 4. Bridging real mystery content, without touching PZ

The mystery content files (`mod/.../Mystery/Content/*.lua` — the electrician,
the farmer, the fitness instructor) are plain Lua tables with no PZ calls,
exactly like the engine modules. A short offline exporter script (plain
`lua5.1`, the same `package.path` shim `test/mystery_*.lua` already uses)
`require`s a content file and prints it back out as a JS object literal. This
means any mystery — present or future — drops into the web tool with no
hand-transcription and without ever starting the game, which is the whole
point of the ask.

## 5. Fidelity rules the port must not silently drop

These are enforced today by the pure Lua modules and by authored prose, not
by anything PZ-specific, so the port inherits them automatically if the logic
is actually reused rather than re-approximated:

- **Nothing counts** — no totals anywhere on screen (`EVERY_MYSTERY_ITS_OWN_2026-09-25.md`).
- **Two readings stay live; nothing says "solved"** — the honesty rules
  `Linter.lua` already enforces on rendered text carry over unchanged because
  the same authored strings render through the same `Interpreter`.
- **Hedged voice, never certainty language** (`docs/design/PLAYER_VOICE.md`).
- **Discovery order, never re-sorted** (`docs/design/READING_SURFACES.md`).
- **Tab dividers of a physical record book, not toolbar buttons; no
  dark-monospace "hacker" restyle** (`docs/design/EVIDENCE_WINDOW_LOOK.md`) —
  the glass palette (`K.INK`/`K.DIM`/`K.GLASS`, greenish-grey LCD) ports
  verbatim as CSS/Canvas colours, not reinterpreted.
- The debug-only **Sites** screen stays hidden by default; the web tool
  exposes it behind an explicit checkbox/URL flag standing in for
  `getDebug()`, never on by default.

## 6. Explicit non-goals

- No attempt to reproduce the equip-in-hand risk mechanic (meaningless with
  no game running).
- No attempt to run the case `Generator`/`Session`/`Storage` placement
  pipeline — that simulates the physical world, which this tool has no use
  for; it renders a mystery's *record*, not its placement.
- No multiplayer, no save persistence beyond the browser's own
  `localStorage` for convenience (remembering the last loaded fixture).

## 7. Build order, for whenever this becomes a build task

1. **Shell + KnoxUI port**: static canvas, ported widget kit, one
   hand-written fixture (the electrician mystery's Files and Threads
   screens), checked pixel-by-pixel against a screenshot from the real game.
2. **Logic port**: Ledger/Interpreter/Spoilage/Linter/ShapeCard/DiversityGuard
   ported with `test/mystery_*.lua`'s own assertions translated 1:1 into JS —
   proves logic fidelity, not just that it looks right.
3. **Exporter + all three mysteries**: the Lua→JS exporter (§4), all three
   shipped mysteries loadable from a dropdown with no hand-transcription.
4. **Deployment**: GitHub Pages publish and a zipped standalone-download
   build, from the same unmodified files.
5. **Stretch**: a ShapeCard/DiversityGuard visualiser for authoring new
   mysteries directly in the browser, checking a draft against the roster
   before it ever reaches a native Linux run.

Steps 1–2 are where the real risk lives (does the ported widget kit actually
look like Knox.OS, does the ported ledger actually behave like the Lua one) —
both are independently checkable before any GitHub/deployment work starts.
