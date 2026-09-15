---
title: "clothing"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/xml/clothing.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/xml/clothing.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="clothing"></a>

<a id="xml-clothing"></a>

# clothing

Define outfits for the male and female characters that can be used on zombies or the player. Items are provided with a probability value to define how likely they are to appear in the outfit.

The file should be stored at the exact path `media/clothing/clothing.xml` and won’t clash with other mods or the vanilla game file. The syntax of this file should be as follows:



```xml
<?xml version="1.0" encoding="utf-8"?>
<outfitManager>
  <m_FemaleOutfits>
    <m_Name>MyOutfit</m_Name>
    <m_Guid>my-outfit-guid</m_Guid>
    <m_items>
      <item>
        <probability>0.5</probability>
        <itemGUID>my-clothing-item-guid</itemGUID>
      </item>
      <item>
        <probability>0.5</probability>
        <itemGUID>my-other-clothing-item-guid</itemGUID>
        <subItems>
          <subItem>
            <itemGUID>my-sub-clothing-item-guid</itemGUID>
          </subItem>
        </subItems>
      </item>
    </m_items>
  </m_MaleOutfits>
    <m_Name>MyOutfit</m_Name>
    <m_Guid>my-outfit-guid</m_Guid>
    <m_items>
      <item>
        <probability>0.5</probability>
        <itemGUID>my-clothing-item-guid</itemGUID>
      </item>
      <item>
        <probability>0.5</probability>
        <itemGUID>my-other-clothing-item-guid</itemGUID>
        <subItems>
          <subItem>
            <itemGUID>my-sub-clothing-item-guid</itemGUID>
          </subItem>
        </subItems>
      </item>
    </m_items>
  </m_MaleOutfits>
</outfitManager>
```



Due to all the GUID work between the clothing.xml, fileGuidTable.xml and clothingItem.xml files, it can be easy to get lost. Outfit XML Convereter can help you with the process.

<a id="file-patterns"></a>

## File Patterns

The following file patterns are used to determine what the valid path for the XML file can be, relative to the [media](../../pzwiki/foundations/Mod_structure.md) folder.

- `**/clothing/clothing.xml`

<a id="root-details"></a>

<a id="clothing-type-clothing"></a>

## Root Details

**Element:** outfitManager

The root element is the top-level XML element that contains all other elements in the XML file.

**Composition:** all

<a id="elements"></a>

### Elements

<a id="m-femaleoutfits"></a>

#### m_FemaleOutfits

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_outfit](clothing.md#clothing-type-outfit)

Define an outfit with [m_FemaleOutfits](clothing.md#m-femaleoutfits) and m_MaleOutfits respectively for the female and male characters. If one of the two is not defined, it won’t spawn naturally on the other gender in the game. Both male and female outfits can (and probably should) keep the same m_Name and m_Guid values.

<a id="id2"></a>

#### m_MaleOutfits

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_outfit](clothing.md#clothing-type-outfit)

Define an outfit with [m_FemaleOutfits](clothing.md#m-femaleoutfits) and m_MaleOutfits respectively for the female and male characters. If one of the two is not defined, it won’t spawn naturally on the other gender in the game. Both male and female outfits can (and probably should) keep the same m_Name and m_Guid values.

<a id="type-outfit"></a>

<a id="clothing-type-outfit"></a>

## type_outfit

**Composition:** all

<a id="id7"></a>

### Elements

<a id="id8"></a>

#### m_Name

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

The unique identifier for the outfit. Preferably keep it the same for the male and female variants.

<a id="id9"></a>

#### m_Guid

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

The GUID of the outfit. This is the GUID associated to the clothing in the fileGuidTable and clothingItem files.

To use a vanilla clothing item in your outfit, you need to redefine it in your own mod’s fileGuidTable.xml file, otherwise the game will not recognize it.

<a id="m-top"></a>

#### m_Top

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

If set to `true`, the outfit will spawn with random pants or shirts, respectivement for the parameters m_Pants and [m_Top](clothing.md#m-top). When those two parameters are not set, they default to `true`.

<a id="id11"></a>

#### m_Pants

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-allowpantshue"></a>

#### m_AllowPantsHue

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-allowtoptint"></a>

#### m_AllowTopTint

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-allowpantstint"></a>

#### m_AllowPantsTint

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-allowtshirtdecal"></a>

#### m_AllowTShirtDecal

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-items"></a>

#### m_items

**Minimum occurence:** 1

**Maximum occurence:** unbounded

**Type:** [type_item](clothing.md#clothing-type-item)

No description provided.

<a id="type-item"></a>

<a id="clothing-type-item"></a>

## type_item

**Composition:** all

<a id="id12"></a>

### Elements

<a id="probability"></a>

#### probability

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:float`

The probability of the item being selected for the outfit. Needs to be a value between 0.0 and 1.0.

<a id="itemguid"></a>

#### itemGUID

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

The GUID of the clothing item that should be part of the outfit. You can define extra outfits thanks to the subItems parameter.

<a id="id14"></a>

#### subItems

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_subItem](clothing.md#clothing-type-subitem)

Define a sub-item for a specific clothing item used in the outfit, so other items can also be picked. Any sub-item can be added as variant choices.

<a id="type-subitem"></a>

<a id="clothing-type-subitem"></a>

## type_subItem

**Composition:** all

<a id="id15"></a>

### Elements

<a id="id16"></a>

#### itemGUID

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

The GUID of the clothing item that should be part of the outfit. You can define extra outfits thanks to the subItems parameter.
