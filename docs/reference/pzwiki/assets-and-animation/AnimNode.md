---
title: "AnimNode"
source: "https://pzwiki.net/wiki/AnimNode"
source_revision: "https://pzwiki.net/w/index.php?title=AnimNode&oldid=1385239"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 00:52."
retrieved: "2026-09-15T11:42:44.207Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 1
---

# AnimNode

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](AnimNode.md) (Create account)

**AnimNode**, or **animation node**, are used to define conditions to trigger [animations](Animation.md), their properties and trigger other different events during the animation. They are used to play [animations](Animation.md) in-game, define their transitions, and control how they interact with the character's skeleton. AnimNodes are defined in [XML](../foundations/File_formats.md#XML) files found inside the folder`media/AnimSets`.

The name AnimSets is sometimes used in place of AnimNodes to refer to the same system.

<a id="Creating_an_AnimNode"></a>

## Creating an AnimNode

To create an AnimNode, you need to properly locate your XML files inside the right folder. For example, zombie animations will need to be located inside`media/AnimSets/zombie`.

An AnimNode needs to be associated to a character type, and to an [animation state](AnimState.md) of that character. An animation state corresponds to a subfolder within the character folder of AnimSets, for example:

-`media/AnimSets/zombie/idle` - for idle animations.
-`media/AnimSets/zombie/walktoward` - for walking animations.
-`media/AnimSets/zombie/getup` - for getting up animations.
-`media/AnimSets/zombie/thump` - for thumping animations.

In the same way, refer to the [game files](../foundations/Game_files.md) to find the right folders for the different animation types you're trying to create.

Naming the AnimNode files is important and those usually have the same name as the animation they are associated with. So if your animation is named`ShootUp.fbx`, it is recommended to name your AnimNode`ShootUp.xml`.

AnimNodes can override other AnimNodes with the same name, and same for animations. As such, it is recommended to use a unique name for your AnimNode. As such, adding a prefix is a good way to prevent this problem.

<a id="AnimNode_parameters"></a>

## AnimNode parameters

Source marks this entry as incomplete.

Below is a list of parameters that can be used in AnimNodes:

| Parameter name | Description |
| --- | --- |
| m_Name | The name of the animation node. Will be used by other animation nodes to reference it in transitions. |
| m_AnimName | The name of the animation file that this node will play. |
| m_Priority | Priority dictates, such as in cases when two animations are playing at the same time, which animation's bone weights or keyframes will take precedence. |
| m_ConditionPriority | When multiple animation nodes are equally valid to be chosen with the current animation variables, the one with the highest priority will be chosen. |
| m_Conditions | Used to set conditions which determine whenever this AnimNode is selected. |
| m_SpeedScale | Dictates how quickly the animation plays inside of the game. 1.0 being the default animation speed, you can adjust this to be lower such as 0.50, or faster, such as 1.50. |
| m_blendInTime, m_blendOutTime | How quickly the animation will begin to play or end, and how the game interpolates moving the armature's bones from one animState to another. |
| m_Transitions | Used to create transitions between different animation nodes. |
| m_SubStateBoneWeights | Used to define the weight of a bone and its keyframes or descendants. This allows for more control over which bones are affected by the animation. |
| m_deferredBoneAxis | Source marks this entry as incomplete. |
| m_Events | Used to trigger different events during the animation, to play sounds, set variables and more. |

<a id="See_also"></a>

## See also

- [Creating custom animations](Creating_custom_animations.md) – a step by step guide on how to create animations.

Retrieved from "[https://pzwiki.net/w/index.php?title=AnimNode&oldid=1385239](AnimNode.md)"
