---
title: "attachment (scripts)"
source: "https://pzwiki.net/wiki/Attachment_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Attachment_(scripts)&oldid=1440689"
source_last_edited: "Last modified\n\t\t         This page was last edited on 21 June 2026, at 20:06."
retrieved: "2026-09-15T11:39:43.997Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# attachment (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

Navigation:

[Modding](../categories/Category_Modding.md) > [Scripts](Scripts.md) > **attachment (scripts)**

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](attachment_scripts.md) (Create account)

attachment

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

[vehicle](Vehicle_scripts.md)
[model](model_scripts.md)
template

[ID](Scripts.md#ID)

Any

[Soft overrides](Scripts.md#Soft_overrides)

Need testing

Defines an attachment point on a model or vehicle block. The ID is the attachment name, it can be a custom ID or an existing one often used to define specific attachments. While manually modifying the attachment block is definitely possible, it is recommended to use the [attachment editor](../assets-and-animation/Attachment_editor.md) to create and edit those attachments.

The syntax of this block should be as follows:



```text
model upperScriptDefinition
{
    ...
    attachment attachmentPointName
    {
        ...
    }
    ...
}
```



For example:



```text
model Burger
{
    mesh = Burger,

    attachment Bip01_Prop2
    {
        offset = 0.0142 0.0401 0.0000,
        rotate = -23.3606 21.2788 37.5386,
        scale = 0.8280,
    }
}
```



For a full list of attachment points, see [attachment](attachment_scripts.md).

<a id="Parameters"></a>

## Parameters

You can find a full list of the parameters in the ScriptsDocs.

<a id="Attachment_points"></a>

## Attachment points

This section may have claims which require verification.

This list might be incomplete or outdated.

Below is a list of attachments points provided by the game.

- 1schoolbaglefthand
- 1schoolbagrighthand
- AnkleHolster
- Bip01_Prop1
- Bip01_Prop2
- ShoulderHolster
- axe_back
- back
- back_guitar
- back_guitar_acoustic
- backpack_left
- bedroll_bottom
- bedroll_bottom_alice
- bedroll_bottom_big
- belt_left
- belt_left_screwdriver
- belt_left_upside
- belt_right
- belt_right_screwdriver
- belt_right_upside
- belt_rotated_left
- belt_rotated_right
- big_blade_back_bag
- big_w_back
- big_w_back_bag
- bighikingbaglefthand
- bighikingbagrighthand
- blade_back
- crowbar_back
- duffelbaglefthand
- duffelbagrighthand
- fryingpan_back
- fryingpan_back_bag
- hikingbaglefthand
- hikingbagrighthand
- holster_left
- holster_right
- knife_belt_back
- knife_belt_front
- knife_head
- knife_in_back
- knife_left_leg
- knife_right_leg
- knife_shoulder
- knife_stomach
- meatcleaver_in_back
- meatcleaver_left
- meatcleaver_right
- nightstick_left
- nightstick_right
- racket_back
- racket_back_bag
- rifle_back
- rifle_back_bag
- saucepan_back
- saucepan_back_bag
- shovel_back
- shovel_back_bag
- stomach
- walkie_belt_left
- walkie_belt_right
- webbing_left_knife
- webbing_left_walkie
- webbing_left_knife
- webbing_left_walkie
- wrench_left
- wrench_right

<a id="Example"></a>

## Example



```text
model Burger
{
    mesh = Burger,

    attachment Bip01_Prop2
    {
        offset = 0.0142 0.0401 0.0000,
        rotate = -23.3606 21.2788 37.5386,
        scale = 0.8280,
    }
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Attachment_(scripts)&oldid=1440689](attachment_scripts.md)"
