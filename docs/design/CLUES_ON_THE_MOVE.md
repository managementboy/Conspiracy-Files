# Clues on the move (P4-R134)

- **Status:** Built 2026-09-17 (build order 1-5; the real-game checks of step 6
  are separate). Owner approved the shape ("implement 1 to 11"), after it was
  raised as the later candidate in P4-R133. What the code forced is at the
  bottom of this file, under "What the build settled".
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

## What the build settled

Seven things the code decided that the design above left open. None of them
needs an owner decision; all of them are in the tests.

1. **A carrier is not checked against a site's `containerTypes`, and a car part
   is.** That list records the fixed storage the scan observed inside the
   building, and a body in the yard will never be in it - so requiring it would
   have made a carrier clue unplaceable in principle. A carrier target is
   validated by its kind, its mark and the site's footprint instead
   (`Session.CARRIER_RADIUS`, twelve tiles, the same as a car's).

2. **The mark names the carrier, not the clue.** A car part carries the
   assignment's own physical token; if a carrier did the same, two clues could
   each stamp their own mark on one body and the register would see two
   containers. So the mark is minted per carrier (`Carriers.newMark`) and
   `Session.physicalKey` keys a carrier on that mark **alone** - not on a
   square, because a zombie stays on none and two bodies may lie on one.

3. **The carrier is claimed before the clue is written.** The mark goes onto the
   body first and the ordinary placement job then resolves it, so between
   choosing and writing nothing else can take the same body.

4. **The filler is what reaches for a carrier, not only the generator.** Fixed
   containers running out near a settled player is the whole of P4-R133's
   fault, and that shortage is felt by the filler. So when no free container is
   loaded at a waiting clue's own site, the filler looks for a carrier there -
   which is where this decision actually pays. At creation the generator
   *prefers* a mobile candidate for the one clue that may be mobile (the case's
   last document, so the opening clue never drives off); after that any waiting
   clue may take a carrier while the case has none.

5. **"Gone" needs an hour of its own.** P4-R133's expiry is measured from
   `deferredHours`, which a placed clue does not have. A placed clue on a
   carrier gets `missingHours` instead - the in-game hour we FIRST could not
   find the body - and is dropped at the same 72 hours. It is only ever set
   where the survivor was close enough to have looked (`Carriers.FIND_RADIUS`),
   and cleared the moment the carrier turns up, because a zombie in an unloaded
   cell is not a zombie that is gone. A dropped carrier clue ends up in exactly
   the shape of a clue that never arrived: no target, its site remembered, no
   row in the finished record, and nothing anywhere saying it is lost
   (P4-R104).

6. **A clue on a carrier does not relocate.** Relocation gives a clue one new
   home when nobody came looking; a body or a zombie has already moved of its
   own accord, and taking the note out of a dead man's jacket to put it in a
   drawer would undo the find this whole decision exists for. Expiry is its
   answer to going stale.

7. **The case's own person is never a carrier.** `CasePerson` re-dresses her
   after a reload and re-binds her to a new body when hers is lost; two systems
   writing into one body's inventory is a fault waiting to happen. The carrier
   code reuses CasePerson's *pattern* - the bounded zombie-list scan, the
   ModData mark, the inventory path, the keyed read of P4-R124 - in its own
   module (`shared/ConspiracyFiles/Carriers.lua`) rather than calling into a
   system whose marks mean something else.

Also: a clue's Search Mode icon is now picked up and put down only once its
clue has moved more than `ClueSearchRules.MOVE_TILES` (two tiles). Re-adding an
icon restarts the game's own spot timer, so at zero tolerance a clue on a
walking zombie could never have been spotted at all.

**Still unverified in a real game** (build order 6): the mailbox's own container
type string on Build 42.20, named once as `Generated/Storage.MAILBOX` and listed
in `Generated/Storage.UNVERIFIED`; and `IsoGridSquare:getDeadBodys()`, which is
how a corpse carrier is found. Both fail closed - a wrong string or a missing
method means no candidate at all, which is exactly the state before this
existed, and neither can put a clue somewhere wrong.
