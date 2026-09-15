---
title: "Creating a flier mod"
source: "https://pzwiki.net/wiki/Creating_a_flier_mod"
source_revision: "https://pzwiki.net/w/index.php?title=Creating_a_flier_mod&oldid=1455391"
source_last_edited: "Last modified\n\t\t         This page was last edited on 7 August 2026, at 14:37."
retrieved: "2026-09-15T11:42:47.302Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 11
source_tables: 0
---

# Creating a flier mod

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Creating_a_flier_mod.md) (Create account)

This article may be outdated.

This guide has been outdated for a while now as it seems they changed a bunch of process needed to do to add custom fliers.

Editors are encouraged to update this article with new information. [Edit](Creating_a_flier_mod.md) (Create account)

This guide explains how to add new fliers to unstable Build 42. Fliers that display an image, have a failback text and point to a location on a map that they reveal. Credits to VlwsMIR for the help with figuring out the coding

<a id="Needed"></a>

## Needed

- An image that will be used for the flier in game.
- Some form of text editor to create/edit text files. LUA files are the same as text files in terms of content and can be edited with notepad.

<a id="Creating_the_necessary_mod_structure"></a>

## Creating the necessary mod structure

Open your Workshop directory, where you create mods in order to later upload them to Steam Workshop.

The path is:



```text
C:\Users\<YourUserName>\Zomboid\Workshop\
```



Create the necessary folder structure with the following folders and files:



```text
..\YourModName\preview.png - preview image  for the workshop
..\YourModName\workshop.txt - descriptor file for the workshop
..\YourModName\Contents\mods\YourModName\Common\ - leave this directory empty
..\YourModName\Contents\mods\YourModName\42\ - this is where all mod files will go
```



Here's the example of workshop.txt file:



```text
version=1
id=
title=B42 - New fliers
description=New fliers.
tags=Build 42;Items;Map
visibility=public
```



In the next section we will describe what goes into the following folder:



```text
C:\Users\<YourUserName>\Zomboid\Workshop\YourModName\Contents\mods\YourModName\42\
```



<a id="Creating_the_mod"></a>

## Creating the mod

We start with the following folder:



```text
C:\Users\<YourUserName>\Zomboid\Workshop\YourModName\Contents\mods\YourModName\42\
```



At first, make two files in this folder:



```text
..\YourModName\42\poster.png
..\YourModName\42\mod.info
```



**Poster.png** can be any image used as a poster for in-game mod manager. Here's an example of **mod.info** file for in-game mod manager:



```text
name=NewFliers
poster=poster.png
id=MyNewFliers
description=New fliers.
url=
```



Those two files are the poster and the descriptor.

At this point we can create the following files that actually contain our mod data:



```text
..\YourModName\42\media\textures\printMedia\FlyerPic\MyNewFlier.png
..\YourModName\42\media\lua\shared\myFlierDefinition.lua
..\YourModName\42\media\lua\shared\Translate\EN\Print_Media_EN.txt
..\YourModName\42\media\lua\shared\Translate\EN\Print_Text_EN.txt
```



**MyFlier.png** is the actual picture you want to use for the flier. You need to know its dimensions (width, height). **myFlierDefinition.lua** is the file that adds your flier to the list of other fliers.

Inside of definitions, you need to maintain the same fler ID (name) across all definitions. Let me show you how. The flier definition (id, object name) will be **MyNewFlier**.

Here's an example content for myFlierDefinition.lua:



```text
require "PrintMedia/PrintMediaDefinitions"
local newFliers = {"MyNewFlier"}

for n= 1, #newFliersDeon do
    table.insert(PrintMediaDefinitions.Fliers, newFliers[n])
end

local MyCoords = {
		MyNewFlier = { location1 = { { x1 = 1889, y1 = 10812, x2 = 1965, y2 = 10844,}, }, },
}

for k,v in pairs(MyCoords) do
	PrintMediaDefinitions.MiscDetails[k] = v
end
```



Pay attention that we used the same name **MyNewFlier** twice:

- Once in "newFliers" list. Here we simply create the defnition.
- Once in "MyCoords" list. Here we add coordinates of the rectangle that should be revealed on the map by reading the flier.

You can find the needed coordinates in Debug mode/in beta42 by right-clicking on a world tile and checking coordinates. You want coordinates of North-west and South-east corners of a rectangle.

If you want to add multiple fliers, you will add them to the list like this: newFliers = {"MyNewFlier1", "MyNewFlier2}

Finally, we describe what goes inside of the flier in terms of the picture and the failback text.

This is the example of Print_Media_EN.txt. Note that we use MyNewFlier as a name again inside of Print_Media_<NAME>_title lines etc.



```text
Print_Media_EN = {

Print_Media_MyNewFlier_title= "My flier title",
Print_Media_MyNewFlier_info= "<type:parent, width:800, height:1200>"..
"<type:texture, x:0, y:0, texture:getTexture("media/textures/printMedia/FlyerPics/MyNewFlier.png"), width:800, height:1200>",

}
```



Make sure to use width and height in th line **Print_Media_MyNewFlier_info** that are the same as the width and the heightof the picture.

At this point the flier is ready to display he image and show us coordinates on map, but you may want to add a "failback" text that you can read by clicking small icon on bottom left of the banner.

To fill this text, write into Print_Text_EN.txt file. Here's the example



```text
Print_Text_EN = {

Print_Text_MyNewFlier_title= "My flier title",
Print_Text_MyNewFlier_info= "This is a description\nThis text is on a new line",
```



All that is left is to test that it works in the game (spawn in -debug mode multiple fliers until yours shows).

Retrieved from "[https://pzwiki.net/w/index.php?title=Creating_a_flier_mod&oldid=1455391](Creating_a_flier_mod.md)"
