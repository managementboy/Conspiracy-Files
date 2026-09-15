# Vehicles as places

Owner, 2026-09-09:

> Next is placement of hints in cars. Placing bodies in car boots. Placing
> unreasonable amount of things in a car. And so on.

All three are possible. One of them is far easier than it sounds, and one of
them breaks an assumption the mod has held since its first line of code.

## What the installed game actually gives us

Verified against `projectzomboid.jar` by `tools/verify_api.sh`, which now
checks all nine of these on every run:

| Method | What it buys us |
|---|---|
| `IsoCell:getVehicles()` | finding the vehicles near a site at all |
| `BaseVehicle:getParts()` | reaching trunk, seats and glovebox |
| `VehiclePart:getItemContainer()` | the container a clue would go in |
| `VehiclePart:getId()` | which part - `TruckBed`, `GloveBox`, `SeatFrontLeft` |
| `VehiclePart:getContainerCapacity()` | whether what we want to place fits |
| `BaseVehicle:getId()` | the only stable handle on a car that has moved |
| `BaseVehicle:getSquare()` | where it is now, which is not where it was |
| `BaseVehicle:isTrunkLocked()` | a locked boot is a lead, not an obstacle |
| `ItemContainer:getVehiclePart()` | telling a car boot from a kitchen cupboard |

## A body is an item

The find that makes the second request simple: **`Base.CorpseMale` and
`Base.CorpseFemale` are ordinary items**, declared in
`media/scripts/generated/items/normal.txt`.

    item CorpseMale
    {
        DisplayCategory = Corpse,
        Weight = 20.0,
        RequiresEquippedBothHands = true,
        Tags = base:heavyitem,
    }

A body in a boot is therefore an item in a container, which the mod has done
since the beginning. It needs no corpse spawning, no `IsoDeadBody`, no new
placement machinery at all - only a carrier the object rules are allowed to
choose, and a container with room for twenty units of weight. Most car trunks
have that; a glovebox does not, and `getContainerCapacity()` tells us which is
which before we try.

It is also, by a distance, the heaviest thing this mod would ever place, and
the only one that is a person. That deserves its own rule and its own wording,
not a slot in the accumulation pool.

## The assumption it breaks

Every target the mod has ever written is a grid square:

    {x, y, z, objectIndex, containerIndex, containerType, sprite}

bounds-checked against the site it belongs to (`Generated/Session.lua`,
`S.target`). That works because a kitchen cupboard cannot walk away.

**A car can** - but only the player can move one. Owner, 2026-09-09: *"the
issue of a car moving is a non issue. only the player can move a car. so the
evidence travels with him."*

That corrects the framing above. A clue in a boot is not at risk of wandering
off: nothing in Knox drives. If the car moves at all, the person who moved it
is the person the clue is for, and the evidence went with them.

It makes a boot the one container in the game that **follows the player**. A
survivor can take a car for the fuel and be carrying a case file for a week
without knowing it - which is a better way to find a clue than opening a drawer,
and costs nothing to build.

What still has to be right is finding the container again after the car has
moved, because placement verifies what it placed. Addressing by parking space
would fail there, so a vehicle clue is addressed by a mark on the part instead.
The risk was never the clue being lost; it was the mod losing track of a clue
the player still has.

So a vehicle target has to be addressed by **vehicle identity plus part id**,
and verified by scanning the cell's vehicles rather than by resolving a square.
That is a new target kind, a schema change, and a generator revision bump.

Two things about it could only be answered inside the running game, and the
owner answered both on 2026-09-09: **a vehicle's identity and the contents of
its boot both survive a save and reload.**

We depend on neither. `VehiclePart:getModData()` exists, so the mod leaves its
own mark on the part it placed into and finds that mark again by looking at the
cell's vehicles. Nothing asks the engine which vehicle this is, or where it was
parked - which is exactly the property a clue in a car needs.

## The three shapes, once that is settled

**Hints in cars.** The glovebox is the best container in the game for a
document: it is small, it is private, and nobody puts anything there by
accident. A registration document, a parking ticket, a key on a ring - the
existing carriers need no change, only permission to be placed in a vehicle.

**A body in the boot.** One item, weight 20, and the only evidence this mod
would ever place that is a person. It should be rare, it must never be
described beyond what is visible, and it must never be presented as a victim -
the mod does not know that. "A body, in the boot of a car, with the file
nearby" is the whole of what may be said.

**Too much of something in a car.** The pile rules already work; a car is just
a container with a different reason to be suspicious. A boot with sixteen of
one thing is a stronger sight than a cupboard with sixteen, because a car is
where things go when they are being moved rather than kept. `TruckBed` and
`GloveBox` are different rooms in the sense `RoomAffinity` already means, and
should be treated as such.

## Order of work

1. ~~The two unknowns~~ - answered by the owner; no probe needed.
2. **The access layer** - done (`WorldAccess`, `test/vehicle_access.lua`):
   ordered parts with their capacities, vehicles near a point measured from
   where they are *now*, a mark left on a part, and a boot that still resolves
   after being driven across town.
3. **The vehicle target kind** - done. `Session.target` accepts a target that
   names a part instead of an object index, and allows it outside the site's
   own footprint by `S.VEHICLE_RADIUS` (12 tiles: a driveway, a verge, a kerb -
   not the next street). Square targets are untouched, which is the assertion
   that matters most, since every clue the mod has ever placed goes through
   that one function. `Catalog` accepts `vehicle` as a container type.
4. **Candidates that include cars** - done. `Storage.scan` adds vehicles as a
   final pass, after the rooms, so a car never displaces a container inside the
   building: a room is still the first place to look.
5. **Vehicle-aware room affinity** - done. `GloveBox`, `TruckBed` and the seats
   are rooms in the sense that module already means. Every readable carrier is
   welcome in a glovebox; personal ones are at home in a seat; bulk goes in a
   bed or a boot and never in a glovebox.
6. **Cargo with no reason to be there** - done, as `ObjectRules.vehicleBulk`.
   It is the only rule permitted to reach `Furniture`, which is how fifty
   mannequins become possible without moveables being stacked in kitchen
   cupboards everywhere else.
7. The body, last, and carefully. Not built.

## What a vehicle clue does NOT assert

`vehicleBulk`'s wording says "loaded together as cargo", never "in a vehicle".
Room preference is exactly that - a preference - and `createDistributed` falls
back to any usable container, so a sentence asserting a car would be false the
first time a case had no car near it. Where the thing actually is, the notebook
already reports.

## Bodies in seats

Owner, 2026-09-09:

> Don't forget something no one has done in PZ... bodies can fit in car seats
> too. Murder to keep someone quiet? Example only.

Seats have containers - `template_seat.txt` declares one for every seat
position. A car seat declares `MaxCapacity = 20` (`items/normal.txt`,
`NormalCarSeat1`) and `Base.CorpseMale` weighs exactly `20`.

**Correction, 2026-09-09.** I wrote that as though capacity were a weight
ceiling the engine enforces. The owner: *"weird I can fit a generator on a
seat"* - and a generator weighs 40.

Vanilla's `ISInventoryTransferAction` does call `hasRoomFor` before moving
anything, so the check is real. What it evidently means is *"this container is
not already full"*: one oversized item goes in, and nothing goes in after it.
That fits the observation exactly, and it also means the engine would happily
accept a body in a glovebox.

So the useful facts split in two:

- **Engine fact.** A container that is not full accepts one more item whatever
  it weighs. Put a body in a seat and the seat is then full - nothing else
  joins it - but that is a consequence, not a rule about bodies.
- **Our rule.** `World.partsWithRoom(vehicle, BODY_WEIGHT)` refuses a glovebox
  for a body because a body in a glovebox is absurd, not because the game says
  no. It is a plausibility filter and is labelled as one in the code, so nobody
  later mistakes it for a constraint that would hold without us.

The three placements read differently, and that difference is the whole value:

- **A boot.** Something was being moved, and somebody chose not to be seen
  doing it.
- **A front seat.** Somebody was being carried, not moved - and was sitting
  where a passenger sits.
- **A rear seat.** Neither, quite. That is the one a player will argue about.

### The limitation, stated plainly

A body in a seat container is **not visible through the windscreen**. The
player finds it by opening that seat's container, the way they find anything
else in a car. `BaseVehicle:setPassenger` takes an `IsoGameCharacter`, and a
corpse is not one, so a body posed behind the wheel is not something this mod
can do.

That belongs with the other two standing refusals - no custom photograph, no
playable tape. We do not describe what the player cannot see.

## Different kinds of vehicle

Owner, 2026-09-09:

> There are also different types of cars. Again misplaced objects are a
> mystery. What are 50 mannequin doing in a truck... again just an example. Be
> creative.

The game answers most of this itself. Nearly half of its 47 vehicle scripts
carry a `zombieType` naming the kind of person found dead at that wheel:
`AmbulanceDriver`, `Police`, `Postal`, `Fireman`, `PrisonGuard`, `Farmer`,
`Ranger`. That is the game stating what a vehicle was *for*, which makes "this
cargo has nothing to do with this vehicle" a derived fact rather than a mapping
somebody invented.

`tools/extract_vehicle_types.py` parses all of it into
`Generated/VehicleCatalogue.lua`: 47 vehicles, 20 of which name their driver,
with the container parts each declares and whether it is a trailer - cargo with
no driver at all.

`Generated/VehicleAffinity.lua` is the judgement layer on top, and it is
deliberately thin: eight trades where the answer is obvious, and silence
everywhere else.

### Why silence is the load-bearing part

Fifty mannequins in a **mail van** is a question. The same fifty in an
**unmarked saloon** is furniture in a car.

So `avoids` is not the negation of `fits`. A vehicle with no declared driver
has no business being called the wrong place for anything, and a vehicle whose
driver is `Generic01` is the game saying *this one has no identity* - exactly
what `Generic03` means on a corpse, and refused here for the same reason. Only
13 of the 47 vehicles carry an opinion. That is correct, not a shortfall.

### What this makes possible

- **A trade's own supplies, in far too great a quantity.** A stack of dressings
  in an ambulance is expected. Eleven boxes of them is not.
- **Cargo with nothing to do with the vehicle.** The mannequins. A livestock
  trailer full of office chairs. A prison van full of gardening tools.
- **The wrong vehicle for the paperwork.** A case file about a maintenance
  contract, found in the glovebox of a police car.

Moveables (`Mov_MannequinMale`, weight 0.5, category `Furniture`) are barred
from drawers by `ObjectRules` - "a moveable is placed in the world, not stacked
inside a drawer" - and a truck bed is precisely the exception. That denial will
need to become bed-specific when placement reaches vehicles.

## The body, and what may be said about it

One item, weight 20, and the only evidence this mod would ever place that is a
person. It must be rare. It must never be described beyond what is visible.
And it must never be called a victim - the mod does not know that, and the
whole discipline of this project is that a lead is never proof.

"A body, in the boot of a car, with the file nearby" is the whole of what may
be written. Everything a player concludes from that is theirs - and the owner's
own example, *murder to keep someone quiet*, is exactly the conclusion the mod
must leave them to reach on their own.
