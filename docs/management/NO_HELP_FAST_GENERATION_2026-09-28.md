# No Help — fast generation workflow

**Proposed replacement, 2026-09-28.** This document replaces the writer-side
overhead in the 2026-09-27 handover: ADHD idea frames for routine tickets,
three self-blind reads per row, one-ticket-at-a-time generation, and one push
per ticket. It does not change clue content rules, the JSON schema, converter
checks, spoiler rules, ticket targets, or Claude's independent review. Use it
once this change is merged and the baton returns to ChatGPT.

## The short loop

1. **Check the baton and progress once.** If Claude holds the baton, do not
   create or edit clue rows. Reconcile STATE with the current progress line.
2. **Load only the batch packet.** Read the signed axioms, the rules in writer
   handoff §§1–3 and §6, the relevant ticket registry rows, and only the
   target-specific anchor/mark/scene facts. Read the current accepted rows
   only when a ticket's acceptance rule requires comparison. Do not re-read
   whole handoffs, unrelated stories, or old ADHD logs for each ticket.
3. **Write one batch in one pass.** Generate up to five consecutive open
   tickets, with a hard cap of 40 rows total. Deliver one JSON array per
   ticket. Alternate written clues and object sets where both fit. Keep the
   existing per-ticket coverage requirements. Do not add exploratory drafts,
   multiple frames, staged deepening, or repeated private rewrites.
4. **Run the local checks once.** Run `lua5.1 tools/nohelp_content/convert.lua --check`
   on the batch, then `lua5.1 tools/nohelp_content/progress.lua`. This is a
   read-only validation; Claude runs the mutating converter after review. Fix
   converter-coded failures directly. For a real story/anchor concern, ask
   Claude through the existing baton handoff; do not rewrite a sound clue just
   to appease a vague reaction.
5. **Hand over the batch.** Commit and push the batch as one change, with
   serials/counts/reason codes only in the message. Update STATE once with the
   serial range and next action. Claude reviews the whole batch once, runs the
   independent blind review under its existing review process, and returns
   only actual defects. Fix returned rows together in the next batch.

## One-pass writing check

Before submitting a ticket, check its rows together:

- Every row has a real, readable rival interpretation and a lean.
- Both axiom sets are represented as required by the row schema.
- The title and opening line work without the location name.
- Every clue works alone and does not explain its own significance.
- Required coverage, anchor, place, spot, and item constraints are met.
- The prose follows writer handoff §2a. Keep documents short and ordinary.

This is one editorial pass while drafting. Do not simulate independent blind
readers yourself. Independent reading remains part of Claude's batch review,
where a reviewer sees only rendered clue text and returns concrete codes.

## When to use ADHD exploration

Use an ADHD exploration run only for a genuinely new family or a repeated
failure pattern that the validator cannot resolve. It is optional for routine
rows; it does not block a ticket. Keep it to one compact brief with three
candidate approaches and one selected approach. Do not create separate frame
folders, deepen every candidate, or require a saved run per clue.

## Batch sizing

- Ordinary place or person tickets: up to five at once, while staying under 40
  rows total.
- Maps, scenes, or unique anchors: up to three at once, unless all required
  anchor facts are already in the packet.
- Stop a batch at the first unresolved anchor, axiom, or policy question. Put
  the opaque serial and one reason code in NEXT; keep independent tickets
  moving only when their inputs are clear.
- If generation is interrupted, keep complete rows and resume with the next
  missing row. Do not discard good work or restart the entire ticket.

## Why this is faster

The former writer loop required at least three fresh self-reads for every row,
separate ideation artifacts for routine work, repeated handoff reading, and
separate commits for each ticket. This path keeps the existing objective
converter and independent review, while batching the writing, checks, state
update, and delivery. The saved work is in duplicated process steps, not in
dropping clue coverage or schema validation.
