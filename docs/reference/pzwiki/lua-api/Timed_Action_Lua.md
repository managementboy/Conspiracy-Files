---
title: "Timed Action (Lua)"
source: "https://pzwiki.net/wiki/Timed_Action_(Lua)"
source_revision: "https://pzwiki.net/w/index.php?title=Timed_Action_(Lua)&oldid=1458197"
source_last_edited: "Last modified\n\t\t         This page was last edited on 18 August 2026, at 16:17."
retrieved: "2026-09-15T11:39:42.099Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# Timed Action (Lua)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Timed_Action_Lua.md) (Create account)

Timed actions in the [Lua API](Lua_API.md) are used to create actions that the player can perform, defining different stages of the action such as the start, the end and during the action. It's a fairly flexible system, albeit with lots of redundancy when defining a timed action. Timed actions use`ISBaseTimedAction` as a base, which is a subclass of [ISBaseObject](ISBaseObject.md). Those timed actions once instanced with a`new` function can be added to the queue of actions [ISTimedActionQueue](ISTimedActionQueue.md) to be fully handled by the game one after the other. When a timed action is instanced, it also creates a LuaTimedActionNew java object which is used by the game java side to handle the timed action. The timed action`update` method is notably called from the java every ticks.

For a full list of default functions in the`ISBaseTimedAction` class and different [derived](Derive.md) timed actions, see the LuaDocs.

<a id="Multiplayer"></a>

## Multiplayer

Since Build 42.13.0, timed actions need to be stored globally to work in multiplayer, however this tends to cause issues with pollution of the global namespace and can cause conflicts between mods. To avoid this, you can do the following:



```text
-- here the Type will have a prefix of "MyMod_" to reduce conflict
local MyCustomTimedAction = ISBaseTimedAction:derive("MyMod_MyCustomTimedAction")

--- define the various elements of the timed action
...

--- define your new function
function MyCustomTimedAction:new(...)
    ...
end

--- this will store your timed action in the global namespace but with a prefix to reduce conflict
_G[MyCustomTimedAction.Type] = MyCustomTimedAction

--- this will allow you to import your timed action via `require`
return MyCustomTimedAction
```



For more details, see the TIS Modding Guides.

Retrieved from "[https://pzwiki.net/w/index.php?title=Timed_Action_(Lua)&oldid=1458197](Timed_Action_Lua.md)"
