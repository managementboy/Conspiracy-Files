# CF: No Help — handoff for the content-writing AI

2026-09-27. For an AI that will write the clues for "Conspiracy Files: No
Help". Shaped by an `/adhd` run (regulator, competitor, logistics, game design,
remove-the-assumption; three ideas deepened against the code). Read this whole
document before writing anything. You write **content only**: the engine,
placement and rules already exist and are not yours to change.

> **Who is who (owner, 2026-09-27).** You (ChatGPT) write the clue text and
> deliver it in the format of section 6. Claude (the engineering AI in this
> repo) builds the tools, owns the vanilla scene list, and reviews and signs
> off your work together with a blind re-read by a different AI. **The owner
> does not curate or review content and must stay unspoiled**: never send the
> owner clue text, scene names, character names, locations or evidence
> details, and never ask the owner to find or confirm anything. Spoiler-level
> specifics live in `docs/writer-only/` (read `NOHELP_SPOILERS.md` there).
> Story questions go to Claude; only a genuine direction question with no
> spoiler in it goes to the owner, worded without specifics.
>
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

## 2a. Tone and voice (owner decision)

- **Tone:** fatalistic, bureaucratic dark comedy, throughout — the same tone
  as the original mod. The humour comes from the event, an institution's
  priorities and a person's own stake: someone following a procedure while
  the world ends, a form that cares about the wrong thing. It is never a
  joke, never a witty last line, never mockery of the dead.
- **Grounded:** use real vanilla places and businesses where they fit; never
  invent a link between a named vanilla business or lore figure and the
  conspiracies just to mention them.
- **Voice:** only the world's. A clue is what someone left behind — a note, a
  receipt, a card, an arrangement of objects. The survivor never comments,
  and no clue addresses the player.
- **Sparse:** the comedy lives in one human detail beside one institutional
  one, never in stacked jargon, codes or official language (section 4).

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
    already implies. The first hand-checked unique scene gets **one version per
    conspiracy** (which scene: `docs/writer-only/NOHELP_SPOILERS.md`).

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

> **Ticket names (2026-09-27):** in the repo, tickets are opaque serials
> `T0000`, `T0001`, … and row ids are `t####-NN`, so nothing in GitHub
> names a scene or map. The type names below (`PLACE-<kind>`, `PERSON-<id>`,
> `MAP-<design>`, `SCENE-<kind>`, `UNIQUE-<scene>`) describe what a serial
> is; the mapping is in `docs/writer-only/nohelp-tickets.tsv`. How to run the
> queue, save to GitHub and when to stop: `NO_HELP_CHATGPT_HANDOVER_2026-09-27.md`.

**Stage 0 (before any clue):** return only, for Claude to sign off: a frozen **axiom list** per conspiracy (short ids + one-line glosses —
the non-negotiable facts each version of events needs); a one-line **gloss**
per map/flyer story, per person and per scene you plan to write. Nothing else
is written until these are signed off.

`T0000.json` is one object, not rows:

    {"containment":  [{"id": "c-short-id", "gloss": "one line"}],
     "agricultural": [{"id": "a-short-id", "gloss": "one line"}],
     "stories": [{"ticket": "T0001", "target": "<registry target>",
                  "lean": "containment|agricultural|random",
                  "gloss": "one neutral line"}]}

Axiom ids are lowercase, short and unique; they are what every row's `axioms`
field names. `stories` covers **only the first-release tickets T0001-T0018**
(the registry's targets); glosses for later stories come in a further
stage-0-type ticket Claude opens with each expansion batch. Once signed off,
changing an axiom voids the sign-off; adding a story gloss does not.

**Then tickets, one at a time, in this order for a first release:**
1. `PLACE-<kind>` for police, hospital, farm, checkpoint — object sets first.
2. `PLACE-<kind>` for office, bookstore, transmission, warehouse, government.
3. Two or three `PERSON-<id>` tickets (card + mentions, delivered whole).
4. A pilot of three `MAP-<design>` tickets: one large-area map, one flyer
   whose place is a building, one open mark.
5. `SCENE-<kind>` tickets, body and vehicle anchors first.
6. `UNIQUE-<scene>` — the first hand-checked unique scene: exactly two clues,
   one per conspiracy, same anchor.
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
| `anchor` | for maps and scenes | `{map=<design>, mark=<n>}`, `{print=<name>}`, `{scene=<kind>}`, or `{scene=<kind>, version="A"|"B"}` for a scene with one version per conspiracy |
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

**Independent blind review:** after the batch passes the converter and test
suite, a model other than the writer reads each clue once, seeing only its
rendered text. A vote matching the clue's declared lean passes. A `NEITHER`
vote or a vote against the declared lean triggers exactly one second fresh
read. If the two votes disagree, or both miss the declared lean, return the
clue for revision. Do not run more reads to seek a passing result. The batch
also receives one editorial pass for repetition and consistency. Receipts are
stored against the exact rendered-text hash; any edit invalidates the receipt.
The complete executable rule is `tools/cluegates/blind_reread.md`; older
multi-read thresholds and outcomes in historical documents are superseded by
`DR-20260928-NOHELP-REVIEW-FAST` in `DECISIONS.md`.

**Claude:** signs off stage 0; reads every batch, a drift report ("farm clues
for theory A all sound like paperwork") and every blind-read failure, and
returns rows with reason codes. **The owner is not in this loop** and must
not receive content (blind play).

**Returned rows** carry reason codes, e.g. `SCHEMA`, `BAD_ITEM`, `SET_SIZE`,
`NOTE_IN_SET`, `BAD_CARRIER`, `TOO_LONG`, `SAME_LEAN`, `PERSON_ORPHAN`,
`PERSON_SPLIT`, `SET_RATIO`, `ANCHOR_UNKNOWN`, `ANCHOR_SPOT_MISMATCH`,
`AXIOM_UNKNOWN`, `NO_RIVAL`, `STATES_SIGNIFICANCE`, `NOT_COLD_READABLE`,
`VANILLA_REINTERPRETED`, `RETIRED_PREMISE`, `OFF_GLOSS`, `CLASSIFIER_STOP`,
`NEVER_OWN` (the blind reader only ever read it as the rival conspiracy),
`TONE` (misses section 2a: e.g. a flat report with no human detail),
`DRIFT` (a batch read together repeats one template: the same human detail,
the same institutional joke, the same spot).
Fix the pattern, not just the row.

## 8. Where the rules come from (read these, in this order)

1. `DECISIONS.md` — read the current review rule `DR-20260928-NOHELP-REVIEW-FAST`
   first. Historical decisions remain in force only where they do not conflict
   with this newer review rule.
2. `docs/design/NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md` — sections 2-4a:
   authoring integrity (frozen axioms, rival readings, glosses, blind re-read,
   cold read, generation effect, citing vanilla).
3. `docs/design/NO_HELP_TASK3_PLACEMENT_PLAN_2026-09-27.md` — sections 1 and 7
   (how placement works; the owner's answers).
4. `docs/design/SEARCH_TO_FIND.md` — how a player finds a clue.
5. `docs/writer-only/nohelp-adhd-inputs/` — the scene list and draft scene table;
   the shipped table is `mod-nohelp/.../Generated/VanillaScenes.lua`.

## 9. Before tickets beyond stage 0 go out (engine work, not yours)

- **Converter:** `tools/nohelp_content/convert.lua` turns accepted rows into
  the derived clue file the game loads, keeps `rival_reading`, `gloss`,
  `axioms`, `cites`, `prov` in a sidecar, and runs the checks. *Built
  2026-09-27* (`content/nohelp/` folders, `lua5.1
  tools/nohelp_content/convert.lua`). Beyond section 7's codes it can return
  `DUPLICATE`, `ONE_SIDED` (a place or spot without both conspiracies, or a
  place without an object set per conspiracy), `NO_PROV`, `NO_GLOSS`,
  `DENSITY`, `EMPHASIS`, `CITE_NOT_VANILLA` and `RESERVED_NAME`. `axioms` is
  either `{"containment": [ids], "agricultural": [ids]}` or a flat list of
  ids.
- **Anchor on a clue:** the clue list cannot yet say which map mark, flyer,
  scene or scene version a clue belongs to, so map and scene clues would
  become generic. An optional `anchor` field, checked against
  `Generated/MapSites.lua` and `Generated/VanillaScenes.lua`, and read by
  placement, is needed before any `MAP`, `SCENE` or `UNIQUE` ticket. *Built
  2026-09-27* for maps and flyers (a marked place with anchored clues takes
  only those) and, since the scene step, for scenes: a confirmed scene takes
  one clue anchored to its kind (or the unique scene's version A/B for the
  world's lean). Not yet checked in the live game.
- **Clue gates:** `Mystery/ClueGates.lua` (provenance, density, emphasis,
  reserved names, citations) called from the clue-list rules, with
  `test/nohelp_clue_gates.lua`; the axiom and retired-premise gates once the
  axioms are frozen at stage 0; Claude stores the retired terms as salted hashes
  (the retired pair is on record in the design doc, so the owner is not needed).
  *Built 2026-09-27*; the axiom gate checks shape only until
  `content/nohelp/approved/axioms.json` exists.
- **Blind re-read prompt and receipts:** `tools/cluegates/blind_reread.md`,
  receipts in `tools/cluegates/receipts/` keyed by a hash of the clue text.
  *Built 2026-09-27* (`tools/cluegates/check_receipts.lua`).
- **Owner one-pager and drift report.** *Not built.*

## 10. What you must never do

- Invent a third theory, or bring back the retired premise in any form.
- State which theory is true, or write a clue only one theory can use.
- Edit Lua, placement, rules, or this document.
- Name a person in the data; reuse or echo a vanilla named character.
- Put a clue on a vanilla named character, or overwrite what vanilla built.
- Generate in bulk. Small batches; ask when unsure.

## Review log

- **2026-09-28, T0001-T0018** (rule `DR-20260928-NOHELP-REVIEW-FAST`): converter
  check and test suite green; the batch read once (one US-spelling fix);
  one blind read per clue (38), a second read for the 4 flagged. Accepted:
  11 tickets, 24 clues. Returned whole: T0003, T0008, T0012, T0014 (one clue
  each, `LEAN_MISMATCH`: both reads missed the declared lean; the other
  clues passed and may come back unchanged). Also returned, whole and
  `merged` (`ONE_SIDED`), though every clue passed: T0010, T0016, T0017;
  without T0003 they would leave farms one-sided, so they come back unchanged
  in the same round as T0003. A batch note on repeated objects is in each returned file.
- **2026-09-28, returns T0003 T0008 T0010 T0012 T0014 T0016 T0017** (same
  rule): GitHub run on the delivery head green; converter check and suite
  green. Field audit: the 10 passing rows came back unchanged; the 4
  reworked rows changed only title, body, gloss and rival reading (place,
  spot, lean, rival, pieces and axioms kept). One blind read each for the 4
  reworked rows: all matched the declared lean on the first read, no second
  read needed; the 10 unchanged rows keep valid receipts. All 14 rows pass.
  Batch note: two reworked rows now state their side plainly, and the key
  ring recurs; neither is a return reason. Converted into accepted/ by
  Claude after the review (owner: adding reviewed clues is always the
  reviewer's step; the writer only ever runs the converter with --check).
- **2026-09-28, expansion batch 1, T0020-T0024** (same rule): GitHub run on
  the round's head green; converter check and 48 tests green. Batch read
  once: consistent; note in the return file (every ticket splits its sides
  the same way, set for one, note for the other, and the notes name their
  side outright). One blind read per clue (10): 9 matched; 1 flagged, one
  second read, both "neither": T0023 returned whole (LEAN_MISMATCH on one
  clue; the other passed). A tooling fault gave that passing clue an
  unneeded second read (it matched again); blind_reread.sh --force --rows
  now re-reads only flagged rows. Accepted and added: T0020 T0021 T0022
  T0024 (8 clues; 46 in the game).
- **2026-09-28, new rule `DR-20260928-NOHELP-CLUE-CHECK`** (owner): one blind
  read per clue answers A, B, both or none; A, B or both go into the game as
  written, none is dropped and rewritten. No second reads, no returns for
  "wrong side". The 46 clues in the game were re-read once under it: 19 A,
  19 B, 8 both, 0 none; all stay.
- **T0023** (returned under the old rule) re-checked once under the new
  rule: A and B, both stay; accepted as written, no rewrite needed.
- **T0023 rewrite** (delivered after the rule change; owner chose it over
  the original): only title and text changed on the reworked clue; read
  once, A; it replaces the original in the game.

