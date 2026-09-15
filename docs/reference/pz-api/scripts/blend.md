---
title: "blend"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/blend.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/blend.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="blend"></a>

<a id="scripts-blend"></a>

# blend

**Soft Override:** Unknown

Used to define blend rules for the [mapping tools](../../pzwiki/mapping/Mapping.md) painting tool.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-Blends](root_files/blends.md#scripts-root-blends)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-blend-blendtile"></a>

### blendTile

**Type:** Unknown

Used to define the tiles which will be used for the blend around the `mainTile`. This can be a single tile or an array of tiles, and it supports `alias` blocks.

For example:



```cpp
blendTile = vegetation_farm_01_35
```





```cpp
blendTile = [
    vegetation_farm_01_32
    vegetation_farm_01_33
    vegetation_farm_01_34
    vegetation_farm_01_35
    vegetation_farm_01_36
    vegetation_farm_01_37
    vegetation_farm_01_38
    vegetation_farm_01_39
]
```



Or with one or more alias blocks:



```cpp
alias
{
    name = treez1
    tiles = [
        vegetation_trees_01_13
        vegetation_trees_01_14
        vegetation_trees_01_15
        vegetation_trees_01_8
        vegetation_trees_01_9
        vegetation_trees_01_10
        vegetation_trees_01_11
        vegetation_trees_01_17
    ]
}
```





```cpp
blendTile = [
  treez1
]
```



<a id="scripts-blend-dir"></a>

### dir

**Type:** Unknown

**Allowed values:** `e` | `n` | `ne` | `nw` | `s` | `se` | `sw` | `w`

The direction the blend applies to.

<a id="scripts-blend-exclude"></a>

### exclude

**Type:** Unknown

A list of tiles which will be excluded from being blended. This can be a single tile or an array of tiles, and it supports `alias` blocks.

The format needs to be like this:



```cpp
exclude = water lightgrass medgrass darkgrass
```



Where each entries separated by a space are an alias.

<a id="scripts-blend-exclude2"></a>

### exclude2

**Type:** Unknown

No description provided.

<a id="scripts-blend-layer"></a>

### layer

**Type:** Unknown

The layer the blend rule applies to. Should be one of the layers defined in the `TMXconfig.txt` file.

<a id="scripts-blend-maintile"></a>

### mainTile

**Type:** Unknown

Used to identify which tiles will trigger the blend. This can be a single tile or an array of tiles, and it supports `alias` blocks.

For example:



```cpp
mainTile = vegetation_farm_01_35
```





```cpp
mainTile = [
    vegetation_farm_01_32
    vegetation_farm_01_33
    vegetation_farm_01_34
    vegetation_farm_01_35
    vegetation_farm_01_36
    vegetation_farm_01_37
    vegetation_farm_01_38
    vegetation_farm_01_39
]
```



Or with one or more alias blocks:



```cpp
alias
{
    name = treez1
    tiles = [
        vegetation_trees_01_13
        vegetation_trees_01_14
        vegetation_trees_01_15
        vegetation_trees_01_8
        vegetation_trees_01_9
        vegetation_trees_01_10
        vegetation_trees_01_11
        vegetation_trees_01_17
    ]
}
```





```cpp
mainTile = [
  treez1
]
```
