# ADR-0005 — Placement and physical-availability state machines

**Status:** Accepted — 2026-09-01

## Context

T4 and T5 require transitional placement outcomes and independently changing physical availability. The accepted domain core represented only `materialised` and treated every committed value as immutable, so production adapters had nowhere valid to persist `placing`, `unavailable`, `unknown`, or sticky identity conflict.

## Decision

`assetMaterialisation[assetId]` records placement protocol/outcome:

```text
absent -> pending | placing | placed | unavailable | conflict
pending -> placing | placed | unavailable | conflict
placing -> placed | unavailable | conflict
placed -> conflict
unavailable -> terminal
conflict -> terminal
```

Direct reconciliation to `placed` is legal when an already-stamped single item is observed after stale/missing intent. `unavailable` is terminal pre-placement target loss. `conflict` is sticky. The obsolete values `materialised` and `lost` are not valid schema-2 placement states.

`physicalAvailability[assetId]` exists only after placement is `placed` or `conflict`:

```text
untracked | unknown | available | unavailable | conflict
```

All non-conflict availability values may move among one another as reconciliation coverage changes. In particular, `unavailable -> available` is legal only when the same uncompromised token is observed exactly once. `conflict` is sticky and cannot be cleared automatically.

The monotonic invariant is restated: immutable Evidence and journal facts only append; entry selection never changes; placement follows the forward transition graph; physical availability may refine according to observation, while identity conflict never regresses.

`entryOpportunityUsed` may be committed by placement before discovery, but the first D1/D2 discovery must agree. If no placement decision exists, that discovery atomically commits `anchor` or `fallback`. Schema validation rejects any root whose `thread-introduced` event disagrees with the field.

## Consequences

- T4/T5 adapters can persist every observed state without overloading Evidence.
- Original-container absence alone can move availability to `unknown`; it cannot regress placement or trigger fallback.
- P4-R40 fallback logic can key only on conclusive D1 `unavailable`, never `unknown`, `untracked`, or `conflict`.
- Schema version 2 intentionally rejects the earlier one-value development model.

## References

P4-R36, P4-R37, P4-R40, T4, T5, CF-V01-E02/E03/E04.
