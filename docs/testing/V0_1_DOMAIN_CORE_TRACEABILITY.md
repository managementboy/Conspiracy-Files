# v0.1 Plain-Lua Domain Core — Traceability Report

**Implementation branch:** `feature/plain-lua-domain-core`

**Start point:** `ff1725cfc03627eeb2d3d12981f7b77e6ef3d2ca`

**Runtime contract:** plain Lua 5.1; no Project Zomboid or Java globals

**Single test command:** `lua5.1 test/run.lua`

## Scope and architecture

The implementation is limited to the PZ-independent Dead Air domain core:

- `Content.lua` contains the accepted static ThreadDefinition, Asset, Identity, Organisation and Location registries. The six document bodies are byte-compared (after CRLF normalization) with `test/fixtures/THREAD-001-DEAD-AIR.md` during the suite.
- `ThreadState.lua` owns canonical state in a closure. Callers receive deep-copy snapshots and derived projections only. Commands stage a complete copy and swap it only after validation.
- `Validator.lua` enforces the T1-safe scalar/table subset, no cycles/aliases/metatables, depth 64, the v0.1 schema, semantic journal-to-Evidence consistency and the 500 KB estimate ceiling.
- `Renderer.lua` derives journal text and major classification from event kinds, stable IDs, immutable Evidence context and static definitions. Rendered prose is not persisted.
- `Ids.lua` validates authored IDs and creates deterministic save-local Evidence/Journal IDs.

There is deliberately no PZ event, ModData, item-token, map-binding, UI, network/AI, graph, content-pack, migration, retrofit or multiplayer implementation. The code records monotonic domain facts but does not choose T4's physical placement commit sequence.

## Acceptance matrix

| Criterion | Exact automated test | Principal cases covered |
|---|---|---|
| CF-V01-P04 | `CF-V01-P04 D1/D2 introduction paths expose only ordinary-text leads` | Fresh D1-first and D2-first states; single introduction; actual Evidence context; no objective, map marker, completion or solved state. |
| CF-V01-P06 | `CF-V01-P06 duplicate/reordered materialisation and discovery are idempotent after reconstruction` | Discovery-before-materialisation; duplicate commands; save-shaped reconstruction; no ordinal reuse or state regression. |
| CF-V01-P07 | `CF-V01-P07 exported snapshots cannot mutate authored or marked Evidence truth` | Mutation attempts against every immutable authored/marked field; invalid replacement; last-known-good preservation. |
| CF-V01-P08 | `CF-V01-P08 JournalEntry chronology is append-only across mutation attempts` | Multiple event kinds; contiguous IDs/ordinals; delete, overwrite, reorder and insert attempts. |
| CF-V01-P09 | `CF-V01-P09 deterministic no-AI renderer survives save-shaped round trips` | All six discovery summaries; repeated rendering; reconstructed state; runtime AI absent. |
| CF-V01-P10 | `CF-V01-P10 D5/D6 contradiction is knowledge-bounded and exactly once` | Both discovery orders; incomplete prerequisites; replay; unresolved-source wording; Evidence retained. |
| CF-V01-P11 | `CF-V01-P11 B-37 recontextualisation requires a prior marked key` | Key-before-D6, D6-before-key, unmarked key and repeated D6; contextual `matches` wording without physical-token claim. |
| CF-V01-P12 | `CF-V01-P12 only the three eligible event classes are major and never solved` | First entry, referenced relay confirmation and contradiction; early unreferenced arrival; non-major documents; no solved/completion state. |
| CF-V01-P14 | `CF-V01-P14 Mark Interesting creates one immutable chronology record per intent` | Generic object and authored B-37 key; deterministic save-local IDs; duplicate intent replay. |
| CF-V01-P15 | `CF-V01-P15 optional B-37 key does not gate six-document or contradiction paths` | Full six-document path without key Evidence; required contradiction remains attainable. |
| CF-V01-P16 | `CF-V01-P16 Organisation label derives generic-to-specific without persistence` | D2-only generic label; each of D1/D3/D5 as reveal; no persisted Organisation copy. |
| CF-V01-P17 | `CF-V01-P17 Location labels derive independently from idempotent confirmations` | Zero, one and two confirmations; duplicate confirmation; only the confirmed label refines. |
| CF-V01-P18 | `CF-V01-P18 staged recursive validation rejects unsafe states and preserves last-known-good` | Invalid key/value types, function, userdata, thread, metatable/Java stand-in, cycle, alias, schema/static-ID error, depth 64/65 and repeated staged-failure preservation. |
| CF-V01-P19 | `CF-V01-P19 conservative estimator enforces the 500 KB boundary` | Representative maximal 7-Evidence/two-location slice; immediately-below/above estimator payloads; oversized replacement preserves last-known-good; static prose excluded. |
| CF-V01-P24 | `CF-V01-P24 Evidence resolves full static content without copying document bodies` | Static-registry validation; exact fixture-body comparison; pre/post reconstruction resolution; canonical body exclusion; missing static ID covered by P18. |
| CF-V01-P25 | `CF-V01-P25 complete suite loads with PZ globals absent` | Entire suite in PUC Lua 5.1.5 with `Events`, `ModData`, `getPlayer` and `getWorld` absent. |

## Encoded-size estimator

P4-R17 is enforced against a deterministic conservative estimate, not an asserted reproduction of Project Zomboid's serializer. Strings are charged four bytes per source byte plus delimiters; numbers receive a fixed worst-case textual allowance; booleans, table delimiters, key/value tags and separators are charged explicitly. The estimate is order-independent because table-entry costs are summed. A staged root whose estimate exceeds `500 * 1024` bytes is rejected before the private root can be swapped.

The estimate intentionally overstates many ordinary values. Only a live T1-style ModData test can measure the actual `global_mod_data.bin` delta; this domain gate exists to refuse obviously over-budget canonical state safely and consistently.

## Open content gate

This implementation does not declare Dead Air canonical-shippable. The project-owner approval required by `docs/design/AI_PROVENANCE.md` and CF-V01-P03 remains open.
