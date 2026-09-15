---
title: "OnLoadRadioScripts"
source: "https://pzwiki.net/wiki/OnLoadRadioScripts"
source_revision: "https://pzwiki.net/w/index.php?title=OnLoadRadioScripts&oldid=1477267"
source_last_edited: "Last modified\n\t\t         This page was last edited on 1 September 2026, at 05:37."
retrieved: "2026-09-15T11:42:41.199Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnLoadRadioScripts

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](OnLoadRadioScripts.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Event"></a>

## Event

OnLoadRadioScripts

<a id="Description"></a>

## Description

Fires after ZomboidRadio loads the radio scripts.

<a id="Parameters"></a>

## Parameters

- scriptManager: RadioScriptManager (JavaDoc) - The radio script manager.
- newGame: boolean - True when a new save launches for the first time.

<a id="Examples"></a>

## Examples



```text
local function OnLoadRadioScripts(scriptManager, newGame)
    -- your code here
end

Events.OnLoadRadioScripts.Add(OnLoadRadioScripts)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnLoadRadioScripts&oldid=1477267](OnLoadRadioScripts.md)"
