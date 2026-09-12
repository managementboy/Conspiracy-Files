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

## Getting the log off the play machine

The two scripts live in this repo, so a reset or a new Windows profile leaves
the play machine without them. That has cost twenty minutes twice. **Fetch them
first, with the only tool that is always there** - the OpenSSH *client*, which
Windows ships enabled and WSUS does not block (the *server* is the part that is
blocked, which is why everything below pushes rather than pulls):

    scp elkin@192.168.51.226:/home/elkin/Conspiracy-Files/tools/*_log.ps1 .

Then, in PowerShell on the play machine, pick one:

    .\stream_log.ps1     during play - a full copy every few seconds, Ctrl+C to stop
    .\push_log.ps1       after quitting - one copy, once

Streaming is the better default: a question can be answered mid-session instead
of after. Each send is a complete copy, so it may be started at any point and
nothing is missed.

On the development machine:

    tools/fetch_logs.sh --live       watch a session arriving now
    tools/fetch_logs.sh --incoming   read what was pushed

Both land in `dev/playtest-logs/incoming/`.

### Two checks worth doing before playing on

**Is the log this session's?** `stream_log.ps1` says how long ago `console.txt`
was written. "1272 minutes ago" means the game is not running and you are about
to stream yesterday.

**Did Steam actually deliver the build?** The log lines say which. New format is
`[CF] v=1 t=08:14 lvl=i ev=placed ...`; anything starting `[CF-G2]` or
`[CF-IDENTITY]` is a build from before 2026-09-10 and Steam has not pushed the
update yet. Playing on would test the wrong mod.

### If PowerShell refuses a script

`export` is bash and does not exist there; `.\script.ps1` only works from the
directory holding the script. Neither is worth debugging mid-session - the
one-liner below needs no file at all:

    scp $env:USERPROFILE\Zomboid\console.txt elkin@192.168.51.226:/home/elkin/Conspiracy-Files/dev/playtest-logs/incoming/console.txt

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

Two ways. Streaming is better when Claude is at the keyboard while you play;
pushing is better for an unattended session.

### Where the scripts live

Put both in the play machine's Zomboid folder, next to `console.txt`. That
folder always exists, always belongs to the account that actually plays, and
does not get cleared out the way Downloads does. Both scripts notice when they
are sitting next to the log and use that folder, so no argument is needed.

From the play machine, to fetch or refresh them:

    scp elkin@192.168.51.226:/home/elkin/Conspiracy-Files/tools/*_log.ps1 $env:USERPROFILE\Zomboid\

Re-run that whenever the scripts change here.

### Live, while you play

**Start the game first**, then in its own window:

    cd $env:USERPROFILE\Zomboid; .\stream_log.ps1

Every line arrives within about a second, so a question can be answered
mid-session. Ctrl+C stops it; a dropped link reconnects by itself and resumes
without resending what already arrived.

Order matters. PZ truncates `console.txt` when it launches, and a follower
attached across that truncation keeps reading the old handle and reports
nothing at all. Starting the game first also means the whole file belongs to
this session, including `[CF-SELFCHECK]` in the first seconds.

Claude watches it with `tools/fetch_logs.sh --live`, which reports whether the
file is still growing before anything else: a stream that died looks exactly
like a quiet game until you measure it.

### Live Lua from the development machine (eval)

For a debug single-player session where Claude needs to ask the running game
something, start the stream with `-Eval` instead:

    cd $env:USERPROFILE\Zomboid; .\stream_log.ps1 -Eval

It prints `EVAL IS ON` once. Each loop it also fetches
`dev/eval/inbox/cf_inbox.lua` from the development machine into
`Zomboid\Lua\cf_inbox.lua`. The game's `DevEval` module checks that file about
once a second and runs each new command once. On the development machine:

    tools/cf_eval.sh 'return getPlayer():getX()'
    tools/cf_eval.sh -f snippet.lua

The result or error comes back through the streamed log, normally within about
ten seconds. If nothing finishes in 30 seconds the script prints the log lines
after the command started, which is where a compile error's stack trace shows up.

- **Never start `stream_log.ps1` with `-Eval` in an attended acceptance
  session.** Acceptance runs with no injected helpers (takeover audit, P4-R44).
  Leaving the switch off gives the old behaviour exactly.
- It only works with `-debug`, in single-player. Without `-debug` the module
  registers nothing and reads no file.
- A command left in the inbox from an earlier session is ignored at game start.
  Each command runs at most once.
- It runs through `reloadLuaFile` because B42 mod Lua has no `loadstring`.

### After the session

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
