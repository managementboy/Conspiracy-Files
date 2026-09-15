---
title: "Registries"
source: "https://pzwiki.net/wiki/Registries"
source_revision: "https://pzwiki.net/w/index.php?title=Registries&oldid=1392729"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:59."
retrieved: "2026-09-15T11:42:31.175Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 5
source_tables: 0
---

# Registries

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.15.3).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Registries.md) (Create account)

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about the parameter used in [item scripts](item_scripts.md) to assign tags to items.. For a list of tags in the base game, see item tag.

**Registries** are a new system introduced in Build 42.13.0 to manage various script elements in a more structured way. They are used to define the following identifiers:

- CharacterTrait
- CharacterProfession
- ItemTag
- Brochure
- Flier
- ItemBodyLocation
- ItemType
- MoodleType
- WeaponCategory
- Newspaper
- AmmoType

Adding these identifiers is done in a file that should be located in`media/registries.lua` within a [mod structure](../foundations/Mod_structure.md). This Lua file is [loaded](../lua-api/Lua_API.md#Load_order) before all Lua files and [scripts](Scripts.md).



```text
📁 media
    📁 lua
        ...
    📁 scripts
        ...
    📄 registries.lua
```



This file doesn't clash with other mod files and must have this exact name to be recognized by the game.

<a id="Accessing_identifiers"></a>

## Accessing identifiers

When defining a new identifier, you may want or need to access it in the [Lua API](../lua-api/Lua_API.md). Most registry functions return an identifier object that can be stored in a variable for future use. For example, you can create a new item tag and store its reference like this:



```text
MyModName = {}

MyModName.ItemTag = {}
MyModName.ItemTag.MY_TAG = ItemTag.register("mymodname:my_tag")
```



In [Scripts](Scripts.md) you still need to reference the string ID of the tag, not the variable.

You can then easily retrieve every items with that tag for example the following way:



```text
local items = getScriptManager():getAllItems()
local itemsWithTag = {}

for i = 0, items:size() - 1 do
    local item = items:get(i)

    if item:hasTag(MyModName.ItemTag.MY_TAG) then
        itemsWithTag[#itemsWithTag + 1] = item
    end
end
```



<a id="Example"></a>

## Example



```text
CharacterTrait.register("testmod:nimblefingers")
CharacterProfession.register("testmod:thief")
ItemTag.register("testmod:bobbypin")
Brochure.register("testmod:Village")
Flier.register("testmod:BirdMilk")
ItemBodyLocation.register("testmod:MiddleFinger")
ItemType.register("testmod:gamedev")
MoodleType.register("testmod:Happy")
WeaponCategory.register("testmod:birb")
Newspaper.register("testmod:BirdNews", List.of("BirdKnews_July30",
"BirdKnews_July2"))

local item_key = ItemKey.new("bullets_666", ItemType.NORMAL)
AmmoType.register("testmod:duck_bullets", item_key)
```



Below are example uses of those identifiers in [scripts](Scripts.md):



```text
character_trait_definition testmod:nimblefingers
{
    IsProfessionTrait = false,
    DisabledInMultiplayer = false,
    CharacterTrait = testmod:nimblefingers,
    Cost = 3,
    UIName = UI_trait_nimblefingers,
    UIDescription = UI_trait_nimblefingersDesc,
    XPBoosts = Lockpicking=2,
    GrantedRecipes =
    Lockpicking;AlarmCheck;CreateBobbyPin;CreateBobbyPin2,
}

craftRecipe CreateBobbyPin
{
    timedAction = Making,
    Time = 40,
    Tags = InHandCraft;CanBeDoneInDark,
    needTobeLearn = true,
    inputs
    {
        item 1 tags[base:screwdriver] mode:keep
        flags[MayDegradeLight;Prop1],
        item 1 [Base.Paperclip],
    }
    outputs
    {
        item 1 TestMod.HandmadeBobbyPin,
    }
}

character_profession_definition testmod:thief
{
    CharacterProfession = testmod:thief,
    Cost = 2,
    UIName = UI_prof_Thief,
    IconPathName = profession_burglar2,
    XPBoosts = Nimble=3;Sneak=2;Lightfoot=1;Lockpicking=2,
    GrantedTraits = testmod:nimblefingers,
}

item HandmadeBobbyPin
{
    Weight = 0.01,
    ItemType = base:normal,
    Icon = HandmadeBobbyPin,
    Tags = testmod:bobbypin,
    Tooltip = Tooltip_TestMod_BobbyPin,
    WorldStaticModel = Paperclip,
}
```



These examples were retrieved from the official guide provided by The Indie Stone for the registries system.

Retrieved from "[https://pzwiki.net/w/index.php?title=Registries&oldid=1392729](Registries.md)"
