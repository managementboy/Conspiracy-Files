# Object-set holders (No Help, owner decision 2026-10-03)

An object set of 2-4 pieces is found as ONE thing: a vanilla bag, box or case
(the holder, plain game name) with the pieces inside. Pieces keep their own game
names. A single-piece set has no holder.

## Which holders
`tools/extract_set_holders.py` parses the installed game's
`media/scripts/generated/items/container.txt` (every `ItemType = base:container`,
308 in Build 42.21) into `shared/NHShared/Generated/HolderData.lua` (build id
recorded). Nothing is picked by us. Only containers that refuse ordinary items are
left out: those with an `AcceptItemFunction` (wallets, key rings, ammo straps,
holster: 41). 267 remain.

## The pick (`NHShared/SetHolders.lua`, pure) - owner algorithm
Deterministic from `hash(world seed, clue id, attempt number)`, so identical after
a reload or a relocation:
1. Candidates = every holder with capacity >= total piece weight (weights from
   the game's item scripts via ObjectCatalogue) and a MaxItemSize that allows
   every piece (not the same item as a piece). This is the only preselection.
2. Draw one at random (attempt 0).
3. Does it fit the TARGET it is placed into? Free weight (the real container's
   capacity less its contents, read from the game; the holder counted with its
   contents at full weight) and, as a size proxy for the target's own item-size
   limit, holder capacity <= target capacity. World containers define no
   MaxItemSize of their own; the game checks weight only. Yes: use it.
4. No: draw again (attempt+1) from only the candidates smaller than the one that
   failed (capacity, then weight, then id). Every pool is strictly smaller, so
   the loop ends.
5. If even the smallest does not fit, no holder: pieces are placed loose.
Open ground has no limit, so its first draw always stands. Relocation keeps the
old holder kind and checks the destination's room as before.

## Interactions
- **Placement**: pieces are created, put inside the holder, and only the holder
  is added to the target (container, ground, vehicle, corpse). If the holder
  cannot be made or refuses a piece, pieces are placed loose as before.
- **Identity**: holder carries `cfGeneratedId`, `cfPhysicalToken`, `cfHolder=true`;
  pieces carry them plus `cfPiece` (1..n). Counting (`World.count`,
  `identityScan`) skips holders, so a set still counts as its pieces and nothing
  else (placement, conflict check, guard) changed. Recognition stamps both
  (`stampReachable` walks into bags).
- **Hint / Search Mode icon / find**: all are keyed on the clue id and the target
  container, so one set is one hint, one icon, one find. The hint's "still there?"
  check also counts a holder (`withHolders`), so an emptied holder or loose pieces
  both still count.
- **Relocation**: moves the holder with fresh pieces, same holder kind, only when
  exactly one holder holds every piece, none loose, none carried (the carried
  check counts holders too).
- **Look it over / Inspect**: work on the holder like any clue item. The spoken
  caption plays on the holder; a piece lying inside its holder speaks only if
  the set has not spoken this session.
- **Old saves**: a set placed without a holder has none; relocation keeps the
  plain loose rule and never adds one. Unplaced sets get a holder when placed.

## Risks
The size proxy (holder capacity <= target capacity) is ours, not a game rule.
Relocation can still be refused by room and then leaves the set where it is.
