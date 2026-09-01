# Project Zomboid Build 42 API Notes

This index separates observed project-spike results from external documentation context. Full results live in the linked spike reports.

## Verified live environment (2026-08-30 through 2026-09-01)

- Project Zomboid Stable `42.20.4 b0bbce05d5`
- Revision `b0bbce05d5`
- `pzbullet=1.0.0.28`
- Steam build ID `24909800`
- Windows 11 build 26200

## T1 — ModData persistence limits: complete

Full report: [`T1_MODDATA_PERSISTENCE.md`](T1_MODDATA_PERSISTENCE.md).

Verified live single-player Global ModData findings:

- Plain acyclic Lua tables with string/number keys and string/number/boolean leaves round-trip.
- Nil is absence and removes a previously persisted key.
- Function and exposed-Java-object values are silently dropped.
- Metatables are not preserved.
- A self-cycle triggers `StackOverflowError` in `KahluaTableImpl.save`; `saveGame()` still returns and the entire probe payload/control is lost.
- Shared child tables reload as distinct copies, so reference identity is not preserved.
- Boolean, table, function and Java-object keys are silently omitted.
- Acyclic depth cases 16, 32, 64, 128, 256 and 512 all passed exactly.
- 1k, 10k and 100k representative records all passed count/checksum validation, but 100k caused roughly nine-second synchronous save and validation stalls and produced a 44,419,437-byte file.
- Vanilla Lua is sufficient for canonical persistence within the project's `≤500 KB/save` v0.1 budget. Java and ZombieBuddy are not required for persistence.
- Mandatory pre-save validation must reject unsupported types/keys, cycles, alias-identity dependence, excessive depth and oversized state.

The existing stable-ID and ID-based relationship architecture is retained and strengthened by these observations.

## T9 — Vanilla Lua network egress: complete

Full report: [`T9_NETWORK_EGRESS.md`](T9_NETWORK_EGRESS.md).

Verified live single-player `-nosteam` findings on the same exact Build 42.20.4 installation:

- `getHostByName` is exposed and synchronous: a controlled known host resolved in 13 ms; a `.invalid` name returned nil in 5 ms.
- No general HTTP/HTTPS request surface was callable: `getUrlInputStream`, URL/connection/client classes, `Socket`, `Thread`, `Runnable`, `luajava` and internal `PublicServerUtil` were absent from Lua.
- `openUrl` is an allowlisted browser-launch helper, not a response API.
- `getPublicServersList` is the sole HTTP-like Lua call. In `-nosteam` it synchronously invokes an engine-fixed HTTPS XML endpoint; the live call occupied `OnTick` for 312 ms and returned nil with no status, body or error detail.
- Arbitrary GET, plain HTTP, POST, TLS configuration/diagnostics, timeout configuration and async HTTP are unavailable to vanilla Lua.
- The fixed path's installed code uses 10-second connect/read timeouts and reads the whole response using the platform-default decoder before XML parsing; Lua cannot configure those choices or access the raw response.
- General optional runtime-AI transport therefore needs Java/ZombieBuddy or an external companion. This does not block v0.1 because no-AI remains primary.

## T2 — Full map/meta-grid enumeration cost: complete

Full report: [`T2_MAP_ENUMERATION_COST.md`](T2_MAP_ENUMERATION_COST.md).

Verified live isolated single-player findings on the same exact Build 42.20.4 installation:

- The documented `getWorld():getMetaGrid():getBuildings()` → `BuildingDef:getRooms()` path is callable from ordinary Lua.
- The current vanilla map exposed 9,978 buildings and 86,436 rooms: 96,414 useful records.
- Five synchronous scans occupied `OnTick` for 227–244 ms each and returned identical counts/checksum.
- An equivalent useful index built at 100 records/frame took 965 frames/8,045 ms active wall time, averaged 0.555 ms and peaked at 2 ms with zero callbacks over 2 ms.
- 500 records/frame averaged 2.130 ms and exceeded 2 ms on 54/193 callbacks; 1,000 averaged 4.072 ms and exceeded it on 93/97 callbacks.
- The generic rich full-map index retained an observed 90–102 MiB JVM used-heap delta while held. Installed Kahlua bytecode confirms `collectgarbage("count")` is JVM used heap in KiB, not a Lua-only allocator counter.
- Future discovery must be queued behind both record and elapsed-time bounds, stream/filter to candidate facts, and remain rebuildable/non-canonical. v0.1 still uses curated locations.

## T3 — Location categorisation reliability: complete

Full report: [`T3_LOCATION_CATEGORISATION.md`](T3_LOCATION_CATEGORISATION.md).

Verified live isolated single-player findings on the same exact Build 42.20.4 installation:

- `IsoMetaGrid:getZones()`, building/room getters, zone getters and generic building traits were callable from ordinary Lua.
- The vanilla map exposed 9,978 buildings, 86,436 rooms and 8,867 zones. The final 48-record/1 ms dual-bounded scan used 3,530 callbacks, peaked at 2 ms and had zero callbacks over 2 ms.
- `BuildingDef:getTable()` was empty and `getZone()` nil for every emitted target/candidate. Generic building booleans did not encode a semantic category.
- Exact room names were the useful surface: sampled bookstores and hospitals/clinics classified cleanly with specific room labels. Generic `office`, `medical`, `communications` and `broadcasting` required contextual rules.
- The fixed 55-row matrix produced 28 TP, 25 TN, 0 FP and 2 FN. It missed one large police headquarters and one communications-tower building.
- Police and Office/Offices zone names existed only as `ZombiesType` rectangles. No semantic bookstore, medical or transmission landmark zone was found.
- Automatic categorisation is advisory, room/area-first candidate discovery only. v0.1 and v1 remain curated; non-building landmarks require curated/object-specific handling.

## Documentation context

- Official version metadata: <https://projectzomboid.com/version_announce/>
- Lua-facing `ModData`: <https://projectzomboid.com/modding/zombie/world/moddata/ModData.html>
- Global ModData backing store: <https://projectzomboid.com/modding/zombie/world/moddata/GlobalModData.html>
- Lua globals used for instrumentation: <https://projectzomboid.com/modding/zombie/Lua/LuaManager.GlobalObject.html>
- Meta-grid and record getters used by T2: <https://projectzomboid.com/modding/zombie/iso/IsoMetaGrid.html>, <https://projectzomboid.com/modding/zombie/iso/BuildingDef.html>, <https://projectzomboid.com/modding/zombie/iso/RoomDef.html>

The documented `524288`-byte internal block constant is not a persistence limit and was not used to derive the project budget.

## Remaining spikes

### T4 — Exact-once deferred placement

Complete on stable 42.20.4. `Events.LoadGridsquare` is a verified cooperative wake-up surface, but it fired 27,245 times before `OnGameStart`; enqueue relevant curated bindings and add an `OnGameStart` catch-up rather than mutating inline. A true teleport-driven stream-out/in made the exact target square unavailable and produced one new exact-target callback on return.

`instanceItem` can create a detached item whose ModData is stamped before `ItemContainer:AddItem(existingItem)`. Exact-container stamp reconciliation survived seven interruption phases, three save/reloads and the real stream cycle without valid-path duplication. Physically removed targets persisted absent. T4 found and tested no Lua-visible atomic chunk/Global-ModData transaction, so confirmed loss is not blindly respawned and duplicate stamps become `conflict`. T5 later proved that zero in only the original container is not confirmed loss; it triggers wider identity reconciliation. See `T4_EXACT_ONCE_PLACEMENT.md`, `T5_PHYSICAL_ITEM_IDENTITY.md` and `dev/t4-exact-once-placement/evidence/installed-api.txt`.

### T5 — Persistent physical item identity

Complete on stable 42.20.4. One detached-prestamped `Base.Note` retained its mod-owned ModData identity through inventory, an ordinary world container, the floor, a spawned vehicle truck bed and back to inventory, with a real reload at every stage. Permanent removal remained absent after reload. Real disposable-character death moved one stamped item into a nearby corpse with the same observed engine ID; post-save reload of the already-dead save stalled before `OnGameStart`, so corpse persistence across that final reload is not claimed.

Both `copyModData` and `CopyModData` produced different engine items carrying the same identity and the two-item conflicts survived reload. Engine IDs stayed stable in the tested path but are diagnostic only. Placement outcome and physical availability must be separate: zero in the original placement container triggers wider identity reconciliation, not immediate loss. See `T5_PHYSICAL_ITEM_IDENTITY.md` and `dev/t5-physical-item-identity/evidence/installed-api.txt`.

### T6 — Never-loaded chunk detection

Future retrofit only. Determine whether reliable per-candidate loaded-history state exists.

### T7 — Item name/description/page text mutation

Complete on stable 42.20.4. Custom names and item ModData round-tripped on all nine tested literature/photo/generic/key/map carriers; `InventoryItem.description` returned nil on all nine after reload. Runtime-enabled locked Literature custom pages persisted and opened in the native read-only journal, but the UI is a 15-line/1,200-character plain-text page and displayed markup literally. Raw runtime strings in `printMedia` are translation/formatter inputs, not opaque text; `%` content caused `UnknownFormatConversionException`, while the translated runtime-shaped media displayed a title but blank body canvas. Generic items/keys have no body reader and native map UI does not consume the ModData body. Use persistent custom name + validated ModData universally and the custom T10 Inspect reader for world-specific bodies; optional locked pages are short plain-text projections only. See `T7_RUNTIME_ITEM_TEXT.md` and `dev/t7-runtime-item-text/evidence/installed-api.txt`.

### T8 — Building/room/non-building arrival detection

Test multi-floor and basement cases plus a non-building landmark.

### T10 — Cooperative Inspect context-menu integration

Add/remove an `Inspect` entry without replacing vanilla or other-mod handlers.

Use `SPIKE_TEMPLATE.md` for every result.
