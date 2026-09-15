---
title: "tileGeometry"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/tilegeometry.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/tilegeometry.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="tilegeometry"></a>

<a id="scripts-tilegeometry"></a>

# tileGeometry

**Soft Override:** Unknown

Used to define tile geometries for each [tile](tile.md) in a [tileset](tileset.md).

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-TileGeometry](root_files/tilegeometry.md#scripts-root-tilegeometry)

This block can have the following child blocks:

- [tileset](tileset.md#scripts-tileset)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-tilegeometry-version"></a>

### VERSION

**Type:** integer

**Allowed values:** `1` | `2`

The version of the tile geometry file format. The vanilla files use version `2`.

If the value is `1`:

- coordinates will be parsed as is

If the value is `2`:

- coordinates will be divided by 10000
