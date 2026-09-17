# Clues on the move (P4-R134)

- **Status:** Design, 2026-09-17. Not built. Owner approved the shape ("implement
  1 to 11"), after it was raised as the later candidate in P4-R133.
- **Game:** Build 42.20.
- **Related decisions:** P4-R67 (each clue in a different container), P4-R125
  (a refused case waits for the survivor to move on), P4-R133 (instalments and
  honest refusals), P4-R132 (clues are found by searching), P4-R115 (a body's
  clothes may disagree with the clues on it), P4-R106 (how a car's containers
  are reached), P4-R17 (500 KB save).

## Why

Fixed containers are a finite resource near a settled player: that is the whole
of P4-R133's fault. Carriers that move are not finite. A body in the street, a
zombie that wanders into the yard, a parked car's glovebox and a mailbox at the
gate are all distinct, all replenishing, and all places a survivor already
searches. Finding a note in a dead man's jacket at your own fence is a better
moment than the twelfth cupboard.

## What already exists

Two of the four carriers are proven in this mod, which is why this is small.

- **A body or a zombie.** `CasePerson` already binds a case's person to a
  nearby zombie or corpse, dresses it, and puts an item into its inventory
  (`P.bind`, `dress`, `AddItem(P.CARD)`). A clue is the same operation with a
  clue item.
- **A car part.** A clue can already live in a car: the target carries
  `vehiclePart` and `vehicleMark`, and `VehicleProbe` finds the marked part
  again **wherever the vehicle now is**, within 200 tiles. That is exactly the
  "container that moved" problem, already solved and proven in the game.
- **Fixed containers today** are `desk`, `counter`, `shelves`, `filingcabinet`,
  `locker` (`Storage.lua:6`). A mailbox is not among them and is the only new
  container kind this needs.

## The shape

A third target shape beside "fixed container" and "car part": a **carrier
target**.

| Carrier | Where the clue goes | How it is found again |
|---|---|---|
| Fresh corpse | the body's own inventory | the mod's mark on the body, scanned nearby |
| Wandering zombie | its inventory | the mark, when it is killed and searched |
| Car part | glovebox, boot, truck bed (existing) | the part's mark, wherever the car is |
| Mailbox | a new fixed container kind | its square, as today |

Rules that stay:

- **Never two clues on one carrier.** The distinctness register keys on the
  carrier's own mark, exactly as it keys on a container today.
- **Never invented loot.** The mod does not spawn the carrier. It uses a body,
  zombie, car or mailbox that the world already put there. If none is in reach,
  the case simply waits, as P4-R133 says.
- **Reachability.** A clue on a wandering zombie is reachable by definition; a
  clue in a car obeys P4-R106 (a glovebox from a front seat, a truck bed from
  outside).
- **Searching still finds it (P4-R132).** A carrier gets the same clue icon in
  Search Mode as a container, anchored to the carrier's current square, and the
  same wordless cue. A zombie carrier's icon moves with it.
- **Nothing is said about what it is.** A body with a clue is not marked as
  special: it looks like any other body until searched.

## What must be decided while building

1. **A carrier that leaves.** A zombie can wander off, a car can be driven
   away by nobody, a body can be burned. The clue's whereabouts already handle
   "not seen recently" (P4-R104), and P4-R133's expiry already drops a clue
   that cannot be placed. A carrier that is gone for three in-game days is
   dropped the same way, and the case closes on the clues it got.
2. **Bodies the player made.** A zombie the survivor killed is the most likely
   body they will search. A clue may be placed on one, but only before it is
   searched, never while the loot window is open on it, and never on a body the
   survivor has already emptied.
3. **How many of a case's clues may be mobile.** Default: at most one. A case
   whose every clue walks away is not an investigation.

## Build order

1. The carrier target shape in the session schema, validated, with the
   distinctness register keyed on the carrier mark. Pure Lua, tested first.
2. Corpse and zombie carriers, reusing CasePerson's inventory path and its
   mark; the clue-search icon following the carrier.
3. Mailboxes as a container kind in `Storage`, with the game's own container
   type checked in a real game first.
4. Car parts: no new work beyond letting the case generator choose one
   deliberately rather than by chance.
5. Expiry and the "gone" case, sharing P4-R133's expiry.
6. Checks: a real-game check that places a clue on a body and on a zombie,
   searches it out, drives the car away and still finds the clue, and a
   `prove.py` mutation.

## Risks

- **A clue that walks into a horde** is effectively lost. Expiry covers it, and
  the record never claims the clue is gone, only that it was last seen
  somewhere (P4-R104).
- **The player's own kills** are the busiest carrier pool; the guards in point
  2 above are what keep a clue from appearing in a body the survivor is looking
  at.
- **Save cost:** a carrier target is about the size of a car target, which the
  budget already carries.
- **Determinism:** the case's content still comes from its seed. Only where a
  clue lands may differ.
