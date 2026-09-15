---
title: "Steam Uploader"
source: "https://pzwiki.net/wiki/Steam_Uploader"
source_revision: "https://pzwiki.net/w/index.php?title=Steam_Uploader&oldid=1459649"
source_last_edited: "Last modified\n\t\t         This page was last edited on 21 August 2026, at 16:44."
retrieved: "2026-09-15T11:39:41.876Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 0
---

# Steam Uploader

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

Steam Uploader

![Article illustration](../assets/73269b1cd04166069519.png)

C++ version

![Article illustration](../assets/940b03325f7011617faf.png)

GitHub repository

![Article illustration](../assets/940b03325f7011617faf.png)

Download

Rust version (less tested)

![Article illustration](../assets/940b03325f7011617faf.png)

GitHub repository

![Article illustration](../assets/940b03325f7011617faf.png)

Download

Steam Uploader Helper

![Article illustration](../assets/940b03325f7011617faf.png)

GitHub repository

**Steam Uploader** is an external uploader for Steam Workshop items that can be used for Project Zomboid to bypass the [in-game uploader](Uploading_mods.md#In-game_uploader) limitations, such as the preview size and file type limits. Since the Rust rework of the tool, it depends on a manifest file for your mod that contains the title, description, tags, etc. of your mod, which makes it easier to manage your mods and upload them.

It uses simple command-line arguments to control what needs to be updated, with the ability to directly provide a text file for the description and patch note. This requires the Steam client to be opened when using the tool.

![Article illustration](../assets/4371a3cbc68c57933eb9.png)

▶

Steam Uploader - quick demonstration

External link ↗

<a id="Steam_Uploader_Helper"></a>

## Steam Uploader Helper

**SteamUploader Helper** is a companion tool for the C++ version of SteamUploader. It helps manage and publishing mods to the Steam Workshop. This tool offers an interface that handles batch regex editing and batch uploading. Uploads pull title, description, and tags straight from each mod's [workshop.txt](workshop.txt.md)/[mod.info](mod.info.md).

Retrieved from "[https://pzwiki.net/w/index.php?title=Steam_Uploader&oldid=1459649](Steam_Uploader.md)"
