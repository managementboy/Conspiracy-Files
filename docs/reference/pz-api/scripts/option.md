---
title: "option"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/option.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/option.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="option"></a>

<a id="scripts-option"></a>

# option

**Soft Override:** Unknown

Defines a custom sandbox option for a mod. You can find more information about sandbox options [here](../../pzwiki/scripts/Sandbox_options.md).

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [ROOT-SandboxOptions](root_files/sandboxoptions.md#scripts-root-sandboxoptions)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-option-default"></a>

### default

**Type:** Unknown

The default value of the option. The type of the value must match the type of the option.

<a id="scripts-option-max"></a>

### max

**Type:** float

The maximum value the option can have. Only for integer and double types.

<a id="scripts-option-min"></a>

### min

**Type:** float

The minimum value the option can have. Only for integer and double types.

<a id="scripts-option-page"></a>

### page

**Type:** translation

The sandbox option to add the option to. Can be a custom page.

<a id="scripts-option-translation"></a>

### translation

**Type:** translation

The translation key for the option’s name. The translation key in the [Sandbox](../translations/translation_files.md#sandbox) translation file should have the prefix `Sandbox_`.

For example, with the translation parameter as such:



```java
translation = MyMod_MyOption
```



The translation key in the Sandbox translation file should be:



```json
"Sandbox_MyMod_MyOption": "My Option"
```



<a id="scripts-option-type"></a>

### type

**Type:** string

**Required:** True

**Allowed values:** `boolean` | `double` | `enum` | `integer` | `string`

The type of the option.
