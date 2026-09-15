---
title: "ItemPickerContainer properties"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/mapping/item_picker_container_properties.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/mapping/item_picker_container_properties.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="itempickercontainer-properties"></a>

# ItemPickerContainer properties

Reference documentation for ItemPickerContainer procedural list entry properties. Those are used to define the procedural distributions which will be used for the containers of the rooms.

<a id="forceforitems"></a>

<a id="item-picker-property-forceforitems"></a>

## forceForItems

If the container’s room has one of those tiles, this procedural distribution entry will be forced to spawn.

**Type:**

- Main: `array`
- Separator: `;`

<a id="forceforrooms"></a>

<a id="item-picker-property-forceforrooms"></a>

## forceForRooms

If the building of the container has one of those rooms, this procedural distribution entry will be forced to spawn.

**Type:**

- Main: `array`
- Separator: `;`

<a id="forcefortiles"></a>

<a id="item-picker-property-forcefortiles"></a>

## forceForTiles

If the square of the container has one of those tiles, this procedural distribution entry will be forced to spawn.

**Type:**

- Main: `array`
- Separator: `;`

<a id="forceforzones"></a>

<a id="item-picker-property-forceforzones"></a>

## forceForZones

**Type:**

- Main: `array`
- Separator: `;`

Warning

This property does nothing and has no effect.

<a id="max"></a>

<a id="item-picker-property-max"></a>

## max

The maximum number of times this procedural distribution entry can spawn.

<a id="min"></a>

<a id="item-picker-property-min"></a>

## min

A minimum value of 1 will force this entry to spawn.

<a id="name"></a>

<a id="item-picker-property-name"></a>

## name

The procedural distribution entry name.

<a id="weightchance"></a>

<a id="item-picker-property-weightchance"></a>

## weightChance
