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

`SaveBudget.lua` is deleted as a single cross-cutting file. Each module
owns a small internal tag registry for **only its own** ModData keys
(mirroring `MysteryRuntime.lua`'s own already-working pattern: one root
key, `"ConspiracyFiles.Mystery"`, that nothing else touches). If a
combined "how much save space is this player using" report across all
three modules is still wanted when they're all installed together, that
becomes a fourth, tiny, non-owning file that only calls each module's own
`PublicAPI.reportSaveUsage()` — it aggregates, it never owns a tag.

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
| `CaseFile.lua` | Splits: the physical carry/pickup object is A; the case-content assembly it displays is B | Two owned files, one per module, joined by a stable case ID — not two copies of the same logic, two genuinely different responsibilities that were welded together. |
| `SaveBudget.lua` | Owns nothing real — see §2.5 | Deleted. Replaced by three per-module internal registries and, optionally, one non-owning aggregator. |

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
3. **Straddler resolution**, smallest first: `SaveBudget.lua` (pure
   deletion) → `GeneratedMenu.lua`/`ClueActions.lua`/`Organiser.lua`
   (redirect global reaches to `PublicAPI` calls) → `CaseFile.lua` (the
   one genuine two-way split).
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
