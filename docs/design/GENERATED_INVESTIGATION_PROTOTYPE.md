# Generated investigation prototype — bounded specification

Status: G1 offline generator implemented and tested with synthetic data; real Muldraugh catalog and live integration pending.
Authority: DECISIONS P4-R53. Dead Air remains a regression fixture.

## What this must prove

A new-save seed produces a coherent investigation from authored building blocks and automatically selected locations. Different seeds can change where the investigation takes place, who appears, what the records say and how the records connect. The same committed case remains stable through reload. The player is never asked to pre-approve sites.

Dynamic generation here means constrained assembly, not unconstrained runtime text generation. No-AI is complete. No solved state, objective markers, completion percentage or authoritative explanation of the Knox Event.

## Smallest content and catalog

- The owner will provide 12 interesting Muldraugh places. Preserve their nominations, then use T2/T3 research and technical inspection to enrich explicit capabilities; a nomination alone does not prove usable storage. This is a development-scale subset of the eventual large database, not a claim of map-wide coverage.
- Two authored case outlines sharing a small vocabulary of document forms. One connects an initial record to a corroborating record and an unresolved authorization gap; the other connects it to a conflicting account. Neither resolves the conspiracy.
- Each case has three documents, two distinct locations, two identities and one organisation. Names, constrained dates/codes and selected outline vary by seed; all repeated facts come from one case fact table.
- Slot requirements describe observable capabilities such as a searchable paper-storage container, supported floor and distinct building/area. Templates must not infer institutional authority from a generic room name. Start with flexible document premises that can use the catalog's demonstrated capabilities.
- Existing Dead Air prose stays unchanged. New reusable text follows the existing development-content provenance/owner-review policy; reviewing authored building blocks does not require approving each selected location.

A catalog record needs a stable ID, map/build applicability, bounds/floor, observed metadata source, capability tags with rule provenance, container constraints and explicit exclusions/uncertainty. Do not persist a full map registry in every save.

## Generation and placement contract

1. Filter candidates by map compatibility, required capabilities and exclusions. Unknown required facts make a candidate ineligible; do not ask the owner to guess.
2. Use a stable PRNG and stable candidate ordering. Select the outline, facts and two distinct sites from the eligible set. Site choice and document facts must come from the same generated case, not independently randomized prose.
3. Create an in-memory plan with stable case/document IDs and explicit references, distribution and ordinary-text leads. Validate every required slot and reference before committing anything.
4. The engine adapter validates actual storage when the relevant area is loaded. A catalog match alone is not a usable container. Keep unloaded targets pending; reject a definitively unsuitable target.
5. Before any case/item is exposed, a rejected plan may be discarded and regenerated with bounded attempts. Once committed or any evidence is exposed, do not reroll facts or silently relocate established evidence. Preserve unavailable/unknown/conflict semantics and never infer loss from source-container absence.
6. No eligible pair or exhausted attempts yields an explicit development diagnostic and no partial case. Never silently fall back to the fixed Muldraugh pair.
7. Persist the generated case's minimum canonical facts, selected IDs, template/catalog revisions and required resolved text or equivalent durable representation. A seed alone is insufficient if source data changes. Validate the full root within the existing 500 KB budget before swap; unsupported revisions refuse safely without migration.
8. UI projects only discovered facts. The generator's internal facts are not player knowledge. Explicit document connections can stay small per-case references; a generic graph system is unnecessary.

For this prototype, discovery preparation uses checked-in catalog data. Do not synchronously enumerate the live map. Larger catalog discovery later follows T2's record/time bounds and T3's uncertainty findings.

## Compatibility work required before G2

Current Content/Placement/Session validators assume a fixed seven-asset Dead Air registry, and NotebookProjection contains authored-ID logic. They cannot consume arbitrary cases today. Introduce the smallest case-definition/resolver boundary needed by generation, retaining the existing fixture as a consumer and preserving its regression tests. Do not replace the domain or weaken validation wholesale.

Generalize authoritative text resolution, lead/connection projection, placement membership and stable saved IDs together. A new save/schema may be needed; decide and document that during implementation rather than implying compatibility or adding migrations.

The empty persisted-intent recovery gap remains open. Generated content does not fix it; do not accept G2 while the intended fault/reload contract is unsatisfied.

## Acceptance and evidence

| Check | Required result |
|---|---|
| Repeatability | Same seed plus same catalog/template revisions produces identical canonical case output, regardless of catalog input order. |
| Meaningful variation | Across a fixed 100-seed offline sample with sufficient eligible candidates, observe at least two location pairs and both outlines, with fact/text/reference differences beyond names alone. Archive selected IDs and outline counts. |
| Coherence | Every generated reference resolves; chronology/codes/names agree; intended conflicting claims remain attributed to their sources, not contradictory canonical facts. |
| Eligibility and scarcity | Rejected/unknown/wrong-map candidates are excluded; insufficient sites or exhausted attempts produces no partially committed case or fixed-site fallback. |
| Knowledge boundary | Initial, partial and reordered discoveries disclose only known text and connections; no hidden case truth or completion signal appears. |
| Persistence | Round-trip retains facts, resolved evidence and target identity; catalog/template changes never silently reroll an existing case. Size/rejection checks preserve the last valid root. |
| Live composition | Owner manually discovers real automatically placed items and saves/reloads. Token identity, duplicates, invalid containers, unloaded coverage and adapter faults retain the proven contracts. Mocks do not supply this verdict. |
| Playtest | Owner plays at least two different generated cases and reports whether leads are understandable, accounts are interesting and discovery fits survival. Failure leads to a bounded revision, not more manual site approvals. |

G1 finishes with an offline generator, small catalog/template fixtures and meaningful tests. G2 finishes only with observed engine evidence, including unresolved recovery work. G3 evaluates the experience; passing G1 cannot be called a generated playable mod.

## Explicit exclusions and budget discipline

No large database population yet, generic content-pack schema, runtime AI, graph/theory UI, multiplayer, old-save retrofit, migrations or broad Workshop-map support. One built-in case per new save; ongoing campaign scheduling is deferred.

G1's logic is now in dev/generated-investigation/; finish its real-catalog validation after the owner's list arrives. Reuse existing research and tests; do not restart the project audit. Expand only when the previous increment's evidence justifies it.
