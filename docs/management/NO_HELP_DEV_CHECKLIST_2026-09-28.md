# CF: No Help — development checklist (engine), from 2026-09-28

Tick a box only when its **proof** is committed and green. Counts only in this
file: no clue text, place, person, scene or map names (the owner plays blind).
Where this list and the plan disagree, the plan
(`docs/design/NO_HELP_TASK3_PLACEMENT_PLAN_2026-09-27.md`) wins; log each
finished phase in its section 8.

Built from an `/adhd` run (logistics, inversion, 3am on-call, game design, ant
colony; 30 ideas; three deepened against the code). Traps it found are listed
at the end so they are not picked up by accident.

**Suggested order:** E1 → A → B → C → D → E2-E4. E1 is small and speeds up
every content round; A must land before D, which needs it to be worth running.

---

## A. Late-game cost — every write is linear in the whole record

Today every change to the world record copies it, re-checks all of it, and
copies it again for the save (`Generated/Session.lua:541-548`). Before a write,
`AreaCase.grows` walks every old area and document. On top of that, the
duplicate-area check is quadratic (`Generated/AreaCase.lua:406`). So the cost
follows how much has been played, not how big the change is.

- [x] **A1 Measure first (report-only).** *Done 2026-09-28: at 1x/2x/5x/10x one write
  walks ~31k/61k/152k/303k elements, 9-86 ms, 3-30 MB allocated: linear in the record.* Add `test/nohelp_soak.lua`. It grows
  one world with the cap lifted to 1x, 2x, 5x and 10x its record at world
  start. At each size it prints the tables visited per write (a counting shim
  on `copy` and the validators), the median ms per write, and the record
  bytes (reported only: No Help has no save-size limit, owner 2026-09-27).
  The ratio check is present but only reports, so the current curve is
  on record before anything changes.
  *Proof:* the test runs and prints the curve; the numbers go into plan §8.
- [x] **A2 Remove the quadratic scan.** In `AreaCase.validate`, a set of seen
  ids replaces the `for j=1,i-1` scan and the similar per-area loops. Safety
  is unchanged.
  *Proof:* the existing AreaCase and area tests stay green; A1's
  tables-visited count goes from quadratic to linear in areas.
- [ ] **A3 Append-only commit for new areas.** `grows` already forbids editing
  old areas and documents, so a write checks only the new tail against index
  sets the session keeps (area id, clue:copy, physical key).
  *Proof:* a differential test in which every soak write goes through the old
  whole-record commit and the new one. Both must accept or refuse the same
  writes and save the same record. The existing corruption cases still
  refuse.
- [ ] **A4 Keyed commits for status, shown, relocate and spent.** Copy and
  check only the touched assignment and keys; the rest of the record is
  shared with the previous one.
  *Proof:* A3's differential test extended to these writes.
- [ ] **A5 Compact consumed clues.** A clue that was found or dropped shrinks
  to a small record (id, status, where it was dropped from), so walks stop
  visiting dead entries. This changes the record's shape, so it **needs a
  migration, never a "stale" refusal** (plan §8, carried forward).
  *Proof:* the soak asserts that live assignments stay bounded while arrivals
  grow, and an old-shape save loads and migrates.
- [ ] **A6 Safety net.** A full check on open, and every K writes.
  *Proof:* a corrupted record introduced between checks is caught at the
  next full check.
- [ ] **A7 Make the gate hard.** Gate on visits AND KB allocated (the visit counter sees only
  `pairs`/`ipairs` loops, so a numeric `for` loop could hide work from it). At 10x the record, tables visited must stay
  within 2x of the count at 1x, and wall time within 3x (wall time is looser
  because plain Lua timing is noisy).
  *Proof:* `test/nohelp_soak.lua` fails without A2-A5.

## B. Reload guard and proof gaps

The question: can a player reload, or can a crash, change what an area holds,
place a clue twice, or reveal the other theory's clue? The plan still owes a
"kill after stage one, reopen, replays once" test (§4 step 4; §4a NH-D3).

- [ ] **B1 Shared engine stub.** Move the stubs in
  `test/nohelp_area_runtime.lua:71-117` to
  `test/fixtures/nohelp_runtime_stub.lua` as `boot(store, world)`.
  *Proof:* `nohelp_area_runtime.lua` runs unchanged on the fixture.
- [ ] **B2 Kill points K0 and K1:** before the area decision, and after its
  clues are saved as waiting. After a reload and replay, the documents and
  leans match the uninterrupted ("golden") run, and the area count does not
  grow.
  *Proof:* `test/nohelp_reload_guard.lua`.
- [ ] **B3 Fake world and kill point K2** (after the spot is saved). From K2
  on, the spot must be identical; before K2 it may legitimately differ. This
  makes "save the spot before 16 tiles" a checked rule. Each clue's pieces
  must exist exactly once in the world.
  *Proof:* same file.
- [ ] **B4 Kill point K3:** the save recorded "placing" but the objects never
  reached the map. Today the clue is marked unknown and never placed again
  (`GeneratedRuntime.lua:283-284`), so it is silently lost.
  **Owner decision needed first** (see "Open for the owner"). Until then the
  case is written as an expected failure.
  *Proof:* the case goes green under the owner's rule.
- [ ] **B5 No peek at the rival theory.** At every kill point, with or
  without a map read, the set of leans seen at each area is a subset of the
  golden run's set.
  *Proof:* one explicit assertion in the reload-guard test.
- [ ] **B6 Double reload.** Reloading twice from one kill point, the second
  time after items were placed, still leaves exactly one of each clue's
  pieces.
- [ ] **B7 Kill at every Nth save** across a multi-area route borrowed from
  the playthrough harness, including scene areas. This catches stage
  boundaries nobody has named yet.
- [ ] **B8 A ground set cleared by the game counts as lost** in
  `test/nohelp_playthrough.lua`, both placed and spotted (NH-D5; §4a says
  "not yet counted"). Also count lost sets separately from found ones.
- [ ] **B9 A floor on the share of clues placed beside a vanilla scene** in
  the playthrough harness (NH-D7, owed). It is a harness check only, **not a
  hard rule in the picker** (see traps).
- [ ] **B10 Update the §4a table** so NH-D3, NH-D5 and NH-D7 name their real
  check files. *Proof:* `test/nohelp_directive_trace.lua` reports none of
  them pending.

## C. Content-blind state dump (what every playtest and bug report quotes)

- [ ] **C1 `client/NHShared/StateDump.lua`.** One `ev=dump` log line, behind
  the same gate as `ClueMarkers.allowed()`. It carries only numbers, plus
  words from a fixed list in the code:
  - assignment status counts;
  - how clues were found (search or Look it over, from `recognisedHow`);
  - scheduler steps and queue lengths per job class, plus the worst frame
    (`R.metrics()`);
  - record bytes (`SaveBudget.checkMany`).

  *Proof:* `test/nohelp_state_dump.lua` builds a fixture session whose ids,
  place names and site names are canary strings. It asserts that no canary,
  no coordinate-shaped pair and no word outside the list appears in the
  output.
- [ ] **C2 Pick saves its own totals** (plan §4a: "read from Pick's own saved
  totals, never recounted on the side"): areas decided, clues per lean by
  area size, cap hits, and stop reasons as codes.
  *Proof:* a Pick test; the dump shows them.
- [ ] **C3 Scene-wait histogram:** walking or driving by wait-length bucket,
  with no cell key and no scene kind (today's wait line carries both).
- [ ] **C4 Autotest check `dump.sh`:** dump after warm-up and after a reload,
  and diff the two (placements must not change across the reload). The lines
  are saved as evidence.
- [ ] **C5 Blind log mode:** existing lines the owner might quote go through
  the same allowlist. This covers the scene-wait `area=` and `kind=` fields,
  free-text decline reasons, and `R.devLocations` (ids and coordinates).
  *Proof:* the canary test is extended to these lines.
- [ ] **C6 Owner trigger:** a debug-gated key or menu entry that writes the
  dump plus the mod and save-schema versions.

## D. Real game (Linux machine, window visible; never `--hidden`)

- [ ] **D1 Save-window spike.** Force-kill the game at intervals, including
  right after an autosave, and count per kill point: saved as placed but not
  on the map, placed twice, lost. This measures the real shape of K3.
  *Proof:* evidence file; the results go into plan §8.
- [ ] **D2 Second visible playtest**, quoting C1 dump lines, with each item
  scripted to reach its stress condition rather than a short, light session:
  - placement keeps going past 32 clues;
  - a clue on open ground gives its hint, the icon fills, and spotting it
    counts as found;
  - a drive at top speed past scenes without ever leaving the car (read the
    scene waits);
  - the frame spike when the game saves;
  - late-game stutter, run on a long save;
  - ordinary clutter confirms no scene;
  - save and reload next to a confirmed scene.
- [ ] **D3 Hang watchdog for unattended runs.** The harness notices when a run
  has gone quiet and ends it with a clear verdict, instead of sitting stalled
  until someone looks.
- [ ] **D4 Log D1-D2 in plan §8**, counts only.

## E. Content tooling

- [ ] **E1 Script the blind re-read:** `tools/cluegates/blind_reread.sh`.
  It renders each clue, runs 5 reads with the `claude` CLI on Haiku from an
  empty folder, with no tools, no settings, and a fresh session per read,
  parses the first word, writes the receipts, and runs the receipt check. It
  skips clues that already have a current receipt.
  *Proof:* rerunning it on today's rendered clues reproduces valid receipts;
  `blind_reread.md` points to the script.
- [ ] **E2 Drift report** (`tools/nohelp_content/drift.lua`): across a batch,
  flag repeated sentence skeletons and repeated human or institutional
  details, and flag when every clue uses the same spot. It writes an
  avoid-list of template fingerprints that the writer reads before the next
  batch.
  *Proof:* on the returned T0001-T0013 batch it flags the repetition we found
  by eye; on a varied fixture it stays quiet.
- [ ] **E3 Wire drift in:** a warning in `convert.lua --check` and in the
  writer's routine (handover §5).
- [ ] **E4 Owner one-pager:** counts only, using C1's allowlist. The writer
  handoff §9 lists it as not built.

## Open for the owner

- **B4 / D1 — if the game crashes at the exact moment a clue is being put
  into the world:** should that clue quietly be tried again later (only if
  you never saw it), or be treated as lost? Recommended: try again, since it
  cannot give anything away if you never saw it.

## Considered and rejected (traps)

- **The scene share enforced as a hard rule in the picker:** it would starve
  areas that have no scene and fight the cap; it is a harness floor instead
  (B9).
- **Refusing or quarantining old saves by record version:** conflicts with the
  standing rule "a shape change needs a migration, never a stale refusal".
- **Treating the late-game cost as a difficulty curve:** the cost is a bug,
  not pacing.
- **Showing the cap to the player (a "pity timer"):** against the design,
  which gives no help.
- **Letting proof gaps be closed by whichever change happens to pass by:**
  they would never close.
- **An append-only decision log for reverting writes:** costs save budget for
  a recovery path nobody has needed.
- **Parked, not rejected:** a sandbox option that stops new placement (a kill
  switch without a code change). Add it if a live save ever needs it.
