---
title: "OnAIStateChange"
source: "https://pzwiki.net/wiki/OnAIStateChange"
source_revision: "https://pzwiki.net/w/index.php?title=OnAIStateChange&oldid=1391449"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:27."
retrieved: "2026-09-15T11:42:21.382Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnAIStateChange

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnAIStateChange.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnAIStateChange

<a id="Description"></a>

## Description

Fires when a local zombie or any loaded player changes state.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character whose state changed.
- currentState: State (JavaDoc) - The state the character changed to.
- previousState: State (JavaDoc) - The character's previous state.

<a id="Examples"></a>

## Examples



```text
local function OnAIStateChange(character, currentState, previousState)
    -- your code here
end

Events.OnAIStateChange.Add(OnAIStateChange)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnAIStateChange&oldid=1391449](OnAIStateChange.md)"
