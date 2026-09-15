---
title: "Translation Files"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/translations/translation_files.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/translations/translation_files.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="translation-files"></a>

<a id="id1"></a>

# Translation Files

Available translation file types, their descriptions and properties. The majority of the time the key prefix for translation keys need to be included or they won’t work. While this is not always the case, it’s preferable to follow these guidelines to avoid issues with missing translations and to make it cleaner when referencing the translation keys in code or scripts.

The pattern properties are patterns that the translation keys must match in order to be valid, they are simply more specific rules than just the prefix if you are interested in knowing the details. Those were defined from the vanilla translation files for the most part and might be incomplete or too specific.

<a id="attributes"></a>

<a id="translation-files-attributes"></a>

## Attributes

|  |  |
| --- | --- |
| File Name | Attributes |
| Function | `getText` |
| Pattern Properties | `^Attributes_Type_[A-Za-z_]+$`, `^Attributes_ToosltipOverride_[A-Za-z_]+$` |

<a id="bodyparts"></a>

<a id="translation-files-bodyparts"></a>

## BodyParts

|  |  |
| --- | --- |
| File Name | BodyParts |
| Function | `getText` |
| Pattern Properties | `^BODYPART_[A-Z_]+$` |

<a id="challenge"></a>

<a id="translation-files-challenge"></a>

## Challenge

|  |  |
| --- | --- |
| File Name | Challenge |
| Function | `getText` |
| Key Prefix | `Challenge_` |
| Pattern Properties | `^Challenge_[A-Za-z0-9\s]+(_[A-Za-z0-9]+|InfoBox)$` |

<a id="contextmenu"></a>

<a id="translation-files-contextmenu"></a>

## ContextMenu

|  |  |
| --- | --- |
| File Name | ContextMenu |
| Function | `getText` |
| Key Prefix | `ContextMenu_` |
| Pattern Properties | `^ContextMenu_[A-Za-z0-9_]+$` |

Translations used in the context menus of the game.

<a id="credits-translator"></a>

<a id="translation-files-credits-translator"></a>

## Credits_Translator

|  |  |
| --- | --- |
| File Name | Credits_Translator |

Provides the names of the translators for the specific language code. This is basically useless for mods and only used by the game.

<a id="dynamicradio"></a>

<a id="translation-files-dynamicradio"></a>

## DynamicRadio

|  |  |
| --- | --- |
| File Name | DynamicRadio |
| Function | `getRadioText` |
| Key Prefix | `AEBS_` |
| Pattern Properties | `^AEBS_[A-Za-z0-9_]+$` |

Dynamic radio translations.

<a id="entity"></a>

<a id="translation-files-entity"></a>

## Entity

|  |  |
| --- | --- |
| File Name | Entity |
| Function | `getText` |
| Key Prefix | `EC_` |
| Pattern Properties | `^EC_[A-Za-z_]+$` |

Translations for entity UIs.

<a id="evolvedrecipename"></a>

<a id="translation-files-evolvedrecipename"></a>

## EvolvedRecipeName

|  |  |
| --- | --- |
| File Name | EvolvedRecipeName |
| Function | `Translator.getItemEvolvedRecipeName` |
| Pattern Properties | `^[A-Za-z0-9_]+\.[A-Za-z0-9_]+$` |

Translations for evolved recipe scripts.

<a id="farming"></a>

<a id="translation-files-farming"></a>

## Farming

|  |  |
| --- | --- |
| File Name | Farming |
| Function | `getText` |
| Key Prefix | `Farming_` |
| Pattern Properties | `^Farming_[A-Za-z0-9_\s-]+$` |

Translations for farming menus.

<a id="fluids"></a>

<a id="translation-files-fluids"></a>

## Fluids

|  |  |
| --- | --- |
| File Name | Fluids |
| Function | `getText` |
| Key Prefix | `Fluid_` |
| Pattern Properties | `^Fluid_[A-Za-z0-9_]+$` |

Translations for fluid related UI elements and fluid containers.

<a id="gamesound"></a>

<a id="translation-files-gamesound"></a>

## GameSound

|  |  |
| --- | --- |
| File Name | GameSound |
| Function | `getText` |
| Key Prefix | `GameSound_` |
| Pattern Properties | `^GameSound_[A-Za-z0-9_]+$` |

Game sounds and categories translations.

<a id="ig-ui"></a>

<a id="translation-files-ig-ui"></a>

## IG_UI

|  |  |
| --- | --- |
| File Name | IG_UI |
| Function | `getText` |
| Key Prefix | `IGUI_` |
| Pattern Properties | `^IGUI_[A-Za-z0-9_\s:\.\/'!-]+$` |

Translations for in-game user interface elements.

<a id="itemname"></a>

<a id="translation-files-itemname"></a>

## ItemName

|  |  |
| --- | --- |
| File Name | ItemName |
| Function | `getItemNameFromFullType` |
| Pattern Properties | `^[A-Za-z0-9_]+\.[A-Za-z0-9_]+$` |

Translations for item scripts. The key needs to be the full type of the item.

<a id="language"></a>

<a id="translation-files-language"></a>

## language

|  |  |
| --- | --- |
| File Name | language |

Used to define a new language for the game. It needs to be stored inside a folder named after the new language code, and the file itself must be named “language.json”.

<a id="location-generic"></a>

<a id="translation-files-location-generic"></a>

## Location_Generic

The upstream source contains an empty table here; no table values were provided.

A translation file for the map. The filename needs to refer the file “map.info” in the mod’s media folder.

<a id="makeup"></a>

<a id="translation-files-makeup"></a>

## MakeUp

|  |  |
| --- | --- |
| File Name | MakeUp |
| Function | `getText` |
| Pattern Properties | `^MakeUp(Category|Type)_[A-Za-z0-9]+$` |

Translations for make up.

<a id="maplabel"></a>

<a id="translation-files-maplabel"></a>

## MapLabel

|  |  |
| --- | --- |
| File Name | MapLabel |
| Function | `getText` |
| Key Prefix | `MapLabel_` |
| Pattern Properties | `^MapLabel_[A-Za-z]+$` |

<a id="mod"></a>

<a id="translation-files-mod"></a>

## Mod

|  |  |
| --- | --- |
| File Name | Mod |

Translations for the mod.info file. Possible keys are “name” and “description”.

<a id="moodles"></a>

<a id="translation-files-moodles"></a>

## Moodles

|  |  |
| --- | --- |
| File Name | Moodles |
| Function | `getText` |
| Key Prefix | `Moodles_` |
| Pattern Properties | `^Moodles_[A-Za-z0-9_]+(_desc)?_lvl0-9$` |

Moodles status and descriptions translations

<a id="moveables"></a>

<a id="translation-files-moveables"></a>

## Moveables

|  |  |
| --- | --- |
| File Name | Moveables |
| Function | `Translator.getMoveableDisplayName` |
| Pattern Properties | `^[A-Za-z0-9_!\s]+$` |

Moveable tiles as items translations.

<a id="multistagebuild"></a>

<a id="translation-files-multistagebuild"></a>

## MultiStageBuild

|  |  |
| --- | --- |
| File Name | MultiStageBuild |
| Function | `Translator.getMultiStageBuild` |
| Key Prefix | `MultiStageBuild_` |
| Pattern Properties | `^MultiStageBuild_[A-Za-z0-9_]+$` |

Translations for multi stage build.

<a id="print-media"></a>

<a id="translation-files-print-media"></a>

## Print_Media

|  |  |
| --- | --- |
| File Name | Print_Media |
| Function | `getText` |
| Key Prefix | `Print_Media_` |
| Pattern Properties | `^Print_Media_[A-Za-z0-9_]+$` |

Text content for media items such as newspapers, describing their content.

<a id="print-text"></a>

<a id="translation-files-print-text"></a>

## Print_Text

|  |  |
| --- | --- |
| File Name | Print_Text |
| Function | `getText` |
| Key Prefix | `Print_Text_` |
| Pattern Properties | `^Print_Text_[A-Za-z0-9_]+$` |

Raw text content for media items such as newspapers, describing their content.

<a id="radiodata"></a>

<a id="translation-files-radiodata"></a>

## RadioData

|  |  |
| --- | --- |
| File Name | RadioData |
| Function | `getText` |
| Key Prefix | `RD_` |
| Pattern Properties | `^RD_[a-f0-9-]+$` |

Radio translations with the key being a GUID of the radio text.

<a id="recipegroups"></a>

<a id="translation-files-recipegroups"></a>

## RecipeGroups

|  |  |
| --- | --- |
| File Name | RecipeGroups |
| Function | `Translator.getRecipeGroupName` |
| Key Prefix | `RecipeGroup_` |
| Pattern Properties | `^RecipeGroup_[A-Za-z]+$` |

<a id="recipes"></a>

<a id="translation-files-recipes"></a>

## Recipes

|  |  |
| --- | --- |
| File Name | Recipes |
| Function | `getRecipeDisplayName` |
| Pattern Properties | `^[A-Za-z0-9_\(\): -]+$` |

Translations for the craftRecipe scripts. The key needs to be the ID of the craftRecipe block.

<a id="recorded-media"></a>

<a id="translation-files-recorded-media"></a>

## Recorded_Media

|  |  |
| --- | --- |
| File Name | Recorded_Media |
| Function | `getText` |
| Key Prefix | `RM_` |
| Pattern Properties | `^RM_[A-Za-z0-9_-]+$` |

Recorded media translations with the key being a GUID of the media text.

<a id="sandbox"></a>

<a id="translation-files-sandbox"></a>

## Sandbox

|  |  |
| --- | --- |
| File Name | Sandbox |
| Function | `getText` |
| Key Prefix | `Sandbox_` |
| Pattern Properties | `^Sandbox_[A-Za-z0-9_]+(_option[0-9]+|_tooltip)?$` |

Sandbox options translations.

<a id="stash"></a>

<a id="translation-files-stash"></a>

## Stash

|  |  |
| --- | --- |
| File Name | Stash |
| Function | `getText` |
| Key Prefix | `Stash_` |
| Pattern Properties | `^Stash_[A-Za-z0-9_]+$` |

Survivor maps translations.

<a id="survivalguide"></a>

<a id="translation-files-survivalguide"></a>

## SurvivalGuide

|  |  |
| --- | --- |
| File Name | SurvivalGuide |
| Function | `getText` |
| Key Prefix | `SurvivalGuide_` |
| Pattern Properties | `^SurvivalGuide_[A-Za-z0-9_]+$` |

Survival guide translations.

<a id="survivornames"></a>

<a id="translation-files-survivornames"></a>

## SurvivorNames

|  |  |
| --- | --- |
| File Name | SurvivorNames |
| Function | `getText` |
| Pattern Properties | `^Survivor(Name|Surname)_[A-Za-z0-9_\s\.'-]+$` |

All possible automatic character names. Used for random name generation of the player character or for zombies.

<a id="tooltip"></a>

<a id="translation-files-tooltip"></a>

## Tooltip

|  |  |
| --- | --- |
| File Name | Tooltip |
| Function | `getText` |
| Key Prefix | `Tooltip_` |
| Pattern Properties | `^Tooltip_[A-Za-z0-9_]+$` |

Tooltips used for UIs.

<a id="ui"></a>

<a id="translation-files-ui"></a>

## UI

|  |  |
| --- | --- |
| File Name | UI |
| Function | `getText` |
| Key Prefix | `UI_` |
| Pattern Properties | `^UI_[A-Za-z0-9_\s/\-]+$` |

Translation file for user interface elements.
