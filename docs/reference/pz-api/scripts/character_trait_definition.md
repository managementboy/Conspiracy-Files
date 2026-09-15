---
title: "character_trait_definition"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/character_trait_definition.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/character_trait_definition.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="character-trait-definition"></a>

<a id="scripts-character-trait-definition"></a>

# character_trait_definition

**Soft Override:** Unknown

Defines a character trait.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** True

<a id="parameters"></a>

## Parameters

<a id="scripts-character-trait-definition-charactertrait"></a>

### CharacterTrait

**Type:** string

**Required:** True

The registries trait definition ID to link to. see the wiki page about [registries](../../pzwiki/scripts/Registries.md) for more information.

<a id="scripts-character-trait-definition-cost"></a>

### Cost

**Type:** integer

**Required:** True

The cost of the trait when selecting a character. Negative values give points, positive values take points.

<a id="scripts-character-trait-definition-disabledinmultiplayer"></a>

### DisabledInMultiplayer

**Type:** boolean

**Deprecated:** {‘description’: ‘This parameter is no longer used and now has no effect.’}

**Required:** True

Previously was used to mark traits as disabled in multiplayer, but is now deprecated and has no effect.

<a id="scripts-character-trait-definition-grantedrecipes"></a>

### GrantedRecipes

**Type:** array (array of string, separator: ‘;’)

A list of [craftRecipe](../../pzwiki/scripts/craftRecipe.md) IDs that are granted to the character when this trait is selected.

<a id="scripts-character-trait-definition-isprofessiontrait"></a>

### IsProfessionTrait

**Type:** boolean

**Required:** True

Defines whenever the trait is a profession trait or not, meaning it will only be available when selecting a profession.

<a id="scripts-character-trait-definition-mutuallyexclusivetraits"></a>

### MutuallyExclusiveTraits

**Type:** array (array of string, separator: ‘;’)

A list of trait IDs that are mutually exclusive with this trait. If one is selected, the others cannot be selected.

<a id="scripts-character-trait-definition-texture"></a>

### Texture

**Type:** string

The path to the trait’s icon texture. This should be a .png file located in the textures folder of your mod.

<a id="scripts-character-trait-definition-uidescription"></a>

### UIDescription

**Type:** string

**Required:** True

The translation key for the trait’s description. The translation key needs to be in the UI translation file. See the wiki page about translations for more information.

<a id="scripts-character-trait-definition-uiname"></a>

### UIName

**Type:** string

**Required:** True

The translation key for the trait’s name. The translation key needs to be in the UI translation file. See the wiki page about translations for more information.

<a id="scripts-character-trait-definition-xpboosts"></a>

### XPBoosts

**Type:** object (object: string->>integer, kv: ‘=’, pairs: ‘;’)

A list of experience boosts granted by this trait. Each entry should contain a skill name and the corresponding boost amount.

For example:



```cpp
XPBoosts = Axe=1;Blunt=1,
```
