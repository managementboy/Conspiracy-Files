# Review of Claude's writing-rebuild report

Reviewed source: `ebdd706` on `main`, including the report, its cited evidence, the room-affinity fixture and the prototype update path. This is source/evidence review only. No tests or game runs were executed, and the ongoing Linux campaign run was not controlled or interrupted.

## 1. Room affinity: accept the narrower claim

Keep the revised expectation: with enough eligible distinct containers, an unrecognised room name must not prevent placement or cause two clues to share a container. Do not restore the requirement that the first container wins. Seeded selection and kind diversity deliberately replaced that rule in the room-aware path.

`test/room_affinity.lua` still checks positive room preference, fallback, uniqueness, duplicate-container handling and the separate no-hints sequential path. `test/storage_variety.lua` checks that repeated counters do not change a kind's selection weight. The recorded mutation disabling `RoomAffinity.prefers` is useful evidence that preference coverage is not vacuous.

Two comments remain stale: the file's introductory section-3 summary and the section-3d heading still promise the exact sequential fallback that the assertions correctly stopped requiring. Correct those comments. No production behavior needs changing for this review point.

## 2. Updated markers: the report misdiagnoses the failure

The useful behavior is to flag previously known evidence whose interpretation gains a newly supported finding. The new document does not need an updated flag merely because it was just discovered. Source wording must remain immutable.

However, this is already the intent encoded in the prototype:

- `dev/next-phase/InvestigationFlow.lua:99` selects the other endpoint of a newly revealed relation and requires it to have been known before the new discovery.
- `dev/next-phase/InterpretationUpdates.lua:15` validates that the affected endpoint is the earlier one in discovery order.
- The forward and reverse assertions in `test/investigation_flow.lua` match that behavior.

The actual integration mismatch is upstream: `InterpretationUpdates.derive` still reads `doc.links` (line 9), but `Generated/Story.lua` creates documents with `links={}`. Current authored connections are derived by `Generator.project` through `Story.project`, with their source requirements. The old reader therefore derives no update events for these generated cases. The report's assertion that the implementation flags the new comparison-making document is not what the code does.

Keep the tests' older-record expectation. Repair the prototype's relation derivation against supported story comparisons; do not simply switch a source ID to a target ID. Discovery order can be reversed, and a third source can enable a comparison between two already-known documents. Compare supported findings before and after discovery, retain stable event identity, and notify the affected previously known records. Preserve expiry, reload validation and idempotence. Cover both discovery orders, the three-source gate and rereading without extending the timer. Audit the prototype's remaining three-document assumptions while adapting it to the current generator.

This is unshipped integration work. It is not evidence of a shipped organiser defect, and it does not need an invented new product decision just to preserve the already-tested older-record semantics. Correct `DECISION_UPDATED_MARKING_2026-09-21.md` accordingly.

## 3. Destination coverage: downgrade the claimed PASS

`20260920T231143-map-coverage-125.txt` establishes metadata intersections: 107 single-building and 18 multiple-building results, including the area overlays. Its final section explicitly says it does not establish reachable non-floor containers, actual payoff insertion or player access.

The report nevertheless marks the complete all-125-destinations gate PASS. That is broader than the evidence and contradicts the handoff's acceptance criteria. Report **geometry PASS; playable destination coverage incomplete** until the latter is observed. Do not discard the useful geometry result or infer that the destinations fail; neither conclusion follows.

## 4. Save-size ceiling: the claimed upper bound is not established

`20260921T104410-save-budget-ceiling.txt` extrapolates an average generated-case size to the 16-case cap. That is not an aggregate-save upper bound.

`SaveBudget.lua` budgets generated cases alongside map-media state, discoveries, addresses, identities, visits, markers and other roots. The 125 map designs are independent of the ordinary case cap. `test/map_feature_budget.lua` already constructs combined campaign, all-map, print-read and discovery states with an additional allowance. Also, an average of 200 cases does not bound the largest permitted case, and an independent text serialisation count is not a native binary-save measurement.

Keep the existing useful measurements, but withdraw the assertion that 600 kB, 800 kB and 1 MB are impossible. Record the combined fixture's totals and measure a validated aggregate state in the game. If a demonstrated maximum legal aggregate state is below a requested point, report that specific point as not applicable with the bound. Do not raise caps, delete history or alter the allowance merely to manufacture a measurement.

## 5. Campaign: preserve the running evidence, repair the stale acceptance fixture

An increasing scheduler-step count proves execution, not useful progress or eventual completion. Retain phase/cursor progress, terminal outcomes and actual case counts. The current live run's status was supplied by the owner; it was not independently polled in this review.

The checked-in campaign fixture also retains assumptions from the previous design:

- `campaign.sh` requires a literal `Duty log / ` title from answer steering. The current requirement is a compatible authored contribution without rewriting the event, not an obligatory document title.
- Its archive checks and `campaign.lua` still describe older evidence becoming rowless stubs. The current contract retains full evidence history.
- The archived run reports “only 5 of 3 clues could be played”. Inspect `PLAYED`/`CASE_LEFT` bookkeeping against stable case/document identities before treating that count as a product failure. The script does not simply hard-code three here; it compares two counters.

Let the present run finish and preserve its observations. Before treating a later run as acceptance, align the harness with the current requirements: real case progression, compatible steering, essential-source completion, retained rows/answers and save/reload integrity. Do not restore old runtime behavior to satisfy stale expectations. These fixture problems do not prove the separate preparation problem is fixed.

## Accountability and next action

My earlier declaration that implementation was complete was too strong. The disconnected physical-object path and the lack of authored agreement/disagreement were substantive omissions; Claude's repairs were necessary. Neither passing structural checks nor writing this handoff established the full player experience.

Claude should continue owning the current build/testing phase. Accept the room-affinity change; fix the prototype integration and stale campaign assertions; correct the destination and storage gate labels; finish the unexercised gameplay checks. The owner-authorised Workshop development build can remain accurately described as playable and unvalidated. No new implementation round trip through the owner is needed for these concrete corrections.
