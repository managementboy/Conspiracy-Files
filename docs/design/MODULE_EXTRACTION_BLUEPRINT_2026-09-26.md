# Blueprint: extracting a subset of A/B/C into a new mod

Owner, 2026-09-26: *"define how we can create a new mod based on the two
modules core and mystery engine but without PDA (I am thinking of
changing the game mechanics on the front-end). I need a blueprint we can
use in the future."*

This is not a one-off recipe for "drop C, keep A+B." It is the general
pattern for extracting any subset of the three modules
(docs/design/MODULE_SEPARATION_2026-09-26.md) into a new mod, worked out
against the real, current case because a real case is what surfaced the
actual blocker — grounded in the live codebase, not guessed at.

Produced via `/adhd`, five isolated frames (regulator, attacker, game
design, markets, hardware engineer), then checked against the real repo
before writing anything down: every frame independently converged on the
same root fix, and the follow-up grep confirmed exactly what needs it.

**2026-09-26, second pass**: the moment this blueprint moved from "design
the pattern" to "actually publish a second Workshop item," a second
`/adhd` round (5 fresh frames — logistics, regulator, speedrunner,
3am-on-call, ant colony) surfaced a prerequisite this document's first
version didn't cover at all, because the first pass was scoped to the
internal A→C call sites, not to what happens once a *second, independent*
mod exists on the Steam Workshop alongside the original. Recorded as
section 0 below — read it before section 1; it changes what "extract" has
to mean.

## 0. Prerequisite: two mods, one shared Lua environment

The sharpest finding, from the 3am-on-call frame, checked against the
real repo before writing it down here: **Project Zomboid runs one shared
global Lua environment across every enabled mod in a session.** If both
the original mod and a new "Conspiracy Files: No Help" mod define the
same global table names (`ConspiracyFiles`, `CFInteract`, `CFEngine`)
with files of the same names, a player who subscribes to both gets
**last-loader-wins silent replacement, not a merge, and no error at
all** — whichever mod's `Organiser.lua` happens to load second simply
overwrites the first's entry in the shared table. This is not a
hypothetical: it is how PZ's own mod-loading mechanism works, and it is
a near-certainty for two mods this closely related, since the pairing
("install the spin-off alongside the original to compare them") is the
*expected first thing a curious subscriber does*, not an edge case.

Two more real collision surfaces, checked directly against this repo,
not assumed:

- **`mod.info`'s `id=` field, not the Workshop title, is the identity PZ
  actually uses.** Confirmed in `mod/42/mod.info`: `id=ConspiracyFiles`.
  A mechanical copy-and-repackage of the extraction that doesn't change
  this field ships a second mod PZ's own mod manager and any save's own
  mod-id list can treat as *the same mod* as the original — regardless
  of what the two mods are named on the Workshop.
- **ModData tag strings are global too, keyed by name, not by mod
  folder.** Grepped directly across every real module A/B file: **19
  distinct tags**, every one under the same `"ConspiracyFiles."` prefix
  (`ConspiracyFiles.Generated.G2`, `ConspiracyFiles.DiscoveryLedger`,
  `ConspiracyFiles.LocalPeople`, `ConspiracyFiles.MapMedia`,
  `ConspiracyFiles.Mystery`, and 14 more). Two mods writing through the
  same tag string into the same save's ModData corrupt or silently
  merge each other's state — a `PlaceVisits` count from one mod's case
  engine landing in the other's, with nothing anywhere raising an error.
  This is a **save-file-level** collision, one layer below the Lua
  boot-time collision above, and neither `module_boundary.sh` nor the
  `module_extraction.sh` design in section 4 checks for it — both only
  ever ran against one mod's own tree at a time.

**What this means for extraction, concretely**: renaming the global
tables (to e.g. `NHInteract`/`NHEngine`) and re-prefixing every one of
the 19 ModData tags (to e.g. `"ConspiracyFilesNoHelp."`) is not cleanup
— it is the actual first step of the extraction, done *before* anything
is archived out, not after. Speedrunner's own framing: *"sequencing the
rename before the archive step instead of after turns 'extract then fix
names' into 'fix names then extract,' eliminating an entire
post-processing pass."*

**A permanent test this repo doesn't have yet, named independently by
both 3am-on-call and regulator**: `module_boundary.sh` and
`module_extraction.sh` both answer "does A/B survive *without* C."
Neither answers the actually-dangerous question — "does A/B survive
*alongside a live, separately-installed* C, or alongside a live,
separately-installed copy of itself." That needs its own check: install
both mods (or the original plus the extracted one) into one scratch PZ
profile and boot them together, reading any error as the real collision
list — the same "delete it and read the failure" trust this blueprint
already places in `module_extraction.sh`, applied to the opposite
direction (add a second copy, not remove one). Section 4 below now
specifies this as `module_coinstall.sh`, and it needs to run on every
release, not once — regulator's finding that Steam Workshop load order
between installed mods is not fixed and can reorder itself across
sessions, so a co-install pairing that passed once is not guaranteed to
keep passing.

## 1. The real blocker, verified just now

`module_boundary.sh` (docs/design/MODULE_SEPARATION_2026-09-26.md
section 3 step 5) proves module A/B never reach module C except through
`PDAAPI.lua`. It does **not** prove A/B can run *without* C — and they
currently can't, cleanly. Grepped directly, not inferred:

| File | Module | Reaches | For |
|---|---|---|---|
| `Organiser.lua` | A | `PDAAPI.OrganiserScreen` | open/close the PDA screen when the item is equipped |
| `Organiser.lua` | A | `PDAAPI.KnoxApps` | `rememberMe()` on boot |
| `CaseFile.lua` | A | `PDAAPI.OrganiserScreen` | skip filing evidence into the case file while the PDA screen is open |
| `DiscoveryLog.lua` | B | `PDAAPI.OrganiserScreen` | invalidate the PDA's cached row list after a new discovery |
| `MapMediaRuntime.lua` | B | `PDAAPI.OrganiserScreen` | same cache invalidation, map-media side |

Five call sites, four files, both A and B. Drop module C's files entirely
and every one of these throws or silently misbehaves today. This is the
real thing a blueprint has to solve — not a hypothetical.

Checked and ruled out as *not* real risks in this repo today (the
attacker frame raised all of these; each is a real class of bug in
general, none currently applies here):

- **`mod.info` dependencies** — no `requiredMods`/workshop dependency
  entries at all. Nothing to audit for pinning C.
- **Sandbox options** — no `ModOptions`/`sandboxvars` files exist, no
  `getSandboxOptions()` calls in any A/B file. No hidden option
  registered only by C.
- **Translation strings** — no `Translate/*.txt` files exist. A/B emit
  plain Lua strings directly; nothing to go dark if C disappears.
- **Shared root table bootstrap** — `ConspiracyFiles = ConspiracyFiles
  or {}` (and the `CFInteract`/`CFEngine`/`CFPDA` equivalents) is
  repeated independently at the top of every file that needs it, never
  bootstrapped once by C's own init code. No load-order trap here.

One real, module-crossing **asset** dependency, distinct from the Lua
call sites above: `mod/common/media/scripts/conspiracyfiles_organiser.txt`
defines the physical item `Organiser.lua` (module A) manages — it is
A's asset, filed under a name that reads as C's. A new mod that keeps A
but builds different front-end mechanics almost certainly wants a
*different* physical item/mechanic anyway (the owner's own framing:
"changing the game mechanics on the front-end") — but if it doesn't,
this script travels with A, not with whatever is dropped.

## 2. The converged fix: A/B stop calling in, they emit instead

Every frame reached the same place from a different angle. Sharpest
phrasing (game design): *"A and B should not call INTO a front-end API
at all — replace the direct PDAAPI.OrganiserScreen calls with A/B
emitting domain events... a missing front-end just means zero
listeners, no null-checks needed."* Markets named the same shape as a
market that "always clears at zero real buyers instead of erroring on
an empty one." Hardware named it as a bus: *"fire events onto an
unterminated bus... with no listener attached the signal simply
dissipates, which is the bus's normal, specified behavior, not an error
state."*

This is buildable today with **no new infrastructure**: stage 1 already
gave every module its own event dispatcher
(`InteractionEvents.lua`/`EngineEvents.lua`/`PDAEvents.lua`,
`Dispatch.on(name, fn)`/`.off(name, fn)`). Those dispatchers currently
only wrap raw PZ engine events. Extend the same files with a second,
parallel table for **module-owned semantic events** — `Dispatch.emit(name,
...)` alongside the existing `Dispatch.on`/`.off` — and have the five
call sites above emit through it instead of reaching into `PDAAPI`
directly:

```lua
-- Organiser.lua, instead of PDAAPI.OrganiserScreen.open()/close():
require("ConspiracyFiles/Events/InteractionEvents").emit("organiser.equipped", item)
require("ConspiracyFiles/Events/InteractionEvents").emit("organiser.unequipped")

-- CaseFile.lua, instead of checking PDAAPI.OrganiserScreen.window.on:
-- see section 3 - this one isn't just a call-direction problem.

-- DiscoveryLog.lua / MapMediaRuntime.lua, instead of
-- PDAAPI.OrganiserScreen.window.cachedList=nil:
require("ConspiracyFiles/Events/EngineEvents").emit("discovery.changed")
```

`PDAAPI.lua`'s own construction (or a new small listener file inside
module C) subscribes to these named events the same way any external
consumer would — `InteractionEvents.on("organiser.equipped", function(item)
Screen.open() end)`. When module C is absent, nothing subscribes, the
`emit()` call has zero listeners, and that is the *bus's normal,
specified behavior* — not a null-check anyone has to remember to write.

**A/B's own dispatcher files (not the game-facing `InteractionEvents.lua`/
`EngineEvents.lua` — a co-located sibling, e.g. `InteractionSignals.lua`)
own the semantic event names.** Keep them separate from the raw-PZ-event
dispatchers stage 1 built: those wrap `Events.OnTick.Add`-shaped things
PZ itself defines; these wrap `organiser.equipped`-shaped things this
mod's own modules define. Conflating the two would recreate exactly the
"the dispatcher becomes a new god file" trap the earlier maintainability
review (section 6.5) already named and warned against.

## 3. Fix the semantic leak, not just the call direction

`CaseFile.lua` doesn't actually care whether a PDA screen is open — it
cares whether *the survivor is currently occupied reading something*
(game design: *"the open/closed check is UI state leaking into game
logic, which is exactly what makes every future front-end swap hard"*).
That's a fact module A already has every ingredient to own itself
(`Organiser.held()`, the equip state `Organiser.lua` already tracks) —
today it's phrased as "ask C whether its window is on" only because C
happened to be the only thing anyone built.

Fix: `InteractionAPI.lua` gains a real, A-owned query —
`InteractionAPI.PublicAPI.occupied()` — backed by `Organiser.lua`'s own
equip/hand state, not by asking C anything. `CaseFile.lua` calls that
instead of reaching toward the PDA at all. This is the one call site of
the five that isn't solved by "emit an event" — it's solved by moving
the actual fact to the module that should have owned it from the start.
A future front-end (or no front-end) never enters into it.

## 4. The mechanical extraction test

Regulator and hardware both converged on the same instrument, from
different metaphors (a generated allowlist; a documented pinout with
explicit no-connect pins). Build it once, reuse it for every future
subset extraction:

**`tools/autotest/checks/module_extraction.sh <module letter>`** —
on a scratch branch, physically remove every file belonging to the named
module (the same `A_FILES`/`B_FILES`/`C_FILES` lists `module_boundary.sh`
already maintains as the source of truth), then run `luac -p` across the
remaining tree and the real boot-check autotest. Every resulting error —
a missing `require`, a nil field access — **is** the authoritative
dependency manifest for that module, generated from what actually
breaks, not from what a human remembers to grep for. Discard the scratch
branch afterward; this is a diagnostic, not a release artifact.

This directly answers game design's *"turn module_boundary.sh into the
extraction tool itself... treat every resulting check failure as the
authoritative manifest of what A/B silently assumed C provided"* — and
gives the next "reuse a different subset" request a mechanical first
step instead of a human re-deriving the dependency surface by hand, the
way this document's own section 1 had to.

**`tools/autotest/checks/module_coinstall.sh`** — the companion check
section 0 requires, answering the opposite question: not "does A/B
survive without C" but "does A/B survive *alongside a live, separately
installed* copy of C, or of itself." Installs both the original mod and
the extracted mod into one scratch PZ mods folder, boots the real game
once with both enabled, and reads any error — a Lua load-order collision,
a ModData validation failure from two mods writing the same tag — as the
real collision list, the same "trust the failure, not a manual guess"
discipline `module_extraction.sh` already uses. Run this **on every
release** of the extracted mod, not once at launch: Steam Workshop load
order between installed mods is not fixed and can reorder itself across
sessions (regulator's finding), so a co-install pairing that passed once
is not guaranteed to keep passing.

## 5. Named traps

- **Cloning `PDAAPI`'s shape onto the new front-end.** Attacker's own
  find: *"a rushed contributor's fastest path is literally cloning
  PDAAPI's method signatures onto a new class... same names, same
  illusion of a real seam."* A new front-end's own API file
  (`<NewFrontEnd>API.lua`, built the same way `PDAAPI.lua` was — see
  MODULE_SEPARATION §3 step 3's "relocate, don't redesign") should be
  named and shaped around what the *new* front-end actually needs, not a
  find-and-replace of `OrganiserScreen` → `NewScreen`. If the new
  mechanic doesn't need an "is the survivor occupied" concept, it
  shouldn't get one just because the PDA had it.
- **"Insolvency" caching.** Markets' idea of marking a front-end
  permanently absent after one failed call, to avoid re-probing every
  time, is real savings — but applied to the wrong signal it masks a
  genuinely transient state (a screen not yet finished loading this
  tick) as a permanent absence. Fine to apply to "is any front-end
  installed at all" (checked once, at boot); wrong to apply to
  per-call state like "is the screen currently open" (checked live,
  every time, same as today).
- **A mock front-end as proof of decoupling.** Game design again:
  *"a stub that returns nil satisfies the boundary checker without
  proving the game loop is actually front-end-agnostic."* The real
  acceptance test for the new mod is the new mod itself, played, not a
  stub `PDAAPI.lua` that returns empty tables. Ship the new front-end
  end to end before calling the extraction validated — matching the
  same discipline `docs/design/MODULE_SEPARATION_2026-09-26.md` section
  3a already applied to its own baseline verification (a real captured
  save, not an assumption).

## 6. Build order for this specific extraction (A + B, no C)

Reordered from the first version of this document: renaming (steps 1-2
below) now comes **before** the emit-based decoupling work, per section
0's own finding that sequencing the rename before extraction eliminates
a whole post-processing pass, and because the rename is the one step
that's actually load-bearing for public safety — shipping the emit-based
decoupling without it still produces a mod that corrupts a co-installed
player's save.

1. **Rename the collision surface, on the scratch branch, first**:
   `ConspiracyFiles`/`CFInteract`/`CFEngine` → new names (e.g.
   `NHInteract`/`NHEngine`, dropping the shared `ConspiracyFiles` global
   entirely for the new mod rather than reusing the name under a
   different module split); all 19 real ModData tags (section 0) get a
   distinct prefix (e.g. `NoHelp.` in place of `ConspiracyFiles.`); the
   new `mod.info`'s `id=` field is a genuinely new value, never a copy
   of `id=ConspiracyFiles`.
2. Run `module_coinstall.sh` (section 4) against the renamed tree and
   the *unrenamed* original, in one scratch PZ profile. It should come
   back clean. If it doesn't, that failure is real new information about
   a collision the rename missed — not a bug in the tool.
3. Add `emit()`/semantic listener support to `InteractionEvents.lua`/
   `EngineEvents.lua` (or sibling `*Signals.lua` files — see section 2's
   own caution against conflating the two).
4. Redirect the 5 real call sites (section 1's table): `Organiser.lua`'s
   two PDA-open/close reaches become emits; `DiscoveryLog.lua`'s and
   `MapMediaRuntime.lua`'s cache-invalidation reaches become emits;
   `CaseFile.lua`'s occupancy check moves into `InteractionAPI.PublicAPI.
   occupied()`, owned by A.
5. In the *original* mod, add a small listener file inside module C that
   subscribes to `organiser.equipped`/`discovery.changed` and calls the
   real `OrganiserScreen`/cache-invalidation logic — preserving today's
   exact behavior, verified with the real boot-check autotest the same
   way every stage of the original split was.
6. Run `module_extraction.sh C` (section 4) on a scratch branch. It
   should come back clean — no errors, because step 4-5 already
   resolved every real reach. If it doesn't, that failure is real new
   information, not a bug in the tool.
7. Build the new mod's own repo/package (see
   `docs/design/MODULE_SEPARATION_2026-09-26.md` section 7 for the
   release-artifact mechanics already designed for exactly this: ship
   A+B as a versioned zip via `git archive`, not a live git dependency).
   Vendor `InteractionAPI.lua`/`EngineAPI.lua` in as the real, versioned
   contract surface — under their renamed identity from step 1.
8. Build the new front-end for real, end to end, subscribing to the same
   `organiser.equipped`/`discovery.changed` events the original PDA
   listener does. This is the acceptance test (section 5's trap) — not
   a stub.
9. Before publishing to the Steam Workshop: run `module_coinstall.sh`
   again against the two mods' actual packaged Workshop uploads, not
   just the source trees, and repeat it on every subsequent release of
   either mod (section 0's finding that Workshop load order is not fixed
   across sessions — a pairing that passed once is not a permanent
   guarantee).

## 7. The reusable part, for whichever subset is asked for next

Steps 1, 2, 4 and the underlying `module_extraction.sh` tool are subset-
agnostic: any future "reuse X, drop Y" request re-runs the same
extraction check against a different module letter, gets a fresh,
mechanically-generated manifest of real reaches, and fixes each one by
the same two moves — turn a call into an emit where the target module
would only ever *react*, or relocate an owned fact to whichever module
should have had it in the first place. Nothing about this pattern is
specific to the PDA; it's specific to "a call crosses a boundary that
might not exist on the other side."
