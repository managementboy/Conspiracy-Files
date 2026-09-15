---
title: "OnClientCommand"
source: "https://pzwiki.net/wiki/OnClientCommand"
source_revision: "https://pzwiki.net/w/index.php?title=OnClientCommand&oldid=1391471"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:28."
retrieved: "2026-09-15T11:42:22.868Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnClientCommand

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnClientCommand.md) (Create account)

<a id="Event"></a>

## Event

(Server) OnClientCommand

<a id="Description"></a>

## Description

Fires when a client command sent through sendClientCommand is received by the server.

<a id="Parameters"></a>

## Parameters

- module: string - The module the command was sent with.
- command: string - The command the command was sent with.
- player: IsoPlayer (JavaDoc) - The player who sent the command.
- args: table? - The arguments table the command was sent with. If the table was empty, nil is passed instead.

<a id="Examples"></a>

## Examples



```text
local function OnClientCommand(module, command, player, args)
    -- your code here
end

Events.OnClientCommand.Add(OnClientCommand)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnClientCommand&oldid=1391471](OnClientCommand.md)"
