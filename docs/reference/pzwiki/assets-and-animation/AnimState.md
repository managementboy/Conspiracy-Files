---
title: "AnimState"
source: "https://pzwiki.net/wiki/AnimState"
source_revision: "https://pzwiki.net/w/index.php?title=AnimState&oldid=1385245"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 00:52."
retrieved: "2026-09-15T11:42:45.312Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# AnimState

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.10.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](AnimState.md) (Create account)

Main article: [Animation](Animation.md)

**AnimState** is a specific state an entity can be in, such as walking, running, or idle. An AnimState is part of an [AnimSet](AnimSet.md), which is a collection of AnimStates and are themselves collections of [AnimNode](AnimNode.md). An AnimState is associated to an [ActionState](ActionState.md), which defines the transition conditions between different AnimStates as well as the properties of this state.

For example, the cow [AnimSet](AnimSet.md) has the following AnimStates:

-`attack`
-`deadbody`
-`death`
-`eating`
-`falldown`
-`followwall`
-`hitreaction`
-`idle`
-`onground`
-`onhook`
-`pathfind`
-`trailer`
-`walk`
-`zone`

Each of these AnimStates have one or more [AnimNode](AnimNode.md) to trigger various animations.

While custom AnimStates can be created, they require their custom [ActionState](ActionState.md) counterpart to work, which is not currently supported.

<a id="See_also"></a>

## See also

- [Creating custom animations](Creating_custom_animations.md) - a step by step guide on how to create animations.
- [AnimSet](AnimSet.md) - a collection of AnimStates associated to a specific character or creature.
- [AnimNode](AnimNode.md) - defines the animations that can be played in an AnimState and its properties and conditions.
- [ActionGroup](ActionGroup.md) - defines transitions for AnimStates in the form of [ActionStates](ActionState.md).
- [ActionState](ActionState.md) - defines a specific transition between two AnimStates or special properties of an AnimState.

Retrieved from "[https://pzwiki.net/w/index.php?title=AnimState&oldid=1385245](AnimState.md)"
