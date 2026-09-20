# Writing rebuild: scope, ownership and progress

Owner objective: audit all writing before passage edits; give every mystery an event; make evidence reveal different parts; separate document and survivor voice; vary coherent scenarios; establish one complete example and apply the standard everywhere. Claude continues repairing/building/testing the earlier code. Do not collide with that work.

## Workspace and integration agreement

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
- Generator now uses initial two-variant drafts for the opening, its continuation, and five ordinary families (`transfer-nobody-arranged`, `signed-by-someone-absent`, `two-start-dates`, `resignation-after-payslip`, `address-that-only-receives`). **7 of 22 families have the new path; this is not full implementation or an editorial pass.** The remaining 15 ordinary families retain the old path. All 17 map families still need rebuilding.
- Opening uses a borrowed McCoy vehicle; its cancellation variant diverts it to a mill drive belt. Personal recognition is gated on the named notice. Source dates now distinguish the trip day from the later filing day. Follow-up carriers preserve source person, organisation, survivor and documentary cutoff; the selected-site generator now actually passes the `follows` input.
- Retirement freezes the authored readings and suppresses closing choices/continuation when essential evidence was missed. Runtime connection voice uses supported findings instead of treating every context link as agreement. Generic physical labels no longer call every note a dispatch document or every notepad a review.
- Authored `test/personal_story.lua` for Claude: discovery permutations, withheld ending, source-only native pages, caller-copy isolation, saved-gate corruption, actual selected-site generation and continuation identity/time. **Not executed.** Existing g13/premise-text test assumptions still need revision before the final handoff.
- Static source review and `git diff --check` only. No Lua tests, compilers, builds or game run. `graphify update .` initially failed with Windows access denied, then completed successfully with filesystem escalation (AST-only). Graph generation is not functional verification.
- Last fetched map-branch head is `b7357d2`; not yet reconciled. Fetch again for the final integration.

## Implementation still required

1. Finish the editorial pass on the first seven families: some ordinary drafts still read like stock administration, their remaining questions can be arbitrary, and metadata must be checked against revised source text. All cases must have a meaningful comic situation and consequence. Structural validation cannot certify humour or a coherent story.
2. Complete opening/continuation integration: readable address binding on native pages as well as journal, inherited routing, surviving full-source history, no undiscovered people in closing options, and bounded question-screen wording. The initial follow-up still needs a stronger personal payoff than tracing an unsigned call sheet through an office.
3. Apply the event contract to the remaining 15 ordinary families and all 17 map families, preserving all destination coverage. Replace legacy premise prose/old role generation after coverage is complete, rather than leaving two competing authoring truths.
4. Replace unrelated optional-role selection everywhere; review relay memo/call-in integration, identities, keys and physical-object prose. Existing legacy dead-air content also needs the agreed tone/voice pass.
5. Complete UI and archive behavior: the old deep archive still deletes source rows; native item address rendering and closing-question layout remain unfinished. Keep the 1,000,000-byte provisional aggregate budget and honest admission failures without silent loss.
6. Revise obsolete test assumptions, add full family/variant and missing-evidence coverage plus an editorial sample/export tool. Reconcile current map fixes, then hand over the complete implementation once for Claude's builds and tests.

The full goal remains active. Audit and reference completion do not mean the writing has been fixed in the game.
