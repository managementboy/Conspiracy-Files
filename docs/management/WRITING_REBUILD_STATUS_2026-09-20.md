# Writing rebuild: scope, ownership and progress

**Current state: source implementation complete for the Linux build/testing phase.** Use [the single Linux handoff](WRITING_REBUILD_LINUX_HANDOFF_2026-09-20.md). `b4d9a02` saves the final source integration; the later handoff commit records completion of the static review. This is an unvalidated fresh-save candidate. The progress sections below are historical snapshots, not the current outstanding-work list.

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
- Generator now uses initial two-variant drafts for the opening, its continuation, and five ordinary families (`transfer-nobody-arranged`, `signed-by-someone-absent`, `two-start-dates`, `resignation-after-payslip`, `address-that-only-receives`). **Initial checkpoint: 7 of 22 families. Current checkpoint: 22 of 22**, after the correspondence batch below. This is not full implementation or a completed editorial pass. All generated families now have drafts. The later checkpoint below removes the obsolete prose fallback and adds drafts for all 17 map families; destination and editorial work remains.
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

## Event-only generator and map-story checkpoint

`Generator` now requires an authored scenario for every generated family;
`Premises` is a metadata/selection registry only. The competing generic role
and premise-prose paths have been removed. Revision `g15-event-stories-2`
requires three essential sources. Source-only projection has no fallback that
reveals an undiscovered document title. A returning business selects an event
actually authored for that business; it cannot rename another business's
operation. Unsupported business requests return an explicit refusal. This
selection and refusal path is source implementation, not an executed result.

The first ten ordinary variants received a second editorial pass:

| Family | Variant one | Variant two |
|---|---|---|
| Transfer nobody arranged | McCoy moves a roadside repair bill to the mill without moving the mechanic | U-Store It reports a claims team by dividing one clerk and counter into two headings |
| Signed by someone absent | Fossoil's account-name rule requires the colleague receiving fuel to sign the absent holder's name | Sunstar authorises a manager signature stamp, then locks it away after a complaint |
| Two start dates | McCoy recognises prior experience for training but resets the meal allowance | Fossoil's billing transfer creates a duplicate uniform deposit, subsequently refunded |
| Resignation after payslip | Sunstar prepares a departure after a cook refuses an unpaid inventory shift, then obtains the resignation | U-Store It's locked resignation form makes a postal round trip after notice, final shift and pay |
| Address that only receives | McCoy requires a destination receipt before releasing a belt, so the foreman signs in advance | Sunstar counts a transfer between storeroom shelves as a second delivery and charges its kitchen |

All ten now answer their local question without a manufactured unanswered
administrative detail. Their first-person notes react to the observed document;
comparisons depend on the relevant sources. Relative dates were checked against
the generator's variable one-to-nine-day gaps. These are authored incidents;
McCoy, U-Store It, Fossoil and Sunstar business activities remain grounded in
the archived vanilla print catalogue, not proof of these fictional events.

`MapMediaServiceStories` and `MapMediaCivicStories` provide four distinct source
records for each of 17 map families. Named businesses have causal roles, and
ordinary destinations hold recipient copies rather than being silently turned
into those businesses' premises. The gallery event uses the real Art Gallery
of Louisville, Ashling Dwyer and Natalie Sigmundsson context; it does not claim
the old records establish the artworks' current safety. The incidents resolve
local booking, service, billing or reporting failures without explaining Knox.

`MapMediaContent` revision 2 selects a coherent family from printed context,
whole annotation words or an explicitly permitted family list. A generic
recipient-copy pool remains for otherwise unclassified maps: **this is not a
completed per-map editorial review**. Map state schema is 2 for fresh saves.
Findings require actual noted parts: 1+2 on row 2, 3+4 on row 4, all four for
the full comparison. Destination-first discovery cannot quote unseen sources.
Native pages contain only the authored source, including after a profession
observation; specialist commentary is restricted to the supported source part.

The content regression draft covers all 125 real bindings and separate explicit
fixtures for all 17 families, including all 16 discovery subsets. That is
**content rendering coverage only**, not a claim that all 125 destinations
exist. Archived native evidence still reports 11 zero-building designs, nine
multi-building designs and no actual shared destination. All-three-part travel
implementation, provenance and actual shared-destination authored content remain
open; the old runtime placement filter is still separate from StorageChoices.

Closing-question headings, answers and survivor notes now occupy a bounded
line window. Long option lists reserve a scroll gutter and remain inside the
LCD. Question popups scroll via rocker, arrows or drag without changing an
answer; a tap selects it. SETUP retains its immediate-apply rocker behavior.
The popup and drag regression drafts cover viewport bounds and separation from
the underlying record. Static review corrected a gutter-width mismatch that
would otherwise have clipped short, non-scrolling popup text. Native rendering,
font sizes and touch/keyboard interaction remain Claude's acceptance work.

The offline editorial exporter now includes generated cases, every map family
and real catalogue selection at a fixed preview seed. It has not been run.
Drafts for questions, source projection, calendars, opening/continuation and
archive preservation were updated. More old optional-role/steering assertions
still need reconciliation after their implementation is complete. No Lua,
tests, compiler, build, exporter or game was executed in this checkpoint.

## Final source review and handoff

The former implementation checklist is superseded by the source completion audit in [the Linux handoff](WRITING_REBUILD_LINUX_HANDOFF_2026-09-20.md). All 22 generated families (44 event variants), 17 map families and the Speedway-specific event are implemented. The later checkpoints also cover the eleven area destinations, real shared restaurant pair, map storage variety, optional physical evidence, supporting prose, retained history and UI integration. These are source-completion claims, not native acceptance results.

The last integration review confirmed:

- Optional sources compare against their actual authored event in the regression drafts, with positive physical/listen coverage; their notes no longer rely on undiscovered companion sources.
- Source copies name their actual filing origin. Mixed numbered/unnumbered destinations receive a direction from that origin. A follow-up resolves the earlier file's address from a known retained source; `PlaceNames.context` creates only a temporary view. `SuccessiveCases.sessions` returns safely when its wrapper is unavailable.
- Map fill observation is tied to the actual container object, so a replacement at identical coordinates cannot inherit permission. Canonical targets remain plain tables.
- Native placement checks scope interruptions to design/part, observe the recorded boundary, require positive insertion and distinguish inconclusive/unobservable cases. They remain unexecuted drafts.
- The handoff's commands exist and cover compilation/unit checks, story previews, packaging and the revised placement fixture. No command was executed in this pass. Source inspection, an encoding scan, `git diff --check` and AST-only graph refresh are the available evidence.

Build version: `DEV-0.46.0-writing-rebuild`. Claude now owns the single build/testing phase on fresh saves, including all-map native coverage, loot/manual-read travel, save/load, actual scan cost, UI and humour/readability acceptance. Generic recipient correspondence does not mean 125 unique stories; source footprints do not prove reachable containers. Those limits are explicit in the handoff.

All work is local on main. No push, package, boot, test run or publication is implied by completion of implementation.
