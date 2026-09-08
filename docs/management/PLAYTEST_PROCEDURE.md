# Playtest procedure

Current as of 2026-09-08, when development moved to Linux Mint and play stayed
on the Windows machine. This supersedes the session plans in
`TOMORROW_PLAYTEST.md` and `OWNER_ATTENDANCE_CHECKLIST.md`, which describe
DEV-0.6-era sessions on a single machine.

## The loop

| Who | Step |
|---|---|
| Claude | Build the change. Run `lua5.1 test/run.lua` and `tools/kahlua/run.sh --parse-all`. Both must pass. |
| Claude | Bump `ConspiracyFiles.VERSION` in `Version.lua` to name what changed. |
| Claude | `tools/publish_workshop.sh --changenote "<what changed>"` |
| Steam | Pushes the update to the play machine's subscription. |
| Owner | Launch with `-debug`, enable the mod, start a **fresh save**, play. |
| Owner | Quit, then run `.\push_log.ps1` |
| Claude | `tools/fetch_logs.sh --incoming`, triage, report. |

Claude publishes without asking each time. Claude does **not** change
visibility, title or description without asking: those reach past the two
machines.

## Before every session, three things

1. **`-debug` must be on the launch line.** Steam, right-click Project Zomboid,
   Properties, Launch Options, `-debug`. Most of the mod is gated behind
   `getDebug()`; without it the mod loads and does nothing, silently, which
   looks exactly like every feature being broken.
2. **A fresh save.** The generator revision and case-retirement schema changed.
   An older save is refused as an unsupported generated case revision, which is
   correct under P4-R63. Never delete an existing save to make room; make a new
   one alongside it.
3. **Check the title bar.** It should read
   `<YourName>'s Notebook [DEV-0.8.13-notebook-name]` or later. If it shows an
   older build, Steam has not finished updating the subscription and everything
   you are about to test is the previous build.

## Getting the log back

Copy `tools/push_log.ps1` to the play machine once. After a session:

    .\push_log.ps1
    .\push_log.ps1 -All      # also the timestamped Logs folder

Quit the game first: PZ appends to `console.txt` continuously, so a log copied
mid-session stops wherever the last flush landed. `Logs/` keeps timestamped
copies of previous sessions, so use `-All` when the run you care about was not
the most recent one.

The script needs no elevation and no OpenSSH *server* on Windows - only the
client, which ships enabled. It reports the log's size and age before sending,
because reporting a session that never ran wastes a round trip.

## What to look at first

`[CF-SELFCHECK]` explains everything after it, so read it before anything else.

- `all 13 expected modules loaded` - good, continue.
- `NOT LOADED: <names>` - stop. Three modules have shipped complete, tested and
  called by nothing. Any behaviour that looks broken below this line is
  probably just absent.
- **no line at all** - the mod never reached game start. Almost always a
  disabled mod or a launch without `-debug`.

Then the tags: `[CF-G2]` case generation and placement, `[CF-LEDGER]` each
discovery in order with its game time, `[CF-VOICE]` what the survivor said and
whether it displayed, `[CF-G2-HINT]` proximity hints including suppressed ones,
`[CF-PERSON]` the corpse/key/building chain, `[CF-IDENTITY]` why an inventory
pane was or was not observed.

Engine error lines are normal. Vanilla PZ logs fluid-container names, translator
format strings and skeleton bone lookups on every launch; `fetch_logs.sh`
separates those from anything mentioning Conspiracy-Files.

## Currently unverified in play

Nothing below has ever been seen working in a game. Test in roughly this order -
the first is the headline feature and the cheapest to reach.

1. **Corpse outfits as observed leads.** A body in a security guard's uniform
   carrying an accountant's ID. The notebook must record two leads that
   disagree and refuse to conclude which is true. Confirmed by `[CF-IDENTITY]`.
2. **Room-aware placement.** Paperwork in offices, not in a garage. `[CF-G2]`.
3. **Evidence-pickup voice line.** Speech on picking up a document. `[CF-VOICE]`
   records whether it actually displayed, which is not the same as being said.
4. **The eight notebook UI improvements.**
5. **Case retirement.**
6. **Role/carrier evidence selection.**
7. **The survivor's forename in the notebook title.** New in
   DEV-0.8.13-notebook-name; a character with an unusual or missing name should
   fall back to `Survivor's Notebook` rather than break the window.

Also open and worth watching for: the wallet click defect, narrowed to nested
container panes.

## Rules that do not change during a playtest

- **The owner plays. Claude never drives the game.** Claude reads `console.txt`
  and offers one-line console commands; it does not automate play.
- **Never delete, reset or rewrite a save.** A fresh save may be required; say
  so, never do it for them.
- **A lead is never proof.** Two disagreeing leads are the feature. A notebook
  that resolves the disagreement is the bug.
