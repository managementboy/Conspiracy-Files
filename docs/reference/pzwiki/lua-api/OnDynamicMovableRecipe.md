---
title: "OnDynamicMovableRecipe"
source: "https://pzwiki.net/wiki/OnDynamicMovableRecipe"
source_revision: "https://pzwiki.net/w/index.php?title=OnDynamicMovableRecipe&oldid=1391517"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:29."
retrieved: "2026-09-15T11:42:28.024Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnDynamicMovableRecipe

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnDynamicMovableRecipe.md) (Create account)

<a id="Event"></a>

## Event

(Client) OnDynamicMovableRecipe

<a id="Description"></a>

## Description

Fires when a local character crafts a dynamically generated Movable scrapping recipe.

<a id="Parameters"></a>

## Parameters

- sprite: string - Sprite of the movable.
- recipe: MovableRecipe (JavaDoc) - The movable recipe that was crafted.
- item: Moveable (JavaDoc) - The movable item being scrapped.
- character: IsoGameCharacter (JavaDoc) - The character crafting the recipe.

<a id="Examples"></a>

## Examples



```text
local function OnDynamicMovableRecipe(sprite, recipe, item, character)
    -- your code here
end

Events.OnDynamicMovableRecipe.Add(OnDynamicMovableRecipe)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnDynamicMovableRecipe&oldid=1391517](OnDynamicMovableRecipe.md)"
