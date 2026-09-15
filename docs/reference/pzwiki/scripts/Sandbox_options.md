---
title: "Sandbox options"
source: "https://pzwiki.net/wiki/Sandbox_options"
source_revision: "https://pzwiki.net/w/index.php?title=Sandbox_options&oldid=1442317"
source_last_edited: "Last modified\n\t\t         This page was last edited on 13 July 2026, at 19:57."
retrieved: "2026-09-15T11:39:42.777Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 15
source_tables: 1
---

# Sandbox options

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Sandbox_options.md) (Create account)

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about creating custom sandbox options (modding). For an explanation of options in the 'sandbox' game mode, see [Custom Sandbox](Sandbox_options.md).

**Sandbox options** allow users to tweak how they want to experience the game, which mods can also utilize. In comparison to [ModOptions](../lua-api/ModOptions.md), these settings apply to every player, but like these, you have access to different types of options. They use [Scripts](Scripts.md) syntax.

Mods sandbox options are defined in a file named`sandbox-options.txt` with the following folder structure:



```text
📁 media
    📄 sandbox-options.txt
```



To get more information on the modding folder structure and the media folder, see the [Mod structure](../foundations/Mod_structure.md) page.

The file starts with the parameter`VERSION = 1,` which is used by the game to recognize which method needs to be used to read the sandbox option file. It's used by developers in case they change the way this file reads in future updates. Unless you know what you are doing, you shouldn't change this value.

The rest of the file is a list of sandbox options, each defined by an option [Scripts](Scripts.md) file. All blocks will follow the following structure:



```text
option ModName.OptionName
{
    type = <optionType>,
    ...
    page = <pageName>,
    translation = <ModName>_<OptionName>,
}
```



You can choose any name for`ModName` and`OptionName` without spaces, but it is usually your mod name and a logical option name for easier identification. Accessing the option value in Lua will be done with`SandboxVars.ModName.OptionName`.

You can set`pageName` to a custom page name of your choosing to create new tabs in the Sandbox Options menu.

<a id="Option_types"></a>

## Option types

The`type` parameter defines the type of the option which replaces`<optionType>` in the example code above. The following lists every type and their various parameters:

| Option type | Description | Parameters |
| --- | --- | --- |
|`boolean` | Booleans are used for options that can be either true or false. |`type = boolean, default = <true/false>,` |
|`integer` | Integers are used for options that can be any whole number. |`type = integer, default = <number>, min = <number>, max = <number>,` |
|`double` | Doubles are used for options that can be any float number. |`type = double, default = <number>, min = <number>, max = <number>,` |
|`string` | Strings are used for options that can be any text. For an empty string by default, use`default = ,`. |`type = string, default = <text>,` |
|`enum` | Enums are used for options that can be one of a list of predefined values. |`type = enum, default = <value>, numValues = <number>,` |

For example:



```text
option MyMod.MyOption
{
    type = boolean,
    default = true,
    page = MyPage,
    translation = MyMod_MyOption,
}
```



<a id="Translations"></a>

## Translations

You can also add [Translation](../translations/Translation.md) for your options in the translation folder. This is also needed if you want to give your option a proper name in the game.

Sandbox options are put in the following file:



```text
📁 media
    📁 lua
        📁 shared
            📁 Translate
                📁 <language code>
                    📄 Sandbox.json
```



The different sandbox options need extra parameters first:



```text
option ModName.OptionName
{
    type = <optionType>,
    ...
    page = <pageName>,
    translation = <ModName>_<OptionName>,
}
```



Both`<pageName>` and`<ModName>_<OptionName>` are used with the translation system to give a proper name to the option in the game. The`<pageName>` is the name of the page where the option will be displayed in the game, while`<ModName>_<OptionName>` is the translation key for the option name.

The translations are defined in the translation file with the following structure:



```text
{
    "Sandbox_<pageName>": "The page name",

    "Sandbox_<ModName>_<OptionName>": "The option name",
    "Sandbox_<ModName>_<OptionName>_tooltip": "This is the tooltip of the option."
}
```



It's important to note that the tooltip translation is optional, but it's recommended to add it for better understanding of the option. You can also use [ISRichTextPanel](../lua-api/ISRichTextPanel.md) tags in the tooltip, which means you can add images and colors in the sandbox options but also have custom text formating.

If you don't add the translation parameters, they can't appear in-game, but if the translation doesn't exist in the translation files, it will simply appear with the string in the translation parameters.

<a id="Enumeration_translation"></a>

### Enumeration translation

Enumeration options need to have their values translated in the translation file. The translation tag in the translation file for all values needs to be`"Sandbox_<ModName>_<OptionName>_option<value>": "Enum name"`.

For example:



```text
{
    "Sandbox_<ModName>_<OptionName>_option1": "First value",
    "Sandbox_<ModName>_<OptionName>_option2": "Second value"
}
```



<a id="Sandbox_options_in_the_Lua"></a>

## Sandbox options in the Lua

You can access the value of a sandbox option in Lua by using the`SandboxVars` table. The table is structured as follows:



```text
local optionValue = SandboxVars.ModName.OptionName
print(optionValue) -- This will print the value of OptionName
```



Alternatively you can also access it by using:



```text
getSandboxOptions():getOptionByName("ModName.OptionName"):getValue()
```



You can also modify the value of a sandbox option in Lua by using the`setValue` function:



```text
local sandboxOptions = getSandboxOptions()
sandboxOptions:getOptionByName("ModName.OptionName"):setValue(newValue)

-- to have changes applies java side, use
sandboxOptions:toLua()

-- for server syncing, use
sandboxOptions:sendToServer()
```



`toLua` sends the option changes to the Java, and not the Lua.

<a id="External_links"></a>

## External links

- Sandbox Options guide by Albion

Retrieved from "[https://pzwiki.net/w/index.php?title=Sandbox_options&oldid=1442317](Sandbox_options.md)"
