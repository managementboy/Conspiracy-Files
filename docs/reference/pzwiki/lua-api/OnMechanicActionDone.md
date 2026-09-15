---
title: "OnMechanicActionDone"
source: "https://pzwiki.net/wiki/OnMechanicActionDone"
source_revision: "https://pzwiki.net/w/index.php?title=OnMechanicActionDone&oldid=1391585"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:41.960Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnMechanicActionDone

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.11.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnMechanicActionDone.md) (Create account)

<a id="Event"></a>

## Event

OnMechanicActionDone

<a id="Description"></a>

## Description

Fires after a character completes a mechanic action on a vehicle.

<a id="Parameters"></a>

## Parameters

- character: IsoGameCharacter (JavaDoc) - The character who performed the action.
- success: boolean - Whether the action succeeded.

<a id="Examples"></a>

## Examples



```text
local function OnMechanicActionDone(character, success)
    -- your code here
end

Events.OnMechanicActionDone.Add(OnMechanicActionDone)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnMechanicActionDone&oldid=1391585](OnMechanicActionDone.md)"
