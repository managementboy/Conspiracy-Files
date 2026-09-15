---
title: "Transition file"
source: "https://pzwiki.net/wiki/Transition_file"
source_revision: "https://pzwiki.net/w/index.php?title=Transition_file&oldid=1394479"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 04:44."
retrieved: "2026-09-15T11:42:46.419Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 4
source_tables: 1
---

# Transition file

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.10.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Transition_file.md) (Create account)

Main article: [ActionState](ActionState.md)

**Transition files** are used to define the transition conditions between different [AnimStates](AnimState.md) from an [AnimSet](AnimSet.md). They are a needed component of an [ActionState](ActionState.md) and appear in the form of a [XML](../foundations/File_formats.md#XML) file by defining conditions of a transition. If no transition exists, the game won't allow the transition from one state to another.

Custom transition files are not supported yet.

<a id="Structure"></a>

## Structure

This article may have claims which require verification.

Some parameters may not be accurate or missing.

Transition files are located in an [ActionState](ActionState.md) folder in the form of an [XML](../foundations/File_formats.md#XML) file. Multiple transitions can be defined in a single file, and each transition needs to have a condition.

The transition files if unique in an [ActionState](ActionState.md) folder are usually named with a generic name`transitions.xml`. If multiple transition files are present, they are named with a specific name, usually linking to the AnimState the transition goes to, such as`to_walk.xml` or`to_idle.xml`.

If multiple`transitions` are defined, the structure will start with:



```text
<transitions x_include="../defaultTransitions.xml">
    <transition>
        ...
    </transition>
</transitions>
```



For a single transition, the structure jumps directly to the transition block:



```text
<transition>
    ...
</transition>
```



| Parameter name | Description |
| --- | --- |
|`transitionTo` | AnimState that this transition will lead to. This is the name of the AnimState as defined in the AnimSet. |
|`conditions` | Defines the conditions that need to be met for this transition to occur. This takes up the form of a animation boolean variable check from the entity either with a`isFalse` or`isTrue` condition. For example: **Source:**`ProjectZomboid\media\scripts\ProjectZomboid/media/actiongroups/rabbit/eating/transitions.xml` **Retrieved**: Build 42.10.0`<conditions> <isFalse>isAnimalEating</isFalse> </conditions>` Multiple conditions can be defined in the same block, and they will all need to be met for the transition to occur: **Source:**`ProjectZomboid\media\scripts\ProjectZomboid/media/actiongroups/rabbit/trailer/to_walk.xml` **Retrieved**: Build 42.10.0`<conditions> <isTrue>bMoving</isTrue> <isFalse>bPathfind</isFalse> </conditions>` |
|`ConditionsBounds` | Possibly used only in AnimZed. |
|`FromPoint` | Possibly used only in AnimZed. |
|`ToPoint` | Possibly used only in AnimZed. |

<a id="See_also"></a>

## See also

- [Creating custom animations](Creating_custom_animations.md) - a step by step guide on how to create animations.
- [AnimSet](AnimSet.md) - a collection of [AnimStates](AnimState.md) associated to a specific character or creature.
- [AnimState](AnimState.md) - a specific state an entity can be in, such as walking, running, or idle.
- [AnimNode](AnimNode.md) - defines the animations that can be played in an AnimState and its properties and conditions.
- [ActionGroup](ActionGroup.md) - a collection of [ActionStates](ActionState.md).

Retrieved from "[https://pzwiki.net/w/index.php?title=Transition_file&oldid=1394479](Transition_file.md)"
