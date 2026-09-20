# Map-media adapter source basis — native execution pending

Inspected installed Build 42 Lua under
`C:/Program Files (x86)/Steam/steamapps/common/ProjectZomboid/media/lua/`.
This records source evidence, not an engine acceptance result. Claude captures
the current manifest with `tools/research/map_read_source.py` before native tests.

- `client/ISUI/ISInventoryPaneContextMenu.lua`, `onCheckMap`: transfer can queue
  another callback and return without a reader. Actual reading creates ISMap,
  wraps it, calls the native stash method, attaches the wrapper and records the
  read. The adapter captures `getStashMap()` before that call and requires a
  matching wrapper attachment plus a successful enclosing callback. It does not
  replace or invoke native stash preparation itself.
- `client/ISUI/Maps/ISMap.lua`: wrapper attachment is inherited Lua behaviour;
  reveal-on-world-map queues the world-map action, which is not the physical-map
  read trigger. The production adapter leaves reveal and close untouched.
- `shared/TimedActions/ISReadABook.lua`, `displayPrintMedia`: reads
  `item:getModData().printMedia.id`, creates `PZAPI.UI.PrintMedia`, instantiates
  it and centres it. A successful call supplies optional ordinary print context.
- `server/Items/LootLog.lua`: demonstrates `OnFillContainer(roomName,
  containerType,itemContainer)` and container parent/square access. The adapter
  observes completion; it never forces a fill or modifies exploration flags.
- `client/ISUI/ISInventoryPage.lua`: emits
  `OnRefreshInventoryWindowContainers(self,"beforeFloor")` after collecting nearby
  container buttons in `self.backpacks`, before floor/button finalisation. The
  adapter offers destination records through those actual containers. Survival
  through later stash/randomised-building work must be demonstrated natively.
- Existing project `WorldAccess.resolve`, `GeneratedRuntime` insertion and
  `CaseFile` show container fingerprints and `container:AddItem(item)` with an
  already-created item. This adapter uses that overload so its token is stamped
  before insertion. Verification searches the resulting container, rather than
  treating a successful return as proof of presence.
- `KnoxApps.me` documents the verified Build 42 profession path:
  `player:getDescriptor():getCharacterProfession():getName()`. The map adapter
  uses that path, plus guarded known Perks for observations.

All Java-backed calls retain their receiver. Existing methods are wrapped
cooperatively; original return tuples (including nils) and errors propagate.
The only global namespace introduced/used is `ConspiracyFiles`.

The destination catalogue uses source candidate anchors, not verified container
coordinates. The gallery's explicit map-mark override and the Ekron graffiti
exception are described in `docs/design/MAP_MEDIA_EDITORIAL_INVENTORY.md`.
