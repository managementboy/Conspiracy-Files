# Conspiracy-Files — Project State

Status: **Engineering de-risk / v0.1 definition**. No feature implementation has been accepted yet.
Target: Project Zomboid Build 42; reviewer-reported current stable line is 42.20.x, to be verified in spikes/research before implementation claims are final.

## Source of truth order

1. `DECISIONS.md` — historical discovery record.
2. `DECISIONS_SUPERSESSIONS_2026-08-30.md` — authoritative review corrections where they conflict with the baseline.
3. `ROADMAP.md` — delivery scope and gates.
4. `docs/architecture/ARCHITECTURE_V0.2.md` — current provisional architecture.
5. `docs/research/` — observed Build 42 facts from spikes. **Observed technical reality overrides a speculative decision.**
6. `docs/decisions/` — ADRs for durable engineering choices.

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
- provisional budgets are ≤2 ms/frame outside initialization and ≤500 KB canonical save state.

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

## Immediate work

Before implementation architecture is signed off:

1. run T1 and T9;
2. run T2–T5;
3. maintain the hand-authored fixture in `test/fixtures/THREAD-001-DEAD-AIR.md`;
4. then update decisions from observed results;
5. run T7/T8/T10 before expanding native asset/location/UI assumptions; T6 only matters if retrofit is revived.

## Rule for disproven decisions

Do not preserve a decision merely because it was previously marked settled. If a spike disproves it, supersede it explicitly in the decision record, link the spike/issue, and add the replacement ruling.
