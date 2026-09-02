# v0.1 Dead Air Integrated Offline Candidate — Handoff

## Candidate identity

- Integration base: `08a1dda0eb6d57639a8e403538d2c8d44928487e`.
- World adapters: `b066b4b2b3d0df7c953b949d515f7188016da2c0`.
- Presentation/input: `560256e70dbcc95bbba9a8f892c9567637d4a6b9`.
- Deterministic release pipeline: `ff67a56c33ccedc5be7aa18a8a03c0482c999ec8`.
- Death/reload lifecycle: `c9bd38fea38548e21b7a6e9997ee60f3f4e2a697`.
- Candidate branch: the designated schema-2 integration branch.

The candidate was built in a `--no-local --no-hardlinks` clone. Its Git object
store has no alternates and shared-inode comparison found no object shared with
the developer repository. All source repositories remained read-only.

## Semantic overlap resolution

The four handoffs are direct children of the same maintenance base. Their
shared documentation, module aggregator, runtime registration and test runner
were combined rather than selecting one branch's version wholesale.

- The runtime registers `OnInitGlobalModData`, `OnGameStart`,
  `LoadGridsquare`, `OnSave`, `OnPlayerDeath` and `OnTick` exactly once. World
  scheduler work and lifecycle checkpoints therefore coexist.
- `ConspiracyFiles.init` exports every world, presentation and lifecycle module.
- The test runner retains every domain, shell, lifecycle, location-binding,
  world-adapter and presentation/input case.
- Project state, roadmap, acceptance criteria and historical handoffs retain the
  explicit distinction between offline implementation and live Build 42
  acceptance.
- Schema-2 keeps `assetMaterialisation` and `physicalAvailability` as separate
  maps. Save-scoped physical tokens are derived at adapter activation and are
  never persisted as nested materialisation records. The nested
  `ModData.ConspiracyFiles` table is the canonical item presentation/identity
  carrier; legacy flat fields are accepted only as a complete exact mirror and
  are refreshed in lockstep for compatible content-text revisions. Focused
  regressions cover flat-only, nested-only, disagreement, copying, tampering and
  in-place old-item/current-text refresh while preserving the physical token.
- E10 remains a checkpoint-only base-slice boundary: no death record,
  corpse scan or claim about callback ordering/already-dead reload was added.
- The release pipeline packages this same production tree and performs no
  network, push, publish or Workshop action.

## Offline verification

Run from the candidate root:

```text
lua5.1 test/run.lua
find mod -name '*.lua' -print0 | xargs -0 -n1 luac5.1 -p
python3 -m unittest discover -s test -p 'test_release_pipeline.py'
python3 tools/release_pipeline.py reproducibility-test
python3 tools/release_pipeline.py all --output dist
git diff --check
```

The corrected integrated Lua suite reports 69 tests and zero failures. The release unit
tests, clean-tree reproducibility gate, deterministic double build, archive
payload comparison and generated checksum verification must pass at the final
candidate commit before handoff.

## Live/not-live boundary

No Project Zomboid process was launched while producing this candidate. No live
criterion beyond the already accepted CF-V01-E01 location binding is newly
claimed. CF-V01-E02–E14 remain subject to their checked-in live matrices and the
supported Build 42.20.x line, with the exact limitations recorded in the world,
presentation, production-shell and E10 handoffs.

The next live-validation task should use this candidate repository at the exact
integration commit supplied with the external handoff. Start with the combined
E02–E08/E10/E14 matrices, rerun E09/E11/E12/E13 against the integrated runtime,
and preserve the P4-R44 manual-only rule for T10-style GUI work.
