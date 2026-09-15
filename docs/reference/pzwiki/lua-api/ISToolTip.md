---
title: "ISToolTip"
source: "https://pzwiki.net/wiki/ISToolTip"
source_revision: "https://pzwiki.net/w/index.php?title=ISToolTip&oldid=1252205"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:38."
retrieved: "2026-09-15T11:43:03.220Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 4
source_tables: 0
---

# ISToolTip

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.3.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](ISToolTip.md) (Create account)

**ISToolTip** is a subclass of ISPanel used to display a tooltip on the screen. It is used by the game to display tooltips for various UI elements. This page documents the methods and properties of ISToolTip objects.

<a id="Creating_a_tooltip"></a>

## Creating a tooltip

Creating a tooltip is done by calling the`ISToolTip:new()` function however a better way to do so is to use`ISWorldObjectContextMenu.addToolTip` which will pick a tooltip from a pool of tooltips. This last method is recommanded as the game automatically creates new instances of tooltips if needed.



```text
-- create a new ISToolTip instance
local tooltip = ISToolTip:new()

-- get the tooltip from the existing pool of tooltips
local tooltip = ISWorldObjectContextMenu.addToolTip()
```



<a id="Adding_a_description"></a>

## Adding a description

To add a text description in the tooltip, you can simply add a string with the tooltip text to the field`description` of the tooltip object.



```text
-- create a new ISToolTip instance
local tooltip = ISToolTip:new()

-- add a description to the tooltip
tooltip.description = "This is a tooltip description."
```



[ISRichTextPanel](ISRichTextPanel.md) tags can be used in the description.

<a id="Adding_an_icon"></a>

## Adding an icon

To add an icon to the tooltip, you can simply add a Texture object to the field`texture` of the tooltip object.



```text
-- create a new ISToolTip instance
local tooltip = ISToolTip:new()

-- add an icon to the tooltip
tooltip.texture = getTexture("media/ui/yourImage.png")
```



This icon will be shown on the left side of the tooltip description.

<a id="Adding_a_footnote"></a>

## Adding a footnote

To add a footnote to the tooltip, you can simply add a string with the footnote text to the field`footnote` of the tooltip object.



```text
-- create a new ISToolTip instance
local tooltip = ISToolTip:new()

-- add a footnote to the tooltip
tooltip.footnote = "This is a tooltip footnote."
```



[ISRichTextPanel](ISRichTextPanel.md) tags can't be used in the footnote.

Retrieved from "[https://pzwiki.net/w/index.php?title=ISToolTip&oldid=1252205](ISToolTip.md)"
