# Spike T11 — v0.1 adapter composition

- **Status:** Prepared — not live-run
- **Project Zomboid build tested:** Not yet tested; final run must verify the installed build independently
- **Platform:** Windows, manual GUI route
- **Probe path/commit:** `dev/t11-adapter-integration/`
- **GitHub issue:** [#29](https://github.com/managementboy/Conspiracy-Files/issues/29)
- **API/event/classes used:** To be recorded from the final probe implementation and installed-build audit

## Takeover scope update — 2026-09-05

The corrected source now has a runnable wrapper requiring the production candidate. It sets T11Mode before OnGameStart, selects a separate canonical tag and permits D1 placement only. All adapter/UI logic comes from mod/. The previous direct-domain harness has been replaced with read-only snapshots and one-shot fault arming. Scope is the two-site Muldraugh candidate; exact bindings remain unaccepted. See the wrapper runbook and correction report.

## Question

Do the separately proven T1, T4, T5, T8 and T10 mechanisms compose safely with the accepted domain core when one real Dead Air item is placed, inspected, discovered, moved, reconciled, saved and reloaded at one final bound location?

## Method

Use one fresh disposable save with ConspiracyFiles plus ConspiracyFiles_T11_Probe enabled, and no T12 wrapper. Use the final bound D1 target unless location validation requires another smallest representative item. Copy no probe code into production. Run the matrix in `dev/t11-adapter-integration/README.md`, archive the save/log/setup state, and report only directly observed behavior.

The minimum matrix is:

1. clean pending placement through detached token stamping, exact-container add, world verification and canonical `placed` commit;
2. repeated target callbacks and true stream-out/in without duplicate materialisation;
3. one manual Inspect activation creating exactly one Evidence, one asset-discovered entry and, for a fresh D1/D2 introduction, one thread-introduced entry; save/reload immediately and require repeat Inspect to append neither entry;
4. a T8 sample on the same tick as placement/identity reconciliation without partial or duplicated domain effects;
5. move the item away from its original container and prove original-container absence does not imply loss;
6. inject a copied-token duplicate and prove sticky `conflict` with no automatic winner or extra placement;
7. inject one failure at each adapter boundary and prove `pcall` containment, preserved last-known-good canonical state and bounded reporting;
8. verify the final canonical state against P4-R32 and the 500 KB ceiling.

## Observed behaviour

Not run.

## Measurements

Record per-frame peak/representative time for queued adapter work, canonical encoded estimate, observed save delta where practical, callback counts, domain-intent counts and item-token counts.

## Limitations

T11 is deliberately one-item composition evidence. It does not accept all six placements, the complete UI, death lifecycle, multiplayer disablement or the full E01–E13 matrix.

## Verdict

Pending live run. Acceptance/promotion of the existing conditional production adapter candidate remains blocked until this report has an evidence-backed verdict. No current E01–E13 result is supplied by the historical scaffold summary.

## Decision links

P4-R17, P4-R19, P4-R20, P4-R32, P4-R36, P4-R37, P4-R38, P4-R39, P4-R45.
