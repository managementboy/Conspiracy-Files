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
shell and E02–E07 world adapters through fakes. The shell cases cover scheduler bounds/deduplication,
per-subsystem error budgets, the early multiplayer decision, deferred lifecycle
initialization, Global ModData-shaped staging/round trips, last-known-good
preservation, save/death checkpoints, interruption before staged commit,
checkpoint replacement faults, exact ordinal preservation across fake reload,
and the actual Build 42 entrypoint's one-namespace/additive-hook
behavior. The world cases cover interrupted/repeated exact-once placement,
P4-R40 fallback selection, T5 availability/conflict semantics, exact item text
projection and bounded/debounced whole-building arrival.
Fake-backed presentation/input cases additionally cover the T7-shaped
item contract, T10-shaped inventory-pane actions, the custom reader input,
known-only notebook projections, one configurable key binding, repeated opens,
common resolution geometry and callback containment. They do not claim live
CF-V01-E06/E08/E14 acceptance; see
`docs/testing/V0_1_PRESENTATION_INPUT_HANDOFF.md`.

The entrypoint smoke uses temporary fake PZ globals and restores them. It is not
live engine evidence and does not pass CF-V01-E09/E10/E11/E12/E13. See
`docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md` for the accepted domain mapping,
`docs/testing/V0_1_PRODUCTION_SHELL_HANDOFF.md` for the shell handoff and
`docs/testing/V0_1_WORLD_ADAPTER_HANDOFF.md` for the precise live matrices.

## Deterministic release regression tests

From a clean checkout, run:

```text
python3 -m unittest discover -s test -p 'test_release_pipeline.py'
```

The tests build the complete release twice and compare every output path/hash,
then compare the GitHub and Workshop archive payloads byte for byte after
removing their required wrapper paths. The normal CI gate calls the stricter
`python3 tools/release_pipeline.py reproducibility-test`, which also runs the
Lua suite, Lua 5.1 syntax checks, metadata validation and forbidden-content scan.
