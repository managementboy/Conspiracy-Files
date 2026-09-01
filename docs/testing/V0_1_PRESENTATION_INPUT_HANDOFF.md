# v0.1 Dead Air Presentation/Input — Offline Handoff

> Integrated into the offline candidate with world adapters, lifecycle and
> release work. Production placement now emits this handoff's nested validated
> ModData contract; this handoff's live limitations and matrices remain
> authoritative.

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
- exact validation of schema, content revision, known Asset ID, reveal state,
  display name, title, description, full body and optional physical token;
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
  800×600 through 3840×2160 resolutions.

No UI projection is persisted. The notebook never receives undiscovered Asset
definitions, full diagnostics or hidden state. Evidence rows contain known
titles and immutable discovery context but do not copy document bodies into the
canonical root.

## Item ModData contract

Future placement code may call `ConspiracyFiles.ItemPresentation.stamp` only
after it owns a detached item. The adapter writes one nested table:

```text
item:getModData().ConspiracyFiles = {
    schemaVersion = 1,
    contentRevision = "dead-air-r1",
    assetId = "dead-air:asset:...",
    revealed = true | false,
    resolvedTitle = <exact approved static title>,
    resolvedDescription = <exact approved presentation description>,
    resolvedBody = <exact approved static body, documents only>,
    physicalToken = <optional save-scoped string>
}
```

The reader never trusts arbitrary ModData prose: validation requires exact
agreement with the approved static Dead Air Asset. `InventoryItem.description`,
runtime `printMedia`, native key/map readers and custom Literature pages are not
used as authoritative storage. A stamped placement location is deliberately
not accepted as discovery context because the item may have moved before
inspection.

## Context-menu behavior

- Hidden, malformed, stale-revision, unknown or body-tampered items add no
  actions.
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
- Expected stale activation rejection is a no-op. Unexpected adapter/UI faults
  pass through the existing per-subsystem `pcall`/three-failure error budget.

## Offline verification

Run from the repository root:

```text
lua5.1 test/run.lua
find mod/common/media/lua -name '*.lua' -print0 | xargs -0 -n1 luac5.1 -p
git diff --check
```

The suite reports 35 passing tests. Nine presentation/input tests cover exact
ModData validation, hidden/tampered rejection, known-only projections,
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
3. Confirm normal inventory/container behavior remains and no native
   description, `printMedia`, key/map reader or custom page is required.

### CF-V01-E08 — cooperative actions

1. In player and Ground/loot inventory panes, repeat menu construction with a
   foreign additive listener and a foreign same-label Inspect action.
2. Exercise raw/grouped, one-valid, mixed valid/invalid, two-valid ambiguous,
   hidden, invalid, stale-revision and tampered-body subjects.
3. Change reveal/ownership state between menu construction and activation to
   prove revalidation.
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
   Help at 800×600, 1280×720, 1920×1080, 2560×1440 and 3840×2160 (or the
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
