# Tests

The domain core must be testable without launching Project Zomboid.

## Rule
All Project Zomboid classes/events stay behind integration adapters. Domain model, relationships, evidence rules, journal rules, validation and pure content logic run under plain Lua 5.1 tests.

## Planned layers
- **Unit tests:** plain Lua 5.1, run in CI once implementation exists.
- **Content fixtures:** hand-authored narrative examples under `test/fixtures/`; `THREAD-001-DEAD-AIR.md` is the first schema-pressure fixture.
- **In-game spikes/integration checks:** PZ-specific behaviour under `dev/`, recorded in `docs/research/`.

A code change that can only be verified by launching the game should be isolated to the integration adapter wherever possible.

## v0.1 domain-core and production-shell command

From the repository root, with PUC Lua 5.1 (or a Lua 5.1-compatible interpreter) on `PATH`:

```text
lua5.1 test/run.lua
```

The runner has no third-party test dependency. It covers every criterion
classified `plain-Lua automated test` in
`docs/requirements/V0_1_ACCEPTANCE_CRITERIA.md`, then exercises the production
shell through fakes. A criterion may own multiple named regression tests; the
runner requires at least one and does not cap coverage. The shell cases cover scheduler bounds/deduplication,
per-subsystem error budgets, the early multiplayer decision, deferred lifecycle
initialization, Global ModData-shaped staging/round trips, last-known-good
preservation, and the actual Build 42 entrypoint's one-namespace/additive-hook
behavior. Integrity regressions also exercise exact per-kind journal replay,
swapped/impossible histories, all seven authored active pairs, one-sided and
cross-paired carrier rejection, supplied-observation revalidation,
activation-time mutation and fail-closed CI range selection.

The entrypoint smoke uses temporary fake PZ globals and restores them. It is not
live engine evidence and does not pass CF-V01-E09/E11/E12/E13. See
`docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md` for the accepted domain mapping
and `docs/testing/V0_1_PRODUCTION_SHELL_HANDOFF.md` for the shell handoff.
