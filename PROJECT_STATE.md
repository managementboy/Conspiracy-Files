# Conspiracy-Files — Project State

Status: **Engineering de-risk / v0.1 domain implementation**. The PZ-independent v0.1 Lua domain core is accepted; live Build 42 integration remains unvalidated.
Target: Project Zomboid Build 42; T1 and T9 verified stable Build **42.20.4**, revision **b0bbce05d5**, Steam build ID **24909800**. Other capability claims remain subject to their named spikes/research.

## Source of truth order

1. `DECISIONS.md` — current authoritative decision index.
2. `DECISIONS_BASELINE.md` — preserved full discovery history.
3. `DECISIONS_SUPERSESSIONS_2026-08-30.md` — engineering-review correction trail.
4. `ROADMAP.md` — delivery scope and gates.
5. `docs/architecture/ARCHITECTURE_V0.2.md` — current provisional architecture.
6. `docs/research/` — observed Build 42 facts from spikes. **Observed technical reality overrides a speculative decision.**
7. `docs/decisions/` — ADRs for durable engineering choices.

## Spike-to-GitHub-issue map

Spike numbers and GitHub issue numbers are not interchangeable. Use this authoritative mapping:

| Spike | GitHub issue |
|---|---:|
| T1 | #1 |
| T9 | #2 |
| T2 | #3 |
| T3 | #4 |
| T4 | #5 |
| T5 | #6 |
| T6 | #7 |
| T7 | #8 |
| T8 | #9 |
| T10 | #10 |

## Core product

Conspiracy-Files is a solo-first Project Zomboid investigation overlay. The player survives normally and opportunistically discovers a grounded 1990s government/scientific conspiracy through ordinary PZ places and objects. There is no conventional case completion and no guaranteed final truth before death.

## Review correction

The first specification over-committed to unproven Build 42 capabilities. The engineering review dated 2026-08-30 is incorporated. Key corrections:

- a concrete v0.1 vertical slice now exists;
- no-AI is the primary experience;
- graph is v2;
- content packs, retrofit, migration and multiplayer are out of v1;
- full diagnostics are debug/development only;
- v0.1 uses hand-curated/hardcoded story locations;
- six critical spikes gate core implementation, with four additional probes required before broader v1 architecture sign-off;
- the domain core must be PZ-free/testable under Lua 5.1;
- the runtime budget remains provisionally ≤2 ms/frame outside initialization; completed T1 makes ≤500 KB/save the hard v0.1 canonical-state budget.

## Completed de-risking

- **T1 ModData persistence/size limits:** complete. The live single-player save/reload matrix on Build 42.20.4 revision b0bbce05d5 (Steam build ID 24909800) validated vanilla Lua Global ModData within the hard ≤500 KB/save canonical-state budget and established mandatory recursive pre-save validation. See `docs/research/T1_MODDATA_PERSISTENCE.md`.
- **T9 vanilla Lua network egress:** complete. The live `-nosteam` probe on Build 42.20.4 found synchronous DNS and a fixed blocking server-list helper, but no arbitrary GET, POST, TLS/timeout controls or async HTTP response surface. Any future optional runtime-AI transport requires Java/ZombieBuddy or an external companion and remains outside v0.1. See `docs/research/T9_NETWORK_EGRESS.md`.

## Accepted offline implementation

- **v0.1 plain-Lua domain core:** merged in PR #15 at `c9d845e21a0a4298a83ce8b92204e66b6e59d073`. It implements the static Dead Air registries, private canonical ThreadState API, authored and Mark Interesting Evidence, append-only journal events, deterministic no-AI rendering, derived Organisation/Location labels, idempotent domain transitions, D5/D6 contradiction handling, B-37 recontextualisation, major-discovery evaluation, staged P4-R32 validation, the conservative P4-R17 size gate and static content resolution.
- All 16 acceptance criteria classified `plain-Lua automated test` pass under PUC Lua 5.1.5. The suite reports 17 passing tests total because it also checks that the authoritative acceptance table and traceability matrix remain complete and one-to-one. See `docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md`.
- This acceptance is limited to the PZ-independent domain layer. It does not validate ModData adapter behavior, physical placement/commit sequencing, live item identity, reader/UI integration, location-arrival detection, map bindings or any other Build 42 engine behavior.

## v0.1 vertical slice

One built-in hand-authored thread:
- 6 documents;
- 3 identities;
- 1 organisation;
- 2 locations;
- 1 anchor + 1 fallback;
- chronological notebook journal + evidence list;
- manual Mark Interesting;
- hardcoded/curated locations;
- no graph, theories, runtime AI, content packs, retrofit, migration, or MP.

## v0.1 content/model status

- `test/fixtures/THREAD-001-DEAD-AIR.md` is now a complete Dead Air authored-content candidate rather than a structural fixture: six full documents, three identities, one organisation, two story locations, anchor/fallback behavior, discovery paths, three reward moments, deterministic journal output and a Mark Interesting example.
- The Dead Air text was development-time AI-assisted and still requires human approval before canonical shipping under `docs/design/AI_PROVENANCE.md`.
- `docs/design/V0_1_DATA_MODEL.md` now derives the smallest v0.1 logical model from that story. Static authored prose/entities remain outside save state; v0.1 relationships are static ID references rather than standalone relationship records.
- `docs/requirements/V0_1_ACCEPTANCE_CRITERIA.md` separates observable product/domain acceptance from live engine validation and classifies every criterion by verification method. Its 16 plain-Lua criteria are now covered by the accepted domain-core suite; T4/T5/T7/T8/T10-dependent behavior remains blocked on those named spikes, and no live Build 42 acceptance is claimed.
- Exact vanilla map targets for the two curated locations are still unselected/unverified in this repository and must be chosen on the development PC.
- No live Build 42 behavior was validated by the accepted domain-core work. The separately completed T1 result is authoritative for persistence; Gate A T2–T5 remains open, and T7/T8/T10 remain authoritative for their respective engine questions.

## Immediate work

Before implementation architecture is signed off:

1. run T2–T5;
2. integrate the accepted domain core only through adapter mechanisms proven by the named spikes, without expanding into content packs/graph systems;
3. choose and verify the two exact curated vanilla story locations on the development PC before location bindings are committed;
4. update decisions from each observed spike result;
5. run T7/T8/T10 before expanding native asset/location/UI assumptions; T6 only matters if retrofit is revived.

## Rule for disproven decisions

Do not preserve a decision merely because it was previously marked settled. If a spike disproves it, supersede it explicitly in `DECISIONS.md`, link the spike result, and add the replacement ruling.
