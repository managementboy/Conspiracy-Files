---
title: "mannequin"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/mannequin.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/mannequin.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="mannequin"></a>

<a id="scripts-mannequin"></a>

# mannequin

**Soft Override:** Unknown

Used to define mannequins, which can be used in [mapping](../../pzwiki/mapping/Mapping.md) to create mannequins in the world.

To get a list of available mannequins, see this#Available_mannequins).

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

<a id="scripts-mannequin-animset"></a>

### animSet

**Type:** string

animSet defines the [AnimSet](../../pzwiki/assets-and-animation/AnimSet.md) used by the mannequin, which you probably should keep as `mannequin`. animState will set the [AnimState](../../pzwiki/assets-and-animation/AnimState.md) used in the provided animSet. The pose parameter will set the [AnimNode](../../pzwiki/assets-and-animation/AnimNode.md) used by the mannequin, so the file inside the animState.

For example, take the vanilla mannequin AnimSets:



```
📁 media
  📁 AnimSets
    📁 mannequin
      📁 female
        📄 pose01.xml
        📄 pose02.xml
        📄 pose03.xml
      📁 male
        📄 pose01.xml
        📄 pose02.xml
        📄 pose03.xml
      📁 scarecrow
        📄 pose01.xml
      📁 skeleton
        📄 pose01.xml
```



If we want to use the AnimState `female` and AnimNode `pose01.xml`, we need the following parameter combination:



```cpp
animNode=mannequin,
animState=female,
pose=pose01,
```



<a id="scripts-mannequin-animstate"></a>

### animState

**Type:** string

See parameter [animSet](mannequin.md#scripts-mannequin-animset).

<a id="scripts-mannequin-female"></a>

### female

**Type:** boolean

**Default:** `True`

Set to `true` to mark the mannequin as female, which wil change its body type.

<a id="scripts-mannequin-model"></a>

### model

**Type:** block (block: [model](model.md#scripts-model))

The [model](model.md) used by the mannequin. Some of the models available are:

- FemaleBody
- MaleBody
- Mannequin_Scarecrow
- Mannequin_Skeleton

By combining it with the texture parameter, you can create a variety of mannequin appearances.

<a id="scripts-mannequin-outfit"></a>

### outfit

**Type:** string

**Can be empty:** True

The outfit used by the mannequin.

<a id="scripts-mannequin-pose"></a>

### pose

**Type:** string

See parameter [animSet](mannequin.md#scripts-mannequin-animset).

<a id="scripts-mannequin-texture"></a>

### texture

**Type:** string

Used to chose the texture that will be rendered on the mannequin model. The texture needs to be in the `media/textures/body` folder.
