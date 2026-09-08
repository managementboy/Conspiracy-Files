# Installing Conspiracy-Files for testing

For anyone helping test, on any machine. There is no build step: the mod is Lua.

## Install

1. Get `ConspiracyFiles-<version>.zip`.
2. Unzip it into your Project Zomboid **mods** folder, so you end up with:

       <Zomboid>/mods/ConspiracyFiles/42/mod.info
       <Zomboid>/mods/ConspiracyFiles/common/media/...

   `<Zomboid>` is `~/Zomboid` on Linux, `C:\Users\<you>\Zomboid` on Windows.
   If a `ConspiracyFiles` folder is already there, **delete it first** - copying
   over the top leaves stale files that cause confusing failures.
3. Start the game, enable **Conspiracy-Files** in the mod list, and start a
   **new save**.

## Debug mode is required

Most of the mod is gated to single-player debug mode. Without it the mod loads
and does nothing, silently.

## Confirm it is working

Open the notebook. In debug mode its title bar shows the build, e.g.
`Survivor's Notebook [DEV-0.8.12-selfcheck]`. Check it matches the version you
were given - a stale install is the single most common cause of "it does not
work".

Within a few seconds of starting, `console.txt` should contain:

    [CF-SELFCHECK] all 12 expected modules loaded
    [CF-G2] Generated case active.

If the self-check names anything as `NOT LOADED`, stop and report that line: it
explains anything that follows.

## Reporting a problem

`console.txt` is worth far more than a description. It lives in your `<Zomboid>`
folder next to `Saves` and `mods`.

Useful lines all begin `[CF-`:

    [CF-SELFCHECK]  which modules loaded
    [CF-G2]         case generation and placement
    [CF-LEDGER]     each discovery, in order, with its game time
    [CF-VOICE]      what the survivor said, and whether it displayed
    [CF-G2-HINT]    proximity hints, including why one was suppressed
    [CF-PERSON]     the corpse / key / building chain
    [CF-IDENTITY]   why an inventory pane was or was not observed

Send `console.txt` plus what you were doing. A screenshot of the notebook helps
for anything about ordering or wording.

## Known and expected

- **A save from an older build will be refused** with "unsupported generated
  case revision". That is deliberate: the case format changed. Start a new save.
- A clue hint is a quiet speech bubble with floating text and a soft blip. It is
  meant to be missable; the log records every one either way.
- The notebook records; it never sets objectives and never announces a solution.
