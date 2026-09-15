---
title: "clothingDecals"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/xml/clothingdecals.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/xml/clothingdecals.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="clothingdecals"></a>

<a id="xml-clothingdecals"></a>

# clothingDecals

Define decal groups for clothing items to use. Seems to be only used for shirts in the vanilla game and it is unknown if they can be used for other clothing items. The decal groups are linked to clothing items via the m_DecalGroup parameter. They can also be linked to other decal groups via the group parameter, allowing a decal group to use decals from another decal group.

The file needs to exactly stored at the path `media/clothing/clothingDecals.xml` for the game to recognize it. It won’t clash with other mods or the vanilla game file. The syntax of this file should be as follows:



```xml
<?xml version="1.0" encoding="utf-8"?>
<clothingDecals>
  <group>
    <name>MyDecalGroup</name>
    <decal>myDecal</decal>
    <decal>anotherDecal</decal>
  </group>
  <group>
    <name>MyOtherDecalGroup</name>
    <group>MyDecalGroup</group>
  </group>
  <group>
    <name>MyThirdDecalGroup</name>
    <decal>thirdDecal</decal>
    <group>MyOtherDecalGroup</group>
  </group>
</clothingDecals>
```



<a id="file-patterns"></a>

## File Patterns

The following file patterns are used to determine what the valid path for the XML file can be, relative to the [media](../../pzwiki/foundations/Mod_structure.md) folder.

- `**/clothing/clothingDecals.xml`

<a id="root-details"></a>

<a id="clothingdecals-type-clothingdecals"></a>

## Root Details

**Element:** clothingDecals

The root element is the top-level XML element that contains all other elements in the XML file.

**Composition:** all

<a id="elements"></a>

### Elements

<a id="id1"></a>

#### group

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_clothingDecalGroup](clothingdecals.md#clothingdecals-type-clothingdecalgroup)

Defines a decal group, that is a collection of decals associated to a name for referencing.

<a id="type-clothingdecalgroup"></a>

<a id="clothingdecals-type-clothingdecalgroup"></a>

## type_clothingDecalGroup

**Composition:** all

<a id="id2"></a>

### Elements

<a id="name"></a>

#### name

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

A unique identifier for the decal group.

<a id="decal"></a>

#### decal

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

Refers to a texture file stored inside the folder `media/textures/shirtdecals/`. The value needs to be the name of the file without the extension (which needs to be `.png`). Alternatively, it seems the game also accepts decals inside texture packs.

For example, for the following file structure:



```
📁 media
  📁 textures
    📁 shirtdecals
      📄 myDecal.png
      📄 anotherDecal.png
```



The decal parameter should have this following syntax:



```
<decal>myDecal</decal>
<decal>anotherDecal</decal>
```



<a id="id3"></a>

#### group

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

Refers to another group. This allows that group to use decals of the referenced group.
