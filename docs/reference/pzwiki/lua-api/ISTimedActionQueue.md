---
title: "ISTimedActionQueue"
source: "https://pzwiki.net/wiki/ISTimedActionQueue"
source_revision: "https://pzwiki.net/w/index.php?title=ISTimedActionQueue&oldid=1389507"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 02:38."
retrieved: "2026-09-15T11:43:02.829Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 14
source_tables: 0
---

# ISTimedActionQueue

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](ISTimedActionQueue.md) (Create account)

**ISTimedActionQueue** is a class that manages the queue of timed actions. It is used by the game to handle timed actions created by the developers or modders using the [Lua API](Lua_API.md).

<a id="Retrieving_queue"></a>

## Retrieving queue

To retrieve the queue of timed actions, use the following function:



```text
local queue = ISTimedActionQueue.getTimedActionQueue(character)
```



Or create a new one for a character:



```text
local queue = ISTimedActionQueue.new(character)
```



This should however not be needed as all of this is handled by the game when adding new timed actions to the queue.

<a id="Adding_timed_actions_to_the_queue"></a>

## Adding timed actions to the queue

To add a timed action to the queue, use the following function:



```text
ISTimedActionQueue.add(action)
```



An`action` needs to be an instance of [Timed Action (Lua)](Timed_Action_Lua.md) or [derived](ISBaseObject.md#Object_inheritance) objects. Alternatively, you can add your timed action after another existing action if you have access to that action:



```text
ISTimedActionQueue.addAfter(actionToAddAfter, action)
```



You can make the character get up before doing the action with the following function:



```text
ISTimedActionQueue.addGetUpAndThen(action)
```



<a id="Actions_on_the_queue"></a>

## Actions on the queue

<a id="Player_doing_an_action"></a>

### Player doing an action

You can check if an IsoPlayer is doing an action with the following function:



```text
-- supposing player is an IsoPlayer instance
local doingAction = ISTimedActionQueue.isPlayerDoingAction(player)
```



You can check for an IsoPlayer doing a specific type of action with the following code and by knowing the [Timed Action (Lua)](Timed_Action_Lua.md) [derived](ISBaseObject.md) action name.



```text
-- supposing player is an IsoPlayer instance
local queue = ISTimedActionQueue.getTimedActionQueue(player)
if queue:indexOfType(actionName) == 1 then
    ... -- player doing action
end
```



For example you can check for the player eating:



```text
-- supposing player is an IsoPlayer instance
local queue = ISTimedActionQueue.getTimedActionQueue(player)
if queue:indexOfType("ISEatFoodAction") == 1 then
    ... -- player is eating
end
```



<a id="Accessing_actions"></a>

### Accessing actions

You can access the actions in the queue with the following methods:

- Get the action from its index



```text
local queue = ISTimedActionQueue.getTimedActionQueue(character)
local action = queue.queue[index]
```



- Get the action from its type (its class name from the derive method)



```text
local queue = ISTimedActionQueue.getTimedActionQueue(character)
local actionIndex = queue:indexOfType(actionType)
local action = queue.queue[actionIndex]
```



<a id="Removing_actions"></a>

### Removing actions

Removing an action can be done with different methods:

- Remove an action from its instance.



```text
local queue = ISTimedActionQueue.getTimedActionQueue(character)
queue:removeFromQueue(action)
```



- Remove an action from its known index in the queue.



```text
local queue = ISTimedActionQueue.getTimedActionQueue(character)

-- remove an action from its index
table.remove(queue.queue, actionIndex)

-- remove the last action in the queue
table.remove(queue.queue, #queue.queue)
```



- Remove all actions from the queue.



```text
ISTimedActionQueue.clear(character)
```



<a id="Stop_an_action_from_being_canceled"></a>

### Stop an action from being canceled

Source marks this entry as incomplete.

You can hook to the following to stop an action getting canceled:



```text
local YourTimedAction = require(".../YourTimedAction")

local original_isPlayerDoingActionThatCanBeCancelled = isPlayerDoingActionThatCanBeCancelled

---Patch to make the urgent dismount action un-cancellable.
---
---Patch the function to take into account dynamic cancel flags on mount/dismount actions notably.
function isPlayerDoingActionThatCanBeCancelled(player)
    local queue = ISTimedActionQueue.getTimedActionQueue(player)
    local currentAction = queue.current
    if currentAction then
        local Type = currentAction.Type
        if Type == YourTimedAction.Type then
            return false
        end
    end
    return original_isPlayerDoingActionThatCanBeCancelled(player)
end
```



Retrieved from "[https://pzwiki.net/w/index.php?title=ISTimedActionQueue&oldid=1389507](ISTimedActionQueue.md)"
