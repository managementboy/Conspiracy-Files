# Build 42 runtime basements — observed 2026-09-06

Verified against installed `42.20.4`, revision `b0bbce05d5`, during a live
session. Owner-confirmed in game.

## Finding

Build 42 attaches basements to buildings **procedurally at runtime**. They are
not present in the static map data, so **online map viewers (B41-era) show no
basement even where one exists in game.** An online map is therefore not
evidence that a `z = -1` clue site is invalid.

Evidence chain from the live session:

1. `GeneratedDiagnostic` resolved all three basement targets at
   `10876,10078,-1` and `10876,10079,-1`, walking real furniture
   (counter with Phonebook, shelves with Paperwork/Notepad) and confirming
   `matchesExpectedToken=true` for each placed document.
2. The owner checked the same coordinates on an online map: no basement.
3. `console.txt` carries `Basements.mergeRoomsOntoMetaCell`, proving a runtime
   basement subsystem is active.
4. The owner then found the interior stairwell in game and descended.

## Data in the install

Basement rooms come from templates whose filenames encode their stair
position, i.e. every template ships with access:

    media/binmap/basement1.pzby, basement2.pzby
    media/binmap/basement_10x10_1story_{NE,NW,SE,SW}stairsN.pzby
    media/binmap/basement_7x7_1story_{S,SW,W}stairs{N,W}.pzby

Access pieces are separate, 147 of them in `media/basement_access/`:

    ba_interior_north*, ba_interior_west*      -- stairs inside the building
    ba_exterior_*                              -- sunken stairwell / cellar
                                                  door against an outside wall
    ba_house_medium_22_redbrick*, ba_house_large_01_*, ba_house_country_*,
    ba_house_small_*, ba_house_suburb_*        -- building-specific

The majority are `ba_exterior_*`, so **basement access is often outside the
building footprint**. When a clue is placed in a basement and the entrance is
not obvious, check the outside perimeter before assuming the site is broken.

## Consequences for Conspiracy-Files

- A `z = -1` site is legitimate and must not be excluded on the assumption
  that basements do not exist.
- Reachability cannot be judged from static map data or from the building
  footprint alone, because the entrance may sit outside it.
- `IsoGridSquare:HasStairs()` is the runtime check for a staircase square
  (used by vanilla `ISInventoryTransferAction`, `ISBuildUtil`,
  `ISPlace3DItemCursor`).

## Open question

Whether the generator should confirm a reachable path into a basement before
placing a clue there is **not settled by this note**. This case happened to be
reachable. `Reach.lua` has not been shown to verify basement access.
