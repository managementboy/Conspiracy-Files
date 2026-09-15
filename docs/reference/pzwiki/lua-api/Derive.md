---
title: "Derive"
source: "https://pzwiki.net/wiki/Derive"
source_revision: "https://pzwiki.net/w/index.php?title=Derive&oldid=1387725"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 01:54."
retrieved: "2026-09-15T11:39:41.313Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# Derive

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Derive.md) (Create account)

The process of **deriving** is used in the [Lua API](Lua_API.md) to create a new object based on an existing one. This is done using the`derive` method from [ISBaseObject](ISBaseObject.md#Object_inheritance), which creates a completely new object with the same properties as the original object which it's derived from. This can not only be used on the`ISBaseObject` class but also on any other class that inherits from it so you can derive an object which already derived from`ISBaseObject`. This effectively allows you to create classes and sub-classes in Lua.

The parameter of the derive function, the`Type`, is used to register the "class name" of the new object. This variable is stored in the`Type` member of the new class.

<a id="Example"></a>

## Example



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



Modding guides

Retrieved from "[https://pzwiki.net/w/index.php?title=Derive&oldid=1387725](Derive.md)"
