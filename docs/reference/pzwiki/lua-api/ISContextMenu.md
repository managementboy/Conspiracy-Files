---
title: "ISContextMenu"
source: "https://pzwiki.net/wiki/ISContextMenu"
source_revision: "https://pzwiki.net/w/index.php?title=ISContextMenu&oldid=1389503"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 02:38."
retrieved: "2026-09-15T11:43:02.103Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 24
source_tables: 2
---

# ISContextMenu

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](ISContextMenu.md) (Create account)

**ISContextMenu** is a subclass of ISPanel used to instanciate a context menu UI allowing players to chose available options for one or more objects, usually used when right clicking in the game. This article will detail how to use this object in the [Lua (API)](Lua_API.md) to add your own options to existing context menu objects, modify and customize them and more.

<a id="Creating_a_context_menu"></a>

## Creating a context menu

Creating a context menu can be done the same way as creating UI elements or lua object instances. Here is an example of how to create a context menu:



```text
-- create a new instance
local contextMenu = ISContextMenu:new(x, y, width, height)
contextMenu:setVisible(true)
contextMenu:addToUIManager()
```



<a id="Accessing_context_menu"></a>

## Accessing context menu

Different vanilla context menus are created in the game which can be accessed with various methods. The most common one involves using events which trigger when a context menu appears:

- OnClickedAnimalForContext: Triggered when right clicking on an animal.
- [OnFillInventoryObjectContextMenu](OnFillInventoryObjectContextMenu.md): Triggered when right clicking on an inventory item.
- OnFillWorldObjectContextMenu: Triggered when right clicking in the world.
- OnPreFillInventoryObjectContextMenu: Triggered when right clicking on an inventory item, before it is filled with the context menu options.
- [OnPreFillWorldObjectContextMenu](OnPreFillWorldObjectContextMenu.md): Triggered when right clicking in the world object, before it is filled with the context menu options.
- onFillSearchIconContextMenu: Triggered when right clicking on a foraging icon.

<a id="OnFillInventoryObjectContextMenu"></a>

### OnFillInventoryObjectContextMenu

Main article: [OnFillInventoryObjectContextMenu](OnFillInventoryObjectContextMenu.md)

This event is triggered when right clicking on an inventory item. Here is an example of how you can use the event and how you can iterate through every items selected:



```text
local function OnFillInventoryObjectContextMenu(playerNum, context, items)
    -- loop through every item stack
	for i = 1,#items do
		-- retrieve the item
		local item = items[i]
		if not instanceof(item, "InventoryItem") then
            item = item.items[1]
        end

        -- run code here for specific item
    end
end

Events.OnFillInventoryObjectContextMenu.Add(OnFillInventoryObjectContextMenu)
```



This method to retrieve items is necessary due to the`item` object being retrieved having a different format based on if the dropdown menu which shows details on the stack of items is open or not.

<a id="OnFillWorldObjectContextMenu"></a>

### OnFillWorldObjectContextMenu

Main article: OnFillWorldObjectContextMenu

This event is triggered when right clicking in the world. Here is an example of how you can use the event and how you can iterate through every objects under the cursor when right clicking:



```text
local function OnFillWorldObjectContextMenu(playerNum, context, worldObjects, test)
    for i = 2,#worldObjects do
        local object = worldObjects[i]
        -- run code here for specific object
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)
```



This first object always has a duplicate in the table, which is why the loop starts at 2.

<a id="Alternative_method"></a>

### Alternative method

Alternatively, you can access the player context menu with the following method:



```text
ISContextMenu.get(player, x, y)
```



<a id="Options"></a>

## Options

<a id="Adding_options"></a>

### Adding options

Different methods can be used to add options to a context menu. The most common one is to use the`addOption` method. Here is an example of how to add an option to a context menu: **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua`

**Retrieved**: Build 42.3.1



```text
function ISContextMenu:addOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
```



Leaving the`onSelect` parameter empty will make the option unclickable. This parameter is meant to be a function with the following structure:



```text
function yourFunction(target, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
    -- code here
end
```



Parameters that are unused can be removed from the function. Here is an example of how to add an option to a context menu:



```text
-- supposing context is a context menu instance
local option = context:addOption("My option") -- unclickable

-- adding a clickable option with a function without parameters
local function yourFunction()
    print("Hello world!")
end
local option2 = context:addOption("Clickable option", nil, yourFunction, "param1", "param2")

-- adding a clickable option with a function with parameters
local function yourFunction2(player, message, time)
    print("Player: " .. player)
    print("Message: " .. message)
    print("Time: " .. time)
end

local option3 = context:addOption("Another clickable option", "It's me!", yourFunction2, "Hello world!", "01:01")
```



There exists other methods to add options to a context menu in the same way which are resumed in the following table:

| Method name | Description | Source |
| --- | --- | --- |
|`addOption` | The option will be added at the bottom in the context menu. | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:addOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)` |
|`addOptionOnTop` | The option will be added at the top in the context menu. | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:addOptionOnTop(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)` |
|`insertOptionAfter` | The option will be added after a specific option in the context menu. Identification of the option is done by its name (see [#Accessing options](ISContextMenu.md#Accessing_options)). | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:insertOptionAfter(prevOptionName, name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)` |
|`insertOptionBefore` | The option will be added before a specific option in the context menu. Identification of the option is done by its name (see [#Accessing options](ISContextMenu.md#Accessing_options)). | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:insertOptionBefore(nextOptionName, name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)` |
|`addActionsOption` | An option which adds a timed action to the queue of timed actions. | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:addActionsOption(text, getActionsFunction, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) local character = getSpecificPlayer(self.player) return self:addOption(text, character, ISTimedActionQueue.queueActions, getActionsFunction, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) end` |
|`addGetUpOption` | An option which adds a timed action to the queue a function to be ran after the player got up. | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:addGetUpOption(text, target, onSelect, p2, p3, p4, p5, p6, p7, p8, p9, p10, ...)` |
|`addDefaultOptions` | An option which adds default options to the context menu, useful for [submenus](ISContextMenu.md#Creating_a_submenu). | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:addDefaultOptions() -- Default options could be added when addSubMenu() is called, however some code -- will remove a submenu option if the submenu is empty.  It won't be empty if -- default options were added.` |

<a id="Accessing_options"></a>

### Accessing options

Options can be accessed in a context menu by using the`getOptionFromName` method. To do that, you have to know the name which was given to the option when it was added. Here is an example of how to access an option in a context menu: **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua`

**Retrieved**: Build 42.3.1



```text
function ISContextMenu:getOptionFromName(name)
```





```text
-- example option
local option = context:addOption("My option")

-- access the option
local option = context:getOptionFromName("My option")
```



Note:  Options having special formating such as [translations](../translations/Translation.md) or numbers might require extra operations to access its name.

<a id="Removing_options"></a>

### Removing options

Different ways exist to remove an option from a context menu:

| Method name | Description | Source |
| --- | --- | --- |
|`removeOptionByName` | Remove the option by its name. | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:removeOptionByName(optName)` |
|`removeLastOption` | Remove the last option in the context menu. | **Source:**`ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua` **Retrieved**: Build 42.3.1`function ISContextMenu:removeLastOption()` |

<a id="Creating_a_submenu"></a>

### Creating a submenu

Submenus can be created by creating an option which will then be marked as a sub context menu. Here is an example of how to create a submenu:



```text
-- create a new option
local option = context:addOption("My submenu")

-- create a sub context menu within the context menu
local subMenu = context:getNew(context)

-- link the submenu to the option
context:addSubMenu(option, subMenu)
```



This option will now be marked as a submenu and a sub context menu will appear when hovering with your cursor over it. You can add options to this menu the same way as you would with a regular context menu:



```text
-- add an option to the submenu
subMenu:addOption("My option")

-- you can also add more options if needed
subMenu:addOption("Another option")
```



<a id="Accessing_submenu_options"></a>

#### Accessing submenu options

You can iterate through the options of a submenu with the following method:



```text
local grabOption = context:getOptionFromName(getText("ContextMenu_Grab"))
local subMenuOption = context:getSubMenu(grabOption.subOption)

for j = 1, #subMenuOption.options do
...
```



<a id="Tooltip"></a>

### Tooltip

Main article: [ISToolTip](ISToolTip.md)

A descriptive tooltip can be added to an option, which will be an [ISToolTip](ISToolTip.md). Here is an example of how to add a tooltip to an option:



```text
-- create a new option
local option = context:addOption("My option")

-- add a tooltip to the option
local tooltipObject = ISWorldObjectContextMenu.addToolTip()
tooltipObject.description = getText("Tooltip description bla bla bla")
option.toolTip = tooltipObject
```



<a id="Customizing_options"></a>

### Customizing options

You can make an option disabled, thus not clickable by doing:



```text
-- create a new option
local option = context:addOption("My option")

-- disable the option
option.notAvailable = true
```



You can add an icon texture to an option which will show up on the left side of the option by doing:



```text
-- create a new option
local option = context:addOption("My option")

-- add an icon to the option
option.iconTexture = getTexture("media/ui/myIconTexture.png")
```



Retrieved from "[https://pzwiki.net/w/index.php?title=ISContextMenu&oldid=1389503](ISContextMenu.md)"
