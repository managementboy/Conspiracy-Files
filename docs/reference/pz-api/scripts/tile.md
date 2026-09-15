---
title: "tile"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/tile.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/tile.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="tile"></a>

<a id="scripts-tile"></a>

# tile

**Soft Override:** Unknown

Defines some tile properties of a specific tile on a tileset.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [tileset](tileset.md#scripts-tileset)

This block can have the following child blocks:

- [cylinder](cylinder.md#scripts-cylinder)
- [box](box.md#scripts-box)
- [polygon](polygon.md#scripts-polygon)
- [Properties](properties.md#scripts-properties)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-tile-animation"></a>

### animation

**Type:** Unknown

No description provided.

<a id="scripts-tile-animationtime"></a>

### animationTime

**Type:** Unknown

No description provided.

<a id="scripts-tile-isprofessiontrait"></a>

### IsProfessionTrait

**Type:** Unknown

No description provided.

<a id="scripts-tile-modelscript"></a>

### modelScript

**Type:** block (block: [model](model.md#scripts-model), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-tile-rotate"></a>

### rotate

**Type:** array (array of integer, separator: ‘ ‘)

No description provided.

<a id="scripts-tile-runtime"></a>

### runtime

**Type:** Unknown

No description provided.

<a id="scripts-tile-scale"></a>

### scale

**Type:** array (array of float, separator: ‘ ‘)

No description provided.

<a id="scripts-tile-translate"></a>

### translate

**Type:** array (array of integer, separator: ‘ ‘)

No description provided.

<a id="scripts-tile-xy"></a>

### xy

**Type:** Unknown

The position of the tile in the tileset.

If inside a [tileGeometry.txt](root_files/tilegeometry.md) file, the separator is `x` but when inside a [spriteModels.txt](root_files/spritemodels.md)
