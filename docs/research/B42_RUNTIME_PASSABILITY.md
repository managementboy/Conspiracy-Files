# Build 42 square passability and stair-linking — verified 2026-09-06

Read against the installed game at
`C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua`
(same install as `B42_RUNTIME_BASEMENTS.md`). Every call cited below is
quoted from vanilla Lua source, not assumed. This note exists to justify the
oracle `ConspiracyFiles/ReachabilityRequest.lua` + `ReachabilityAdapter.lua`
feed into `ConspiracyFiles/Connectivity.lua`.

## Single-square walkability

Vanilla's own "can an item/character occupy this square" check —
`ISTransferAction:canDropOnFloor`
(`shared/TimedActions/ISTransferAction.lua:21-44`):

```lua
function ISTransferAction:canDropOnFloor(square, character)
    if not square then return false end
    if not square:TreatAsSolidFloor() then return false end
    if square:isSolid() or square:isSolidTrans() then return false end
    ...
```

The same three predicates recur throughout vanilla, e.g.
`server/BuildingObjects/ISPlace3DItemCursor.lua:90`:
`square:isSolid() or square:isSolidTrans() or not square:TreatAsSolidFloor()`,
and `client/ISUI/ISWorldObjectContextMenu.lua:695`. Adopted verbatim as
`ReachabilityRequest.walkable(square)`:

- `square:isSolid()` — solid content occupies the square.
- `square:isSolidTrans()` — a solid-but-see-through occupant (counters,
  fences) still blocks standing there.
- `square:TreatAsSolidFloor()` — there is a floor to stand on at all (false
  over an open stairwell shaft or a hole).

## Horizontal blocking between two adjacent squares

Same function, one square over (`ISTransferAction.lua:33`):

```lua
if current:isBlockedTo(square) or current:isWindowTo(square) then
    return false
end
```

`isBlockedTo` is the general wall/obstacle-between-two-squares check; it is
used the same way in `client/Foraging/ISBaseIcon.lua:258,287` (sightline
across a shared edge) and `client/Foraging/ISZoneDisplay.lua:401`.
`isWindowTo` additionally blocks a shared edge that is merely a window (you
can see through it, but vanilla does not let ordinary movement cross it).
Both take the *other* square as the sole argument and are evaluated on
adjacent squares at the **same z** — nothing in vanilla calls either across
a z change. `ReachabilityRequest.wallEdges` calls both exactly this way to
populate `Connectivity`'s `blockedEdges`.

## Per-square stair marker

`IsoGridSquare:HasStairs()` — already established in
`B42_RUNTIME_BASEMENTS.md` from `ISInventoryTransferAction.lua:601` and
`ISBuildUtil.lua:441`; also used in the *same* `ISTransferAction.lua:36,39`
function above (`current:HasStairs() ~= square:HasStairs()`) and in
`server/BuildingObjects/ISPlace3DItemCursor.lua:149`
(`square:HasStairs() or square:hasSlopedSurface()`). This is the only
per-square stair fact this adapter treats as trustworthy.

## Stair links (z transitions) — verified, but only partially, hence the conservative model

Two different pieces of vanilla code describe where a staircase's *top
landing* square sits relative to the stair tiles themselves, and they do not
agree closely enough to hardcode a single tile offset:

- `server/BuildingObjects/ISWoodenStairs.lua:227-259` (`getSquare2Pos`,
  `getSquare3Pos`, `getSquareTopPos`) places a 3-tile staircase run
  (`square`, `squareA` one tile back, `squareB` two tiles back) and puts the
  top landing **three** tiles back from the placement square, at `z+1`
  (`getSquareTopPos` returns `x,y,z+1` with the run's directional offset
  applied three times — line 259: `return x, y, z + 1`).
- `server/BuildingObjects/ISBuildUtil.lua:438-480`
  (`stairIsBlockingPlacement`) instead checks `hasStairElements(x,y,z-1,
  {IsoObjectType.stairsTN})` — i.e. treats the top-of-stairs object as
  directly **below**, same `x,y`, the square being tested — for the
  direction-known case, but checks an **additional** one-tile offset
  (`x,y+1,z-1` / `x+1,y,z-1`) for the direction-unknown case.

Both readings agree the transition is always exactly one z level (never a
skip), and that the landing sits within one horizontal tile of the topmost
`HasStairs()` square in the direction of the climb. Neither gives a single
formula reliable enough to hardcode blind — getting this wrong is exactly
the class of bug this whole effort exists to close (a false vertical link
would let the flood fill "prove" a basement reachable when it is not).

**Chosen model** (`ReachabilityRequest.stairLinks`): for every square with
`HasStairs()==true` at `(x,y,z)`, look at the 3x3 horizontal neighbourhood at
`z+1` and `z-1`. A neighbour becomes a declared stair link **only if it is
independently walkable there** (same `walkable()` check as above, using the
real oracle — never assumed). This can only ever be conservative in the safe
direction: a square that is not independently a real, standable place can
never contribute a link, so the search can miss a real link (basement stays
unproven, falling back to the pre-existing safe behaviour) but can never
fabricate one just from z-adjacency. `test/connectivity.lua` tests 3–4
already prove `Connectivity` treats plain z-adjacency as no movement at all
without a declared link; this adapter never overrides that guarantee, it
only ever adds a link that is separately justified.

## Known limitation

- The 3x3-neighbourhood search assumes the landing is within one tile of the
  topmost stair square; both vanilla readings above support that, but a
  staircase design out of scope for the sources actually inspected could
  defeat it (proving too little, never too much — the gate then simply
  declines to place there, matching `AGENTS.md`'s "never place anyway").
- `ReachabilityAdapter` only ever declares two z-levels per site (ground and
  the site's own reported minimum), matching the single-basement-level
  layouts observed in `B42_RUNTIME_BASEMENTS.md`. A building with more than
  one level below ground would need its intermediate levels added to
  `zLevelsFor` in `ReachabilityAdapter.lua`; nothing currently reports having
  seen one.
- The search box is the site's own footprint plus a fixed margin
  (`ReachabilityRequest.MARGIN`, 6 tiles) to catch the frequently-exterior
  basement access noted in `B42_RUNTIME_BASEMENTS.md`. A stairwell entrance
  further than that from the building footprint would not be found; the
  margin is a bounded-cost tradeoff (`Connectivity`'s own `MAX_STAIRS` /
  `MAX_BLOCKED_EDGES` caps, and per-frame budget), not a claim that no such
  layout exists.
