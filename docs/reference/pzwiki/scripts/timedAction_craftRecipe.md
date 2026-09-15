---
title: "timedAction (craftRecipe)"
source: "https://pzwiki.net/wiki/TimedAction_(craftRecipe)"
source_revision: "https://pzwiki.net/w/index.php?title=TimedAction_(craftRecipe)&oldid=1254667"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 01:20."
retrieved: "2026-09-15T11:42:31.899Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# timedAction (craftRecipe)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.8.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](timedAction_craftRecipe.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

![Article illustration](../assets/6485de712fa66e331d66.png)

This article is about the`timedAction` parameter used in crafting recipes. For the`timedAction` script block explanations, see [timedAction (scripts)](timedAction_scripts.md). For the Lua timed actions used in the game, see [Timed Action (Lua)](../lua-api/Timed_Action_Lua.md).

The **`timedAction`** parameter is used to define the action animation played during the crafting process, and is defined by a [timedAction script](timedAction_scripts.md). To use a timed action in a [craftRecipe](craftRecipe.md), use the following format:



```text
timedAction = <action name>,
```



For a full list of actions, see [timedAction (scripts)](timedAction_scripts.md).

<a id="Example"></a>

## Example



```text
timedAction = Making,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=TimedAction_(craftRecipe)&oldid=1254667](timedAction_craftRecipe.md)"
