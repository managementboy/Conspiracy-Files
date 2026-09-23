# Claude handoff: verify occupational-lead foundations and fix defects

## Objective

Test the implemented foundation behind the owner's `Rolf White (Journalist)`
playtest, repair reproducible bugs, and report the boundary honestly. Preserve
the game's world-first, dual-conspiracy philosophy while fixing it. Do not
claim that occupation-driven case generation works: it is designed in
[`../design/OCCUPATIONAL_WORLD_LEADS_2026-09-23.md`](../design/OCCUPATIONAL_WORLD_LEADS_2026-09-23.md)
but is not implemented on this baseline.

Start from GitHub `main` at this handoff commit or a descendant. Read:

1. `AGENTS.md`;
2. `docs/design/OCCUPATIONAL_WORLD_LEADS_2026-09-23.md`;
3. `docs/design/DUAL_CONSPIRACY_WORLD_EVIDENCE_VISION_2026-09-22.md`;
4. `docs/design/EVIDENCE_ROLE_SCHEMA.md`;
5. `docs/management/LINUX_AUTOTEST.md` and
   `docs/management/PLAYTEST_PROCEDURE.md`.

## Authority and limits

Fix reproducible defects in the implemented observation, opening-key, address,
outfit, provenance and limited vehicle-scene behavior. Add a regression for
every fix. Routine bug repair does not need another owner round trip.

Do not implement the broad occupational generator as an incidental test fix.
Do not publish to Workshop, change Workshop metadata, or change visibility as
part of this handoff. Commit and push tested fixes to GitHub and give the owner
the commit, exact commands, results and evidence paths.

Fresh saves are allowed. Do not delete owner saves.

## Philosophy is an acceptance gate

A technically passing fix is a failure if it violates any of these rules:

- Observe before inferring. Never turn a card, outfit or credential into a
  confirmed identity or employment claim.
- Preserve provenance. A wallet taken from a corpse remains connected to that
  unidentified body after transfer, save and reload.
- Do not identify the corpse as Rolf merely because it carried Rolf's card.
- Do not assert that Rolf and Henrietta knew each other merely because their
  cards shared a wallet.
- Paper establishes names, dates, destinations and claims; it does not replace
  physical events.
- Profession explains expertise, access or a reason for presence, never Knox
  immunity, guilt or privileged truth.
- Farm Zero and Delivered Agent remain live competing readings. Do not add a
  truth score, canonical winner or omniscient explanation.
- Do not fix missing content by inserting evidence into a location the player
  already searched.
- A grouped physical scene is one finding, not one clue per object.
- Optional vanilla randomness may enrich a case but may not make an essential
  chain impossible.
- Keep scans bounded and repeatable. Do not add broad per-tick world scans.
- Keep survivor voice in first person. The opening survivor's immediate state
  uses present tense; retrospective discovery records use past tense only when
  the discovery is in the past.

If a requested behavior cannot be implemented without breaking a rule, stop
that fix, record the conflict and propose the smallest philosophy-safe change.

## Gate 1: source and offline baseline

Run from a clean checkout and save all output:

```bash
git status --short --branch
lua5.1 test/run.lua
tools/kahlua/run.sh --parse-all
tools/autotest/boot_check.sh
```

The boot check must prove all mod Lua loaded, no mod stack error occurred, and
the player survived startup. A missing executable, missing `PZ_HOME` or machine
configuration problem is **BLOCKED**, not a test failure and not a pass.

Run the existing focused checks at minimum:

```bash
tools/autotest/checks/wallet_id.sh
```

Also run the relevant unit fixtures in `test/identity_observations.lua`,
`test/container_provenance_text.lua`, `test/identity_observer.lua`,
`test/identity_outfit_backfill.lua`, `test/generated_evidence_identity_collision.lua`,
`test/opening_premise.lua` and the Fitness Instructor opening tests reached by
`test/run.lua`. Do not silently skip a named fixture; report how it was reached.

## Gate 2: controlled corpse-wallet scenario

Create a fresh debug save and use a repeatable fixture or game-supported debug
setup to produce this shape:

- an unidentified corpse;
- a wallet on that corpse;
- a business card with a generated name and a printed occupation such as
  `(Journalist)`;
- a credit card in the same wallet with a different generated name;
- optionally, a distinctive body outfit.

Exercise the real player path through the native inventory panes. Test both
opening the wallet on the body and moving the wallet before opening it. The
observer must not learn hidden contents merely because the fixture created
them.

Expected results:

1. The business card and credit card appear once in the organiser after the
   player actually sees them.
2. The printed occupation remains visible; it is not silently discarded or
   rewritten as confirmed employment.
3. The row says the container came from a corpse.
4. The co-carried item is named accurately.
5. Different names are described as different named cards, not as proof of a
   relationship.
6. The body remains unidentified.
7. A readable outfit, if present, is a separate observation and explicitly
   does not identify the body.
8. The observation names the actual address or honest nearby place. It must
   not substitute an adjacent building's street number when the body is inside
   a known building.
9. Reopening panes does not create duplicate rows.
10. Save/reload preserves facts and provenance without changing wording or
    creating duplicates.
11. A generated case item that shares a vanilla item type is not also recorded
    as an unrelated identity observation.
12. Merely seeing `(Journalist)` does **not** start a journalist case on this
    baseline. Record that as the correct current boundary, not a failure.

Repeat the scenario with the same name on a bearer credential and a companion
card. Confirm the wording does not call it another person's card when the names
actually match.

## Gate 3: opening regression

On a fresh Fitness Instructor save, verify:

- the opening key is in the survivor's root inventory as early as technically
  possible;
- the top-of-screen cue appears promptly;
- the key actually locks or unlocks the intended starting-house door;
- the organiser describes the key in first-person present voice at the start;
- the recorded house/address matches the real starting building;
- the ten authored Fitness Instructor variants all validate offline and do not
  become ten cosmetic rewrites of a contradictory physical setup.

At least one native run must exercise the functional door. If native
automation cannot cover all ten variants, report exactly which were validated
offline and which were played; do not label offline rendering as native
acceptance.

## Gate 4: limited vehicle observer regression

Test only what the current code claims:

- candidates need two matching observations before confirmation;
- vehicle identity, position, broad classification and contextual cargo remain
  stable;
- an assigned optional vehicle finding persists its stable signature;
- no missing random vehicle scene can block the essential case;
- the journal does not claim damage, fire, corpse relationships, roadblocks or
  a hidden vanilla randomized-story identity that the observer did not read.

Do not mark the richer future scene system PASS. It is not implemented.

## Bug-fix discipline

For every failure:

1. Reproduce it with the smallest fixture or native sequence.
2. Capture the failing output or log before editing.
3. Identify whether the defect is observation, persistence, rendering,
   placement, address lookup or test setup.
4. Fix the root cause without weakening validation or deleting cautious
   wording.
5. Add an offline regression and repeat the native check when the behavior
   depends on Project Zomboid.
6. Run the complete offline suite, parser and boot check again.

Forbidden shortcuts include hard-coding Rolf or Henrietta, binding every
business card to its carrier, suppressing provenance because it is difficult,
turning all occupational evidence into notes, disabling a failing observer,
or changing a test so that an unsupported inference becomes expected.

## Future Journalist slice: acceptance contract, not a current test claim

If the owner later authorises implementation, it must receive a separate
version and test round. Acceptance requires:

- arbitrary generated names, never a hard-coded playtest person;
- persisted `claimedRole` distinct from body role and survivor profession;
- the original printed label and provenance retained unchanged;
- a dormant lead that does not immediately manufacture a case;
- every adopted connection backed by an observed vanilla fact;
- every generated connection represented by a real reachable carrier or
  physical scene in unexplored space;
- the initial role-bearing discovery used as a genuine finding rather than a
  decorative trigger;
- at least two materially different physical evidence functions;
- no essential dependency on an unconfirmed random scene;
- deterministic save/reload and no duplicate generation;
- two supported central readings and no declared winner.

Until that implementation exists, report these rows as **NOT IMPLEMENTED**.

## Required report

Return a table with one row per gate and one of `PASS`, `FAIL`, `BLOCKED` or
`NOT IMPLEMENTED`. For every PASS, link the log, screenshot or test output that
proves it. List every code change and regression added. End with:

- tested commit SHA;
- fix commit SHA(s), if any;
- pushed branch;
- remaining reproducible defects;
- environment blockers distinguished from test failures;
- explicit confirmation that no Workshop upload or metadata change occurred.
