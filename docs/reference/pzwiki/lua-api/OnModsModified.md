---
title: "OnModsModified"
source: "https://pzwiki.net/wiki/OnModsModified"
source_revision: "https://pzwiki.net/w/index.php?title=OnModsModified&oldid=1253299"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:58."
retrieved: "2026-09-15T11:42:42.293Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnModsModified

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnModsModified.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnModsModified

<a id="Description"></a>

## Description

Fires on the main menu when a mod's files have changed.

<a id="Parameters"></a>

## Parameters

No parameters.

<a id="Examples"></a>

## Examples



```text
local function OnModsModified()
    -- your code here
end

Events.OnModsModified.Add(OnModsModified)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnModsModified&oldid=1253299](OnModsModified.md)"
