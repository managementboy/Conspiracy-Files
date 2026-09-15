# Reading a play session

Owner, 2026-09-10:

> I have a feeling that our logging for you to follow my play has become
> unstructured. Speed and reduced token usage on your side is also very
> important. Is there a tested way of doing this?

It had become unstructured, measurably: **twelve** private `log` functions and
**twenty-two** prefixes, two pairs of them the same thing under different names
(`CF-ID`/`CF-IDENTITY`, `CF-MARKERS`/`CF-MARKER-TEST`), no time on any line, no
case id, and lines like `Marked=` that name nothing. Each was the smallest
change at the time. Together they were twenty-two vocabularies.

## The tested way

**logfmt** - space-separated `key=value` - is the ordinary convention for logs
meant to be searched rather than read. Go's `log/slog`, Heroku and Grafana Loki
all emit it. It is not something invented here, and the alternative worth
considering (JSON lines) is heavier per line and harder to skim.

    [CF] v=1 t=08:14 lvl=i ev=placed case=3 doc=d4 room=kitchen

## Where the saving actually comes from

Not from shorter lines. A `key=value` line is slightly *longer* than the
sentence it replaces.

The saving is that the log already reaches this machine through
`tools/fetch_logs.sh`, so following a session is a **query** rather than a
paste:

    tools/log.sh -s              what happened, one line per event kind
    tools/log.sh placed          every placement
    tools/log.sh -c 3            everything about case 3
    tools/log.sh -e              errors and warnings only

`grep ev=placed` returns five lines where a person would otherwise read five
hundred. That is the whole design goal, and every rule below defends it.

## Noise: filtered at the source, not muted in the game

The engine can be told to shut up - `DebugLog.setLogEnabled(DebugType.General,
false)` is callable from Lua - and we deliberately do not.

`console.txt` belongs to the game and to the player. A mod that quietly turns
off the engine's own logging is how the cause of a crash goes missing three
weeks later, with no reason for anyone to suspect us. `General` also carries
real engine errors, so muting it to lose the texture spam would take genuine
failures with it.

Instead `fetch_logs.sh` filters on the PLAY machine, so a long session copies
kilobytes rather than megabytes:

    tools/fetch_logs.sh          ours, plus every WARN and ERROR
    tools/fetch_logs.sh --full   the whole file, engine chatter included

Measured on a real console: **487 lines to 48, a 90% reduction, with all 9
errors and all 39 warnings kept.** 82% of what it dropped was the engine
repeating "BLANK OVERLAY TEXTURE" once per floor sprite.

WARN and ERROR travel deliberately. The engine's own failures are how a mod
crash gets explained, and dropping them to save bytes would be saving the wrong
thing.

## The rules

- **One prefix.** `[CF]` on every line, so one grep finds the whole mod. A
  module is a *field* (`mod=identity`), never a prefix.
- **One line per event.** Newlines and quotes are stripped from values;
  anything with a space is quoted. A line that wraps is a line grep cannot find.
- **A closed event vocabulary.** `ev=` is what a reader greps for, so it is a
  fixed list checked at call time - a typo fails loudly instead of producing a
  line nobody ever finds.
- **Fixed field order**, with unknown fields appended in sorted order. A grep
  written today still works when a field is added tomorrow.
- **A format version** (`v=1`), so a future change is detectable rather than
  silently misparsed.
- **Debug is off.** `lvl=d` is for a session someone is actively investigating.
  A log left at debug is how this became unreadable the first time.

      ConspiracyFiles.logLevel("d")   everything, for one session
      ConspiracyFiles.logLevel("i")   back to the default

- **Game time, not wall clock.** A session is hours of game time in minutes of
  real time, and the reader's first question about any line is *when*.

## Adding an event

Add the id to `EVENTS` in `ConspiracyFiles/Log.lua` and use it. If you find
yourself wanting an id that means "something happened in my module", the module
already has a field for that - what you want is one of the existing verbs.

## What was deliberately not built

No log rotation, no file sink, no remote collector, no JSON. Project Zomboid
writes `console.txt` and `fetch_logs.sh` brings it here; anything more is a
second copy of a working pipe.

`ponytail:` prose messages still travel as `msg="..."` through `Log.message`.
Converting them to real fields pays where a field would be greppable
(`case=`, `doc=`); it is not worth doing to a line nobody queries.
