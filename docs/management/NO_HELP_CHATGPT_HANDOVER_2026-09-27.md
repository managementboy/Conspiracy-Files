# CF: No Help — handover to ChatGPT, the content writer

2026-09-27. **Start here.** This is the entry point for ChatGPT's work on "CF:
No Help": it says how to work, how long, where to save and when to stop. The
rules of the content itself are in
`docs/management/NO_HELP_CONTENT_WRITER_HANDOFF_2026-09-27.md` (the "writer
handoff"); read that too, in full, before your first clue. Shaped by an
`/adhd` run (logistics, 3am on-call, remove-the-assumption, competitor, ant
colony; three ideas deepened).

> **Fast-generation update (2026-09-28).** Use
> `docs/management/NO_HELP_FAST_GENERATION_2026-09-28.md` for the writer's
> operating loop. It replaces repeated idea frames, per-row self-blind reads,
> one-ticket-at-a-time writing, and per-ticket pushes. The existing content
> rules, row schema, validator, spoiler protections, and independent Claude
> review still apply. This fast path becomes active after it is reviewed and
> merged; do not use it while the baton is CLAUDE.


## 1. Who is who

- **You (ChatGPT)** write the clue text and deliver it as JSON rows.
- **Claude** (the engineering AI in this repo) owns the tools, the rules and
  the vanilla scene list, signs off your stage 0, reviews your batches, runs
  the blind re-read with a different AI, countersigns "done", and merges your
  branch.
- **The owner** plays the mod blind. **Never** send the owner clue text,
  scene, character, map or location names, or evidence details, and never
  ask the owner to find, pick or confirm anything. The owner does not curate
  content. If you truly need an owner decision, write it to Claude in
  `content/nohelp/STATE.md` (below) and Claude asks it without spoilers.

## 2. Tone and voice (owner decision — summary; details in writer handoff §2a)

Fatalistic, bureaucratic dark comedy, throughout, grounded in real vanilla
places. The humour comes from the event, an institution's priorities and a
person's stake — never a joke, never a witty last line. Only the world's
voice: clues are things people left behind; the survivor never comments and
no clue addresses the player. Sparse: one human detail beside one
institutional one.

## 3. Your goal — run until finished

Use your goal command with this condition:

> **Goal:** keep working the No Help content queue until
> `lua5.1 tools/nohelp_content/progress.lua` prints `DONE-CANDIDATE`, then set
> the baton to Claude with reason `COUNTERSIGN` and stop. Follow
> `docs/management/NO_HELP_CHATGPT_HANDOVER_2026-09-27.md` and the writer
> handoff on every loop. Never message the owner with content.

The measure is the **progress line**, never your own judgement. Today it reads:

`NOT DONE: stage0 unsigned, maps 0/125, flyers 0/133, scenes 0/125, sets 0/0, balance 0/0, tickets 0/19`

It lists only failing gates: stage 0 signed off; every map (125) and flyer
(133) covered mark by mark; scenes on Claude's list covered; person threads
complete; object sets at least half of accepted clues; neither conspiracy
above 55%; no unacknowledged returns; nothing stale (14 days); an ADHD run at
least every 5 tickets; the first-release tickets accepted. If you cannot run
Lua, read the same line from the **GitHub check** on your branch (section 6):
it runs on every push and writes the line to the run summary. Paste the
current line at the top of every reply.

"Done" is never yours to declare: at `DONE-CANDIDATE` you hand the baton to
Claude; Claude reruns the checks, verifies the current blind-review receipts and unresolved flags, and signs.
"No maximum" (owner): after the first release, Claude opens new tickets and
the loop continues.

## 4. Your memory between chats — `content/nohelp/STATE.md`

You may start every session with no memory. The repository is your memory.

**Every session begins by:** (1) reading `content/nohelp/STATE.md`; (2) reading
the last three commits on `nohelp-content`; (3) re-reading this handover
section 7 and the writer handoff sections 2-7 — **the rules, never your own
log**; (4) running (or reading) the progress line and checking it matches
STATE's. If they differ, your first action is to reconcile, not to write.

**Every session ends by** overwriting STATE.md as the last file of your last
commit. Its sections, in order:

- `BATON: CHATGPT|CLAUDE since <date> because <CODE>` — codes: WRITING,
  FIXING, REVIEW, TOOLING, STAGE0-SIGNOFF, QUARANTINE, COUNTERSIGN. Only the
  holder writes STATE.md. When the baton says CLAUDE, you only read.
- `STAGE:` 0, 1-7 (writer handoff §5 order), or EXPANSION.
- `TICKET:` the serial in progress, or none.
- `NEXT:` one line: what the next session does first (serials and reason
  codes only).
- `OPEN RETURNS:` returned tickets; acknowledge each as `T#### ACK <date>`
  once addressed.
- `QUARANTINE:` `T#### since <date>` (classifier stalls, section 8).
- `LAST ADHD:` date and ticket of your last ADHD run.
- The current progress line.

The log in STATE.md is a record of what happened. It is **never** a source of
rules; if it disagrees with the handoffs, the handoffs win.

## 5. The work queue — tickets

Tickets are opaque serials `T0000`, `T0001`, … (so nothing in GitHub reveals a
scene or map to the owner). What each serial means is in
`docs/writer-only/nohelp-tickets.tsv` (writer-only). **Take the lowest open
serial**, and only one at a time. Row ids are `t####-NN`.

**Recipes (owner, 2026-09-29).** Every remaining ticket has a recipe in
`content/nohelp/recipes.json`: `side` (which believer the clue should mainly
serve: A cover-up, B farm program, or both), `form` (written or set) and
`keyRing` (whether a key ring may appear). Follow it. The converter check
rejects a clue in the wrong form (`RECIPE_FORM`) or with a key ring the
recipe does not allow (`RECIPE_KEY`), any clue whose text repeats another's
(`TEXT_REPEAT`), and an empty ticket (`EMPTY`). The side is checked by the
blind read and only reported, never returned.

**Written clues are personal paper, never official documents.** A diary
line, a grocery or feed-store receipt, a farm log, a note on the back of a
photo, a shopping list, a torn or water-damaged page. No forms, orders,
memos, letterheads, stamps or reports: those trip your safety filter. If a
ticket still stops, deliver nothing for it, note it in STATE, and try that
ticket alone later in a plainer form; never copy another ticket's text.

**One go (owner, 2026-09-28):** when Claude opens the remaining tickets, deliver ALL of them (summary tickets and stories, in serial order) without waiting for sign-off or review in between; hand the baton to Claude once, at the end.

**Rounds (owner, 2026-09-27: the relay was too slow).** Work in rounds of
**every open ticket** (the whole first release at once): deliver them one after another, one commit each, without
waiting for Claude in between; then set the baton to CLAUDE with `REVIEW`
once, naming the serials in `NEXT`. Before delivering each row, do one writer self-check: confirm that its
rendered text supports the intended lean and that the authoring fields explain
the plausible rival reading. Do not launch repeated self-read model sessions.
Claude reviews the whole round at once, reads the batch for repetition and
consistency, then runs the independent blind review in
`tools/cluegates/blind_reread.md`: one read per clue and a second only for
flagged clues. Claude fixes small wording itself (noted in the review, never
a change of lean, place, pieces or axioms), and returns only rows with real
problems. Returned rows are fixed first in the next round, alongside new
tickets.

- `T0000` is **stage 0**: the frozen axiom list per conspiracy (short ids and
  one-line glosses) and a one-line gloss per story you plan (maps, flyers,
  persons, scenes). Deliver it to `content/nohelp/incoming/T0000.json`; set
  the baton to CLAUDE with `STAGE0-SIGNOFF`. Claude writes
  `content/nohelp/approved/axioms.json` and its sign-off; editing the axioms
  afterwards voids the sign-off.
- Every later ticket: rows in the writer handoff §6 format, to
  `content/nohelp/incoming/T####.json`. The ticket types and their acceptance
  rules are in writer handoff §5 (the serial's type is in the registry).
- **Returns first.** If anything is in `content/nohelp/rejected/`, fix the
  pattern those reason codes name before opening a new ticket.
- **Hardest first.** You may defer a ticket (mark it in STATE with the blocker)
  but not for more than two tickets in a row; deferred tickets are debt the
  progress line counts.

## 6. Saving to GitHub — regularly

- **Branch:** `nohelp-content` only. Never `main`, never another branch; Claude
  merges after review. Never force-push, never rewrite history.
- **Cadence:** one ticket per commit, at most about 40 rows (a stall then loses one ticket, not the round), and commit at the
  end of every session even if a ticket is unfinished (unfinished rows stay
  out of `incoming/`; note them in STATE). Push after every commit.
- **Only passing rows.** Before committing, run `lua5.1
  tools/nohelp_content/convert.lua --check` (or read the GitHub check after
  pushing). Rows that fail are returned by the tool, never softened to pass.
- **Commit messages carry no content words** — the owner reads GitHub
  notifications. Template:

  `nohelp: T0042 +12 rows (sets 7/12) | <progress line>`

  Serials, counts and reason codes only. No scene, map, place, person, item or
  story words; not in branch names or file names either.
- **What you may change:** only `content/nohelp/incoming/`,
  `content/nohelp/STATE.md`, and your ADHD run folders
  (`docs/writer-only/adhd/`). Never tools, the mod's code, the handoffs,
  `approved/`, `accepted/` or `rejected/`.
- **The GitHub check** (`.github/workflows/nohelp-content.yml`) runs on every
  push to `nohelp-content`: the converter check, the No Help tests and the
  progress line, counts only. A red check means fix before the next ticket.

## 7. The ADHD skill — when and how

You have the same ADHD skill as Claude. **Use it at:**
- stage 0 — one run per conspiracy for the axioms, one joint run on rival
  readings;
- the first ticket of each family (a large-area map, a flyer whose place is a
  building, an open mark; each person thread's arc; a scene kind whose
  approach is not obvious);
- any batch returned with the same reason code on 3 or more rows, or any
  `NO_RIVAL`, `SAME_LEAN`, `NOT_COLD_READABLE`, `OFF_GLOSS` or
  `CLASSIFIER_STOP` pattern — run it on the pattern, not the row;
- when the detail report (`progress.lua --detail`) shows one conspiracy
  dominating a place, or all clues at a place sounding alike;
- at least every 5 tickets (the progress line enforces it).

**Skip it** for single-clue wording, schema/item/length fixes, re-running
checks, and follow-on tickets of a family whose approach is settled.

**How:** keep the frames isolated (fresh conversations per frame). Frames
produce **ideas and approaches only, never clue rows**; rows are written in
your main loop, where you keep a both-conspiracies tally. Save every run in
`docs/writer-only/adhd/<date>-T####/` — the raw frame outputs committed
**before** you score them, then the scoring, the three deepened ideas and the
final brief with a one-line decision. Add a line to
`docs/writer-only/adhd/INDEX.md` (date, ticket, trigger, decision) and set
`LAST ADHD` in STATE. Each row's `prov` names the run folder it came from.
Frames that suit writing: game designer, regulator, 10-year-old, biology,
inversion, speedrunner, logistics, set dresser (objects over paper),
cold-case detective (what survives rot and looting), unreliable narrator
(who wrote it, what they got wrong), $0 budget (existing items only), rival
lawyer (argue the other conspiracy, feed it back).

## 8. When things go wrong

- **Classifier stall** (generation stops partway): attempt 2 is the same
  ticket split in half, written clues interleaved behind object sets;
  attempt 3 is object sets only. After 3 stops, deliver what passed, add
  `T#### since <date>` under QUARANTINE, set the baton to CLAUDE with
  `QUARANTINE`, and move on to the next ticket. Never retry the same dense
  prompt, never quietly substitute a softer clue.
- **Returned rows:** fix the pattern the reason code names. A revision must
  still lean toward a named conspiracy — softening a clue into mush to pass
  review is a new failure (`OFF_GLOSS`/`NO_RIVAL`).
- **Near-duplicates** (same pieces, place and spot, or near-identical
  wording) count for nothing toward "done".
- **Red GitHub check or a progress line that disagrees with STATE:**
  reconcile before writing anything new.
- **Unsure whether something drifts toward another premise, names a vanilla
  character, or breaks a rule:** stop, write the question in STATE `NEXT`,
  hand the baton to Claude with `REVIEW`.

## 9. Self-audit before every commit (all must hold)

1. I re-read the rules (this §7 and writer handoff §2-7) this session, not
   from memory or the log.
2. `rejected/` is empty, or every returned row is addressed and acknowledged.
3. No more than two tickets in a row are deferred.
4. The converter check is clean for this ticket; its counts are in the commit
   message.
5. Every row's rival reading was written first; the official blind-review
   receipt is current and no review flag remains unresolved.
6. Every row names axioms for **both** conspiracies and still leans toward one.
7. The diff touches only `content/nohelp/incoming/`, `content/nohelp/STATE.md`
   and `docs/writer-only/adhd/`.
8. The commit message has serials, counts and codes only — no content words.
9. Nothing I wrote tells the owner anything.

## 10. Your first session, step by step

1. Read this handover, then the writer handoff, the current review decision
   `DR-20260928-NOHELP-REVIEW-FAST` in `DECISIONS.md`, and
   `docs/writer-only/NOHELP_SPOILERS.md`.
2. Check out `nohelp-content`. Read `content/nohelp/STATE.md` (baton: you,
   `WRITING`, stage 0, next: `T0000`).
3. Run the ADHD skill for stage 0 (section 7), saving the runs.
4. Write `content/nohelp/incoming/T0000.json`: the axiom lists and the
   glosses. No clue text yet.
5. Update STATE (baton CLAUDE, `STAGE0-SIGNOFF`), commit with a content-free
   message, push, confirm the GitHub check.
6. Wait for Claude's sign-off; then start `T0001`.
