---
title: "physicsShape"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/physicsshape.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/physicsshape.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="physicsshape"></a>

<a id="scripts-physicsshape"></a>

# physicsShape

**Soft Override:** Unknown

Defines a 3D object’s physical shape to be used as a world object.

For example:



```cpp
module YourModule {
  physicsShape ramp20segment5w {
      mesh = physics/ramp20|Segment5,
      translate = 4.0 0.0 0.0,
      rotate = 0.0 270.0 0.0,
  }
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-physicsshape-mesh"></a>

### mesh

**Type:** string

The path to the model’s mesh file, relative to the folder `media/models_X`.

<a id="scripts-physicsshape-rotate"></a>

### rotate

**Type:** array (array of float, separator: ‘ ‘)

The rotation of the model, in the format `x y z`.

<a id="scripts-physicsshape-translate"></a>

### translate

**Type:** array (array of float, separator: ‘ ‘)

The position offset of the model, in the format `x y z`.
