---
title: "Modding"
source: "https://pzwiki.net/wiki/Modding"
source_revision: "https://pzwiki.net/w/index.php?title=Modding&oldid=1478213"
source_last_edited: "Last modified\n\t\t         This page was last edited on 3 September 2026, at 20:34."
retrieved: "2026-09-15T11:39:22.267Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 3
---

# Modding

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](Modding.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about an overview about modding. For PZwiki project, see PZwiki:Project Modding.

![Spiffo's Workshop is the home of Project Zomboid mods on Steam](../assets/bac350186147432bb4ba.png)

Spiffo's Workshop is the home of Project Zomboid mods on Steam

Modding is the process of creating new content by creating [mods](Mods.md) for a game. For Project Zomboid, modding is a natively integrated part of the game with a mod manager and an API to allow modders to create a various quantity of content, from simple items to complex systems. Mods are usually uploaded to the Spiffo's Workshop which serves as the official method for sharing mods with the community.

<a id="Latest_information_on_MP_unstable_release"></a>

## Latest information on MP unstable release

Main article: TIS Modding Guides

Last updated: 11th of December 2025

The Indie Stone has recently released an unstable version of Project Zomboid which adds back multiplayer in the game. They provided the modding community with modding instructions to applying the new networking changes to existing mods that you can find here. If you don't have a TIS Forum account to download them, you find copies of these files here.

<a id="Terms_.26_Conditions"></a>

## Terms & Conditions

By playing Project Zomboid, you agree to the **Terms & Conditions**.

By modding Project Zomboid, you also agree with the **Modding Policy**.

<a id="Key_restrictions"></a>

### Key restrictions

- The Indie Stone reserves the right to implement any features in the game, irrespective of whether mods exist that accomplish the same goal.
- Modders are solely responsible for their mod, including (but not limited to) compliance with any hosting platforms (such as Steam Workshop). They are also responsible for obtaining third party consents for any third party materials in the mod. Legally, we have to ask that modders to ‘represent and warrant’ (i.e., promise legally) that their mod is their own original work and any third party contents are fully and properly licensed by the modder.
- Creation of mods is subject to our modding policy, which may be updated from time to time with any technical requirements regarding how PZ mods must work.
- Project Zomboid modders are free to receive monetary/gift donations from the players who use their releases, and appreciate the time and effort put into them. However, having mods created exclusively for those who choose to donate (or separate ‘in-mod’ content and bonuses) is not allowed. Mod creators cannot sell modifications to Project Zomboid.

<a id="Commissions"></a>

## Commissions

Modders may choose to provide their skills and services through commissions, but with that comes a lot of responsibility.

If you're instead looking to commission work (have a mod made), and need advice, see [Commissioning Mods](Mods.md#Commissions).

As per the official Terms & Conditions (Section 2.4. Commercialisation) modders are in fact allowed to sell their services / create commissioned work, provided access to the mod and its content is not sold on an individual basis.

The advice below is not part of the TOS, nor legal advice, merely points to consider before going forward as a modder-for-hire:

- You should learn the ins and outs of modding before offering your services. The Zomboid API is fairly unique/niche.
- Have a portfolio ready to show. This can be as simple as your workshop page, and help build trust.
- Maintain transparency with pricing, timelines, and deliverables. Miscommunications cost time.
- Requesting payment upfront might appear to safeguard your time but it also comes with a lot more responsibility.

<a id="Communities"></a>

## Communities

Different communities exist to get help with modding, be it installing or debugging mod problems or creating mods, maps, tiles, etc.:

- Official Discord – check out the **Workshop** category to get help on installing mods, problems with mods, or developing mods.
- PZ Modding Community – provides help on coding, modeling, animating and more.
- Unofficial PZ Mapping Discord – provides help on mapping and tile making.
- Unofficial PZ Cinematic Animation Discord - provides help on cinematic animations and [renders](../assets-and-animation/Rendering.md).

<a id="Modding_Projects"></a>

### Modding Projects

Main article: Modding projects

Various projects are created and handled by the community in relation to Project Zomboid modding. It varies from APIs, debug tools, to complete software development. Communities were also created to focus on modding Project Zomboid. You can contribute to some of these projects or communities directly or indirectly.

<a id="How_to_get_started"></a>

## How to get started

You can learn more in detail how to get started with modding in the [getting started with modding](Getting_started_with_modding.md) page, which will also teach you about various tools for different modding fields. Depending on the type of modding you are interested in, the [#Modding fields](Modding.md#Modding_fields) will provide you with the necessary resources to get started as well as links to some important pages per modding fields.

<a id="Modding_fields"></a>

## Modding fields

Modding is split in different fields, each with their own tools and creation process. For a few general resources on modding that you will need to know regardless of the field you are working on:

- [Mod structure](Mod_structure.md) - Explains a mod files structure.
- [Game files](Game_files.md) - Explains Project Zomboid's file structure.
- [File formats](File_formats.md) - Documentation of file formats used by the game.
- [Debug mode](Debug_mode.md) - Explanations of how to run the game in the debug (developer) mode and how to use it.
- [Startup parameters](Startup_parameters.md) - Startup parameters to launch the game with.
- [Mod optimization](Mod_optimization.md) - Learn various tips, tricks and good habits that will improve your mods performances.
- [Procedural distributions](Procedural_distributions.md) - List and explanations of procedural distributions.
- PZ API Documentation - An in-depth documentation of different API elements for modding such as [Scripts](../scripts/Scripts.md), [Lua (API)](../lua-api/Lua_API.md), [Mapping](../mapping/Mapping.md), [Translation](../translations/Translation.md) etc.

Below is a list of all the modding fields with a brief description of what they involve and links to the relevant pages:

| Field | Description | Important pages |
| --- | --- | --- |
| [Scripts](../scripts/Scripts.md) ([Category:Scripts](../scripts/Scripts.md)) | Allow to add items in the game with simple parameters which can be edited in any text editor. No programming knowledge is needed. | ZedScripts - a [VSCode](Visual_Studio_Code.md) extension to help working with scripts.; PZ API Documentation - provided an in-depth ScriptsDocs.; |
| [Lua API](../lua-api/Lua_API.md) ([Category:Lua (API)](../lua-api/Lua_API.md)) | Allows modders to program functionalities via a Java implementation of Lua called Kahlua which enables Lua scripts to run within Java programs. It bases itself on Lua 5.1 with a few differences and allows the use of exposed Java class and methods from Lua scripts. | [Visual Studio Code](Visual_Studio_Code.md) and [Umbrella](Umbrella_modding.md) - the perfect tools to work with Lua programming for Project Zomboid.; [Lua (language)](../lua-api/Lua_language.md) to learn how to code with the Lua programming language.; [Lua object](../lua-api/Lua_object.md) – a list of available Lua Objects to be used by modders.; [Lua event](../lua-api/Lua_event.md) – a full list of available Events to hook on.; Java object – a list of informations about some Java objects which can be used with the Lua API.; [JavaDocs](../java/JavaDocs.md) - a list of external links to the Java documentation of game.; Decompiling game code - a guide to decompiling the Java to better understand how the game works.; [LuaDocs](../lua-api/LuaDocs.md); |
| [Java](../java/Java.md) (Category:Java) | Involves modifying the Java game code directly and the manual installation of the Java files to modify deep game functionalities. It is not recommended for beginners as it requires a good knowledge of Java and programming in general. | Decompiling game code - a guide to decompiling the Java to better understand how the game works.; IntelliJ IDEA - IntelliJ IDEA is an IDE specialized for Java development.; |
| [Modeling](../assets-and-animation/Modeling.md) | Creating 3D models to be used in item making, vehicle making or renders. | [Creating custom animations](../assets-and-animation/Creating_custom_animations.md); [Creating a hair mod](../assets-and-animation/Creating_a_hair_mod.md); [Creating a clothing mod](../assets-and-animation/Creating_a_clothing_mod.md); |
| Texturing | Creating textures to be applied on 3D models or to create 2D tiles. |  |
| [Rendering](../assets-and-animation/Rendering.md) | Creating 2D images from 3D models to be used in various medias in-game such as fliers. | [Character rigs](../assets-and-animation/Character_rigs.md) - character rigs which can be used to create renders of characters in various poses.; |
| [Animation](../assets-and-animation/Animation.md) ([Category:Animation](../categories/Category_Animation.md)) | Used to create new animations for characters to visually do certain actions. It involves knowledge of 3D softwares for animating but also a small bit of XML programming required to get your animation in-game. | [Character rigs](../assets-and-animation/Character_rigs.md) - character rigs which can be used to create animations of characters.; |
| [Mapping](../mapping/Mapping.md) ([Category:Mapping](../categories/Category_Mapping.md)) | Create new locations, buildings and general environments in the form of a map for users to play on. | [map.info](map.info.md) - Definition of the file used to define the map informations.; [Tiledefs used by mods](../mapping/Tiledefs_used_by_mods.md) - List of tiledef IDs which are already used by other mods.; [Adding new tiles](../mapping/Adding_new_tiles.md) - Guide to adding new tiles.; [Tile properties](../mapping/Tile_properties.md) - Explanation of tile properties.; [Room definitions and item spawns](../mapping/Room_definitions_and_item_spawns.md) - Explanation of room definitions, used mainly for loot distribution.; [Vehicle zones](../mapping/Vehicle_zones.md) - Explanation of vehicle zones.; |
| [Translation](../translations/Translation.md) | Translating the game or mods to various languages. | PZ API Documentation - provides an in-depth documentation of the available language codes and translation files.; |

<a id="Modding_guides"></a>

## Modding guides

Each [#Modding fields](Modding.md#Modding_fields) will contain links to their respective appropriate guides, but there are also some more general guides which are too general to be linked in a specific field, which will be listed below. You can also find internal wiki guides in the category Modding guides category.

Unlisted external guides are listed below:

| Tutorial | Type | Description | Author | Last updated |
| --- | --- | --- | --- | --- |
| Sit-Down Sunday | Modding presentations | Modders teaching others about their modding and game dev knowledge in relation to PZ modding. | PZ Modding Community | 2026 August 2 |
| PZ Modding Video Guides | General guide | Video guides for modding Project Zomboid, covering various aspects of modding. | SimKDT | 2026 March 7 |
| PZ Modding Guides | General guide | A collection of guides and documentation for modding Project Zomboid. | Albion | 2025 May 18 |
| Project Zomboid B42 - How to Create a Mod | Item creation | A short video tutorial explaining how to create an item mod for Project Zomboid. | Rainmaker | 2025 April 23 |
| How to create Custom Firearm with working muzzle/attachments | Item creation | A guide on how to create a custom firearm with working muzzle and attachments. | Nik | 2024 June 29 |
| How to change Zomboid's in-game music and sound effects | Sound | A guide on how to change the in-game music and sound effects of Project Zomboid. | Sokolov | 2024 April 2 |
| PZ Mod Documentation | General guide | A collection of guides and documentation for modding Project Zomboid. | MrBounty | 2023 August 25 |
| FWolfe's Modding Guide (WIP) | General guide | A comprehensive guide to modding Project Zomboid, covering various aspects of modding. However a lot of the information is outdated or better explained by the official wiki. Good pratices are notably way more up-to-date than the wiki. The guide is incomplete on a lot of aspects and now inactive. | Fenris Wolf | 2023 January 22 |
| Full Project Zomboid Mod Tutorial - Start to Finish | Item creation | A 2 hour and a half long step-by-step video tutorial on how to add a new item to Project Zomboid, including creating an icon, adding it to the game, testing it and uploading it to the Steam Workshop. | W. Patrick | 2022 December 13 |
| Complete Vehicle Modding Tutorial | Vehicle making | A forum post which details how to create vehicles. While a bit outdated, it still covers various aspects of vehicle making well. | tubetarakan | 2020 May 4 |

<a id="External_resources"></a>

## External resources

| Resource | Description | Author | Last updated |
| --- | --- | --- | --- |
| Mod Resources (Official Discord - Thread The Under Mod Development Channel) | A thread on the official Discord server that contains a list of resources for modding Project Zomboid, including links to resources, tools, and other useful information. | Glytch3r and more | 2025 July 4 |

<a id="General_additional_modding_resources"></a>

### General additional modding resources

- Photoshop Masks used for making and editing tile sprites, a link to a post on TIS Discord with the file
- A flow chart for the timed actions
- SpawnerAPI: Allows for pending the spawns of vehicles, items, zombies in order to spawn things anywhere in the world. Upon loading the cell in question the item becomes spawned in
- How to spawn loot on specific zombie outfit corpses: a link to a post on TIS Discord explaining how
- WordZed tutorial on YouTube
- Complete Vehicle Modding Tutorial on TIS forum
- isoRangeScan: This is a utility function meant for large-scale scans of isoGridSquares around a given IsoObject. The scans are done fractally – that is to say, from a center (or centers) outward to fill a larger area.

Retrieved from "[https://pzwiki.net/w/index.php?title=Modding&oldid=1478213](Modding.md)"
