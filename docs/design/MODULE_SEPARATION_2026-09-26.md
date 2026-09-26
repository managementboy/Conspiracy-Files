# Splitting the mod into three reusable modules

Owner, 2026-09-26: *"I want to modularize our mod so we can use those
modules in separate mod projects."* Three modules named directly:

- **A — Main interaction module.** The mod's actual hooks into the base
  game: equip/hand mechanics, event hooks, base-game integration glue.
- **B — Conspiracy engine.** Tracks the player and generates content: case/
  mystery generation, the Mystery vocabulary engine, identity/discovery
  tracking.
- **C — PDA.** The in-game device UI itself: the fake Palm-OS organiser
  screen and its widget kit.

No backward save compatibility is required — a clean break, not a
migration. This is the plan. Nothing in it is built yet.

Produced via `/adhd`, six isolated frames (regulator, attacker, remove-
the-load-bearing-assumption, speedrunner, biology, 3am-on-call), grounded
first in a real audit of this codebase's actual `require()` graph and
global-table coupling (not a hypothetical one). The single strongest
signal: **all six frames, independently, flagged the same root cause** —
the shared `ConspiracyFiles.*` global table, not `require()`, is where
real cross-module coupling actually lives.

## 1. What the audit found (the actual coupling, not a guess)

Scale: `shared/ConspiracyFiles/` has 96 files (`Generated/`=40,
`Mystery/`=11); `client/ConspiracyFiles/` has 51 files. The PDA candidates
(`KnoxUI.lua`, `KnoxApps.lua`, `OrganiserScreen.lua`, `EvidenceRows.lua`,
`DocumentPane.lua`) live in the same directory as the interaction-module
files — there is no existing folder boundary between A and C today.

**Real `require()` edges that cross the proposed boundary:**
- `A:LocalPersonIntegration.lua` requires `B:SuccessiveCases.lua` directly.
- `B:GeneratedMenu.lua` requires `A:ContextMenu.lua` and `A:ClueActions.lua`
  — meaning B, as it stands, cannot even parse in isolation.
- `C:KnoxUI.lua`, `KnoxApps.lua`, `OrganiserScreen.lua`, `EvidenceRows.lua`
  all require multiple `B:Generated/*` modules directly (fonts, questions,
  place names, evidence kinds) — a dense, structural C→B dependency.

**Coupling invisible to a dependency graph, found only by reading actual
call sites:**
- `A:Organiser.lua` reaches into `C` (`OrganiserScreen`, `KnoxApps`) at
  several call sites purely through the shared global table, no `require`
  at all.
- `A:ClueActions.lua` reaches into `B` (`GeneratedRuntime`,
  `MapMediaRuntime`) the same way.
- `CaseFile.lua` (not cleanly in any of the three groups today) touches
  both `B` and `C` via globals.
- `SaveBudget.lua` is a single file centralizing ModData persistence tag
  strings spanning **all three** modules — the de facto save-schema owner
  none of A/B/C actually control.
- PZ `Events.Add` hooks are registered independently across files in all
  three groups with no shared dispatcher — ordering and coupling between
  A/B/C event handlers is implicit in the game engine's own event system,
  not visible anywhere in this codebase.

**Files that don't cleanly belong to one module today:** `Organiser.lua`,
`ClueActions.lua`, `CaseFile.lua`, `GeneratedMenu.lua`, `SaveBudget.lua`.

## 2. The converged architecture

### 2.1 Three namespaces, umbrella table deleted — not kept as a shim

Every frame that looked for a failure mode found the same one from a
different angle: a same-named "compatibility shim" table left behind
after the split lets a mod that only imports module A silently write into
leftover B/C keys instead of erroring on a missing dependency. The fix
removes the temptation rather than managing it: `ConspiracyFiles` as a
single shared global stops existing. Each module gets its own namespace —
`CFInteract` (A), `CFEngine` (B), `CFPDA` (C) — and files within one
module may still share tables freely among themselves; that was never the
problem. This mirrors a pattern already proven inside this very codebase:
`MysteryRuntime.lua` (built earlier this session) already keeps its own
isolated ModData root separate from the legacy engine's, specifically so
neither could corrupt the other.

### 2.2 Cross-module contact through exactly one declared surface per module

No consumer reaches past a producer's own small, hand-curated
`.PublicAPI` table. `CFEngine.PublicAPI` is the only thing `A` or `C` may
call into B through; `CFInteract.PublicAPI` and `CFPDA.PublicAPI`
likewise. A `PublicAPI` table is a real, versionable contract a module can
refuse to break silently — the opposite of today's pattern, where
`ClueActions.lua` and `CaseFile.lua` reach directly into B's live runtime
tables and a future field rename in B breaks A only on a rare game-state
path nobody tests.

### 2.3 The PDA becomes a content-agnostic document viewer (dependency inversion)

C's current dense pull from `B:Generated/*` (fonts, questions, place
names, evidence kinds) means "just the UI kit" isn't actually extractable
today — B's content data shapes leak into C as an implicit, unversioned
contract. Inverted: C defines its own generic document schema (`id`,
`title`, `fields = {{label,value},...}`, `body`, `kind`) and never
requires a single `B:Generated/*` module directly. B is responsible for
translating its own generated content into that schema and pushing it
through `CFPDA.PublicAPI.publish(document)`. `OrganiserFont.lua`/
`OrganiserFont24.lua` — currently filed under `Generated/`, i.e. module B
— move into C outright: a font is a PDA rendering concern, not generated
content, and its current location is itself a small instance of the same
mis-filing this whole plan is fixing.

**Fail loud, not blank.** Two frames independently found the same silent-
failure shape: `EvidenceRows.lua`/`OrganiserScreen.lua`'s duck-typed reads
into evidence-kind/place-name tables mean a reused engine module without
the PDA renders blank rows instead of refusing to load. The generic
document schema is validated at the `PublicAPI.publish` boundary — a
malformed document throws there, not three screens later as an empty row.

### 2.4 One event dispatcher per module, not per file

Converged on independently by five of six frames. Today, `ContextMenu`,
`GeneratedMenu`, `MysteryRuntime`, `GeneratedRuntime`, `IdentityObserver`,
`AddressMap`, `CasePerson`, and others each call `Events.*.Add` on their
own, so a downstream mod reusing module A independently could double-
register a hook the base module already owns, or hit an ordering race PZ
never promised to avoid. Each module gets exactly one dispatcher file
(`CFInteract.Events`, `CFEngine.Events`, `CFPDA.Events`) that owns every
real `Events.Add` call for that module and re-emits named, module-owned
events internally. A module that wants to react to another module's
activity subscribes to that module's named event through its `PublicAPI`,
never to the raw PZ event a sibling module also happens to be listening
to.

### 2.5 Persistence: per-module ownership, no reconciliation file

**Correction, 2026-09-26, stage 3**: reading `SaveBudget.lua` in full
before resolving it (13 real requirers found across both A and B, two
inline `require(...).check(...)` call sites) found that "a single file
listing ModData tags for all three modules" is not actually what it is.
Its real function is `B.check`/`B.checkMany`: sum the estimated encoded
byte size of every named root (15 of them, plus a special-cased
per-player `markers` root) and refuse if the combined total exceeds one
shared ceiling (`V.MAX_ENCODED_BYTES`). That is not a tag registry that
decomposes into three per-module registries — it is exactly the "how
much save space is this player using, combined" check this section
already anticipated wanting, just already built, already required by
both A and B, and already working. **Not deleted.** Reclassified
alongside `Log.lua`/`Validator.lua`/`Version.lua` (§2.3's shared
cross-cutting utilities, required by all three modules alike) rather
than forced into a split with no real per-module tag to move.

Each module still owns a small internal tag registry for keys nothing
else needs to sum against the shared budget (mirroring
`MysteryRuntime.lua`'s own already-working pattern: one root key,
`"ConspiracyFiles.Mystery"`, that nothing else touches) — that part of
this section's original design stands. What doesn't stand is treating
`SaveBudget.lua` itself as a straddler with an owner to assign; it has
no write-set to assign, only a read-only aggregate check every module
already calls into voluntarily.

### 2.6 Straddlers: resolved by write-set, never duplicated

The clearest trap this pass found: one frame (remove-the-load-bearing-
assumption) proposed letting `CaseFile.lua` and `GeneratedMenu.lua` fork
into duplicated logic living in two modules, accepting redundancy as the
price of decoupling. A different frame (3am-on-call), working in complete
isolation, independently named the exact failure this produces: a bugfix
landing in one fork silently stops matching the other, and both forks
keep working right up until they don't. Two other frames (regulator,
attacker) converged on the actual fix instead: assign a straddler to
exactly one owner by what it **writes/mutates**, not what it reads — and
if no single owner fits, split it into two owned pieces joined by an
explicit stable reference, never two copies of the same logic.

Applied to each named straddler:

| File | Real ownership (by write-set) | Resolution |
|---|---|---|
| `Organiser.lua` | Owns equip/hand state — genuinely A | Its direct global reaches into `OrganiserScreen`/`KnoxApps` become `CFPDA.PublicAPI.open()`/`.close()` calls. Nothing in A reaches into C's internals again. |
| `ClueActions.lua` | Owns "what does finding this clue do" — genuinely A | Its direct reads of B's `GeneratedRuntime`/`MapMediaRuntime` become `CFEngine.PublicAPI.factsFor(id)` calls. |
| `GeneratedMenu.lua` | Owns menu-item construction — an interaction concern, not content generation | Reassigned to A outright (not B, despite its current filing); its content lookups go through `CFEngine.PublicAPI`. |
| `CaseFile.lua` | **Correction, 2026-09-26, stage 3**: owns the physical carry/pickup object only — genuinely A, not a split. Reading the real file end to end while resolving it found no case-content-assembly logic anywhere in it; the "two owned files" call below was never checked against the actual code. | One file, module A. Its two real cross-module touches (a read-only query into B's `isRecognised`, a read-only query into C's `window.on`) go through `EngineAPI.lua`/`PDAAPI.lua`, same as the other straddlers — not split, since there is no real second half to split off. |
| `SaveBudget.lua` | **Correction, stage 3**: owns nothing real to *assign*, but is not deletable either — see §2.5 | Not a straddler after all. Kept as a shared cross-cutting utility (alongside `Log.lua`/`Validator.lua`/`Version.lua`), required directly by whichever files already need it. |

## 3a. Progress (updated as each step actually lands, not just planned)

2026-09-26. **Step 1 done and verified** (`module-separation/stage-1-events`,
committed): every real `Events.Add`/`.Remove` call in the 21 production
files that register a raw PZ event now goes through one dispatcher per
module (`InteractionEvents.lua`, `EngineEvents.lua`, `PDAEvents.lua`
stub), via `Dispatch.on(name, fn)`/`.off(name, fn)` rather than a flat
line move, because several registrations live inside gated
`start()`/`stop()` functions whose own timing had to be preserved
exactly. Verified with the real boot-check autotest (visible game
window, real GPU, no `--hidden`): 153/153 mod files loaded, 0 errors,
evidence album still opens automatically.

**Step 2's "introduce the namespaces" half is done; "delete
`ConspiracyFiles`" is deliberately not started.** An ADHD re-evaluation
after step 1 (5 frames, ADHD skill) converged on not doing both in one
move — introduce `CFInteract`/`CFEngine`/`CFPDA` *alongside* the
existing global first, verify, and only delete it later, as a
separately-verified step. Executed as: every file with real,
already-established module ownership gets one additive line right
after its existing `ConspiracyFiles.X=Y` export
(`CFInteract=CFInteract or {};CFInteract.X=Y`, or `CFEngine`/`CFPDA`) —
nothing removed, `ConspiracyFiles` keeps working exactly as before.

The real scope turned out much smaller than first assumed: a first
pass counted 105 files "touching `ConspiracyFiles`" and treated that as
the remaining work, but that count was inflated by
`require("ConspiracyFiles/...")` **path strings**, not actual
global-table access. The real number of files with a top-level
`ConspiracyFiles.X=` export, across the *entire* mod, is **46** — not
105 — and all 51 files under `Generated/` and `Mystery/` (module B's
own internals) turned out to already be clean `require()`-only modules
that never touch the shared global at all, needing no edit whatsoever.
Of the real 46 exporters, **33 now have their namespace line**
(11 `CFInteract`, 10 `CFEngine` from step 1's own file set, plus 9 more
`CFEngine`/2 more `CFInteract` classified by reading each file's header
and real require-callers, plus 4 `CFPDA` PDA files). The other 13 are
every one deliberately excluded for a stated reason: 5 self-described
debug/diagnostic-only files no production file requires
(`SessionGuide`, `IdentityProbe`, `GeneratedDiagnostic`,
`MarkerColourTest`\*, `DevEval`; \*already excluded in step 1), 2 more
of the same profile found in this pass (`MapReadObserver.lua`,
`VehicleProbe.lua`), the 3 dispatcher files themselves (accessed by
direct `require()` path, not via the module table), `shared/Log.lua`
and `shared/Version.lua` (genuine cross-cutting utilities required by
all three modules alike — forcing either into one module's namespace
would be a wrong, arbitrary answer), and `shared/Runtime.lua` (a
`Runtime.disabled=true` legacy system, deferred pending a shared/client
load-order check no stage has needed to take on yet).

One new straddler surfaced that the original audit (§1) didn't name:
**`DropToNote.lua`** — evidence-drop counting/wording that
`OrganiserScreen.lua` (module C) calls into, but whose subject matter
(evidence content) is exactly what C is supposed to stay agnostic to
per §2.3. Flagged for step 3 rather than guessed at here.

Verified after each batch with the real boot-check autotest (153/153
files, 0 errors both times) and, once, directly inside the running game
via `pz.sh eval`: `CFInteract`/`CFEngine`/`CFPDA` hold exactly
11/10/4 entries and spot-checked entries are the *same table reference*
as the original `ConspiracyFiles.*` field, not a copy — a real alias,
not a snapshot that could silently drift out of sync.

**Not yet done, and not safe to start until it is**: auditing every
*read* of another module's field off `ConspiracyFiles` (not just the 46
export sites) before attempting the actual deletion. An ADHD
re-evaluation pass flagged this directly — the deletion's real blast
radius is larger than an exports-only or events-only audit would show.
That audit, and the deletion itself, remain future work within step 2.

**Step 3, straddler resolution, is done.** A second ADHD re-evaluation
(5 fresh frames, before this step started) converged on building each
module's `PublicAPI` by relocating real, already-working call sites
rather than designing an interface upfront — "PublicAPI functions are
never authored, only relocated" was the sharpest single phrase, echoed
independently by three of the five frames. Two new files,
`EngineAPI.lua` (`CFEngine.PublicAPI`) and `PDAAPI.lua`
(`CFPDA.PublicAPI`), hold exactly the objects real straddlers already
called through the shared global. A third, `InteractionAPI.lua`
(`CFInteract.PublicAPI`), was added mid-step once a full sweep in the
*reverse* direction (module C reaching into A/B, not just A/B into C)
found 12 more real reaches the first pass had missed. All API tables
use `require()`, never a read off the `CFInteract`/`CFEngine`/`CFPDA`
globals — reading off the global would silently snapshot `nil` if a
consumer happened to load before its dependency, a real bug this step
caught in its own first draft before it shipped.

Of the 6 named straddlers (5 original + `DropToNote.lua`, found in step
2): **5 resolved as plain redirects** to a `PublicAPI` table
(`GeneratedMenu.lua`, `ClueActions.lua`, `Organiser.lua`,
`DropToNote.lua` — which needed no edit itself, since its one real
caller's reach into B was the actual straddle — and `CaseFile.lua`).
**2 of the design's own claims about specific straddlers turned out
wrong once read against the real code**, corrected in §2.5/§2.6 rather
than carried forward: `CaseFile.lua` is not a two-way split (no
case-content-assembly logic exists in the file at all — it is wholly
module A with two read-only cross-module queries), and `SaveBudget.lua`
is not deletable (its real function is a cross-cutting combined
save-size budget check, required directly by 13 files across both A and
B — reclassified as a shared utility alongside `Log.lua`/`Validator.lua`
instead of forced into a split with nothing real to split off).

Verified after every increment with the real boot-check autotest
(153→156 mod files loaded as new API files were added, 0 errors every
time, evidence album still opens automatically) and, twice, with direct
functional checks inside the running game via `pz.sh eval` — not just a
load check: `KnoxApps.files.list()` builds real rows,
`KnoxApps.rememberMe()` runs, `OrganiserScreen.open()` opens the real
screen, and every `PublicAPI` entry checked is confirmed the identical
table reference as the corresponding legacy global field.

Each resolved straddler carries a `-- STRADDLE:` marker comment in the
code itself naming its module and citing the design doc directly — two
independent frames in the second ADHD pass proposed exactly this
(a visible ownership marker in the file, not only in the design doc),
and several markers explicitly flag what still doesn't satisfy step 4's
dependency-inversion goal (module C still knows B's module names, e.g.
`GeneratedRuntime`/`DiscoveryLog`, by name) — honestly named as step 4's
job rather than silently left for later discovery.

## 3. Build order

Sequenced to make the invisible coupling visible early and cheaply, per
the speedrunner frame's converged findings, before any risky logic
changes:

1. **Event dispatcher centralization — pure mechanical move, zero logic
   change.** Every existing `Events.*.Add` call site gets relocated into
   its module's one dispatcher file, calling the exact same handler
   functions. This alone turns an invisible coupling surface into a
   diffable list, at near-zero risk, before step 2 even starts.
2. **Namespace split.** Introduce `CFInteract`/`CFEngine`/`CFPDA` as the
   real globals; delete `ConspiracyFiles` as a shared table once every
   file has been repointed — no transitional shim left standing under any
   name, per §2.1.
3. **Straddler resolution**: `GeneratedMenu.lua`/`ClueActions.lua`/
   `Organiser.lua`/`CaseFile.lua` (redirect global reaches to `PublicAPI`
   calls — `CaseFile.lua` turned out to be one of these, not a two-way
   split; see
   §2.6's correction).
4. **Dependency inversion at the C↔B boundary**: define C's generic
   document schema, write B's adapter that publishes into it via
   `CFEngine`→`CFPDA.PublicAPI.publish`, delete every direct
   `C:require("...Generated/...")`. Move `OrganiserFont*.lua` into C.
5. **The acceptance test, not a folder-structure lint**: a load-time smoke
   test that boots each module with the other two **absent or stubbed**
   and fails the build on any require error or nil-global access — the
   attacker frame's own finding that a lint checking only folder placement
   would pass while B still can't parse standalone.
6. **If one module already has a passing native autotest harness**
   (`tools/autotest/`), extract and verify that one first as the template,
   then repeat the same verification pattern for the other two rather than
   inventing three different verification strategies.

## 4. Explicit non-goals

- No save-compatibility shims of any kind — the owner's own instruction.
- No transitional global-table bridge left standing past step 2 — one
  frame proposed this as a speedrun shortcut, and a different frame's own
  failure-mode analysis is exactly why it doesn't survive past a
  migration window: a same-named shim is indistinguishable from the bug it
  was meant to prevent.
- No duplicated straddler logic — see §2.6's trap.
- No attempt to make C render *this mod's specific* content types by name;
  C's whole point after this split is to know nothing about mysteries,
  cases, or evidence kinds at all.

## 5. Provocation

Every frame agreed the shared global table is the disease. None of them
asked whether three separate PZ mod packages (separate `mod.info`
entries, loaded independently, unable to see each other's Lua globals at
all) would make that disease structurally impossible rather than merely
disciplined against — at the cost of needing PZ's own inter-mod dependency
declarations instead of an in-process `PublicAPI` table. Is "three Lua
namespaces in one mod" actually the target, or is it a stepping stone
toward three separate Workshop items that happen to compose?

**Trigger condition, so this doesn't dangle**: if module A (or B, or C) is
actually reused in a second real project within 6 months of the split
landing, split that module into its own Workshop package then. Not
before — no speculative packaging for a reuse that hasn't happened yet.

## 6. Review pass: maintainability and cross-project reuse

2026-09-26, `/adhd` re-run on this same document, five isolated frames
(regulator, attacker, 3am-on-call, inversion, game design), asked to
stress-test §2 specifically for (a) whether this still holds up to a
maintainer two years and many contributors from now, and (b) whether a
module genuinely lifts into an unrelated project, not just decouples
inside this one. Every frame, independently, converged on the same shape
of gap: **§2 makes today's coupling visible and namable, but names no
mechanism that keeps it that way** — ownership, contracts, and isolation
are all one-time decisions with nothing enforcing them past the day of
the split.

### 6.1 The PublicAPI table is a contract in name only

Four of five frames (regulator, attacker, inversion, game design)
independently flagged the same hole: §2.2 calls `PublicAPI` "a real,
versionable contract" but the plan never actually versions it. Nothing
stops a future signature change to `CFEngine.PublicAPI.factsFor(id)` from
silently breaking A, C, or an unrelated project that adopted module B,
because there is no version field, no deprecation window, and no
distinction between *this cutover's* "no shim" rule (correct — the
internal `ConspiracyFiles` table should die outright) and a *public
surface's* need for a grace period once strangers depend on it. Same gap,
same shape, on the document schema in §2.3: `{id,title,fields,body,kind}`
has no `schema_version`, so a `kind` field is really a closed enum of
this mod's own content types wearing a generic mask — a future project
feeding CFPDA something the current mysteries never needed (a live sensor
feed, a chat log) discovers the genericity was cosmetic, and finds out via
a silently truncated document, not a version mismatch error.

**Fix, added to §2.2/§2.3's own design**: every `PublicAPI` table carries
a `VERSION` field; consumers assert their expected version at load time,
not only at the call boundary. Every `CFPDA.PublicAPI.publish(document)`
call carries a `schema_version`. Breaking a `PublicAPI` signature or the
document schema requires a version bump and a stated deprecation window
for the old shape — this is *not* the same rule as "no transitional
shim for the internal cutover," and the plan should say so explicitly so
the two don't get conflated into either shimming everything or breaking
every downstream consumer without warning.

### 6.2 Write-set ownership decays; nothing re-checks it

Three frames (3am-on-call, inversion, game design) independently named
the same failure: §2.6 resolves today's 5 straddlers by write-set
ownership, but that's a snapshot judgment, not a standing rule. Two years
of "just add this field to whichever file already imports the data I
need" quietly regrows new straddlers with no name and no smoking gun,
since the original 5 are gone and nobody remembers the rule that replaced
them — worse, ownership itself can silently invert (a reader starts
writing) with nothing anywhere that would catch the drift before a save
gets corrupted.

**Fix**: every file that owns a cross-module write-set gets a one-line
header comment naming its owning module and the write-set rule — not just
a line in this design doc, which is the first thing that goes stale.
State a refusal criterion for the *next* straddler that doesn't fit today's
pattern: do not resolve it by duplicating logic or by "whoever's touching
it now decides" — escalate to a schema redesign (extend the
`PublicAPI`/document-schema contract) instead of an ad hoc ownership call.

### 6.3 The isolation smoke test proves decoupling, not reuse

The single highest-novelty finding, converged on independently by
inversion and game design: §3 step 5's load-time smoke test (boot each
module with the other two absent or stubbed) proves the three modules
don't need each other *inside this mod*. It proves nothing about what
happens when a module is actually copied into a different mod project —
hidden dependence on this mod's own load order, file-path assumptions
baked into the existing `mod.info`, or (see 6.4) implicit PZ-global
coupling would all pass this test and still fail on a real lift-and-shift.
It also only tests boot time; a callback registered at boot but invoked
hours into a long session (event ordering, a stale closure over another
module's state) passes a boot-time check and still breaks at 3am.

**Fix, replacing step 5's acceptance criterion**: the real reusability
gate is copying the smallest module (`CFPDA`, once §2.3's inversion is
done) into a *blank* scratch mod folder with its own fresh `mod.info` and
confirming it boots with **zero source edits** — not stubbing the other
two modules in place. Keep the in-mod boot-stub check too, but as a cheap
pre-check, not the acceptance test itself.

### 6.4 The plan decouples the three modules from each other, never from Project Zomboid

The game-design frame's standout finding, not named anywhere in §1-§5:
this entire plan optimizes for A/B/C not depending on *each other*, but
says nothing about B's or C's implicit dependency on PZ's own globals
(`getPlayer()`, `ModData`, `Events`). That's arguably the *actual* blocker
to reuse in an unrelated project — a mod project with a different save
schema, different player-state shape, or a different event set will hit
this before it ever hits an A/B/C seam.

**Fix, added as a `PublicAPI` design rule, not a new build step**: every
`CFEngine.PublicAPI` / `CFInteract.PublicAPI` function should be callable
with the caller passing in `world`/`state`/player references as
arguments, not reaching for PZ globals internally. This doesn't block the
current build order; it's a rule to apply while writing each module's
`PublicAPI` surface in steps 2-4.

### 6.5 Named traps (score low on viability despite superficial appeal)

- **Accepting straddler duplication as "the price of decoupling"** — §2.6
  already names and rejects this; the review reconfirms it independently
  (3am-on-call: "a bugfix landing in one fork silently stops matching the
  other, and both forks keep working right up until they don't").
- **The event dispatcher becoming a new god file.** Two frames
  (attacker, inversion) independently flagged the same risk in the exact
  opposite direction from the coupling this plan fixes: centralizing
  ~10 `Events.Add` call sites into one dispatcher file per module is
  correct, but if that file accumulates business logic ("we're already
  touching `Events.lua`, just handle it here"), it recreates the original
  problem concentrated into 3 files instead of 30. **Rule to add to
  §2.4**: each module's `Events.lua` does registration and re-emission
  only — zero business logic — enforced by review convention, not just
  stated once.
- **The `PublicAPI` table becoming a dumping ground.** Same shape of
  trap, same fix direction (attacker, inversion): a `PublicAPI` that
  starts small and disciplined accretes "just one more passthrough" under
  deadline pressure until it's functionally the old shared
  `ConspiracyFiles` table, renamed. No hard mechanism prevents this, but a
  named single-owner gatekeeper per module's `PublicAPI` (regulator's
  finding, §6.1) plus requiring a one-line justification comment on every
  new `PublicAPI` addition (inversion) both raise the cost of the
  shortcut.
- **Cross-project ModData tag collisions**, flagged by 3am-on-call: §2.5
  solves in-mod tag collisions but sets no cross-project namespacing
  convention, so two unrelated future mods that both reuse module A could
  pick overlapping ModData tags — invisible until both are loaded
  together in someone else's game. Worth a one-line convention (prefix
  every tag with the module's own namespace, e.g. `"CFInteract."`) but not
  worth a build step on its own; folding it into whatever step actually
  writes each module's internal tag registry (§2.5) is enough.

### 6.6 What actually changes in the build order

Nothing in §3's step *order* changes. What changes is what "done" means
for steps 2, 4, and 5:

- Step 2 (namespace split) isn't done until every `PublicAPI` table has a
  `VERSION` field (§6.1).
- Step 4 (dependency inversion) isn't done until the document schema
  carries `schema_version` (§6.1) and `CFPDA`'s incoming calls avoid
  reaching for PZ globals directly (§6.4).
- Step 5's acceptance test is the scratch-mod-folder extraction (§6.3),
  with the in-mod boot-stub check kept as a cheaper pre-check rather than
  the real gate.

## 7. Physical separation on GitHub

2026-09-26, `/adhd` re-run a second time on this document, asking a
narrower question than §6: not "is the code decoupled" but "are these
three modules physically separable *on GitHub*, as things someone could
actually pull into an unrelated project." Five frames (logistics,
speedrunner, hardware engineer, markets, ant colony), all newly picked —
none repeated from §6's five — to force a genuinely different set of
angles onto the same document.

**The single strongest signal, independently reached by six different
angles across all five frames**: the real reuse unit is a **built release
artifact**, not a repo. Whether framed as a logistics hub-and-spoke
parcel, a hardware part with a pinned revision, a market's spot-trade
good, or a speedrunner's release-asset shortcut, every frame converged on
the same shape — a consumer wants a versioned zip of exactly the module it
needs, not a git relationship (clone, submodule, or subtree) to this
repo's mainline.

### 7.1 Ship built artifacts, not source

Each module's release becomes a tagged, immutable zip built the same way
this repo already builds the Knox.OS web PDA's standalone download (§4 of
the earlier Knox.OS plan): `git archive` of the exact tagged commit,
scoped to that module's own directory once §2's namespace split lands,
attached as a GitHub Release asset. A consumer grabs the zip URL for the
one module it wants and vendors it in directly — no clone, no submodule,
no ongoing pull from this repo's mainline. This resolves "how does a
consumer pull in just module A" without touching the one-repo-vs-three-
repos question at all.

**First concrete step**: a `tools/release/package-module.sh <module>`
script wrapping the existing `git archive` pattern, producing one zip per
module per tag, each containing a `manifest.json` naming the module's
`PublicAPI` version (§6.1) and its minimum required version of the other
two modules' `PublicAPI`s.

### 7.2 The artifact is worthless without §6.1's versioning enforced at load time

An immutable zip with no version contract is just a frozen blob nobody can
safely upgrade later — this is §6.1's `PublicAPI.VERSION` field and the
document schema's `schema_version`, but now load-bearing for a real
external consumer, not just an internal discipline note. The one place
this has to be enforced is at load time, not in a comment: a
`CFEngine.PublicAPI.requireVersion(min)` assertion that the one adapter
file A/C already need for cross-module calls (per §2.2) calls before
using the API, refusing to link on mismatch instead of glitching silently.
Each release zip should also carry a tiny bundled conformance-test
snippet, so a consumer can self-check compatibility before wiring the
module in — a cheap version of the "incoming inspection" the hardware
frame named.

### 7.3 Don't decide the repo split now — measure for it

Every frame that reached for "three separate repos" treated it as the
end state to design toward. The ant-colony frame's own logic argues the
opposite, and it directly sharpens §5's existing but vague trigger
condition ("if a module is reused in a second real project within 6
months, split it"): track two passive, already-cheap-to-produce signals
instead of guessing —

1. **Coupling decay per file** — a periodic script measuring cross-module
   `require`/global-reach coupling, the same audit §1 already did once by
   hand, re-run on a cadence (folded into `tools/autotest/`'s existing run
   cycle, not a new bot).
2. **Solo-vs-bundled fetch pattern** — GitHub's own release-asset download
   counts already show whether a module's zip (§7.1) gets pulled alone by
   a second project or only ever alongside the other two.

When a module's coupling reads near zero *and* its zip is being pulled
solo by a real second project, that is the actual, evidence-backed moment
to extract it into its own repo — not a date on a calendar, and not an
automatic trigger. A script that *recommends* a split is useful; a bot
that *fires* one on an unwatched signal or a silent timeout is not — a
repo split (history, issue links, this repo's own Pages config) is hard to
reverse cleanly, so the decision stays a human one even once the evidence
is in.

**First concrete step**: `tools/audit/coupling-report.sh`, run manually
before each release, reusing §1's audit method. Automate the reminder to
run it, never the split itself.

### 7.4 What ships now vs. what waits

- **Now, alongside §3's build order**: 7.1 (release-zip packaging script)
  and 7.2 (`PublicAPI` version assertion at the one adapter file) — both
  are small, additive, and make every later step's output actually
  consumable by an outside project without waiting on a repo decision.
- **Waits on evidence, not a date**: any actual repo split. Stay in one
  repo. GitHub Pages keeps serving C's live build exactly as it does
  today (§4 of the Knox.OS plan) — that deployment is a demo channel, not
  the reuse mechanism a consumer vendors in.

### 7.5 Named traps

- **A fourth "clearing-house" or "freight-forwarder" repo** that holds
  only interface tables or a runtime-assembly script, so a consumer never
  touches this repo directly. Symmetric-looking, and named independently
  by two frames, but it's a new repo and a new indirection layer to
  maintain for a team this small, solving a problem 7.1's plain release
  zip already solves more cheaply.
- **Auto-firing a subtree-split on a silent timeout** ("no veto within N
  scans = split"). Good as a detector, wrong as an actuator — see 7.3.
- **Forward-contract tags for a `PublicAPI` surface that doesn't exist
  yet** (a `v2.0-future` tag pinning tomorrow's interface today). Locks in
  a promise before the implementation exists — the same premature-
  commitment shape §6 already flagged for versioning, relocated to git
  tags instead of code.
