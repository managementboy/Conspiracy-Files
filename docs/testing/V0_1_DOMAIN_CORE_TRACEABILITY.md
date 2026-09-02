# v0.1 Plain-Lua Domain Core — Traceability Report

> This records the historical domain-core branch. The consolidated normal suite
> additionally covers exact per-kind journal fields, causal history replay,
> swapped confirmation/association negatives and last-known-good preservation.

**Implementation branch:** `feature/plain-lua-domain-core`

**Start point:** `ff1725cfc03627eeb2d3d12981f7b77e6ef3d2ca`

**Runtime contract:** plain Lua 5.1; no Project Zomboid or Java globals

**Single test command:** `lua5.1 test/run.lua`

## Scope and architecture

The implementation is limited to the PZ-independent Dead Air domain core:

- `Content.lua` contains the accepted static ThreadDefinition, Asset, Identity, Organisation and Location registries. The six document bodies are byte-compared (after CRLF normalization) with `test/fixtures/THREAD-001-DEAD-AIR.md` during the suite.
- `ThreadState.lua` owns canonical state in a closure. Callers receive deep-copy snapshots and derived projections only. Commands stage a complete copy and swap it only after validation.
- `Validator.lua` enforces the T1-safe scalar/table subset, no cycles/aliases/metatables, depth 64, the v0.1 schema and the 500 KB estimate ceiling; the current `Journal.lua` additionally owns exact per-kind construction and causal replay against Evidence and confirmation order.
- `Renderer.lua` derives journal text and major classification from event kinds, stable IDs, immutable Evidence context and static definitions. Rendered prose is not persisted.
- `Ids.lua` validates authored IDs and creates deterministic save-local Evidence/Journal IDs.
- `LocationBindings.lua` contains only the static CF-V01-E01 result. Its separate regression test checks exact physical signatures against the accepted live evidence; it is not a PZ adapter or a substitute for the live matrix.

There is deliberately no PZ event, ModData, item-token, map-binding adapter, UI, network/AI, graph, content-pack, migration, retrofit or multiplayer implementation. Static map-binding data is now selected, but the code does not resolve live PZ objects or perform T4's physical placement commit sequence.

Each criterion has at least one named test. Additional regression tests may reuse the same criterion prefix; traceability is one-to-many, not a restriction on coverage.

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
| CF-V01-P18 | `CF-V01-P18 staged recursive validation rejects unsafe states and preserves last-known-good`; `CF-V01-P18 exact journal language rejects swapped confirmations and impossible per-kind fields` | Invalid structural values, schema/static-ID errors, depth 64/65, repeated staged-failure preservation, swapped discovery/confirmation associations, forbidden/required `relatedId` cases and impossible causal histories. |
| CF-V01-P19 | `CF-V01-P19 calibrated estimator enforces the real 500 KB boundary` plus field-cap regression | Representative maximal slice; actual 500 KB estimator boundary; atomic capacity rejection; 4,096/256/128-byte persisted-field caps; static prose excluded. |
| CF-V01-P24 | `CF-V01-P24 Evidence resolves full static content without copying document bodies` | Static-registry validation; exact fixture-body comparison; pre/post reconstruction resolution; canonical body exclusion; missing static ID covered by P18. |
| CF-V01-P25 | `CF-V01-P25 complete suite loads with PZ globals absent` | Entire suite in PUC Lua 5.1.5 with `Events`, `ModData`, `getPlayer` and `getWorld` absent. |

## Encoded-size estimator

P4-R17 is enforced against a deterministic serializer-informed estimate, not an asserted reproduction of Project Zomboid's serializer. Encoded source string bytes are charged once plus type/table allowances. The estimate is order-independent because table-entry costs are summed. A staged root whose estimate exceeds `500 * 1024` bytes is rejected before the private root can be swapped.

The checked-in T1 calibration fixture estimates 444,196 bytes for the observed 442,499-byte 1,000-record file delta (0.38% headroom). Only a live T1-style ModData test can measure schema-2 `global_mod_data.bin` deltas; live package acceptance must retain that comparison. ADR-0004 defines the atomic rejection/reporting behavior.

## Content gate

The project owner approved Dead Air content revision `dead-air-r1` on 2026-09-01, satisfying CF-V01-P03. See `docs/reviews/DEAD_AIR_CONTENT_APPROVAL_2026-09-01.md`. This approval does not expand the accepted domain-core implementation into any live Project Zomboid integration behavior.

## Location-binding drift guard

The eighteenth suite test, `CF-V01-E01 selected live bindings remain exact and evidence-backed`, verifies `ConspiracyFiles.LocationBindings` against the selected structured records in `docs/research/CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md`. The live P2/R2 matrix is the acceptance evidence; this plain-Lua test only prevents later configuration/documentation drift.
