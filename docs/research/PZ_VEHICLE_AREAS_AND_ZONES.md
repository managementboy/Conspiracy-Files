# Vehicle areas and vehicle zones (Build 42)

Extracted once, 2026-09-15, at the owner's request ("open these in a browser
and extract the necessary data for our mod once"), so the pages need not be
fetched again. Verified against the installed game (42.20.4) where marked.

Sources, read in a browser (automated fetches are refused with 403):
- [PZwiki: Vehicle (scripts)](https://pzwiki.net/wiki/Vehicle_(scripts)) - last
  updated for 42.10.0; the wiki warns it may be out of date for 42.20.
- [PZwiki: Vehicle zones](https://pzwiki.net/wiki/Vehicle_zones) - revised for
  42.20.0.

Neither page has a picture of the boxes around a car. None was found elsewhere.

## Where a player must stand: `area` blocks

- A vehicle script declares `area <Name> { xywh = X Y W H, }`. The player must
  stand inside that rectangle to act on the part of the same name. A part can
  use another part's area instead: `part GloveBox { area = SeatFrontRight, }`,
  and in the wiki's example `WindowRearLeft` uses `TireRearLeft`.
- `xywh` is in the same physics coordinates as `extents` ("not affected by
  model scale"). In it, X runs across the vehicle and Y along it: the engine is
  at +Y (front) and the truck bed at -Y (back); the left seats are at +X.
  **Verified** from the van's own script (below). Not stated anywhere: how these
  units convert to tiles.
- Vehicle axes are X width, Y height, Z length; the world's are X east, Y
  south, Z up.
- `passenger <Seat> { position outside { offset = ... } }` is where a player
  stands to get into that seat.
- A container's `test` is its Lua access rule, called when the player is near
  or inside the vehicle (e.g. `test = Vehicles.ContainerAccess.GloveBox`).

## The pickup van (`Base.PickUpVan`) - verified in the installed game

From `media/scripts/generated/vehicles/vehicle_pickupvan_template.txt` and
`vehicle_pickupvan.txt`. Body `extents = 0.8681 0.6264 2.2308` (width, height,
length).

| Area | X (across) | Y (along) | W | H | Where that is |
|---|---|---|---|---|---|
| TruckBed | 0.0 | -1.3516 | 0.8681 | 0.4725 | a strip across the back, just past the tailgate |
| Engine | 0.0 | +1.3516 | 0.8681 | 0.4725 | a strip across the front, just past the bumper |
| SeatFrontLeft | +0.6703 | +0.1484 | 0.4725 | 0.4725 | beside the driver's door |
| SeatFrontRight | -0.6703 | +0.1484 | 0.4725 | 0.4725 | beside the passenger door |
| GasTank | +0.6703 | -0.5879 | 0.4725 | 0.4725 | left side, towards the back |
| TireFrontLeft / Right | ±0.6703 | +0.7582 | 0.4725 | 0.4725 | at each front wheel |
| TireRearLeft / Right | ±0.6703 | -0.5879 | 0.4725 | 0.4725 | at each rear wheel |

The side boxes sit just outside the body (half width 0.43) and the front and
back strips just beyond the bumpers (half length 1.12).

## Reaching a truck bed - verified

`media/lua/server/Vehicles/Vehicles.lua`, `Vehicles.ContainerAccess.TruckBed`:
allowed only when the player is **not in a vehicle**, **stands inside the
TruckBed area**, and - if the vehicle has a trunk door with a door fitted - that
**door is open**. This is the owner's rule P4-R106 ("only if they are open"), as
the game already enforces it.

`ISVehicleMenu.onOpenDoor` only queues an unlock (if locked) and
`ISOpenVehicleDoor`; neither moves the player. `ISOpenVehicleDoor` finishes when
the character's animation reports finished. The game walks a player into an
area with `ISPathFindAction:pathToVehicleArea(player, vehicle, areaId)`.

## Measured in a real game, 2026-09-15 (truck bed probe)

Three rounds, a spawned van, the check's own steps:
- tailgate shut, player in the TruckBed area: refused;
- after the open-door action: door open within 1 s, access allowed, player never
  moved;
- teleporting to the area's centre (10830.67, 10147.44) put the player on the
  tile corner (10830.00, 10147.00) - inside this box, but near its edge.

Probable cause of the intermittent `vehicle_reach` failure (door forced open,
still refused from outside): on some runs that corner falls just outside the
thin TruckBed box. **Not yet proven.** Planned fix for the check: walk the
player into the area with `pathToVehicleArea`, as a player does, instead of
teleporting to its centre.

## Vehicle zones: where cars spawn on the map

Map object zones of type `ParkingStall`, sized in multiples of 5x3 (5x6, 10x3,
3x5...), named for what spawns there. Kinds that say whose car it was:

- **services**: `police`, `prison`, `fire`, `ambulance`, `ranger`
- **named businesses**: `mccoy`, `postal`, `spiffo`, `fossoil`, `massgenfac`,
  `lectromax`, `scarlet` (Scarlet Oak Distillery), `knoxdisti`, `kyheralds`,
  `network3` (News Now Network), `transit` (KY Transit), `radio` (LBMW),
  `carpenter`, `farm`
- **condition**: `junkyard` (damaged, burnt, fewer keys), `burnt`,
  `trafficjamn/e/s/w` and `rtrafficjam*` (damaged, often burnt)
- **ordinary**: `parkingstall`, `bad`, `medium`, `good`, `sport`, `trailerpark`
- **vehicle stories only**: `trades`, `delivery`, `professional`,
  `middleClass`, `struggling`, `evacuee`
- `business1`-`business12` are not placed zones; they raise the odds of a
  business vehicle spawning.

## What this means for the mod

- **Already used:** `VehicleCatalogue` (derived by
  `tools/extract_vehicle_types.py`) records each vehicle's driver kind from the
  scripts' `zombieType`, and `VehicleAffinity` uses it to tell cargo that fits a
  vehicle from cargo that does not. Placement (`Storage.addVehicles`) may use any
  container part of a live vehicle near a case site whose part name
  `RoomAffinity` knows (truck bed, glove box, seats). It ignores where the player
  must stand and whether the car is locked (catalogue VC-06); the game applies
  those rules when the player tries, and the checks follow them (P4-R106).
- **Not used, and an option only:** the spawn zones are a second, independent
  record of whose car it was - a MassGenFac van at a MassGenFac warehouse - and
  the premises already name Fossoil, MassGenFac, McCoy and Spiffo's. No decision
  has been made to use them.
- **Open:** how area units convert to tiles, if a real distance is ever needed;
  one probe recording a vehicle's world position and facing would settle it.
