# Spike T4 — exact-once deferred placement

- **Status:** Complete — live isolated fault/reload matrix executed on the development PC
- **Project Zomboid build tested:** Stable `42.20.4 b0bbce05d5`; revision `b0bbce05d5`; `pzbullet=1.0.0.28`; Steam build ID `24909800`
- **Platform:** Windows 11 Pro build 26200; direct 64-bit single-player client; `-nosteam`
- **Probe path/branch:** `dev/t4-exact-once-placement/` on `spike/t4-exact-once-placement`
- **API/event/classes used:** `Events.LoadGridsquare`, `Events.OnGameStart`, `Events.OnTick`, `instanceItem`, `InventoryItem.getModData`, `ItemContainer.AddItem(InventoryItem)`, `ItemContainer.getItems`, `ItemContainer.Remove`, `IsoObject.getContainerByIndex`, `IsoGridSquare.RemoveTileObject`, Global ModData, `saveGame`
- **Execution date:** 2026-09-01

## Question

What Build 42 hook and commit/reconciliation order can place one authored item without accidental duplication after its curated target container becomes available, including interruption, repeated streaming, save/reload and target loss?

## Verdict

Use cooperative `Events.LoadGridsquare` only as a **wake-up signal** into a bounded placement queue, with an `OnGameStart` catch-up for already-loaded bindings. Do not mutate a container inline merely because the event exists: the live script received 27,245 `LoadGridsquare` callbacks before `OnGameStart`, so initialization order and duplicate callback volume are material.

Vanilla Lua is sufficient. Create the item detached with `instanceItem`, stamp its deterministic placement token in item ModData **before** calling `ItemContainer:AddItem(item)`, then rescan the exact bound container. The detached-first order removes the dangerous visible-but-unstamped phase.

T4 found and tested no Lua-visible atomic transaction spanning a container/chunk file and `global_mod_data.bin`. It therefore proves practical duplicate-safe placement and reconciliation, not a claim of crash-atomic two-file commit. The safe bias is:

- a stamped world item can repair a stale `pending`/`placing` ledger;
- a committed ledger with no bound stamped item becomes `lost` and is **never blindly respawned**;
- zero items at a terminally unavailable target becomes `unavailable`;
- more than one stamped item becomes `conflict`; production diagnoses and stops rather than deleting evidence automatically.

This is exactly-once for the tested normal/interrupted Lua phases and saves, while arbitrary partial disk-write failure degrades toward at-most-once/loss instead of duplication. Critical-path liveness comes from the authored anchor/fallback design, not from duplicating an uncertain item.

## Recommended state machine

Canonical per-Asset placement state is one of:

- `pending`: deterministic token and curated target binding selected; target may simply be unloaded;
- `placing`: validated full-root intent committed before any world mutation;
- `placed`: exactly one matching stamped item observed in the exact bound container after insertion or reconciliation;
- `unavailable`: target is terminally invalid, destroyed, burned or otherwise unsuitable before placement;
- `lost`: the ledger had reached `placed`, but the bound item/container is now absent; never auto-respawn;
- `conflict`: more than one matching stamp is observed; stop and diagnose.

An unloaded square is not terminal unavailability and does not activate fallback. It leaves the record unchanged and queued for a future wake-up.

### Exact commit/reconciliation order

1. Resolve the static Asset ID, deterministic placement token and curated target binding. Stage a complete replacement canonical root and enforce P4-R32 plus the P4-R17 `≤500 KB` ceiling before swapping it to `pending`.
2. `LoadGridsquare` enqueues only potentially relevant binding coordinates; `OnGameStart` enqueues already-loaded bindings. `OnTick` drains a deduplicated queue behind fixed work/time bounds and a `pcall` adapter boundary.
3. Resolve the exact square/object/container and classify it as temporarily unloaded, usable, or terminally unavailable. Never treat mere absence during streaming as destruction.
4. Scan the exact container for the deterministic placement token before creating anything:
   - `0` with `pending`/`placing`: continue;
   - `1`: stage `placed`; do not add;
   - `>1`: stage `conflict`; do not add or delete;
   - `0` with `placed`: stage `lost`; do not add.
5. For a usable `0` case, stage and P4-R32-validate the full root with state `placing` **before** item construction.
6. Create the item detached, write the deterministic Asset/placement token into its ModData, and validate the stamp while the item is still outside every world container.
7. Add that exact stamped instance with `ItemContainer:AddItem(item)`. There is no production phase in which an unstamped authored item is visible in the world.
8. Immediately rescan the exact container. Stage `placed` only for count `1`; stage `conflict` for count `>1`; retain `placing` and report an adapter failure for count `0`/API error.
9. Let the normal save serialize world and ledger together. On every subsequent load and relevant streaming callback, repeat steps 3–4 before any insertion. T4's explicit `saveGame()` checkpoints cost 193–365 ms. The two calls made directly during `OnGameStart` also logged an engine `FBORenderCell`/`SavefileThumbnail` `NullPointerException` even though `pcall` returned true and later reloads recovered the tested state. Production must not force a save from `OnGameStart` or a grid-square callback; use the normal save lifecycle, verify after reload, and keep the conservative loss-over-duplication rule for ambiguous partial persistence.

Every canonical transition uses a full staged replacement validated before the last-known-good root swap. The observed 13-record probe root was conservatively estimated at about 20 KB, comfortably inside P4-R17; this does not waive production schema/size validation.

## Deterministic fault/reload matrix

All destructive cases ran only in a copied disposable save. `world` is the count of matching stamped items in the bound container. `ledger` is the state/count recorded before restart. Every row was reconciled again after a true stream-out/stream-in, a second post-placement save/reload, and a final reload.

| Scenario | Explicit pre-state | Injected failure/action | World / ledger before restart | Restart/reload action | Reconciliation result | Final duplicate count |
|---|---|---|---|---|---|---:|
| Clean | `pending` | none | `1 / placed(1)` | Reload | one stamp confirms `placed` | 1 |
| Before intent | `pending` | stop before `placing` swap | `0 / pending(0)` | Reload | stage intent, stamp detached, add, verify | 1 |
| After intent | `placing` | stop before construction | `0 / placing(0)` | Reload | add once and verify | 1 |
| After stamp | `placing` | discard detached stamped item before add | `0 / placing(0)` | Reload | add once and verify | 1 |
| After add | `placing` | stop before verification | `1 / placing(0)` | Reload | world stamp repairs ledger; no add | 1 |
| After verify | `placing` | stop before `placed` swap | `1 / placing(1)` | Reload | world stamp repairs ledger; no add | 1 |
| After ledger commit | `placed` | stop before save | `1 / placed(1)` | Save/reload | one remains | 1 |
| Missing after commit | `placed` | remove item before save | `0 / placed(1)` | Reload | `lost`; no respawn | 0 |
| Never available | `pending` | binding never resolves | `0 / pending(0)` | Reload | terminal test state `unavailable`; no add | 0 |
| Destroyed before | `pending` | physically remove bound container object | `0 / unavailable(0)` | Save/reload | remains unavailable | 0 |
| Destroyed after | `placed` | physically remove bound container object after verified add | `0 / placed(1)` | Save/reload | `lost`; no respawn | 0 |
| Burned/unusable | `pending` | inject terminal burned classification | `0 / unavailable(0)` | Save/reload | remains unavailable | 0 |
| Duplicate corruption | `placing` | inject two pre-existing matching stamps | `2 / placing(0)` | Reload | `conflict`; no third item and no automatic deletion | 2 |

The first corrected reload, post-stream reconciliation, second reload and third/final reload each reported zero matrix failures. The true streaming cycle observed the target square become nil/unloaded, then available again; it produced 50,349 `LoadGridsquare` callbacks overall and one callback for the exact target square. All seven valid placement/interruption paths stayed at exactly one matching item through four reconciliations.

## Anchor-to-fallback implications for Dead Air

T4 does not choose the relay or police map locations. The final two targets must still be curated and verified separately.

For v0.1:

- D1 and D2 keep independent placement records; D3–D6 remain ordinary supporting placements and are never suppressed by entry selection.
- An unloaded D1 target is `pending`, not failed. Do not activate the fallback merely because a chunk/cell is absent.
- A terminally invalid D1 target **before** D1 reaches `placed` may make D2 the guaranteed introduction opportunity, provided D2 itself has exactly one safe placement.
- Once D1 reaches `placed`, never spawn another D1. If the physical object later disappears, transition to `lost` and rely on T5 for wider identity tracking rather than guessing.
- `entryOpportunityUsed` should be set in the same validated root transition that accepts the winning introduction opportunity as `placed`; it must never switch from anchor to fallback or vice versa silently.

One product decision remains: whether a durably placed but still-undiscovered D1 that later becomes `lost` should permit D2 to become the narrative entry opportunity. T4 establishes the safe technical choices but cannot decide the desired story semantics. **Morning to-do:** decide the Dead Air fallback rule for “anchor placed, not discovered, later lost” before implementing `entryOpportunityUsed`.

## Hook and API observations

- Installed vanilla Lua itself registers `Events.LoadGridsquare`; the event was callable from an ordinary shared Lua mod.
- The event fires at high volume and before `OnGameStart`; it is a wake-up/queue input, not a one-shot initialization guarantee.
- A teleport 700 tiles away made the exact target square unavailable, and returning caused a new exact-target callback and restored container access.
- `instanceItem("Base.Note")` returned a detached item; its ModData was writable before insertion.
- `ItemContainer:AddItem(existingItem)`, enumeration and removal were callable from Lua and round-tripped through save/reload.
- Two ordinary container objects were removed with the installed square/object APIs in the copied save; absence persisted after reload.

Official Javadocs and the exact installed/vanilla surfaces are recorded in `dev/t4-exact-once-placement/evidence/installed-api.txt`. Live filtered output is in `dev/t4-exact-once-placement/evidence/live-run.txt`.

## Limitations

- Single-player only. Multiplayer remains disabled by project decision.
- The engine was closed normally after injected Lua-phase failures. T4 did not power-cut the process during an OS-level file write, corrupt a disk, or prove atomicity between chunk files and Global ModData; no such atomicity is claimed.
- `pcall(saveGame)` returned true for the two `OnGameStart` saves that logged an engine thumbnail-render `NullPointerException`; only later reload reconciliation established persistence. This independently reinforces T1's rule that a returned save call is not proof of integrity.
- The burned-target branch used an explicit unusable/burned target classification. Starting a live spreading fire solely to destroy one container was not safe or deterministic enough for unattended automation. Physical removal covered the independent destroyed-container path.
- The probe used `Base.Note`, not the final Dead Air item classes/text. T7 owns reader/text behavior.
- The probe scanned the exact bound container, not player inventory, floor, vehicles or arbitrary nested containers. T5 owns durable physical identity and wider tracking after placement.
- The two authored Dead Air locations were intentionally not selected.
- The launch-only loading-gate JNI helper only released the engine's final raw-input gate after `GameLoadingState.done=true`; it did not participate in placement, persistence or measurements.

## Safety and audit

The corrected run used one copied disposable save and the probe as the sole active mod. A failed first harness iteration was also archived rather than deleted. Raw redirected stdout/stderr, both disposable saves, the installed probe copy and loaded helper DLL remain under git-ignored `tmp/t4-live/` for local audit. The general PZ console was not copied into the OneDrive-backed repository because it can contain unrelated machine/user information.

After the run, `latestSave.ini`, `mods/default.txt`, `options.ini` and `debuglog.ini` matched their original SHA-256 hashes byte-for-byte. The disposable save, probe and helper were removed from active PZ paths by archival moves. Project Zomboid was closed.

## Decision links

- P2-Q16 — anchor/fallback without intentional duplicate clues.
- P3-Q1 / ADR-0001 — vanilla Lua first, validated for placement.
- P3-Q4 — minimal canonical state.
- P3-Q7 — deterministic authored IDs/tokens.
- P3-Q10 — PZ hooks as boundary inputs.
- P4-R16 — bounded queued work; `LoadGridsquare` is not processed synchronously/unbounded.
- P4-R17 — hard `≤500 KB/save` canonical budget.
- P4-R19 — `pcall` adapter boundary.
- P4-R21 — cooperative event hook and one namespace.
- P4-R32 — staged full-root validation before every canonical swap.
- GitHub Issue #5 — `[Spike T4] Exact-once deferred placement`.
