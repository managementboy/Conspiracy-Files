---
title: "fluid"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/fluid.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/fluid.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="fluid"></a>

<a id="scripts-fluid"></a>

# fluid

**Soft Override:** Unknown

Create a new fluid definition. Different properties can be provided for the fluid v ia the use of different children blocks:

- [Properties](properties.md) is used to indicate the various stats change that drinking this fluid would cause to the player.
- [Categories](categories.md) act as tags for the fluid, to easily identify it.
- [BlendWhiteList](blendwhitelist.md) and [BlendBlackList](blendblacklist.md) are used to provide rules for the blending of this fluid with other fluids.
- [Poison](poison.md) is used to define poison properties for the fluid.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

This block can have the following child blocks:

- [Categories](categories.md#scripts-categories)
- [BlendWhiteList](blendwhitelist.md#scripts-blendwhitelist)
- [Poison](poison.md#scripts-poison)
- [Properties](properties.md#scripts-properties)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-fluid-colorreference"></a>

### ColorReference

**Type:** Unknown

A reference to a color defined in the Colors class. You can find a full list of the colors available in the [Colors](../java/colors.md) documentation.

For example, to use the color `Azure` from the documentation:



```cpp
fluid yourFluid
{
  ColorReference = Azure,
  ...
}
```



<a id="scripts-fluid-displayname"></a>

### DisplayName

**Type:** Unknown

The name of the fluid that will be displayed in the game. The value corresponds to the key for the fluid’s name in the [Fluids.json](../translations/translation_files.md#fluids) translation file. The translation keys for the fluid usually have the prefix `Fluid_Name_` but this is technically not required.

For example:



```cpp
fluid yourFluid
{
  DisplayName = Fluid_Name_YourFluid,
  ...
}
```



And in the translation file of your mod:



```cpp
{
  "Fluid_Name_YourFluid": "Your Fluid"
}
```
