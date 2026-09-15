---
title: "LuaLs"
source: "https://pzwiki.net/wiki/LuaLs"
source_revision: "https://pzwiki.net/w/index.php?title=LuaLs&oldid=1390447"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:02."
retrieved: "2026-09-15T11:42:10.079Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# LuaLs

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.12.3).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](LuaLs.md) (Create account)

LuaLs

![Article illustration](../assets/18c5994d735138712611.png)

Links

![Article illustration](../assets/940b03325f7011617faf.png)

GitHub repository

![Article illustration](../assets/a775601e7a3c121973d2.png)

Marketplace extension

![Article illustration](../assets/d9057a9f19548a000bdb.png)

Documentation

**LuaLs**, of the full name Lua Language Server, is a language server extension for [VSCode](Visual_Studio_Code.md) that provides advanced Lua language features such as code completion, diagnostics, and code navigation. It was commonly used by Project Zomboid modders in combination with [Umbrella](Umbrella_modding.md) to enhance the Lua scripting experience but it is suggested to use [EmmyLua](EmmyLua.md) instead which is the primary extension Umbrella supports now.

<a id="Installation"></a>

## Installation

The extension can easily be installed from the VSCode extension tab by searching for "Lua" and selecting the one by sumneko.

<a id="Typings"></a>

## Typings

Main article: Typing

The extension provides a typing system based on LuaCATS annotations to offer type information for Lua code. You can find a list of every available notations on their documentation.

<a id="Addons"></a>

## Addons

Addons are a system implemented by the extension to allow users to easily add new content to the extension via pre-packaged Lua definitions.

To access addons, open the command palette with CTRL+⇧ Shift+P and search for "Lua: Open Addon Manager ...". This will open a new tab where you can search for addons, install them, enable or disable them for the current [workspace](Visual_Studio_Code.md#Workspace).

Addons require you to have git installed on your system to work properly.

<a id="Umbrella"></a>

### Umbrella

Main article: [Umbrella (modding)](Umbrella_modding.md)

Umbrella is the most popular addon for LuaLs in the Project Zomboid modding community. It provides type definitions and annotations for the Project Zomboid [Lua API](../lua-api/Lua_API.md), enabling features like code completion and error checking specific to Project Zomboid modding.

<a id="MediaWiki_Scribunto"></a>

### MediaWiki Scribunto

The MediaWiki Scribunto addon provides Lua definitions for the Scribunto extension available on the wiki. It provides type definitions and annotations, autocomplete and error checking for wikitext Lua modules.

<a id="See_also"></a>

## See also

- [EmmyLua](EmmyLua.md) - Another popular Lua language server extension with additional features.
- [Umbrella (modding)](Umbrella_modding.md) - A collection of Lua type stubs for the Lua API used in Project Zomboid modding.
- Typing - Information about typings in Lua.

Retrieved from "[https://pzwiki.net/w/index.php?title=LuaLs&oldid=1390447](LuaLs.md)"
