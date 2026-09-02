# v0.1 Dead Air Presentation/Input — Offline Handoff

> Integrated into the offline candidate with world adapters, lifecycle and
> release work. Production placement now emits this handoff's nested validated
> ModData contract; this handoff's live limitations and matrices remain
> authoritative.
> The original branch identity is historical. The consolidated candidate uses
> P4-R37's one shared active-pair gateway and the adversarial matrix in
> `SCHEMA2_PAIR_IDENTITY_LIVE_MATRIX.md`.

**Implementation branch:** `codex/cf-v01-input-presentation`

**Base commit:** `0f90648e77ebfbbade97f23f361d2e7b07472e97`

**Runtime target:** Project Zomboid Build 42.20.x. T7/T10 were observed on
42.20.4; this implementation has not been launched in Project Zomboid and does
not claim live CF-V01-E06/E08/E14 acceptance.

## Delivered boundary

This change implements only the presentation/input portion of the vertical
slice:

- a PZ-free item-presentation contract that stamps a custom display name and a
  namespaced, plain-table `ModData.ConspiracyFiles` payload;
- exact validation of schema, known Asset ID, reveal state, display name, title,
  description, full body and required expected physical token for authored live
  carriers, with compatible older
  content revisions refreshed by placement before interaction;
- one additive `OnFillInventoryObjectContextMenu` listener for both player and
  Ground/loot inventory panes, using module-private action ownership identities;
- selection normalization matching T10's grouped-row rule, identity
  deduplication, conservative ambiguity handling and activation-time
  revalidation;
- full custom Inspect reader windows for all six documents and the optional
  B-37 key;
- idempotent document-discovery and Mark Interesting transactions against the
  existing last-known-good persistence adapter;
- journal, evidence and in-fiction help projections rebuilt from canonical
  known state every time the notebook opens;
- one configurable normal-play key binding, `Conspiracy-Files: Open notebook`,
  defaulting to `N` and registered only once;
- reusable, resizable reader/notebook windows sized and centered for common
  800×600 through 3840×2160 resolutions, including the fixed 960×1008 client viewport.

No UI projection is persisted. The notebook never receives undiscovered Asset
definitions, full diagnostics or hidden state. Evidence rows contain known
titles and immutable discovery context but do not copy document bodies into the
canonical root.

## Item ModData contract

The canonical item carrier is the nested table below. Placement calls
`ConspiracyFiles.ItemProjection.apply` only after it owns a detached item:

```text
item:getModData().ConspiracyFiles = {
    schemaVersion = 1,
    contentRevision = "dead-air-r1",
    assetId = "dead-air:asset:...",
    revealed = true | false,
    resolvedTitle = <exact approved static title>,
    resolvedDescription = <exact approved presentation description>,
    resolvedBody = <exact approved static body, documents only>,
    physicalToken = <required expected save-scoped string for an authored live carrier>
}
```

New items contain no flat identity/presentation duplicates. For items written by
the first schema-2 candidate, the old flat schema, Asset, physical-token, title,
description and body fields are accepted only as a complete exact mirror of the
nested table. Flat-only, partial and disagreeing carriers fail closed; neither
presentation nor physical tracking silently chooses a side. This bridge keeps
the nested table authoritative while preserving an otherwise valid item instance
and physical token.

Physical identity is the validated `(assetId, physicalToken)` pair. Placement,
physical scans, presentation and action activation use the same world-runtime
gateway and require both fields to match the requested active canonical pair;
a carrier for one known Asset that claims another Asset's token is a rejected
collision and is never rewritten, replaced or used to advance the ledger.

When reconciliation finds an item whose carrier schema/Asset/token and mirror
equivalence are valid and whose `contentRevision` is exactly
`dead-air-r0-compatible` or `dead-air-r0-compatible-text`, it
refreshes only the custom display name and presentation revision/text from the
current authoritative Asset. It does not replace, restamp or change physical
identity. Missing, malformed, unknown and future revisions are rejected without
display mutation. A carrier claiming the current revision must already match
current static text exactly; tampering is rejected.

The reader never trusts arbitrary current-revision ModData prose: validation
requires exact agreement with the approved static Dead Air Asset. `InventoryItem.description`,
runtime `printMedia`, native key/map readers and custom Literature pages are not
used as authoritative storage. A stamped placement location is deliberately
not accepted as discovery context because the item may have moved before
inspection.

## Context-menu behavior

- Hidden, malformed, unreconciled stale-revision, unknown or body-tampered items
  add no actions.
- Mixed valid/invalid selection acts only on the one valid item.
- Multiple valid items add one disabled private Inspect hint and no Mark action.
- Documents expose Inspect. Inspect revalidates, stages one idempotent authored
  discovery if needed, then opens the full reader.
- The optional B-37 ordinary object exposes Inspect and Mark Interesting.
  Unowned Ground/loot items remain inspectable but Mark is disabled. Canonical
  Evidence, not an item-local marked flag, disables repeated intent after save
  reconstruction.
- A foreign action named `Inspect` is preserved because ownership is identity-
  based, not label-based.
- No `OnFillWorldObjectContextMenu` listener exists. Direct dropped-item sprite
  right-click remains unsupported per T10/P4-R45.
- Menu callbacks bind the construction-time item, pair, action, mirror and
  ownership state. Activation revalidation is read-only; complete coherent-pair
  substitution, compatible-refresh abuse and any bound-state mutation are no-ops.
- Expected stale activation rejection is a no-op. Unexpected adapter/UI faults
  pass through the existing per-subsystem `pcall`/three-failure error budget.

## Offline verification

Run from the repository root:

```text
lua5.1 test/run.lua
find mod/common/media/lua -name '*.lua' -print0 | xargs -0 -n1 luac5.1 -p
git diff --check
```

At this handoff's original presentation-branch checkpoint, the suite reported
35 passing tests. That figure is historical, not the current integrated suite
total. Current evidence is the output of `lua5.1 test/run.lua` at the candidate
commit and the combined gate in `V0_1_INTEGRATION_CANDIDATE_HANDOFF.md`.
The presentation/input regressions cover exact ModData validation,
Asset/token-pair identity, hidden/tampered rejection, known-only projections,
foreign-action preservation, private deduplication, grouped/mixed/ambiguous
selection, owned/Ground behavior, activation-time revalidation, idempotent
Inspect/Mark transactions, callback fault containment, repeated notebook
refresh, exactly one binding, common resolutions and the absence of a direct-
world action hook. These are fake-backed/static results, not live engine facts.

## Remaining live Build 42 matrix

### CF-V01-E06 — reader and persisted carrier

1. Use production-stamped representatives for D1–D6, save/reload, and verify
   exact custom names plus exact nested ModData fields.
2. Open every document through Inspect and compare every full title/body to
   `dead-air-r1`, including percent signs, punctuation and long wrapped lines.
3. Run P2 and all N-cases in `SCHEMA2_PAIR_IDENTITY_LIVE_MATRIX.md`; only the
   verified compatible-older case may refresh and every rejected case opens no
   reader and discovers nothing.
4. Confirm normal inventory/container behavior remains and no native
   description, `printMedia`, key/map reader or custom page is required.

### CF-V01-E08 — cooperative actions

1. In player and Ground/loot inventory panes, repeat menu construction with a
   foreign additive listener and a foreign same-label Inspect action.
2. Exercise all seven Assets and every active-pair positive/negative carrier in
   `SCHEMA2_PAIR_IDENTITY_LIVE_MATRIX.md`, plus raw/grouped, mixed and ambiguous selections.
3. Change Asset ID, token, reveal and ownership state independently between menu
   construction and activation to prove gateway revalidation.
4. Inspect a Ground item, take the B-37 key, Mark it once, save/reload and
   confirm Mark remains disabled from canonical Evidence.
5. Exercise contained reader, transaction and menu faults while unrelated
   handlers continue. Do not test or advertise direct-world sprite actions.

### CF-V01-E14 — notebook and key binding

1. Confirm the game's Key Bindings page contains exactly one Conspiracy-Files
   binding and that rebinding/unbinding it is respected.
2. Open/close repeatedly from clean, partial and complete Dead Air states;
   confirm one window instance refreshes without duplicate hooks or state.
3. Verify chronological journal order, Evidence order/context and in-fiction
   Help at 960×1008, 1280×720, 1920×1080, 2560×1440 and 3840×2160 (or the
   nearest available display/window modes), including resize and scrolling.
4. Inspect visible strings and UI reachability for hidden IDs, undiscovered
   titles/bodies, diagnostics, graph/theory controls and completion language.
5. Save/reload and repeat the partial/complete projections.

P4-R44 still governs any live T10-style rerun: owner-driven manual GUI input and
pure-Lua logging only. Do not restore or replace the prohibited injected-helper
route, and do not use synthetic input.

## Deliberate exclusions

This change does not implement placement, arrival sampling, physical-identity
reconciliation/scans, anchor/fallback selection, death/reload lifecycle work,
graph, theories, AI, content packs, retrofit, migrations or multiplayer
support. It neither launches PZ nor changes any security control.
