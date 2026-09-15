---
title: "Mod data"
source: "https://pzwiki.net/wiki/Mod_data"
source_revision: "https://pzwiki.net/w/index.php?title=Mod_data&oldid=1317225"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 February 2026, at 19:15."
retrieved: "2026-09-15T11:45:18.818Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# Mod data

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Mod_data.md) (Create account)

**Mod data** tables are used to persistently store Lua data. Mod data tables are regular Lua tables; they do not have any special semantics or functionality. Only plain old data (strings, booleans, numbers, and tables) can be stored persistently.

In other games, to have persistent data it is often required that you manually save your data when the save gets closed, but in Project Zomboid, you **should not do that** because the game handles the saving of the mod data. You should simply use the mod data as a [table](Lua_language.md#Tables) that will persist between sessions. If data you are using doesn't need to be persistent, you can simply use a [module](Lua_language.md#Modules).

Accessing mod data during the event OnSave will not access the save mod data but the next session mod data. This means if you store anything during the OnSave event, these data will possibly be there in the next session, as long as you don't close the game.

<a id="Object_Mod_Data"></a>

## Object Mod Data

Any IsoObject has mod data, typically referred to as object mod data for disambiguation. Object mod data belongs to an instance of an object, such as a specific player or tile. Object mod data can be retrieved using`object:getModData()`.



```text
local player = getPlayer()
local modData = player:getModData()
modData.myString = "Hello World"
modData.myNumber = 42
modData.myTable = {1, 2, 3}
modData.myBoolean = true
```



<a id="Global_Mod_Data"></a>

## Global Mod Data

Global mod data is similar to object mod data, but does not belong to a specific object. Instead, global mod data tables are accessed with a unique string key through the ModData class.



```text
local modData = ModData.getOrCreate("MyModDataID")
modData.myString = "Hello World"
modData.myNumber = 42
modData.myTable = {1, 2, 3}
modData.myBoolean = true
```



To improve [performance](../foundations/Mod_optimization.md), mod data can be cached, as the reference will not change throughout the course of a session:



```text
local modData

-- cache the current save mod data when the save launches
Events.OnInitGlobalModData.Add(function()
    modData = ModData.getOrCreate("MyModDataID")
end)

-- example usage
Events.OnWeaponHitCharacter.Add(function(attacker, target, weapon, damage)
    modData.lastUsedWeapon = weapon:getFullType() -- persistently store the last used weapon
end)
```



In online multiplayer, GlobalModData is not saved on clients (client-only save), so it will not persist on reconnect!

<a id="Networking"></a>

## Networking

Global and object mod data is **not** automatically synchronized between server and clients in multiplayer games. This is actually a good thing, as it allows for more control over what data is sent over the network by allowing for network optimization, as well as client-side persistent data. This can however be a source of potential cheating if important data is only stored in client-side global mod data, and thus you need [networking](Networking.md) solutions.

The [networking](Networking.md) page covers part of the solutions available, but there exists an native solution for mod data, which however has some limitations. ModData has a function`transmit`, which can be used to send the entire mod data table for a specific`"MyModDataID"` from the client to the server, or vice versa. However, you have to manually intercept the transmited data with the use of [OnReceiveGlobalModData](OnReceiveGlobalModData.md). This networking solution is limited to small amounts of data, as the entire table is serialized and sent over the network at once, which was shown to be problematic and costly. Instead, use other [networking](Networking.md) solutions for larger amounts of data.

<a id="External_links"></a>

## External links

- Global mod data guide - notably explains more in details the available functions and the networking aspects.

Retrieved from "[https://pzwiki.net/w/index.php?title=Mod_data&oldid=1317225](Mod_data.md)"
