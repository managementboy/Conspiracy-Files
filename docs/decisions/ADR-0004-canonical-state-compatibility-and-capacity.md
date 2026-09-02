# ADR-0004 — Canonical-state compatibility and capacity failure

**Status:** Accepted — 2026-09-01

## Context

The first domain root required an exact match between persisted `contentRevision` and the installed Dead Air revision. That made a typo-only content update unloadable despite P4-R10. Its encoded-size preflight also charged every source string byte four times against the measured 500 KB Global ModData budget, had no persisted-field caps, and left capacity failure behavior to callers.

## Decision

Canonical roots use three independent compatibility axes:

- `schemaVersion` is structural and gates domain load. The placement/availability correction introduces schema version `2`.
- `contentRevision` is a bounded informational record. A different non-empty revision does not reject an otherwise compatible root.
- `pzMinorLine` records the target minor line used when the root was created. Runtime support is checked by the PZ bootstrap/adapter, not by exact patch matching in the domain validator.

An unsupported schema or otherwise invalid persisted root is never replaced with a fresh root. The persistence adapter preserves it byte-for-byte, reports one concise diagnostic, and the integration runtime enters `disabled-incompatible-state`. Recovery or a future migration is an explicit owner action.

P4-R17 means a 500 KB encoded-state ceiling, not a four-times-smaller source-text ceiling. The estimator charges UTF-8/source bytes once plus deterministic serializer type/table allowances. Against T1's 1,000-record payload it estimates 444,196 bytes versus the observed 442,499-byte file delta (0.38% headroom). Live acceptance must also calibrate representative schema-2 roots against actual `global_mod_data.bin` deltas. Persisted adapter/player text is bounded to:

- `contextText`: 4,096 bytes;
- `subjectLabel`: 256 bytes;
- `markIntentId`: 128 bytes.

An over-budget mutation is rejected atomically. The last-known-good root remains canonical, one player-visible/log diagnostic is emitted, and further state-growing canonical transactions are disabled for the session. The investigation must not continue in a silently partial state.

## Consequences

- Typo/text-only revisions can load without migration.
- Structural changes require an explicit schema decision; v0.1 still provides no migration framework.
- Old schema-1 development saves fail closed rather than being guessed forward.
- The field caps are domain rules, not UI-only limits.
- Actual encoded-size comparison remains part of live persistence acceptance.

## References

P2-Q190/Q191, P4-R10, P4-R17, P4-R32, T1, CF-V01-P18/P19.
