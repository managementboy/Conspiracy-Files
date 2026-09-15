---
title: "polygon"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/polygon.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/polygon.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="polygon"></a>

<a id="scripts-polygon"></a>

# polygon

**Soft Override:** Unknown

[box](box.md), [cylinder](cylinder.md) and [polygon](polygon.md) are used in [tileGeometry.txt](root_files/tilegeometry.md) to define the tile depth of a tile.

You can find more information here.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [tile](tile.md#scripts-tile)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-polygon-plane"></a>

### plane

**Type:** string

**Allowed values:** `XY` | `XZ` | `YZ`

No description provided.

<a id="scripts-polygon-points"></a>

### points

**Type:** object (object: integer->>integer, kv: ‘x’, pairs: ‘ ‘)

Defines the points of the polygon. the format needs to be `X1xY1 X2xY2 X3xY3` and so on. The first point (X1, Y1) is connected to the second point (X2, Y2), the second point (X2, Y2) is connected to the third point (X3, Y3), and so on. The last point is connected to the first point, creating a closed shape.

You can have as many points as you want.

<a id="scripts-polygon-rotate"></a>

### rotate

**Type:** array (array of integer, separator: ‘x’)

No description provided.

<a id="scripts-polygon-translate"></a>

### translate

**Type:** array (array of integer, separator: ‘x’)

No description provided.
