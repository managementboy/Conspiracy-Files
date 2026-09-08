# Project manager handoff — 2026-09-08

Written at the point development moved off the original Windows machine. Read
this, then `PROJECT_STATE.md`, `ROADMAP.md`, `DECISIONS.md` and `AGENTS.md`.

## The mod in one paragraph

Conspiracy-Files generates investigations in Project Zomboid Build 42. It places
physical documents in real containers in real buildings, records what the player
discovers in a survivor's notebook, and links people, keys and places into
cautious interpretations. It never sets objectives, never announces a solution,
and never asserts a fact it only has a lead for. Vanilla Lua only; the domain
core has zero engine dependencies and is testable in plain Lua 5.1.

## State at handoff

`HEAD 0f4e596`, branch `integration/v0.1-corrected-candidate`, pushed.
Suite: **53 tests, 0 failures**, plus **61** standalone tests. All shipped files
compile under the engine's own compiler.

**The deployed build is older than the repo.** Both report
`DEV-0.8.12-selfcheck` because the version string was not bumped while
deployment was paused for testing - **do not trust the title bar to identify
what is running**. Bump it on the next deploy.

Built, committed, NOT deployed, all requiring a fresh save:
role/carrier evidence selection behind a generator revision bump; case
retirement (built *and* wired); eight notebook UI improvements; the
evidence-pickup voice line; corpse outfits as observed leads; room-aware
placement.

## Verified in play

Discovery-ledger ordering across evidence, identity and connection sources.
The full person -> key -> building chain, deriving a connection and rendering it
as a notebook entry. Clue hints with speech, halo text and sound. Identity
observation in the default merged loot view.

## NOT verified in play - do not treat as working

`observedKeyDoor` with a vanilla residence key and its named voice line;
reachability gating and basement placement; stale clue relocation (needs 72 game
hours); notebook window memory across a quit; and everything in the undeployed
list above.

## Next planned work

Phase 3 of `docs/design/USING_GAME_ASSETS.md`: **more roles**. Four of six roles
still permit exactly one carrier and the first three documents of every case are
fixed, so a case has far fewer shapes than the carrier count suggests. Roles are
free in save terms - `MAX_EVIDENCE` caps a case at seven documents regardless.
Phase 4 is broadcast anchoring against the game's 1.16 MB radio corpus.

Also open: the wallet click defect (narrowed to nested container panes, with a
diagnostic ready to name the failing check), and the audit remainder in
`docs/management/AUDIT_2026-09-07.md`.

## Rules that are not negotiable

- **A lead is never proof.** An ID on a body, a key in a pocket, an outfit - all
  are leads. The notebook records them and refuses to conclude. Two disagreeing
  leads are a feature, not a bug to resolve.
- **Never delete, reset or rewrite a player save.** Before 1.0 a fresh save may
  be required (P4-R63); say so, never do it for them.
- **The player tests in game. Do not control their game.** Read `console.txt`;
  give them one-line console commands; never automate their play.
- **Engine call form.** PZ's Kahlua refuses a Java method invoked without a
  receiver. Always `obj:method()`, never `pcall(obj.method, obj, ...)`. This
  cost three defects in one day, two of them SILENT - the code logged success
  and the feature simply did not exist in play. See AGENTS.md.
- **Chronological order in the notebook is load-bearing.** Never reorder, group
  or renumber it.

## Lessons that cost real time

1. **A silent early return is a bug you cannot find.** Five separate debugging
   rounds were lost to code that failed quietly. Every gate a player can hit now
   logs why, throttled. Keep doing this.
2. **Green tests are not a working feature.** Nine defects in one day were found
   by the owner playing; zero by the suite. Plain-table doubles accept call
   forms the engine rejects - use `test/support/strict.lua` for anything
   standing in for an engine object.
3. **A module nothing requires may never load.** Three modules shipped complete,
   tested and called by nothing. `[CF-SELFCHECK]` at game start now names any
   expected module that did not load. Check it first, always.
4. **Verify an API against the installed game, never from memory.**
   `InventoryItemFactory` is not exposed to mod Lua; `instanceItem` is.
   `getOutfitName` gives a readable name where `getPersistentOutfitID` gives a
   number. Ten minutes of reading vanilla has repeatedly saved hours.
5. **A too-strict constraint silently stops the game working.** `MAX_ACTIVE=2`
   halted automatic case creation. `test/automatic_investigations.lua` catches
   that class; run it after any placement or scheduling change.

## Working method the owner expects

Delegate bounded implementation to one worker at a time with a compact,
concrete handoff; review and integrate the result yourself. **Verify what a
worker reports rather than filing it** - reports here have been wrong about
tests passing, about who made a change, and about a feature being wired.
Concise status updates. Commit completed work with a clear message.

If workers share this checkout, commit with `git commit -o <paths>`: a plain
`git commit` takes the whole index and will sweep another session's staged files
into your commit. That has already happened once.
