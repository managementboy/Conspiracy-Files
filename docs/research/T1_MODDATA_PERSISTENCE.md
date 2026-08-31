# Spike T1 — ModData persistence limits

- **Status:** Complete — live single-player save/reload matrix executed on the development PC
- **Project Zomboid build:** Stable `42.20.4 b0bbce05d5`; revision `b0bbce05d5`; `pzbullet=1.0.0.28`; Steam build ID `24909800`
- **Platform:** Windows 11 build 26200, 13th Gen Intel Core i9-13900H, 32,492 MB RAM
- **Probe:** `dev/t1-moddata-persistence/` on `spike/t1-moddata-persistence`
- **Execution date:** 2026-08-30

## Question

What values, table shapes, nesting depths and representative Conspiracy-Files data volumes safely survive Project Zomboid Build 42 Global ModData persistence, and what practical canonical-state guardrails follow?

## Method

The disposable probe used two Global ModData tags:

- `ConspiracyFiles.T1.Control` for primitive control metadata;
- `ConspiracyFiles.T1.Payload` for one isolated scenario.

Each suspicious scenario ran in a fresh clone of the same clean single-player save. The baseline and nil-removal pair used the same disposable world where sequencing required it. Each case was constructed in the live engine, saved through `saveGame()`, closed normally, reloaded, and deterministically validated from `OnInitGlobalModData`. Scale cases validated every record plus count and aggregate checksum.

The clean `global_mod_data.bin` was 59 bytes. File-size deltas below are measured against that file. Raw logs and saves remain local because they contain machine paths and are not repository artifacts.

The game's post-load screen requires raw physical input, while the available automation could not satisfy `Mouse.isButtonDown(0)`. A launch-only native test helper therefore polled the exact engine's private `GameLoadingState.done` flag and set only `forceDone`, the same flag set by the physical click path. It logged every release and did not alter ModData, save files, serializer code, or the installed game. Its auditable source is included under `dev/t1-moddata-persistence/tools/`.

The live runs used normal mode after harness validation so intentionally unsupported Lua values could not pause in the Lua debugger. Process responsiveness was sampled every two seconds for the automated matrix. `saveGame()` timing is the synchronous Lua call interval; `OnPostSave` also includes unrelated world-save/exit work.

## Verdict

**Vanilla Lua Global ModData is sufficient for Conspiracy-Files canonical persistence within the existing 500 KB target, provided canonical state is validated before save. Java and ZombieBuddy are not required for persistence.**

Use only plain acyclic Lua tables whose keys are strings or numbers and whose leaves are strings, numbers, booleans, or nil-as-absence. Relationship truth should remain stable IDs, not shared-table identity or engine objects.

The existing `≤500 KB/save` canonical-state target is now retained as an evidence-based v0.1 hard budget. The 1,000-record representative payload fit at 442,558 bytes and behaved comfortably. Larger payloads technically round-tripped, but 100,000 records caused roughly nine-second synchronous save and validation stalls. Technical serialisability is not an acceptable production budget.

## Observed serializer behavior

| Structure | Live save/reload observation | Classification |
|---|---|---|
| strings, integer/float numbers, booleans | Baseline validator passed with zero failures | Safe |
| nil before first save | Key absent after reload | Safe as absence |
| persisted value later set to nil | Removed after save/reload | Safe removal semantics |
| plain flat/nested/array/empty tables | Baseline validator passed | Safe within validated depth/size |
| string keys | Preserved | Safe |
| numeric keys, including `0`, negative and fractional | Preserved | Safe |
| mixed string and numeric keys | Preserved | Safe |
| function value | Save returned; value reloaded as nil | Forbidden; silently dropped |
| exposed Java object value (`GameTime`) | Save returned; value reloaded as nil; primitive sibling metadata survived | Forbidden; silently dropped |
| metatable | Owned table survived; metatable, `__index` fallback and marker were nil | Forbidden in canonical meaning |
| self-cycle | `StackOverflowError` in `KahluaTableImpl.save`; save call still reported returned; entire T1 payload/control disappeared and file reverted to 59 bytes | Forbidden; catastrophic silent data loss |
| shared child reference | Both child tables and markers survived, but `a == b` became false | Identity is not preserved; normalize or use IDs |
| boolean/table/function/Java-object key | Surrounding container survived empty; keyed value silently omitted | Forbidden keys |

The cycle result is particularly load-bearing: `pcall(saveGame)` did not surface the Java `StackOverflowError` as a Lua error. Pre-save validation is mandatory; relying on `pcall` or a successful return is insufficient.

## Measurements

### Baseline and nil behavior

| Case | Construct | `saveGame()` | Validation | File bytes | Delta | Result |
|---|---:|---:|---:|---:|---:|---|
| baseline | 0 ms | 351 ms | 0 ms | 802 | +743 | PASS, zero failures |
| nil seed | 0 ms | 279 ms | 0 ms | 332 | +273 | Seed value present after reload |
| nil removal | 0 ms | 309 ms | 0–1 ms | 300 | +241 | Removed value absent after reload |

The original baseline validator used Lua's global `next`, which this Kahlua environment does not expose. Replacing that empty-table check with `pairs` produced a PASS against the unchanged 802-byte saved payload. This was a probe compatibility correction, not a persistence-result change.

### Suspicious structures and depth

| Case | Construct | `saveGame()` | Validation | File bytes | Reload detail |
|---|---:|---:|---:|---:|---|
| function value | 0 ms | 627 ms | 0 ms | 306 | `valueType=nil` |
| Java object value | 0 ms | 517 ms | 0 ms | 331 | `valueType=nil`, source class metadata `GameTime` survived |
| metatable | 0 ms | 445 ms | 0 ms | 324 | table survived; metatable/fallback/marker nil |
| self-cycle | 0 ms | 534 ms reported returned | 0 ms | 59 | FAIL; payload/control missing; Java `StackOverflowError` |
| shared reference | 0 ms | 491 ms | 0 ms | 364 | both values survived; `sameReference=false` |
| boolean key | 0 ms | 513 ms | 0 ms | 317 | zero matching values |
| table key | 0 ms | 464 ms | 0 ms | 313 | zero matching values |
| function key | 0 ms | 472 ms | 1 ms | 319 | zero matching values |
| Java object key | 0 ms | 424 ms | 0 ms | 344 | zero matching values |
| depth 16 | 0 ms | 513 ms | 0 ms | 813 | 16/16 plus sentinel |
| depth 32 | 0 ms | 397 ms | 1 ms | 1,293 | 32/32 plus sentinel |
| depth 64 | 1 ms | 424 ms | 0 ms | 2,253 | 64/64 plus sentinel |
| depth 128 | 0 ms | 598 ms | 1 ms | 4,175 | 128/128 plus sentinel |
| depth 256 | 0 ms | 443 ms | 0 ms | 8,015 | 256/256 plus sentinel |
| depth 512 | 0 ms | 418 ms | 3 ms | 15,695 | 512/512 plus sentinel |

All tested acyclic depths through 512 round-tripped. T1 did not find the engine's failure depth. Conspiracy-Files should nevertheless enforce a production maximum depth of 64: it is far above the expected domain model, leaves substantial safety margin, and prevents adversarial or accidental pathological state. This is a project guardrail, not a claim that depth 65 fails.

### Representative Conspiracy-Files records

Each record contained a stable ID, entity type, display name, timestamp, x/y/z location, five metadata fields, three relationship IDs, and three flags/state values.

| Records | Construct | `saveGame()` | Validation | File bytes | Delta | Integrity | Responsiveness |
|---:|---:|---:|---:|---:|---:|---|---|
| 1,000 | 187 ms | 449 ms | 363 ms | 442,558 | +442,499 | 1,000/1,000; 0 mismatches; checksum exact | 0 non-responsive samples |
| 10,000 | 449 ms | 512 ms | 1,012 ms | 4,432,276 | +4,432,217 | 10,000/10,000; 0 mismatches; checksum exact | 0 non-responsive samples |
| 100,000 | 2,923 ms | 9,177 ms | 9,057 ms | 44,419,437 | +44,419,378 | 100,000/100,000; 0 mismatches; checksum exact | 2 prepare/save and 2 reload samples at 2-second intervals |

The 100,000-record normal-exit save also took 9,947 ms from `OnSave` to `OnPostSave`. No case timed out. All automated runs exited with code 0, including the cycle case; therefore process exit alone also cannot certify save integrity.

## Required persistence guardrails

Before canonical state is committed to ModData:

1. Recursively validate every value and key.
2. Allow only string/number keys and string/number/boolean/table values; nil means absence.
3. Track table identity. Reject cycles.
4. Reject multiply referenced tables or normalize/copy them so meaning never depends on alias identity.
5. Reject metatables, functions, userdata, threads and exposed Java objects anywhere in canonical state.
6. Enforce maximum depth 64.
7. Enforce canonical serialized-size estimate `≤500 KB` and refuse/diagnose oversized commits.
8. Represent canonical relationships with stable-ID references; storage may use static stable-ID arrays or a later standalone relationship store, but meaning must never depend on shared-table identity or engine-object references.
9. Stage and validate a full replacement before swapping the last known-good canonical root.
10. Emit a concise diagnostic on rejection; never silently drop unsupported state.

## Architecture impact

- P3-Q1 / ADR-0001 `Vanilla Lua first` is validated for persistence within the project budget.
- P3-Q4 `Persist minimal canonical state; rebuild caches/indexes` is strengthened by the scale results.
- P3-Q7 stable-ID relationship references are strengthened because shared table identity is lost and engine objects are dropped. T1 does not prescribe whether v0.1 stores those references in static arrays or a later standalone relationship store.
- P4-R17 `≤500 KB/save` changes from provisional to the recommended v0.1 hard canonical-state budget.
- No Java or ZombieBuddy production dependency is introduced.
- The domain model remains PZ-independent; nothing in T1 requires redesigning it around Lua or Java object references.

`DECISIONS.md` should record only the budget-status promotion and mandatory pre-save validation when this spike PR is accepted; the architecture itself is not redesigned.

## Limitations

- Single-player Global ModData only; multiplayer transmit/request behavior was intentionally out of scope.
- The tested maximum depth was 512; the actual failure threshold is unknown.
- File size is the entire `global_mod_data.bin`, measured from an identical 59-byte clean clone, not an engine-reported per-table byte count.
- Validation time is probe work after load, not isolated engine deserialization time.
- Process responsiveness sampling was at two-second granularity, so shorter stalls may not register.
- The launch-only gate helper was necessary for unattended execution but did not participate in serialization.

## Answers required by T1

1. **Safe values:** strings, numbers, booleans, nil-as-absence, and plain acyclic tables.
2. **Forbidden structures:** functions, userdata/Java objects, metatables as semantic state, cycles, alias-identity dependencies, and non-string/non-number keys.
3. **Cycles/shared references:** cycles cause serializer stack overflow and whole-tag loss; shared references are duplicated.
4. **Metatables:** not preserved.
5. **Safe keys:** strings and the tested numeric forms, including zero, negative and fractional numbers.
6. **Nesting:** all tested depths through 512 survived; project hard limit should be 64.
7. **Scale:** 1k and 10k survived comfortably; 100k survived with approximately nine-second synchronous save and validation stalls.
8. **Canonical-state ceiling:** retain and enforce `≤500 KB/save` for v0.1.
9. **Relationships:** store stable IDs, not table or engine-object references.
10. **Lua-first viability:** validated for persistence within the budget.
11. **Java/ZombieBuddy:** neither is required for production persistence.
12. **Validation:** mandatory recursive type/key/cycle/alias/depth/size/schema validation before ModData commit.

## Decision links

- P3-Q1 / ADR-0001 — vanilla Lua first.
- P3-Q2 — Java/ZombieBuddy only for a measured missing capability.
- P3-Q4 — persist minimal canonical state and rebuild caches/indexes.
- P3-Q7 / P3-Q8 — stable IDs and canonical relationship storage.
- P4-R17 — canonical save-state target.
- `docs/architecture/ARCHITECTURE_V0.2.md` §4.
- GitHub Issue #1 — `[Spike T1] ModData persistence limits`.
