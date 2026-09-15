---
title: "OnCGlobalObjectSystemInit"
source: "https://pzwiki.net/wiki/OnCGlobalObjectSystemInit"
source_revision: "https://pzwiki.net/w/index.php?title=OnCGlobalObjectSystemInit&oldid=1253099"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:53."
retrieved: "2026-09-15T11:42:22.061Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnCGlobalObjectSystemInit

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnCGlobalObjectSystemInit.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnCGlobalObjectSystemInit

<a id="Description"></a>

## Description

Fires when the client GlobalObject system is being initialised.

<a id="Parameters"></a>

## Parameters

No parameters.

<a id="Examples"></a>

## Examples



```text
local function OnCGlobalObjectSystemInit()
    -- your code here
end

Events.OnCGlobalObjectSystemInit.Add(OnCGlobalObjectSystemInit)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnCGlobalObjectSystemInit&oldid=1253099](OnCGlobalObjectSystemInit.md)"
