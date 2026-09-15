---
title: "sound"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/sound.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/sound.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="sound"></a>

<a id="scripts-sound"></a>

# sound

**Soft Override:** Unknown

Makes one or more sound clips available for use in the game. Multiple clips can be added to a sound script, and the game will randomly select one of them to play when the sound is triggered.



```cpp
module yourModule {
  sound yourSound {
    category = Animal,
    loop = true,
    is3D = true,
    clip {
      file = media/sound/RideOfTheValkyries.ogg,
      distanceMin = 20,
      distanceMax = 650,
      reverbFactor = 0.1,
      volume = 0.7,
    }
  }
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)
- [template](template.md#scripts-template)
- [vehicle](vehicle.md#scripts-vehicle)

This block can have the following child blocks:

- [clip](clip.md#scripts-clip)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

**No ID for parents:** [template](template.md#scripts-template) | [vehicle](vehicle.md#scripts-vehicle)

<a id="parameters"></a>

## Parameters

<a id="scripts-sound-alarm"></a>

### alarm

**Type:** array (array of string, separator: ‘ ‘)

No description provided.

<a id="scripts-sound-alarmloop"></a>

### alarmLoop

**Type:** Unknown

No description provided.

<a id="scripts-sound-backsignal"></a>

### backSignal

**Type:** string

No description provided.

<a id="scripts-sound-category"></a>

### category

**Type:** string

Unclear what this parameter is for.

<a id="scripts-sound-engine"></a>

### engine

**Type:** string

No description provided.

<a id="scripts-sound-enginestart"></a>

### engineStart

**Type:** string

No description provided.

<a id="scripts-sound-engineturnoff"></a>

### engineTurnOff

**Type:** string

No description provided.

<a id="scripts-sound-handbrake"></a>

### handBrake

**Type:** string

No description provided.

<a id="scripts-sound-horn"></a>

### horn

**Type:** string

No description provided.

<a id="scripts-sound-ignitionfail"></a>

### ignitionFail

**Type:** Unknown

No description provided.

<a id="scripts-sound-ignitionfailnopower"></a>

### ignitionFailNoPower

**Type:** string

No description provided.

<a id="scripts-sound-is3d"></a>

### is3D

**Type:** boolean

Whenever this is set to `false`, the distance to the sound will not impact its volume. This parameter doesn’t impact the sound directionality.

<a id="scripts-sound-loop"></a>

### loop

**Type:** boolean

Whether the sound should loop or not. The sound plays until turned off manually via Lua code or the emitter is destroyed.

<a id="scripts-sound-master"></a>

### master

**Type:** string

**Default:** `Primary`

**Allowed values:** `Ambient` | `Music` | `Primary` | `VehicleEngine`

Links the sound to a sound handling setting, which controls the volume of all sounds linked to it. This doesn’t seems to be working properly, as some methods that call sounds will simply not take into account the current sound settings. You can find a relevant request about this issue on the #mod_portal channel of the official Discord here.

<a id="scripts-sound-maxinstancesperemitter"></a>

### maxInstancesPerEmitter

**Type:** integer

Specifies how many of this sound the sound emitter can play at the same time.
