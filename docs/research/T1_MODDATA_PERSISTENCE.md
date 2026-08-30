# Spike T1 — ModData persistence limits

- **Status:** In progress — reproducible probe committed; live Build 42 save/reload execution blocked in this agent environment
- **Project Zomboid build tested:** **Not yet tested in-game.** The exact build installed on the development PC must be recorded from the probe's `[CF-T1] ... kind=READY ... gameVersion=` output. As external context only, the official Project Zomboid version endpoint reported Stable **42.20.4** on 2026-08-30.
- **Platform:** Live target development PC is not exposed to this execution environment. Probe authoring/syntax-check environment is a Linux container without a Project Zomboid installation or save directory mounted.
- **Probe path/commit:** `dev/t1-moddata-persistence/`; probe-code commit `9202f353d0acb7e8680ef02508c23cac26b0141c` on branch `spike/t1-moddata-persistence`
- **API/event/classes used:** Lua `ModData.getOrCreate`, `ModData.get`, `ModData.remove`; `Events.OnInitGlobalModData`, `Events.OnGameStart`, `Events.OnKeyPressed`, `Events.OnSave`, `Events.OnPostSave`; Lua globals `saveGame`, `getTimeInMillis`, `getGameVersion`, `getCurrentSaveName`, `getGameTime`, `getClassSimpleName` where available.

## Question

What Lua value types, key types, reference shapes, nesting depths and representative Conspiracy-Files data volumes safely survive a **real Project Zomboid Build 42 save/reload cycle** through Global ModData, and what practical canonical-state ceiling should Conspiracy-Files adopt?

This spike specifically tests whether the current Lua-first persistence hypothesis is viable. It must not assume that assignment into a ModData table implies serialisability.

## Documentation/research context

These are **documentation claims or external context, not T1 observed results**:

1. The official Project Zomboid version endpoint reported Stable `42.20.4` on 2026-08-30: <https://projectzomboid.com/version_announce/>.
2. Current official JavaDocs expose `zombie.world.moddata.ModData` to Lua with `getOrCreate`, `get`, `create`, `remove`, `add`, `transmit` and `request`: <https://projectzomboid.com/modding/zombie/world/moddata/ModData.html>.
3. Current official JavaDocs state that `GlobalModData` itself is not exposed to Lua and that `ModData` calls back to it. Its backing store is a `Map<String, KahluaTable>` and it implements `save()`/`load()`: <https://projectzomboid.com/modding/zombie/world/moddata/GlobalModData.html>.
4. Current official constant values name the persistence file `global_mod_data.bin` and show an internal `BLOCK_SIZE` of `524288` bytes: <https://projectzomboid.com/modding/constant-values.html>. **That allocation/block constant is not evidence of a 512 KiB save limit or a safe architecture budget.**
5. Current official LuaManager JavaDocs expose `saveGame()`, `getTimeInMillis()`, `getGameVersion()` and `getGameTime()`: <https://projectzomboid.com/modding/zombie/Lua/LuaManager.GlobalObject.html>.
6. The Indie Stone's Build 42 mod-architecture announcement describes versioned mod directories such as `42/` plus a shared `common/` directory: <https://projectzomboid.com/blog/news/2024/08/tidy-up-time/>. A successful live load of this probe will still be the project-level verification of the exact packaging used here.
7. The current community-maintained event reference documents `OnInitGlobalModData` as firing when GlobalModData is initialised, `OnSave` before global mod data/world save, and `OnPostSave` after saving/exiting: <https://demiurgequantified.github.io/ProjectZomboidLuaDocs/md_Events.html>. Those timing descriptions guide instrumentation but are not substituted for live observations.

## Method

The disposable probe lives completely under `dev/t1-moddata-persistence/` and uses only two namespaced Global ModData tags:

- `ConspiracyFiles.T1.Control` — small primitive control metadata;
- `ConspiracyFiles.T1.Payload` — exactly one scenario payload at a time.

The probe never modifies vanilla Lua and introduces only the existing project namespace `ConspiracyFiles`.

For each live scenario the required verification cycle is:

1. Enable the probe in a new disposable single-player save.
2. Record `[CF-T1]|EVENT|kind=READY|gameVersion=...` as the **exact installed build tested**.
3. Select a scenario with F8 (or `ConspiracyFiles.T1Probe.select(index)` in the Lua debugger).
4. Press F9 to construct/arm it. Record `constructMs`.
5. Press F10 to call `saveGame()` inside `pcall`. Record whether it returns/errors and the elapsed wall-clock interval around that call.
6. Exit/reload as required and load the **same** save.
7. Capture the deterministic `VERIFY` record emitted from `OnInitGlobalModData`.
8. Measure `global_mod_data.bin` where possible and record baseline/delta.
9. Record visible stalls/freezes, console exceptions, failed saves, failed reloads or crashes.

A successful Lua assignment is not success. A scenario is only classified after the save/reload step. A save error, load failure, crash, missing payload, changed representation, duplicated reference, or console exception is itself a result.

Dangerous/suspicious structures should be run in separate disposable saves so a failed case does not contaminate later observations. `nil_seed` and `nil_removal` deliberately run consecutively in the same save.

### Probe scenarios

| Scenario | Intended observation |
|---|---|
| `baseline` | strings, integer/float numbers, booleans, nil-before-save, flat string-keyed table, numeric-keyed table including 0/negative/fractional keys, mixed string+number keys, nested table, array/list, empty table |
| `nil_seed` | persist a value that will be removed next cycle |
| `nil_removal` | set the previously persisted key to nil, save/reload, verify absence |
| `function_value` | function as persisted value |
| `userdata_value` | exposed Java object (`getGameTime()`) as persisted value |
| `metatable` | table with `__index` and metatable marker |
| `cycle` | table whose `self` field points to itself |
| `shared_reference` | two fields point to the same child table |
| `boolean_key` | boolean table key |
| `table_key` | table table-key |
| `function_key` | function table-key |
| `userdata_key` | exposed Java object as table-key |
| `depth_16` ... `depth_512` | progressively deep single-child table chains |
| `scale_1000` | 1,000 representative records |
| `scale_10000` | 10,000 representative records |
| `scale_100000` | 100,000 representative records |

### Representative architecture-style record

Each scale record contains:

- stable ID;
- entity type;
- display name;
- discovery timestamp;
- x/y/z location;
- five metadata fields;
- three related **entity IDs**;
- three boolean/state flags.

The scale model intentionally uses only plain, acyclic tables and primitive values. The verifier walks all expected records and compares a deterministic aggregate checksum plus record counts, rather than trusting `#table` alone.

## Probe self-checks performed outside Project Zomboid

These checks validate the **test apparatus only**, not ModData persistence:

- The committed Lua file parses successfully with the available `texluac` parser.
- A mocked Lua environment exercised construction and deterministic validation for baseline/nil behavior, a depth case, and the 1k/10k/100k representative generators.
- In those in-memory mock checks, the generated count/checksum matched the validator through 100,000 records.
- The GitHub blob SHA of the committed probe is `d7a1aeaba148a0b91f422f260f2acd3c4dde5878`, matching the locally syntax-checked file.

No mock timing, memory usage or validation result is admissible as a Project Zomboid save/load measurement.

## Observed behaviour

### Actual Build 42 game observations

**None yet.** This agent environment has repository/web access and a generic Linux execution container, but it does not expose the development PC's Project Zomboid installation, Steam library, saves, UI, process or console. A filesystem search of the available runtime did not find a usable Project Zomboid/Steam installation to launch.

Therefore this report does **not** classify any Lua value type or volume as successfully persisted, rejected, duplicated, mutated, or unsafe based on supposed observations.

### Documentation observations only

- Current official JavaDocs confirm that Lua-facing `ModData` fronts GlobalModData and that the backing values are Kahlua tables.
- The GlobalModData persistence file is documented as `global_mod_data.bin`.
- The implementation's `524288`-byte block constant is visible in official JavaDocs, but no practical persistence ceiling follows from that fact alone.
- Official version metadata reports public Stable 42.20.4 as of 2026-08-30. This is **not** a substitute for recording the exact version installed on the test PC.

## Measurements

No live-game measurements exist yet. Do not fill these cells from the mocked harness.

| Case | Construct time | `saveGame()` call interval | Reload/validation | `global_mod_data.bin` impact | Record survival | Observable stall/freeze |
|---|---:|---:|---:|---:|---|---|
| baseline | pending live run | pending | pending | pending | pending | pending |
| 1,000 records | pending live run | pending | pending | pending | pending | pending |
| 10,000 records | pending live run | pending | pending | pending | pending | pending |
| 100,000 records | pending live run | pending | pending | pending | pending | pending |

### Timing limitations

- `constructMs` is measured around Lua payload construction.
- `SAVE_CALL_RETURN.elapsedMs` is the wall-clock interval around the Lua `saveGame()` call. Whether that call encompasses all persistence work must be judged from live behavior/logs.
- `OnPostSave` elapsed time from `OnSave` is an upper bound that includes non-ModData save/exit work.
- `initWindowMs` spans Lua script load to `OnInitGlobalModData`; it is **not** isolated deserialisation time.
- `validationMs` measures the probe's deterministic post-load validation only.

## Unsupported or suspicious structures

All classifications remain pending live save/reload.

| Structure | Save result | Reload representation | Error/crash/log result | T1 classification |
|---|---|---|---|---|
| function value | pending | pending | pending | pending |
| Java/exposed object value | pending | pending | pending | pending |
| metatable | pending | pending | pending | pending |
| self-cycle | pending | pending | pending | pending |
| shared child reference | pending | pending | pending | pending |
| boolean key | pending | pending | pending | pending |
| table key | pending | pending | pending | pending |
| function key | pending | pending | pending | pending |
| Java/exposed object key | pending | pending | pending | pending |
| depth 16 | pending | pending | pending | pending |
| depth 32 | pending | pending | pending | pending |
| depth 64 | pending | pending | pending | pending |
| depth 128 | pending | pending | pending | pending |
| depth 256 | pending | pending | pending | pending |
| depth 512 | pending | pending | pending | pending |

## Interim persistence guardrail — not a T1 finding

Until the live probe supplies evidence, production code should remain at least as conservative as the existing architecture intends:

- canonical persisted data should be plain acyclic tables;
- use string field names and numeric indexes only;
- leaf values should be strings, numbers and booleans, with nil meaning absence/removal;
- store entity relationships as stable IDs rather than engine/Lua object references;
- do not intentionally place functions, userdata/exposed Java objects, metatables, cycles, shared-reference identity requirements, or non-string/non-number keys into canonical state;
- derived indexes/caches remain rebuildable rather than persisted.

This is a **risk-control policy while T1 is incomplete**, not evidence that every listed safe-looking type has already survived Build 42 persistence.

## Validation recommended before persisting state

This recommendation is architectural hygiene pending the live results and should be tightened after T1:

1. Recursively walk canonical state before commit/save.
2. Reject leaf types outside the T1-approved subset.
3. Reject key types outside the T1-approved subset.
4. Track visited table identity while walking so cycles are detected before handing state to the engine.
5. Until shared-reference behavior is known, either reject multiply referenced tables or normalise/copy them so canonical meaning never depends on alias identity.
6. Enforce a conservative maximum nesting depth once the depth probe identifies a practical bound.
7. Enforce a canonical-state byte/size estimate and record-count guard below the final T1 budget.
8. Validate all stable IDs, relationship endpoints and required schema fields before replacing the last known-good canonical table.
9. Stage multi-step mutations in plain Lua, validate, then commit the validated representation to the ModData adapter.
10. Emit one concise diagnostics record on validation failure; never silently drop an unsupported field.

## Limitations / exact blocker

The live experiment required by Issue #1 cannot be completed from the currently available agent runtime because the user's/development PC's installed Project Zomboid client is not remotely controllable or mounted here. Repository, internet research and generic code execution are available; the actual game process and save directory are not.

Consequences:

- exact installed Build 42 version is still unrecorded;
- the mod packaging has not yet been proven loadable on that PC;
- no Global ModData serializer behavior has been observed;
- no scale save/load timing or save-size impact has been measured;
- no gameplay stall/freeze has been observed;
- Issue #1 must remain open.

The committed probe is designed so the missing evidence can be gathered without modifying production code or editing probe source between cases.

## Answers required by T1 — current status

1. **What Lua value types safely survive save/load?** Pending live run.
2. **What structures must never enter canonical persisted state?** Final answer pending. Interim guardrail excludes functions, userdata/Java objects, metatables, cycles, shared-reference identity dependencies and non-string/non-number keys.
3. **Are cyclic/shared references preserved, duplicated, rejected, or broken?** Pending live run.
4. **Are metatables preserved?** Pending live run.
5. **What key types are safe?** Pending live run.
6. **What practical nesting depth appears safe?** Pending live run.
7. **How do 1k, 10k and 100k representative records affect save/load?** Pending live run.
8. **What canonical-state size ceiling is recommended?** No evidence yet to revise the current provisional **≤500 KB/save** target. Keep it provisional; the internal 512 KiB buffer block is not a reason to adopt or reject that target.
9. **Should relationships be stored as IDs rather than Lua table/object references?** Continue the ID-based design as the conservative hypothesis. T1 has not yet verified or disproved it, and canonical meaning should not depend on serializer alias semantics.
10. **Does the proposed Lua-first persistence architecture remain viable?** Inconclusive until live persistence and scale runs. No evidence collected here disproves it.
11. **Any reason from T1 alone to introduce Java/ZombieBuddy?** No measured T1 evidence exists yet that justifies either dependency. This is not the final `vanilla Lua sufficient` verdict.
12. **What validation should run before persistence?** Use the defensive recursive validation/staging guardrail above, then narrow/adjust it based on actual T1 results.

## Recommended state-size budget

**No change yet.** Retain P4-R17's provisional target of **≤500 KB canonical state per save** until the baseline/1k/10k/100k runs provide measured save latency, reload robustness and file-size deltas on the actual stable Build 42 installation.

A larger payload merely being technically serialisable would not by itself justify a larger production budget.

## Architecture impact

No current decision is superseded by this incomplete run. In particular:

- P3-Q1 / ADR-0001 `Vanilla Lua first` remains the default because no contrary measured result exists.
- P3-Q4 `Persist minimal canonical state; rebuild caches/indexes` remains prudent.
- P3-Q7 stable IDs and P3-Q8 ID-based central relationships remain the conservative representation.
- P4-R17 remains **provisional**, exactly as intended.
- No Java or ZombieBuddy dependency is introduced.

`DECISIONS.md` is intentionally unchanged. Updating it without live evidence would violate the project's decision-integrity rule.

## Verdict

**T1 final verdict: not yet available. Live execution is blocked in this agent environment.**

Current dependency ruling:

- **Vanilla Lua sufficient:** not proven or disproven.
- **Java helpful:** not established by T1 evidence.
- **ZombieBuddy required:** not established by T1 evidence.

Do not close GitHub Issue #1 until the committed probe has been run against the actual installed Build 42 stable client, this report contains the observed results/measurements, and the final dependency ruling is based on those observations.

## Decision links

- P3-Q1 / ADR-0001 — vanilla Lua first.
- P3-Q2 — Java/ZombieBuddy only for missing API access, measured performance, or persistence/data-processing complexity.
- P3-Q4 — persist minimal canonical state and rebuild caches/indexes.
- P3-Q7 / P3-Q8 — stable IDs and canonical relationship storage.
- P4-R17 — provisional `≤500 KB/save` canonical-state target.
- `docs/architecture/ARCHITECTURE_V0.2.md` §4 canonical state.
- GitHub Issue #1 — `[Spike T1] ModData persistence limits`.
