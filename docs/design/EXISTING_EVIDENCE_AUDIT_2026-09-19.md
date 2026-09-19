# Existing evidence and generation audit — 19 September 2026

**Source audited: `edf55d3`, DEV-0.44.0-addresses-that-travel. Planning only: no gameplay code or content changed.** The owner requested this investigation here before handoff, rather than passing the audit itself to development.

## Finding

The system generates convincing objects and bureaucratic disagreements, but does not guarantee that a mystery advances the survivor's search for an explanation of Knox. Dead Air already concerns communications and suppressed reporting. Most generated premises stop at a discrepancy; optional clues repeat uncertainty; subsequent cases reuse names without carrying a specific factual question forward. Completion and archive rules can then remove evidence needed for cumulative understanding.

Preserve physical discovery, deterministic generation and the distinction between facts and claims. Revise narrative selection, payoff and retention before adding more interchangeable texts. No definitive Knox cause, culprit or hidden correct theory is needed.

## Scope and evidence

Read all 20 premise families: claim, response, review, corroborating/disputing branches, interpretations and alternative readings. Also inspected the shared optional templates, relay memo, radio transcript, all six Dead Air document bodies and optional key definition, generation/projection logic, runtime first-case/steering/completion paths, session expiry, retirement, answer steering, document-page separation, object rules and key-connection primitive. Inspected existing premise-consistency and steering test contracts. The 25 occupation designs remain proposals, not existing gameplay.

Graphify was queried first, but produced no result while running and was interrupted; source inspection supplied the evidence. No Lua executable was found on PATH in this check. This is a source audit, not a new live test or exhaustive execution of every seed. Historical drafts are context; current runtime text wins when they differ. The vanilla inventory was reused, not repeated.

### Source map

Numbers below are line references at the audited commit.

| Source | Relevant scope |
|---|---|
| [Premises.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Premises.lua) 1–66, 70–593 | Narrative rules; 20 families and both branches. |
| [Generator.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Generator.lua) 190–282, 290–758, 780–950 | Calendar, render, random choices, optional roles, steering, validation and projection. |
| [Content.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Content.lua) 78–374 | Dead Air documents and B-37 key. |
| [RelayMemo.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/RelayMemo.lua) | Memo reuse and nine-day coincidence. |
| [Questions.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Questions.lua) | Readings, person/organisation focus, approach, survivor note. |
| [GeneratedRuntime.lua](../../mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua) 528–555, 610–650, 1035–1065 | First house/partner, memo/name/steer inputs, retirement. |
| [Session.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/Session.lua) 275–318, 532–579 | Expiry, dropped clues and accounting. |
| [SuccessiveCases.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/SuccessiveCases.lua) 55, 368–409, 444–482 | Capacity, continuation commit and answer selection. |
| [RetiredCase.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/RetiredCase.lua) 18–60, 218–260 | Retained answers and deep-archive losses. |
| [EvidenceRoles.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/EvidenceRoles.lua), [ObjectRules.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/ObjectRules.lua) | Carrier/capacity constraints and object eligibility. |
| [DocumentPages.lua](../../mod/common/media/lua/shared/ConspiracyFiles/Generated/DocumentPages.lua), [EvidenceRows.lua](../../mod/common/media/lua/client/ConspiracyFiles/EvidenceRows.lua) 91–110 | Source versus interpretation, unseen hints, date notes. |
| [KeyConnection.lua](../../mod/common/media/lua/shared/ConspiracyFiles/KeyConnection.lua) | Observed name/key/door/building inference. |
| [premise_consistency.lua](../../test/premise_consistency.lua), [case_steer.lua](../../test/case_steer.lua) | Existing chronology/branch and deterministic-steering checks. |

## 1. Actual generation path

1. Seed chooses a premise, then independently chooses corroboration or conflicting account. Selection has no central-question, starting-profession or personal-history input.
2. Draws two people, an organisation, reference and historical calendar. Previously encountered names can enter the cast; a returning person/organisation can replace a draw. Saved inputs preserve reconstruction, but shared spelling is not shared factual history.
3. Creates claim at A and response at B. Seven premises always retain review; 13 may omit it. Optional evidence is shuffled into a bounded case, excluding some incompatible combinations. Two documents can be the minimum; no local-payoff contract is checked.
4. Adds generic context, named objects or quantity discrepancies. These attach to claim/response, generally without a distinct central question.
5. First generated case appends the Dead Air access memo at B with **empty links and leads**. Later date notes mark its nine-day window. The named Relay Site 31 is not thereby bound to a reachable destination.
6. Later cases may use the newest unused answers: returning name, approach and reading. The next premise remains independently selected. Reading affects optional evidence, not the principal outline. Listening adds a written call-in transcript; it is not live radio interaction.
7. Inspect records evidence. When every document is known or dropped, retirement can follow. Deep archive keeps IDs and answers but drops evidence rows and their connections. Neither transition establishes a narrative resolution.

## 2. Priority findings and repairs

### A. The old rule forbids too much local resolution

Premises.lua requires two readings, says meaning must never assert a conclusion, rejects plots and says nothing can be witnessed. Even matching rosters or calibrated scales receive another hypothetical sinister explanation. This predates revised Q04.

**Repair:** allow bounded local facts and supported local motives. Preserve ambiguity where evidence actually supports alternatives. Do not give every mundane explanation an unfalsifiable sinister twin. Update source comments alongside future implementation; the central cause remains unanswered.

### B. No central-question contract or personal opening

Random premise/organisation/role selection does not require evidence about arrival, isolation, missing aid, communications or authority. The first case uses a current eligible house and a second loaded site: geography, not an explanation of arrival. A limited search of Lua for helicopter/rescue/evacuation found no matches; this supports, but alone does not prove, the semantic gap.

**Repair:** select a supported central question and bounded local event before compatible roles. Snapshot relevant inputs. A transport cancellation or dated departure can contribute without every document naming the outbreak. Never invent a helicopter observation for the player.

### C. Returning names are not a continuing investigation

Steering retains `fromCase`, reading, approach and at most one returning person/organisation. It does not retain the sourced question the next case must investigate. Replacing an organisation also bypasses the premise's normal organisation pool without demonstrating semantic role compatibility.

**Repair:** carry a discovered source and specific unresolved question. The next case adds, narrows or challenges an attributed claim. Preserve entity identity, role and chronology, not just a name. Player theories remain interpretations, not world facts.

### D. Automatically opposing a reading can be weak or predictable

The `LEAN` selection offers disputing records/piles after the ordinary reading and a duty log after the other reading. Keeping the main outline unchanged is good. But prepayment does not contradict every ordinary account, and a day-only ticket cannot prove simultaneous presence elsewhere.

**Repair:** approaches guide investigation; evidence has independent meaning. Admit a contradiction only when propositions, times and scope actually conflict. Otherwise use contextual comparison. No blanket counterevidence merely because the player chose a theory.

### E. Dropped clues can permit retirement without an ending

Session.accounted accepts known or dropped documents. Deferred/missing evidence can expire after three in-game days. There is no separate payoff-sufficiency check there. An ending-essential response/review may therefore be absent when remaining discovery allows retirement. Avoiding the UI word “solved” does not restore the lost payoff.

**Repair:** distinguish locally resolved, meaningfully ambiguous, incomplete/blocked and administratively retired. Schema is for development. Essential evidence cannot become delivered through expiry. Renew discovery opportunities under Q12/Q23 while preserving known geography; do not require every optional clue or expose hidden counts.

### F. Archive drops the cumulative investigation

The deep-archive stub removes text/title, leads/connections, location and last-seen details. It keeps known IDs, offered choices and answers. Four full archived cases is current configuration, not today's approved final policy.

**Repair:** preserve compact sourced findings and unresolved connections before pruning prose, plus player notes and recovery provenance. A dated attendance record does not prove someone survives now. Measure storage and maintain new-character knowledge boundaries.

### G. Historical calendars cannot answer current-event questions by themselves

Generator.calendar ends by July 8; existing tests enforce that span. It can support prior preparation, but cannot establish a later distress acknowledgement or a helicopter event in this playthrough.

**Repair:** separate historical records, attributed later records and player-observed events. Extend chronology only for stories needing it after verifying the relevant game timeline. Deliberately update test assumptions; never silently redate learned evidence.

### H. Objects need a specific evidential purpose

Named objects and key observations are promising. Piles compare physical count with an appended lower stores count. But generic “Nobody needs” claims assert significance without context. Proximity to a file and random bulk are not explanations of absent help. The dust-mask incident remains a plausibility report, not a proven duplication defect.

**Repair:** choose objects for a custody/event question. Support condition/mark/count in actual world state. Bulk must exist plausibly before inspection or use another carrier. Do not assert used/contaminated merely from an item category. No revival of arbitrary suspicion bookmarks.

### I. Preserve existing strengths

DocumentPages separates source wording from interpretation. KeyConnection uses four observed facts and limits ownership/authorship claims. Deterministic revision checks protect evidence from silent rewriting. Apply that discipline to central links: an acknowledgement is not proof of rescue capacity or a promise to evacuate everyone.

## 3. All 20 premises: retain the structure, repair the purpose and payoff

Each row covers both corroborating and disputing versions. New documents/events are **proposals**, not approved fiction or implemented facts. The local payoff column describes the revised trail, not what existing texts already prove. A mundane explanation can still reveal something important about a wider response failure.

| Premise / source line | Existing evidence and gap | Proposed local payoff and necessary evidence | Central relevance and boundary |
|---|---|---|---|
| `transfer-nobody-arranged` / 70 | Transfer notice, roster, closed review; requester/actual arrival unresolved. | Dispatch or handover establishes a particular reassignment and who processed it. Agreeing branch can establish arrival; disputing branch can establish failed/rejected transfer through independent evidence. | Why am I here / where did people go? Personal variant needs a character-bound object, not simply putting the survivor's name into a stranger's story. No mass-abduction conclusion. |
| `signed-by-someone-absent` / 94 | Delivery signature versus attendance/funeral account; even agreement is doubted. | Dispatch stub and custody record identify a proxy signer and accepted delivery, or establish failed handover. | Why did supplies/help not arrive? Resolve one missed consignment, not the whole relief effort. |
| `two-start-dates` / 119 | March employment versus November union entry; missing months remain empty. | Secondment/payroll attachment establishes an intervening assignment; dispute can leave a narrower interval unresolved. | Who knew/prepared? A communications assignment must fit the person's role. Early employment is not foreknowledge of Knox. |
| `resignation-after-payslip` / 148 | Letter/payroll reconcile or disagree; authorship stays unknowable. | Forwarding instruction and attributable roster establish departure or administrative removal; coercion only if supported. | Why did people leave / help withdraw? A specific staffing loss may explain one service failure, not who caused Knox. |
| `address-that-only-receives` / 173 | Deliveries, utility record, reinstated route; no purpose for stock. | Collection ledger or observed labelled storage establishes a particular transport/communications contingency. | Was assistance being organised? One site's preparation does not guarantee rescue or prove secret biological work. |
| `identical-inventories` / 200 | Lists differ normally or duplicate a damaged crate; audit trails off. | Compare observed distinctive mark with custody/dispatch record to establish copied figures or a real transfer. | Why were promised supplies unavailable? Show one allocation counted twice, not all logistics fabricated. |
| `room-not-on-the-plan` / 227 | Room 14 versus old plan and works ledger; never settled in world. | Bind a verified real room; establish renumbering or restricted use through access/maintenance evidence. | Who operated here / what was withheld? A temporary dispatch room can matter. No invented inaccessible geometry or automatic secret laboratory. |
| `lease-outlived-tenant` / 252 | Rent, returned/reissued keys, failed inspection; actual use unknown. | Observed access and dated handover distinguish continued use from an unused paid holding site. | Am I alone / might somebody return? Past occupancy is not current survival; retain last supported date. |
| `load-that-got-lighter` / 280 | Weights and calibration; even matching weight becomes suspect. | Partial-unload receipt and route record establish diversion; valid calibration can instead settle a false suspicion. | Where did aid go? Identify a delivery/shortfall. Weight alone cannot identify passengers or biological cargo. |
| `fuel-for-a-dead-truck` / 304 | Fuel card versus workshop log; actual user absent. | Issue chit and usage record link fuel to a different vehicle or generator. | Why no collection / who could still operate? Supports diverted capacity. Never infer helicopter fuel from a generic fleet card. |
| `returned-cleaner` / 332 | Hire/return/serial discrepancy; ordinary return also doubted. | Observed serial plus repair/exchange docket establishes substitution or last recorded work site. | What happened before abandonment? Cleaning may be repair or concealment; no unsupported contamination diagnosis. |
| `two-crates-one-number` / 359 | Duplicate receipts/reprint; contents and actual route vague. | Distinctive crate mark plus routing/custody record establishes duplicate paperwork or second movement. | Where did critical equipment go? Give cargo a supported purpose, not a box asserted to explain the Event. |
| `paid-before-ordered` / 389 | Timing/signature anomaly remains uncertainty in both branches. | Standing-authority record identifies who could approve a particular preparation/rerouting, routine or retrospective. | Who knew / authorised a decision? Payment proves limited chronology, not knowledge of a future outbreak. |
| `overtime-nobody-worked` / 414 | Timesheet, empty/matching gate log, self-approved query. | Job sheet and independent handover establish a particular task or standby payment. Empty gate log does not prove empty site. | Why was infrastructure active while contact failed? Attribute one task, not collective complicity. |
| `closure-announced-twice` / 437 | Public closure versus internal wording, recovered copies; operational state unresolved. | Dated service record and physical site detail establish closure or restricted continued use. | Why did public contact stop? Separate public unavailability from internal capability; memo tense alone proves no cover-up. |
| `appointment-out-of-order` / 463 | Follow-up without first visit or normal sequence; generic medical gap. | Referral/transport record establishes a prior attendance's place/purpose or filing error. | Why am I here / where did patients go? Personal medical history needs approval. No imposed infection, immunity, experimentation or memory-erasure explanation. |
| `file-signed-out` / 490 | Initials and registry review; contents/request purpose missing. | Routing envelope or retained abstract identifies a response decision and specific custody transfer. | Who decided not to send help? Can identify an office's action; not universal responsibility. |
| `missing-ledger-page` / 517 | Cut original and surviving/missing duplicate; gap itself is ending. | Independent entry reconstructs a departure, cancelled pickup or instruction with bounded uncertainty. | Why did collection fail? Recover an event even if deletion motive remains unknown; avoid a third blank record. |
| `photograph-without-a-name` / 541 | Photo/list/agency omissions; missing name gains no purpose. | Caption correction or visitor/transport record identifies role and last evidenced movement. | Were others here? Spring photograph does not prove present survival. Do not identify the player by arbitrary substitution. |
| `withdrawn-extension` / 567 | Directory and answered/disconnected log; strongest generated communications seed. | Routing instruction and attributed call record establish that calls reached another desk despite public disconnection. | Was somebody listening / why no answer? Historical phone operation is not proof of current rescue availability. |

**Disposition:** retain all 20 as useful local structures. Unchanged texts do not yet satisfy the revised narrative contract. Best first repair candidates: transfer-nobody-arranged for arrival, withdrawn-extension for communication, closure-announced-twice for public/internal separation, fuel-for-a-dead-truck for missing help, and missing-ledger-page for recovering an event. This is bounded prioritisation, not cancellation of the remaining premises.

## 4. Shared evidence templates

| Template | Audit and proposed treatment |
|---|---|
| Tagged key | Explicitly has no confirmed lock. Keep uncertain keys where useful; progression-essential keys need verified targets/actions. Do not confuse this with the separate name/key/door observation system. |
| Private diary | Same pressure-to-sign story across premises. Add a concrete attributed observation, decision or refusal relevant to this event. |
| Shift notebook | “No normal stores entry” appears even in personnel/medical cases. Match writer's work and knowledge to the premise. |
| Press clipping | Pencilled association is honestly distinguished from the article. Preserve that, but use a relevant public statement rather than routine maintenance everywhere. |
| Affiliation/itinerary cards | Useful compact identities/dates. References need plausible physical context; a date without a time cannot establish simultaneous-location contradiction. |
| Payment/timing dispute | Broad dispute labels overstate some relationships. Require incompatible propositions or use context/comparison. |
| Duty log | Supports an attributed entry, not the entire shift or a rebuttal to every sinister theory. |
| Named/worn/out-of-place object | Give its mark/state a specific custody/event role. Proximity to a file is weak; names do not prove ownership. |
| Four bulk families | Count-versus-stores can matter. Require relevant quantities, prior-visibility plausibility, carrier and condition. Dust masks alone do not establish a secret operation. |
| Radio transcript | Written testimony about night trucks, not a live broadcast or answer to an earlier case. Add a relevant time/route/reply where needed; do not promise unsupported radio gameplay. |
| Relay memo | Strong shared source, currently disconnected metadata. Link an observed authorisation/site/task to a concrete question; matching dates are not causality. |

## 5. Dead Air: strongest foundation, not a complete generated arc

The static fixture holds six documents and one optional key. Generated play imports its access memo, not automatically the full trail.

| Document | Actual contribution | Proposed role and limit |
|---|---|---|
| Service ticket 93-0714 | 7C-41 installation; repeating 37-second carriers; omitted frequency; monitor seized. | Strong attributed technical account. Corroborate a local operation; no evidence it caused Knox or involved the helicopter. |
| Property record 4471 | Receiver/key custody, blank agency, verified state callback requirement. | Ground custody and opportunity to examine evidence; not proof all outside contact was blocked. |
| Invoice/transfer 9327 | Customer package outside CSS stock; H. Vale authorisation; standing account. | Accountability for a specific order. Trace an approval, not another generically unsigned form. |
| Rourke notebook | Personal account versus subsequent denial, retained carbon. | Human stakes and a potentially resolvable local contradiction. Avoid interpreting all observations away. |
| Access memo 7C-41 | Advance procedure, Frankfort callback, explicit requirement to report independent emergencies. | Preserve the exception: it does not order staff to ignore every emergency. Compare receipt/issue times, not just printed dates. |
| Pike shift note | Disputes timely memo receipt; conflicting descriptions of Vale; key remains held. | A routing/receipt record could resolve local late delivery versus backdating while ultimate purpose remains open. |
| B-37 key | Authored asset pointing to cabinet access. | Candidate later physical interaction; definition alone does not prove a working cabinet action. |

**Proposed arc:** identify work and custody → establish a local authorisation/reporting action → learn a bounded fact about communications or withheld information → retain uncertainty about wider purpose/responsibility. Missing records alone are not the payoff. Gallery and vanilla faulty-dish examples remain separate proposals; do not merge sites, dates or actors with Dead Air without evidence and agreed design.

## 6. Accumulation without a final explanation

Use several connected inquiries, not a hidden master plot:

- **Arrival:** appointment, transport or reassignment tied to this survivor and place, within agreed biography boundaries.
- **Other people:** dated attendance/departure/custody. Someone once being here does not establish somebody alive now.
- **Absent help:** specific resources, requests, cancellations and routing decisions. An unfulfilled request does not prove nobody intended to help.
- **Communications/helicopter:** capability, received claims or observed events. A flight reference must be attributed or tied to actual observation, not invented as the player's memory.
- **Responsibility/foreknowledge:** establish particular decisions and timing; do not infer the Event's cause from irregular paperwork.

Example proposed continuation: a transfer explains a personal appointment; a specifically linked closure record establishes an internal desk continued; a routing record establishes where one request went; a resource record establishes why one pickup failed. These are proposed local facts, not a canonical plot. Each step needs a discovered source linking it to the next. A mundane correction may identify the actual route and still advance the search.

Different saves can vary local events. Learned facts cannot shift to fit a later theory. No conspiracy score or final correct interpretation is required.

## 7. Occupation proposals and vanilla media

All 25 occupation rows are future seeds. Keep personal questions and skill affordances; remove occupation-specific vanilla flyer dependencies. Before implementing each, supplement its current local-conclusion column with an arrival link and central contribution. A fitness roster becomes relevant through evidence of an appointment or movement; duplicated attendance alone is not about Knox. Profession establishes neither employer nor guilt nor special immunity.

Every naturally discovered annotated map needs a destination payoff and central relevance while preserving its original purpose. The catalogue's 125 designs are not 125 approved stories or verified destinations. This audit does not invent all their endings. Symbol-only maps, suspect anchors and hostile/no-destination messages require individual resolutions before full coverage is claimed. Flyer/brochure policies remain open. Natalie's preservation request must not be silently rewritten into a confirmed government mission merely to connect it.

## 8. Development work after this completed audit

**First increment, preserving Q31:** one personal opening using a revised premise and unemployed fallback. Deliver local payoff plus central contribution. Include necessary completion/retention support so that evidence survives, without creating a whole campaign framework. Q27 still governs specific biography/story approval.

**Then bounded repairs:** withdrawn-extension and one resource/transport premise demonstrate sourced continuation. Replace indiscriminate interpretation steering with compatible follow-up; rewrite optional prose for those cases. Expand other premise groups once the contract works. Map integration retains its separate identity/stash/destination checks and is not a prerequisite for the opening.

Verification proposals for adopted changes:

1. Render changed premises in both branches and permitted optional combinations; check dates, referents, claims, carrier capacity and payoff sufficiency. Arithmetic tests alone do not establish narrative relevance.
2. Essential endings cannot silently disappear through dropped carriers. Show renewed opportunity without moving known destinations or revealing hidden clue counts.
3. Continued cases cite discovered sources and specific questions; entity/time consistency holds, and player theory does not determine factual truth.
4. Reload and archive preserve sourced findings, unresolved links and notes; predecessor recovery still controls access.
5. Personal opening works without vanilla media; map pilots retain native stash lifecycle and verified reachable payoff carriers.
6. Event-dependent claims cannot refer to future dates or unobserved/unattributed helicopter activity. Historical evidence stays historical.
7. Preserve deterministic revision validation. Change fixtures intentionally when content changes; use fresh-save notices rather than silently rewriting learned clues.

No gameplay was modified or fresh engine test performed. The source audit is complete; repairs and live verification remain Linux development.
