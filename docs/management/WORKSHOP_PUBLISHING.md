# Publishing to the Steam Workshop

Written 2026-09-08, when development and play moved onto two machines: this one
develops and publishes, the other subscribes and plays.

## Two things that do not exist

**There is no mod signing in Project Zomboid.** No key, no certificate, no
signature. Every Workshop item installed on the development machine was checked
and not one contains a signature, certificate or `.asc` file. A PZ mod is
`mod.info` plus a media tree. If something looks like a signing failure it is
something else wearing that costume; read the actual message.

**There is no Steam beta mod program.** Steam Playtest exists but is for games,
not Workshop items. There is no enrollment and no approval gate. What does the
job is **visibility**: publish the item unlisted, hand out the link, flip it to
public when it is ready. Same item, same ID, no resubmission.

## Visibility

`0` public, `1` friends-only, `2` private, `3` unlisted.

The publisher defaults to **unlisted**. It does not appear in Workshop search,
but anyone with the link - including you, on the play machine - can subscribe.
Private is stricter, and is unreliable for actually downloading a subscription,
which is the one thing this workflow depends on.

    tools/publish_workshop.sh --visibility 0    # when it is ready to be public

## One-time setup

    sudo apt install steamcmd
    steamcmd +login <your-steam-username>

**Do that login yourself, interactively.** It will ask for your password and
Steam Guard code. steamcmd caches the session afterwards, so the publisher runs
non-interactively with only the username. Never put a Steam password in a
script, an environment variable, a CI secret or a chat window; nothing in this
repo asks for one.

Optionally add `tools/workshop/preview.png` - the Workshop page image. Without
it the page has no picture, which is untidy but not blocking.

## Publishing

    tools/publish_workshop.sh --dry-run                     # build, show, upload nothing
    STEAM_USER=yourname tools/publish_workshop.sh
    STEAM_USER=yourname tools/publish_workshop.sh --changenote "room-aware placement"

The payload is built through `tools/package.sh --stage`, so the Workshop item is
the same require-checked tree as the zip and the local install. That check is
the one that catches a module existing only on one machine, so the publisher
deliberately has no path around it.

The first successful upload creates the item and writes its ID to
`tools/workshop/published_file_id`. **Commit that file.** Without it the next
publish creates a second, unrelated Workshop item.

## The two-machine loop

1. Develop here. `lua5.1 test/run.lua`, then `tools/kahlua/run.sh --parse-all`.
2. Bump `UI.VERSION` in `Notebook.lua`. It names the archive and the title bar,
   and it is the only in-game signal of what is running.
3. `STEAM_USER=... tools/publish_workshop.sh --changenote "<what changed>"`.
4. On the play machine, Steam pushes the update to the subscription. Enable the
   mod, start a **fresh save**, play.
5. Send back `console.txt` - `[CF-SELFCHECK]` first, then `[CF-LEDGER]`,
   `[CF-VOICE]`, `[CF-PERSON]`.

`tools/package.sh --install` still exists for testing on this machine without
going through Steam. Prefer it for a quick local check; use the Workshop route
when the other machine needs the build.

## Do not publish public yet

As of 2026-09-08 six features have reached a game exactly once and none is
verified in play: role/carrier evidence selection, case retirement, the notebook
UI improvements, the evidence-pickup voice line, corpse outfits as observed
leads, and room-aware placement. Unlisted is the right setting until
`[CF-SELFCHECK]` is clean and those have been played.

The fresh-save requirement must stay prominent in
`tools/workshop/description.txt`. A tester whose save is refused with
"unsupported generated case revision" and no warning writes the first review.
