---
title: "vehicleEngineRPM"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/vehicleenginerpm.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/vehicleenginerpm.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="vehicleenginerpm"></a>

<a id="scripts-vehicleenginerpm"></a>

# vehicleEngineRPM

**Soft Override:** Unknown

Unclear how the definition of this block works.

Here’s the jeep example from the base game:



```cpp
module Base
{
  vehicleEngineRPM jeep
  {
      VERSION = 1,
      data
      {
          gearChange = 3000,
          afterGearChange = 2000,
      }
      data
      {
          gearChange = 3500,
          afterGearChange = 2000,
      }
      data
      {
          gearChange = 4000,
          afterGearChange = 2500,
      }
      data
      {
          gearChange = 4500,
          afterGearChange = 2800,
      }
      data
      {
          gearChange = 6000,
          afterGearChange = 4500,
      }
  }
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

This block can have the following child blocks:

- [data](data.md#scripts-data)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-vehicleenginerpm-version"></a>

### VERSION

**Type:** integer

Unclear what this does, preferably keep it at 1.
