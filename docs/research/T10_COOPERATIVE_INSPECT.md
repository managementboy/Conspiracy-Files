# Spike T10 — Cooperative Inspect context-menu integration

- **Status:** Complete — inventory-pane mechanism proven; direct world-object menu explicitly unsupported
- **Project Zomboid build tested:** Stable 42.20.4 b0bbce05d5; Steam build 24909800
- **Platform:** Windows 11 build 26200, single-player disposable Sandbox save
- **Probe:** `dev/t10-cooperative-inspect/`
- **Issue:** #10

## Question

Can Conspiracy-Files add `Inspect` and `Mark Interesting` for valid revealed
T7-shaped assets without replacing vanilla Lua, suppressing another listener,
duplicating its own commands, leaking hidden/invalid subjects, or allowing one
UI activation to create duplicate domain evidence?

## Method

The exact installed Build 42.20.4 Lua sources and jar were hashed and inspected.
A pure-Lua probe normalized the inventory selection like installed
`ISInventoryPane`, validated T7-shaped custom-name/ModData subjects, added
privately keyed actions, revalidated at activation, emitted explicit domain
intent, persisted a probe-only marked flag for reload, and wrapped PZ-facing
callbacks in `pcall`. A second additive listener contributed `T10 Companion
Action` before the probe callback.

The plain Lua 5.1 harness covered raw/grouped/mixed/ambiguous/hidden/invalid/
unowned/already-marked subjects, foreign same-label preservation, repeated
registration/construction, world normalization, controller preflight, and an
injected action fault. The project owner then manually launched and entered the
disposable save, performed all reachable mouse right-clicks, activated Inspect
and Mark, saved/reloaded, tested the ground inventory and direct world menu, and
closed PZ. No GUI automation, synthetic input, helper, JNI, agent, quarantine
change, security bypass, or alternate injection was used.

## Observed behaviour

### Installed-source facts

- `OnFillInventoryObjectContextMenu(player, context, items)` fires after vanilla
  inventory-menu construction. Raw `InventoryItem` values and grouped rows are
  normalized with the dummy `.items[1]` skipped and subjects identity-deduplicated.
- `ISContextMenu:addOption` is additive. Event collections support `Add` and
  `Remove`, so the adapter can remove only its stored callback identities before
  re-adding them.
- `OnFillWorldObjectContextMenu(player, context, worldobjects, test)` is also
  additive and supports controller preflight through `setTest()`, but the manual
  dropped-photo right-click passed no `IsoWorldInventoryObject` in
  `worldobjects`. Installed-source shape alone had overpredicted that surface.

### Static results

- All 17 Lua 5.1 contract checks passed, including fixture rediscovery that is
  independent of deliberately malformed subject fields.
- Private action keys preserved a foreign same-label `Inspect` and suppressed
  only probe-owned duplicates.
- Valid, mixed, ambiguous, hidden, invalid, unowned, marked, world-normalization,
  controller-preflight, registration-idempotency, and injected-fault cases passed.

### Live manual results

- The exact client loaded only `ConspiracyFiles_T10_Probe` in
  `T10_cooperative_inspect_manual` and created the six inventory cases plus the
  dropped Photo.
- Repeated genuine menus for one revealed Note retained eight ordinary/companion
  options and added exactly one Inspect plus one Mark. Inspect was clicked once
  and emitted one `DOMAIN_INSPECT`; the game remained responsive.
- Two selected valid Notes produced one disabled ambiguity hint and no Mark.
  One valid plus one invalid item produced one Inspect and one Mark. Hidden and
  invalid single selections exposed neither action. Vanilla actions and the
  additive companion remained throughout.
- Mark Interesting on B-37 emitted exactly one domain intent and one created
  evidence marker. The next menu disabled Mark, and it remained disabled after
  a real save/reload (`markedPersisted=true`).
- The fault action was manually clicked twice. Each activation produced one
  contained boundary record, no Inspect-domain call, and no crash/freeze. PZ
  surfaced one `ERROR` indicator, so containment is responsive and concise but
  not invisible.
- The Ground inventory pane exposed one Inspect and disabled Mark for the
  unowned Photo while preserving seven existing actions. This is the supported
  dropped-item surface.
- Direct right-click on the photo sprite fired the world event with zero
  normalized inventory subjects. The probe added nothing and preserved the four
  vanilla world actions. Production must not promise direct-world Inspect.
- Actual same-type stack grouping was unavailable because the custom-named Notes
  rendered as separate rows; equivalent two-valid selection covered the
  ambiguity rule. Controller activation was not tested because no controller
  was available; installed-source and static preflight evidence remain the limit.

## Probe-only reload defect

Reload created a second invalid Paperclip and a second dropped Photo because the
fixture originally searched the intentionally malformed item by malformed
`cfAssetId` and always recreated the world Photo. This did not duplicate any
menu action or domain intent. The final probe uses separate `cfT10CaseId`
fixture identity and reuses both inventory and world cases. That correction was
Lua-parsed/static-reviewed after cleanup but was not rerun live.

## Security and restoration

The earlier injected-helper route remains abandoned and prohibited. Its
`runner.exe` alert provenance is unknown; no causal claim is made. The manual
run produced no security alert. All controls were restored byte-for-byte, the
active save/mod were moved into the evidence archive, and PZ was left closed.
Exact actions, event facts, hashes, counts, and archive location are recorded in
`dev/t10-cooperative-inspect/evidence/manual-gui-run.txt`.

## Verdict

T10 is complete with a constrained supported surface. Use only
`OnFillInventoryObjectContextMenu` for owned inventory and Ground/loot inventory
panes. Add privately keyed actions after vanilla construction; store and remove
only the mod's callback identities; normalize/deduplicate subjects; omit hidden
or invalid subjects; disable ambiguous/unowned/already-marked intent; revalidate
at activation; send idempotent domain intent; and contain callbacks with
`pcall`. Do not advertise or depend on direct-world-item right-click integration.

This live inventory-pane activation/coexistence matrix passes Gate B and
`CF-V01-E08` for the constrained supported surface. Production adapter/reader
implementation and its own full integration acceptance remain future work.

## Decision links

- **P4-R21:** proven for the supported inventory-pane mechanism.
- **P4-R19:** live callback failure containment proven; the PZ error indicator is
  a recorded presentation limitation.
- **P4-R38 / P2-Q152-Q159:** T7 authoritative ModData bodies now have a proven
  cooperative Inspect action surface.
- **P4-R44:** manual-only security procedure completed without alert or bypass.
- **P4-R45:** inventory-pane-only context-menu boundary established by T10.
- **CF-V01-E08:** complete for the supported surface.
- **Engineering Gate B:** complete.
