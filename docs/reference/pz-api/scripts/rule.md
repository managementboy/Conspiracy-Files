---
title: "rule"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/rule.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/rule.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="rule"></a>

<a id="scripts-rule"></a>

# rule

**Soft Override:** Unknown

**No comma:** True

A `rule` block defines a conversion rule for the BMP to TMX conversion process in the [mapping tools](../../pzwiki/mapping/Mapping.md). It is used to associate a color on the BMP for the vegetation or main image to a list of tiles to apply on a specific layer in the TMX.

For example:



```cpp
rule
{
  label = Sand
  bitmap = 0
  color = 210 200 160
  tiles = sand
  layer = 0_Floor
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-Rules](root_files/rules.md#scripts-root-rules)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-rule-bitmap"></a>

### bitmap

**Type:** integer

A value of `1` will have this rule used for the vegetation image, while a value of `0` will have it used for the main tiles image. Trees will for example use `1` while ground tiles will use `0`.

<a id="scripts-rule-color"></a>

### color

**Type:** array (array of integer, separator: ‘ ‘)

The RGB color to replace with the tiles in the `tiles` parameter. This is the color you painted in your image file to associate to this rule.

<a id="scripts-rule-label"></a>

### label

**Type:** string

No description provided.

<a id="scripts-rule-layer"></a>

### layer

**Type:** string

The layer to apply the tiles on.

<a id="scripts-rule-tiles"></a>

### tiles

**Type:** Unknown

A list of tiles to apply randomly for this color. You can also use an alias block here to reference a list of tiles.

For example:



```cpp
tiles = vegetation_farm_01_35
```





```cpp
tiles = [
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
tiles = [
  treez1
]
```
