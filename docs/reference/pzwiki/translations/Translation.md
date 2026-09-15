---
title: "Translation"
source: "https://pzwiki.net/wiki/Translation"
source_revision: "https://pzwiki.net/w/index.php?title=Translation&oldid=1465207"
source_last_edited: "Last modified\n\t\t         This page was last edited on 28 August 2026, at 10:04."
retrieved: "2026-09-15T11:40:37.710Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 8
source_tables: 2
---

# Translation

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.0).

Help by adding any missing content. [Edit](Translation.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about translating the game or a mod. For a guide to translating the wiki, see Help:Translations.

**Translations** a modding field that involves translating the game or a mod to a different language. This can be done by creating translation files for the game or mod, which are then read by the game which automatically retrieves the text via keys associated to translation values. It is also possible to create a new translation language for the game.

<a id="Translation_types"></a>

## Translation types

Different translation types exist, used for different purposes. A translation type is associated to a specific file which needs to hold the translations for that type, sometimes requiring a prefix for the keys.

As of Build 42.15.0, the translation files are`.json` files and should no longer have the language code in their name.

| Translation type | Filename | Key prefix | Function | Notes |
| --- | --- | --- | --- | --- |
| Attributes |`Attributes` |  |`getText` |  |
| BodyParts |`BodyParts` |  |`getText` |  |
| Challenge |`Challenge` |`Challenge_` |`getText` |  |
| ContextMenu |`ContextMenu` |`ContextMenu_` |`getText` | Translations used in the context menus of the game. |
| DynamicRadio |`DynamicRadio` |`AEBS_` |`getRadioText` | Dynamic radio translations. |
| Entity |`Entity` |`EC_` |`getText` | Translations for entity scripts. |
| EvolvedRecipeName |`EvolvedRecipeName` |  |`Translator.getItemEvolvedRecipeName` | Translations for evolved recipe scripts. |
| Farming |`Farming` |`Farming_` |`getText` | Translations for farming menus. |
| Fluids |`Fluids` |`Fluid_Name_` |`getText` | Translations for fluid related UI elements and fluid containers. |
| GameSound |`GameSound` |`GameSound_` |`getText` | Game sounds and categories translations. |
| IGUI |`IG_UI` |`IGUI_` |`getText` | Translations for in-game user interface elements. |
| ItemName |`ItemName` |  |`getItemNameFromFullType` | Translations for item scripts. The key needs to be the full type of the item. |
| Location_Generic |  |  |  | A translation file for the map. The filename needs to refer the file "map.info" in the mod's media folder. |
| MakeUp |`MakeUp` |  |`getText` | Translations for make up. |
| MapLabel |`MapLabel` |`MapLabel_` |`getText` |  |
| Mod |`Mod` |  |  | Translations for the mod.info file. Possible keys are "name" and "description". |
| Moodles |`Moodles` |`Moodles_` |`getText` | Moodles status and descriptions translations |
| Moveables |`Moveables` |  |`Translator.getMoveableDisplayName` | Moveable tiles as items translations. |
| MultiStageBuild |`MultiStageBuild` |`MultiStageBuild_` |`Translator.getMultiStageBuild` | Translations for multi stage build. |
| Print_Media |`Print_Media` |`Print_Media_` |`getText` | Text content for media items such as newspapers, describing their content. |
| Print_Text |`Print_Text` |`Print_Text_` |`getText` | Raw text content for media items such as newspapers, describing their content. |
| RadioData |`RadioData` |`RD_` |`getText` | Radio translations with the key being a GUID of the radio text. |
| RecipeGroups |`RecipeGroups` |`RecipeGroup_` |`Translator.getRecipeGroupName` |  |
| Recipes |`Recipes` |  |`getRecipeDisplayName` | Translations for the craftRecipe scripts. The key needs to be the ID of the craftRecipe block. |
| Recorded_Media |`Recorded_Media` |`RM_` |`getText` | Recorded media translations with the key being a GUID of the media text. |
| Sandbox |`Sandbox` |`Sandbox_` |`getText` | Sandbox options translations. |
| Stash |`Stash` |`Stash_` |`getText` | Survivor maps translations. |
| SurvivalGuide |`SurvivalGuide` |`SurvivalGuide_` |`getText` | Survival guide translations. |
| SurvivorNames |`SurvivorNames` |  |`getText` | All possible automatic character names. Used for random name generation of the player character or for zombies. |
| Tooltip |`Tooltip` |`Tooltip_` |`getText` | Tooltips used for UIs. |
| UI |`UI` |`UI_` |`getText` | Translation file for user interface elements. |

<a id="JSON_Schemas"></a>

### JSON Schemas

JSON schemas are used to validate the format of JSON files, ensuring they meet the required structure. For translations, those were made to validate the key prefixes and required fields for each translation type.

To use those schemas, you have different methods, the one described in this guide bases itself on the widely used [Visual Studio Code](../foundations/Visual_Studio_Code.md) in the modding community.

The schemas are provided in the [PZ Data](../scripts/PZ_Data.md) repository for download or direct cloning but the best way is to directly link to their online version from the repository, which will allow you to always have the last updated versions.

To use the online schemas, you need to add a new trusted domain to your Visual Studio Code setting`json.schemaDownload.trustedDomains`, either in your global settings or workspace settings:

**Source:**`.vscode\settings.json`



```text
{
    "json.schemaDownload.trustedDomains": {
        "https://raw.githubusercontent.com/pz-wiki-modding/pz-translation-data": true
    }
}
```



Alternatively, you can use local schemas by downloading them from [PZ Data](../scripts/PZ_Data.md) releases, then using the path to the schema instead of the online link.

<a id="Linking_to_schemas_via_Visual_Studio_Code_settings"></a>

#### Linking to schemas via Visual Studio Code settings

You can link to the schemas via the Visual Studio Code setting`json.schemas`, either in your global settings or workspace settings. For example, linking to the Moveables schema will be as follows: **Source:**`.vscode\settings.json`



```text
{
  "json.schemas": [
    {
      "fileMatch": [
        "**/media/lua/shared/Translate/*/Moveables.json"
      ],
      "url": "https://raw.githubusercontent.com/pz-wiki-modding/pz-translation-data/refs/heads/main/PZ_Translation_Schemas/Moveables.schema.json",
      "name": "PZ Moveables translation schema"
    }
  ]
}
```



You can find a full configuration file in the [PZ Data](../scripts/PZ_Data.md) repository, which you can either download in the releases or download from the repository.

The map schemas (`Location_Generic`) are not available for Visual Studio Code settings due to no specific pattern being usable to target them, so you will need to link to them manually in the translation files as explained in the next section.

<a id="Manually_linking_to_the_schemas_in_the_translation_files"></a>

#### Manually linking to the schemas in the translation files

You can directly refer to the schemas with a custom key`$schema` as follows inside your translation files:



```text
{
    "$schema": "link/to/schema.json",
    ...
}
```



The`link/to/schema.json` needs to link to the schema for the specific translation type schema which follows the link format`https://raw.githubusercontent.com/pz-wiki-modding/pz-translation-data/refs/heads/main/PZ_Translation_Schemas/<translationType>.schema.json`. You need to replace`<translationType>` with the translation type listed in the table above, for example`Moveables` will be`https://raw.githubusercontent.com/pz-wiki-modding/pz-translation-data/refs/heads/main/PZ_Translation_Schemas/Moveables.schema.json`.

For example, the setup for a schema will be as follows: **Source:**`media\lua\shared\Translate\EN\UI.json`



```text
{
    "$schema": "https://raw.githubusercontent.com/pz-wiki-modding/pz-translation-data/refs/heads/main/PZ_Translation_Schemas/UI.schema.json",
    ...
}
```



<a id="Map_information"></a>

### Map information

Map translations use the following files:



```text
📁 media
    📁 maps
        📁 <map folder>/
            📄 map.info
            ...
    📁 lua
        📁 shared
            📁 Translate
                📁 <language code>
                    📄 <map>.json
```



The file needs to have a title and description field, and alternatively a [JSON schema field](Translation.md#JSON_Schemas) can be added for validation:



```text
{
    "$schema": "https://raw.githubusercontent.com/pz-wiki-modding/pz-translation-data/refs/heads/main/PZ_Translation_Schemas/Location_Generic.schema.json",
    "title": "Your map name",
    "description": "Your map description"
}
```



Example Riverside description: **Source:**`Translate\EN\Riverside, KY.json`

**Retrieved**: Build 42.15.0



```text
{
    "title": "Riverside, KY",
    "description": "<CENTRE> <SIZE:medium> RIVERSIDE <LINE> <LINE><LEFT> <SIZE:small> A colorful town tightly hugging the banks of the mighty Ohio: exploring Riverside is a rich and diverse experience! To the west you'll find the older parts of town, while out east is where wealthier residents work, rest, and play. <LINE> <LINE>If you're considering a stay with us, why not check out the nearby West Maple Country Club? The ultimate in comfort and relaxation, members have access to an 18-hole golf course, tennis courts, swimming pool, and fantastic bars and lounges. Come join today!"
}
```



<a id="Languages"></a>

## Languages

The game uses languages added to the`media/lua/shared/Translate` folder, information about the language is stored in the`language.txt` file of each language directory.

For Build 41, most language use different encodings. Since Build 42.15.0, all languages use UTF-8 encoding.

| Code | Language | Build 41 encoding | Pre Build 42.15.0 encoding | Post Build 42.15.0 encoding |
| --- | --- | --- | --- | --- |
| AR | Espanol (AR) - Argentina Spanish | Cp1252 | Cp1252 | UTF-8 |
| CA | Catalan | ISO-8859-15 | ISO-8859-15 | UTF-8 |
| CH | Traditional Chinese | UTF-8 | UTF-8 | UTF-8 |
| CN | Simplified Chinese | UTF-8 | UTF-8 | UTF-8 |
| CS | Czech | Cp1250 | Cp1250 | UTF-8 |
| DA | Danish | Cp1252 | UTF-8 | UTF-8 |
| DE | Deutsch - German | Cp1252 | UTF-8 | UTF-8 |
| EN | English | UTF-8 | UTF-8 | UTF-8 |
| ES | Espanol (ES) - Spanish | Cp1252 | UTF-8 | UTF-8 |
| FI | Finnish | Cp1252 | UTF-8 | UTF-8 |
| FR | Francais - French | Cp1252 | UTF-8 | UTF-8 |
| HU | Hungarian | Cp1250 | UTF-8 | UTF-8 |
| ID | Indonesia | UTF-8 | UTF-8 | UTF-8 |
| IT | Italiano | Cp1252 | UTF-8 | UTF-8 |
| JP | Japanese | UTF-8 | UTF-8 | UTF-8 |
| KO | Korean | UTF-16 | UTF-8 | UTF-8 |
| NL | Nederlands - Dutch | Cp1252 | UTF-8 | UTF-8 |
| NO | Norsk - Norwegian | Cp1252 | UTF-8 | UTF-8 |
| PH | Tagalog - Filipino | UTF-8 | UTF-8 | UTF-8 |
| PL | Polish | Cp1250 | UTF-8 | UTF-8 |
| PT | Portuguese | Cp1252 | UTF-8 | UTF-8 |
| PTBR | Brazilian Portuguese | Cp1252 | UTF-8 | UTF-8 |
| RO | Romanian | UTF-8 | UTF-8 | UTF-8 |
| RU | Russian | Cp1251 | UTF-8 | UTF-8 |
| TH | Thai | UTF-8 | UTF-8 | UTF-8 |
| TR | Turkish | Cp1254 | UTF-8 | UTF-8 |
| UA | Ukrainian | Cp1251 | UTF-8 | UTF-8 |

<a id="Adding_new_languages"></a>

### Adding new languages

Source marks this entry as incomplete.

- Create a new folder with the id of the language
- Add the [language.txt](language.txt.md) file
- Add fonts if necessary
- Add translations

<a id="Example"></a>

## Example

Examples were provided in the official documentation.

**Source:**`media/lua/shared/Translate/EN\UI.json`



```text
{
    "UI_mainscreen_continue": "CONTINUE (Duck ¼)",
    "UI_mainscreen_tutorial": "TUTORIAL (Duck ½)",
    "UI_mainscreen_solo": "SOLO (Duck ¾)",
    "UI_mainscreen_mods": "MODS (Duck ¿)"
}
```



<a id="Trivia"></a>

## Trivia

Official translations used to be done on ProjectZomboidTranslations GitHub, however starting with Build 42 a professional studio was hired for translations.

<a id="See_also"></a>

## See also

- GitHub repository for the game translations (outdated)
- Releases of TranslationZed tool
- Steam guide by **Matrioshka**, **Riko Prushka**
- PZ Translator (original) - a tool to translate the game and mods automatically, bases itself on Google Translate. (outdated)
- PZ Translator (forked) - a tool to translate the game and mods automatically, bases itself on Google Translate. (outdated)

Retrieved from "[https://pzwiki.net/w/index.php?title=Translation&oldid=1465207](Translation.md)"
