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

**A car can.** Address a clue by the square a car is parked on and the first
player to drive it has broken the case - placement will look for a container
that is no longer there, and the document will end in `unknown` or `conflict`
with the player given no way to understand why.

So a vehicle target has to be addressed by **vehicle identity plus part id**,
and verified by scanning the cell's vehicles rather than by resolving a square.
That is a new target kind, a schema change, and a generator revision bump.

Two things about it can only be answered inside the running game:

1. **Does `BaseVehicle:getId()` survive a save and reload?** If it does not,
   vehicle placement needs a different handle - a ModData stamp on the vehicle
   itself, which is more work but not much more.
2. **Does an item placed in a trunk survive a reload?** Vehicle containers are
   saved with the vehicle rather than with the cell, and nothing in T1 or T7
   covered them.

Neither can be settled by reading the jar, and guessing at them is how a
weekend gets lost.

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

## What I need from the owner

A ten-minute test, from the debug console, before any of this is built:

    ConspiracyFiles.GeneratedDiagnostic.vehicleProbe()

It will report every nearby vehicle's id, its parts and their capacities, place
a marked item in the nearest trunk, and print what to check after a save and
reload. That probe does not exist yet and is the first thing to write.

## Order of work

1. The probe, and the owner's answers to the two unknowns.
2. A vehicle target kind, addressed by vehicle id and part id.
3. Permission for existing carriers to be placed in a glovebox.
4. Vehicle-aware room affinity (`TruckBed`, `GloveBox`, `SeatFrontLeft`).
5. Piles in a boot.
6. The body, last, and carefully.
