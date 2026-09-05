# Owner attendance checklist

This is the remaining owner/manual-PC work before accepting the conditional production candidate. The [2026-09-05 takeover audit](PM_TAKEOVER_AUDIT_2026-09-05.md) controls the next session: resolve the route/scope conflict first; correct static blockers and version the probe before another game retest. Preparation, code changes, logging and evidence transcription remain unattended work.

## Test-session operating rule

Use Project Zomboid **debug mode** for development validation whenever the
probe supports it. Prefer Lua console commands in the current session for
reloads, setup, teleportation and inspection. Avoid restarting the game or
save unless the relevant code cannot be safely reloaded or the test explicitly
requires a startup/load measurement.

T10-derived actions remain manual under P4-R44: no synthetic input, injected helpers, UI automation or security changes. A console command must not stand in for required manual Inspect/Mark interaction.

## Session 1 — bounded owner decisions

- [x] Owner approved `dead-air-r1` with added context on 2026-09-05; direct source archived in the takeover audit.
- [x] Owner required consistent D1/D4 timing; both bodies now use 23:58 installation and 7C-41.
- [ ] Resolve P2/R2/two-location takeover scope versus the earlier Muldraugh test and motel/D4 placement before another location session.
- County terminology is an optional editorial preference, not a blocker requiring another approval.
- [ ] Choose ordinary or `Major` treatment for police-property location confirmation.
- [ ] Choose whether normal players see technical `untracked`/`conflict` wording or only human-readable consequences.
- [ ] Keep or remove the deterministic death recap from v0.1; if kept, authorize a named lifecycle probe.
- [x] Preserve the recorded separate Help/right-edge direction and owner-requested X/configurable-toggle behavior; Escape belongs to the game. Runtime feasibility is still open.

Record only the decisions. Repository reconciliation can happen afterward without attendance.

## Session 2 — finish P2/R2 location binding

After the scope decision, use the selected route's preserved checkpoint. P2/R2 checkpoint: `design/dead-air-location-binding-live` at `9103ea9`; do not automatically restart that route in disregard of the recorded Muldraugh instructions.

- [ ] Verify installed PZ build, profile and disposable-save setup independently.
- [ ] Reveal only the bounded P2/R2 regional map corridor with the documented map surface.
- [ ] Visually confirm that an ordinary road journey exists and record any route caveat.
- [ ] At R2, test the exact arrival predicate plus adjacent, wrong-room and wrong-floor negatives.
- [ ] At P2, test the exact arrival predicate plus adjacent, wrong-room and wrong-floor negatives.
- [ ] Confirm or reject R2 and P2; inspect the headquarters fallback only if P2 fails.
- [ ] Close PZ and allow the delegated restoration/evidence audit to finish.

Do not improvise production bindings during the session. The recorded results drive the patch afterward.

## Session 3 — T12 UI-runtime observation

Use a fresh disposable save with only `ConspiracyFiles_T12_Probe` enabled. PZ does not expose a reliable in-game save-name field, and the probe accepts any non-empty save when it is the sole enabled mod.

Before attendance: verify exact deployed version/hash, address known scrollbar/contrast failures, and state which checks remain. DEV-0.4 console callbacks and owner reports are archived; DEV-0.5-document-scrollbar has no archived passing result. Do not request repeated whole-matrix runs for an unchanged failure.

- [ ] Open an inventory context menu and choose `T12: Open UI capability probe`.
- [ ] Move and resize the notebook repeatedly, including below and above the compact breakpoint.
- [ ] Select Journal/Evidence, rows, Back, Help, contrast and Close.
- [ ] Verify the long document scrolls without moving the title/actions.
- [ ] Change through the agreed resolution and PZ font-size matrix.
- [ ] Verify native X buttons close Help/notebook and the configurable Toggle Notebook binding opens/closes the notebook; Escape remains reserved for the game options flow.
- [ ] Repeat with a controller if one is available; an unsupported result is valid.
- [ ] State whether the UI feels acceptable, acceptable with listed corrections, or infeasible.

The probe logs mechanics; the owner supplies only visual/usability judgment and manual input.

## Session 4 — T11 composition run

Run only after exact location binding and the final T11 probe implementation are ready.

- [ ] Perform the requested inventory Inspect/Mark actions manually under P4-R44.
- [ ] Perform instructed save, quit, reload, item move and stream-out/in transitions.
- [ ] Confirm visible item counts and normal vanilla menu behavior when prompted.
- [ ] Stop immediately on a security alert or non-disposable-state concern.

The probe owns deterministic fault injection and counting. The owner must not manually manipulate internal ModData or use synthetic-input helpers.

## Later final acceptance

Death/reload, multiplayer disablement, performance and mod-coexistence sessions occur only after Issue #31 produces the complete slice. They are not prerequisites for beginning the focused T11/T12 gates.
