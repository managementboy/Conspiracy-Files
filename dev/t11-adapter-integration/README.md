# T11 v0.1 adapter-composition probe

Status: DEV-0.6 shared adapter wrapper prepared; not live-proven.

The wrapper requires ConspiracyFiles and reuses its actual Runtime, Session, WorldAccess, ContextMenu and Notebook modules. A shared bootstrap sets T11Mode before OnGameStart. Only D1 is eligible for placement; the full seven-assignment plan remains schema-valid in a separate ConspiracyFiles.T11.Session canonical tag. No probe implementation is copied into production. Never enable the T12 wrapper simultaneously.

## Entry conditions

- Issue #28 has produced an exact target binding or the run is explicitly labeled provisional.
- The installed Build 42 version and revision are recorded at run time.
- A fresh disposable save, ConspiracyFiles and ConspiracyFiles_T11_Probe are the only project test surface; debug mode is required while exact bindings remain provisional.
- Baseline profile/control files are hashed and archived before setup.
- The manual route required by P4-R44 is followed for context-menu interaction.

## Deterministic run matrix

| Phase | Action | Required evidence |
|---|---|---|
| A | Start with no T11 canonical root or stamped item | Build/mod/save identity and zero-count baseline |
| B | Load the exact target and allow queued placement | One detached-prestamped item, count one, canonical `placed` |
| C | Repeat callbacks; stream target out/in | Count remains one; no duplicate domain transition |
| D | Inspect once manually and save immediately | One Inspect intent and one Evidence; one asset-discovered entry plus one thread-introduced entry for fresh D1/D2; valid staged root |
| E | Reload and inspect again | Same item token; no duplicate Evidence/JournalEntry |
| F | Force arrival sample and reconciliation on one scheduled tick | One location confirmation at most; no partial state |
| G | Move item from original container and reload | One observed token becomes available; partial/unloaded absence remains unknown. Placement stays placed and never respawns. |
| H | Copy token onto a second distinct item | Sticky `conflict`; no winner, deletion, restamp or new placement |
| I | Inject boundary faults one at a time | `pcall` containment, last-good root preserved, bounded log/disable behavior |
| J | Final save/reload and accounting | Stable root, token count, callback counts, timing and size evidence |

## Required fault controls

In the ordinary debug console the owner may arm ConspiracyFiles.DebugHarness.fault('after-add') and inspect ConspiracyFiles.DebugHarness.snapshot(). Supported one-shot points: before-intent, after-intent, before-add, after-add, before-placed-commit, before-canonical-swap, inspect-domain, arrival-domain. Arming clears on the first matching boundary; the log records FAULT_ARMED and FAULT. Start a new disposable scenario when the required boundary has already occurred; never clear canonical state to repeat it.

These are explicit in-memory scenario controls, not persistent probe ModData. This revises the scaffold's planned storage mechanism: it avoids stale armed faults surviving a reload and keeps scenario evidence in the run log. A true engine reload remains required to test persistence.

A fault after durable intent but before add leaves a placing/unknown item and intentionally does not retry. This is conservative loss-over-duplication recovery, not a successful placement. A post-add retry reconciles count one. Any missing native callback/persistence-failure injection must be marked not exercised; these controls do not emulate a disk failure.

The harness never teleports, discovers, marks, saves or activates a GUI control. For T11 placement diagnostics inspect the D1 assignment; allPlacementsSettled refers to the full plan and is intentionally false in the one-item wrapper.

## Stop conditions

Stop immediately on a security alert, unexpected non-disposable save/mod state, unsupported build, unexplained duplicate, canonical validation failure outside an intended fault, or evidence that the probe is mutating another mod's state.

## Completion

Populate `docs/research/T11_ADAPTER_INTEGRATION.md` with observed facts and archive the log, setup hashes and run record under `evidence/`. A clean static review does not complete T11.
