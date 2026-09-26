# Step 3 findings: the dual-VM trace diff, done for real

docs/design/KNOX_OS_WEB_PDA_PLAN_2026-09-26.md §7 step 3.

## The plan's own wording overstated what already existed

Step 3 as written called for diffing "the browser tool's rendered state
against the real captured PDA state traces already sitting in
`docs/management/evidence/linux-autotest/`." Checking those files
(`*-pdalife.txt`, `*-pdagame.txt`, `*-pdaperf.txt`) before using them found
they are behavioural pass/fail summaries — *"screens: 10 programs toured by
tapping icons... controls: HOME, BACK, the rocker both ways..."* — not
draw-call traces or pixel dumps. There is nothing there to diff a rendered
screen against. §2.2's own trace-replay design was correct that this
project's native harness *could* capture such a trace; it had not
actually been captured yet.

## What was built and run instead: a real dual-VM diff

Rather than defer this, the actual dual-run-and-diff check §2.3 asked for
(*"running the same assertions against the real PZ-embedded Lua runtime...
and diffing the two outputs"*) was built and run now, applied to
`KnoxUI.lua` specifically:

1. **Real game side**: `tools/autotest/pz.sh eval` loaded the real,
   already-running `ConspiracyFiles.KnoxUI` and called it with a plain Lua
   table standing in for `panel` — one that records every
   `drawRect`/`drawRectBorder`/`drawTextureScaled` call's exact arguments
   into a list instead of drawing them, using the same
   `test/fixtures/case_digest.lua` djb2 algorithm this project already
   uses elsewhere to prove byte-for-byte equality. Rendered the exact
   fixture from step 1 (title bar "FILES"/"2", an unselected row, a
   selected row, a footer) through the real Kahlua VM:
   **`536880f4:4328` (63 calls)**.
2. **Browser side**: the identical fixture, the identical real
   `KnoxUI.lua` file, the identical digest algorithm, run inside fengari.
   First attempt threw `bad argument #2 to 'format' (number has no integer
   representation)` — a real, previously-undocumented dialect gap: fengari
   distinguishes float/integer more strictly than Kahlua does, and
   `string.format("%08x", h)` on the plain float the digest's modulo
   arithmetic produces is accepted by Kahlua and refused by fengari. Worked
   around with a hand-written hex encoder (using only `%d`-safe integer
   arithmetic at each step) rather than assumed not to matter. A second
   bug, once that was fixed, silently under-counted to 4 calls instead of
   63 — `KnoxUI.lua`'s own `glyph()` calls `pcall(getTexture, path)`, and
   with no `getTexture` global defined in this bare recording VM, every
   character silently failed to resolve and every text draw vanished with
   no error at all. Fixed by defining a trivial path-echoing `getTexture`
   stub, since only the call arguments matter here, not an actual pixel.
   Final result: **`536880f4:4328` (63 calls)**.

## The result

Byte-for-byte identical, both sides, real Kahlua and fengari, for the
same real, unmodified `KnoxUI.lua` and the same fixture. This is the
concrete proof — not an aspiration — that the browser Lua VM choice from
step 0a holds up for `KnoxUI.lua`'s own widget-kit code specifically, the
same way step 0a already proved it for the mystery engine modules.

## What this does not cover

- Only one fixture (the step 1 FILES fixture) was diffed this way. The
  launcher grid fixture (step 1's second real-game comparison) was checked
  visually, not by this digest method — a natural next fixture for the
  same technique.
- This diffs `KnoxUI.lua` in isolation. It does not diff `KnoxApps.lua`'s
  programs (step 2's own finding: they target the legacy engine, not the
  Vocabulary mysteries) or the mystery engine's own Ledger/Interpreter
  output against a real in-game run of a Vocabulary-shaped mystery,
  because — as step 2 also found — no such real in-game run exists yet:
  `MysteryRuntime.lua` tracks ledger state but renders nothing through
  Knox.OS. That remains real, separate future work.
- A genuine draw-call trace captured from an actual native autotest run
  (§2.2's original design) is still not built. This digest check proves
  the same thing a trace-replay would for the fixtures it covers, but
  doesn't replace building that capture mechanism for arbitrary, not-yet-
  known screens.
