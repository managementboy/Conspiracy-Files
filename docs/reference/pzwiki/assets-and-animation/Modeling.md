---
title: "Modeling"
source: "https://pzwiki.net/wiki/Modeling"
source_revision: "https://pzwiki.net/w/index.php?title=Modeling&oldid=1457703"
source_last_edited: "Last modified\n\t\t         This page was last edited on 16 August 2026, at 19:32."
retrieved: "2026-09-15T11:40:36.497Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 1
---

# Modeling

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.2).

Help by adding any missing content. [Edit](Modeling.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

**Modeling** is the process of creating 3D models using specialized software, to directly implement in-game in the form of items or vehicles, or to create [renders](Rendering.md). The most common software in the Project Zomboid community for any 3D work is Blender, but there are many others available.

It is possible to import game assets to use in your own project, see [Importing assets](Importing_assets.md).

<a id="File_types"></a>

## File types

The modeling formats which can be used are:

| Format | Description |
| --- | --- |
| Filmbox FBX (`.fbx`) | The most commonly used format for animations and models, and can be [hot-reloaded](Hot_reloading.md) in-game automatically when the file is updated. |
| Graphics Library Transmission Format (`.glb`) | A format which allows for animations to be stored in the model file, which can be useful for niche applications to animate clothing or tiles. |
| DirectX (`.x`) Not recommended | The format used for most vanilla game assets, but is widely unsupported in modern 3D software. It is highly recommended to not use this format for modding, as it can cause more issues than it solves, and there is no point to using it when the other formats are available and more widely supported. |

<a id="Models_for_items"></a>

## Models for items

Models are implemented on items thanks to [model scripts](../scripts/model_scripts.md), while the items themselves are implemented thanks to [item scripts](../scripts/item_scripts.md). See the parameters StaticModel and WorldStaticModel, as well as WeaponSprite.

<a id="See_also"></a>

## See also

- [Animation](Animation.md) - a guide on creating custom animations for the game.
- [Scripts](../scripts/Scripts.md) - a guide on creating scripts to add new items, vehicles etc.
- [Importing assets](Importing_assets.md) - a guide on how to import in-game assets such as animations and models into Blender.

Retrieved from "[https://pzwiki.net/w/index.php?title=Modeling&oldid=1457703](Modeling.md)"
