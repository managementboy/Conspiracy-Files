---
title: "fileGuidTable"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/xml/fileguidtable.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/xml/fileguidtable.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="fileguidtable"></a>

<a id="xml-fileguidtable"></a>

# fileGuidTable

Associate clothingItem files to a GUID for access in the [clothing](clothing.md) file. Whenever you want to use vanilla clothing in your clothing.xml file, you have to redefine them in your own mod’s fileGuidTable.xml file, otherwise the game will not recognize them.

An example file would look like this:



```xml
<?xml version="1.0" encoding="utf-8"?>
<fileGuidTable>
  <files>
    <path>media/clothing/clothingItems/MyClothingItem.xml</path>
    <guid>YOUR_RANDOM_CLOTHING_ITEM_GUID_HERE</guid>
  </files>
  <files>
    <path>media/clothing/clothingItems/MyOtherClothingItem.xml</path>
    <guid>YOUR_OTHER_RANDOM_CLOTHING_ITEM_GUID_HERE</guid>
  </files>
</fileGuidTable>
```



Due to all the GUID work between the clothing.xml, fileGuidTable.xml and clothingItem.xml files, it can be easy to get lost. Outfit XML Convereter can help you with the process.

<a id="file-patterns"></a>

## File Patterns

The following file patterns are used to determine what the valid path for the XML file can be, relative to the [media](../../pzwiki/foundations/Mod_structure.md) folder.

- `**/media/fileGuidTable.xml`

<a id="root-details"></a>

<a id="fileguidtable-type-fileguidtable"></a>

## Root Details

**Element:** fileGuidTable

The root element is the top-level XML element that contains all other elements in the XML file.

**Composition:** all

<a id="elements"></a>

### Elements

<a id="files"></a>

#### files

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_fileGuidTable_files](fileguidtable.md#fileguidtable-type-fileguidtable-files)

Define a clothingItem file and GUID association.

For example for a clothingItem with the following file structure:



```
📁 media
  📁 clothing
    📁 clothingItems
      📄 MyClothingItem.xml
```



You should have the following parameters:



```xml
<files>
  <path>media/clothing/clothingItems/MyClothingItem.xml</path>
  <guid>YOUR_RANDOM_CLOTHING_ITEM_GUID_HERE</guid>
</files>
```



<a id="type-fileguidtable-files"></a>

<a id="fileguidtable-type-fileguidtable-files"></a>

## type_fileGuidTable_files

**Composition:** all

<a id="id2"></a>

### Elements

<a id="path"></a>

#### path

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

The path to the clothingItem file. This path is relative to the upper folder of `media`, for example for the following structure:



```
📁 MyMod
  📁 media
    📁 clothing
      📁 clothingItems
        📄 MyClothingItem.xml
```



You need the following parameter:



```xml
<path>media/clothing/clothingItems/MyClothingItem.xml</path>
```



<a id="guid"></a>

#### guid

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

The GUID of the clothing item. This needs to be the same as the one inside the clothingItem file for the clothing item to be recognized by the game.
