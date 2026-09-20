# Review for Claude Code: vanilla printed media travel mechanism

This replaces the earlier review of the truncated attachment. It reviews the complete `MAP_MECHANISM_PLAN_2026-09-20.md`. Planning review only; no implementation or new live-game verification was performed.

The full plan already acknowledges the read-hook uncertainty, separates trails from active cases, stages delivery, restricts rollout to funded destinations, and recognises the limits of automated narrative testing. Those are not omissions. Preserve the owner's September 20 decisions; do not use older project notes to reverse them.

**Verdict: proceed with a bounded diagnostic spike, but revise the capacity model and pilot before production implementation. The current plan recognises several problems without making their resolution an effective gate.**

Evidence caveat: the inspected `Conspiracy-Files` checkout is at `34ecdb4`, older than the plan's claimed September 20 build. Source findings below describe that checkout. Confirm them against the actual development revision; do not assume the newer work is absent or broken merely because this copy is older.

## 1. The storage argument does not support the proposed scale

Section 5's calculation is arithmetically correct but incomplete:

`125 × 3 local trail clues + 16 × 7 ordinary documents = 487 events`.

It omits the destination payoff. If each destination contributes just one additional recorded piece of evidence, the count becomes **612**, already above 512. It also omits identity and connection discoveries, which share the inspected ledger (`DiscoveryLedger.lua`, `KINDS`). Clarify whether skill observations and map reads create entries too. If three clues includes the destination evidence, say so; that is a different proposal from three trail clues plus a payoff.

The claim that the ledger entry cap bites before the byte budget is also unsupported. The inspected `SuccessiveCases.lua` records a worst-case campaign estimate of 338,540 bytes, with 73,000 reserved for other roots. Applying the plan's approximate 545 bytes per ledger event gives:

`338,540 + 73,000 + 487 × 545 = 676,955 bytes`.

That exceeds 500,000 before adding new trail-state storage or destination events. This is an illustrative projection from the documented older baseline, not a fresh measurement, but it directly contradicts “it fits, barely.” `test/case_archive.lua` already measures campaign plus ledger plus reserved roots; extend that combined model rather than comparing an isolated event count to 512.

Required correction: specify what each discovery stores, how immutable text/provenance survives retirement, how trail state is represented, and what happens at capacity. Measure the combined worst case against the current revision before wiring production persistence. Merely bypassing active-case slots solves neither ledger capacity nor total bytes.

Three clues is a useful prototype sample, not a justified universal lifetime allowance. Finite content, unlimited concurrent maps, possible duplicate copies, and a trail that follows indefinitely need an explicit lifecycle. Define what happens after the last authored fragment without inventing a player-visible completion counter or discarding discoveries.

## 2. The proposed first destination has not met its own selection criteria

Phase 1 requires an annotated map and a flyer/brochure pointing to the same destination. The cited research establishes Circuital Healing as a flyer destination. It proposes the relay-fault map as a later technical destination; it does not establish an annotated map pointing to Circuital Healing itself.

Supply the exact annotated-map ID and source-supported target before naming Circuital Healing the obvious choice. Do not turn a proposed fictional connection into an existing vanilla binding.

The research does establish `LouisvilleStashMap15` plus the gallery brochure as a same-place pair, while warning that the annotation target differs from the stash-building anchor. That is a defensible candidate if carrier verification succeeds, though its travel distance may make another verified pair preferable. A short repeatable test route is a fixture choice, not evidence that a particular media binding exists.

Also remove the implicit requirement that every supported map must have a matching flyer. The flyer is an optional identification aid under the stated product rules.

## 3. The missing-clue fault needs a gate, not second place on a risk list

The plan reports `placed` records with absent physical clues in three of nine overnight runs. The controlled runs did not exercise the suspected relocation path. That is unresolved evidence, not evidence of safety, and it does not establish relocation as the cause.

Read-hook research can proceed independently. Production rolling placement should not proceed on an unexplained mismatch between canonical state and physical objects.

Instrument the relevant transitions so a failure can distinguish insertion failure, wrong container/identity lookup, player removal, relocation, world cleanup and save/reload divergence. Verify the same logical clue and physical target before and after an actual successful relocation and reload. A refused relocation or an unreadable target must yield “inconclusive,” never a pass. Preserve the diagnostic distinctions already described in `Conspiracy-Files-relocation-review/docs/management/RELOCATION_CHECK_REVIEW_2026-09-19.md`.

The exit criterion is a corrected cause or a demonstrated placement path that avoids the identified failure mechanism, with regression evidence. An arbitrary number of clean runs alone does not explain the original observations.

## 4. Specify what following actually does before building it

The benefit is clear enough: the player can leave the reading location immediately and still encounter relevant material during ordinary survival. It supports voluntary movement without forcing a return trip. That justifies a prototype; it does not yet justify unrestricted relocation machinery.

Resolve these distinctions:

- Placing the next unplaced fragment near the current player versus moving a previously placed, undiscovered object.
- Leaving old fragments behind versus withdrawing them.
- Eligible new carriers versus already searched containers.
- Local trail fragments versus fixed destination evidence.
- Global discovery pacing versus per-map pacing.
- Arrival versus finding/noting the destination evidence.

Prefer testing lazy placement of future fragments first if it satisfies the owner's intent. Do not assume that “follows” requires moving existing physical items. Keep destination evidence anchored to its authored place.

No maximum number of concurrent maps does not imply unlimited work per tick or one independent spawn rate per map. State the global work and discovery budgets, how trails receive opportunities, and how the design prevents permanent starvation. Test several maps together before authoring a whole town.

Duplicates also need technical semantics. The owner allows duplicate discoveries; that does not determine whether rereading one copy, reading another copy, receiving a repeated callback, or reloading creates another trail. Define these separately and preserve the owner's tolerance for physical duplicates.

## 5. Arrival and payoff are separate contracts

Define which building counts for a multi-building or multi-mark destination, how prior entry is treated, and what happens when the map is read inside its target. Outdoor/no-building maps expose a real boundary in the “entered the buildings” rule; give them an explicit authored disposition rather than inventing a nearby building.

The inspected visited-building store accepts only 256 IDs. Its adapter does not surface the capacity reason when recording fails. Reusing it unchanged would lose later visits. Verify the current implementation and use durable destination-entry state appropriate to this feature.

“Whenever they arrive, evidence is waiting” also needs behavior for previously looted or destroyed carriers, unloaded areas, early arrival and vanilla stash preparation. Test both read-before-visit and visit-before-read, preserving vanilla contents and effects. Source rectangles do not settle any of these questions.

The open recovery decision in section 9 is material. Retiring an unavailable payoff as incomplete may free a case slot, but it does not fulfil an already emitted travel invitation. Decide recovery or narrow the promise before activating those trails. Replace “a clue a conclusion rests on” with the actual dependency being protected so the plan does not accidentally reintroduce superseded conclusion semantics.

## 6. Revise the gates and sequencing

**Phase 0 is appropriate as an integration gate, but “no content work” is unnecessarily broad.** Prove an observable, cooperative read path before committing implementation to it. Define “read” operationally: the engine can report an action or UI transition, not whether a human understood the text. Test acquisition, cancelled opening/action where applicable, map reveal, rereading and reload against that definition.

Hook-independent work can proceed: capacity modelling, one sample narrative, source bindings and a test matrix. Do not disguise an unverified hook as a documented assumption and build the runtime around it.

Limit Phase 0 carrier checks to representative candidates and the pilot. Per-destination verification for all 125 belongs to coverage rollout; otherwise the supposed preliminary spike quietly contains much of the entire project.

Before Phase 1 persistence work, establish a small trail-state contract and budget fixture. Deferring both until Phase 2 risks building Phase 1 on the case structure that the plan already knows it cannot use.

One destination is enough to prove the physical loop. It cannot prove coexistence or contradictory records. Follow it with a small two-trail fixture before the town rollout: both remain eligible, neither consumes a case slot, their claims remain attributable, and the organiser does not arbitrate a winner. Two complete production destinations are not necessary for the first hook test.

Do not automatically label this “the survival connection.” Identify the particular survival interaction it satisfies under Q31. A travel narrative and a skill-specific sentence may contribute, but the classification still needs the owner ruling the plan already acknowledges.

## 7. The flyer role and bulk-authoring gate need smaller, testable claims

Flyers work as identification aids if the player can recognise the link through a concrete shared name, address, business or other source-supported detail. They fail if the connection depends on remembering an exact obscure phrase across a large evidence list.

Write one actual clue/flyer pair and show what makes the match legible without adding a quest marker. The flyer should remain useful without being a random-loot prerequisite for a map that already identifies its destination.

Bulk work does not need to be blocked on inventing an automated measure of interestingness. Use a compact editorial inventory recording each premise's document form, central question, ambiguity, contradiction mechanism and destination observation. Similarity checks can flag repetition; human comparison determines whether the differences matter. Trial this on a small batch before volume authoring.

The consistency harness is a necessary mechanical check, not proof that bulk content is safe in every sense. Define what “detects asserted conclusions” actually covers and retain editorial review. No-final-answer fiction still needs specific, worthwhile observations. Demonstrate that with one complete map → local fragment → destination evidence → specialist/default reading example.

## Required revision

Return a corrected capacity calculation, a verified pilot media pairing, a minimal trail lifecycle and pacing contract, an explicit placement-fault gate, and a staged acceptance matrix. Keep the funded-destination activation guard: unsupported destinations must not emit local clues promising a missing payoff.

Acceptance should include a fresh save and current-build reload; repeated reads and duplicate copies; two simultaneous trails; prior entry; unavailable carriers; late arrival; successful movement of the trail; vanilla stash ordering; preservation of recorded evidence; and combined storage/work limits. Fresh-save permission means legacy migrations are not required, but current-build persistence still is.

Do not repeat research already completed, build a general narrative-quality platform, or start bulk production to compensate for unresolved mechanics. The next useful increment is small: prove the read hook while correcting the budget, pilot binding and placement evidence.
