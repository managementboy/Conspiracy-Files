---
title: "vehicle"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/vehicle.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/vehicle.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="vehicle"></a>

<a id="scripts-vehicle"></a>

# vehicle

**Soft Override:** Unknown

Defines a vehicle.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

This block can have the following child blocks:

- [wheel](wheel.md#scripts-wheel)
- [passenger](passenger.md#scripts-passenger)
- [model](model.md#scripts-model)
- [skin](skin.md#scripts-skin)
- [physics](physics.md#scripts-physics)
- [part](part.md#scripts-part)
- [attachment](attachment.md#scripts-attachment)
- [area](area.md#scripts-area)
- [lightbar](lightbar.md#scripts-lightbar)
- [sound](sound.md#scripts-sound)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-vehicle-animaltrailersize"></a>

### animalTrailerSize

**Type:** float

Sets the maximum total encumbrance from animals in the animal trailer. The horsebox and livestock trailers both use 500.

<a id="scripts-vehicle-brakingforce"></a>

### brakingForce

**Type:** Unknown

No description provided.

<a id="scripts-vehicle-carmechanicsoverlay"></a>

### carMechanicsOverlay

**Type:** string

No description provided.

<a id="scripts-vehicle-carmodelname"></a>

### carModelName

**Type:** string

Set the [translation](../../pzwiki/translations/Translation.md) key for the car name. The translation entry needs to be stored inside the [IG_UI](../translations/translation_files.md#ig-ui) translation file and have `IGUI_VehicleName` as a prefix. For example:



```cpp
carModelName = YourCar,
```



With the translation entry inside `IG_UI.json`:



```json
{
  "IGUI_VehicleNameYourCar": "Your car model"
}
```



<a id="scripts-vehicle-centerofmassoffset"></a>

### centerOfMassOffset

**Type:** array (array of float, separator: ‘ ‘)

No description provided.

<a id="scripts-vehicle-engineforce"></a>

### engineForce

**Type:** float

**Default:** `3000`

`engineForce` is 10x what is displayed in the mechanics menu for horsepower.

<a id="scripts-vehicle-engineidlespeed"></a>

### engineIdleSpeed

**Type:** float

**Default:** `750.0`

No description provided.

<a id="scripts-vehicle-engineloudness"></a>

### engineLoudness

**Type:** integer

**Default:** `100`

No description provided.

<a id="scripts-vehicle-enginequality"></a>

### engineQuality

**Type:** integer

**Default:** `100`

No description provided.

<a id="scripts-vehicle-enginerepairlevel"></a>

### engineRepairLevel

**Type:** integer

Required mechanics skill level for repearing the vehicle’s engine.

<a id="scripts-vehicle-enginerpmtype"></a>

### engineRPMType

**Type:** string

**Default:** `jeep`

Sets the engine to a RPM type ([See vehicleEngineRPM block](vehicleenginerpm.md)).

<a id="scripts-vehicle-extents"></a>

### extents

**Type:** array (array of float, separator: ‘ ‘)

No description provided.

<a id="scripts-vehicle-extentsoffset"></a>

### extentsOffset

**Type:** array (array of float, separator: ‘ ‘)

No description provided.

<a id="scripts-vehicle-forcedcolor"></a>

### forcedColor

**Type:** array (array of float, separator: ‘ ‘)

**Default:** `-1 -1 -1`

Sets a forced HSV color on the vehicle. The value needs to be of format `hue sat val`.

<a id="scripts-vehicle-frontenddurability"></a>

### frontEndDurability

**Type:** integer

**Default:** `100`

It is unclear what that parameter does but as of 42.16.3, the game uses `frontEndHealth` which is a mistake.

<a id="scripts-vehicle-frontendhealth"></a>

### frontEndHealth

**Type:** Unknown

**Deprecated:** {‘description’: ‘While that parameter is present in vanilla scripts as of 42.16.3, it actually does nothing because it is not parsed as frontEndHealth but as frontEndDurability.’, ‘replacedBy’: ‘frontEndDurability’}

No description provided.

<a id="scripts-vehicle-gearratio1"></a>

### gearRatio1

**Type:** float

**Default:** `6.44`

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio2"></a>

### gearRatio2

**Type:** Unknown

**Default:** `4.1`

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio3"></a>

### gearRatio3

**Type:** Unknown

**Default:** `2.29`

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio4"></a>

### gearRatio4

**Type:** Unknown

**Default:** `1.47`

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio5"></a>

### gearRatio5

**Type:** Unknown

**Default:** `1.0`

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio6"></a>

### gearRatio6

**Type:** Unknown

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio7"></a>

### gearRatio7

**Type:** Unknown

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratio8"></a>

### gearRatio8

**Type:** Unknown

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-gearratiocount"></a>

### gearRatioCount

**Type:** integer

**Default:** `4`

gearRatioCount will set the number of gear ratios the car can have. The vanilla cars use 4, while sport cars use 5.

A maximum of 9 ratios can be set with the parameters:

- gearRatioR (the reverse gear ratio)
- gearRatio1
- gearRatio2
- gearRatio3
- gearRatio4
- gearRatio5
- gearRatio6
- gearRatio7
- gearRatio8

<a id="scripts-vehicle-gearratior"></a>

### gearRatioR

**Type:** float

**Default:** `7.09`

See parameter [gearRatioCount](vehicle.md#scripts-vehicle-gearratiocount).

<a id="scripts-vehicle-haslighter"></a>

### hasLighter

**Type:** boolean

**Default:** `True`

Sets whenever this car has a lighter to light a cigarette.

<a id="scripts-vehicle-hassiren"></a>

### hasSiren

**Type:** boolean

**Is useless:** True

This is unused by the game.

<a id="scripts-vehicle-issmallvehicle"></a>

### isSmallVehicle

**Type:** boolean

**Default:** `True`

If the vehicle a small vehicle, the zombies will bang on the windows differently. If set to false they will thump by banging while if set to true, they will thump with their shoulder.

<a id="scripts-vehicle-mass"></a>

### mass

**Type:** float

**Default:** `800`

Sets the mass of the vehicle which will notably be used for various physic calculations.

By default is equal to 800. As a reference, cars have a mass of around 800, pickup trucks have around 1100, a simple trailer around 200, a burnt vehicle 400 or 500. See the game scripts for more examples. Values in excess of 1400 can cause vehicle wheels to start sinking into the ground and be unable to move.

<a id="scripts-vehicle-maxspeed"></a>

### maxSpeed

**Type:** float

**Default:** `20.0`

No description provided.

<a id="scripts-vehicle-maxspeedreverse"></a>

### maxSpeedReverse

**Type:** float

**Default:** `40.0`

No description provided.

<a id="scripts-vehicle-maxsuspensiontravelcm"></a>

### maxSuspensionTravelCm

**Type:** float

**Default:** `500.0`

No description provided.

<a id="scripts-vehicle-mechanictype"></a>

### mechanicType

**Type:** integer

**Allowed values:** `1` | `2` | `3`

Defines what class the vehicle is, that is 1 for standard, 2 for heavy-duty and 3 for performance.

<a id="scripts-vehicle-neverspawnkey"></a>

### neverSpawnKey

**Type:** boolean

Sets whenever this vehicle will never have a key spawning in buildings or on zombies spawning around the vehicle.

<a id="scripts-vehicle-notkillcrops"></a>

### notKillCrops

**Type:** boolean

Sets whenever the vehicle will destroy crops it is driving on.

<a id="scripts-vehicle-offroadefficiency"></a>

### offRoadEfficiency

**Type:** float

**Default:** `1.0`

Affects horsepower reduction when offroad (Higher = less horsepower reduction when offroad.)

<a id="scripts-vehicle-physicschassisshape"></a>

### physicsChassisShape

**Type:** array (array of float, separator: ‘ ‘)

Defines the hitbox of the vehicle. The value should be three numbers defining the dimensions of a box:



```
physicsChassisShape = height width length,
```



For example:



```
physicsChassisShape = height width length,
```



When setting useChassisPhysicsCollision to `false`, it will instead use [physics](physics.md) for the hitbox of the vehicle.

<a id="scripts-vehicle-playerdamageprotection"></a>

### playerDamageProtection

**Type:** float

Multiplier applied to the amount of damage the player takes when crashing in the car. A value of 1 doesn’t change the damage, but a lower value reduces it and a higher value increases it.

<a id="scripts-vehicle-rearenddurability"></a>

### rearEndDurability

**Type:** integer

**Default:** `100`

It is unclear what that parameter does but as of 42.16.3, the game uses `rearEndHealth` which is a mistake.

<a id="scripts-vehicle-rearendhealth"></a>

### rearEndHealth

**Type:** Unknown

**Deprecated:** {‘description’: ‘While that parameter is present in vanilla scripts as of 42.16.3, it actually does nothing because it is not parsed as rearEndHealth but as rearEndDurability.’, ‘replacedBy’: ‘rearEndDurability’}

No description provided.

<a id="scripts-vehicle-rollinfluence"></a>

### rollInfluence

**Type:** float

**Default:** `0.1`

No description provided.

<a id="scripts-vehicle-seats"></a>

### seats

**Type:** integer

**Default:** `2`

Sets the number of seats this vehicle can have. A seat [part](part.md) needs to be created which will hold a [container](container.md#container) block with a parameter seat.

<a id="scripts-vehicle-shadowextents"></a>

### shadowExtents

**Type:** array (array of float, separator: ‘ ‘)

No description provided.

<a id="scripts-vehicle-shadowoffset"></a>

### shadowOffset

**Type:** array (array of float, separator: ‘ ‘)

No description provided.

<a id="scripts-vehicle-specialkeyring"></a>

### specialKeyRing

**Type:** array (array of string, separator: ‘;’)

specialKeyRing needs to reference a keyring item to spawn. specialKeyRingChance is used to set the chance to spawn this keyring.

<a id="scripts-vehicle-specialkeyringchance"></a>

### specialKeyRingChance

**Type:** integer

See parameter [specialKeyRing](vehicle.md#scripts-vehicle-specialkeyring).

<a id="scripts-vehicle-speciallootchance"></a>

### specialLootChance

**Type:** integer

**Default:** `8`

No description provided.

<a id="scripts-vehicle-steeringclamp"></a>

### steeringClamp

**Type:** float

**Default:** `0.4`

Maximum angle you can turn the front wheels left/right

<a id="scripts-vehicle-steeringincrement"></a>

### steeringIncrement

**Type:** float

**Default:** `0.04`

No description provided.

<a id="scripts-vehicle-stoppingmovementforce"></a>

### stoppingMovementForce

**Type:** float

**Default:** `1.0`

A drag factor applied to the vehicle at all times

<a id="scripts-vehicle-storagecapacity"></a>

### storageCapacity

**Type:** integer

**Is useless:** True

**Default:** `100`

No description provided.

<a id="scripts-vehicle-suspensioncompression"></a>

### suspensionCompression

**Type:** float

**Default:** `4.4`

No description provided.

<a id="scripts-vehicle-suspensiondamping"></a>

### suspensionDamping

**Type:** float

**Default:** `2.3`

No description provided.

<a id="scripts-vehicle-suspensionrestlength"></a>

### suspensionRestLength

**Type:** float

**Default:** `0.6`

No description provided.

<a id="scripts-vehicle-suspensionstiffness"></a>

### suspensionStiffness

**Type:** float

**Default:** `20.0`

No description provided.

<a id="scripts-vehicle-template"></a>

### template

**Type:** Unknown

Uses a template script data for this vehicle.

<a id="id1"></a>

### template!

**Type:** Unknown

See parameter [template](vehicle.md#scripts-vehicle-template).

<a id="scripts-vehicle-texturedamage1overlay"></a>

### textureDamage1Overlay

**Type:** string

No description provided.

<a id="scripts-vehicle-texturedamage1shell"></a>

### textureDamage1Shell

**Type:** string

No description provided.

<a id="scripts-vehicle-texturedamage2overlay"></a>

### textureDamage2Overlay

**Type:** string

No description provided.

<a id="scripts-vehicle-texturedamage2shell"></a>

### textureDamage2Shell

**Type:** string

No description provided.

<a id="scripts-vehicle-texturelights"></a>

### textureLights

**Type:** string

No description provided.

<a id="scripts-vehicle-texturemask"></a>

### textureMask

**Type:** string

No description provided.

<a id="scripts-vehicle-texturemaskenable"></a>

### textureMaskEnable

**Type:** boolean

**Is useless:** True

No description provided.

<a id="scripts-vehicle-texturerust"></a>

### textureRust

**Type:** string

No description provided.

<a id="scripts-vehicle-textureshadow"></a>

### textureShadow

**Type:** string

No description provided.

<a id="scripts-vehicle-usechassisphysicscollision"></a>

### useChassisPhysicsCollision

**Type:** boolean

**Default:** `True`

By default `true` which makes the vehicle use the physicsChassisShape for its hitbox. If set to false, it will instead use the [physics](physics.md) blocks as the hitbox of the vehicle.

<a id="scripts-vehicle-wheelfriction"></a>

### wheelFriction

**Type:** float

**Default:** `800.0`

It is 1.2 to 1.9 for all vanilla vehicles and controls turning and stopping (but not acceleration) tire friction limits, with 1.4 being the most common. Values over 1.8 can cause vehicles to flip in sharp turns. (Likely depends somewhat on center of mass).

<a id="scripts-vehicle-zombietype"></a>

### zombieType

**Type:** array (array of string, separator: ‘;’)

Used to chose what zombie may spawn around the vehicle and is likely to have the key of the vehicle.
