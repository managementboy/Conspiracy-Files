---
title: "ISBaseObject"
source: "https://pzwiki.net/wiki/ISBaseObject"
source_revision: "https://pzwiki.net/w/index.php?title=ISBaseObject&oldid=1364029"
source_last_edited: "Last modified\n\t\t         This page was last edited on 9 May 2026, at 22:59."
retrieved: "2026-09-15T11:39:40.939Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 5
source_tables: 1
---

# ISBaseObject

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.11.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](ISBaseObject.md) (Create account)

**ISBaseObject** is the main class that serves as a base for most Lua objects in the game. It is used by the developers to create new objects using the [Lua API](Lua_API.md).

<a id="Object_inheritance"></a>

## Object inheritance

Main article: [Derive](Derive.md)

Creating a custom Lua object involve the`derive` method which creates a new object which inherits from the base class it is called from. This can not only be used on the`ISBaseObject` class but also on any other class that inherits from it so you can derive an object which already derived from`ISBaseObject`. This is used a lot in [Timed Action (Lua)](Timed_Action_Lua.md) and UI elements.

**Source:**`ProjectZomboid\media\lua\shared\ISBaseObject.lua`

**Retrieved**: Build 42.5.1



```text
function ISBaseObject:derive (type)
    local o = {}
    setmetatable(o, self)
    self.__index = self
	o.Type= type;
    return o
end
```



Here is an example of deriving a new object from`ISBaseObject`:



```text
-- Example of deriving a new object from ISBaseObject
local MyCustomObject = ISBaseObject:derive("MyCustomObject")

function MyCustomObject:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function MyCustomObject:someMethod()
    -- Custom method implementation
end
```



<a id="Event_handler"></a>

## Event handler

The`ISBaseObject` class also provides an event handler system which can be used to add and remove event listeners to the object. This system was added in Build 42.

| Method | Description | Source |
| --- | --- | --- |
|`ISBaseObject:addEventListener(_event, _callback, _target)` | Adds an event listener to the object.`_event` is the event name,`_callback` is the function to call when the event is triggered, and`_target` is a parameter which will be passed to the callback function. If`_target` is not provided, it will be set to`false`. | **Source:**`ProjectZomboid\media\lua\shared\ISBaseObject.lua` **Retrieved**: Build 42.5.1`function ISBaseObject:addEventListener(_event, _callback, _target) if not self.__eventListeners then self.__eventListeners = {}; end if not self.__eventListeners[_event] then self.__eventListeners[_event] = {}; end self.__eventListeners[_event][_callback] = _target or false; end` |
|`ISBaseObject:removeEventListener(_event, _callback)` | Removes an event listener from the object.`_event` is the event name and`_callback` is the function to remove from the event listeners. | **Source:**`ProjectZomboid\media\lua\shared\ISBaseObject.lua` **Retrieved**: Build 42.5.1`function ISBaseObject:removeEventListener(_event, _callback) if not self.__eventListeners then return; end if not self.__eventListeners[_event] then return; end self.__eventListeners[_event][_callback] = nil; end` |
|`ISBaseObject:triggerEvent(_event, ...)` | Triggers an event on the object.`_event` is the event name and`...` are the parameters to pass to the event listeners. Any number of parameters can be passed but is better to stay consistent for an event as functions are written to handle specific argument orders. | **Source:**`ProjectZomboid\media\lua\shared\ISBaseObject.lua` **Retrieved**: Build 42.5.1`function ISBaseObject:triggerEvent(_event, ...) if self.__eventListeners and self.__eventListeners[_event] then local p = {...}; if p[13]~=nil then print("ISBaseObject.triggerEvent -> param overload"); end for callback,target in pairs(self.__eventListeners[_event]) do if target then callback(target, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]); else callback(p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12]); end end end end` |

Retrieved from "[https://pzwiki.net/w/index.php?title=ISBaseObject&oldid=1364029](ISBaseObject.md)"
