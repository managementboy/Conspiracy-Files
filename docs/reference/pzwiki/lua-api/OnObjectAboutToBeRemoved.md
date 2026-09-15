---
title: "OnObjectAboutToBeRemoved"
source: "https://pzwiki.net/wiki/OnObjectAboutToBeRemoved"
source_revision: "https://pzwiki.net/w/index.php?title=OnObjectAboutToBeRemoved&oldid=1391601"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:45.039Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnObjectAboutToBeRemoved

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnObjectAboutToBeRemoved.md) (Create account)

<a id="Event"></a>

## Event

OnObjectAboutToBeRemoved

<a id="Description"></a>

## Description

Fires before a tile object is destroyed or picked up.

<a id="Parameters"></a>

## Parameters

- object: IsoObject (JavaDoc) - The object about to be removed.

<a id="Examples"></a>

## Examples



```text
local function OnObjectAboutToBeRemoved(object)
    -- your code here
end

Events.OnObjectAboutToBeRemoved.Add(OnObjectAboutToBeRemoved)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnObjectAboutToBeRemoved&oldid=1391601](OnObjectAboutToBeRemoved.md)"
