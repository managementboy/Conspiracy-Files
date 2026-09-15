---
title: "module"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/module.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/module.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="module"></a>

<a id="scripts-module"></a>

# module

**Soft Override:** Unknown

A module serves as a namespace for your scripts and is the barebone for most scripts you will create in your mod. The game’s namespace is `Base`, and while you can insert in it, it is recommended to use your own module for your mod’s scripts to avoid conflicts with the game and other mods.

To define a module, you need to create a block as follows, by changing the ID to a unique name for your mods:



```cpp
module yourID
{
  ...
}
```



Most scripts that are defined in a module will need to be refered to by their ‘full type’, that is `module.id`, but this is a bit inconsistent as some places where a script block needs to be refered to require no module reference. For example, for an item, you can refer to it by its full type `yourModule.yourItemID`.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-Scripts](root_files/scripts.md#scripts-root-scripts)

This block can have the following child blocks:

- [animation](animation.md#scripts-animation)
- [timedAction](timedaction.md#scripts-timedaction)
- [model](model.md#scripts-model)
- [soundTimeline](soundtimeline.md#scripts-soundtimeline)
- [entity](entity.md#scripts-entity)
- [animationsMesh](animationsmesh.md#scripts-animationsmesh)
- [template](template.md#scripts-template)
- [fixing](fixing.md#scripts-fixing)
- [vehicle](vehicle.md#scripts-vehicle)
- [ragdoll](ragdoll.md#scripts-ragdoll)
- [physicsHitReaction](physicshitreaction.md#scripts-physicshitreaction)
- [craftRecipe](craftrecipe.md#scripts-craftrecipe)
- [evolvedrecipe](evolvedrecipe.md#scripts-evolvedrecipe)
- [xuiSkin](xuiskin.md#scripts-xuiskin)
- [character_profession_definition](character_profession_definition.md#scripts-character-profession-definition)
- [clock](clock.md#scripts-clock)
- [fluid](fluid.md#scripts-fluid)
- [physicsShape](physicsshape.md#scripts-physicsshape)
- [energy](energy.md#scripts-energy)
- [vehicleEngineRPM](vehicleenginerpm.md#scripts-vehicleenginerpm)
- [mannequin](mannequin.md#scripts-mannequin)
- [imports](imports.md#scripts-imports)
- [character_trait_definition](character_trait_definition.md#scripts-character-trait-definition)
- [item](item.md#scripts-item)
- [sound](sound.md#scripts-sound)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

This block has no parameters.
