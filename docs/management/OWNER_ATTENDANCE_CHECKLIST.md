# Owner attendance checklist

This is the minimum owner/manual-PC work remaining before production assembly. Preparation, code changes, logging and evidence transcription remain delegated.

## Session 1 — bounded owner decisions

- [ ] Read the recommendation in `docs/reviews/DEAD_AIR_CONTENT_REVIEW_2026-09-03.md`.
- [ ] Confirm whether the missed “before midnight” timing in D1/D4 is intentional.
- [ ] Confirm whether “county police” terminology is intentional.
- [ ] Approve `dead-air-r1` or identify exact passages requiring revision.
- [ ] Choose ordinary or `Major` treatment for police-property location confirmation.
- [ ] Choose whether normal players see technical `untracked`/`conflict` wording or only human-readable consequences.
- [ ] Keep or remove the deterministic death recap from v0.1; if kept, authorize a named lifecycle probe.
- [ ] Re-confirm or amend the separate Help window, right-edge sections and overall 2026-09-01 UI direction after cooling off.

Record only the decisions. Repository reconciliation can happen afterward without attendance.

## Session 2 — finish P2/R2 location binding

Follow the checkpoint on `design/dead-air-location-binding-live` at commit `9103ea9`.

- [ ] Verify installed PZ build, profile and disposable-save setup independently.
- [ ] Reveal only the bounded P2/R2 regional map corridor with the documented map surface.
- [ ] Visually confirm that an ordinary road journey exists and record any route caveat.
- [ ] At R2, test the exact arrival predicate plus adjacent, wrong-room and wrong-floor negatives.
- [ ] At P2, test the exact arrival predicate plus adjacent, wrong-room and wrong-floor negatives.
- [ ] Confirm or reject R2 and P2; inspect the headquarters fallback only if P2 fails.
- [ ] Close PZ and allow the delegated restoration/evidence audit to finish.

Do not improvise production bindings during the session. The recorded results drive the patch afterward.

## Session 3 — T12 UI-runtime observation

Use a disposable save beginning `T12_` with only `ConspiracyFiles_T12_Probe` enabled.

- [ ] Open an inventory context menu and choose `T12: Open UI capability probe`.
- [ ] Move and resize the notebook repeatedly, including below and above the compact breakpoint.
- [ ] Select Journal/Evidence, rows, Back, Help, contrast and Close.
- [ ] Verify the long document scrolls without moving the title/actions.
- [ ] Change through the agreed resolution and PZ font-size matrix.
- [ ] Verify Escape closes Back/detail, Help and notebook in the intended order.
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
