---
title: "character_profession_definition"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/character_profession_definition.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/character_profession_definition.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="character-profession-definition"></a>

<a id="scripts-character-profession-definition"></a>

# character_profession_definition

**Soft Override:** Unknown

Defines a character profession.



```cpp
character_profession_definition yourmod:example_profession
{
    CharacterProfession = yourmod:example_profession,
    Cost = -6,
    UIName = UI_prof_MetalWorker,
    UIDescription = UI_profdesc_metalworker,
    IconPathName = profession_metalworker,
    XPBoosts = MetalWelding=4,
    GrantedRecipes = Advanced_Forge;Blast_Furnace,
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

<a id="scripts-character-profession-definition-characterprofession"></a>

### CharacterProfession

**Type:** string

The [registries](../../pzwiki/scripts/Registries.md) profession ID to link to.

<a id="scripts-character-profession-definition-cost"></a>

### Cost

**Type:** integer

The cost of the profession when selecting a character. Negative values remove points, positive values add points.

<a id="scripts-character-profession-definition-grantedrecipes"></a>

### GrantedRecipes

**Type:** array (array of string, separator: ‘;’)

A list of [craftRecipe](craftrecipe.md) IDs that are granted to the character when this profession is selected.

<a id="scripts-character-profession-definition-grantedtraits"></a>

### GrantedTraits

**Type:** array (array of string, separator: ‘;’)

A list of character trait IDs that are granted to the character when this profession is selected.

<a id="scripts-character-profession-definition-iconpathname"></a>

### IconPathName

**Type:** string

No description provided.

<a id="scripts-character-profession-definition-uidescription"></a>

### UIDescription

**Type:** string

The translation key for the profession’s description. The translation key needs to be in the UI translation file. See the wiki page about translations for more information.

<a id="scripts-character-profession-definition-uiname"></a>

### UIName

**Type:** string

The translation key for the profession’s name. The translation key needs to be in the UI translation file. See the wiki page about translations for more information.

<a id="scripts-character-profession-definition-xpboosts"></a>

### XPBoosts

**Type:** object (object: string->>integer, kv: ‘=’, pairs: ‘;’)

A list of experience boosts granted by this profession. Each entry should contain a skill name and the corresponding boost amount.

For example:



```cpp
XPBoosts = Axe=1;Blunt=1,
```
