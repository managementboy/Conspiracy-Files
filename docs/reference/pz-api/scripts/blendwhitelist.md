---
title: "BlendWhiteList"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/blendwhitelist.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/blendwhitelist.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="blendwhitelist"></a>

<a id="scripts-blendwhitelist"></a>

# BlendWhiteList

**Soft Override:** Unknown

BlendWhiteList defines a whitelist for fluids that the fluid can be blended with, while BlendBlackList defines a blacklist. By default those blocks are set whitelist, but you can add one of the available parameters to indicate whenever the block is a whitelist or a blacklist.

Fluids that are whitelisted/blacklisted can be identified either by their category via the use of a [categories](categories.md) child block, or by their name via the use of the fluid parameter.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [fluid](fluid.md#scripts-fluid)

This block can have the following child blocks:

- [Categories](categories.md#scripts-categories)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-blendwhitelist-blacklist"></a>

### blacklist

**Type:** boolean

Indicates whenever blending with other fluids is disallowed.

<a id="scripts-blendwhitelist-category"></a>

### category

**Type:** Unknown

Unclear what this is for since this is usually achieved with a [categories](categories.md) child block.

<a id="scripts-blendwhitelist-filtertype"></a>

### filterType

**Type:** Unknown

**Allowed values:** `whitelist`

Just use whitelist or blacklist.

<a id="scripts-blendwhitelist-fluid"></a>

### fluid

**Type:** array (array of string, separator: ‘/’)

A list of fluids.

<a id="scripts-blendwhitelist-whitelist"></a>

### whitelist

**Type:** boolean

Indicates whenever blending with other fluids is allowed.
