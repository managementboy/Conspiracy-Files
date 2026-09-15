---
title: "model (scripts)"
source: "https://pzwiki.net/wiki/Model_(scripts)"
source_revision: "https://pzwiki.net/w/index.php?title=Model_(scripts)&oldid=1464541"
source_last_edited: "Last modified\n\t\t         This page was last edited on 28 August 2026, at 09:10."
retrieved: "2026-09-15T11:39:42.418Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# model (scripts)

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.19.0).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](model_scripts.md) (Create account)

model

![Article illustration](../assets/fb45af02ba5e969db0d9.png)

ScriptsDocs

Properties

[Parent blocks](Scripts.md#Parent_blocks)

module
[vehicle](Vehicle_scripts.md)
part

[Children blocks](Scripts.md#Children_blocks)

[attachment](attachment_scripts.md)

[ID](Scripts.md#ID)

Any except when parent is:
[vehicle](Vehicle_scripts.md)

[Soft overrides](Scripts.md#Soft_overrides)

Need testing

Used to define a model properties so it can be used in other elements of the game, most notably in [item](item_scripts.md) and [vehicle](Vehicle_scripts.md). The basic structure of a model block is as follows:



```text
module YourModule {
  model YourModel {
    mesh = your_model,
    texture = your_model_texture,
  }
}
```



[attachment](attachment_scripts.md) blocks can also be added to the model definition to specify how the model should be placed, rotated and scaled when attached to a parent model.

<a id="Parameters"></a>

## Parameters

You can find a full list of the parameters in the ScriptsDocs.

<a id="Example"></a>

## Example



```text
model Burger
{
	mesh = Burger,
    scale = 1.5,
    static = true,
    texture = BurgerTex,

	attachment Bip01_Prop2
	{
		offset = 0.0142 0.0401 0.0000,
		rotate = -23.3606 21.2788 37.5386,
		scale = 0.8280,
	}
}
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Model_(scripts)&oldid=1464541](model_scripts.md)"
