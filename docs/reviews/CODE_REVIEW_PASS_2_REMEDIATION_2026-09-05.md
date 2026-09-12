# Code Review Pass 2 — Remediation

Status: implemented on the active `pm/v0.1-unattended-prep` branch, which is
seven commits ahead of the reviewed `1be30c4` baseline.

## Finding disposition

| Finding | Disposition |
|---|---|
| C1 | `ThreadState.renderJournal` now passes a deep copy; a regression probe captures and mutates the renderer input. |
| C2 | Static content validates once at module load. Registries/records use read-only Lua 5.1 proxies; scalar arrays are returned as disposable copies. |
| C3 | Validation now requires every discovery event to resolve to its corresponding authored Evidence record. Marked records remain checked in both directions. |
| H1 | Asset-backed and label-backed marks are mutually exclusive. `ThreadState.new` documents and checks extension from an empty schema root before accepting loaded state. |
| H2 | The public encoded-size estimator validates structure first and returns `nil, diagnostic` for unsafe values. |
| H3 | Static content validation is cached at load; full-journal rendering tracks prior relay knowledge in one pass. A maximal-state timing regression covers validation plus rendering. |
| M1 | The runner exports its resolved root/separator and the fixture test no longer depends on the process working directory. |
| M2 | Traceability requires one or more named tests per criterion, permitting focused regressions. |
| M3 | The transition triple `(ok, result, changed)` and idempotent-result semantics are documented beside `stage`. Return order remains compatible with existing adapters. |
| M4 | All authored/template journal prose now lives in `Content.lua`; Renderer only resolves placeholders. |
| M5 | Deep copy no longer preserves forbidden aliases or copies forbidden table keys. |
| M6 | Marked-interesting rendering uses explicit branches and named assertions. |
| L1 | The no-AI test records module loads and rejects socket/HTTP dependencies. |
| L2 | Static content validation reserves the `marked` asset-slug prefix. |
| L3 | The widening behavior of `%04d` persisted ordinals is documented. |
| L4 | A Lua 5.1 `.luacheckrc` now records the static-analysis baseline. |
| L5 | The limit is now decimal 500 KB (`500000` bytes), matching project vocabulary. |

## Loadability note

The local Build 42.20.4 (`b0bbce05d5`) `console.txt`, last written 2026-09-05,
confirms that slash-style `require("ConspiracyFiles/...")` resolves and the mod
reaches its `SCRIPT_LOADED`/`READY` events. It also contains a session where
`Runtime.lua` logged `SCRIPT_LOADED` at initial auto-execution and again when a
client debug module later required it. That answers the review question: an
auto-executed chunk's return value does not make the later require a no-op.

The domain modules are local and side-effect-free, so repeat execution does not
share or mutate canonical state. The side-effectful runtime now records
`Runtime.scriptLoaded` in the one permitted project namespace and returns early
on a second execution, before registering hooks. A plain-Lua regression executes
`Runtime.lua` twice against event mocks and requires exactly one registration for
each hook. A clean live rerun remains part of T11 before shipping, but the module
layout question itself is resolved and guarded.
