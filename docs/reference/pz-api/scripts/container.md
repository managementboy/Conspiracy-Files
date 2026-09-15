---
title: "container"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/container.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/container.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="container"></a>

<a id="scripts-container"></a>

# container

**Soft Override:** Unknown

No description provided.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [part](part.md#scripts-part)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-container-capacity"></a>

### capacity

**Type:** integer

No description provided.

<a id="scripts-container-conditionaffectscapacity"></a>

### conditionAffectsCapacity

**Type:** boolean

Sets whenever the condition of the part will impact the capacity. A lower condition will negatively impact the container’s capacity.

<a id="scripts-container-contenttype"></a>

### contentType

**Type:** string

Unclear how this parameter works exactly. The game uses it to define the “content” of tires and gas tanks by providing the string keys `Gasoline` or `Air`. It seems to simply remove any item container being used as the container for this part.

<a id="scripts-container-seat"></a>

### seat

**Type:** string

The seat ID of this container. When present, this container can be used as a seat for a vehicle.

<a id="scripts-container-soundmap"></a>

### soundMap

**Type:** object (object: string->>block, kv: ‘ ‘, pairs: ‘;’)

Register a sound script associated to a type of sound for this container. The syntax should be as follows:



```cpp
soundMap = key soundRef
```



The `key` can be one of the following:

- `ContainerClose` when closing the container
- `ContainerOpen` when opening the container
- `ContainerPut` when putting an item in the container
- `ContainerTake` when taking an item out of the container

The `soundRef` should be a reference to a [sound block](sound.md).

<a id="scripts-container-test"></a>

### test

**Type:** string

Refers to a Lua global function returning a boolean which is used to determine whether an item can be put in this container when trying to transfer items.

Here’s an example from the vanilla game, with the parmeter being set to:



```cpp
test = Vehicles.ContainerAccess.GloveBox
```



With the Lua function being defined as:



```lua
function Vehicles.ContainerAccess.GloveBox(vehicle, part, chr)
  if chr:getVehicle() == vehicle then
    local seat = vehicle:getSeat(chr)
    -- Can the seated player reach the passenger seat?
    -- Only character in front seat can access it
    return seat == 1 or seat == 0;
  elseif chr:getVehicle() then
    -- Can't reach from inside a different vehicle.
    return false
  else
    -- Standing outside the vehicle.
    if not vehicle:isInArea(part:getArea(), chr) then return false end
    local doorPart = vehicle:getPartById("DoorFrontRight")
    if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
      return false
    end
    return true
  end
end
```



The parameters are:

- `vehicle` is a BaseVehicle class
- `part` is a VehiclePart
- `chr` is an IsoGameCharacter
