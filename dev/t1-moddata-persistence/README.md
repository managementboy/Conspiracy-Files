# Spike T1 — ModData persistence probe

This folder is a disposable Project Zomboid Build 42 probe for GitHub Issue #1. It is intentionally separate from production mod code.

## Purpose

The probe answers T1 by performing real `ModData` save/reload cycles against a disposable single-player save. It does **not** infer persistence safety from successful Lua assignment.

The probe writes only two namespaced Global ModData tables:

- `ConspiracyFiles.T1.Control` — safe primitive control metadata;
- `ConspiracyFiles.T1.Payload` — the scenario under test.

Do not use a valued save. Several scenarios are intentionally capable of causing save errors, failed reloads, hangs, or corrupted probe state.

## Build 42 local-mod layout

Copy `dev/t1-moddata-persistence/` as a local mod folder so that the game sees this shape:

```text
ConspiracyFiles_T1_Probe/
├── common/
│   └── media/lua/shared/ConspiracyFilesT1Probe.lua
└── 42/
    └── mod.info
```

Enable **Conspiracy-Files T1 Persistence Probe** only for a new disposable single-player save.

Current official Project Zomboid material describes Build 42's versioned mod directories and the `common` directory. The first successful load of this probe is still the project-level verification that this exact local packaging works on the development PC.

## Controls

The console prints structured records prefixed with `[CF-T1]`.

- **F8** — select the next scenario.
- **F9** — construct the selected scenario in `ModData` and arm reload validation.
- **F10** — call `saveGame()` inside `pcall` and log elapsed wall-clock time around the call.
- **F11** — remove both T1 ModData tags from memory. Save afterwards if you want the cleared state persisted.

The Lua debugger can alternatively call `ConspiracyFiles.T1Probe.select(index)`, `.prepare()`, `.save()`, `.clear()`, or `.validate()`.

## Required run procedure

For every scenario:

1. Start or load the disposable test save with only this probe enabled where practical.
2. Confirm `[CF-T1]|EVENT|kind=READY` and record `gameVersion=`. This is the exact installed Build 42 version for the spike.
3. Use F8 until the desired `scenario=` is selected.
4. Press F9. Record `constructMs=` from the `PREPARE` line.
5. Press F10. Record the `SAVE_CALL_RETURN` result and `elapsedMs=`. If it errors, preserve the relevant console exception/stack trace.
6. Exit to the main menu or desktop normally, then reload the **same** save.
7. Record the `VERIFY` line emitted from `OnInitGlobalModData`.
8. Record the resulting `global_mod_data.bin` size from the disposable save directory when measurable. Do not commit saves or raw logs containing private machine paths.
9. Note any visible stall/freeze during construction, save, exit, or reload.

`initWindowMs` is only an upper-bound initialization window from Lua script load to `OnInitGlobalModData`; it is **not** an isolated ModData deserialization time. `validationMs` measures only the probe's validation work after ModData has loaded. `OnPostSave` timing includes other world-save/exit work and should be treated as an upper bound.

## Scenario matrix

Run the following in order. Run `nil_seed` then `nil_removal` consecutively in the same disposable world. Use a fresh disposable save for every suspicious/unsafe scenario after the nil-removal pair; do not let one malformed payload contaminate interpretation of another.

| Scenario | What it tests |
|---|---|
| `baseline` | strings, integer/float numbers, booleans, nil-before-save, flat string-keyed table, numeric keys including 0/negative/fractional, mixed keys, nesting, array/list, empty table |
| `nil_seed` | persist a key that will be removed on the next cycle |
| `nil_removal` | set the previously persisted `nil_seed` key to nil, save, reload, and verify it is gone |
| `function_value` | function as a persisted value |
| `userdata_value` | exposed Java object (`getGameTime()`) as a persisted value |
| `metatable` | metatable and `__index` behavior |
| `cycle` | self-referential cyclic table |
| `shared_reference` | two fields referencing the same Lua table |
| `boolean_key` | boolean table key |
| `table_key` | table-as-key |
| `function_key` | function-as-key |
| `userdata_key` | exposed Java object as key |
| `depth_16` | nested table depth 16 |
| `depth_32` | nested table depth 32 |
| `depth_64` | nested table depth 64 |
| `depth_128` | nested table depth 128 |
| `depth_256` | nested table depth 256 |
| `depth_512` | nested table depth 512 |
| `scale_1000` | 1,000 representative Conspiracy-Files-style records |
| `scale_10000` | 10,000 representative records |
| `scale_100000` | 100,000 representative records |

If a depth causes a save/reload failure, stop increasing depth in that save. If a scale produces an unacceptable freeze or resource problem, preserve the measurement/error and do not force the next scale merely to obtain a larger number.

## Representative scale record

Each generated record contains:

- stable ID;
- entity type;
- display name;
- discovery timestamp;
- `x/y/z` location;
- five metadata fields;
- three related entity IDs;
- three flags/state values.

The records deliberately contain only plain acyclic tables and string/number/boolean values. Reload validation checks record count plus a deterministic aggregate checksum derived from all architecture-style fields.

## Interpreting suspicious scenarios

A `VERIFY ... status=PASS` means the probe's deterministic expectations passed. For suspicious scenarios the important evidence is the detailed representation fields, not the word PASS alone. For example:

- `shared_reference` reports `sameReference=true/false`;
- `metatable` reports `metatableType`, `fallback`, and `metaMarker`;
- `cycle` reports `selfSame`;
- nonstandard-key cases report the key types found after reload;
- function/userdata cases report the surviving value type/class.

A save error, missing `VERIFY`, load failure, crash, or log exception is itself a T1 result. Preserve the relevant lines and exact build number.

## Save-size measurement

The engine currently names the Global ModData save file `global_mod_data.bin`. Record its size after a successful save/reload for `baseline`, 1k, 10k, and 100k. Prefer measuring the same disposable world before/after a payload replacement when possible, or record the baseline file size for each fresh world and report the delta.

Do not interpret the engine's internal 524,288-byte buffer block size as a 512 KiB persistence limit; it is an implementation allocation constant, not evidence of a safe architectural ceiling.
