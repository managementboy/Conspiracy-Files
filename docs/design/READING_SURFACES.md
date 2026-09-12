# Reading surfaces — handoff

Written 2026-09-12 for whoever picks this up next. It answers the four open
questions in `docs/management/WEEKEND_2026-09-12.md`, plus two the owner added:

> Why not both? [grouping by case *and* by place]
>
> And why not drop the "notebook" completely and replace it with a PalmPilot
> kind of device that our survivor has on him?

Read this top to bottom once. Work packages are ordered; each one ships on its
own and is worth shipping even if the next is never built.

## The idea underneath all of it

Today the mod has one abstract window that knows everything. Every question in
the weekend note is a symptom of that: a subtitle that describes our item list
rather than the survivor's knowledge, a hand held open so a panel will appear, a
game outfit id printed raw, a write that stalls because one window rebuilds the
whole case.

The direction is: **what the player reads is a thing in the world, and what it
says is only what the survivor earned.** The grouping question and the device
question are the same question asked twice. Both are answered by separating

- the **store** (one ledger, already exists),
- the **projection** (what a surface is allowed to show — `NotebookProjection`),
- the **surface** (a window today, a device and a desk later).

## Work packages

### WP1 — The place is remembered at discovery (answers Q2)

The subtitle shows the carrier item's name, so an employment record, a rent
statement and a public notice all read "Handwritten cover letter". Replace it
with where the thing was found, captured once.

- `shared/ConspiracyFiles/DiscoveryLedger.lua` — bump `M.SCHEMA` to 2, add
  `place=true` to `EVENT_FIELDS`, accept an optional `place` in `M.record`
  (may be nil), add `M.places(root)` mirroring `M.positions(root)`.
  **The validator is closed-world**: an unknown field fails `M.validate`, and
  `DiscoveryLog.root()` raises on a failed validation. Bump the schema in the
  same commit or every save breaks. No migration is needed (P4-R77).
- `client/ConspiracyFiles/DiscoveryLog.lua` — capture the place where the event
  is stamped, from `AddressMap.labelForBuilding(buildingId)`, falling back to
  `AddressMap.nearest(x,y,30)`. Never recompute it: a car that is later driven
  away must not rewrite history.
- `client/ConspiracyFiles/Notebook.lua` — in `generatedRows`, build `placeOf`
  in the same pass that builds `seqOf`, and put the place in the row summary
  and in a `FOUND` block in the detail pane. The carrier name is demoted to a
  detail line; it is the last fallback, so nothing regresses on old events.
- **Duplicate rows are the risk.** Four papers from one desk all read the same,
  and they sit next to each other. Add a tidying pass over the rendered set:
  rows sharing a subtitle drop the shared part and keep what differs.
- **"Unknown" must not be a place.** A missing place is no heading and no
  grouping, with a line in the survivor's voice in the detail pane. An empty
  string would herd every placeless entry under one enormous fake heading.

Done when: three documents from three places read as three different rows; four
from one desk read as four distinguishable rows; a placeless entry says so.

### WP2 — Two indexes over one store (answers "why not both")

Not two lists. The same rows, read two ways.

- A third toolbar button beside `self.journal` and `self.evidence` in
  `Window:refresh`, and a `self.section=="places"` branch in `Window:rows`.
- The place index takes the identical row list and groups by the place string
  stored in WP1. **A heading is earned, not printed**: it appears only where a
  place holds two or more entries. Everything else stays in discovery order
  with no heading. This is what stops the place view becoming an address
  checklist to sweep.
- A heading whose rows carry different case codes is marked: *this desk touches
  two cases.* That is a real finding, and it is the reason both groupings are
  worth having at once.
- Both views consume the same `rows` array with the same `row.id`, so
  `Window:showRow` and the unread marking need no changes.
- Decide what "the same place" means and write it down: building, not room, not
  container. Store the building id alongside the label so the grain can change
  later without rewriting stored events.

Done when: the case view is unchanged; the place view shows headings only where
something is actually collected; a cross-case heading is visibly different.

**Worth doing next, not now:** when a place first spans two cases, record that
crossing as its own event so it earns a discovery number and a spoken line. The
player finds the overlap rather than being shown it.

### WP3 — The outfit line says what a person would say (answers Q3)

`The body itself wore: goth` prints a game id. Two rules:

- A written line per known style: Goth → "a lot of black, chains, boots";
  Classy → "dressed for a funeral, or a party"; and so on for Punk, Redneck,
  Biker, Hunter.
- **Fail closed.** Any id not in the table prints nothing at all. A future game
  update must never be able to put a new word in the survivor's mouth.

Done when: the six known styles read as sentences, and an invented id produces
silence, proven by a test that passes a nonsense id.

### WP4 — The papers stop owning a hand (answers Q1)

The papers sit in the off hand only because the game opens a container panel
only for a held item.

- Ship them in the bag. The notebook's open action borrows the off hand:
  remember what was there, equip the papers, open, and restore on close.
- Every step through the game's own timed actions, never by setting hand slots
  directly, so it is animated, interruptible and save-safe.
- **The failure paths are the work**, not the happy path: a full bag, an
  interrupted unequip, a two-handed weapon, and the container button vanishing
  from the panel the instant the item moves. A failed put-away must leave the
  papers in hand and say so in the survivor's voice, never on the ground.
- Build `stow()` first and drive it from the debug console before wiring it to
  anything automatic. Watch what the game does with a full bag.
- The fallback, if this proves ugly: hand-hold on the first load of a save only,
  released for good the first time the player closes the panel.

Done when: a fresh survivor spawns with both hands free, opening the papers
works, closing restores what was held, and a full bag cannot lose them.

### WP5 — Find out what the 12 ms is before changing anything (answers Q4)

Time the four parts of a discovery write separately on the real machine: the
raw save write, the map mark, the ledger index, the full-case re-validation.

- If re-validation dominates, which is likely, the fix is a `validateDelta`
  that checks the new entry and its edges while playing, keeping the full
  rebuild for load, where a pause is invisible. No queue, no new state.
- Only if the cost is spread evenly is a deferred write queue worth it, and
  then it needs a journal: the notebook must never show a discovery the save
  cannot reconstruct. Note that the game serialises saves at its own save
  points, so the honest promise is "nothing is lost past the last save".

Done when: the split is measured and logged once per discovery, and the chosen
fix is proven with the same measurement.

### WP6 — A heading has to be walked into (the owner's provocation)

Added 2026-09-12 after the owner asked how to develop it: *the player's own
movement is the index; never print a heading the player did not create by
going back.* This refines WP2 rather than replacing it — WP2 groups, WP6
decides which groups deserve a name.

**Three moves, all small.**

1. **The stamp is intent, not position.** Record the place when the player
   OPENS their notes there (`UI.open` in `Notebook.lua`), and when a discovery
   is recorded there (`DiscoveryLog.record`, which WP1 already touches).
   Opening your notes somewhere means you were thinking about that place. It
   also sidesteps the debug teleport hole, which fires no movement event.
2. **A return only counts if something changed.** Store, per place, the highest
   discovery number at the time of the visit (`highestDiscoverySeq()` already
   exists in `Notebook.lua`). Same number on the next visit means the player
   learned nothing in between: the visit is swallowed, silently. A higher
   number means a real return, and the count goes to 2, 3, 4. Pacing a doorway
   earns nothing; coming back after you learned something earns everything.
3. **The count writes the heading.** "again", then "third time now", with the
   address appended only from the third visit, when the player has shown they
   care which house it is.

**Where the data lives — and where it must not.** Visits do NOT go in the
discovery ledger. It is closed-world (`KINDS` admits evidence, identity and
connection only), capped at 512 events, refuses duplicate references, and
raises rather than degrades when validation fails. Visits are orders of
magnitude more frequent than discoveries; putting them there would burn a
case's entire history in one afternoon. Keep a small bounded table in player
save data beside the existing seen-sequence bookkeeping: `{place = {seq, n}}`,
around two dozen keys, evict the lowest.

**Worth one ledger event, though:** the moment a place reaches two, record it
as a `connection`. References are unique, so it can fire only once per place.
That gives the return a discovery number, a place in the true chronology and a
spoken line — the player *finds* that they keep coming back, rather than being
told.

**The empty case is the feature.** In the first hour, nothing has earned a
heading and the place view is flat. It must not look broken: one line in the
survivor's voice saying nothing has been worth going back to yet.

Done when: a walked loop through one house twice with no discovery in between
logs "swallowed"; a search followed by a return logs "minted, n=2"; and the
place view stays flat until then. All three provable unattended with
`tools/autotest/pz.sh`.

**Build it as observation first.** Before any UI: `DiscoveryLog.visit()`, wired
only to notes-opening, logging the place, the stored number, the current
number and the verdict. Read the log from a real session. If real play does not
produce returns, the whole idea dies cheaply.

#### Two further ideas, not scheduled

- **The route, not the place.** Three frames independently proposed making a
  walked path the unit — "the way down Cortman", with places as stops. It is
  harder to fake than a revisit and closer to how people describe habits. The
  cheap probe: in the existing `trackVisited` task, keep the last building id
  and log a line whenever it changes. Then read a real session and see whether
  repeated ordered pairs exist at all. Risk: a player who drives produces pairs
  with nothing in between, and naming a route is the closest this mod has ever
  come to a narrator.
- **Absence as information.** A place stopped being visited could earn
  "haven't been back to the warehouse since". Tempting, and dangerous: a faded
  row is indistinguishable from a lost one, and the notebook's own help text
  promises entry numbers never change. Rule if it is ever built: absence may
  change decoration only — never a row's existence, its number, or whether a
  search finds it — and it must be written as a line the mod ADDS, never as
  something it takes away. A two-week siege must not grey out a player's leads,
  so any threshold counts other places visited, not hours on the clock.

## The device — where the owner wants to go

Do not start here. WP1 and WP2 are the same idea in cheaper form, and they
teach us whether "where I found it" carries a case.

**Staging.** The window becomes the **desk**; the device becomes the **field**.
In the field you see little: the last few entries, one at a time, no
cross-references. The whole picture — both indexes, the connections — lives
where an investigator would really work: sat at a desk or a pinned board. Losing
the device costs the field view, never the case.

- **Step 1 (pure Lua, deletable in one commit):** give
  `NotebookProjection.evidence` and `.journal` a surface argument, default
  `"desk"` (today's behaviour unchanged), plus a `"pocket"` projection that is a
  trailing slice with leads and connections stripped. Test it. No item, no
  world menu, no UI.
- **Step 2:** the existing Papers become the field surface. Nothing new to
  build, and it tells us whether a thin field view is pleasant or annoying.
- **Step 3:** the desk. A world-object context menu option on a desk, table or
  corkboard, defined by capability (a container plus somewhere to sit), never by
  a list of sprites.
- **Step 4, only if the earlier steps land:** the device as a real item.

**On the device itself.** A PalmPilot is 1996; the game is July 1993. The
period-correct object is a pocket electronic organiser (a Casio SF-series
digital diary), a micro-cassette dictaphone, or a Filofax. The organiser has a
large hidden advantage: base it on the game's radio item type and the battery,
the on/off state, the "insert battery" menu and the save round-trip all come
from the game for free — and because it genuinely is a radio underneath, a
variant could receive the Dead Air broadcast. That is the mod's name arriving
in the player's hand.

**The rule that keeps it safe: the device is a reader, never the record.** The
survivor's findings stay in the ledger. Lose the organiser, lose the convenient
view; find another, and the case is there. Anything else makes a dropped item
a silently unplayable mod.

**A found stranger's organiser** is the best content this unlocks: someone
else's notes, in their abbreviations, never merged into yours, never feeding
any conclusion. It is testimony, and evidence about a person, not a solution
key. Write those rows as partial, compressed and sometimes wrong, or it becomes
a spoiler table.

## Risks worth stating once

1. **The player who never sits down.** Zomboid rewards nomads. If the desk is
   the only place the case can be understood, the mod quietly stops working for
   half its players. The field view must always say what it is not showing and
   where to see it.
2. **Two surfaces is two surfaces forever.** Everything after Step 1 doubles the
   UI we maintain. The projection must stay the only thing that decides what a
   surface may say.
3. **Grouping hides as much as it reveals.** A place index that prints a heading
   for every container is noise wearing the costume of structure.
4. **The schema bump in WP1 is load-bearing.** Adding a field to the ledger
   without bumping the schema breaks every save silently.

## Still the owner's call

- Does the device replace the window, or does the window become the desk? This
  handoff assumes the second.
- Does a lost device cost anything at all beyond convenience?
- Should a heading appear for a place with one entry, ever?
