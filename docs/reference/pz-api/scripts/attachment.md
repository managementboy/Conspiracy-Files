---
title: "attachment"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/attachment.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/attachment.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="attachment"></a>

<a id="scripts-attachment"></a>

# attachment

**Soft Override:** Unknown

Defines an attachment point on a [model](model.md) or [vehicle](vehicle.md) block. The ID is the attachment name, it can be a custom ID or an existing one often used to define specific attachments. While manually modifying the attachment block is definitely possible, it is recommended to use the [attachment editor](../../pzwiki/assets-and-animation/Attachment_editor.md) to create and edit those attachments.

The syntax of this block should be as follows:



```cpp
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



```cpp
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



For a full list of attachment points, see the attachment#Attachment_Points) page on the PZ Wiki.

<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [model](model.md#scripts-model)
- [template](template.md#scripts-template)
- [vehicle](vehicle.md#scripts-vehicle)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="parameters"></a>

## Parameters

<a id="scripts-attachment-bone"></a>

### bone

**Type:** Unknown

The name of the bone to which the model is attached to.



```cpp
bone = Bip01_L_Hand,
```



<a id="scripts-attachment-offset"></a>

### offset

**Type:** array (array of float, separator: ‘ ‘)

The position offset of the model relative to the bone. This is a vector in the format `x y z`. `cpp
offset = -0.0300 -0.1020 0.1210,`

<a id="scripts-attachment-rotate"></a>

### rotate

**Type:** array (array of float, separator: ‘ ‘)

The rotation of the model relative to the bone. This is a vector in the format `x y z`. The values are degrees.



```cpp
rotate = -60.0000 -49.0000 -3.0000,
```



<a id="scripts-attachment-scale"></a>

### scale

**Type:** float

The scale multiplier applied to the model attached to this attachment point.



```cpp
scale = 0.5,
```



<a id="scripts-attachment-zoffset"></a>

### zoffset

**Type:** Unknown

No description provided.
