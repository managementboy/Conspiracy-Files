# CF: Of Interest - design plan (no code)

2026-10-07. Owner decision: fork No Help into a new project, **Conspiracy Files: Of Interest**
(folder `mod-ofinterest`, mod id `ConspiracyFilesOfInterest`, own Workshop item). It REQUIRES the
Workshop mod "It is of interest to me!" (id `ItIsOfInterestToMe`, Workshop 3796373365, game 42.21;
`require=` line in `mod.info`). The owner plays blind: this plan and everything built from it uses
opaque ids (S001..S023, Note/0042) and counts only. Note text, names, places and events from the
dependency never appear in docs, commits or chat. The private analysis stays in gitignored
`dev/ofinterest-private/` (stories.json, standalone.json, theme_counts.json, ext_*.json).

## 1. Goal and non-goals

Goal: a player who searches finds ordinary-looking objects (sets, holders, ground spots) placed
**next to the dependency's notes**, so the notes read as part of a larger case. Notes and objects
are tied by STORY (23 stories, 67 entries), PLACE (13 place categories) and THEME (illness 80,
romance 67, work 47, debt 33, family 29, military 25 ...). 500 EN notes in all: 67 in stories,
433 standalone.

Non-goals: copying or editing their note text; writing our own clues (dropped); a device/notebook
(No Help has none); changing the dependency's reading window; new maps. Theory content is NOT
decided here (section 6).

## 2. Architecture

Unchanged from `mod-nohelp/` (copied, renamed prefix `OIShared`): placement engine (rule-based,
decide early / create on arrival), ground spots, set holders (`SET_HOLDERS.md`), hint cue, Search
Mode find, captions, house numbers and map marks, scheduler, save budget, reload guards.

Removed: all our paper clues (`Mystery/Content/*`), the two-theory content and its lean rules, the
Mystery manifest tied to our text, clue-body generation for notes. Kept as empty hooks: theory
ids, lean per spot (fed later).

New:
- **Notes catalogue** (`OIShared/NotesCatalogue`): built at load from the dependency's Lua
  globals (`ReadableItemRegistry`, `NoteContentPool`, `LocationCategory`) and its content files,
  never from a copy of the text. One record per note: `noteId` (their file id), item type
  (Base.Note / Base.LetterHandwritten / Base.GenericMail), pool, place category, theme tags,
  story id (our own S001..S023). Story and theme tags come from our private analysis, shipped as
  an **id-only table** (note id -> story id, order, theme ids; no words). Themes are numbers with
  a legend kept private.
- **Placement manifest** (`OIShared/Manifest`): rows mapping a story / place category / theme to
  a physical scene: which note item, which supporting objects (set or single piece, with holder),
  which kind of place (room kind, container, ground spot). Authored by us in ids; rows reference
  existing object sets already in the engine.
- **Dependency adapter** (`OIShared/Dependency`): the only file that touches their globals and
  modData keys; everything else asks the adapter.

## 3. Forcing a note

Their behaviour (from our study): the note is picked at random on first read and saved on the
item as modData `iioitmTextId`, plus `iioitmLocation`, `iioitmLocationBaked`,
`iioitmLetterCategory` and style keys; a world tracker `ItIsOfInterestToMe_UsedText` stops
repeats; location is baked on first right-click or transfer from the room name.

Ours: create the item (Note/Letter/Mail), set the keys so `iioitmTextId` = the chosen id, the
location keys to the scene's place, mark `iioitmLocationBaked` so the room name cannot overwrite
it, stamp our `cfGeneratedId`/`cfPhysicalToken`. Exactly once: we write the id into their used
tracker when we place it (and check it first), so their random pick cannot hand out the same note
in a loose container; and our manifest never places an id twice. Contested ids are skipped, not
reused.

Dependency changes: the adapter records the dependency's version and a **fingerprint** (count of
notes, hash of the sorted id list, the key names). Load check: key names present and all
manifest ids exist. Tolerant fallback in order: (a) ids missing -> drop only those rows, log
counts; (b) key names changed or registry gone -> the mod runs as a plain scene mod (objects only,
no forced note) and says so once in the log; (c) a new version with extra notes -> the new ids
are standalone and placed by place/theme only. Nothing crashes; a failed check prints one line.

## 4. Finding, hint, search, caption

- **Found** = unchanged engine meaning: Search Mode spots the item (or "Look it over" after pickup).
  Finding is about the *object*; reading is the dependency's own window.
- **Survivor voice**: speaks no note text, ever (their window shows it). The survivor says only a
  neutral line when a note scene is found, e.g. a "worth reading" nudge in the existing hint style
  (`PLAYER_VOICE.md` register: hedged, no certainty). Whether the nudge exists at all is a small
  owner question (section 6).
- **Hint cue and Search icon**: keyed on the scene id, one scene = one icon, as now.
- **Captions**: describe the supporting objects only, never the note.
- **Read vs found**: we do not track whether the player opened the note. No notebook/organiser.
- **Unfound moves**: as now (quiet, within place, whole scene). The note travels with its scene;
  its forced keys are copied to the new item.

## 5. Stories, places, themes

Stories (23; 67 entries; sizes 12, 6, 4, 3 x5, rest 2; confidence per story: 9 high, 10 medium,
4 low; 10 of 23 have no order guess). Open design choice with a default:
- **Order**: parts of a story are placed so reading order is *discoverable but never enforced*;
  stories with uncertain order (S004, S011-S015, S017, S020, S022, S023) are placed with no
  order claim.
- **Spread vs same place**: default is **one district per story, each part in a different
  building** (pairs: two buildings; S001: up to 12 rooms across a few streets), because a story
  found whole in one drawer is a single read, not a trail. Stories whose entries carry a place
  category (S001, S005, S009, S012, S019, S022) follow that category for the building kind.
- Low-confidence stories (S020-S023) are held back until reviewed.

Standalone (433): placed by **place category** first (13 categories, via `LocationCategory` so a
note sits in the kind of room it expects) and **theme** second (a scene's supporting objects
share the note's theme number). Pools by count: Note 116, EN-named 85, FriendlyLetter 35,
SadLetter 33, Letter 23, ChildsLetter 21 ...; item type follows pool. Not every standalone note
gets a scene: target is a share (to be set, e.g. a third), the rest stay with the dependency's
own random spawn.

## 6. The theory layer: owner decisions (plain language)

Nothing is invented here. Questions for the owner:
1. What is the one big thing the player is slowly working out across the notes? Should it exist,
   or should the objects just make the notes feel real?
2. Illness is by far the most common thread (80 of 500). Should "illness" be the common thread of
   the case, one thread among several, or ignored?
3. How many theories should the player weigh: still two, one, or more? Should a theory be tied
   to a story, a place, a theme, or none?
4. Should the survivor say anything when a note scene is found (a nudge), or stay silent?
5. May we keep scenes sparse (a share of notes get objects) or should every story get one?
6. Do you want us to ask the dependency's author for permission and for stable story ids?
7. Should stories be one trail across the map, or separate small pockets?

## 7. Build phases (check per phase; Linux real game, never `--hidden`)

1. **Skeleton**: copy `mod-nohelp` to `mod-ofinterest`, rename ids/prefix, add `require`, strip
   content, empty manifest. Check: offline tests (renamed `test/oi_*`, ported from the nohelp set
   that still applies), `package.sh`, real game boots with the dependency, mod list shows both,
   no Lua errors.
2. **Adapter + catalogue**: read their registry; print counts (500 / 67 / 433, 13 places).
   Check: counts match; fingerprint stable across two boots; missing-dependency path tested.
3. **Force one note**: place one Note by modData on a known item in a real game. Check: the
   same id shows after save/reload, on a second player pick, and after the dependency's random
   spawn fires nearby (no double pick); tracker updated.
4. **One scene near a note**: one holder/set beside the forced note, through the engine, found
   by Search Mode. Check: hint, icon, caption, find, relocation all work (reuse `nohelp_holders`
   style checks).
5. **One story** (smallest, 2 entries) then the biggest (S001) across buildings. Check: no id
   twice, order claims honoured, reload stable.
6. **Place/theme standalone batch**, then manifest linter (every row resolvable, no id twice,
   theme/place agrees with the note's category, counts per story).
7. **Version-drift gate**: fake changed ids/keys in the offline harness; assert the fallbacks.
8. Publish only via `publish_workshop.sh --mod ofinterest` (to be added) after dry run, a Linux
   boot check and the owner's go.

Gates: offline Lua suite, manifest linter, fingerprint check, real-game forced-note check, no
`--hidden`, no note text in any test output (ids only).

## 8. Risks

- **Dependency updates** change ids or keys: mitigated by the fingerprint and fallbacks; still
  needs a recheck each release.
- **Licence**: none stated. We use their items at runtime and ship ids, not text, but we need the
  author's permission before publishing; ask first (question 6).
- **AI stance**: the author states no AI content. Our own objects, captions and any later theory
  text are AI-written; disclose it on our page and keep it out of their notes.
- **Language**: text is resolved client-side per language; our id tables are language-neutral, but
  place/theme tags came from EN; other languages may differ in count. Check on first non-EN run.
- **Multiplayer**: text resolved client-side, tracker is world modData; the server must write the
  keys and tracker, and clients must not re-bake location.
- **Old saves**: notes already randomly spawned stay theirs; our scenes only get new notes. A
  save made without our mod loses nothing; removing our mod leaves plain notes behind.
- **Private data leak**: the id table must carry no words; add a check that rejects any non-id
  string in shipped data.
- **Their location baking** can fight our keys on transfer; test in phase 3.
