# Annotated-map read path: source inspection, awaiting Linux execution

Inspected the installed Windows Lua sources on 20 September 2026. This is source
evidence only. The Phase 0 read/stash gates have NOT passed.

## What the source actually does

In media/lua/client/ISUI/ISInventoryPaneContextMenu.lua, onCheckMap begins at
line 2661 in the inspected installation. It first requests an inventory transfer
if needed, registering itself as that action's completion callback and returning
without opening a reader. On the presentation path it constructs ISMap, attaches
it to an ISMapWrapper, calls map:doBuildingStash(), makes the wrapper visible,
calls wrap:addToUIManager(), then playerObj:addReadMap(map).

ISMapWrapper inherits addToUIManager from ISUIElement. Its Lua implementation
instantiates if needed, then calls UIManager.AddUI. The inherited method is a
narrow observation point for a successful attachment, correlated with the
enclosing onCheckMap call. A successful outer return plus that attachment is a
candidate operational read, not proof that the human read the text. A queued
transfer return is not a presentation. A pre-existing hasReadMap flag is also
insufficient to distinguish a new presentation from a cancelled reread.

ISMap:revealOnWorldMap queues ISReadWorldMap. That timed action opens ISWorldMap;
it is the reveal/world-map step, not the original paper-map reading action.
Hooking that timed action as the paper read trigger would conflate the two.

The source uses map:getStashMap() for the annotated map. The observer captures
that identifier both before and after onCheckMap, since native stash processing
may affect item state. It does not derive identity from translated titles, base
map IDs, or physical engine item IDs. Whether the design ID survives the complete
native path and reload is for Claude's live test to establish.

## Reproduce and compare installations

Run tools/research/map_read_source.py --game PATH_TO_GAME --out OUTPUT.json.
It records installed-file hashes, exact definition locations and relevant source
lines. An optional --version-file accepts explicit plain-text version metadata;
otherwise the game version is left unknown until the observer reports the
running engine's getVersionNumber(). The tool does not recursively guess a game
version from library files. Compare the Linux source before drawing conclusions
from Windows line numbers. Tool output itself has not been run in this checkpoint.

## Implementation boundary

MapReadObserver.lua only exports an opt-in debug single-player observer. Module
loading installs no hooks. start() adds cooperative wrappers to onCheckMap,
ISMapWrapper.addToUIManager, ISMap.revealOnWorldMap and ISMapWrapper.close.
stop() disables its own closures and restores methods only where it still owns
the slot. It does not unwrap another mod's later wrapper. Original arguments,
nil returns and error values are preserved; diagnostic errors are contained.

The observer never prepares a stash, creates clues, activates trails, writes
ModData, or changes save schemas. It logs every candidate presentation, including
rereads and duplicate copies. Domain deduplication belongs to the future verified
activation adapter, not this measurement tool. The bounded in-memory trace is
session-only; console logs are the durable diagnostic evidence.

The read-only map_media.lua helper records inventory identity, native read-map
lists and loaded carrier item IDs/types. Unloaded and truncated snapshots are
explicitly incomplete. It does not move the player, create test items, force
containers explored, load cells or prepare stashes.

This checkpoint deliberately does not establish safe clue insertion timing.
Phase 0 observation must precede a controlled insertion/coexistence experiment.
Gate A and full-catalogue storage remain open.
