---
title: "EmmyLua"
source: "https://pzwiki.net/wiki/EmmyLua"
source_revision: "https://pzwiki.net/w/index.php?title=EmmyLua&oldid=1458125"
source_last_edited: "Last modified\n\t\t         This page was last edited on 18 August 2026, at 14:27."
retrieved: "2026-09-15T11:42:09.682Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 5
source_tables: 0
---

# EmmyLua

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.1).

Help by adding any missing content. [Edit](EmmyLua.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

EmmyLua

![Article illustration](../assets/4fbb495f3c047afeadc4.png)

Links

![Article illustration](../assets/940b03325f7011617faf.png)

GitHub repository

![Article illustration](../assets/ef8e2b80cc135d3a7b32.png)

Marketplace extension

![Article illustration](../assets/d9057a9f19548a000bdb.png)

Documentation

**EmmyLua** is a language server extension for any LSP-compatible editor, most notably [VSCode](Visual_Studio_Code.md), that provides advanced Lua language features such as code completion, diagnostics, and code navigation. It is commonly used by Project Zomboid modders in combination with [Umbrella](Umbrella_modding.md) to enhance the Lua scripting experience.

<a id="Installation"></a>

## Installation

The extension can be installed from the VSCode "Extensions" tab by searching for "EmmyLua" and selecting the one made by Tangzx, or by clicking the "Install" button on the extension's page on the marketplace

Make sure to not install [LuaLs](LuaLs.md) alongside EmmyLua as this will tend to make both clash with each others.

<a id="Typings"></a>

## Typings

Main article: Typing

This extension provides a typing system based on both the original EmmyLua, as well as LuaCATS annotations, to offer additional language features and type information for Lua code.

While it supports both, there may still be some incompatibilities due to improved strictness and changes in annotation syntax. As such, it is best to consult both LuaCATS and the extension's own documentation.

<a id="Namespace_annotation"></a>

### Namespace annotation

`---@namespace NamespaceName`

Defines a namespace for alias and classes defined after this annotation, allowing easier organization of typings. For example:



```text
---file1.lua

---@namespace MyNamespace

---@class MyClass
MyClass = {}
```





```text
---file2.lua

---@type MyNamespace.MyClass  -- Refers to the class defined in file1.lua
local var = value

---@namespace MyNamespace  -- Switches to the namespace defined in file1.lua for easier access

---@type MyClass  -- Refers to the class defined in file1.lua
local var2 = value
```



<a id="Configuration_file"></a>

## Configuration file

EmmyLua favors a configuration file named`.emmyrc.json` to customize its behavior instead of using the VSCode settings UI. The reason for that is to allow to users to share the same configuration across different IDEs. The configuration file should be placed in the root folder of your [workspace](Visual_Studio_Code.md#Workspace).

For example, the file should be placed here when working on your Project Zomboid mod (see the [Mod structure](Mod_structure.md) page for reference):



```text
📁 Zomboid
    📁 Workshop
        📁 MyMod <--- open as a workspace in VSCode
            📁 Contents
                📁 mods
                    📁 MyMod
                        📁 42
                            📁 media
                                📁 lua
                                    📁 client
                                    📁 server
                                    📁 shared
                        📁 common
            📄 .emmyrc.json
```



The file should have the following default content for your Project Zomboid modding workspace:



```text
{
    "$schema": "https://raw.githubusercontent.com/EmmyLuaLs/emmylua-analyzer-rust/refs/heads/main/crates/emmylua_code_analysis/resources/schema.json",
    "workspace": {
        "library": ["$PZ_UMBRELLA"],
        "workspaceRoots": [
            "Contents/mods/YourMod/42/media/lua"
        ]
    },
    "runtime": {
        "requirePattern": [
            "shared/?.lua",
            "client/?.lua",
            "server/?.lua"
        ],
        "version": "Lua5.1"
    },
    "diagnostics": {
        "disable": ["unnecessary-if"]
    }
}
```



Below are explanations for some of the important fields:

- The`$schema` field allows your IDE to provide autocompletion and validation for the configuration file itself.
- The`workspace` section contains settings related to your workspace:

- The`library` field should contain the path to Umbrella's library on your computer. Here it was assigned to the special variable`$PZ_UMBRELLA` for easier access across the computer and for easy access in the git repository for everyone without needing to modify the configuration file locally after cloning. See [Umbrella's installation instructions](Umbrella_modding.md#How_to_activate_Umbrella) for more information about this.
- The`workspaceRoots` field should contain the path to your mod's Lua source code folder relative to the workspace root.
- The`runtime` section contains settings related to the Lua runtime environment:

- The`requirePattern` field should contain the patterns used by Project Zomboid to resolve`require` calls in your Lua code. This allows EmmyLua to propose proper autocompletion for`require` statements.
- The`version` field should be set to`Lua5.1` since Project Zomboid uses Lua 5.1 as its Lua version.
- The`diagnostics` section contains settings related to code diagnostics:

- The`disable` field contains a list of diagnostics to disable. In this example, the`unnecessary-if` diagnostic is disabled to avoid warnings about unnecessary`if` statements in the code. This is needed for Project Zomboid specifically because Java returns on the Lua side nil without being specified explicitly in the Java as a potential return value.

See their documentation for a more in-depth explanation of each field.

Regarding the`unnecessary-if` diagnostic, here is an example of why it is needed to disable it for Project Zomboid modding:



```text
local player = getPlayer() -- in some cases, this returns nil, like when the player is dead

-- so you need to check for nil explicitly
if player then
    player:doSomething()
end
```



In this situation, typings defined by Umbrella automatically from the Java game code indicate that`getPlayer()` returns IsoPlayer, but in reality it can also return`nil`, so EmmyLua marks the`if` check as unnecessary because it will always be truthy.

After setting up your configuration file, you likely will need to reload the extension. To do so, you can click the "EmmyLua" button on the bottom bar of VSCode and select "Restart Server". Alternatively, you can simply quit and relaunch the application too.

<a id="See_also"></a>

## See also

- [LuaLs](LuaLs.md) - Lua Language Server by Sumneko, another popular Lua language server extension.
- [Umbrella (modding)](Umbrella_modding.md) - A collection of Lua type stubs for the Lua API used in Project Zomboid modding.
- Typing - Information about typings in Lua.

Retrieved from "[https://pzwiki.net/w/index.php?title=EmmyLua&oldid=1458125](EmmyLua.md)"
