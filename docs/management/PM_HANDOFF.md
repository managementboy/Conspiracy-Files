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

### Owner request, queued 2026-09-15: house numbers for the whole map (AD-10)

Raised during the Windows playtest of DEV-0.36.0: a found Riverside map showed
no house numbers. **Not to be built during a playtest.** The owner's position,
first agreed around 2026-09-14 and not started: compute addresses for the whole
Build 42.20 map **once**, ship them with the mod, and show the right numbers
wherever map knowledge reveals an area, including opening a found paper map.

Why it is missing today: `AddressMap.lua` scans only buildings inside
x10000-11500, y9000-11000, per save at game start, and numbering counts out
from one hard-coded Muldraugh corridor (x=10600, y=9750 in
`Generated/AddressIndex.lua`). The 2026-09-14 handoff says the design is in
`docs/design/KNOX_OS.md`; it is not - no design exists yet.

Already in place: labels are drawn only where `WorldMapVisited:isKnown`, so a
read paper map reveals numbers once the data exists. Street geometry for the
whole map is in the installed `streets.xml` (959 names); the installed
`regions.lua` names nine areas with bounds (Muldraugh, Riverside, Rosewood,
WestPoint, MarchRidge, Louisville, Jefferson, ValleyStation, LAA).

Proposed shape, for the PM to schedule:
1. Scan every building once on the Linux machine in the real game (existing
   filter: no basements, garage/shed-only excluded), exported to a file.
2. Number per town, each with its own baseline street, chosen automatically
   and listed for the owner to check.
3. Ship the result as generated data beside `AddressRoads.lua`; no per-save
   scan, no ModData address book, no save-budget cost.
4. Unit tests for numbering, a Linux autotest check, then an attended Windows
   check opening a Riverside paper map.

Open for the owner: saves that already froze a Muldraugh book - recommended
that new saves use shipped numbers and existing saves keep theirs.

### Owner request, queued 2026-09-15: a finished case's evidence says so

Seen in the same Windows playtest. After all five clues of case
`generated:644725171` were found and noted (14:46, "Case complete; placement
details retired"), the owner found "Ledger note / BF-294" and "Ticket: Delia
Mercer" in the same house and could not log them. They are the case's own
evidence, already FILES #2 and #3 - nothing new. But the right-click menu shows
**no** Investigation option at all, which reads as broken.

Cause: retirement drops `root.assignments`, so `R.subject(item)` in
`GeneratedRuntime.lua` returns false and `GeneratedMenu.fill` returns before
adding anything (`GeneratedMenu.lua:18`). The Evidence category survives
because it is on the item. Wanted: a finished case's evidence shows it is already
recorded (e.g. a greyed "Already in the organiser"), from a retired root's
document ids and the item's `cfGeneratedId`. Small; needs a unit test that a
retired root's evidence gets the disabled option and an unrelated item gets none.

**Owner, same session: "We should change the category to Evidence / Old".** A
finished case's evidence changes its inventory category from `Evidence` to
`Evidence / Old`, so the list itself tells the player the item belongs to a
closed case. This is the owner's chosen signal; the greyed menu option above is
secondary. It must hold across save/reload like the existing category fix
(stamped at creation, relocation and load), and apply to the evidence of any
retired case, including ones already retired in existing saves. Record as a decision.

### Owner request, queued 2026-09-15: build P4-R113 "What do I make of it?"

The owner reached a case's end in play and asked what comes next: "I remember
we wanted to ask the player". Decided in `DECISIONS.md` P4-R113, not built
(no code references it). Today a completed case asks nothing; the next case
arrives on a timer, `AutomaticInvestigations.config.minGapHours=24` after the
previous case was created, anchored near the player, unsteered.

Open before building - put these to the owner first:
1. When is it offered: only at a case's end, or at any time?
2. "Leave it cold" needs the cold state from `docs/design/COLD_TRAIL_AND_PULL.md`,
   which does not exist in code (no `cold` anywhere under `mod/`). Build that
   first (items 1-2 of that doc), or drop the option from the first cut?
3. Does the next case wait for the answers, or keep the 24-hour timer and use
   whatever has been answered by then?

The wallet click defect is closed (a stale drag flag, not nested panes; fixed
in 0.8.20, `checks/wallet_id.sh` passing since). Also open: the audit remainder in
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
