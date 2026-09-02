# Spike T5 — persistent physical item identity

> **Historical mechanism evidence.** This probe proves ModData-token persistence,
> normal movement behavior and copied-token hazards on the recorded Build 42
> version. It did not test or prove the later production invariant that both the
> active Asset ID and its expected save-scoped token must match at placement,
> scan, presentation and activation boundaries. P4-R37 and
> `docs/testing/SCHEMA2_PAIR_IDENTITY_LIVE_MATRIX.md` are authoritative for that
> current pair rule.

- **Status:** Proven for a mod-owned ModData identity across the tested normal transitions; uniqueness requires explicit conflict handling
- **Project Zomboid build tested:** Stable `42.20.4 b0bbce05d5`; revision `b0bbce05d5`; `pzbullet=1.0.0.28`; Steam build ID `24909800`
- **Platform:** Windows 11 `10.0.26200`; 64-bit client; single-player; `-nosteam`
- **Probe path/branch:** `dev/t5-physical-item-identity/` on `spike/t5-physical-item-identity`; tested Lua SHA-256 `12E3B1D5FF846666F5102148807782E695F3D2BD80787649661B4F064A78A907`
- **API/events used:** `InventoryItem:getModData/getID/createCloneItem/copyModData/CopyModData`, `ItemContainer`, `ISTransferAction`, `IsoGridSquare:AddWorldInventoryItem`, `IsoWorldInventoryObject`, vehicle-part containers, `Events.OnPlayerDeath`, `IsoDeadBody`, Global ModData, `saveGame`

## Question

Can Conspiracy-Files reliably identify the same physical evidence item while ordinary Build 42 play moves it through inventory, world containers, the floor, vehicles and a player corpse, including save/load, without trusting an engine ID or silently treating copied ModData as unique identity?

## Verdict

Yes, within the tested single-player Build 42.20.x line, a mod-owned string identity stamped into `InventoryItem` ModData before world exposure is the correct authority. The stamp and the same observable engine ID survived inventory → world container → floor → vehicle → inventory, with a real save/reload at every stage. Real player death transferred the same stamped item into the corpse with the same observable engine ID.

The engine ID was stable in this matrix, but it remains diagnostic only: it is engine-owned, mutable through public API, and does not solve copying. Both `copyModData` and `CopyModData` created different engine items carrying the same mod-owned identity. Identity persistence is therefore proven; uniqueness enforcement is a separate Conspiracy-Files responsibility.

T5 also corrects T4: an item absent from its original placement container after `placed` is not automatically lost. Normal transfer produced exactly that condition while the stamped item remained available elsewhere. Placement outcome and current physical availability must be separate state.

## Method

The probe used two copies of the already-disposable T4 save and two disposable character timelines:

1. `T5_identity` created one detached `Base.Note`, wrote a deterministic probe identity plus schema/Asset metadata into its ModData, then added it to player inventory.
2. It used the installed vanilla `ISTransferAction:transferItem` primitive for normal inventory/container/floor/vehicle transitions. Vanilla inventory UI delegates to this same primitive in single-player.
3. It bound one ordinary world container and spawned one probe-only `Base.PickUpVan` in the copied save, selecting its `TruckBed` container.
4. Every stage logged the explicit pre-state/action, ModData identity, engine ID, location, save/reload proof and global duplicate count across the known loaded probe scopes.
5. The item was removed permanently from inventory, saved and reloaded to prove confirmed loss without respawn.
6. Separate items exercised fresh instantiation, `createCloneItem`, `copyModData` and `CopyModData`. Duplicate stamps were reported as conflict and left intact.
7. `T5_death` saved/reloaded a stamped inventory item, killed only that disposable character, received `OnPlayerDeath`, and bounded-scanned nearby corpse containers.

No real user save, character, existing mod or vanilla file was modified. Three failed identity-harness iterations and one exact-square-limited death iteration were archived rather than deleted.

## Fixed transition matrix

`Duplicate count` is the number of distinct observed `InventoryItem` objects carrying the same stamp across the bound inventory, ordinary container, floor square, vehicle and nearby corpse scopes. `Engine ID` is recorded but is not authoritative.

| Pre-state / stage | Action | Stamped identity | Engine ID | Observed location | Save/reload result | Duplicate count | Result |
|---|---|---|---:|---|---|---:|---|
| Detached → inventory | Stamp before add | `cf-t5:physical:main` | 1373654750 | inventory | pre-save | 1 | Pass |
| Inventory | Reload | same | 1373654750 | inventory | persisted | 1 | Pass |
| Inventory | Normal transfer | same | 1373654750 | world container | pre-save; same Lua object returned | 1 | Pass |
| World container | Reload | same | 1373654750 | world container | persisted | 1 | Pass |
| World container | Normal transfer | same | 1373654750 | floor | pre-save; same Lua object returned | 1 | Pass |
| Floor | Reload | same | 1373654750 | floor | persisted | 1 | Pass |
| Floor | Normal transfer | same | 1373654750 | vehicle truck bed | pre-save; same Lua object returned | 1 | Pass |
| Vehicle | Reload | same | 1373654750 | vehicle truck bed | persisted | 1 | Pass |
| Vehicle | Normal transfer | same | 1373654750 | inventory | pre-save; same Lua object returned | 1 | Pass |
| Inventory return | Reload | same | 1373654750 | inventory | persisted | 1 | Pass |
| Inventory | Permanent remove | same | 1373654750 before removal | absent | pre-save | 0 | Pass; candidate for confirmed loss |
| Absent | Reload | same | none | absent | persisted absence | 0 | Pass; no respawn |
| Death inventory | Stamp/add | `cf-t5:death-transfer` | 1017838024 | inventory | pre-save | 1 | Pass |
| Death inventory | Reload | same | 1017838024 | inventory | persisted | 1 | Pass |
| Living disposable player | Set health to zero; engine death flow | same | 1017838024 | corpse within bounded nearby scan | pre-save; `OnPlayerDeath` fired | 1 | Pass |
| Corpse | Save returned, then reload attempt | same | 1017838024 before save | corpse | already-dead reload stalled before `OnGameStart` | 1 before save | Post-reload unproven; no persistence claim |

All successful normal transfers returned the exact same in-memory item object and retained the stamp. Every successful reload reconstructed one item with the same stamp and the same observed engine ID.

## Copy, duplicate, split and serialization matrix

| Mechanism | Source engine ID | New engine ID | Stamp inherited? | Count after action | Count after final reload | Required interpretation |
|---|---:|---:|---|---:|---:|---|
| Fresh `instanceItem(Base.Note)` | 712614182 | 589363627 | No | 1 stamped source | 1 | Unique |
| `createCloneItem()` on stamped Note | 560304128 | none | No usable clone returned | 1 | 1 | Negative/limited result; do not assume clone support |
| `newItem:copyModData(source:getModData())` | 1382233360 | 1046483214 | Yes | 2 | 2 | Conflict |
| `newItem:CopyModData(source:getModData())` | 1514929163 | 279411228 | Yes | 2 | 2 | Conflict |
| Normal Base.Note split | n/a | n/a | n/a | n/a | n/a | Not applicable: no normal split mechanism exists for the evidence type |
| Save/load serialization | 1373654750 | 1373654750 observed | Stamp persisted | 1 | 1 at each stage | Persistence proven; not uniqueness enforcement |

Installed vanilla `ISClothingExtraAction` independently creates a replacement item and calls `copyModData` when the original has ModData. T5 did not transform the evidence Note into clothing, but this exact installed code demonstrates why production must assume that some replacement/transformation paths can copy the stamp.

## Recommended identity schema and rules

Use one save-scoped string token per intended physical evidence instance, not per item type:

```text
physicalItemId = "cf:<save-story-id>:<asset-id>:<materialisation-id>"
physicalIdentitySchema = 1
assetId = <stable authored Asset ID>
```

The token may reuse T4's deterministic placement/materialisation token if and only if that token is unique to one intended physical instance in the save. Stamp it while detached and validate it before any container/world insertion. Persist only strings/numbers/booleans/plain tables permitted by P4-R32. Never store a Java/Lua item reference in canonical state.

Rules:

1. **Authority:** `physicalItemId` is authoritative. `InventoryItem:getID()` is optional diagnostics and transition correlation only.
2. **Exactly one observation:** one token match means physical availability is `available`; record last-known location kind/binding and observation ordinal/time as mutable tracking data.
3. **No observation:** absence from one former container is not loss. Mark `unavailable` only after a loss-confirming engine action (destruction/permanent removal) or a bounded reconciliation that has complete coverage of every location the tracker claims could contain it. Mere unloading or lack of callback is `unknown/untracked`, not `lost`.
4. **Reappearance after loss:** if the same token is later observed exactly once and the identity was never compromised by duplication, tracking may resume as `available`; immutable Evidence and discovery context do not change.
5. **Duplicate observation:** two or more distinct items with one token immediately set `physicalAvailability=conflict` and T4 materialisation reconciliation to `conflict`. Do not delete, restamp, pick the lowest engine ID, prefer a location, or create another item.
6. **Sticky compromise:** a duplication conflict does not clear merely because later scanning finds one copy. The remaining object could be any descendant. Clear only through an explicit future repair/migration tool with an audit record; v0.1 needs no automatic repair.
7. **Copy boundaries:** any production code that copies/transforms ModData must explicitly omit or replace `physicalItemId` unless it is deliberately moving the same physical identity. Copy-all helpers are unsafe by default.
8. **Optional operation:** evidence without a usable token remains `untracked`; every Dead Air discovery/journal path must still work.

Recommended Evidence tracking projection:

```text
physicalItemId: string | absent
physicalAvailability: untracked | unknown | available | unavailable | conflict
lastKnownPhysicalLocation: rebuildable/mutable bounded descriptor | absent
identityConflictObserved: boolean (sticky once true)
```

Immutable discovery facts remain separate from this mutable physical-tracking projection.

## T4 reconciliation changes

T4's pre-placement protocol remains valid: exact target scan, staged `placing`, detached prestamp, add exact instance, verify one, then commit `placed`.

After `placed`, use these corrected rules:

- `assetMaterialisation=placed` records that exactly one authored object was durably materialised. It must not be repurposed as the current-location field.
- Zero stamps in the original bound container triggers identity reconciliation, not immediate `lost`. The item may have moved normally to inventory, floor, vehicle or corpse.
- Exactly one matching token in a tracked scope keeps materialisation committed and sets physical availability/location to `available`.
- Confirmed destruction/permanent removal with no matching token sets physical availability to `unavailable`; never respawn. If a separate materialisation ledger retains `lost`, define it as confirmed physical loss, not “missing from placement container.”
- More than one token match anywhere in the observed scopes sets `conflict`; this is global identity conflict, not merely target-container duplication.
- Unknown/unloaded scopes cannot prove loss. Preserve the last known-good state and wait for bounded callbacks/reconciliation.

These corrections do not decide whether a placed-but-undiscovered lost D1 activates D2. That remains the existing morning product decision.

## Hook and API observations

- Installed vanilla `ISTransferAction` moves the existing item through normal containers and floor world objects; live transfers returned the same item object.
- `IsoGridSquare:AddWorldInventoryItem(existingItem)` preserved ModData and engine ID.
- A spawned `Base.PickUpVan` exposed a `TruckBed` item container that persisted across reload.
- Real `OnPlayerDeath` fired one tick after the disposable health-zero action; the nearby corpse contained one stamped item 58 ticks later.
- The same engine ID survived every successful transition/reload, including the observed corpse transfer. This is useful diagnostics, not a compatibility promise.
- `copyModData` and `CopyModData` copied the identity stamp to different engine items and survived reload.
- Public Javadocs list `createCloneItem`, but the tested ordinary Lua call produced no usable clone for `Base.Note`. Signature presence was not treated as capability.

Exact installed surfaces and hashes are in [`../../dev/t5-physical-item-identity/evidence/installed-api.txt`](../../dev/t5-physical-item-identity/evidence/installed-api.txt). Filtered live output is in [`../../dev/t5-physical-item-identity/evidence/live-run.txt`](../../dev/t5-physical-item-identity/evidence/live-run.txt).

## Limitations

- Single-player only. Multiplayer remains disabled by project decision.
- The matrix used `Base.Note`, not final Dead Air item classes/text. T7 still owns readable/name/page behavior.
- Base.Note has no normal split operation. T5 tested the closest relevant copy APIs and found both explicit ModData copy variants unsafe for uniqueness; it does not claim behavior for every count-bearing/recipe item.
- `createCloneItem()` returned no usable clone in this ordinary Lua context; no conclusion is claimed for debug/admin clone UI or other item subclasses.
- The corpse transfer itself was observed before save. Although `saveGame()` returned after the corpse observation, unattended reload of the already-dead save stalled before `OnGameStart` and before the loading-gate helper could release. Corpse persistence across that reload is therefore unproven.
- T5 did not enumerate every container in the loaded world. Production tracking must be event-driven and bounded; absence is conclusive only where coverage or a destructive action is conclusive.
- The stable engine ID observation is one controlled Build 42.20.4 matrix, not an engine contract and not a reason to make it authoritative.

## Safety and audit

The original `latestSave.ini`, `options.ini`, `debuglog.ini` and `mods/default.txt` were copied and hashed before setup. After testing they were restored byte-for-byte to the same SHA-256 values. Both final disposable saves, all failed/limited save iterations, the installed probe copy, helper DLL/build intermediates and raw redirected output were archived under git-ignored `tmp/t5-live/` rather than deleted.

The probe and helper were removed from active PZ paths. No `ProjectZomboid64` process remained. No vanilla Lua, game JAR, real save, real character, existing mod or unrelated configuration was changed.

## Verification

- Existing plain Lua 5.1 domain suite: `17 tests, 0 failures`.
- Probe parsed with PUC Lua `5.1.5`.
- The installed Kahlua compiler loaded and executed the probe on every successful engine pass; no separate `main` entry point exists on `se.krka.kahlua.luaj.compiler.LuaCompiler` for standalone invocation.
- Final documentation/probe verification also runs `git diff --check` before commit.

## Decision links

- P2-Q6 / P4-R24 — retain Evidence when physical tracking is unavailable.
- P3-Q7 — use stable mod-owned string identity, never object/table identity.
- P4-R21 — one namespace and no vanilla replacement.
- P4-R32 — stamp/canonical data remains recursively validated plain state.
- P4-R36 — pre-placement exact-once protocol retained; post-placement missing-container rule corrected by T5.
- P4-R37 — new persistent physical identity/conflict rule.
- GitHub Issue #6 — `[Spike T5] Persistent physical item identity`.
