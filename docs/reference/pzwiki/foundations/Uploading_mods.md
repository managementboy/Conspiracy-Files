---
title: "Uploading mods"
source: "https://pzwiki.net/wiki/Uploading_mods"
source_revision: "https://pzwiki.net/w/index.php?title=Uploading_mods&oldid=1456913"
source_last_edited: "Last modified\n\t\t         This page was last edited on 13 August 2026, at 15:08."
retrieved: "2026-09-15T11:39:39.257Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# Uploading mods

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.2).

Help by adding any missing content. [Edit](Uploading_mods.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

This page will explain the process of **uploading mods** to the Steam Workshop with the in-game uploader, as well as documenting alternative methods and uploaders that give more control over what you do.

When uploading a mod with files deleted from the previous version, users will not have these files removed automatically and might get version mismatch errors. You can simply leave the files in but replace the content to leave them empty.

<a id="In-game_uploader"></a>

## In-game uploader

The in-game uploader can be accessed from the main menu in the Workshop menu, then "Create and update items". This menu will show every valid mod in your [Workshop folder](Mod_structure.md#Workshop_folder) and allow you to upload them to the Steam Workshop.

After selecting which mod to upload/update, you will be prompted with a menu to set the mod's title, description, tags, and visibility. The preview image is also visible here. The next step will open a menu showing the title of the mod on the workshop and the workshop ID used. If no [Workshop ID](Workshop_ID.md) is set, the game will ask to create a new one or to use an existing one. You can edit the patch note, which will be uploaded on the workshop page with the mod. You can click "Upload to Steam Workshop now!" to upload the mod. The workshop page description will receive two new elements at the end of it when uploading:



```text
Workshop ID: <workshop_id>
Mod ID: <mod_id>
```



The in-game uploader will **overwrite** the entire workshop description with the one set in the uploader. If you want to keep the description of your mod, you will need to copy it before uploading! A solution to this problem is anytime you update your mod, copy the description from the Steam Workshop page and paste it in the uploader's description field. Make sure to remove the workshop and mod ID at the end of the copied description, or you will end up uploading duplicates of it.

You can find a description of the result codes in the Steamworks SDK API reference. These are rarely too descriptive of the actual problem but they can help you find out what could be wrong.

<a id="Alternative_uploaders"></a>

## Alternative uploaders

- [SteamCMD](SteamCMD.md#Uploading_Workshop_items) – the official Steam command line tool that allows you to upload mods with a build configuration file. This method is more complex but allows for more control over the upload process and its content.
- SteamChangePreview tool – allows you to bypass the limitations of the in-game uploader to be able to upload different-sized preview images for your mod on its Steam page. It notably allows you to upload a non-square image, a higher resolution image, or an animated preview image.
- [Steam Uploader](Steam_Uploader.md) – an external uploader that provides the ability to update different elements on a Workshop page independently or multiple ones together (description, preview, content…).

Retrieved from "[https://pzwiki.net/w/index.php?title=Uploading_mods&oldid=1456913](Uploading_mods.md)"
