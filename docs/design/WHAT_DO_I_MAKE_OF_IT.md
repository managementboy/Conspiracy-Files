# "What do I make of it?" - implementation plan (first cut)

**Status 2026-09-15.** Built: step 1 (two readings per premise, written as
noun phrases so the note reads "I think it was ..."), 2 (offered/answers on the
retired record), 3 and 3b (generator `steer`; a returning person is marked met
and never gets a second body), 4 (budget), 5 (offered frozen at retirement), 6
and 6b (most recent unused answers steer the next case, marked used in the
same swap; the next case waits one in-game hour after a completion), 7 (FILES
row, question view, wrapping pick lists, ANSWER), 8 (the second thought). Also
fixed on the way: a first case with every story paper plus the relay memo could
never retire. Still to do: step 9 (the note in the notebook), 10 (a reload
check for answers) and 11 (the broadcast paper for "Listen for it"; until it
exists that way leans on the press clipping).

**Step 11 text (owner chose a radio call-in transcript, P4-R123).** Placed only
in a case steered to "Listen for it", after every draw, so no existing case
changes. Placeholders as in Premises.lua.

```
Radio transcript / {CODE}

WHAT YOU FOUND
A typed page from a local radio station's evening call-in show, kept in a card
folder with {CODE} pencilled on the tab. One caller's words are underlined.

{DATE1CAPS} - EVENING CALL-IN
CALLER: There were trucks at {B} past ten last night. Nobody I asked knew
anything about it.
HOST: Probably maintenance. They do that at night so nobody is held up.
CALLER: Could be. There was no sign on the gate, is all.
HOST: We'll put the question to {ORG} and see if anybody rings back. Next caller.

WHAT IT MIGHT MEAN
A caller noticed work at {B} at an hour nobody had explained, and someone later
filed the page against the reference. Night work is ordinary, and so is a
curious caller; a quiet arrangement looks exactly the same from the road. The
transcript records what one person said on air. It cannot say what {SUBJECT}
was, or {UNKNOWN}.
```

Status: plan only, nothing built. Decisions it follows: **P4-R113** (the idea),
**P4-R119** (first cut), **P4-R112** (first-person voice), **P2-Q27** (the
world does not react; amended for case generation only), P4-R17 (500 kB save
limit), P4-R89/P4-R99 (sizes), P4-R97 (AI text ships, owner reviews in play),
P4-R107 (no new premise or organiser program until the first new-style case
ships).

First cut, as the owner set it:

- Asked **only at a case's end**, once all its papers are found.
- **"Leave it cold" is left out** until the cold trail of
  `COLD_TRAIL_AND_PULL.md` exists.
- The next case **keeps the 24-hour timer** and uses whatever has been
  answered by then.
- Answers can be changed until a case has been built from them. Nothing is
  marked right or wrong. The answers are saved inside the case they shape, so a
  case still rebuilds from its seed. Evidence leans toward **testing** the
  chosen reading, never confirming it. The world itself does not react.

---

## 1. What the survivor sees

**Wording approved by the owner as written (P4-R122, 2026-09-15).**

1. The last paper of a case is noted, by right-click Inspect or by dropping it
   on the organiser. Today the survivor says one of the lines already written,
   such as "That's all of it, I think.", with the tag "Nothing left to find
   here" (`PlayerVoice.lua:84-88`, `:318-323`).
2. **New:** a moment later a second thought appears in the white halo:
   *"What do I make of it?"*. The organiser does **not** open by itself. The
   hand is the switch (`Organiser.lua:316-360`, `KNOX_OS.md` rule 1), and
   taking a survivor's hand at the end of a search would be the mod acting for
   them.
3. When the survivor next reads the organiser, **FILES** has a new row at the
   top: `What do I make of it? - Case 3`. It uses the same "Case N" marker the
   rows already carry (`EvidenceRows.lua:115`).
4. Opening the row shows three questions. Each has its current answer, or
   `(not yet)`:

   ```
   WHAT DO I MAKE OF IT?
   Which reading do I believe?
     (not yet)
   Who do I think matters here?
     (not yet)
   What would I check next?
     (not yet)
   ```

   The footer has `BACK` and `ANSWER`, in the same place `REMIND` sits on a
   file today (`OrganiserScreen.lua:665-668`).
5. Tapping a question, or pressing ANSWER on the selected one, opens a Palm
   popup list. This is the same control SETUP uses for Text and Machine size
   (P4-R99). The rocker steps through it, a tap chooses, and a tap outside
   leaves it unchanged.

   **Which reading do I believe?**
   - *(this case's ordinary reading, e.g.)* `A rota somebody filed badly.`
   - *(this case's other reading, e.g.)* `A move nobody would sign for.`
   - `I can't tell.`

   **Who do I think matters here?**
   - *(first person's name)* e.g. `Delia Mercer`
   - *(second person's name)* e.g. `Roy Hale`
   - *(the organisation)* e.g. `County Personnel Office`
   - `Nobody, really.`

   **What would I check next?**
   - `Follow the person.`
   - `Check the place against its records.`
   - `Listen for it.`

   Each popup also has `Clear my answer.` at the bottom, so a question can go
   back to `(not yet)`.

   The two example readings come from premise 1's own "WHAT IT MIGHT MEAN"
   text (`Premises.lua:76`, `:89`).
6. Once any question is answered, the row reads back as the survivor's own
   note, and the notebook shows the same words:
   *"I think it was a move nobody would sign for. Delia Mercer matters here.
   Next I would follow the person."*
7. When a new case is built from those answers, the row keeps the words and
   adds *"I've gone on from here."*. The popups no longer open. Nothing ever
   says whether the survivor was right.

Size check (P4-R89/P4-R99): at Large text the line holds about 25
characters, and each option wraps to at most two lines. At a 0.5x machine the
owner already expects only Small or Normal text. **No length limit on options**
(owner, 2026-09-15, P4-R122: "the wording can be as long as necessary, change
our limit"): the pick list wraps a long option onto more lines rather than
cutting it off.

---

## 2. What exists today and what must be built

| Needed | Today | Evidence | To build |
|---|---|---|---|
| A case's "two readings" | **Exists only as prose.** Every premise has two honest readings, written inside `meaning`/`meaningAgree` sentences. There is no field a menu can list. The case's `outline` (corroboration or conflicting account) is a separate thing. | `Premises.lua:9-12`, `:54-60`; `Generator.lua:290`; `PREMISES.md:86-92` | A short `readings` pair per premise, and per outline where the wording differs: 20-40 pairs of 34-character lines. They are kept out of the built case, so no case's rebuild changes. |
| The case's people and organisation | Exist: two people (`identities`) and one `organisation` per case. | `Generator.lua:328-339`, `:694-697` | Nothing, but see the next row. |
| Those names after the case ends | **Gone.** Retirement keeps only the case id, the rows and the discovery order. People, organisation, premise and outline are dropped. | `RetiredCase.lua:1-10`, `:17`, `:123` | Retirement must keep a small "offered" note: two names, the organisation, the premise id and the outline. |
| Investigation "ways" | **No such concept in code.** Nothing is called follow / records / listen. The nearest things are the optional evidence roles. | `Generator.lua:407-621` (roles), `:630-656` (selection) | A fixed table from each way to the roles it prefers (section 4). |
| "Listen for it" | **Nothing carries sound or broadcast.** The only public-notice paper is the press clipping. The organiser is a radio underneath, but that has no content. | `Generator.lua:418-420`; `KNOX_OS.md:137-157` | First cut maps to the clipping only (open question Q1). |
| Moment of case completion | Exists. | `GeneratedRuntime.lua:639-666` (logs "Case complete; placement details retired.", then calls `onCaseComplete`); the drop-to-note path goes through the same function (`DropToNote.lua:64`) | One call there to record the offered note, done inside the retirement swap. |
| Next case creation | Exists. It runs when fewer than 10 cases exist and 24 world hours have passed **since the last case was created**. That is not counted from completion, and cases may overlap (up to 4 open at once). | `AutomaticInvestigations.lua:6`, `:28-31`; `GeneratedRuntime.lua:563-577`; `SuccessiveCases.lua:31`, `:116` | Pass the answers into case creation. |
| Anchoring near the player | Exists: the player's position when the next case is prepared, sites not used before, reach set by hours survived (250/500/1500 tiles). | `GeneratedRuntime.lua:360-370`, `:388-391`; `Generator.lua:768-780`; `Reach.lua:6-9` | Unchanged. Answers never move a case. |
| Saving world-derived input inside a case | Exists for met names (`cast`): handed in at creation, saved in the case, checked on rebuild. | `Generator.lua:292-320`, `:702-716`, `:729`, `:802-806`; `GeneratedRuntime.lua:383-387` | The same pattern for a new `steer` input. |
| A question screen | FILES record view with footer commands; popup lists in SETUP; a text box for notes. | `KnoxApps.lua:96-133`, `:514-530`; `OrganiserScreen.lua:665-668`, `:1122-1160` | A new row type in FILES, a question view and three popups. **Not a new program** (P4-R107 freeze). |
| "Cases past ten" | **Not built.** P4-R111 (archive) is decided, but the code still stops at 10. | `SuccessiveCases.lua:31`; `GeneratedRuntime.lua:568` | Out of scope. Until it lands, at most nine cases in a save can be steered. |

---

## 3. Data: what is saved, where, and what it costs

Two small additions. Nothing new at the top level of the save.

**a) On the finished case (the retired record).** Two optional fields, so saves
without them still load. `lastSeen` was added the same way without a schema
change (`RetiredCase.lua:18-25`).

- `offered`: what the questions are about, frozen at completion. The premise
  id, the outline, the two people's names and the organisation name. Only
  names are stored. The reading wording is looked up from `Premises.lua` by
  premise id.
- `answers`: `reading` (1, 2 or "cannot tell"), `matters` (person 1, person 2,
  organisation or nobody), `way` (person, records or listen), the world hour of
  the last change, and `usedBy`, which is the id of the case built from them.
  Once `usedBy` is set the answers are locked. They are changed only through
  the same check-then-swap every save change uses (`SuccessiveCases.lua:193-241`
  shows the pattern).

**b) On the case it shapes (the live case).** A `steer` field saved beside
`cast`: the chosen reading side, the chosen way, the returning name (a person
or the organisation) and the id of the case it came from. `Generator.validate`
rebuilds the case from seed + sites + cast + relay memo + **steer**, so it
still rebuilds exactly. A hand-edited `steer` fails the check, as a tampered
`cast` does (`Generator.lua:802-806`).

**Cost, measured on this machine** with the save's own size estimate
(`Validator.estimateEncodedBytes`) on sample records:

| Record | Typical | Worst (60-character names) |
|---|---:|---:|
| `answers` on a retired case | 351 B | 830 B |
| `offered` on a retired case | ~800 B | ~800 B |
| `steer` on a live case | - | 819 B |

**Does it fit?** Today's measured worst campaign (`test/case_budget_headroom.lua`,
run plain-Lua on 2026-09-15): 4 live x 38,505 B + 6 retired x 28,781 B =
**326,706 B** of 500,000, with 120,000 reserved for everything else. That leaves
**53,294 B** spare. The worst added cost is 4 x 0.82 kB + 6 x 1.63 kB, about
**13 kB**. **It fits** (verified by measurement). The headroom test must be
extended to include it, so the figure stays a measured one.

---

## 4. How each answer steers the next case

Everything is applied **inside the generator, after its normal random draws,
without adding or moving any draw.** The same seed and the same answers always
give the same case. A case with no answers is identical to today's, so current
saves keep working (to be proven by test, step 3).

**Who matters: that person or organisation returns.**
- *A person:* the returning name becomes the case's first person, the one the
  papers are signed by and whose body the case gives a name (`Generator.lua:320`,
  `:328`, `:337`; `GeneratedRuntime.lua:419-431`). If the draw already picked
  the same name as the second person, the second person moves to the next name
  in the pool.
- *The organisation:* its name replaces the premise's own organisation
  (`Generator.lua:325`). Caution: some organisation names contain the old
  case's building name ("{A} Site Office"), which would then name a building
  from the old case (risk R4).
- *Nobody, really* or unanswered: no change.

**What I would check next: that way of investigating is used.** The generator
already shuffles optional papers and takes between 0 and 4 of them
(`Generator.lua:630-656`). With a way chosen, the papers belonging to that way
move to the front of the shuffled list (no new draw), and the case takes **at
least one** optional paper:

| Way | Papers it prefers (existing roles) |
|---|---|
| Follow the person | card with a name (8), ticket/itinerary (9), timing stub (11), duty log (12), private diary (5), objects marked with the name (13, 15) |
| Check the place against its records | tagged key (4), payment slip (10), shift notebook (6), the counted piles (16-19), where the file's count disagrees with the cupboard |
| Listen for it | press clipping (7) only, for now (Q1) |

The existing rules about which papers cannot share a case (`Generator.lua:636-655`)
still apply.

**Which reading I believe: evidence tests it.** The next case is a different
story, so what carries over is the survivor's *stance*: the ordinary reading or
the other one. The case's own agree/disagree draw (`Generator.lua:290`) is
**never** changed, because changing it would confirm or deny. Instead, one
optional paper is added that the chosen stance has to explain:
- Believed the **ordinary** reading: prefer one paper that disputes (payment
  slip 10, timing stub 11, or a pile whose count disagrees).
- Believed the **other** reading: prefer one paper that agrees (duty log 12).
- *I can't tell:* no lean.

No paper says why it is there, and the survivor never remarks on it.

**Unanswered.** Every unanswered question means "no lean" for that part. If
nothing is answered, the next case is built exactly as today.

**Which answers are used.** Only answers not yet used (no `usedBy`). If several
finished cases have unused answers, **the most recently changed set** is used
(Q2). Answers given after the timer has already built a case wait for the case
after that.

**P2-Q27 holds.** Only *what is generated next* follows the theory. Nothing
already in the world moves, no person acts differently, and no paper changes.

---

## 5. Changing one's mind

- Any answer can be changed or cleared, any number of times, from the FILES
  row, while its `usedBy` is empty.
- When the timer builds a case, the answers it uses are read **at that
  moment**. The new case saves its `steer` and the finished case's answers get
  `usedBy`, both in **one** save swap (`GeneratedRuntime.lua:409`,
  `SuccessiveCases.lua:182-192`). There is never a moment where a case was
  built from answers that are still editable.
- If building fails and is retried later, nothing was saved, so the answers
  stay open and the next attempt reads them again.
- A "start over" reshuffle (`SuccessiveCases.lua:141-154`) drops cases and
  answers together, as it drops met names today.

---

## 6. Work breakdown

Each step is small, ships on its own, and changes nothing a player sees until
step 7. Tests are plain Lua (`lua5.1 test/run.lua`). Linux game checks are
named where a step touches the game. Sizes: S about half a day, M one to two
days.

| # | Step | Unit test | Linux game check | Size |
|---|---|---|---|---|
| 1 | **Readings text.** Add a short `readings` pair to each of the 20 premises (per outline where the meaning differs); options 34 characters or fewer. Not part of the built case. | extend `premise_consistency.lua` (every premise has both, lengths, no "you"); `text_lint.lua` | none | M (writing) |
| 2 | **Retired record fields.** Optional `offered` and `answers` on `RetiredCase`, with validation (known values only, names 60 characters or fewer, `usedBy` a known case id). Old records still load. | extend `case_retirement.lua`, `retired_papers.lua` | none | S |
| 3 | **Generator `steer` input.** New option saved in the case, checked on rebuild. Person, organisation, way and reading rules as in section 4, with no draw added or moved. | new `test/case_steer.lua`, modelled on `case_cast.lua`: same seed with or without steer; tamper fails; unsteered cases identical to today over 400 seeds; returning name present; way paper present; the agree/disagree draw never changed. Extend `generator_spec.lua`, `premise_consistency.lua` | none | M |
| 4 | **Budget.** Worst-case `offered` + `answers` + `steer` counted in the headroom sum. | extend `case_budget_headroom.lua` | none | S |
| 5 | **Record at completion.** In the retirement swap, save `offered` from the case being retired. | extend `successive_cases.lua`, `case_retirement.lua` | `core_loop.sh`: after "Case complete", the retired record carries `offered` | S |
| 6 | **Use at creation.** `prepare` picks the most recent unused answers, passes `steer`, and sets `usedBy` in the same swap. | extend `automatic_investigations.lua`, `successive_cases.lua` (lock is atomic; failed build leaves answers open) | `core_loop.sh`: answer through a check helper before `noGap`, then assert the second case's `steer` and the first case's `usedBy` | M |
| 7 | **The question screen.** FILES row, question view, three popups, clear option, read-back note, "gone on" line. | extend `knox_files_labels.lua`, `knoxui_popup.lua`, `evidence_files.lua` | `knox.sh`/`organiser.sh`: open the row, tap each popup, answer, change, clear; screenshot at 0.5x Small and 1x Large | M |
| 8 | **Second thought line** after "That's all of it". | extend `player_voice.lua`, `voice_moments.lua` | `core_loop.sh`: the line is logged once per case | S |
| 9 | **Notebook shows the note** (read-only). | extend `multi_case_notebook.lua` | none | S |
| 10 | **Survives reload.** Answers, lock and steer after save and reload. | covered by 2/3 validation | `reload.sh`: answer, reload, answers intact; still editable if unused | S |

**Suggested order:** 2, 3, 4 (the data and the rules, all offline), then 5 and
6 (wired in, proven by `core_loop.sh` with answers set by the test), then 1 and
7 to 9 (what the survivor sees), and 10 last. Steps 2 to 6 are safe to publish
before the screen exists: with nothing answered, nothing changes.

---

## 7. Open questions and risks

### Owner answers (P4-R121, 2026-09-15)

- **Q1. "Listen for it": a new broadcast paper.** A transcript or scanner-log
  kind of document, which the next case leans on when that answer is chosen.
  It is a new document kind, not a new premise or organiser program, so the
  P4-R107 freeze as written is not broken. Added as step 11 below.
- **Q2. Several finished cases:** the most recently changed unused answers
  steer the next case (step 6).
- **Q3. Timing:** creation waits a short time after a case completes (on top
  of the 24-hour timer) so answers given right away can steer it (step 6).
- **Q4. A returning person never gets a second body**; she returns through
  papers and mentions only. The generator needs a cross-case check (step 3).

**Added steps:**

| # | Step | Unit test | Linux game check | Size |
|---|---|---|---|---|
| 3b | **Cross-case body check.** A person who has a body in any earlier case (live or retired) is never bound to a body again; the returning person appears in papers only. | extend `test/case_steer.lua` and the CasePerson tests | `case_body.sh` unaffected; `core_loop.sh` second case asserts no second body for the returning name | S |
| 6b | **Wait after completion.** No new case is created until a short delay after the last completion (proposed 1 in-game hour), in addition to `minGapHours`. | extend `automatic_investigations.lua` | `core_loop.sh` with `noGap`: second case appears only after the delay | S |
| 11 | **Broadcast paper.** A new document kind (transcript or scanner log) written for the "listen for it" way, with its text passing the premise consistency and lint tests; used only when that answer steers a case. | extend `premise_consistency.lua`, `text_lint.lua`, `case_steer.lua` | `core_loop.sh`: a case steered to "listen for it" places a broadcast paper | M (writing) |

### Risks

| # | Risk | Status |
|---|---|---|
| R1 | Retirement drops the names and premise the questions need, so they must be captured at the moment of completion or they are gone for good. | **Verified** (`RetiredCase.lua:17`, `:123`) |
| R2 | Timer versus answer timing (Q3): steering often reaches the case after next. | **Verified** from code (`AutomaticInvestigations.lua:28-31`); not observed in play |
| R3 | Two zombies dressed as one returning person. `CasePerson.bind` refuses a second person per *case*, but no cross-case name check was found. | **Not verified** (read `CasePerson.lua:249-274` only) |
| R4 | An organisation name built from an old building name ("{A} Site Office") returns in a case at different buildings. | **Verified** that such names exist (`Generator.lua:323-325`); effect in play not verified |
| R5 | Budget: about 13 kB worst case added, 53 kB spare today. | **Verified** by measurement (section 3) |
| R6 | Unsteered cases must rebuild exactly as today, or every save in play is refused. | **Not verified**; step 3 test proves it |
| R7 | At most nine steered cases per save until P4-R111 (archive) is built. | **Verified** (`SuccessiveCases.lua:31`, `GeneratedRuntime.lua:568`) |
| R8 | A new FILES row type could be read as a new organiser program under the P4-R107 freeze. It is planned as a row inside FILES. | Judgement, **not verified** with owner |
| R9 | The "reading" lean is generic (ordinary vs other) because the next case is a different story; players may expect the *same* mystery to continue. | **Not verified**; to judge in play |
| R10 | Popups with names at Large text on a 0.5x machine may wrap badly. | **Not verified**; step 7 screenshots |
