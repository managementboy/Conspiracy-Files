# CF: No Help — task 3 plan: rule-based placement on the generated engine

2026-09-27, second version. Plan for review; no code changed. Replaces the
first version of the same day, which assumed every clue was written and was
found by opening a container. Produced via two `/adhd` runs and the owner's
answers in between; every engine claim below was checked against the code.

Governing decisions: **DR-20260927-NOHELP-RULE-PLACEMENT** (content authored,
placement by rules during play, hundreds of clues, generated engine, unfound
clues may move, placed anywhere interesting, moves are silent) and
**DR-20260927-WORLD-KEEPS-EVERYTHING**. Discovery is P4-R132's Search Mode
(`docs/design/SEARCH_TO_FIND.md`). Design source of truth:
`NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md`.

## 1. The shape in plain words

- **Two conspiracies, named.** Every clue leans toward **Containment
  Cover-up** or **Agricultural Program Malfunction**. These are new lean ids;
  the older pair in `Generated/ConspiracyPair.lua` belongs to the original
  engine and is not reused.
- **Found means spotted.** A clue is found when the game's Search Mode
  (the Investigate Area window) spots it, or through "Look it over" if it was
  picked up without searching. Picking an item up is not finding it.
- **Two kinds of clue.** A *written* clue (note, receipt, photo) says
  something. An *object* clue says nothing alone, so it comes as a **set**: 2-4
  ordinary things placed together that only make sense side by side. At least
  half of all clues are object sets.
- **A set is one clue.** It is one record, lives in one spot, is spotted as one
  icon and moves as one unit. Whenever a set is found, all of it is there. If
  the player takes one piece, the rest simply stays as ordinary items; nothing
  tracks that.
- **Anywhere interesting.** A clue can be in furniture, a mailbox, a vehicle,
  on a body, or lying in a garden, a doorway, a porch, a roadside. The player
  never sees it until they search; the hint over the character and the Search
  Mode icon are the only signals.
- **Vanilla decides where.** Areas come first from what vanilla already
  points at: the places marked on vanilla annotated and stash maps (13 already
  reviewed in `MapMediaDestinations.lua`) and detected vanilla story scenes.
  These are facts about the world, whether or not the player read the map.
  Clues go *next to* what vanilla built and never replace it. The address book
  of ordinary buildings fills in where vanilla points at nothing.
- **Both theories everywhere, with a cap.** Each area first gets one clue of
  each theory, then more up to a first-development cap per area and per
  theory, preferring whichever theory is thinner across the world. The cap is
  one named setting; there is no designed maximum.
- **At least half are object sets** — counted per clue, on what is actually
  placed, not only on the written list. Every piece is a real vanilla item
  type.
- **Decide early, create on arrival.** Reading a vanilla map, or heading
  toward a place, decides *when* an area is chosen and which clues it holds —
  never *which* area a map points to, which is fixed by the map itself. That
  decision is saved at once, so reloading never changes it. The objects
  themselves only come into the world once the player is within 40 tiles of
  the place, and only where the player cannot see them: a closed drawer,
  mailbox or car at any distance (nobody sees into it, and never one open in
  the loot panel); a loose clue on the ground or a body only on another floor,
  out of the player's sight, or more than 20 tiles away. Nothing sits at a
  place before the player comes.
- **At random within a place.** Which spot each clue takes is the world's
  seeded choice, the same after every reload. No side of the story is put
  nearer the door than the other, and no mark on a map is special for being
  first or last.
- **A searched drawer may hold one.** A clue is only ever seen through the
  hint and the inspection tool, so a container the player emptied earlier can
  still receive one. Only a spot that already gave up a clue is never used
  again.
- **Where a set lands decides its lean.** Each set is written with a short list
  of kinds of place it may go and which theory it leans toward in each. The
  lean is saved with the spot.
- **It stands out.** A set only goes where it doesn't match what that place
  normally holds, so a searching player notices it.
- **Moves are quiet.** An unfound clue may move after 3 in-game days, the
  same wait at every place (reading a map starts no timer), only within its
  own place and to the same kind of spot so its meaning survives, one move at
  a time, never once the Search Mode icon has shown it, and a set moves whole.
  Nothing is left behind at the old spot.

## 2. What exists and what changes

Checked in `mod-nohelp/common/media/lua/`:

| Piece | Today | Plan |
|---|---|---|
| `Generated/Generator.lua` | Builds a whole two-site case at runtime (`:663` exactly 2 locations; `:14` 3-7 evidence roles) | **Replaced** for No Help by `Generated/Pick.lua` |
| `Generated/Session.lua` `createDistributed` (`:587`) | Binds each clue to a live-checked container; one item per clue; targets are fixed container, mailbox, vehicle part, or corpse | **Kept**; gains **sets** (several items per clue) and a **ground spot** target |
| `ClueSearch.lua` / `ClueSearchRules.lua` | Search Mode icon at 16 tiles (`ADD_RADIUS`), light decides spotting; one icon per clue id; "spotted" kept in memory only | **Changed**: ground spots, "spotted" **saved**, how each clue was found (search or Look it over) **saved** |
| `ClueCue.lua` / `ClueCueRules.lua` | Wordless hint at 3 tiles, only where the survivor could see the spot; `present()` (`:48-63`) only finds clues in a container or vehicle | **Changed**: must find ground spots and sets, or they never get a hint |
| `MapMediaRuntime.lua` + `MapMediaContent/*Stories.lua` | Live in No Help: reading one of ~125 vanilla annotated/stash maps starts a trail of up to 4 placed documents, the last at the map's own destination. Trail content leans to neither theory, and its seed is `ZombRand` at the moment of reading (`:170`) | **Folded in** (§4 step 4): seed from the world, not the read; the trail's clues come from Pick |
| `StaleClue.lua` | Moves an unfound clue after `RELOCATE_AFTER_HOURS` to the first unvisited site; only if exactly one matching item is present | **Kept**, with four new refusals (§4 step 6) |
| `MapMediaRead.lua` | Detects a vanilla map actually opened | Decides **when** a marked area is chosen |
| `MapMediaDestinations.lua` | 13 reviewed rectangles from vanilla map marks | Decides **which** areas vanilla points at |
| `VanillaSceneRuntime.lua` / `Generated/VanillaSceneObserver.lua` | Recognises vehicle scenes only; debug only; not saved | Saved, on outside debug, extended past vehicles (§4 step 5) |
| `Generated/ConspiracyPair.lua` | The original engine's own theory pair | **Not reused**; No Help's two leans are new ids |
| `Generated/AddressBook.lua` | Whole-map building list, labels only | Becomes the **location source** |
| `Mystery/` (`Ledger`, `Vocabulary`, `Linter`, `ShapeCard`, `DiversityGuard`) | Hand-authored mystery engine | **Hosts the clue list** and its offline checks |
| `NHShared/Placement.lua` fixed slice | Dead Air, 7 assets | Not extended; retirement is separate cleanup |

## 3. Hard rules this plan keeps

- What a clue means never depends on route or order; which clues a survivor
  meets may.
- A spot is saved before any signal about it can reach the player; reload never
  rerolls.
- Choices use world seed, site, what is already placed, and content/rule
  version. **Never** what the player read, carried, or believes. Map reads and
  heading decide *when* a choice runs, never *what* it returns — a test proves
  it (step 4). "The icon has appeared" is saved only as a refusal to move, never
  as an input to any choice.
- Nothing respawns a consumed clue. Moving an *unfound* clue is allowed.
- Scans bounded and never saved (T2); room categorisation advisory (T3);
  placement exact-once (T4); placed items may move through play (T5).
- Verification in the real game is visible, never `--hidden`.
- No multiplayer design.

## 4. Steps, in order

Each step lands with its own test before the next begins.

**Step 0 — ID-only inventory.** Placeholder ids for written clues and object
sets, each set's piece count and allowed kinds of place with their lean. No
prose. Enough to drive steps 1-4 and the offline check.

**Step 1 — Sets.** A clue record may list several items (default one). The
whole set goes into one target. `StaleClue.canRelocate`'s "exactly one item
present" becomes "every piece counted exactly once, none carried by the
player" — by stamp, never by item type. All pieces keep the clue's one
`cfPhysicalToken`; the piece number is a **separate field** (`cfPiece`).
Changing the token string would hide the pieces from Look it over, the hint
and relocation, which all match the token exactly; and the identity scan
(`GeneratedRuntime.lua:1925-1935`) marks two items sharing a token as a
permanent conflict, so it must count (token, piece) pairs first. Test: a three-item set is placed together and moves only while
complete, including with a vanilla item of the same type in the same container.

**Step 2 — Ground spots.** A fifth target kind next to vehicle and carrier: one
square plus a short spot label (garden, doorway, porch, roadside...). Test:
place a stamped item on open ground, save, reload, confirm the Search Mode icon
appears on the same square and that Search Mode spotting it counts as found;
picking it up without searching does not, until "Look it over". The hint
(`ClueCue.present`) and the icon must work for a ground spot and for a
three-piece set: exactly one hint, one icon and one found event per set. Each
find saves how it happened (search, or Look it over), so a playtest can see if
players bypass searching by looting everything.

**Step 3 — The clue list and the picker.** `Mystery/Manifest.lua` holds every
clue: id, written or set, pieces, allowed kinds of place with lean, and a text
reference for written ones, plus the rival theory's reading of the same clue
(design doc §2) — every clue names what it cuts against in the other theory.
`Linter` checks: at least half of clues are object
sets (per clue; a written clue on vanilla paper is still written); every piece is a vanilla item type listed in
`Generated/ObjectCatalogue.lua`; neither theory's evidence is only one kind;
every kind of area can host clues of both theories. `Generated/Pick.lua` is a
pure function: given an area and the placed list, it chooses which clues go
there and in what kind of spot, ordered by a hash of (seed, area, clue, content
version). It holds the lean ids (Containment Cover-up, Agricultural Program
Malfunction) and one `FIRST_DEVELOPMENT_CAP`, applied per area and per lean:
an area first takes one clue of each lean, then more up to the cap, preferring
the lean that is thinner across the world, and prefers object sets while the
placed share of sets is below half. Running totals per area and lean are kept
in the save so Pick never rescans the list. The old two-site case shape is
replaced by a **per-area contract** rather than faked. Test: a hand-built list
where one lean dominates still yields both leans per area, within the cap,
identically with or without a map-read flag, through `createDistributed`
unchanged.

**Step 4 — Areas, then spots.** Areas come from vanilla first: the reviewed
map-mark rectangles in `MapMediaDestinations.lua` and confirmed vanilla scenes
(step 5), then address-book buildings where vanilla points at nothing. A map
read or the heading decides *when* an area is chosen; the map's own mark
decides *which*. Stage one runs Pick and saves an `intended` record through
`Session`'s existing validated save. Stage two: before the player comes within
16 tiles, pick the exact spot from squares that pass a cheap check (exists,
reachable, outdoors or in a room with a window or light, not in a dense crowd,
not in a cell whose scene check is still pending) and save it. Test: kill the
game after stage one, reopen, confirm it replays once; confirm each map
rectangle yields the same clues whether or not the map was read.
The existing map trails are folded in, not run beside Pick: their seed becomes
a hash of (world seed, map design, content version) instead of `ZombRand` at
the read, their clues come from Pick, and every map design (~125), not only
the 13 outdoor rectangles, supplies an area. Test: reading the same map on two
different days, or never, gives the same clue at the same destination.

**Step 5 — Vanilla scenes.** Start with exactly **one** hand-checked vanilla
scene citation (round 3 of the handoff), recorded like a map rectangle, and
put it through Pick. Then extend the existing observer
(`VanillaSceneRuntime.lua` / `Generated/VanillaSceneObserver.lua` — today
vehicles only, debug only — so in real play it finds nothing — and not saved) to save what it confirms, run outside
debug, and later recognise building and zone stories from what they leave
behind. Clues go beside a scene and never replace or remove what vanilla put
there. A visible timing spike measures whether a scene is confirmed before a
walking or driving player gets within 16 tiles; if not, the spot falls back to
an already-checked cell. Every spot saves whether it sits beside a scene or
fell back, so the share can be counted and cannot quietly fall to zero.

**Step 6 — Moving.** Four refusals added to `StaleClue`: a clue Search Mode has
spotted never moves (saved flag, set once); a move goes only to the same kind
of spot with the same lean, else the clue stays; the target area must stay
within its cap; a set moves whole. Moves are silent. Test: a spotted clue is
never picked for moving, including after save and reload.

**Step 7 — Offline check.** A plain-Lua harness walks many seeded routes over
the map rectangles, curated scenes and address book, once with the cap on (as
shipped) and once off over many simulated days. It fails if: any area lacks a
clue of each lean; the thinner lean falls below a floor world-wide; placed
object sets fall below half on any route; a clue kind has no real place to go;
any theory is reachable only by reading a map; any map design's destination
lacks a clue of each lean within 16 tiles; object sets fall below half among
clues actually *spotted* (not only placed), counting sets whose ground spot
was found empty as lost; placement ever stops for a reason other than the cap
or the save limit; the scene-anchored share falls below its floor. A second
run writes a save at one cap and reloads it at a higher cap: Pick must keep
adding and moves must keep working. With the cap off it measures
save growth (*superseded: the owner later lifted the save limit, "no limit at all";
size is reported, never capped — `SaveBudget.lua`*) and the worst Pick
call; saved records must grow with areas visited, not days played, compacting
consumed clues to id, lean and area if needed.
*Built 2026-09-27 as `test/nohelp_playthrough.lua`; what it covers and what it
does not yet cover are in section 8, "Step 7 — offline playthrough check".*

**Step 8 — Save-window spike, then a visible playtest.** The game saves its
own data and the map separately, so "saved as placed, map never written" can
look like "the player took it". Measure the real window by force-killing at
intervals. Then a visible run at a vanilla map mark and a story scene: hint and
icon appear only after the spot is saved; spotting counts as found; reload
changes nothing.

## 4a. Every directive and what proves it

Owner directives, 2026-09-27. Tags are `NH-D1`..`NH-D7` (plain `D1` is already
used by older tests). Before any step's code, `test/nohelp_directive_trace.lua`
(modelled on `test/ci_contract.lua`) reads this table and fails the build if a
directive has no row, or a file named in its **Checks** column is missing or
lacks its tag. A row whose Checks say "not yet written, due step N" is
reported as pending rather than failing, so the suite's known red list is not
made longer; a directive only counts as covered once a real file is named.
Hardened after the phase 1 review: only this section's table is read; a
duplicate row fails; a check must be a file under `test/` or
`tools/autotest/checks/`; its tag must appear on a line of code, not only in a
comment; and a row may not name files and still say "not yet written".
Checks on the synthetic step 0 fixture prove the fixture is fair, not the
product, so they are never named here.
A debug-only readout (same gate as `ClueMarkers.lua`) shows the live numbers,
read from Pick's own saved totals, never recounted on the side; visible
playtests quote it.

| Directive | Proof | Readout | Checks |
|---|---|---|---|
| NH-D1 two contradictory conspiracies | step 3 Linter (both leans, rival reading per clue, every kind of area and spot hosts both); step 3 Pick test; step 7 (both leans per area, thinner-lean floor) | clues per lean, per area | `test/nohelp_pick.lua`; `test/nohelp_playthrough.lua` |
| NH-D2 hint, then search (Look it over as fallback) | step 2 tests (ground spot and set: one hint, one icon, one find); step 8 visible playtest | finds by search vs Look it over | `test/nohelp_found_how.lua`; the hint and icon on open ground and on a set still owe the visible playtest (step 8) |
| NH-D3 placed procedurally | step 3 Pick test (same inputs, same result; no map-read input); step 4 replay test | area sources | `test/nohelp_pick.lua`; the reload replay test is owed by step 4 |
| NH-D4 no maximum, a first-development cap | step 7 cap-off run, raise-the-cap save test, "stopped for another reason" failure; the cap exists only in `Pick.lua` | cap, and any other limit hit | `test/nohelp_pick.lua`; `test/nohelp_playthrough.lua` |
| NH-D5 half or more are object sets of vanilla items | step 3 Linter (per clue, vanilla types); step 7 on placed *and* spotted, lost sets counted | set share placed and spotted | `test/nohelp_pick.lua`; `test/nohelp_playthrough.lua`; a set whose ground spot is found empty is not yet counted as lost |
| NH-D6 annotated maps included | step 4 trail fold-in and "read or not, same clue" test; step 7 every map destination holds both leans | trails started, clues per design | `test/nohelp_map_sites.lua`; `test/nohelp_marked_area.lua`; `test/nohelp_trails.lua`; `test/nohelp_pick.lua`; `test/nohelp_area_runtime.lua`; `test/nohelp_playthrough.lua` |
| NH-D7 vanilla mysteries detected and used | step 5 scene table, matcher, first citation, scene runtime out of debug and saved; step 7 scene-anchored floor; step 8 timing spike | scene-anchored vs fallback | `test/nohelp_scenes.lua`; `test/nohelp_scene_match.lua`; `test/nohelp_scene_area.lua`; `test/nohelp_playthrough.lua` (one clue per confirmed scene); the visible live check (writer-only procedure) and a floor on the scene-anchored share are still owed |

## 5. Rejected along the way

- **Copies of the same fact as the backbone.** Works for writing, not for
  objects; redundancy comes from variety of clues, and moving handles clues
  nobody found.
- **Rules about container types.** The container barely affects being found;
  what matters is the kind of spot.
- **Leaving a sign where a moved clue was.** Owner: irrelevant in this game.
- **Rerolling by sleeping; choosing places by character traits; moving clues
  away from where the player searched.** Each lets the player, not the world,
  steer what exists.
- **Faking two-site cases to fit the old engine.** A permanent lie in `Session`.

## 6. Risks named, not solved

- **Loose items on the ground** can be moved or cleared by the game or other
  mods, leaving a saved spot empty. Step 2's test is the first check; a quiet
  re-place when a spot is found empty is the likely answer.
- **"Lit at some hour"** is a rule of thumb (outdoors, window, light fitting),
  not the game's own light reading; a powerless basement with a light fitting
  passes it and may never be spottable.
- **The per-area contract** may reach further into `Session` than it looks.
  Step 3's test exists to find out before wiring.
- **Vanilla scene timing.** Confirming a scene takes time after an area loads;
  a fast or driving player may get within 16 tiles first. Step 5's spike
  measures it.
- **Areas that suit one theory only** (a farm, say) cannot meet "both leans in
  every area" unless the clue list offers the other lean there too; the
  step 3 `Linter` check catches this before play, not during it.
- **Whether a set of plain objects reads as anything** can only be learned in a
  real playtest.
- **Authoring volume.** Hundreds of clues, each with a rival reading and a
  blind re-read, is the biggest cost in this plan.

## 7. Answered by the owner, 2026-09-27

1. **Map trails** lean: each trail's clues point to one theory or the other.
   Story direction for them is asked of the owner, not invented. Each world
   makes a random 1-20% of trails unreliable (pointing at the other theory's
   evidence), drawn from the world seed so reload never changes it
   (percentage confirmed by the owner).
2. **Scenes:** every area with a confirmed scene gets at least one clue beside
   it. If a scene is not confirmed in time, the clue waits for the next
   confirmed scene in the same area, and every wait is logged (area, how long,
   walking or driving) so the owner can see whether the timing works.
3. **No maximum:** once written clues run out, object sets are placed again as
   new copies. Pick and step 7's cap-off run must support this; "the list ran
   out" is not an allowed reason to stop.
4. **Cap:** `FIRST_DEVELOPMENT_CAP` is 5 clues per theory per area.
5. **Where the work goes:** the `nohelp-task3-plan` branch; the owner merges.
6. **Interesting places:** research place types (T3), places named on vanilla
   maps and flyers, and farms and checkpoints — see the DR.
7. **Bodies and spots:** a dead character's body does not attract new clues;
   a spot that gave up a clue is never reused.
8. **Real clues:** placeholders first; then proposed real clues go to the
   owner a few at a time.

## 8. Phase log, with the ADHD review after each phase

The owner asked for an `/adhd` review after every phase, added here.

### Phase 1 — directive trace gate and placeholder inventory (steps 4a, 0)

**Built:** `test/nohelp_directive_trace.lua`; the step 0 placeholder inventory
`test/fixtures/nohelp_inventory.lua` and its fairness check
`test/nohelp_inventory.lua`.

**Review** (regulator, competitor, 10-year-old; sized down for a small phase,
findings concrete enough to fix directly rather than deepen):
- The gate could be fooled: a tag in a comment, a duplicate row, the plan
  itself named as a "check", a pending row pending forever. **Fixed:** section
  4a only, duplicates fail, checks must be test files with the tag in code,
  pending rows name the step that owes them.
- The fixture was too even: set-or-written followed from place and lean,
  both leans always shared a spot, 12 sets reused 3 piece combos, the rival
  reading was free text. **Fixed:** mixed kinds per place and lean, spots
  differ by lean, 12 distinct sets including one with two of the same item,
  each placement names the other theory as its rival.
- **Carried forward:** fixture checks are not product proof and are never
  named in 4a. Step 3 needs data for "what a place normally holds" before the
  stands-out rule can be tested. Code reading for step 1 found the engine
  already places a clue as several items sharing one stamp and counts them
  against an expected number (`GeneratedRuntime.lua` placement and identity
  scan), so a set may reuse that path rather than needing a new one.

### Phase 2 — object sets (step 1)

**Found:** the engine already placed one clue as several different real items
sharing one stamp ("members", `GeneratedRuntime.lua` placement), and the
identity scan already counts them against the clue's own number, so the
"separate piece field" planned in step 1 is not needed for identity — two of
the same item in one set is already fine. The hint (`ClueCue`) and the search
icon (`ClueSearch`, keyed by clue id) already treat such a clue as one, in a
container. What the engine refused was *moving* one.

**Built:** an unfound object set now moves whole — every piece rebuilt at the
new place and every old piece removed — and only when all its pieces are still
there and the player carries none (`StaleClue.canRelocate` takes the clue's
count). Piles (many copies of one thing) still never move. Test:
`test/nohelp_sets.lua`. Both changed files pass the game engine's own parser.

**Not yet proven:** the move in a real world — plan step 8's visible
playtest. The old generator's rule that a multi-item clue holds 5-24 items
(`Story.lua`) does not fit 2-4 piece sets; it belongs to the generator that
step 3 replaces, and step 3's per-area contract must not inherit it.

**Phase 2 review** (3am on-call, competitor, remove-the-assumption):
- **Fixed — a set would never have moved:** the clue's count read
  `quantity` only, so a set stating no total counted as one and every move was
  refused. It now sums its pieces.
- **Fixed — a half-failed move split a set:** if the destination refused a
  piece, the pieces already added stayed. Now they are taken back out, and
  before anything is removed the destination is asked for room for every
  piece; no room leaves the set where it is, whole.
- **Fixed — No Help was never engine-parsed by the suite:**
  `tools/kahlua/run.sh --parse-all` now covers `mod-nohelp/common` too
  (293 files, 0 failures). The shipped suite's failures are the nine already
  on the known red list before this work; none is new.
- **Carried forward:** `test/nohelp_sets.lua` checks the mover by its source
  text; a stubbed run that counts adds and removes is better and is owed
  before step 6 changes the mover again. A recognised set's pieces all take
  the clue's title, and some wear words ("opened", "spent") are not applied
  on any creation path; per-piece names and wear come with authoring (step 3).
  The members format must be written down as step 3's contract. The move of
  a set is not visible to a watching player, because moves never run within
  the proximity guard — but a set should also stop moving once Search Mode has
  shown it (step 6), and that refusal is not built yet.

### Phase 3 — open ground and how clues are found (step 2)

**Built:** a clue may lie on open ground. `World.ground(square)` makes a
square answer the few questions the engine asks a container (its items are
the items lying there; it is never "already searched"; it always has room;
removal follows vanilla's own pickup), so placement, counting, the hint, the
search icon and relocation run on it unchanged. `Session.target` accepts a
ground target inside the site's footprint and driveway margin, carrying a
short word for the spot. The save now keeps *how* each clue was recognised
(search, look, opening, debug) — the playtest count owner directive 2 needs.
Tests: `test/nohelp_ground.lua`, `test/nohelp_found_how.lua`. All changed
files pass the engine parser.

**Not yet proven:** that Search Mode spots an item lying in a garden or on a
porch, by day and at dusk, and that the hint fires for it — the visible
playtest (step 8). Nothing chooses a ground spot yet; that is step 4.

**Phase 3 review** (speedrunner, regulator, biology):
- **Fixed:** a ground spot and the first piece of furniture on the same square
  shared one identity key (both indexes zero); ground now has its own key. The
  ground also answers `getSourceGrid`, which the map-marker code asks of a
  container.
- **Checked and not a problem:** Search Mode spotting does record "search"
  (`ClueSearch.lua:302`); a second copy on reload is already refused by the
  exact-once placement count; a plain pickup without searching correctly
  records nothing until "Look it over".
- **Carried forward:** "debug" finds must be counted apart from player finds
  in playtest tallies. Open-ground items can be cleared by the game or moved by
  play: the empty-spot case is step 6's. Two design ideas for the owner, not
  adopted: whether a dead character's body should become a place clues can
  turn up, and whether a spot where a clue was already found should never
  receive another.

### Phase 4 — the clue list's rules and the picker (step 3, first half)

**Owner answer:** an area gets a random 2 to 10 clues, fixed by the world.

**Built:** `Mystery/Manifest.lua` — the clue list's shape and rules (a clue is
written or a set of 2-4 vanilla items; each placement names the kind of
place, the spot, its lean and the rival it cuts against; at least half are
sets per clue; every kind of place and spot can host both conspiracies; every
kind of place has an object set for each conspiracy). The list itself is
empty until the owner directs the real clues. `Generated/Pick.lua` — the
picker, a pure function of world seed, area, clue list, content version and
what is already placed: one clue of each conspiracy before any second,
`FIRST_DEVELOPMENT_CAP=5` per conspiracy per area (defined only there), the
thinner conspiracy preferred, sets preferred while under half, written
clues placed once, sets placed again as new copies once written clues run out.
Test: `test/nohelp_pick.lua` (60 areas: both conspiracies everywhere, within
the cap, 168 clues from a 26-clue list, reading a map changes nothing).

**Two rule conflicts found by the test, and how they were settled** (the owner
may overrule):
- *Both conspiracies everywhere* vs *sets return only after written clues run
  out*: an area that would otherwise miss a conspiracy may take a new copy of a
  set early. A taken clue never comes back; a copy is a new instance.
- A place and conspiracy with only written clues can never be refilled, so the
  clue-list rules now require an object set for each conspiracy at every kind
  of place.

**Next (phase 5, step 3 second half):** the per-area contract that feeds the
picker's choices into the engine in place of the old two-site case generator.

**Phase 4 review** (competitor, game design, inversion):
- **Fixed:** the picker's order is now scrambled after hashing, so clues are
  not ordered by how they happen to be named; each part of a choice is
  length-prefixed and numbers are written as whole-number digits, so a large
  seed reads the same in PUC Lua and in the game; an empty world now starts
  with an object set (it started with a written clue on every world); an
  area that cannot reach its number reports how far short it is.
- **Settled (the owner may overrule):** a place short of its number takes
  copies of object sets already placed elsewhere, but only after every fresh
  clue for it is used, and never two copies of the same set in one place. So
  an area's number is only limited by how many *different* clues are written
  for its kind of place — a writing target: to reach 10, a kind of place needs
  5 different clues per conspiracy.
- **Expected, not a bug:** which clues a place receives depends on what was
  placed before it — the owner chose "decided as you play", and meaning never
  depends on route.
- **Owner answered:** written clues are not held back; many more written
  clues will be written, and volume keeps late game varied.
- **Carried into phase 5 (the engine contract):** the ledger of what is placed
  is its own saved record that only grows — retiring a case never changes it;
  an area is picked once, with the saved ledger, and that result is what is
  placed; each area records the content version it was picked with, and an
  area picked from an empty list is not "decided"; every placed copy gets its
  own id including its area and copy number; tokens and markers are keyed by
  area, never by a slot 1 or 2 of the old two-site case.

### Phase 5 — the per-area contract (step 3, second half): design

Mapped by a planning pass over the whole case lifecycle before any change.

**Shape.** One No Help *world record*: a normal Session root whose case has
kind `"nohelp-areas"`, saved as the store's `canonical`, never retired. Deciding
an area appends to it in one validated write: the area (id, kind of place,
source, content version, hour, first document, count, shortfall), its clues as
documents with ids `nh:<area>:<clue>:<copy>`, and the ledger Pick reads. One
root rather than one per area, because per-area roots would make the old
16-case / 4-active limits a hidden maximum on areas (NH-D4), and because
search, Look it over, the filler, identity scan and relocation already work on
a Session root unchanged. A separate store was rejected: it would mean copying
about a thousand lines of placement code.

**The five phase 4 requirements.** (1) The world record only grows: every
write is checked, and existing areas, documents and totals may never change or
shrink. (2) An area is picked once, from the saved ledger and world seed only,
and saved in the same write; a failed write saves nothing and a retry gives
the same answer. (3) Each area keeps the content version it was picked with;
an empty pick is not a decision. (4) Every placed copy has its own id. (5)
Tokens, markers and icons come from that id, which contains the area.

**Validation** replaces the old rebuild-from-seed check: every derived field
(ids, titles, counts, ledger totals) is recomputed from the documents and must
match; shapes are checked against the clue-list vocabulary; today's clue list
is never consulted, so a content update never breaks a save. The old 5-24
item rule for object scenes does not apply.

**When an area is decided, for now.** The existing nearby scan: each eligible
catalogued building near the player whose kind maps to one of the owner's
interesting places is decided in turn. Homes and other buildings map to
nothing and get no clues. Map-rectangle and scene areas come in steps 4-5.

**Found while mapping:** the identity scan counted a set without a stated
total as one item, which would have marked every such set a permanent
conflict (fixed first, below).

**Build order:** identity fix, content version, kind-of-place mapping →
the pure area record (`Generated/AreaCase.lua`) → Session support (validation
dispatch, spot-honouring placement, no expiry or retirement for areas, the
grows-only guard) → relocation within an area's own site → the runtime's
area mode → the poller → skipping the old person/key features for area cases.
Risks: every write copies the whole record several times (measure; compact
found clues before ~600 clues); the marker store caps at 64 records; the
T3 place mapping is coarse; ground clues wait until step 4 chooses spots.

**Phase 5 progress.** Built so far: the world record (`Generated/AreaCase.lua`,
`test/nohelp_area_case.lua`); the Session's support for it
(`test/nohelp_area_session.lua`): its own validation and organiser rows, an
area added in one write with its clues waiting at their own area, every clue
held to its own kind of spot (mailbox, ground, body, vehicle, furniture), no
expiry, never retired, relocation only within the clue's own area and to the
same kind of spot, and a write guard that lets the record only grow. Written
clues are carried on the engine's written kinds.

**Owner decision, save size:** no limit at all (DECISIONS.md). No Help's save
budget ceiling is removed; structural validation stays. Measured: 100 areas
hold about 280 clues in about 600 KB, growing in proportion to areas. The
freeze T1 measured for very large saves is to be watched in long playtests.

**Remaining in phase 5:** the runtime's area mode (decide nearby interesting
buildings through the existing scan, instead of generating cases) and the
poller that calls it; skipping the old person/key features for the world
record.

### Body IDs, keys and clothing — `/adhd` run and owner decisions

Five frames (game design, regulator, remove-the-assumption, ant colony, 3am
on-call), three deepened against the real code. **Chosen by the owner:** ID
cards as written clues on bodies with a person thread; keys that lead to clue
places; clothing as a soft hint. Not chosen: fake IDs.

**What already works:** a written clue carried on an `idcard` and placed at a
`corpse` spot passes the clue-list rules, the world record and the Session's
spot rule today; the filler places a plain vanilla ID card on a real body.

**To build (order):**
1. Clue list: an optional `person` id (never a name) shared by clues about one
   person; lint: one card per person and at least one other clue; written
   card text held to the card's short limit (`EvidenceKinds.fits`).
2. A body carrying an unfound No Help clue that goes missing: the clue is
   placed again elsewhere at the same place and kind of spot, instead of being
   dropped after three days (owner). A found clue disappears with its body.
3. A body chosen for our card must not already hold a vanilla ID; never a
   dead player character's body.
4. Before recognition our card reads like a vanilla ID card with its name.
5. Keys: the key observer's old case lookup is replaced by a lookup in the
   world record (a key whose building is a decided area); a key seen for an
   undecided interesting building may decide that area *earlier* (source
   "key"), never differently. Expected to be rare: most body keys open homes.
6. Clothing: a closed outfit-to-class table and a ranking among bodies already
   in reach at commit time; the committed outfit is saved; a world-fixed share
   prefers the rival's class so clothing never gives the lean away.

### Phase 5 — the runtime switched to areas; the old generator's runtime removed

**Built:** `GeneratedRuntime.lua` no longer makes up cases (2,750 → about
1,680 lines). On game start `R.bootstrap` creates the save's one No Help world
record (world seed drawn once and saved) and starts the address book and map
marks; every 120 ticks `R.decideNearby` scans nearby buildings (after the player
has moved 50 tiles or half an in-game hour has passed), maps each eligible one
to an interesting place, and adds it as an area with the clue list's current
version. The filler gives each waiting clue only a spot of its own kind.
Deleted: `AutomaticInvestigations`, `Trial`, `CasePerson`, `OpeningMemory`,
`OpeningMemoryStore`. Gone from play: the personal opening key, retired-case
evidence, the closing questions, connection voice lines. Test:
`test/nohelp_area_runtime.lua` (the real runtime under stubs: a new save gets
one world record and keeps it on reload; a police building becomes an area; a
house never does; nothing is decided twice; an empty clue list decides
nothing). Full suite: the same nine known failures as before, nothing new.

**Honest state:** nothing appears in play yet — the shipped clue list is empty
until real clues are written with the owner. The nearby scan reaches only
police, hospital, office, transmission and bookstore buildings; farms,
warehouses, government, checkpoints and map-named places come from the
address book, map marks and scenes (steps 4-5). Ground clues wait until a
scan offers ground spots (step 4). Still to remove: the old generator's own
files (Generator, Story, Premises, scenarios...), the rest of the old case
store, and Dead Air.

### Removal finished: the old generator's files and Dead Air

**Deleted (26 files):** the old case generator and everything only it used —
Generator, RetiredCase, Story, Premises, ConspiracyPair, RelayMemo, Calendar,
the seven scenario files and PersonalContinuation — and the Dead Air slice
(Runtime, the old Session, Placement, Content, Ids, ThreadState, Renderer,
Bindings, Version, init, ContextMenu). The Session and the case store are now
No Help world records only; Validator keeps only its structure and size
helpers. The mod is 261 files, all passing the engine parser.

**Behaviour to know:** a save that still holds an old generated case no
longer starts the clue system (No Help has never shipped; P4-R63, no old-save
compatibility before 1.0). A new save works. Some harmless comments and dead
branches that mention retired cases remain in ClueMarkers, LocalPerson and
PlayerVoice.

**Next:** the ID features chosen by the owner (keys, clothing, the unfound
clue on a lost body placed again), then step 4 (map marks and spots, including
ground spots) and step 5 (vanilla scenes), with the ADHD review of phase 5.

**Phase 5 review** (3am on-call, regulator, speedrunner):
- **Fixed — a dense town could stall the game:** every area added copies and
  validates the whole record; a scan now adds one area per scheduler step.
- **Fixed — a game update could freeze a save:** the record's validation no
  longer checks item types against the game's current catalogue (a missing
  type would have refused every later write); types are checked when a clue
  is chosen.
- **Fixed — winding the clock back:** it now restarts the wait instead of
  counting as time passed.
- **Built — step 6, moving clues** (owner decisions that had no code yet): the
  save records which clues the Search Mode icon has shown (never moved again)
  and which spots gave up a clue (never reused); relocation stays inside the
  clue's own area; a body that burns or vanishes returns its unfound clue to
  waiting so it is placed again, while a found clue is gone with it. Test:
  `test/nohelp_moves.lua`.
- **Checked, not a problem:** reloading gives an immediate scan, but a scan
  only decides *when*, never *what*; sites are decided in id order, which is
  deterministic; old saves with generated cases do not start (accepted).
- **Carried forward:** a future change to the world record's shape needs a
  migration, never a "stale" refusal; the 50%-sets share is a picker
  preference, proven only by step 7's harness on placed clues; a building
  whose every container was emptied is skipped until it has one again.

### Body IDs, keys and clothing — built (items 3-6)

- **Which bodies carry our card:** never one that already holds a named
  vanilla ID (the body's vanilla loot is rolled just before the check, with
  the game's own loot tables, exactly as opening it would), and never a dead
  player character's body (the living player is marked, and death copies the
  mark onto the body, so it holds after a reload).
- **Our card looks vanilla until recognised:** "ID Card: <name>" / "Business
  Card: <name>", set the way the game names cards, with no evidence stamp.
- **Keys:** a key whose building is a decided area gets a plain phrase in the
  key journal (e.g. the kind of place). Deciding a place *earlier* because of
  a key is carried forward: a key can name a building anywhere, and deciding
  needs the building's scanned storage.
- **Clothing:** 24 vanilla outfits (verified in the game's clothing file) in
  four classes; a body clue may carry a class hint; among bodies already
  found, a matching one is preferred, never waited for; the chosen outfit is
  saved. The rival-clothing rule needs the owner's table (question below).
Test: `test/nohelp_body_ids.lua`. Offline only; the in-game path needs the
visible playtest.

**Owner questions:** is filling a body's pockets a moment early (same contents)
acceptable; which clothing fits each conspiracy, for the rule that sometimes
dresses a body for the other side; does "farm clothing" include more than the
vanilla Farmer outfit.

### Annotated maps change the game — `/adhd` run and owner decisions

Five frames (game design, markets, speedrunner, biology, regulator), three
deepened against the code. **(Superseded: the owner later dropped the layout order and the clock — see "Rework after the owner's pushback".)** **Chosen at the time:** letdown in the layout, the promise
clock (3 days), zombies gather (after a live test). See DECISIONS.md.

**Build notes from the deepening:**
- *Layout:* depth = how far a candidate sits inside the site's bounds (outer
  band: mailbox, ground, vehicle; inside: furniture); for marks with their own
  point, nearness to the mark. The filler already has an unused ranking hook
  in `StorageChoices.choose`; ranking orders choices and never refuses. Risk:
  a partly loaded building can put the deep clue in the front room — hold the
  other-side clue until a fuller scan.
- *Clock:* the read hour is already saved (`MapMediaState` trails `at`); a
  site's staleness starts at the earliest read of any map marking it plus 3
  days; the trail seed becomes a hash of world seed and map, not a random
  draw at reading. Clues far away move when the player arrives, one move at a
  time.
- *Zombies:* the game's `addSound` (used by its own zombie-population debug
  tool) draws zombies to a point without any sound the player hears; a pure
  function of world seed, map, mark, hours since reading and unfound clues
  decides each hourly pulse; capped so waiting costs more but never makes a
  place impossible. First: a visible live test that it moves zombies in
  unloaded areas.

**Still to settle with the owner later:** what each trail's own words point
toward (story direction); marks decided far from the player have no observed
storage, so their furniture must be checked live.

### Step 4, part 1 — every map mark and flyer place is a clue place

**Built** (owner decisions above: every mark gets clues, a marked place leans
to its map with at least 3 clues and one of the other side, flyer places are
clue places now, what a mark holds is fixed by the world):
- `Generated/MapSites.lua`, a derived file (`tools/mapsites/build.lua`): one
  place per mark of the 125 map designs and per place of the 133 flyers, 257
  in all — the address-book building under the mark (same `t3:` id as the
  nearby scan), else a window of at most 44 tiles inside a reviewed rectangle,
  else a sixteen-tile margin around the point. Marks on one building merge and
  keep every map and flyer that named it. None excluded.
- `Generated/Trails.lua`: each map's lean (a **placeholder** even split by
  world until the owner gives story direction), this world's 1-20% share of
  unreliable maps (exactly that many, by rank), and the resulting favour.
- The picker takes an optional favour, a count of other-side clues and a
  minimum; a map place gets favour from its first map in static order, one
  other-side clue per map marking it, and at least 2 + maps clues. The area
  records `trail={designs, favour}`.
- The runtime decides a map's places when it is read and any map or flyer
  place within 100 tiles as the survivor comes near; the nearby scan leaves
  them to this path. A place decided from afar observed no storage, so any
  fixed furniture or vehicle is a spot there, still checked live; the filler
  leaves areas more than 120 tiles away until the survivor comes.
- The trail seed is a hash of the world seed and the map; a read without a
  world record is refused. The map system no longer places its own fragment
  and payoff documents (map state schema 4, no migration before 1.0).
Tests: `test/nohelp_map_sites.lua`, `test/nohelp_trails.lua`, and additions
to `test/nohelp_pick.lua` and `test/nohelp_area_runtime.lua`.

**Not in this part:** the letdown layout, the promise clock and the zombies;
flyer-only places are ordinary map-named places (no lean, the world's own
2-10); the clue list is still empty, so nothing appears in play yet.

### Step 4, part 2 — the letdown layout, the promise clock, open ground

**Built** (owner decisions under "How a read map changes the game"):
- *Layout* (`Generated/Layout.lua`): at a place a map or flyer leans, a
  spot's depth is its inset from the building's bounds (mailbox, ground and
  vehicle are the shallow outer band), or, at a point or window place with no
  building, its nearness to the nearest mark. The favoured side's clues take
  the shallowest spot, the other side's the deepest, through
  `StorageChoices.choose`'s rank (orders only, never refuses). The other
  side's clue waits for a fuller scan — at least 4 usable spots seen, or 8
  attempts — then takes the deepest seen; each wait is logged
  (`why=layout-hold`). A multi-mark map's (or flyer's) last mark is an exact
  tie: `AreaCase.trailFor` passes Pick `mode="tie"` for that place only (7
  places in the static list); Pick without it is unchanged.
- *Promise clock* (`StaleClue`): a map or flyer place's unfound, unshown clues
  may move only once the world clock passes both their own placement plus 3
  days and the earliest read of anything marking the place plus 3 days; a
  place nothing marking it was read stays still; unmarked places keep the old
  rule. Read hours come from the map state (`MapMediaRuntime.readHours`, maps
  and flyers), rebuilt when it changes. A shown clue is never offered as
  stale; relocation now only offers spots the Session would take (own kind,
  not held, not spent) and moves ground clues to ground.
- *Open ground* (`GroundSpots.lua` + `groundScan`): squares inside the site
  and its 12-tile band (at most 44 x 44), in the world's hash order, at most
  64 per attempt, the next attempt carrying on. Refused: spent or held spots,
  missing or wrong floor, no floor or solid, indoors with no window or light
  switch, within the 20-tile proximity guard, 4+ zombies within 6 tiles.
  Labels: doorway, yard, floor. The filler serves the areas within reach
  nearest first and logs each miss with area, clue and distance.
Tests (at the time; since removed or renamed in the rework): `test/nohelp_layout.lua`, `test/nohelp_clock.lua`,
`test/nohelp_ground_spots.lua`.

**Not in this part:** zombies gather (waits for its visible live test); a
flyer read does not yet decide its places at once (approach does); "roadside"
and "porch" labels (no cheap, verified fact); `IsoRoom:getWindows` is
verified in the game jar only, not in vanilla Lua; no visible playtest yet.

### Rework after the owner's pushback

The owner questioned step 4's letdown layout and promise clock
(DECISIONS.md, "Revised after an `/adhd` run on the owner's pushback"):
*"what does arriving late mean? No player is in a hurry in PZ"* and *"How do
you know the order of the marks? Why should this be relevant?"* An `/adhd`
run on that pushback led to these decisions, now built:

- **Decide early, create on arrival.** The decision is unchanged (the nearby
  scan, a map read and the 100-tile approach still decide a place and save its
  clues). The filler now creates nothing for a place until the survivor is
  within `R.ARRIVE_TILES` = 40 tiles of its bounds (it was 120, and only a
  loading limit). Inside that ring a closed container — furniture, mailbox,
  vehicle — may be filled at any distance, refused only while it is open in
  the loot panel; open ground and a body only on another floor, beyond the
  20-tile guard, or on a square the survivor cannot see
  (`StaleClue.outOfSight`; the square's `IsoGridSquare:isCouldSee` /
  `isCanSee(playerIndex)`, confirmed with `javap` on the Build 42 jar and used
  by vanilla `ISDestroyCursor`, `ISScytheGrassCursor` and foraging's
  `ISBaseIcon`; an unreadable answer counts as visible). Entering an area's
  ring queues one filler attempt for it at once, nearest area first
  (`arrivals`, checked every 30 ticks), instead of waiting for the regular
  pass every 120 ticks.
- **Looted drawers.** For a No Help area clue, `FixedContainers.fresh` no
  longer refuses a container the survivor searched earlier (filler, container
  scan, relocation and the placement job); an open loot window still refuses.
  Spots that gave up a clue stay off-limits (Session's spent spots).
- **No layout order, no last-mark tie.** `Generated/Layout.lua`, its rank,
  its hold (`why=layout-hold`) and Pick's `mode="tie"` with
  `AreaCase.trailFor`'s last-mark rule are removed. Spots within a place are
  the world's seeded choice as before; Pick without the removed arguments is
  byte-for-byte what it was.
- **No promise clock.** `StaleClue.clockStart`, `readAtBySite`, the runtime's
  read-hour table and `MapMediaRuntime.readHours`/`readStamp` are removed;
  every place's unfound clues may move 3 days after placement. Kept: shown
  clues never move, own place, same kind of spot, spent spots never reused,
  one move per attempt. The map state still records read hours as world
  events; nothing reads them for moves.
- **No dark rule.** `GroundSpots` no longer refuses a dark room (owner: the
  player's own light finds a loose floor clue, like foraging); the other
  ground rules stay.

Tests: `test/nohelp_arrival.lua` (new); `test/nohelp_clock.lua` (now `test/nohelp_move_wait.lua`) reduced to
the remaining moving rules; `test/nohelp_ground_spots.lua` (dark allowed,
out-of-sight spots near the survivor); `test/nohelp_area_runtime.lua` (the
arrival trigger, once per stay); `test/nohelp_layout.lua` removed.

**Not in this rework:** the nearby scan still decides a building only when
it has an unsearched container (`Storage.scan`), and a body the survivor
already searched still does not carry a clue (`Carriers`); zombies gather
still waits for its live test; no visible playtest yet.

### Step 4 review (regulator, 3am on-call, game design) and owner answers

- **Owner answers:** map places also fill when the player walks near (not
  only after reading); a place several maps share leans at random per world
  (was: the first map in the file list — an order no player sees); flyers can
  be unreliable too; a map marking a large area may have clues anywhere in
  that area, preferably near the map's own annotation marks.
- **Fixed:** a ground square not yet loaded (fast arrival) is retried later,
  not skipped; the shared-place lean; the decision record's contradiction
  ("fixed at world creation" vs "decided on read") — what is fixed at world
  creation is each map's side and whether it is unreliable; which clues a
  place gets is decided when the place is decided; leftovers of the dropped
  layout and clock in this plan; `test/nohelp_clock.lua` renamed
  `test/nohelp_move_wait.lua`.
- **Carried forward:** a crash between the world record's save and the map
  chunk's save (T4's known gap — the save-window spike in step 8);
  split-screen (a second local player) is outside scope with multiplayer;
  density — with 257 map places plus buildings, whether maps still feel like
  a pull is for the playtest.

### Step 4 review — a map marking a large area

**Owner answer built:** "a map marking a large area may have clues anywhere
in that area, preferably near the map's own annotation marks."
- `MapSites` kind `window` (at most 44 x 44 around one mark) is now kind
  `area`: the whole reviewed rectangle, or the box around a design's several
  rectangles. 11 area places, from 38 x 80 to 430 x 630;
  each keeps its map's own annotations and symbols as marks (`note=i`, taken
  from `catalogue.json` stamps inside the rectangles, now `notes` in
  `MapMediaDestinations`). Places 257 → 253: the second marks of two maps and
  one flyer now fall inside their area and join it. Areas also pointed to by
  a flyer are shared (a random lean); an area marked by one map only is not
  shared (see "each mark its own minimum" below). Which maps: the
  writer-only spoilers file.
- Placement stays bounded (`MarkedArea.lua`): open ground tries at most 64
  squares per attempt as before — 48 in growing rings (4, 8, 16, 22 tiles)
  around marks the world picks, 16 anywhere in the area; an unloaded square
  there is counted and passed over. Furniture: each attempt walks one window
  of at most 44 a side centred on a mark, cycling through the marks in a
  world-rotated order, then the rest of the area tile by tile; the cost per
  step is unchanged. The 40-tile arrival ring is measured from the nearest
  mark, not the rectangle's edge, so a 630-tile area does not "arrive" while
  everything near its marks is still unloaded.
- Found on the way: `Pick.hash` alone barely changes with the seed for a
  small modulus (which of 37 marks came out the same in most worlds);
  `MarkedArea` hashes twice. Other callers were not changed.
Test: `test/nohelp_marked_area.lua`; `test/nohelp_map_sites.lua` updated.

### Owner decision — each mark its own minimum

**Owner answer built (2026-09-27):** a big marked area (`MapSites` kind
`area`) that one map marks with m >= 2 of its own marks (`mark`, not the
annotation `note` points) gets 3 x m clues with m of the other side
(`Pick` `minCount`/`rivalMin`, unchanged), recorded as `trail.marks`. Each
clue gets a `mark` (`AreaCase.assignMarks`): marks and clues in a
world-seeded order, one clue of the other side per mark, the rest to the mark
holding fewest — so every mark has >= 3, one of the other side.
`AreaCase.validate` accepts the optional `mark` and checks the per-mark
minimum whenever the area holds it. At run time the clue's furniture windows
start each cycle at its own mark, and its near ground tries ring that mark;
the rest of the area follows as before. Today one map's area qualifies
(its marks 1 and 2); two other areas also have
a flyer, so they stay shared (random lean, no extra minimum, no own marks).
Single-mark places are unchanged.
Test: `test/nohelp_marks_minimum.lua`; `test/nohelp_area_runtime.lua` extended.

### Content intake — converter, anchors, clue gates, blind re-read receipts

**Built (2026-09-27)**, the engine side of the content-writer handoff
(`docs/management/NO_HELP_CONTENT_WRITER_HANDOFF_2026-09-27.md`, sections
6-7 and 9). No clue text was written; tests use placeholder tokens only.

- **Converter** (`tools/nohelp_content/convert.lua`, plain Lua 5.1 with its
  own `json.lua`): reads `content/nohelp/incoming/<ticket>.json`, checks each
  row (delivery schema, then `Manifest.validClue` with the authoring fields
  still on, which runs the clue-list rules, the anchor check and the gates),
  then `Manifest.lint` on everything accepted from other tickets plus this
  ticket's good rows. Rows that pass alone but break the merged list are
  returned together, marked `merged`. Accepted game fields go to
  `content/nohelp/accepted/`, authoring fields to `accepted/sidecar/`,
  returned rows with reason codes to `rejected/`; the derived clue file
  `NHShared/Mystery/Content/Clues.lua` is rebuilt from `accepted/` and
  `Manifest.clues` loads it (empty list when absent or empty). The terminal
  report is counts, ids and codes, never text. `validClue` now returns a
  reason code with every refusal and caps a set's text at 240 characters.
  Ticket rules: ids prefixed with the ticket; map, scene and unique tickets
  need anchors; person tickets are accepted or returned whole.
- **Anchor** (`Manifest.validAnchor`): `{map, mark}`, `{map, note}`,
  `{print}`, `{scene}`, `{scene, version}`, checked against `MapSites`
  (`ANCHOR_UNKNOWN`), and a map or flyer anchor only goes to the kind of place
  its mark is (`ANCHOR_SPOT_MISMATCH`); version A leans containment, B
  agricultural. A scene anchor is checked against `Generated/VanillaScenes`
  once it exists, and until then is accepted as unverified (the converter
  checks it against the writer-only scene list and draft table). Documents
  carry the anchor; `AreaCase.validate` checks its shape.
  **Placement decision** (`AreaCase.anchorPool`): with no anchored clue in the
  list, the picker sees exactly the list it always did (its output is
  unchanged); a marked place that some clue is anchored to takes only the
  clues anchored to one of its marks; any other place takes only clues with no
  anchor; a scene-anchored clue waits for scene placement (not built). The
  runtime passes each map place its marks' keys (`anchorsOf`).
- **Clue gates** (`Mystery/ClueGates.lua`, pure, called from `validClue` for
  rows carrying authoring fields — the derived file carries none, so nothing
  runs in play): provenance, rival reading, gloss; axioms naming both
  conspiracies (by shape until `content/nohelp/approved/axioms.json` exists);
  density (at most 4 proper-noun-like words in the body, at most 2 code-like
  words in title and body); emphasis (all-capitals words of 5+ letters,
  capitals in a row, `!!`, `?!`, `...?`, marked-up stress, a body ending on
  `!` or `...`); citations must be literal substrings of the vanilla flyer or
  map annotation text; reserved names (exact, Soundex, one letter away)
  against `Generated/ReservedNames.lua`, built by
  `tools/cluegates/build_reserved.lua` (writer/engineer only); the retired
  premise as salted hashes only (`tools/cluegates/retired_hashes.lua`).
- **Blind re-read** (`tools/cluegates/blind_reread.md`): the prompt for a
  different model, at least 5 independent runs per clue; receipts in
  `tools/cluegates/receipts/<clue id>.json` keyed by the SHA-256 of exactly
  the text the reader saw; `tools/cluegates/check_receipts.lua` reports
  missing, stale, one-sided and mostly-"neither" clues. The shipped test
  fails on any such clue once the list is not empty.
- Not done: the owner one-pager and drift report; scene placement (a
  scene-anchored clue is never placed yet); within a big area with its own
  marks, a mark-anchored clue is not yet pinned to its own mark
  (`AreaCase.assignMarks` spreads clues as before); the axiom and retired
  gates' term lists wait for stage 0.
Tests: `test/nohelp_content_convert.lua`, `test/nohelp_anchor.lua`,
`test/nohelp_clue_gates.lua`, `test/nohelp_receipts.lua`.

### Content handoff — two `/adhd` runs and what was built from them

**Run 1: the content writer's handoff** (regulator, competitor, logistics,
game design, remove-the-assumption; deepened: staged work orders, automatic
gates, the writer's brief). Converged: stage 0 first (frozen axioms and
one-line glosses signed off before any clue); clues delivered as JSON rows,
never Lua, with the rival reading written first; a clue is finished only when
automatic gates and a blind re-read by a different AI pass. Traps rejected:
one writer per conspiracy (a clue must read both ways by itself); a plain word
blocklist for the retired premise (paraphrase slips through). Found: clues
could not name the map mark or scene they belong to. **Built:** the writer
handoff (`docs/management/NO_HELP_CONTENT_WRITER_HANDOFF_2026-09-27.md`), the
converter, the anchor field and its use in placement, the clue gates, the
blind re-read prompt and receipts.

**Run 2: the handover to ChatGPT** (logistics, 3am on-call,
remove-the-assumption, competitor, ant colony; deepened: the repository as
memory, ADHD as a routine, rules against gaming "done"). Converged: the
repository is the writer's memory (STATE.md read first and written last, with
a baton); one progress line computed from the repo stands in for the goal
check; commits are one ticket each on `nohelp-content` with content-free
messages (the owner reads notifications and plays blind); "done" is only ever
a candidate until Claude countersigns. Traps rejected: the owner as a courier
for the writer's work (spoilers, and the owner does not curate); the writer
declaring itself done. The owner then said ChatGPT has the same ADHD skill, so
the handover gives triggers and a save layout instead of the method. **Built:**
`progress.lua`, `targets.lua`, STATE.md, the opaque ticket registry
(writer-only), the `nohelp-content` branch and its GitHub check (green), and
the handover (`docs/management/NO_HELP_CHATGPT_HANDOVER_2026-09-27.md`).

**Owner decisions in this phase** (DECISIONS.md): the owner stays unspoiled;
ChatGPT writes the clue text in our format; Claude builds the tools, owns the
scene list and signs off content; the owner does not curate; tone is the
original mod's fatalistic bureaucratic dark comedy, voice only the world's.

**Still open:** the scene list (unfinished work parked on
`nohelp-scenes-wip`); the offline playthrough check (step 7); the real-game
checks (step 8, visible, with the owner's go-ahead).

### Step 5 — vanilla scenes

**Built (2026-09-27)**, from the owner's decisions in DECISIONS.md ("Vanilla
scenes", "Which vanilla scenes hold clues"). Specifics (which scenes, where,
what they leave) are in `docs/writer-only/` only.

- **The scene table** (`Generated/VanillaScenes.lua`): all 140 vanilla scene
  kinds once. 124 hold a clue; 16 are refused: the 2 the owner left alone, 8
  with only animals and no vehicle, 4 with only a named zombie, the one class
  vanilla never builds, and generic house dressing. Party, meal, comedy,
  self-harm and killer scenes hold clues like any other. Each allowed kind
  has an anchor (in the scene's room, in its vehicle, on a body, or on the
  ground) and a fit to the two conspiracies, neither zero nor more than
  twice the other; which one a scene leans to is drawn per world. Never on a
  vanilla named character's body (their outfits are refused as carriers; a
  body with any ID already was).
- **The matcher** (`Generated/SceneMatch.lua`, pure): a scene is recognised
  from two traces of different sorts it leaves (room, tile object, item on
  the floor, body, zombie, vehicle). Signatures were read from the game jar
  for 8 kinds, at least one per family (building, dead survivor, road
  vehicle, zone); the other 116 are marked unverified and never match. A
  kind only matches when the running game's own story lists name it; a
  story's validity check is not called, because for a building it can alter
  the player's starting house.
- **In play** (`VanillaSceneRuntime.lua`, now outside debug; the old
  vehicle-only observer is removed and gates nothing): loading a square or a
  body only flags its 10x10 cell; the flagged cell nearest the survivor
  within 30 tiles is looked at, 100 squares a tick. The first match per cell
  is saved set-once in the world record (`scenes`); traces without a match
  are kept, so a scene emptied before it was confirmed still confirms and its
  clue keeps waiting. "scene-wait" start and end lines give the cell, the
  in-game hours, the distance and walking or driving.
- **One clue per scene** (`AreaCase.decideScene`): chosen when the survivor
  is within 100 tiles, from the clues anchored to that kind (one version per
  conspiracy where the scene has two), and created, like every clue, only
  within the 40-tile arrival ring in its anchor's kind of spot, never in a
  container holding the scene's own items. Independent of the place it
  appears in: counted apart, never offered to a place, so a place's clues are
  identical with or without a scene beside it.
- **The first hand-checked citation**, a unique scene vanilla builds in
  every world, is recorded like a map place (decided when near, no
  observation needed), its containers checked against the shipped container
  index.
- **Content:** the progress line now counts scenes (`scenes 0/124`); the
  scene tickets and the unique-scene ticket are open.

Tests: `test/nohelp_scenes.lua`, `test/nohelp_scene_match.lua`,
`test/nohelp_scene_area.lua` (includes the runtime against a stubbed engine);
`test/nohelp_anchor.lua` and `test/nohelp_content_convert.lua` updated for a
shipped table.

**Not done:** the visible live check (procedure written, writer-only; two
fresh worlds, never hidden, never the owner's save) — so whether a scene is
confirmed before the survivor arrives, walking or driving, is not measured
yet; signatures for the 116 unverified kinds; the step 7 floor on the share
of scene-anchored clues; no scene clue is written yet.

### Step 7 — offline playthrough check

`test/nohelp_playthrough.lua`, plain Lua 5.1, about 16 seconds on the
development machine. It loads the real picker, area record, place mapping,
trails, map places, marked areas, session, scene table, scene matcher, stale
clue mover and clue-list rules, and feeds them a synthetic placeholder clue
list (no clue text): every kind of place with both leans, sets well over half,
written clues, clues anchored to a sample of map and flyer places, and clues
anchored to a sample of scene kinds, plus one scene kind that holds no clue.

It walks seeded routes over the shipped map and flyer places: town and
country, on foot and driving, with map and flyer reads, nearby buildings,
scenes confirmed on the way, clues spotted, searched or looked over, and
several in-game days passing so unfound clues move. 12 worlds with the
shipped cap and 8 more with the cap lifted, one route each (20 worlds, every
route kind in both modes). Every loop is bounded and a runaway one, or a run
over 30 seconds, fails loudly.

It fails if: an area of two or more clues lacks a lean; an area holds fewer
than 2 clues, or more than 10 with the cap on; a lean goes over the cap in an
area; fewer than half of a route's place clues, of all placed clues, or of
spotted clues are sets; either lean goes over 60% overall; a written clue is
placed twice; two clues share a spot; a place stops short while a different
set for its kind of place and lean is still unused; a place a mark names
takes a clue not anchored to it, or an anchored clue lands elsewhere; a
confirmed scene gets anything but exactly one clue written for its kind, or
the no-clue kind gets one; a moved clue leaves its area or changes its kind of
spot; a shown clue moves, a spent spot is reused, or a move to another area is
accepted; a world's unreliable-map share is outside 1-20%; the save does not
write out, read back equal, validate and reopen at the end of every route; or
a save written at the shipped cap and reopened with it lifted does not take
more clues at new places and still move clues.

First run, counts only:

| | cap on | cap lifted |
|---|---|---|
| routes / worlds | 12 / 12 | 8 / 8 |
| areas (places) | 185 | 75 |
| scene areas | 71 | 36 |
| places a mark names | 5 | 2 |
| largest area | 10 | 14 |
| clues placed | 1187 | 800 |
| sets among placed | 73.2% (lowest route 56.2%) | 78.8% (lowest route 70.0%) |
| lean split | 50.0 / 50.0 | 49.8 / 50.2 |
| spotted or looked over; sets among them | 251; 66.5% | 168; 73.8% |
| moves; forbidden moves refused | 167; 117 | 112; 113 |
| largest save | 220 KB | 111 KB |
| worst area write (plain Lua) | 18.4 ms | 8.3 ms |

Reopened with the cap lifted, new places took up to 14 clues and a move
worked on all 12 routes. Unreliable maps per world: share 1-20%, which after
rounding to whole maps is 1.2-20.2% of all maps (a 20% world rounds to the
nearest whole map). No engine bug turned up.

Why it was slow before: nothing looped forever. Every session write copies
and revalidates the whole record, so one world cost about 6 seconds and the
first draft's 20 worlds in both modes, four routes each, ran well past two
minutes. The same cost is in the game: a write grows with the size of the
record (18 ms in plain Lua at 220 KB), which the step 8 playtest should
watch, since the game's Lua is slower.

**Not covered yet:** a set whose ground spot is found empty is not counted as
lost; there is no floor on the share of scene-anchored clues (no number has
been set); the save-growth measure is a plain-Lua serialiser, not the game's
own writer; the synthetic list is placeholder rows, so the real list's shape
still needs the same run once it is written.

### Phase review of steps 5 and 7 — `/adhd` (2026-09-27)

Frames: 3am on-call, competitor trying to break it, speedrunner, regulator,
biology (five isolated runs, 30 ideas). Question: what could still go wrong
before or at the first visible real-game test, and what should that test look
for?

Clusters: *seeing silent failures* (a reason log per placement, an abstain
counter, a canary for test worlds); *throughput and stutter* (save cost late in
a long game, scan budget under load, driving past scenes); *match correctness*
(a scene across a cell edge, ordinary clutter mistaken for a scene, a matched
place later changed); *persistence* (save and reload, loot respawn, kill during
a save); out of scope for now: multiplayer, clock jumps (already handled),
teleport tools.

Deepened (top three) and what came of them, each checked against the code:

1. **Driving past scenes.** No clue is lost: a waiting No Help clue never
   expires (`Session.expiredIds` returns nothing for the world record) and is
   created on the next arrival. But a long drive flags far more cells than are
   ever looked at, and the flag list was capped with no eviction — once full,
   new scenes stopped being noticed. **Fixed:** far flags are forgotten once
   the list is three quarters full (a forgotten cell is flagged again when its
   squares load again); tested with a full list.
2. **A scene across a cell edge.** A look that closes a match from earlier
   kept traces can lose the anchor's position and key the scene to the wrong
   cell, so one scene could get two clues. **Fixed:** the same kind already
   confirmed in that cell or a neighbour is the same scene; the test fails
   without the fix.
3. **Ordinary clutter mistaken for a scene.** Confirmed: for at least one
   verified kind both traces also spawn as ordinary vehicles and loot, so a
   parked car plus a stray item would "confirm" a scene that is not there.
   **Fixed:** a signature must include at least one trace only that scene
   creates (checked against the game's spawn tables and code); three kinds
   keep a verified signature, five are demoted to unverified (they never
   match until an exclusive trace is found). The two first-release scene
   tickets that pointed at demoted kinds were retargeted to verified ones,
   with new story glosses owed as a small stage-0 ticket.

Carried into the real-game test (step 8): watch for stutter when clues are
placed late in a long game; read the scene-wait log on a drive at walking,
driving and top speed; save and reload next to a confirmed scene; check that
ordinary clutter produces no scene.

### Step 8 — first visible playtest

The first real-game test with the window visible, on two new worlds (build
under test: c07e225). Counts only; no places, people or positions.

What passed:

- The world record is created once per save and survives save and reload
  unchanged (two reloads: 6 areas / 38 clues / 2 placed, then 7 / 39 / 3,
  identical before and after each).
- Nearby areas are decided from the survivor's position (5 to 7 areas per
  world in the first minutes), and one hand-checked scene area was decided
  and its clue placed.
- Clues are created on arrival at their area.
- Ordinary clutter (a parked car, a van with its own loot) did not confirm a
  scene; it stayed a pending trace.
- Walking and ordinary driving held frame times (driving run: max 69 ms, none
  over 100 ms).

The five bugs, and their fixes (each with a plain-Lua test that fails without
the fix):

1. **Engine stall at 32 or more clues.** One placement job per clue, every
   120 ticks, filled the scheduler's single 32-job cap, and every other job
   class queued after it in the same tick was refused: no new areas were
   decided and clues were placed only on arrival. Fixed: the cap is per job
   class in No Help's own scheduler copy (the original mod's is unchanged),
   and only clues still waiting to be written get a placement job, the walk
   resuming where it stopped so every clue gets its turn.
   Test: `test/nohelp_scheduler_share.lua` (0, 31, 32, 200 and 2000 clues;
   every job class runs every cycle).
2. **Search icons fought between the two mods.** Both used the same icon id
   prefix and the same icon table, so each mod's search removed the other's
   icon every 15 ticks and the spot timer never filled. Fixed: No Help has
   its own prefix and table; the original mod needed no change.
   Test: `test/nohelp_icon_isolation.lua`.
3. **Lua error at every world start** (three per start): a new world record
   has no clues yet and the person module read the first one unguarded.
   Fixed with a guard. Test: `test/nohelp_known_empty.lua`.
4. **The harness did not see No Help errors**: its error filter matched only
   the original mod's trace tag. It now matches both.
   Test: `test/nohelp_mod_errors.lua`.
5. **A 640-715 ms stutter at the first area decision.** Opening the shipped
   furniture index checked the whole map (3.4 MB of encoded rows) in one
   scheduler step. Fixed: opening checks the header only; each building is
   checked when it is first read (first open ~31 ms to under 1 ms in plain
   Lua). Test: `test/nohelp_fixed_index_open.lua`.

Smaller: after a reload a scene cell already waiting logged a new wait start,
which skewed the wait timings; it now resumes from the saved hour (tested in
`test/nohelp_scene_area.lua`). One vehicle scene leaving several pending cell
records is left as is.

The next visible run must re-check:

- placement keeps going after 32 and more clues (new areas keep being
  decided; the scheduler's per-class step counts keep rising);
- a ground clue's hint and its find, with the search icon filling;
- driving at top speed past scenes;
- the frame spike when the game saves;
- stutter late in a long game: every area decision still copies and validates
  the whole world record, so its cost grows with the record.

### Next phase planned — `/adhd` (2026-09-28)

Frames: logistics, inversion, 3am on-call, game design, ant colony (30 ideas;
three deepened against the code). The result is the check-off list
`docs/management/NO_HELP_DEV_CHECKLIST_2026-09-28.md`: A late-game cost, B
reload guard and proof gaps, C content-blind state dump, D real game, E content
tooling. Checked in the code while planning: every write is linear in the whole
record (`Session.lua:541-548`) and the duplicate-area check is quadratic
(`AreaCase.lua:406`); a clue interrupted between "placing" and the map being
written is marked unknown and never placed again (`GeneratedRuntime.lua:283`),
which is put to the owner (checklist, "Open for the owner").
