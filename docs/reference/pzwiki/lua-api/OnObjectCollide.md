---
title: "OnObjectCollide"
source: "https://pzwiki.net/wiki/OnObjectCollide"
source_revision: "https://pzwiki.net/w/index.php?title=OnObjectCollide&oldid=1391605"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:31."
retrieved: "2026-09-15T11:42:45.803Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnObjectCollide

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnObjectCollide.md) (Create account)

<a id="Event"></a>

## Event

OnObjectCollide

<a id="Description"></a>

## Description

Fires when two objects collide with each other.

<a id="Parameters"></a>

## Parameters

- object: IsoMovingObject (JavaDoc) - The object that collided into the other object.
- collided: IsoObject (JavaDoc) - The object that was collided into.

<a id="Examples"></a>

## Examples



```text
local function OnObjectCollide(object, collided)
    -- your code here
end

Events.OnObjectCollide.Add(OnObjectCollide)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnObjectCollide&oldid=1391605](OnObjectCollide.md)"
