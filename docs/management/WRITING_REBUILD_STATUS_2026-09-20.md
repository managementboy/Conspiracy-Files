# Writing rebuild: scope, ownership and progress

Owner objective: audit all writing before passage edits; give every mystery an event; make evidence reveal different parts; separate document and survivor voice; vary coherent scenarios; establish one complete example and apply the standard everywhere. Claude continues repairing/building/testing the earlier code. Do not collide with that work.

## Workspace and integration agreement

**Current owner instruction:** Claude has stopped, and the owner authorised
integration into main. On 20 September, fetched `origin/codex/map-media` at
`ba917eb`, fast-forwarded local main, then merged writing `d4a0ff4` with merge
commit `2137cac`, without conflicts. Implementation now continues in
`Conspiracy-Files` on local `main`. No push, release or build was part of this
merge. The archive worker finished in the writing checkout; its two source
modules and new regression draft were reviewed and transferred. Further bounded
work now uses main. The old worktrees remain intact. The bullets below record the isolation
used before that authorisation, not a continuing prohibition on main work.

- Writing branch: `codex/mystery-writing`, isolated worktree `Conspiracy-Files-writing`.
- Baseline: `a65ce46` from `origin/codex/map-media`, includes Claude's DEV-0.45.1 changes.
- Upstream tracking was removed from the writing branch to prevent accidentally pushing writing changes onto Claude's branch.
- Claude retains the map branch and native build/testing work. Codex does not edit its worktree, reset its commits, reuse its release tag, start a game, or publish a build.
- No message has been sent to Claude by this task. This document records the local boundary, not a claimed agreement received from another agent.
- Before integration, fetch again, inspect Claude's changes, reconcile deliberately in the writing branch, and supply one complete implementation handoff. Preserve its fixes and tests. Runtime integration seams may overlap later even though worktrees do not.

## Progress

- Completed source audit across current story producers and presentation paths: [writing-system audit](../design/WRITING_SYSTEM_AUDIT_2026-09-20.md).
- Established a complete authored reference, with an underlying event, three distinct contributions, discovery subsets, personal voice, local answer and coherent variation rules: [personal collection example](../design/WRITING_REFERENCE_PERSONAL_COLLECTION_2026-09-20.md).
- Owner's two follow-ups are recorded in `DR-20260920-WRITING-GROUNDING-TONE`: actual named businesses with causal roles, and Q24's fatalistic bureaucratic dark comedy throughout. Both are in the audit and agent instructions.
- Added `Generated/Story.lua`: separate authoring fields for observation/source/survivor note; compatible optional sources; explicit knowledge requirements for comparisons; essential-source ending; notification of a new finding in any discovery order.
- Generator now uses initial two-variant drafts for the opening, its continuation, and five ordinary families (`transfer-nobody-arranged`, `signed-by-someone-absent`, `two-start-dates`, `resignation-after-payslip`, `address-that-only-receives`). **Initial checkpoint: 7 of 22 families. Current checkpoint: 22 of 22**, after the correspondence batch below. This is not full implementation or a completed editorial pass. All generated families now have drafts; the obsolete generator fallback and premise metadata still need removal. All 17 map families still need rebuilding.
- Opening uses a borrowed McCoy vehicle; its cancellation variant diverts it to a mill drive belt. Personal recognition is gated on the named notice. Source dates now distinguish the trip day from the later filing day. Follow-up carriers preserve source person, organisation, survivor and documentary cutoff; the selected-site generator now actually passes the `follows` input.
- Retirement freezes the authored readings and suppresses closing choices/continuation when essential evidence was missed. Runtime connection voice uses supported findings instead of treating every context link as agreement. Generic physical labels no longer call every note a dispatch document or every notepad a review.
- Authored `test/personal_story.lua` for Claude: discovery permutations, withheld ending, source-only native pages, caller-copy isolation, saved-gate corruption, actual selected-site generation and continuation identity/time. **Not executed.** Existing g13/premise-text test assumptions still need revision before the final handoff.
- Static source review and `git diff --check` only. No Lua tests, compilers, builds or game run. `graphify update .` initially failed with Windows access denied, then completed successfully with filesystem escalation (AST-only). Graph generation is not functional verification.
- Claude's later work through `ba917eb` is now included: placement failure regression and shared-destination mechanism coverage. Its game finding is an outstanding content requirement: none of the currently shipped map designs actually share a destination building, so the real shared-destination content gate remains unfulfilled.

## Main implementation checkpoint after integration

- Replaced the weak personal follow-up with two coherent source chains: unanswered enquiries converted into booked places to meet a print deadline; or an enquiry contact copied into a passenger field because the form had no contact field. Both preserve the original name, reference, message clerk, company and documentary cutoff. The remaining unknown is who supplied the name, rather than an invented survivor memory.
- Full retirement now retains source rows, geographic context, reference, discovery order, last-seen information and answers. Removed age-based row deletion and its separate schema. A follow-up must reference retained discovered evidence. Fresh saves required; no migration path.
- Closing people/company options are drawn from discovered source text. Missing essential sources suppress authored closing readings and follow-up. Native pages resolve addresses after removing observation/interpretation; the journal resolves retired evidence from its retained context.
- Authored archive regressions cover each missing essential source, malformed source context, retained findings, and a budget fixture derived from the live allowance so an increased allowance cannot silently bypass the limit. Existing archive/headroom/full-map tests now measure four live plus twelve full retired cases. These are source drafts for Claude, **not test results**.
- Static review caught and corrected runtime readers that assumed every `Cases.find` result still had a live case envelope. Build/game/runtime verification remains entirely with Claude, after the full implementation.
- Main checkpoint static verification: `git diff --check` passed. AST graph refresh completed (11,353 nodes / 16,078 edges) using the installed graphify Python module after the executable launcher failed. This is source indexing, not Lua compilation or functional testing. No tests, builds or game runs were executed.

## Inventory and account stories: next five families

`InventoryScenarios.lua`, exposed through `OrdinaryScenarios.get`, adds two
coherent variants each for `identical-inventories`, `room-not-on-the-plan`,
`lease-outlived-tenant`, `load-that-got-lighter`, and `fuel-for-a-dead-truck`.
Each has three essential sources with separate observations and survivor notes,
two intermediate comparisons, and an all-three-source local conclusion.
The named businesses perform their verified activities; transactions, staff,
forms and disputes are explicitly authored fiction. Bound A/B locations retain
copies and are not asserted to be canonical business premises.

| Family | Variant one | Variant two |
|---|---|---|
| Identical inventories | One load moves out of a leaking unit; two open files keep charging | Copied inventory clears a deadline and invents a contents-protection charge |
| Room absent from plan | Linen storage counts towards a motel occupancy target | A diner repair job number is posted as a guest-room number |
| Lease outlives tenant | An unprocessed drop-box key keeps rent running | Office promotional stock occupies a departed tenant's unit at the tenant's expense |
| Load gets lighter | Receiving weighs the tractor without its loaded trailer | An urgently needed mill motor leaves a lumber truck before the destination weighing |
| Fuel for unusable truck | Its card buys fuel for the relief truck | A dismantled van's account supplies the vehicle number a generator-fuel form requires |

`tools/export_story_samples.lua` is an offline Markdown export for Claude's
later review. It derives actual converted/uncovered IDs from the premise pool,
exports both variants, and binds the organisation from each scenario. It also
shows optional sources and the requirements for each comparison. It does not
claim map-family coverage. `test/story_family_contract.lua` explicitly expects
12 converted / 10 uncovered generated families and checks source-only native
text, all source subsets including optional sources, all six anchor discovery
orders, unknown-dependency rejection and unresolved placeholders. Neither has
been executed. Primary review replaced the worker's initial vacuous comparison
checks before accepting these drafts.

Vanilla grounding was rechecked against the archived primary catalogue:
`McCoyLoggingCorp`, `UStoreItMuldraugh`, `SunstarMotel`, `Fossoil1` in
`docs/research/vanilla-print-2026-09-19/catalogue.json`. No new engine capability
is assumed by these scenarios.

## Administrative stories and placement direction

`AdministrativeScenarios.lua` adds two variants each for `returned-cleaner`,
`two-crates-one-number`, `paid-before-ordered`, `overtime-nobody-worked` and
`closure-announced-twice`. The shared ordinary selector now exposes these data
through the same story contract; no separate placement or interpretation engine
was introduced. One optional customer letter contributes to the radio-exchange
story only after its required exchange record is known.

| Family | Variant one | Variant two |
|---|---|---|
| Returned cleaner | Circuital Healing exchanges cleaned radios after their labels come off | Lenny's counter mistakes READY FOR TEST for READY FOR COLLECTION |
| Two crates, one number | Hobbs & Perkins reuses one crate before crediting its return deposit | Lectromax dispatches unfinished blanks under a job number mistaken for completion |
| Paid before ordered | A worker's advance deposit secures roof materials before requisition approval | Louisville Bruiser's stock WINNER bats are prepaid participation prizes |
| Overtime nobody worked | Lectromax codes compulsory home standby as an on-site shift | Circuital Healing's eight-hour time-clock test is billed as eight hours of labour |
| Closure announced twice | Volunteers survey the closed CGE building for a proposed museum | Staff maintain the decommissioned bunker's tour display while admission remains suspended |

These are mod-authored events, not claims about canonical incidents. Business
activities were rechecked in the archived vanilla print catalogue. The family
contract now explicitly expects **17 converted / 5 uncovered** (34 variants),
while the exporter discovers its actual coverage dynamically. Tests and exporter
remain unexecuted.

The owner then relayed the placement research. Remote main's two new documents
were merged as `10154ba` without changing the ongoing story work. The placement
note is now included in the full implementation scope (decision
`DR-20260920-WRITING-PLACEMENT`). Its six-kind filter and first-eight candidate
cutoff were confirmed in `Generated/Storage.lua`; broadening them has not yet
been implemented. The historical PM handoff's claim that cases never reach any
conclusion does not override the current owner objective: bounded local findings
are required, while a definitive explanation of the Knox Event remains excluded.

## Correspondence stories and storage variety: implementation checkpoint

`CorrespondenceScenarios.lua` completes initial two-variant drafts for all 22
generated families (44 variants): early appointments, signed-out files, missing
ledger pages, unnamed photographs and withdrawn telephone extensions. The
underlying events involve Crossroads Medical Center, Spiffo's Louisville,
Sunstar Motel, Scarlet Oak Distillery, Wellington Heights Golf Club and the
March Ridge bunker tour display. Logan Barton's coaching role and 1992 Riverside
Classic result are in the archived vanilla `WellingtonHeightsGolfClub` record;
the photograph incident is authored fiction. All ten variants have a bounded
local answer. `Story` no longer forces a spurious unanswered question after an
answered local mystery. Supplied unanswered questions still require valid text;
retirement retains the actual readings, and the sample exporter distinguishes
closed local questions. No definitive Knox explanation is introduced.

The placement implementation now uses `StorageChoices`: actual identified
non-floor furniture kinds, eight kinds with up to eight physical targets each,
and four additional vehicle parts under the existing mobile-clue cap. Full
room scanning continues after eight counters and reaches the existing mailbox
band. Catalog validation accepts these observed kinds; floor, untyped inventory
and reserved carrier/vehicle identities cannot enter the furniture path.
Room and occupancy preferences remain; ties use prior kind usage and a seeded
per-kind choice, so more cupboards do not receive more votes. Deferred-placement
and relocation scans also retain varied candidates instead of returning at the
first usable container. No contents are valued and no vanilla loot is added or
removed. Unrecognised engine type IDs without a game title read as “a container”.

The first reachable level per site, outdoor mailbox footprint, one clue per
container and exact target re-resolution remain. Broader floor/environmental
placement is not part of this step. Existing identity scans observe moved items
when found and mark repeated misses uncertain, retaining last-seen information;
they do not prove loss or guarantee tracking furniture carried beyond the scan.
Native pickup/dismantling and expanded scan latency need Claude's game checks.
The full-scan change increases total work even though each scanner step remains
bounded; no performance or placement acceptance is claimed.

Draft regressions cover closed-story retirement, all 44 variants, diverse
storage, metadata alignment and the old mailbox constraints. These are authored
source, not executed results. The remaining editorial, map and UI work below
still blocks the single final testing/build handoff.

## Implementation still required

1. Finish the editorial pass across all converted families, especially the first seven: some ordinary drafts still read like stock administration, their remaining questions can be arbitrary, and metadata must be checked against revised source text. All cases must have a meaningful comic situation and consequence. Structural validation cannot certify humour or a coherent story.
2. Complete opening/continuation integration: verify inherited routing and readable locations outside the numbered address catalogue; finish bounded question-screen wording. The new follow-up explains how an enquiry became a booking without a passenger reply on file; it still cannot identify the original caller. Native address resolution, source history and closing-choice knowledge gates have implementation drafts, not executed verification.
3. Apply the event contract to all 17 map families, preserving all destination coverage. All 22 generated families now have two scenario drafts. Replace legacy premise prose/old role generation after coverage is complete, rather than leaving two competing authoring truths.
4. Replace unrelated optional-role selection everywhere; review relay memo/call-in integration, identities, keys and physical-object prose. Existing legacy dead-air content also needs the agreed tone/voice pass.
5. Complete UI behavior and verify archive integration: source-row deletion has been removed; retired cases retain locations and reference, and native pages now use the same place resolvers as the journal. Closing-question layout remains unfinished. Keep the 1,000,000-byte provisional aggregate budget and honest admission failures without silent loss. The 16-case/full-map worst-case budget fixtures now retain all history; their fit is unverified until Claude runs them.
6. Review and measure the new non-floor placement/variety implementation with Claude after the full rebuild. Source now retains eight kinds with up to eight targets each; seeded selection prevents repeated counters receiving extra votes. Native capacity, moved/dismantled containers, scan cost and first-case placement variety remain unexecuted acceptance checks.
7. Revise obsolete test assumptions and extend the new transitional family contract and editorial exporter to full coverage. The exporter and regressions are authored but unexecuted; they do not certify narrative quality. Reconcile current map fixes, then hand over the complete implementation once for Claude's builds and tests.

The full goal remains active. Audit and reference completion do not mean the writing has been fixed in the game.
