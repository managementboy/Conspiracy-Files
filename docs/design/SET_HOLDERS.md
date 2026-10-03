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

## The pick (`NHShared/SetHolders.lua`, pure)
Among holders where capacity >= total weight of the pieces (weights from the
game's item scripts, via ObjectCatalogue), no piece is above the holder's
MaxItemSize, and the holder is not the same item as a piece. The holder is
`hash(world seed, clue id)` modulo that list, so it is identical after a reload
or a relocation. No room or place preselection.

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
A big holder may be randomly chosen for a small container (owner: no
preselection); the relocation room check then keeps the set where it is.
