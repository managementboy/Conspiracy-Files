---
title: "Poison"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/poison.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/poison.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="poison"></a>

<a id="scripts-poison"></a>

# Poison

**Soft Override:** Unknown

Defines poison properties for a fluid script.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [fluid](fluid.md#scripts-fluid)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-poison-diluteratio"></a>

### diluteRatio

**Type:** float

The ratio at which the poison is diluted when mixed with other fluids.

<a id="scripts-poison-maxeffect"></a>

### maxEffect

**Type:** string

**Allowed values:** `Deadly` | `Extreme` | `Medium` | `Mild` | `None` | `Severe`

Defines the strength of the poison.

<a id="scripts-poison-minamount"></a>

### minAmount

**Type:** float

The minimum amount required to consume to poison the player.
