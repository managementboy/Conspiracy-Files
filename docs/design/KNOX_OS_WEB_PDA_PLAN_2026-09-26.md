# Knox.OS in a browser — a standalone 1:1 copy of the PDA

Owner, 2026-09-26: *"plan a 1:1 copy of our PDA that runs on a chrome based
browser outside our game. Testing of misteries and UI in it without running
the game. Should run right out of GitHub or as standalone download."*

This is the plan. Nothing in it is built yet.

**Revised 2026-09-26 after an ADHD pass** (`/adhd improve on this plan`, five
isolated frames). Two frames converged independently on the same fix
(run the real Lua engine in a browser VM instead of hand-porting it to JS),
and two other frames — one adversarial, one an on-call maintainer — converged
independently on the same six staleness/false-confidence risks in the
original manual-port plan. That double convergence, from frames that never
saw each other's output, is the strongest signal in this document and drives
every change below. §2, §3 and §6 (of that draft) were rewritten, and the
draft's old §4 was folded into §2 — see the second pass below for the
current numbering.

**Second ADHD pass, 2026-09-26** (`/adhd`, owner: *"add to the current plan
that we want to test how misteries are presented on the PDA. We need a way
accessing the actual logic and text of the misteries. Example: we pretend we
start as fitness instructor. We generate a first mistery and pretend we have
found the clues. I can test if it makes sense and give you feedback for
refining."*). Five more isolated frames, with two separate three- and
four-way independent convergences — one on what makes a simulated
playthrough trustworthy at all, one on testing every legal clue order rather
than one hand-picked order. New §4 below; §5–§7 renumbered from §4–§6.

**Third ADHD pass, 2026-09-26** (`/adhd`, owner's question: *"should
playthrough be the main feature with fuzzing as a bonus check, or should
fuzzing run first and the manual walkthrough become the tool for
investigating whatever it flags? Both are useful and necessary features.
One can benefit from the other?"*). Five more isolated frames, converging
on "a loop, not a pipeline" from four directions at once — new §4.5, and
two new items in the exclusions list (renumbered §4.6). No section
renumbering this time.

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

## 2. What runs as-is, what gets a small shim, what doesn't come along

**Reversed from the first draft of this plan**: the pure-Lua modules are not
hand-translated to JS. They run *unmodified*, as the exact same `.lua` files
the game ships, inside a browser Lua VM (`fengari` or `wasmoon`, both
WASM/asm.js Lua interpreters with no install step, loadable from a single
`<script>` tag). A hand JS port would be a second implementation of the same
logic that can silently drift from the first every time either one is
edited alone — the ADHD pass converged on this exact failure mode from two
independent angles (an adversarial frame and an on-call-maintainer frame),
and the fix that removes it at the root, converged on independently by two
other frames, is to have only one implementation, ever.

| Module | Plan |
|---|---|
| `Vocabulary.lua`, `Ledger.lua`, `Interpreter.lua`, `Linter.lua`, `Spoilage.lua`, `ShapeCard.lua`, `DiversityGuard.lua`, `Threads.lua` | **Loaded verbatim into the Lua VM, byte-for-byte.** No port. `test/mystery_*.lua`'s own assertions run inside the same VM as the browser tool's test suite — not translated into JS, run as-is, so there is exactly one set of tests for exactly one implementation. |
| Mystery content (`mod/.../Mystery/Content/*.lua` — electrician, farmer, fitness instructor, and any future one) | **Also loaded verbatim.** No exporter, no Lua→JSON step, no hand-transcription — the browser tool `require`s the same file the game does. Any mystery drops in the moment its file exists, including ones not yet written. |
| `KnoxUI.lua` | The one file that genuinely needs a substitute layer, because its draw calls (`drawRect`/`drawRectBorder`/`drawTextureScaled`/`getTexture`) are real PZ-API calls even though the surrounding file is otherwise pure. A thin JS shim intercepts exactly those calls and issues the equivalent Canvas2D call — everything else in the file (the context object, hit-testing, layout) still runs as the real Lua. The per-glyph PNGs it loads (`media/ui/CFOrg/{1x,2x,3x,b1x}/<code>.png`) are already plain PNGs, copied as-is. |
| `KnoxApps.lua` | Also loaded verbatim; its live-session reads (`EvidenceRows`, `Generated/Questions`, `Calendar`, `SuccessiveCases`) get a small Lua-side shim module providing the same function names backed by whatever mystery file is currently loaded, not a JS mock layer. |
| `OrganiserScreen.lua`, `Organiser.lua` | **Not loaded.** Replaced by plain browser click/keydown handlers calling into the same `KnoxUI` hit-test contract — the equip-in-hand risk mechanic has no meaning with the game not running. |

Before committing to a specific VM, the very first concrete step (§7, step 0)
is loading `Ledger.lua` unmodified into a candidate VM and running
`test/mystery_ledger.lua`'s assertions against it. This project has already
hit real Kahlua-vs-standard-Lua semantic gaps twice this session (the `next()`
gotcha, most recently) — a browser Lua VM is a different dialect gap in the
same family, and needs its own small compatibility check before anything
else is built on top of it, not blind trust that "it's Lua so it'll just work."

## 3. Architecture

A static site, zero build step, plain HTML + CSS + Canvas2D + `<script>` tags
in dependency order (no ES module `import`, no bundler, and — per §2 — no JS
port of the engine either) — chosen so the same files work two ways with no
separate build:

- **Out of GitHub**: GitHub Pages served from a `docs/` folder or a
  `gh-pages` branch, reachable at a URL with zero install.
- **As a standalone download**: the same folder, zipped — built by `git
  archive` of the exact commit tagged as deployed to Pages, never a
  hand-copied artifact, so a bug fix can never land in one distribution and
  not the other (an independently-converged risk from the ADHD pass: two
  channels from one repo drift into two effective versions the moment
  anyone hand-maintains them separately). Opens by double-clicking
  `index.html` — which rules out `fetch()` of local files (blocked under
  `file://` in Chrome). The Lua VM, the engine `.lua` files, the mystery
  content `.lua` files, and the glyph PNGs all ship as inline `<script>`
  tags or same-folder relative paths, never fetched, so both delivery paths
  run identically with no conditional.
- The canvas renders natively at 160x160 and is scaled up only by a fixed
  integer CSS transform on the canvas element itself — never a responsive
  reflow to fill the viewport. (Seeded by the ADHD pass's naive-literalist
  frame picturing the fixed canvas as a physical cutout taped over a
  monitor: the frame is a hard boundary, not a layout suggestion.)

Proposed layout: `web/knox-os-pda/` —
```
index.html
lua-vm.js             -- fengari or wasmoon, vendored, unmodified
knox-ui-shim.js       -- the draw-call substitutes KnoxUI.lua's context needs (Canvas2D)
pz-shim.lua           -- the handful of stubbed globals (getDebug, isClient, isServer) as a debug toggle,
                         and the KnoxApps live-session reads backed by the loaded mystery file
lua/                  -- Vocabulary.lua, Ledger.lua, Interpreter.lua, Linter.lua, Spoilage.lua,
                         ShapeCard.lua, DiversityGuard.lua, Threads.lua, KnoxUI.lua, KnoxApps.lua --
                         copied verbatim from mod/common/media/lua/{shared,client}/ConspiracyFiles/,
                         never hand-edited independently of the source
content/*.lua         -- copied verbatim from Mystery/Content/*.lua, one file per mystery
assets/CFOrg/...      -- the glyph PNGs, copied verbatim
```

A build/sync script (not a port) keeps `lua/` and `content/` byte-identical
to their source — the same drift risk applies to a stale *copy* as to a
hand *port*, just one layer down, so this still needs a real check rather
than a one-time copy-paste.

## 4. Testing a mystery's real playthrough

The owner's own example: *"we pretend we start as fitness instructor. We
generate a first mystery and pretend we have found the clues."* This is a
first-class feature, not a byproduct of §1–3 — a way to pick an occupation,
load its mystery, and step through "finding" its clues to read the actual
authored prose and screens as they'd really appear, so feedback can be given
and a refinement checked without ever launching the game.

### 4.1 The base loop

A picker lists every mystery in `content/` (§2 — electrician, farmer,
fitness instructor, any future one) alongside the occupation it declares.
Loading one attaches it to a fresh `Ledger` exactly as `MysteryRuntime.attach`
does. Each of its PLACE findings appears as something clickable; clicking one
calls the real `Ledger.markKnown` and re-renders every Knox.OS screen through
the real `Interpreter.visibleReveals`/`Ledger.close` — the actual prose, the
actual tab layout, in actual discovery order, not a paraphrase of what those
calls would produce.

### 4.2 Faithfulness gates — three frames converged on this independently

Regulator, 3am-on-call, and remove-the-load-bearing-assumption all separately
landed on the same conclusion: a simulator that lets "pretend to find a
clue" mean anything more permissive than what the real game would actually
allow produces feedback about a mystery that can't happen. So:

- **"Find" only calls the real engine path.** No shortcut writes Ledger
  state any way other than the same `markKnown`/`Interpreter` calls the game
  uses — verified by diffing the resulting state object, not by eyeballing
  the screen.
- **Illegal orders are refused, not faked.** A clue whose GATE/LINK
  preconditions the loaded mystery declares aren't yet satisfied cannot be
  "found" — greyed out, not hidden, so the reviewer sees the mystery's own
  dependency shape while testing it, and pretending stays honest pretending.
- **Only the exact committed content runs.** The tool loads the same
  `Content/*.lua` and engine files as the shipping mod, never a stale copy
  or an in-flight edit passed off as the real thing — the sync-script drift
  risk already named in §3 applies here with extra force, since a stale
  file here corrupts feedback, not just a screenshot.
- **No silent stand-ins.** Any screen or text that came from a fallback path
  rather than the real ported `KnoxUI` context is visibly marked as such,
  never a lookalike substitute.
- **Feedback is reproducible.** Each session stamps its content-hash, VM,
  and the exact clue order used, so "this reads confusing" can be replayed
  later against the same inputs rather than staying an ambient impression.

### 4.3 Beyond one hand-picked order

Four frames — remove-the-load-bearing-assumption, 3am-on-call, game
designer, and biology — independently proposed the same extension: don't
stop at the one order a person happens to click through. A second mode runs
every permutation of a mystery's findings (small counts make this cheap;
ShapeCard's own countBucket discipline keeps mysteries small on purpose) or
a randomized/adversarial sample for larger ones, and reports only the
orderings that produce a Linter refusal, an unreachable reveal, or a dead
thread — reading each mystery's own declared `close` predicate first, so a
`carried`-by-design mystery correctly never "resolving" isn't flagged as a
bug. This is a free regression check on the three mysteries that already
ship: running it against them and seeing whether it reports anything is the
first useful thing to do with it.

### 4.4 Refining without replaying everything

Editing one clue's text and wanting to see just what changed, not re-reading
a whole playthrough, is what "give you feedback for refining" actually
needs in practice. Because §4.2 already produces a real state object on
every "find," a second run of the same order can diff against the first and
highlight only what moved — no separate diffing machinery, just a second
stored snapshot. A rewind control over the same session log lets the
reviewer step back to any prior clue rather than only forward.

### 4.5 How the manual playthrough and the fuzzer relate

**Third ADHD pass, 2026-09-26** (`/adhd`, the owner's own question: *"should
playthrough be the main feature with fuzzing as a bonus check, or should
fuzzing run first and the manual walkthrough become the tool for
investigating whatever it flags? Both are useful and necessary features.
One can benefit from the other?"*). Five isolated frames converged on an
answer that is neither ordering: **it's a loop, not a pipeline, with exactly
one ordering constraint.**

- **The constraint, first.** A mystery's *very first* manual playthrough
  must run with zero fuzzer involvement — no pre-staged order, no "suggested
  next clue," nothing. Two frames (inversion, ant colony) independently
  landed on why: a human whose first read is steered toward already-known
  broken states can no longer judge "does this read right" the way an
  uninformed real player would, and that first, uncontaminated read is the
  whole point of §4.1.
- **After that, it's bidirectional.** Four frames (game designer,
  remove-the-load-bearing-assumption, ant colony, and logistics' JIT framing)
  independently converged on the same shape: the human's played order, once
  logged (§4.4 already needs this log for its own diff feature — no new
  plumbing), becomes a seed the fuzzer's search biases toward, so it spends
  its budget near paths a human actually found plausible rather than sampling
  uniformly across the whole permutation space. In the other direction, the
  fuzzer's findings never arrive as a raw report — they're deduplicated to
  one representative order per distinct failure (the same root-cause
  grouping §4.3 already needs to tell a real break from an intended
  `carried` ending) and handed back as a small number of pre-staged,
  replayable sessions, not a list to skim. Investigating one replays it as a
  "ghost" the reviewer can take control of mid-scrub rather than a static
  bug report; ruling a replayed ghost "actually fine" feeds back and damps
  the fuzzer's confidence in that neighbourhood, closing the loop the other
  way.
- **Neither mode certifies a mystery alone.** Independently converged by
  inversion and ant colony: a clean fuzzer sweep says nothing about prose
  quality (a Linter-clean mystery can still read terribly), so "the fuzzer
  found nothing" is *ungraded*, not *passed* — every distinct narrative
  branch still needs at least one human read. And because both modes run
  through the one shared engine (§2), the two agreeing with each other is
  not proof of anything an engine-level bug wouldn't also produce agreement
  on — a real limit this plan cannot design around, only stay honest about.

### 4.6 Explicit exclusions from this feature

- No fictional constraint the real engine doesn't have (a "clue budget," a
  cost to find something) — that would make the reviewer judge a mystery
  against a rule the actual game never enforces.
- No replacement visualisation standing in for the real Knox.OS screens as
  the *primary* interface — the ask is to see mysteries presented on the
  PDA, not a reinterpretation of it. (A handful of ADHD ideas along these
  lines — gradient/diffusion-style displays, a "developmental clock" scrub
  bar as the main view — are noted here as future exploration, not this
  feature.)
- No second-reviewer blind-guess mode, no cross-mystery clue-splicing test —
  both plausible future stretch goals, out of scope for a single-owner
  review loop.
- No "director's cut" replay as the *only* way to investigate a fuzzer
  finding — fine as an option once §4.5's blind-first constraint has been
  satisfied, but forcing every session through a scripted replay removes
  the free first-look exploration the owner actually asked for.
- No ranking fuzzer output by a cheap text metric (cliché density, sentence-
  length variance) before any human reads it — that repeats exactly the
  mistake §4.5 warns against: a shallow proxy quietly standing in for real
  judgment, which is how a team stops sending clean-scoring branches to
  anyone at all.

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
  `localStorage` for convenience (remembering the last loaded fixture) —
  **with one guard**: `localStorage` must never become the only place an
  in-progress draft mystery lives. The ADHD pass's attacker and on-call
  frames both independently flagged this exact drift (a demo convenience
  quietly becomes someone's real save format, until a cache clear or a
  Pages redeploy erases weeks of tuning). The concrete guard is a one-click
  "export this draft back to a `Content/*.lua`-shaped file" button — turning
  the tool into a two-way editor for a draft, not a read-only viewer of a
  finished one — not just a warning in this document.

## 7. Build order, for whenever this becomes a build task

Revised to front-load the highest-risk question (does a browser Lua VM
actually behave like Kahlua's Lua for this codebase) and to spend near-zero
effort on things the repo already has, per the ADHD pass's speedrunner
frame:

0. **VM smoke test, before anything else is designed further**: load
   `Ledger.lua` unmodified into a candidate VM (fengari or wasmoon) and run
   `test/mystery_ledger.lua`'s real assertions against it. If this doesn't
   hold up cheaply, the rest of this plan's §2 needs to fall back to a
   manual port after all, and better to know that in an afternoon than after
   three build steps.
1. **Shell + KnoxUI shim**: static canvas, the Canvas2D draw-call shim over
   `KnoxUI.lua`'s real (unmodified) context object, checked against **more
   than one** fixture from `test/fixtures/*.lua` (`case_digest`,
   `generated_session`, `generator_unsteered_digest`, `synthetic_locations` —
   already hand-checked canonical data, not newly hand-authored), each
   checked pixel-by-pixel against a screenshot from the real game. More than
   one fixture on purpose: a single golden fixture was flagged independently
   by two ADHD frames as creating false "the whole widget kit is covered"
   confidence when it really exercises one path once.
2. **`KnoxApps.lua` + the mystery content bridge**: load `KnoxApps.lua` and
   any `Content/*.lua` file verbatim (§2 — no exporter to build), with the
   live-session shim backing its data reads. All three shipped mysteries
   loadable from a dropdown, and any future one the moment its file exists.
3. **Fidelity check against the real game, not eyeballing**: diff the
   browser tool's rendered state against the real captured PDA state traces
   already sitting in `docs/management/evidence/linux-autotest/`, an
   existing, real oracle rather than a person comparing two screens by eye.
4. **Deployment**: GitHub Pages publish, and the standalone zip built by
   `git archive` of that exact deployed commit (§3) — reusing the `dist/`
   folder's existing versioned-zip naming convention rather than inventing a
   new one.
5. **Stretch, explicitly gated**: a ShapeCard/DiversityGuard visualiser for
   authoring new mysteries directly in the browser, checking a draft against
   the roster before it ever reaches a native Linux run — gated behind a
   dated checkpoint demo of steps 0–3 running a real mystery end to end
   first, so the fun, visible stretch goal can't quietly absorb effort while
   the actual engine bridge stalls at "almost done" (the ADHD pass's
   attacker frame's own words for this trap).

Step 0 is the one everything else is conditional on. Steps 1–3 are where the
remaining real risk lives (does the shim actually look like Knox.OS, does
the fidelity diff actually catch a real drift) — both checkable before any
deployment work starts.
