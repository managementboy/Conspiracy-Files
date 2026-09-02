# v0.1 Dead Air World Adapters — Offline Handoff

> Integrated into the offline candidate with presentation/input, lifecycle and
> release work. The candidate adds a focused placement-to-Inspect contract test;
> this handoff's live limitations and matrices remain authoritative.
> The branch identity and original token-only wording below are historical;
> P4-R37 and `SCHEMA2_PAIR_IDENTITY_LIVE_MATRIX.md` supersede that wording with
> the active Asset/token-pair invariant for the consolidated candidate.

**Base commit:** `0f90648e77ebfbbade97f23f361d2e7b07472e97`

**Runtime target:** Project Zomboid Build 42.20.x. The accepted mechanism and
binding evidence was observed on 42.20.4 revision `b0bbce05d5`; this
implementation has not been launched in Project Zomboid.

## Delivered production boundary

- `LoadGridsquare` only deduplicates exact D1–D6 and B-37 target wake-ups. `OnGameStart`
  derives one save-scoped token per authored world Asset and queues catch-up work. World
  mutation occurs only in scheduler work units.
- Placement resolves the exact P2/R2 room, object index, sprite, container index
  and container type. Unloaded squares remain pending. Any observable signature
  drift fails closed and creates nothing.
- The T4 sequence is `pending` → durably staged `placing` → detached
  `Base.Note` creation → name/ModData prestamp → add exact instance → exact
  container rescan → durably staged `placed`. One gateway-verified active
  Asset/token pair repairs stale intent; two distinct items with that pair enter
  sticky `conflict`; no automatic deletion or restamp exists.
- Schema-2 placement outcome and physical availability are separate canonical
  maps; derived tokens and bounded adapter observations are not persisted.
  Bounded production
  observation covers the player inventory, accepted placement container,
  nearby floor/corpse squares and the occupied vehicle. Every item and supplied
  observation is reverified by the same runtime identity gateway. One observed
  active pair is `available`; incomplete zero coverage is `unknown`; a supplied conclusive
  loss/complete-coverage result is `unavailable`; duplicates are permanently
  `conflict`. The PZ port itself never upgrades its bounded scan to complete
  world coverage.
- P4-R40 is canonical and idempotent. D2 becomes the fallback only when D2 is
  placed, D1 remains undiscovered and D1 is terminally unavailable before
  placement or conclusively unavailable after placement. Unloading, original
  container absence, `unknown`, `untracked` and `conflict` cannot choose it.
  Discovering D1 fixes the entry opportunity to `anchor`; D1 never respawns.
- Each D1–D6 item uses a persistent custom name and the canonical nested
  `ModData.ConspiracyFiles` schema/Asset/token/title/description/body carrier
  resolved from current static content. Compatible older presentation text is
  refreshed in place without changing item identity. No body uses
  `InventoryItem.description`, runtime print media or native generic readers.
  The T10 custom Inspect reader remains deliberately outside this no-UI change.
- Every 15 ticks, the runtime queues one arrival poll and one round-robin
  identity poll. Arrival evaluates only currently known lead locations, requires
  two samples on the same logical square, validates exact P2/R2 whole-building
  signatures and commits the sticky confirmed ID before its journal event.

The adapters reuse the existing 24-work/1-ms scheduler drain, 256-key queue,
three-consecutive-failure subsystem budgets, staged P4-R32 persistence adapter
and hard 500 KB canonical-state ceiling. Domain modules import no PZ class or
global.

## Offline verification

At this handoff's original world-adapter checkpoint, `lua5.1 test/run.lua`
reported 39 tests and zero failures. That is a historical branch checkpoint;
the exact candidate's `lua5.1 test/run.lua` output and integrated-candidate
handoff are the current combined verification evidence. The fake-backed
world tests cover:

1. exact D1–D6 name/title/description/body projections;
2. D1 interruption after world add and stale-ledger repair;
3. four repeated availability passes with one item per D1–D6;
4. unloaded pending behavior and fail-closed binding drift;
5. terminal and post-placement conclusive D1 loss fallback paths;
6. discovered-anchor and conflict/unknown fallback negatives;
7. container/vehicle/inventory availability, incomplete absence, conclusive
   loss and uncompromised reappearance;
8. derived active-pair schema-2 operation, adversarial carrier rejection and sticky duplicate conflict;
9. delayed lead arming, whole-building multi-floor confirmation and re-entry;
10. wrong-level/unstable-square negatives, reload-inside idempotency and
    arrival-binding drift;
11. integrated additive hooks and bounded scheduler routing;
12. deterministic save-scoped token separation; and
13. the concrete PZ port's object/building signature resolution and drift
    rejection.

`luac5.1 -p` must parse every Lua file and `git diff --check` must remain clean.
These results are offline implementation evidence only.

## Precise remaining live matrices

### CF-V01-E02 / E04 — placement

Run D1 at R2 through T4's clean, before-intent, after-intent, after-stamp,
after-add, after-verify, after-ledger-commit and duplicate-pair paths. For every
valid path, perform a real target stream-out/in and three save/reloads, then
repeat target callbacks. Assert exactly one active D1 pair and `placed`; duplicates
must remain two and canonical `conflict` with no third add. Repeat clean,
interrupted, unavailable and duplicate cases independently for D2–D6 at their
accepted containers. Run the positive and negative carrier cases in
`SCHEMA2_PAIR_IDENTITY_LIVE_MATRIX.md`; rejected carriers must create nothing
and leave the ledger unchanged. Verify fallback state never suppresses D3–D6.

### CF-V01-E03 — fallback

Exercise: D1 success then discovery; D1 target unload; zero only in the original
container; incomplete `unknown`; tokenless carrier rejection; duplicate `conflict`;
terminal pre-placement target destruction that the live adapter can classify
without confusing binding drift; and placed-undiscovered D1 permanent removal
with demonstrably complete covered absence. Reload before and after every
canonical transition. Only the two conclusive loss paths may set `fallback`,
and a discovered D1 must retain `anchor`. A production-observable conclusive
post-placement loss source remains the critical live proof: the bounded PZ scan
intentionally reports incomplete coverage unless a destructive action or test
matrix establishes completeness.

### CF-V01-E05 — identity

Move each production `Base.Note` through player inventory, an ordinary
container, floor, vehicle, inventory again and corpse where the live lifecycle
allows. Save/reload at every stage and inspect both fields of the active pair and canonical
availability/location. Permanently remove one item and establish conclusive
absence without a global unbounded scan. Inject `copyModData` and `CopyModData`
duplicates, reload, remove one descendant and prove conflict remains sticky.
Run tokenless, Asset-only, token-only, cross-pair and supplied-observation
bypass attempts and require rejection with no availability, discovery or journal
transition. Corpse reload remains unclaimed until this matrix completes.

### CF-V01-E06 — storage half only

For D1–D6, verify the production `Base.Note` type, custom name and every ModData
field before save and after two reloads; compare title/description/body byte for
byte with `dead-air-r1`. Require the active pair before any reader contract is
eligible and run the shared negative matrix. Confirm normal inventory/container transfer still
works and no `InventoryItem.description`, print-media or custom-pages dependency
exists. Full E06 acceptance additionally requires the separately scoped T10
Inspect UI to render all six bodies; this branch does not claim that half.

### CF-V01-E07 — arrival

At both accepted buildings, test outside-adjacent and unrelated-building
negatives, entry through multiple rooms, every valid floor (including R2 z=3),
z outside the accepted range, leave/re-entry, repeated samples, delayed lead
arming while already inside and reload while inside before and after
confirmation. Record the 15-tick cadence, two identical logical-square samples,
one persisted ID, one journal event and no duplicate. Mutate each fakeable
reference/bounds/room-count signature separately and require fail-closed
behavior with no confirmation.

### Shared E09/E12/E13 reruns

Because E02–E07 add ModData commits, event hooks and scheduled work, rerun the
production-shell save/reload, per-frame profiler and deterministic fault matrix.
Profile the six initial placement units separately from normal play; during
normal play assert each work unit and total Conspiracy-Files frame work remain
within 2 ms. Fault every world/item method and `ModData.add`; require last-known-
good state, one concise report, three-failure subsystem disablement and
continued unrelated subsystem operation.

## Explicit exclusions

No Project Zomboid launch or live acceptance is claimed. This work adds no UI,
Inspect/context-menu action, graph, AI, content pack, retrofit, migration,
multiplayer support, full-map scan, vanilla Lua replacement or Java/ZombieBuddy
dependency.
