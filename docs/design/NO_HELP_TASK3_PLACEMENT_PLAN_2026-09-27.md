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
- **Decided in two stages.** Reading a vanilla map, or heading toward a place,
  decides *when* an area is chosen and which clues may go there — never
  *which* area a map points to, which is fixed by the map itself.
  The exact *spot* is fixed and saved before the player can get any signal
  about it — before coming within 16 tiles (the Search Mode icon radius; the
  hint's 3 tiles is inside that). After that, reloading changes nothing.
- **Where a set lands decides its lean.** Each set is written with a short list
  of kinds of place it may go and which theory it leans toward in each. The
  lean is saved with the spot.
- **It stands out.** A set only goes where it doesn't match what that place
  normally holds, so a searching player notices it.
- **Moves are quiet.** An unfound clue may move after some hours, only to the
  same kind of spot so its meaning survives, never once the Search Mode icon has
  shown it, and a set moves whole. Nothing is left behind at the old spot.

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
save growth (against `Validator.MAX_ENCODED_BYTES`, 1 MB) and the worst Pick
call; saved records must grow with areas visited, not days played, compacting
consumed clues to id, lean and area if needed.

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
| NH-D1 two contradictory conspiracies | step 3 Linter (both leans, rival reading per clue, every kind of area and spot hosts both); step 3 Pick test; step 7 (both leans per area, thinner-lean floor) | clues per lean, per area | `test/nohelp_pick.lua`; the per-area check on what is actually placed in a real world is owed by step 7 |
| NH-D2 hint, then search (Look it over as fallback) | step 2 tests (ground spot and set: one hint, one icon, one find); step 8 visible playtest | finds by search vs Look it over | `test/nohelp_found_how.lua`; the hint and icon on open ground and on a set still owe the visible playtest (step 8) |
| NH-D3 placed procedurally | step 3 Pick test (same inputs, same result; no map-read input); step 4 replay test | area sources | `test/nohelp_pick.lua`; the reload replay test is owed by step 4 |
| NH-D4 no maximum, a first-development cap | step 7 cap-off run, raise-the-cap save test, "stopped for another reason" failure; the cap exists only in `Pick.lua` | cap, and any other limit hit | `test/nohelp_pick.lua`; the cap-off soak and raise-the-cap save test are owed by step 7 |
| NH-D5 half or more are object sets of vanilla items | step 3 Linter (per clue, vanilla types); step 7 on placed *and* spotted, lost sets counted | set share placed and spotted | `test/nohelp_pick.lua`; the share among clues actually spotted is owed by step 7 |
| NH-D6 annotated maps included | step 4 trail fold-in and "read or not, same clue" test; step 7 every map destination holds both leans | trails started, clues per design | not yet written, due step 4 |
| NH-D7 vanilla mysteries detected and used | step 5 first citation, observer out of debug and saved; step 7 scene-anchored floor; step 8 timing spike | scene-anchored vs fallback | not yet written, due step 5 |

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
