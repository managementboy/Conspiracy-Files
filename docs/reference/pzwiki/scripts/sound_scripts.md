---
title: "sound (scripts)"
source: "https://pzwiki.net/wiki/Sound_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Sound_(scripts)&oldid=1465007"
source_last_edited: "Last modified\n\t\t         This page was last edited on 28 August 2026, at 09:49."
retrieved: "2026-09-15T11:39:43.136Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# sound (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](sound_scripts.md) (Create account)

sound

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

module
[vehicle](Vehicle_scripts.md)
template

[Children blocks](Scripts.md#Children_blocks)

clip

[ID](Scripts.md#ID)

Any except when parent is:
[vehicle](Vehicle_scripts.md)
template

[Soft overrides](Scripts.md#Soft_overrides)

Need testing

Makes one or more sound clips available for use in the game. Multiple clips can be added to a sound script, and the game will randomly select one of them to play when the sound is triggered.

<a id="Parameters"></a>

## Parameters

You can find a full list of the parameters in the ScriptsDocs.

<a id="Example"></a>

## Example



```text
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



Retrieved from "[https://pzwiki.net/w/index.php?title=Sound_(scripts)&oldid=1465007](sound_scripts.md)"
