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

**Fourth ADHD pass, 2026-09-26** (`/adhd review the plan focusing on
reusability of actual game code. We want to test the game not rebuild the
PDA from scratch.`). Five isolated frames found a real gap in every draft so
far: the plan's "loaded verbatim" language was true where it cost nothing to
be true (the zero-PZ-dependency engine modules), and quietly stopped being
true exactly where it mattered (KnoxUI's draw calls, `OrganiserScreen`'s
hit-testing) — those get hand-rebuilt in JS with no gate holding them to the
real source. Three frames independently proposed the fix that removes the
gap instead of just monitoring it: run the real compiled Java UI classes
inside a browser JVM rather than reimplementing their draw/hit-test logic by
hand. §2 is revised below with that as a parallel research spike, plus a
trace-replay fidelity check and hardening for whatever hand-written shim
layer survives either way.

**Build started, 2026-09-26** (`/goal build our plan`). Both gating spikes
from §7 (steps 0a and 0b) are now run and resolved, not hypothetical: 0a
passed (fengari runs the real engine modules unmodified, verified in the
browser pane against `test/mystery_*.lua`'s own assertions), 0b failed on
real evidence (the actual compiled `UIElement`/`UIManager` Java classes,
extracted from the shipped jar and read with `javap`, are one hop from raw
OpenGL and the live world/entity graph — no isolable UI subset to run in a
browser JVM). §2, §3, and §7 updated in place to record both results as
settled, not conditional. See
`docs/management/evidence/knox-os-web-spike-0b-jvm-feasibility.md` for 0b's
full findings.

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
| `KnoxUI.lua` | Its Lua control flow (the context object, hit-testing, layout math) runs as the real file, unchanged. Its draw calls (`drawRect`/`drawRectBorder`/`drawTextureScaled`/`getTexture`) are real PZ-API calls with **no JS reimplementation trusted on its own** — see §2.1 below. The per-glyph PNGs it loads (`media/ui/CFOrg/{1x,2x,3x,b1x}/<code>.png`) are already plain PNGs, copied as-is. |
| `KnoxApps.lua` | Also loaded verbatim; its live-session reads (`EvidenceRows`, `Generated/Questions`, `Calendar`, `SuccessiveCases`) get a small Lua-side shim module providing the same function names, backed by an actual exported PZ save snapshot rather than hand-authored mock data (§2.3) — never a JS mock layer. |
| `OrganiserScreen.lua`, `Organiser.lua` | Their equip-in-hand mechanic genuinely has no meaning with the game not running, so that part is not reproduced. Their mouse-handling and hit-test dispatch, however, is exactly the "contested territory" §2.1 is about — see there before assuming a hand-written click handler is the final answer. |

Before committing to a specific VM, the very first concrete step (§7, step 0a)
is loading `Ledger.lua` unmodified into a candidate VM and running
`test/mystery_ledger.lua`'s assertions against it. This project has already
hit real Kahlua-vs-standard-Lua semantic gaps twice this session (the `next()`
gotcha, most recently) — a browser Lua VM is a different dialect gap in the
same family, and needs its own small compatibility check before anything
else is built on top of it, not blind trust that "it's Lua so it'll just work."

### 2.1 The verbatim claim was asymmetric — where it actually matters

The fourth ADHD pass's sharpest finding: every module the table above calls
"loaded verbatim" in the engine row was **already zero-PZ-dependency by
construction** — reuse there cost nothing and required no design decision.
The one place a real decision was made — KnoxUI's draw calls,
`OrganiserScreen`'s hit-testing and mouse dispatch — is exactly where the
first three drafts of this plan quietly substituted hand-written JS, with
none of the "no second implementation, ever" rigor §2's own opening
paragraph already argues for the engine. The owner's own framing of this
pass ("we want to test the game, not rebuild the PDA from scratch") is a
direct correction to that gap.

Three isolated frames (remove-the-load-bearing-assumption, and speedrunner
twice, independently) proposed the same fix: run the actual compiled Java UI
classes — `ISPanel`, `OrganiserScreen`, and whatever `KnoxUI.lua`'s draw
calls resolve to — inside a browser-hosted JVM (CheerpJ or TeaVM), so the
genuine bytecode executes in the tab instead of a JS guess at what it does.
This is the one idea in the whole pass that satisfies every constraint at
once: real game code, no running game process, still a static/standalone
site.

**Spike run, resolved negative — §7 step 0b.** `zombie/ui/UIElement.class`
and `zombie/ui/UIManager.class`, the real compiled classes every `ISPanel`/
`OrganiserScreen` method dispatches to via `self.javaObject`, were extracted
from the shipped jar and inspected against their real bytecode constant
pools. One hop away: raw `org.lwjgl.opengl.GL11`, PZ's own native-adjacent
renderer, the live world/entity graph, and the specific Kahlua VM's Java
bridge classes wired in directly, not reflectively. No isolable "just the
UI" subset exists to run in a browser JVM. Full findings:
`docs/management/evidence/knox-os-web-spike-0b-jvm-feasibility.md`. §2.2 and
§2.3 below are the committed path, not a fallback.

### 2.2 The hand-written shim's trace-replay oracle

Regardless of §2.1's now-resolved outcome, a second idea fixes a concrete
problem the shim design has anyway: a hand-coded Canvas2D substitute can
pass every functional test while drawing placeholder rectangles instead of
real sprites, and a wrong texture coordinate or a missing sprite never
surfaces. The fix, converged on independently by two frames: capture a real
play session's actual `drawRect`/`drawTextureScaled`/`getTexture` call
arguments, plus the real texture-atlas bytes those calls actually drew from,
as a trace — then have the browser tool's fidelity check replay that trace
verbatim and diff against it, rather than a person eyeballing whether a
hand-picked colour looks approximately right. This project's own native
autotest harness (`tools/autotest/pz.sh`) can capture exactly this kind of
trace the next time it drives a real Knox.OS screen, so the infrastructure
to do this already exists — it just isn't being pointed at this problem yet.
A trace only covers states actually recorded, so this is a fidelity check
for known screens, not a general-purpose renderer; it complements the
Canvas2D shim, it doesn't replace the need for one.

### 2.3 Hardening the hand-written layer

Some hand-written glue survives (the Canvas2D draw-call shim, and the
debug/session shim, at minimum — §2.1). Four converged fixes keep that
layer honest instead of merely asserted:

- **Hash-lock every "verbatim" file.** A CI checksum diff against the real
  mod source tree for every file §2's table calls verbatim, failing the
  build on drift — the same sync-script §3 already requires, just enforced
  as a gate rather than a one-time copy.
- **Generate shim signatures, don't hand-type them**, wherever a real
  reflection/API surface exists to generate them from — a hand-typed
  signature can silently miss a parameter the real API gained since it was
  written; a generated one can't drift without the generator noticing.
- **Dual-run the engine's own test suite.** `test/mystery_*.lua`'s
  assertions already run inside the browser Lua VM (§2's table); running
  the *same* assertions against the real PZ-embedded Lua runtime — via this
  project's existing native harness — and diffing the two outputs closes
  the one gap nothing else here does: proof that the browser VM's dialect
  actually agrees with Kahlua's, not just an assumption it does.
- **Derive `KnoxApps`' mock session data from an actual exported PZ save**,
  refreshed when the save format changes, rather than hand-authoring it
  once — a hand-typed mock can only fail on session shapes it was never
  written to produce, which is exactly the blind spot a real bug would hide
  in.

### 2.4 What this plan still won't do, and why

The fourth pass also surfaced a cluster of maximal-fidelity ideas this plan
explicitly does not pursue: streaming a currently-running game's screen over
VNC, driving a live instance through its RCON/debug console, or piping a
headless client's real-time framebuffer to the browser over a socket. Every
one of these is more faithful than anything above, and every one of them
requires an actual running PZ process somewhere — which directly
contradicts this project's own stated goal, unchanged since the first draft:
testing *without* running the game, deployable as a static site or a
standalone download. These stay on record as the theoretical ceiling if that
constraint is ever relaxed, not as work items now.

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

Proposed layout: `web/knox-os-pda/` — settled by §2.1/§7 step 0b, not
provisional: the JVM-in-browser path is not the plan going forward, so
`knox-ui-shim.js` below is the committed Canvas2D draw-call shim, checked
against §2.2's trace-replay oracle rather than trusted on its own.
```
index.html
lua-vm.js             -- fengari, vendored, unmodified -- confirmed by §7 step 0a
knox-ui-shim.js       -- the draw-call substitutes KnoxUI.lua's context needs (Canvas2D),
                         checked against the trace-replay oracle (§2.2), never trusted alone
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

0a. **VM smoke test — DONE, PASSED.** `Vocabulary.lua`, `Ledger.lua`,
   `Spoilage.lua`, `Interpreter.lua`, and `Linter.lua` were loaded byte-for-
   byte unmodified into fengari (via CDN, in the browser pane) and the real
   `test/mystery_ledger.lua`, `test/mystery_interpreter.lua`,
   `test/mystery_linter.lua`, `test/mystery_spoilage.lua` were run against
   them with only their harness-only `package.path` line removed — every
   assertion untouched. All four passed, including `Linter.lua`, the module
   with this project's own documented Kahlua-dialect gotcha (`next()`). See
   `web/knox-os-pda/spike-0a-*.html`. The Lua-VM half of §2's architecture is
   confirmed, not assumed.
0b. **JVM-in-browser spike — DONE, FAILED.** `zombie/ui/UIElement.class` and
   `zombie/ui/UIManager.class` (the real compiled Java classes every
   `ISPanel`/`OrganiserScreen` method actually dispatches to via
   `self.javaObject`) were extracted from the shipped `projectzomboid.jar`
   and inspected with `javap -v -p` against their real constant pools — not
   a guess. One hop away: raw `org.lwjgl.opengl.GL11`, PZ's own
   `SpriteRenderer`/`IndieGL` native renderer, the live `IsoWorld`/
   `IsoCamera`/`IsoObjectPicker`/`IsoPlayer` world-entity graph, and the
   *specific* Kahlua VM's Java bridge classes (`KahluaTable`, `KahluaThread`,
   `LuaCaller`) wired in at the bytecode level. No isolable "just the UI"
   seam exists. Full findings:
   `docs/management/evidence/knox-os-web-spike-0b-jvm-feasibility.md`. §2.1's
   JVM-in-browser path is not the plan going forward — §2.2 (trace-replay)
   and §2.3 (hash-locking, dual-run diffing) are, and step 1 below is
   settled, not conditional.
1. **Shell + the Canvas2D shim over `KnoxUI.lua`'s real (unmodified) context
   object — DONE.** `web/knox-os-pda/index.html`, built and verified live in
   the browser pane and against a real, freshly-opened Knox.OS on the actual
   game (`docs/management/evidence/knox-os-web-step1-fidelity-check.md`).
   Two real bugs surfaced and were fixed, not assumed away: an argument-
   index mismatch in the shim's own JS callbacks (not in `KnoxUI.lua`), and
   a `source-atop` compositing bug that painted every glyph's full bounding
   rectangle solid instead of just its letter shape (tinting must happen on
   an isolated, always-transparent offscreen buffer, never directly against
   an already-opaque destination canvas). The title bar, background, and
   footer chrome now match the real game's rendering of the same widgets;
   row-by-row comparison against real populated content is real work still
   owed to step 3, since the fresh save used for the comparison had no
   evidence yet. The **more than one fixture** requirement below is still
   open — this step used one hand-picked fixture, not yet
   `test/fixtures/*.lua`'s canonical data:
   `case_digest`, `generated_session`, `generator_unsteered_digest`,
   `synthetic_locations` — already hand-checked canonical data, not newly
   hand-authored, each still to be checked pixel-by-pixel against a
   screenshot from the real game. More than one fixture on purpose: a single
   golden fixture was flagged independently by two ADHD frames as creating
   false "the whole widget kit is covered" confidence when it really
   exercises one path once.
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

Steps 0a and 0b are what everything else is conditional on. Steps 1–3 are where the
remaining real risk lives (does the shim actually look like Knox.OS, does
the fidelity diff actually catch a real drift) — both checkable before any
deployment work starts.
