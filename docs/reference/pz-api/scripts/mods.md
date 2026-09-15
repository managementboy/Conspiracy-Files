---
title: "mods"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/mods.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/mods.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="mods"></a>

<a id="scripts-mods"></a>

# mods

**Soft Override:** Unknown

A list of mods in the [default.txt](root_files/default.md) file. The mod ID should be used to reference the mods.

It should use the following syntax:



```
mods
{
  mod = mod1,
  mod = mod2,
  ...
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-Default](root_files/default.md#scripts-root-default)

<a id="id"></a>

## ID

This block should have no ID.

<a id="parameters"></a>

## Parameters

<a id="scripts-mods-mod"></a>

### mod

**Type:** string

The mod ID of the mod to load, which can be found in the [mod.info](root_files/modinfo.md) file of the mod.
