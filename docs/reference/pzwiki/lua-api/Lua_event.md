---
title: "Lua event"
source: "https://pzwiki.net/wiki/Lua_event"
source_revision: "https://pzwiki.net/w/index.php?title=Lua_event&oldid=1477313"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 07:23."
retrieved: "2026-09-15T11:39:38.915Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# Lua event

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](Lua_event.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

A **Lua event** in programming is a signal or notification that something has occurred or changed. In Project Zomboid, most often a modder's custom functions are attached as observers to an event, so they'll run when the event is called.

A full list of the Lua events can be found in:

- Lua events category
- [LuaDocs](LuaDocs.md)

<a id="Hooking_to_an_event"></a>

## Hooking to an event

To hook a function to an event, you use the`Events` object. For example, to hook a function to the`OnCreatePlayer` event, you would write:



```text
Events.OnCreatePlayer.Add(yourFunction)
```



`yourFunction` is a reference to your Lua function. By using this same reference, you can also remove the function from the event:



```text
Events.OnCreatePlayer.Remove(yourFunction)
```



Your function needs to have parameters that match the event's output. For example, the`OnCreatePlayer` event has the parameter`player`. Your function would need to be:



```text
local function yourFunction(player)
    -- your code here
end
```



Each events listed in Lua events category have example code snippets to show how to hook a function to them and their various parameters.

<a id="List_of_events_triggered_on_game_start"></a>

## List of events triggered on game start

The list below is a list of events that are triggered when loading into game, in the order in which they are triggered.

**Launch Game**

- [OnLoadSoundBanks](OnLoadSoundBanks.md)
- [OnGameBoot](OnGameBoot.md)

**Start new game/load game/connect to server**

- [OnPreMapLoad](OnPreMapLoad.md)
- [OnPreDistributionMerge](OnPreDistributionMerge.md)
- [OnDistributionMerge](OnDistributionMerge.md)
- [OnPostDistributionMerge](OnPostDistributionMerge.md)
- [OnInitWorld](OnInitWorld.md)
- Sandbox Options loaded here
- [OnLoadedTileDefinitions](OnLoadedTileDefinitions.md)
- [OnLoadRadioScripts](OnLoadRadioScripts.md)
- [OnInitGlobalModData](OnInitGlobalModData.md)
- [OnLoadMapZones](OnLoadMapZones.md)
- [OnLoadedMapZones](OnLoadedMapZones.md)
- [OnNewGame](OnNewGame.md) - Client only
- [OnGameTimeLoaded](OnGameTimeLoaded.md)
- OnSGlobalObjectSystemInit - Basically right before the Click to Start screen
- OnServerStarted - Server only

**Click to Start screen here** - running heavy functions on the following events is the cause for freezing after clicking to start.

- [OnCreatePlayer](OnCreatePlayer.md) - Client only
- [OnGameStart](OnGameStart.md) - Client only
- [OnLoad](OnLoad.md) - Client only

<a id="Custom_events_libraries"></a>

## Custom events libraries

Below are different libraries that add custom events to the game for modders to hook functions to in the same way as vanilla events.

- Events Plus API by Dismellion
- Starlit Library by Albion
- Doggy's Library by Sir Doggy Jvla

<a id="See_also"></a>

## See also

- [Lua (API)](Lua_API.md)
- [Lua object](Lua_object.md)
- Lua events – The [LuaDocs](LuaDocs.md) event list.

Retrieved from "[https://pzwiki.net/w/index.php?title=Lua_event&oldid=1477313](Lua_event.md)"
