# ADR-0006 — Bounded ZombieBuddy helper for T10/E08 fixtures

**Status:** Owner-authorized engineering contract; offline tests passed; no
ZombieBuddy installation, configuration or live run performed

**Decision date:** 2026-09-04

## Context

P4-R44 originally required manual GUI input for every T10/E08 rerun after the
unexplained historical `runner.exe` alert. That historical decision was sound
for the abandoned injected route and is preserved verbatim in the historical
record. It was overly broad only for the owner-approved, auditable, fixed
Build-42.20.4 disposable-fixture scenario now described below.

## Decision

Supersede only P4-R44's T10/E08 manual-only clause. A separately reviewed
ZombieBuddy-based helper may run only `t10-e08-disposable-fixture-v1` against
the existing disposable `ConspiracyFiles_T10_Probe` fixture on Build 42.20.4.
It is an evidence-gathering aid, not a production dependency or a general UI
agent. The repository currently supplies only its offline validator and profile
contract; it does not install, download, activate or configure ZombieBuddy.
The checked-in source artifact is pinned by profile SHA-256
`2ae0dba1a79c1972d193efad119b05515a3364316b46fcb6ba3f5ede3f082963`; an
operator may activate it only after independent QA and the separately reviewed
live procedure. The adjacent source modules are pinned too: `contract.py`
`940e95a9d5c66aa1cbf0c1e5e0a3a732897e3e1010cea6541e244a86f6600030` and
`helper.py` `b56c8815efba1a303c35ba3a732ab8169ccae3d2468aa982486563607a21600d`.

Admission is fail-closed before every bounded action. The helper must prove its
exact SHA-256/version plus one owned launcher process PID/start/executable
identity, one active/focused/mapped PZ window and display, a new named
disposable save and checksum, and exact production/probe payload checksum.
Any version, checksum, process/window/display/focus/save/payload, freshness,
duplicate, stale, cleanup or provenance defect stops the run without retry.

Only the player-inventory and Ground/loot inventory panes are permitted. The
fixed vocabulary contains context-menu construction, Inspect, Mark Interesting,
reader dismissal and disposable reload; the action ledger is contiguous,
unique and capped at 96. It accepts no coordinates, key presses, selectors,
scripts, text, commands or arbitrary input. Direct-world right-click remains
unsupported. The test still preserves vanilla and foreign handlers and relies
on the production gateway's activation-time pair validation; it neither reads
hidden truth nor changes authoritative state except through the already-tested
normal T10 callbacks.

Each candidate must retain checksummed helper provenance, full runtime identity,
the bounded action ledger, original raw-event SHA-256 and sanitized raw event
evidence. Redact physical tokens, bodies, secrets and hidden-truth fields. A
helper command, its evidence, or an offline contract pass is never live E08
acceptance. Fresh independent offline QA and a separately reviewed live matrix
remain mandatory.

No helper may package under `mod/**`, alter PZ/vanilla files, saves, controls,
security products, power state or system exclusions, inject into the game,
restore the historical route, automate normal gameplay, or expand authority
beyond this exact fixture scenario.

## Consequences

- The historical manual 2026-09-01 T10 result remains valid historical
  mechanism evidence; this ADR does not relabel it as automated evidence.
- P4-R45's inventory-pane-only and cooperative-handler constraints are
  unchanged; no direct-world support is created.
- The reusable live-inspection harness retains its startup-only authority and
  continues to refuse unattended T10/E08 profiles.
- Any actual adapter requires a separate review of its pinned helper bytes,
  capabilities and cleanup implementation before a disposable live run.

## References

P4-R44, P4-R45, PM-GOV-001, `docs/research/T10_COOPERATIVE_INSPECT.md`,
`docs/requirements/V0_1_ACCEPTANCE_CRITERIA.md`,
`dev/t10-zombiebuddy-helper/`.
