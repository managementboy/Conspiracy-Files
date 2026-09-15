---
title: "component FluidContainer"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/component/component-fluidcontainer.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/component/component-fluidcontainer.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="component-fluidcontainer"></a>

<a id="scripts-component-fluidcontainer"></a>

# component FluidContainer

**Soft Override:** Unknown

**Is Variant of:** [component](../component.md#scripts-component)

Adds a fluid container to an item

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [entity](../entity.md#scripts-entity)
- [item](../item.md#scripts-item)

This block can have the following child blocks:

- [whitelist](../whitelist.md#scripts-whitelist)
- [Fluids](../fluids.md#scripts-fluids)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-component-fluidcontainer-capacity"></a>

### Capacity

**Type:** float

**Default:** `1.0`

The fluid capacity of the container, the minimum value is `0.05`.

<a id="scripts-component-fluidcontainer-containername"></a>

### ContainerName

**Type:** translation

**Default:** `FluidContainer`

The name of the fluid container. The name cannot have whitespaces, the game will sanitize it to remove them and show an error in the console about it.

<a id="scripts-component-fluidcontainer-customdrinksound"></a>

### CustomDrinkSound

**Type:** string

**Default:** `DrinkingFromGeneric`

Refers to a [sound block](../sound.md) to trigger when drinking.

<a id="scripts-component-fluidcontainer-fillswithcleanwater"></a>

### FillsWithCleanWater

**Type:** boolean

**Default:** `False`

When set to true, the container will fill with clean water instead of tainted water when left outside in the rain.

<a id="scripts-component-fluidcontainer-hiddenamount"></a>

### HiddenAmount

**Type:** boolean

**Default:** `False`

When true, will hide the fluid quantity from the UI.

<a id="scripts-component-fluidcontainer-initialpercent"></a>

### InitialPercent

**Type:** float

**Incompatible with:** [InitialPercentMax](component-fluidcontainer.md#scripts-component-fluidcontainer-initialpercentmax) | [InitialPercentMin](component-fluidcontainer.md#scripts-component-fluidcontainer-initialpercentmin)

No description provided.

<a id="scripts-component-fluidcontainer-initialpercentmax"></a>

### InitialPercentMax

**Type:** float

**Default:** `1.0`

**Incompatible with:** [InitialPercent](component-fluidcontainer.md#scripts-component-fluidcontainer-initialpercent)

The minimum amount of fluid which will appear in this container.

<a id="scripts-component-fluidcontainer-initialpercentmin"></a>

### InitialPercentMin

**Type:** float

**Default:** `0.0`

**Incompatible with:** [InitialPercent](component-fluidcontainer.md#scripts-component-fluidcontainer-initialpercent)

The maximum amount of fluid which will appear in this container.

<a id="scripts-component-fluidcontainer-inputlocked"></a>

### InputLocked

**Type:** boolean

**Default:** `False`

Unused.

<a id="scripts-component-fluidcontainer-opened"></a>

### Opened

**Type:** boolean

**Default:** `True`

Unused.

<a id="scripts-component-fluidcontainer-pickrandomfluid"></a>

### PickRandomFluid

**Type:** boolean

**Default:** `False`

When set to true, the container will pick one of the available fluids in the [Fluids](../fluids.md) child block at random when filling. If set to false, it will make every fluids appear.

<a id="scripts-component-fluidcontainer-rainfactor"></a>

### RainFactor

**Type:** float

**Default:** `0.0`

Defines how much rain contributes to filling the container. A high value increases the rate of filling. A value of `0.0` means that rain will not fill the container, which is the default value of the parameter.

If the item is a weapon and `RainFactor` is set to a value above the default, when the player aims with the weapon it will empty it.
