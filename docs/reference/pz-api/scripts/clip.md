---
title: "clip"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/clip.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/clip.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="clip"></a>

<a id="scripts-clip"></a>

# clip

**Soft Override:** Unknown

Defines a clip to be used in a [sound script](sound.md), which is a single sound file with properties that determine how it is played in the game.



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

- [sound](sound.md#scripts-sound)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-clip-distancemax"></a>

### distanceMax

**Type:** integer

distanceMax and distanceMin respectively set the maximum and minimum distances between which the sound will gradually decrease in volume.

<a id="scripts-clip-distancemin"></a>

### distanceMin

**Type:** integer

See parameter [distanceMax](clip.md#scripts-clip-distancemax).

<a id="scripts-clip-event"></a>

### event

**Type:** string

Specifies an event that will trigger the playback of a specific sound. Used for sounds from FMOD sound banks (vanilla sound files).

<a id="scripts-clip-file"></a>

### file

**Type:** string

The path to the sound file to be played, relative to the folder above the `media` folder. For the following file path:



```
📁 MyMod
  📁 media
    📁 sound
      📄 my_sound.ogg
```



This parameter will be:



```cpp
file = media/sound/my_sound.ogg
```



A file can be both of file format `.ogg` or `.wav`, but `.ogg` is recommended for its smaller file size and better compression.

<a id="scripts-clip-pitch"></a>

### pitch

**Type:** float

The pitch of the sound.

<a id="scripts-clip-reverbfactor"></a>

### reverbFactor

**Type:** float

reverbFactor sets the amount of reverb applied to the sound while reverbMaxRange sets the maximum distance at which the reverb will be applied.

<a id="scripts-clip-reverbmaxrange"></a>

### reverbMaxRange

**Type:** float

See parameter [reverbFactor](clip.md#scripts-clip-reverbfactor).

<a id="scripts-clip-stopimmediate"></a>

### stopImmediate

**Type:** Unknown

No description provided.

<a id="scripts-clip-volume"></a>

### volume

**Type:** float

Adjusts the volume of the sound. Preferably your sound file should be properly normalized to a volume of 1.0.
