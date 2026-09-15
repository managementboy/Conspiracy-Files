---
title: "ScriptsDocs"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="scriptsdocs"></a>

# ScriptsDocs

This section provides detailed documentation for all available [script](../pzwiki/scripts/Scripts.md) blocks.

<a id="documentation-instructions"></a>

## Documentation Instructions

Each script block has its own documentation page. These will each contain metadata about the block (soft overides, is variant etc), a description and a few sections:

- Explaining the block’s hierarchy in relation to other blocks (parents, children, mandatory children)
- About the block’s ID
- A list of all parameters

A variant block means it is a block that will have completely different behavior from the original block and other variants based on conditions. These conditions are usually the ID of the block.

Each parameter will contain the following information based on what is provided by the game and the currently documented data from pz-scripts-data:

- The type of the parameter, which can be a simple type (string, number, boolean), a block type (which will link to the block’s documentation), an array type (with a separator), or an object type (with key and value types, and separators)
- If the parameter is deprecated or not
- If the parameter is required or not
- If the parameter can be empty or not
- The default value of the parameter, if any
- The minimum and maximum values of the parameter, if any
- A list of allowed values for the parameter, if any

The type will always be provided, and if not yet documented it will show as Unknown. The other ones may not be provided due to a lack of information or these simply don’t exist for the parameter.

<a id="contributing"></a>

## Contributing

You can contribute to this documentation by editing the pz-scripts-data repository. You can read more about it here.

<a id="root-files"></a>

## Root Files

- [Root Files](scripts/root_files.md)
  - [ROOT-Blends](scripts/root_files/blends.md)
  - [ROOT-Default](scripts/root_files/default.md)
  - [ROOT-MapBaseXML](scripts/root_files/mapbasexml.md)
  - [ROOT-MapInfo](scripts/root_files/mapinfo.md)
  - [ROOT-ModInfo](scripts/root_files/modinfo.md)
  - [ROOT-Rules](scripts/root_files/rules.md)
  - [ROOT-SandboxOptions](scripts/root_files/sandboxoptions.md)
  - [ROOT-Scripts](scripts/root_files/scripts.md)
  - [ROOT-SpriteModels](scripts/root_files/spritemodels.md)
  - [ROOT-TileGeometry](scripts/root_files/tilegeometry.md)
  - [ROOT-TMXconfig](scripts/root_files/tmxconfig.md)

<a id="table-of-contents"></a>

## Table of Contents

- [_COMPONENT_BLOCK](scripts/_component_block.md)
- [alias](scripts/alias.md)
- [anim](scripts/anim.md)
- [animation](scripts/animation.md)
- [animationsMesh](scripts/animationsmesh.md)
- [area](scripts/area.md)
- [attachment](scripts/attachment.md)
- [blend](scripts/blend.md)
- [BlendBlackList](scripts/blendblacklist.md)
- [BlendWhiteList](scripts/blendwhitelist.md)
- [box](scripts/box.md)
- [Categories](scripts/categories.md)
- [character_profession_definition](scripts/character_profession_definition.md)
- [character_trait_definition](scripts/character_trait_definition.md)
- [clip](scripts/clip.md)
- [clock](scripts/clock.md)
- [colors](scripts/colors.md)
- [component](scripts/component.md)
  - [component ContextMenuConfig](scripts/component/component-contextmenuconfig.md)
  - [component CraftBench](scripts/component/component-craftbench.md)
  - [component CraftBenchSounds](scripts/component/component-craftbenchsounds.md)
  - [component CraftRecipe](scripts/component/component-craftrecipe.md)
  - [component DryingCraftLogic](scripts/component/component-dryingcraftlogic.md)
  - [component Durability](scripts/component/component-durability.md)
  - [component FluidContainer](scripts/component/component-fluidcontainer.md)
  - [component Resources](scripts/component/component-resources.md)
  - [component SpriteConfig](scripts/component/component-spriteconfig.md)
  - [component SpriteOverlayConfig](scripts/component/component-spriteoverlayconfig.md)
  - [component UiConfig](scripts/component/component-uiconfig.md)
  - [component WallCoveringConfig](scripts/component/component-wallcoveringconfig.md)
- [components](scripts/components.md)
- [container](scripts/container.md)
- [contextEntry](scripts/contextentry.md)
- [CopyFrame](scripts/copyframe.md)
- [CopyFrames](scripts/copyframes.md)
- [craftRecipe](scripts/craftrecipe.md)
- [crawlThroughWheel](scripts/crawlthroughwheel.md)
- [cylinder](scripts/cylinder.md)
- [data](scripts/data.md)
- [door](scripts/door.md)
- [energy](scripts/energy.md)
- [entity](scripts/entity.md)
- [evolvedrecipe](scripts/evolvedrecipe.md)
- [face](scripts/face.md)
- [fixing](scripts/fixing.md)
- [fluid](scripts/fluid.md)
- [Fluids](scripts/fluids.md)
- [group](scripts/group.md)
- [hand](scripts/hand.md)
- [imports](scripts/imports.md)
- [inputs](scripts/inputs.md)
- [ISBaseComponentPanel](scripts/isbasecomponentpanel.md)
- [ISTableLayoutCell](scripts/istablelayoutcell.md)
- [item](scripts/item.md)
- [itemMapper](scripts/itemmapper.md)
- [layer](scripts/layer.md)
- [layers](scripts/layers.md)
- [lightbar](scripts/lightbar.md)
- [lua](scripts/lua.md)
- [mannequin](scripts/mannequin.md)
- [maps](scripts/maps.md)
- [model](scripts/model.md)
- [mods](scripts/mods.md)
- [module](scripts/module.md)
- [option](scripts/option.md)
- [outputs](scripts/outputs.md)
- [overlayMapper](scripts/overlaymapper.md)
- [part](scripts/part.md)
- [passenger](scripts/passenger.md)
- [physics](scripts/physics.md)
- [physicsHitReaction](scripts/physicshitreaction.md)
- [physicsShape](scripts/physicsshape.md)
- [Poison](scripts/poison.md)
- [polygon](scripts/polygon.md)
- [position](scripts/position.md)
- [progress](scripts/progress.md)
- [Properties](scripts/properties.md)
- [ragdoll](scripts/ragdoll.md)
- [rule](scripts/rule.md)
- [skin](scripts/skin.md)
- [sound](scripts/sound.md)
- [soundTimeline](scripts/soundtimeline.md)
- [spriteModel](scripts/spritemodel.md)
- [style](scripts/style.md)
- [switchSeat](scripts/switchseat.md)
- [table](scripts/table.md)
- [template](scripts/template.md)
- [tile](scripts/tile.md)
- [tileGeometry](scripts/tilegeometry.md)
- [tileset](scripts/tileset.md)
- [timedAction](scripts/timedaction.md)
- [vehicle](scripts/vehicle.md)
- [vehicleEngineRPM](scripts/vehicleenginerpm.md)
- [wheel](scripts/wheel.md)
- [whitelist](scripts/whitelist.md)
- [window](scripts/window.md)
- [xuiSkin](scripts/xuiskin.md)
