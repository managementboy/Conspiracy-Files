# CF: No Help — handoff for the content-writing AI

2026-09-27. For an AI that will write the clues for "Conspiracy Files: No
Help". Shaped by an `/adhd` run (regulator, competitor, logistics, game design,
remove-the-assumption; three ideas deepened against the code). Read this whole
document before writing anything. You write **content only**: the engine,
placement and rules already exist and are not yours to change.

> **Status of the tooling this document relies on.** Parts are built, parts are
> not yet. Each section says which. Section 9 lists what must be built before
> work orders beyond stage 0 are handed out.

## 1. What you are writing, in one paragraph

A Project Zomboid mod where two contradictory conspiracies explain the Knox
outbreak, and the mod never says which is true. You write the **clues**: small
authored pieces of evidence the game places procedurally around the world.
Each clue is either a **written** clue (a note, receipt, letter, photograph,
ID card...) or an **object set** (2-4 real vanilla items that only mean
something together). The player finds them one at a time, in any order, and
draws their own conclusions. Nothing tracks what the player believes.

## 2. The two conspiracies (the only two, ever)

- **Theory A — Containment Cover-up:** officials or the military mismanaged
  the evacuation or containment response and covered up the failure.
- **Theory B — Agricultural Program Malfunction:** an experimental
  pesticide or agricultural program malfunctioned.

They answer different questions on purpose: A is about the *response*, B about
the *origin*. In code they are the leans `containment` and `agricultural`.

**Never use any other premise.** An earlier premise pair was retired by the
owner and must not return in any form — not by name, not rebuilt from its
parts. If you are unsure whether an idea drifts toward another premise, stop
and ask. The retired pair is deliberately not described here.

## 3. The rules that make a clue work (read in this order)

What the player sees, in order: the survivor sometimes says a wordless "Hm?"
near a place with clues; the player turns on the game's Search Mode; the game
highlights a spot — a drawer, a car, a body, a patch of ground — never the
item; until spotted or looked over, the clue is an ordinary vanilla item; once
recognised it gets a title and its text can be read, in a timed action a
zombie can interrupt. (Details: `docs/design/SEARCH_TO_FIND.md`.)

1. **Start from the place and the spot.** Your clue is read by someone
   standing at that drawer, glovebox, body or yard. The place and spot finish
   your sentence — never restate them.
2. **A real vanilla item that still stands apart.** Object sets use 2-4 items
   from the game's catalogue; written clues use one written evidence kind.
   The title and first line are the only moment this item shows it is not
   ordinary loot.
3. **The first glance carries it.** It may be read in the dark, in rain, or
   between swings. The title and first line do the work; card kinds (ID card,
   business card, credit card, ticket) hold at most 280 characters.
4. **Cold read, any order.** Every clue must work as the first one found or
   the fortieth. No "again", no "as before", no sequence.
5. **Mentions are optional texture.** Other places and people may appear, but
   no clue may need them to make sense — the player may never reach them.
6. **Show, never conclude.** Never state why a fact matters; never give a
   verdict. Write the **rival reading first**: the best case the *other*
   conspiracy would make from the same clue. If the rival reading is weak, the
   clue is one-sided — rewrite it.
7. **The lean lives in placement, not in the kind of spot.** Both
   conspiracies must be able to use every place and spot you use; if every
   freezer meant one side, players would stop reading and use a lookup table.
8. **Repeated object sets read as a pattern, not a bug.** Object sets can be
   placed again as new copies later in a game; write them so a second copy
   reads as a pattern, not a duplication glitch.
9. **People: every contact is a first contact.** Some clues are ID cards on
   bodies; other clues mention the same person. A person is a short id, never
   a name in the data; the card and each mention must each work alone. Never
   reuse or echo a vanilla named character (the reserved-name check, §6).
10. **Map and flyer trails.** Every mark on the game's ~125 annotated maps and
    every place named on ~133 flyers is a clue place. Write those clues **from
    the map's own annotation text**, and make each map's story **fit either
    conspiracy** — each world picks the side at random. In 1-20% of maps per
    world, the evidence at the mark belongs to the other side; it must read as
    an honest mismatch, never a trick.
11. **Vanilla scenes.** Many of the game's 140 built-in scenes (crashes,
    camps, raided houses...) can host a clue. Follow the scene's **anchor**
    (in the scene's room, in its vehicle, on a body, on the ground, in a bag
    someone grabbed); never put a clue on a vanilla named character; say in
    your notes whether the clue agrees with or contradicts what the scene
    already implies. Jackie Jaye's studio gets **one version per conspiracy**.

**Self-check per clue** (answer each honestly in your notes):
- Covering the place name, do the title and first line alone say something
  is off, without restating the spot?
- Read as the only clue in the game, with every mention struck out, does it
  still make sense?
- Is there no sentence that says why something matters? Is the rival reading
  as strong as the lean? Would a blind reader, told nothing, fail to name the
  side?
- Real vanilla item or kind? Right anchor for its scene? Could the other
  conspiracy use this place and spot too?
- Would a second copy nearby read as a pattern? Does each contact with a
  person work as the first?

## 4. Keep it sparse (important)

Earlier sessions were stopped by safety systems when long, dense,
realistic-looking official or technical document text was generated in bulk.
So:
- Small batches (section 5); interleave object sets with written clues.
- One human detail beats several official ones. Avoid stacking codes,
  reference numbers, institutional names and technical jargon.
- If generation stops partway, deliver what you have, mark the ticket
  `CLASSIFIER_STOP`, and it comes back smaller. Never quietly soften or
  substitute a clue — leave it blank and say so.

## 5. How work is handed to you — staged work orders

**Stage 0 (before any clue):** return only, for the owner to sign off in plain
terms: a frozen **axiom list** per conspiracy (short ids + one-line glosses —
the non-negotiable facts each version of events needs); a one-line **gloss**
per map/flyer story, per person and per scene you plan to write. Nothing else
is written until the owner approves these.

**Then tickets, one at a time, in this order for a first release:**
1. `PLACE-<kind>` for police, hospital, farm, checkpoint — object sets first.
2. `PLACE-<kind>` for office, bookstore, transmission, warehouse, government.
3. Two or three `PERSON-<id>` tickets (card + mentions, delivered whole).
4. A pilot of three `MAP-<design>` tickets: one large-area map, one flyer
   whose place is a building, one open mark.
5. `SCENE-<kind>` tickets, body and vehicle anchors first.
6. `JACKIE` — exactly two clues, one per conspiracy, same anchor.
7. The remaining maps and flyers in batches of 3-5.

**Acceptance per ticket:**
- `PLACE-<kind>`: at least one object set per conspiracy at that place; at
  least one clue per conspiracy on every spot the ticket uses; passes the
  checks on its own and merged with everything accepted so far.
- `PERSON-<id>`: exactly one ID card or business card (≤280 characters) and
  at least one mention; accepted or returned as a whole.
- `MAP-<design>`: every mark of that design has at least one clue; at least
  half are object sets; each has a real rival reading.
- `SCENE-<kind>`: every clue on the scene's anchor; at least one per
  conspiracy unless the scene table's fit says otherwise.

## 6. The delivery format — JSON rows, never Lua

You never edit the mod's Lua. You deliver one JSON file per ticket to
`content/nohelp/incoming/<ticket-id>.json`: an array of rows. Fields map 1:1
onto the clue list (`mod-nohelp/.../NHShared/Mystery/Manifest.lua`):

| Field | Required | Meaning |
|---|---|---|
| `id` | yes | unique, ≤60 chars, prefixed with the ticket (e.g. `place-farm-03`) |
| `kind` | yes | `"set"` or `"written"` |
| `pieces` | yes | set: 2-4 item ids from `Generated/ObjectCatalogue.lua`, never `Note`; written: exactly one kind from `Generated/EvidenceKinds.lua` (letter, receipt, notepad, photograph, diary, notebook, clipping, dispatch, memo, transcript, idcard, businesscard, creditcard, ticket) |
| `where` | yes | list of `{place, spot, lean, rival, outfit?}` — `place`: police, hospital, office, bookstore, transmission, warehouse, government, mapNamed, farm, checkpoint; `spot`: furniture, mailbox, vehicle, corpse, ground; `lean`/`rival`: `containment`/`agricultural`, never equal; `outfit` (only when spot is corpse): uniform, farm, medical, hazard |
| `person` | no | short id `[A-Za-z0-9_-]`, ≤40, never a name |
| `title` | no | what the recognised item is called |
| `body` | no | the text; cards ≤280 characters, object sets ≤240 |
| `rival_reading` | yes | written **first**: the other conspiracy's best reading, one line |
| `gloss` | yes | the clue in one neutral line, for reviewers |
| `axioms` | yes | ids from the approved axiom list — at least one for **each** conspiracy |
| `anchor` | for maps, scenes, Jackie | `{map=<design>, mark=<n>}`, `{print=<name>}`, `{scene=<kind>}`, or `{jackie="A"|"B"}` |
| `cites` | when built on vanilla text | `{source=..., quote=...}` — the exact vanilla annotation, flyer or scene string it builds on |
| `prov` | yes | `{writer=<model>, handoff=<this document's date>, batch=<ticket-id>}` |

## 7. How your work is checked (a clue is finished only when all pass)

**Automatic, in the repo:** the clue-list rules (`Manifest.validClue` /
`Manifest.lint` — **built**): shape, vanilla items, card lengths, ≥50% object
sets per clue, both conspiracies at every place and spot used, an object set
per conspiracy at every place, person threads complete. **To be built** (§9):
provenance present; axioms named for both sides; density caps (proper nouns,
code-like tokens); no emphasis tricks (no capitalised stress, no last-line
reveal); citations are literal substrings of the vanilla data; reserved-name
check against vanilla named characters (exact, sound-alike, one letter away);
the retired-premise tripwire (stored only as salted hashes).

**A blind re-read by a different AI:** given the clue alone (no lean, no
rival), it names the side it reads as, or "neither", several times. A clue is
returned if it is never read as its rival, or read as "neither" most of the
time. Its result is stored against the exact text; editing the text afterwards
voids it.

**The owner:** signs off stage 0; reads a one-page summary per batch (glosses,
where clues can turn up, which side, the counter-reading) and a drift report
("farm clues for theory A all sound like paperwork"); rules on blind-read
failures. The owner does not read Lua.

**Returned rows** carry reason codes, e.g. `SCHEMA`, `BAD_ITEM`, `SET_SIZE`,
`NOTE_IN_SET`, `BAD_CARRIER`, `TOO_LONG`, `SAME_LEAN`, `PERSON_ORPHAN`,
`PERSON_SPLIT`, `SET_RATIO`, `ANCHOR_UNKNOWN`, `ANCHOR_SPOT_MISMATCH`,
`AXIOM_UNKNOWN`, `NO_RIVAL`, `STATES_SIGNIFICANCE`, `NOT_COLD_READABLE`,
`VANILLA_REINTERPRETED`, `RETIRED_PREMISE`, `OFF_GLOSS`, `CLASSIFIER_STOP`.
Fix the pattern, not just the row.

## 8. Where the rules come from (read these, in this order)

1. `DECISIONS.md`, top entry `DR-20260927-NOHELP-RULE-PLACEMENT` — every owner
   decision (quoted), newest bullets last. Newer bullets supersede older ones.
2. `docs/design/NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md` — sections 2-4a:
   authoring integrity (frozen axioms, rival readings, glosses, blind re-read,
   cold read, generation effect, citing vanilla).
3. `docs/design/NO_HELP_TASK3_PLACEMENT_PLAN_2026-09-27.md` — sections 1 and 7
   (how placement works; the owner's answers).
4. `docs/design/SEARCH_TO_FIND.md` — how a player finds a clue.
5. `docs/design/nohelp-adhd-inputs/` — the scene list and draft scene table;
   the shipped table is `mod-nohelp/.../Generated/VanillaScenes.lua`.

## 9. Before tickets beyond stage 0 go out (engine work, not yours)

- **Converter:** `tools/nohelp_content/convert.lua` turns accepted rows into
  the derived clue file the game loads, keeps `rival_reading`, `gloss`,
  `axioms`, `cites`, `prov` in a sidecar, and runs the checks. *Not built.*
- **Anchor on a clue:** the clue list cannot yet say which map mark, flyer,
  scene or Jackie version a clue belongs to, so map and scene clues would
  become generic. An optional `anchor` field, checked against
  `Generated/MapSites.lua` and `Generated/VanillaScenes.lua`, and read by
  placement, is needed before any `MAP`, `SCENE` or `JACKIE` ticket. *Not
  built.*
- **Clue gates:** `Mystery/ClueGates.lua` (provenance, density, emphasis,
  reserved names, citations) called from the clue-list rules, with
  `test/nohelp_clue_gates.lua`; the axiom and retired-premise gates once the
  owner has frozen the axioms and supplied the retired terms for hashing.
  *Not built.*
- **Blind re-read prompt and receipts:** `tools/cluegates/blind_reread.md`,
  receipts in `tools/cluegates/receipts/` keyed by a hash of the clue text.
  *Not built.*
- **Owner one-pager and drift report.** *Not built.*

## 10. What you must never do

- Invent a third theory, or bring back the retired premise in any form.
- State which theory is true, or write a clue only one theory can use.
- Edit Lua, placement, rules, or this document.
- Name a person in the data; reuse or echo a vanilla named character.
- Put a clue on a vanilla named character, or overwrite what vanilla built.
- Generate in bulk. Small batches; ask when unsure.
