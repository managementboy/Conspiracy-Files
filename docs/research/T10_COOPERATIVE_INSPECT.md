# Spike T10 — Cooperative Inspect context-menu integration

- **Status:** Inconclusive — installed API and static adapter contract supported; live activation blocked by a security stop
- **Project Zomboid build tested:** Stable 42.20.4 b0bbce05d5; Steam build 24909800
- **Platform:** Windows 11 build 26200, intended single-player `-nosteam`
- **Probe path/commit:** `dev/t10-cooperative-inspect/`; commit recorded by the enclosing T10 branch
- **API/event/classes used:** `Events.OnFillInventoryObjectContextMenu`, `Events.OnFillWorldObjectContextMenu`, `ISInventoryPane.getActualItems`, `ISInventoryPaneContextMenu.createMenu`, `ISWorldObjectContextMenu.setTest`, `ISContextMenu:addOption`, `InventoryItem`, `IsoWorldInventoryObject`

## Question

Can Conspiracy-Files add `Inspect` and `Mark Interesting` for valid revealed
T7-shaped assets in inventory and world-object contexts without replacing
vanilla Lua, suppressing another listener, duplicating its own commands, leaking
hidden/invalid subjects, or allowing one UI activation to create duplicate
domain evidence?

## Method

The exact installed Build 42.20.4 Lua sources and jar were hashed and inspected.
A disposable mod then implemented the smallest candidate adapter: normalize the
inventory selection exactly like the installed `ISInventoryPane`, resolve
dropped items through `IsoWorldInventoryObject:getItem()`, validate revealed
T7-shaped ModData, add privately keyed options, re-resolve at activation, send
explicit domain intent, and contain every PZ-facing callback with `pcall`.

A plain Lua 5.1 harness supplied mock engine items, contexts, event collections,
players and world objects. It exercised raw and grouped selection, dummy-entry
skipping, identity deduplication, same-label foreign options, repeated menu
construction, repeated registration, mixed/ambiguous/hidden/invalid subjects,
owned/unowned/already-marked states, world-object resolution, controller
preflight and injected callback failure.

The exact client booted with only the disposable probe enabled and logged mod
and script registration. Synthetic input did not traverse the game's raw-input
main-menu path. A later relaunch was stopped immediately after a security product
reported that `runner.exe` had been quarantined as `Win64:MalwareX-gen [Cryp]`
and the game reported `Fatal Error`. No antivirus setting or quarantine state
was changed, and no alternate injection was attempted.

## Observed behaviour

### Exact installed-source facts

- `ISInventoryPaneContextMenu.createMenu(player, isInPlayerInventory, items, x, y, origin)` accepts raw `InventoryItem` values and grouped rows whose `.items[1]` is a dummy display duplicate; installed `ISInventoryPane.getActualItems` starts real grouped subjects at index 2 and deduplicates by item identity.
- `OnFillInventoryObjectContextMenu(player, context, items)` fires after vanilla inventory-menu construction and receives the original selection shape.
- `OnFillWorldObjectContextMenu(player, context, worldobjects, test)` fires after vanilla world-menu construction. Dropped inventory items are `IsoWorldInventoryObject` values resolved through `getItem()`.
- World controller preflight requires an additive callback to call `ISWorldObjectContextMenu.setTest()` only if the callback would add a command.
- `ISContextMenu:addOption` is additive. Event collections expose `Add` and `Remove`, and installed vanilla code uses `Remove`; a mod can therefore remove only its previously stored callback identities before re-adding them.

### Static candidate-adapter results

- All 16 Lua 5.1 contract checks passed.
- Private option ownership keys suppressed only the probe's duplicate actions. A pre-existing foreign option also named `Inspect` remained untouched.
- One valid subject produced one `Inspect` and one `Mark Interesting`; repeated construction did not add a second privately owned command.
- Multiple valid subjects produced one disabled ambiguity hint and no mark command. Mixed valid/invalid selection retained only the valid subject; all-hidden/all-invalid selection added nothing.
- Unowned dropped evidence remained inspectable while its mark command was disabled. A successful mark created one token-keyed evidence fact; a later menu disabled mark rather than relying on mutable UI state.
- An injected Inspect exception was contained by the adapter boundary and did not increment the domain call count.
- Valid world controller preflight set the vanilla test flag; hidden world evidence left it unchanged.

### Live facts

- The exact client displayed `Version 42.20.4 b0bbce05d5 pzBullet(1.0.0.28)`.
- The console recorded `loading ConspiracyFiles_T10_Probe`, one callback-registration line and the probe script-loaded line.
- No `OnGameStart`, matrix summary, real inventory/world menu, genuine right-click, action activation, save/reload or coexistence result was reached. The live log is therefore boot evidence only.
- Cleanup restored every control file byte-for-byte, removed all active disposable paths, left Project Zomboid closed, and archived 538 files rather than deleting them.

## Measurements

- Static adapter checks: 16 passed, 0 failed under PUC Lua 5.1.
- Installed files hashed: four vanilla Lua surfaces plus `projectzomboid.jar`.
- Live T10 matrix/action observations: 0, due to the security stop before world entry.
- Archived disposable files: 538.

## Limitations

- Mock tests prove the candidate Lua algorithm, not Kahlua/Java-object behavior,
  actual menu rendering, listener ordering under real mods, mouse/controller
  activation, or vanilla actions remaining visible in a live menu.
- Installed-source order/signatures are strong version-specific evidence but do
  not prove that the candidate callbacks execute correctly in the running game.
- No real another-mod coexistence test, ordinary right-click, activation count,
  save/reload, or production adapter/domain integration completed.
- The security alert's `runner.exe` path and provenance could not be established
  read-only. No causal claim is made about the probe, JNI helper, game, or
  computer-control runtime.

## Verdict

T10 remains incomplete. The installed Build 42.20.4 source supports a precise
candidate mechanism: additive post-vanilla events, vanilla-shaped subject
normalization, privately keyed option ownership, identity-specific callback
removal/re-addition, controller-aware world preflight, activation-time
revalidation, explicit idempotent domain intent and `pcall` boundaries. That
mechanism passes static Lua 5.1 tests, but it is not an observed live contract.

Do not add an authoritative P4 decision, mark Gate B complete, or unblock
`CF-V01-E08` from this result. Complete T10 later through a user/security-approved
manual-GUI route that does not restore the flagged binary or bypass protection.

## Decision links

- **P4-R21:** retained as an existing compatibility requirement; not newly proven by T10.
- **P4-R19:** retained as the required adapter error boundary; static fault containment passed only in the mock harness.
- **P4-R38 / P2-Q152-Q159:** unchanged; T7's body-storage/reader boundary still awaits a proven live T10 surface.
- **CF-V01-E08:** remains blocked.
- **Gate B:** remains open.
