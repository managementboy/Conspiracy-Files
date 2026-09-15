---
title: "AnimSet"
source: "https://pzwiki.net/wiki/AnimSet"
source_revision: "https://pzwiki.net/w/index.php?title=AnimSet&oldid=1385241"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 00:52."
retrieved: "2026-09-15T11:42:44.928Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# AnimSet

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.10.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](AnimSet.md) (Create account)

Main article: [Animation](Animation.md)

**AnimSets** are collections of [AnimStates](AnimState.md), usually associated to a specific character or creature, such as the player, zombies or animals. AnimSets are associated to an [ActionGroup](ActionGroup.md), which defines transitions for [AnimStates](AnimState.md) in the form of [ActionStates](ActionState.md).

While custom AnimSets can be created, they require their custom [ActionGroup](ActionGroup.md) counterpart to work, which is not currently supported.

<a id="Available_AnimSets"></a>

## Available AnimSets

-`animal-editor`
-`buck`
-`chick`
-`cockerel`
-`cow`
-`cowcalf`
-`doe`
-`ewe`
-`fawn`
-`hen`
-`lamb`
-`mannequin`
-`mouse`
-`pig`
-`piglet`
-`player`
-`player-avatar`
-`player-editor`
-`player-vehicle`
-`rabbit`
-`rabkitten`
-`raccoon`
-`ram`
-`rat`
-`turkey`
-`turkeypoult`
-`zombie`
-`zombie-crawler`

<a id="See_also"></a>

## See also

- [Creating custom animations](Creating_custom_animations.md) - a step by step guide on how to create animations.
- [AnimState](AnimState.md) - a specific state an entity can be in, such as walking, running, or idle.
- [AnimNode](AnimNode.md) - defines the animations that can be played in an AnimState and its properties and conditions.
- [ActionGroup](ActionGroup.md) - defines transitions for [AnimStates](AnimState.md) in the form of [ActionStates](ActionState.md).
- [ActionState](ActionState.md) - defines a specific transition between two [AnimStates](AnimState.md) or special properties of an [AnimState](AnimState.md).

Retrieved from "[https://pzwiki.net/w/index.php?title=AnimSet&oldid=1385241](AnimSet.md)"
