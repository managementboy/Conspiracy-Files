# Where clues are allowed to live — deferred, 2026-09-20

**Original exploration status: agreed in principle, deliberately NOT built.** The owner asked to hold
off because the writing layer is being reimagined in a separate session, and the
change below is mostly a change to what the mod can *say* about a hiding place.
Revisit once that rework lands. Nothing in `ContainerWords.lua` or its successor
was touched.

## Implementation update in the writing rebuild

The owner relayed this note to the active implementation task. The first-step
source change now lives on local main: eight non-floor kinds, up to eight
physical candidates per kind, continued scanning after repeated kitchen storage,
and seeded choice between equally suitable kinds. This is untested source;
Claude owns builds and native acceptance after the full writing implementation.
See `../management/WRITING_REBUILD_STATUS_2026-09-20.md`. The original exploration
and parked proposals below remain the historical rationale, not additional scope.

## The complaint, and the measurement behind it

The owner started three consecutive games. Every opening clue was in a kitchen
cupboard.

That is not bad luck. `Generated/Storage.lua` allows six container kinds — desk,
counter, shelves, filingcabinet, locker, and (since P4-R134) the mailbox. Those
are office furniture. An ordinary Knox house contains almost none of them except
counters, so "kitchen cupboard" is close to the only legal answer.

Census taken in a real game, 2026-09-20, four residential blocks in Muldraugh,
counting every container inside a building by type and room:

| in houses | count | allowed today |
|---|---:|---|
| counter (kitchen) | 51 | yes |
| dresser | 16 | no |
| wardrobe | 12 | no |
| side table | 11 | no |
| shelves | 11 | yes |
| fridge | 7 | no |
| stove | 7 | no |
| microwave | 5 | no |
| overhead cupboard | 3 | no |
| dishes cabinet | 2 | no |
| bin | 2 | no |
| desk | 2 | yes |
| filing cabinet | 1 | yes |

Counters are roughly **78% of the legal hiding places** in a house, and bedrooms
currently contain nothing eligible at all.

## Where the six came from

Nowhere. They appear fully formed inside one large feature commit (`8101d2b`,
2026-09-06, "add generated investigations and local evidence links"), with no
note, no rationale and no entry in `DECISIONS.md`. Since then the list has been
quoted rather than questioned — `docs/design/CLUES_ON_THE_MOVE.md` states it as
a fact about the world before adding the mailbox to it.

The only part with a real decision behind it is that mailbox, P4-R134, whose
reasoning already anticipated this complaint from the other direction: *"fixed
containers run out near a settled player... a note in a dead man's jacket at the
fence is a better find than the twelfth cupboard."*

## The premise most of the analysis got wrong

**The player does not loot for evidence.** The mod signals that something is off
nearby and the player uses Search Mode with the Clues focus — the game's
*foraging* loop, not the looting loop (`ClueSearchRules.lua`, P4-R132): a clue
gains an icon within 16 tiles, the focus doubles the spot rate and extends reach
by half, the pin lingers 8 seconds, and a clue on a carrier re-pins when it moves
more than 2 tiles.

So the container a clue sits in **barely affects whether it is found.** The
whitelist was never a difficulty control. It is a restriction on *texture*, and
it should be judged as one. It also means foraging already reaches places a
container list cannot express at all: open ground, gardens, doorways, thresholds.

## The proposal, when the writing rework lands

Owner's own framing, 2026-09-20: *"expand the placement to any place an object
can be placed but for the floor."*

1. **Open the list** to any container kind, excluding the floor. This drops
   kitchen counters from ~78% of legal spots to roughly 30% of all containers in
   a house.
2. **Keep eight KINDS, not eight containers.** This is the half that actually
   fixes it. `Storage.scan` stops collecting once a site has 8 candidates
   (`#candidates[id]>=8`) and walks tiles in raster order, so the eight slots
   fill with whatever is commonest *before* the scan reaches anything rare.
   Opening the list without this still yields kitchens, because counters are both
   the most numerous and among the first met. Same walk, same cost — only which
   finds are retained changes.

**The writing is already ahead of the rules.** `ContainerWords.PHRASES` defines
about twenty-one phrases, most for containers placement never uses: *In a chest
of drawers*, *In a wardrobe*, *In a fridge*, *In a bin*, *In a medicine cabinet*,
*In a toolbox*, *In a freezer*, *On a clothing rack*. Unlisted kinds fall back to
the game's own title, so nothing reads as a raw id. The floor is already listed
in `M.NO_KIND` as a type that says nothing and needs its own wording — the
owner's "but not the floor" independently matched what was already written down.

## Decide these rather than discover them

- **Containers the player can take whole or dismantle** (cardboard box, crate).
  A clue inside one can be carried to a base without the mod knowing, leaving its
  record stale. Not fatal — it is the same class of problem as a clue on a
  corpse — but it should be a choice.
- **Loot parity.** Opening everything includes military crates and lockers, which
  sit in the scenes where the base game already puts rifles. A clue beside a gun
  reads as a jackpot marker, which cuts against evidence never being better loot
  (P4-R110). Consider excluding by loot tier rather than by taste.

## Deliberately out of scope for that first step

**The floor, and therefore the outdoors.** Excluding it is the right call for a
first pass, but note what it costs: the search mechanic is built on foraging and
is strongest outdoors, and in an intact never-looted house — which is the
anchored first case every player meets (P4-R66) — a doorway, porch step or the
ground under a mail slot is the *only* varied option available. Worth revisiting
after the expanded version has been played.

## Ideas parked from the two exploration runs

Kept because they were expensive to reach, not because they are approved.

- **Rarity decides, not a list.** Spawn chance inversely proportional to how
  common that furniture is nearby, so the single filing cabinet in a house is
  near-certain and counters nearly never. Owner reaction: *"nice"*.
- **Disturbance decides.** Eligibility as a local mess/threshold/return-channel
  score rather than a furniture name. Caveat found: an intact house scores zero
  on mess, so the anchored first case has only the threshold strand.
- **Evidence that cannot be picked up** — an absence, an arrangement,
  wrong-sided carpentry, something still being maintained. Satisfies "never
  better loot" by construction, since there is nothing to take. The engine
  supports it today: `ClueSearch.addIcon` pins bare x,y,z and uses a throwaway
  item only for size maths. The real obstacle is *authority*: an arrangement
  lives in the game's chunk save, which the mod does not own and cannot cheaply
  audit, so it can be dismantled without the mod ever being told.
  - If ever built: **pin a member the survivor can stand beside, never the
    centroid.** A clue 3.54 tiles from any standable square went unspotted
    through 156 seconds of real searching (evidence `20260917T215847-clue-field`)
    because the vision check clamps to a 3-tile minimum radius.
  - And: **absence by addition, never deletion.** Removing a vanilla object to
    create a gap destroys the mod's own witness and makes `absent`
    indistinguishable from `unknown`.
- **The empty stash.** A hiding place found already emptied — cut stitching,
  loose stuffing, a taped bag with nothing in it. Costs no items and no loot, and
  breaks the assumption that every spotted icon pays out.
- **The half-burnt page**, one corner surviving, in the cold ash of a fireplace.
  A story with no words in it; fireplaces and wood stoves are already in houses.
- **Above eye level** — lampshades, fan blades, behind a smoke alarm. Probably
  has no engine object behind it; carry it as a height offset on the pin and a
  slower spot rate instead, so the mod never claims a lampshade and the player
  simply has to look up.
