---
title: "ROOT-Rules"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/root_files/rules.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/root_files/rules.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="root-rules"></a>

<a id="scripts-root-rules"></a>

# ROOT-Rules

**Soft Override:** Unknown

**Is Root:** True

**Root patterns:** `Rules\.txt$`

The `Rules.txt` file is used in the [mapping tools](../../../pzwiki/mapping/Mapping.md) to define new BMP to TMX conversion rules. You can store this file anywhere on your computer and you need to reference it in the BMP Tool settings.

A reference image containing the exact pixel colors you need to use for your BMP can be found here.

<a id="hierarchy"></a>

## Hierarchy

This block can have the following child blocks:

- [alias](../alias.md#scripts-alias)
- [rule](../rule.md#scripts-rule)

<a id="parameters"></a>

## Parameters

<a id="scripts-root-rules-version"></a>

### version

**Type:** integer

Version of the rules file. Should be 1 for now.
