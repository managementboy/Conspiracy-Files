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
3. A vehicle target kind in `Session.target`, and candidates that include cars
   parked near a site rather than only furniture inside its rooms. This is the
   real structural work: sites are room rectangles, and a car is in the
   driveway.
4. Vehicle-aware room affinity - `GloveBox` and `TruckBed` are rooms in the
   sense that module already means.
5. Piles in a boot. The pile rules need nothing new; a car is a container with
   a different reason to be suspicious.
6. The body, last, and carefully.

## Bodies in seats

Owner, 2026-09-09:

> Don't forget something no one has done in PZ... bodies can fit in car seats
> too. Murder to keep someone quiet? Example only.

Seats have containers - `template_seat.txt` declares one for every seat
position - and the game's own numbers are unusually pointed. A car seat
declares `MaxCapacity = 20` (`items/normal.txt`, `NormalCarSeat1`) and
`Base.CorpseMale` weighs exactly `20`.

**A car seat holds one body and nothing else at all.**

That is a better sentence than anything we would have written, and it comes
from the game rather than from us. `World.partsWithRoom(vehicle, BODY_WEIGHT)`
reads the capacity off the installed part, so a glovebox (5) is never offered,
a seat (20) takes exactly one, and a truck bed (100) takes a body and the rest
of the case with it.

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

## The body, and what may be said about it

One item, weight 20, and the only evidence this mod would ever place that is a
person. It must be rare. It must never be described beyond what is visible.
And it must never be called a victim - the mod does not know that, and the
whole discipline of this project is that a lead is never proof.

"A body, in the boot of a car, with the file nearby" is the whole of what may
be written. Everything a player concludes from that is theirs - and the owner's
own example, *murder to keep someone quiet*, is exactly the conclusion the mod
must leave them to reach on their own.
