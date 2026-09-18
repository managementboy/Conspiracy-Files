# Clues on the move (P4-R134)

- **Status:** Built 2026-09-17 (build order 1-5; the real-game checks of step 6
  are separate). Owner approved the shape ("implement 1 to 11"), after it was
  raised as the later candidate in P4-R133. What the code forced is at the
  bottom of this file, under "What the build settled".
- **Checked in a real game 2026-09-18. Three faults were found and all three
  are fixed** (see "What the running game said", at the end):
  1. a clue on a **fresh corpse could not happen at all** - `IsoDeadBody`
     answers `getInventory()` with nil, and the carrier code read that call;
  2. a **mailbox could never be offered** - every postbox stands outside every
     room rectangle and the scan only looked inside one;
  3. a clue on a **walking zombie could not be spotted** - the game turns
     Search Mode off beside a zombie. That one was a collision between two
     decisions rather than a slip, and the owner settled it: **P4-R136, only a
     corpse carries a clue.** The zombie carrier, its scan and its wording are
     gone.
- **Game:** Build 42.20.
- **Related decisions:** P4-R67 (each clue in a different container), P4-R125
  (a refused case waits for the survivor to move on), P4-R133 (instalments and
  honest refusals), P4-R132 (clues are found by searching), P4-R115 (a body's
  clothes may disagree with the clues on it), P4-R106 (how a car's containers
  are reached), P4-R17 (500 KB save).

## Why

Fixed containers are a finite resource near a settled player: that is the whole
of P4-R133's fault. Carriers that move are not finite. A body in the street, a
zombie the survivor killed in the yard, a parked car's glovebox and a mailbox
at the gate are all distinct, all replenishing, and all places a survivor
already searches. Finding a note in a dead man's jacket at your own fence is a better
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
| A body | the body's own inventory, which the engine calls `getContainer()` | the mod's mark on the body, scanned nearby |
| Car part | glovebox, boot, truck bed (existing) | the part's mark, wherever the car is |
| Mailbox | a fixed container kind, offered from a band around the site | its square, as any container |

A **walking zombie is not a carrier** (P4-R136). One the survivor kills is an
ordinary body from that moment and may be chosen then.

Rules that stay:

- **Never two clues on one carrier.** The distinctness register keys on the
  carrier's own mark, exactly as it keys on a container today.
- **Never invented loot.** The mod does not spawn the carrier. It uses a body,
  a car or a mailbox that the world already put there. If none is in reach,
  the case simply waits, as P4-R133 says.
- **Reachability.** A body in the street is reachable where it lies; a clue in
  a car obeys P4-R106 (a glovebox from a front seat, a truck bed from
  outside).
- **Searching still finds it (P4-R132).** A carrier gets the same clue icon in
  Search Mode as a container, anchored to the carrier's current square, and the
  same wordless cue. This is why a walker cannot be one: the game turns Search
  Mode off when a zombie is close.
- **Nothing is said about what it is.** A body with a clue is not marked as
  special: it looks like any other body until searched.

## What must be decided while building

1. **A carrier that leaves.** A body can be burned, buried or dragged away, a
   car can be driven off. The clue's whereabouts already handle
   "not seen recently" (P4-R104), and P4-R133's expiry already drops a clue
   that cannot be placed. A carrier that is gone for three in-game days is
   dropped the same way, and the case closes on the clues it got.
2. **Bodies the player made.** A zombie the survivor killed is the most likely
   body they will search, and since P4-R136 it is the ONLY kind of carrier. A clue may be placed on one, but only before it is
   searched, never while the loot window is open on it, and never on a body the
   survivor has already emptied.
3. **How many of a case's clues may be mobile.** Default: at most one. A case
   whose every clue walks away is not an investigation.

## Build order

1. The carrier target shape in the session schema, validated, with the
   distinctness register keyed on the carrier mark. Pure Lua, tested first.
2. Corpse carriers, reusing CasePerson's inventory path and its mark; the
   clue-search icon following the carrier. *(A zombie carrier was built too and
   removed the next day: P4-R136.)*
3. Mailboxes as a container kind in `Storage`, with the game's own container
   type checked in a real game first. *(Checked 2026-09-18: it is `postbox`,
   and it stands in no room - see "What the real game answered" and fault 2
   below, which is what the band around each site is for.)*
4. Car parts: no new work beyond letting the case generator choose one
   deliberately rather than by chance.
5. Expiry and the "gone" case, sharing P4-R133's expiry.
6. Checks: a real-game check that places a clue on a body, searches it out,
   drives the car away and still finds the clue, and a `prove.py` mutation.

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
   square, because two bodies may lie on one and a body may be dragged off the
   one it died on.

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
   and cleared the moment the carrier turns up, because a body in an unloaded
   cell is not a body that is gone. A dropped carrier clue ends up in exactly
   the shape of a clue that never arrived: no target, its site remembered, no
   row in the finished record, and nothing anywhere saying it is lost
   (P4-R104).

6. **A clue on a carrier does not relocate.** Relocation gives a clue one new
   home when nobody came looking; a body is where the world left it, and
   taking the note out of a dead man's jacket to put it in a
   drawer would undo the find this whole decision exists for. Expiry is its
   answer to going stale.

7. **The case's own person is never a carrier.** `CasePerson` re-dresses her
   after a reload and re-binds her to a new body when hers is lost; two systems
   writing into one body's inventory is a fault waiting to happen. The carrier
   code reuses CasePerson's *pattern* - the bounded stepped scan, the ModData
   mark, the inventory path, the keyed read of P4-R124 - in its own
   module (`shared/ConspiracyFiles/Carriers.lua`) rather than calling into a
   system whose marks mean something else.

Also: a clue's Search Mode icon is now picked up and put down only once its
clue has moved more than `ClueSearchRules.MOVE_TILES` (two tiles). Re-adding an
icon restarts the game's own spot timer, so at zero tolerance a clue on
anything that moves - a body being dragged, a car - could never have been
spotted at all.

## What the real game answered (2026-09-18)

Both unverified facts were put to the running game, and one of them was wrong.

**The mailbox is a `postbox`.** `Generated/Storage.MAILBOX` held the guess
`"mailbox"`. A real game found **five `postbox` containers within 40 tiles** of
the survivor, six within 60, and **no `mailbox` at all** among the 26 container
types on 6,561 loaded squares (`tools/autotest/checks/carriers.sh`, evidence
`20260918T002532-carriers.txt`). So while the guess stood, a mailbox could never
be chosen - it failed closed exactly as P4-R135 point 4 promised, and no clue
was ever placed wrongly. `Storage.MAILBOX` is now `"postbox"`, the engine's own
word, and `Storage.UNVERIFIED` is empty. `Generated/Catalog`'s allow-list takes
the same word, or a site that reported a postbox would be refused as a site.

**The word the player sees is "mailbox".** The engine's word is not the
survivor's: a Kentucky survivor writes "mailbox", never "postbox". So the record
says **"In a mailbox at 102 Dewey St."** The engine string is named once
(`Storage.MAILBOX`) and the phrase is keyed on it in `ContainerWords`, which is
the same arrangement that already reads a `counter` as "In a cupboard".

**A clue on a carrier says what it is on.** A body's inventory answers the
container type `none`, and the record duly read `accounted In a none at 102
Dewey St.` (campaign `20260917T234706`). `none` is not a kind of container and
is never worded as one, so a carrier gets words of its own:

| carrier | the record says |
|---|---|
| a body | `On a body at 102 Dewey St.` |
| a body in a building the book cannot name | `On a body close by.` |

A body lies **at** an address and will still be there. The line never says the
clue is lost (P4-R104). *(The `On a zombie near ...` phrasing existed until
P4-R136 and is now deleted rather than kept: with no zombie carrier, no path
could reach it.)*
The same wording serves every surface, because they all read the one whereabouts
line: the case record, the PDA's FILES WHERE line, and a finished case's
last-seen line. A container that declares no type and is not a carrier reads
"In something at 102 Dewey St." - we know it is inside something and not what.

**`IsoGridSquare:getDeadBodys()` works**: the same run found bodies parked beside
the survivor and the mod's own scan offered two usable carriers from them.

> **Correction, 2026-09-18.** The second half of that sentence was wrong. The
> two usable carriers of `20260918T001512` were the two **live zombies** the
> same call parked, read out of the cell's zombie list; the corpses beside them
> were refused. `getDeadBodys` does return the bodies - `Carriers.refusal` then
> rejected every one of them, for the wrong inventory call. Fixed the same day.

**And a body's inventory is `getContainer()`, not `getInventory()`**, which is
fault 1 below. Both engine facts are verified now and `Storage.UNVERIFIED` is
still empty.

## What the running game said (2026-09-18)

Run on the Linux machine at commits `dbbf659` and before; every number is in
the evidence file named beside it.

### What works

Everything below is from a run of `body_carrier.sh` at commit `af9b236`,
**PASS**, `20260918T060108-body-carrier.txt`, except where another file is
named.

| what | seen | where |
|---|---|---|
| a fresh corpse usable at all | **yes**: `corpses the mod would use: 4 of 4`, where the same check had said 0 of 4 before the fix | `20260918T060108` (`20260918T035135` before) |
| a walking zombie refused (P4-R136) | **yes**: the two walkers parked beside those bodies read `refusal=not a carrier`, and the mod's own scan saw `4 usable (corpse=4)` - no zombie at all | `20260918T060108` |
| a clue placed on a **body** by the filler, as an instalment at a site with no free container | **yes**: `generated:465571758:document-3`, five bodies parked at the waiting clue's own site, the survivor 25 tiles off | `20260918T060108` |
| the record's words for it | **yes**: `On a body at 102 E Maple St.` | `20260918T060108` |
| the clue really in the body the mod marked | **yes**: `in its inventory=true item=Notepad container type=inventoryfemale carrier=corpse at 10880,10156` | `20260918T060108` |
| a clue placed on a carrier at all, before P4-R136 | yes, on a zombie: `1442066456:document-4:placed:zombie` | `20260918T032829-instalments.txt` |
| the guards on a real body (fresh, loot window open, already searched) | **yes**, 2026-09-18 | `20260918T002532-carriers.txt` |
| a carrier clue that is gone expiring | **yes**, `ev=stale why=expired` (with the hour shortened for the run) | `20260918T032829-instalments.txt` |

### Fault 1, FIXED: a fresh corpse was never a carrier

`tools/autotest/checks/body_carrier.sh` parked four corpses and two walkers
beside the survivor and asked the engine about each
(`20260918T035135-body-carrier.txt`, FAIL):

    body@10839,10150 IsoDeadBody getInventory=nil getContainer=inventorymale
                                 getItemContainer=inventorymale
                                 refusal=no inventory
    walker@10843,10149 IsoZombie getInventory=none getContainer=nil
                                 getItemContainer=nil
                                 refusal=none, usable

    within 10 tiles: 4 dead bodies on squares, 2 walkers, 2 usable as a carrier
    corpses the mod would use: 0 of 4

**The cause:** `Carriers.stateOf` read `getInventory` for every kind of carrier.
On Build 42.20 that is the right call for an `IsoZombie` and returns **nil** for
an `IsoDeadBody`, whose inventory is `getContainer()` (equivalently
`getItemContainer()`, type `inventorymale`). So `refusal` said "no inventory"
for every fresh body and the design's own headline example - a note in a dead
man's jacket at your own fence - could not happen.

**The fix (2026-09-18):** `getContainer()`, which is also what the GAME reads
for a body - the loot window gathers a square's static moving objects through
`so:getContainer()` and marks that container explored (ISInventoryPage), and
`CasePerson.onDeadBodySpawn` has written into a body through the same call since
2026-09-08. The identity matters twice: the loot-window guard compares our
container with the one the loot page is showing, and only the same call can
match it. A dead **animal** is now refused as well, because the game's own loot
window refuses to show one as a body (`so:isAnimal()`).

Two harness reads had the same fault and are fixed with it: `core_loop.lua`'s
own "is the clue inside this body" and `carriers.sh`'s loot-panel stage.

### Fault 2, FIXED: a mailbox could never be offered as a place

`Storage.MAILBOX` is the engine's verified word and `Catalog` allows it, but no
mailbox was anywhere the scan looked (`20260918T025841-instalments.txt`):

    postboxes within 60 tiles of the survivor: 6 containers, 0 of them on a
    square the game calls a room, 0 inside one of the 2 live site footprints
    container kinds the mod offered the live sites: counter+shelves,
    counter+shelves - postbox among them on 0 site(s)

**The cause:** both `Storage.scan` and the filler's `boundsScan` only ever
considered squares inside a room rectangle (the filler, inside the footprint). A
mailbox stands at the gate, outdoors, in no room - so it was never a candidate
however the allow-list read, and with `postbox` the only allowed kind **no case
could be created at all** in two fresh neighbourhoods.

**The fix, and what was chosen.** The cheapest honest answer is the one the mod
already uses for a car in the driveway (`addVehicles`, `Session.VEHICLE_RADIUS`):
widen the footprint rather than pretend the kerb is a room.

- `Storage.scan` appends one **band** per site - the site's own rectangle grown
  by `Session.OUTDOOR_RADIUS` - after all the room rectangles, walked by the
  same stepped machinery, and takes **only the mailbox kind** from it. Nothing
  else may be outside a room: a clue never lands in a crate in the street.
- `Session.target` allows that one kind the same margin, and nothing else: an
  ordinary container is still refused outside the footprint to the tile.
- the filler's `boundsScan` walks the same band for the same kind, so a mailbox
  is a place for a waiting clue as well as for a new case.
- the band is a wider place to LOOK, never a way round the allow-list: a kind
  absent from `Storage.KINDS` is not offered from the band either.
- **Twelve tiles, and the width is measured.** A band is walked square by
  square on every case attempt, so its width is a real cost - about 1,050
  squares a site, against 380 at six tiles - and six was tried first.
  `instalments.sh` now prints how far outside the nearest live site every real
  postbox lies, and a running game answered
  (`20260918T060614-instalments.txt`): of six postboxes within sixty tiles of
  the survivor, the nearest two stood **8 and 9 tiles** out and the rest at 25,
  28, 30 and 50. Six tiles reached none of them, and the check failed on
  exactly that - "not one within 6 tiles of a live site footprint, so the band
  cannot reach a mailbox at all". Twelve is the number a car in the driveway
  already gets, for the same ground.
- **The cost is bounded and mostly not paid.** The band comes after every room
  rectangle, and the scan skips a whole rectangle in ONE step for a site that
  already has its eight candidates: a furnished, loaded house never walks its
  band, and a bare one does - which is exactly where a mailbox is needed. The
  scan's runaway cap rose from 100,000 steps to 200,000 to keep twelve bare
  sites clear of it, because hitting that cap commits no case at all.

P4-R67 (one clue per container) is untouched: a mailbox is keyed by its square
and indices like any fixed container, and the reach gate still applies.

### Fault 3, SETTLED BY THE OWNER: a clue on a zombie cannot be spotted

`20260918T045929-instalments.txt`, with a clue on a zombie one tile away and the
survivor facing it:

    a clue on a zombie: generated:1502809855:document-7 at 10876,10093,0,
        the record reads "On a zombie close by."
    the clue on a zombie: standing at 10877,10093, the clue at 10876,10093
    the clue on a zombie: not spotted in 120s (icon no icon false; ...)

The third field of that icon line is `isSearchMode`, and it is **false** after
120 seconds of the check turning Search Mode on once a second. The game turns
Search Mode off by itself when a zombie is close - and a clue on a zombie is a
clue you must stand next to.

This was a collision between two decisions, not a coding slip, and the owner
settled it: **P4-R136 - a corpse carries a clue, a walking zombie does not.** A
walker had also carried a clue out of the find radius and stranded a case for
three in-game days while holding its one mobile slot.

**What that removed:** the `zombie` carrier kind (`Carriers.KINDS`,
`Session.CARRIER_KINDS`), the bounded pass over the cell's zombie list in both
`Carriers.scan` and `Carriers.findMark` (with `Carriers.MAX_ZOMBIES`, and the
radius argument `findMark` no longer needs, since a body is looked for on its
own square and the two around it), the `IsoZombie` arm of the wording's owner
question, and the words `On a zombie near <address>`. All of it is **deleted,
not kept**: with no zombie carrier there is no path that could reach any of it.
`Carriers.FIND_RADIUS` stays, for the one thing it still means - how close the
survivor must be before "we looked and it is not there" is worth saying.

### Fault 4, FIXED the same day: the record called a body a corpse

Found by the first run of the fix (`20260918T055418-body-carrier.txt`): a clue
on a body read

    In a corpse at 105 Hill St.

**The cause:** a body's inventory DOES declare a container type of its own -
`inventoryfemale` - and the game translates that container's title as "Corpse",
so the wording never reached the carrier arm. This had been hidden by the very
fault above: a zombie's inventory answers the type `none`, which is what sent
the zombie carrier down the carrier arm.

**The fix:** the wording asks the container's **owner** whether it is a body
before it asks the type, and it asks the owner rather than the case's own target
- what the container IS now, not where the clue was put - so a clue the survivor
has since moved into a cupboard still reads as being in one.

### Still to prove

A carrier clue **spotted in Search Mode**. It was unprovable while the only
carrier was a walker (fault 3); a body is no threat, so Search Mode stays on
beside it, and the stage that asks is the corpse stage of `instalments.sh`.
