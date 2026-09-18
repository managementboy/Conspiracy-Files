# Cases keep coming, and a refusal is honest (P4-R133)

- **Status:** **Built 2026-09-17**, steps 1-5 of the build order below. Step 6
  (the campaign assertions, the refusal histogram in evidence and the
  `prove.py` mutation) belongs to the checks and is not in this change. The
  fourth rung of the ladder is **not built** and cannot be without a generator
  revision - see "What was built differently" below. Owner approved the shape
  ("I agree with all you wrote").
- **Game:** Build 42.20.
- **Related decisions:** P4-R67 (each clue in a different container, defer
  rather than stack), P4-R125 (a refused case waits 50 tiles or half an hour),
  P4-R126, P4-R111 (archive), P4-R17 (500 KB save), P4-R132 (clues are found by
  searching).

## The fault

`prepare()` picks sites from the catalogue, then throws the whole case away
unless each site can supply its share of distinct unused containers. Standing
still exhausts the loaded area, so the case is refused and waits for the
survivor to move. In the campaign run of 2026-09-16 that refusal
("insufficient distinct loaded storage nearby") fired 17 times and no second
case ever arrived. For a player who bases in one house, cases stop coming and
the mod says nothing.

## Decided shape

### 1. Instalments

A case goes live with the clues that fit now. The rest stay as an open order:
an assignment with a `deferred` status, no target, and its intended site named
by the `locationId` the schema already validates. A deferred assignment is
cheaper than a placed one (no target table, no sprite string).

- **The filler** runs beside relocation on the existing tick dispatch: one job
  per session, one deferred clue per attempt, reusing `boundsScan` over that
  clue's own site, the `physicalKey` uniqueness check against every live
  assignment, and the "not too close to the player" guard so nothing
  materialises under the survivor's feet.
- **Why ordinary movement is enough:** `Storage.scan` only ever sees loaded
  squares. A house catalogued from the street yields one or two candidates and
  eight once the survivor walks in.
- **Nothing unearned:** the record projects only discovered rows, so a partial
  case shows what was found and never a total. No surface may say "3 of 5".
- **Completion** requires no deferred clue left, so "nothing left to find" and
  the closing question do not fire while a clue is unwritten.
- **Limits unchanged:** a partial case counts against the four active cases,
  and the 24-hour gap is still measured from the case's creation. An instalment
  is not a creation.

### 2. Waiting clues expire

A deferred clue that cannot be placed within **three in-game days** is dropped.
The case then completes on the clues it got: a four-clue case is still a case.
Without this, half-placed cases squat the active slots and block new cases
worse than the original fault.

### 3. Honest refusals

One closed set of reason codes replaces the refusal strings: `no-reach`,
`no-containers`, `cap`, `active-limit`, `cooldown`, `disabled`, `busy`, and
`gap` (added 2026-09-18, see below). Each
refusal records the code, a per-code count, and `dueHours`, the in-game time by
which the next case is expected. The record lives in the case store's existing
`schedule` slot (about 150 bytes) so it survives a reload.

**The ladder.** After three refusals of the same code, the generator lowers its
own standard, in this order, one rung at a time:

1. a smaller case (fewer clues, down to the generator's minimum);
2. one step wider reach;
3. release the oldest finished case's sites back into the pool;
4. accept a single-site case.

Reachability itself is never traded: an unreachable clue is not a clue.

**In fiction the player sees nothing.** No voice line, no marker, no hint. The
world simply thins out: the next case is a little smaller or a little further.

**One log line per refusal**, in the existing format, e.g.
`ev=defer why=no-containers n=17 rung=2 due=13:15`, plus the rung and debt on
delivery, so a whole run can be audited with one grep.

**The poller's own silence, added 2026-09-18.** The honesty above stopped at
the generator's door. `AutomaticInvestigations.poll` is what decides whether to
ask for a case at all, and it returned quietly five times over: at the store's
cap, with no schedule to pace from, at the four-case active limit, inside the
ordinary gap between cases, and inside the extra hour after one finished. So "no
case came" was still unexplained (`why=nil`) in exactly the states a long save
sits in - `active=4/4` above all, which is where a real run was found sitting.
Each of those now reports its code through `R.deferPoll`, which is `refuse`
under another name: the same `ev=defer` line, the same `automaticStatus().defer`.

Two things this required:

- **One new code, `gap`** - the ordinary wait between cases (`minGapHours`, and
  the extra hour of P4-R121). It is the only code added since the set was
  closed. `cooldown` does not fit: that is P4-R125's "move on fifty tiles" wait
  and its promise is half an hour, so reusing it would have promised a case in
  half an hour when it was twenty-three hours away - and section 4 below fails
  the run on a broken promise. Like `cooldown` and `busy` it is **never
  counted**: it is our own pacing, not the world failing to supply a case.
- **An uncounted code is now reported, not merely logged.** `refuse` kept the
  counted debt in the save and returned early for the rest, so `why` was nil
  for every wait of our own making. The last reason for the silence is now
  remembered beside the debt (counted or not, generator's or poller's) and is
  what `automaticStatus` answers with; only a counted code still walks the
  ladder or writes the save. Both waits also promise the hour they are actually
  waiting for, so a promise a poller makes is never already broken.

Nothing about WHEN a case is created changed: every condition, and their order,
is what it was. Pinned by `test/auto_poll_reasons.lua` (every exit's code, and a
healthy save still getting its case), `test/nearby_deferral.lua` and the real
runtime in `test/automatic_investigations.lua`.

### 4. The checks stop forgiving it

- The campaign check polls the generator's own promise and **FAILS** when the
  stated time passes with no case: "the generator promised a case by 13:15 and
  none came (why=no-containers n=17 rung=2)".
- It **FAILS** if any code's count passes the threshold while the rung never
  advances.
- The assertion is on a case whose clues all reach `placed`, not merely on a
  case being created, so the ladder cannot satisfy the check with a case nobody
  could find.
- Every run's evidence file prints a refusal histogram: code, count, longest
  wait, rung reached.

## Rejected: reserve the site, write the clue later

A case would reserve sites as identities (building, room, container kind) and
write the item when that area loads or is first searched, removing the "must be
loaded now" requirement entirely. Rejected: a container is identified by its
index in the engine's object list for a square, and that list shifts as the
world burns, rots, erodes and gets barricaded. Resolving a reservation later
means choosing a container the generator never saw, which weakens "one clue per
container" (P4-R67) to one clue per room. Instalments get most of the benefit
without touching that guarantee.

Kept as a possible later refinement, because it is the only idea that removes
the loaded-area requirement: reserve only buildings the survivor has already
been inside (the visited-building log), where geometry is known without
loading.

## Not decided, later candidate

Clues carried in on **mobile containers**: a body, a zombie's pockets, a parked
car's glovebox, a mailbox on the road the survivor uses. Mobile carriers never
run out and are always distinct, and finding a note in a dead man's jacket at
the fence is a better moment than the twelfth cupboard. It would make basing at
home a different kind of play rather than a starved one.

## Build order

1. **Typed refusals, no behaviour change:** one `refuse(code)` helper replacing
   every refusal string, the `ev=defer` log line, the promise (`dueHours`), and
   `automaticStatus` reporting code, count, due and rung. Then flip the
   campaign check's finding into a failure, so the next long run is auditable
   before any behaviour changes.
2. **Debt that survives a reload:** the schedule record, its validation, and a
   test proving a save and reload does not reset a count.
3. **Instalments:** the `deferred` status in the session schema (validate
   accepts a nil target when a site is named), `createDistributed` returning
   what it could not place, `prepare` refusing only when nothing at all fits,
   the filler job, and the completion test requiring no deferred clue.
4. **Expiry:** three in-game days, then dropped; completion counts a dropped
   clue as accounted for.
5. **The ladder:** rungs in the order above, each with its own test, including
   a smaller case that still validates and still carries a contradiction.
6. **Checks:** campaign assertions, the refusal histogram in evidence, a
   `prove.py` mutation for the deadline assertion, then the full suite, a boot
   check and a long soak.

## Where it lives

| part | code | test |
|---|---|---|
| the closed code set, the thresholds, the stored debt | `Generated/SuccessiveCases.lua` (`DEFER_CODES`, `REFUSALS_PER_RUNG`, `MAX_RUNG`, `defer`, `setDefer`, schedule validation) | `test/case_refusals.lua` |
| `refuse(code)`, the `ev=defer` line, the promise, the rung, `automaticStatus` | `client/GeneratedRuntime.lua` | `test/case_refusals.lua`, `test/nearby_deferral.lua` |
| the poller's own silence (`gap`, `busy`, `cap`, `disabled`, `active-limit`) | `client/AutomaticInvestigations.lua` (`poll`), `client/GeneratedRuntime.lua` (`R.deferPoll`, `silence`) | `test/auto_poll_reasons.lua`, `test/automatic_investigations.lua` |
| the `deferred` / `dropped` assignment, `assign`, `drop`, `accounted`, `expiredIds`, `physicalKey` | `Generated/Session.lua` | `test/case_instalments.lua`, `test/storage_candidates.lua` |
| the filler job and the expiry it applies | `client/GeneratedRuntime.lua` (`filler`, `usedPhysicalKeys`, `boundsScan`'s accept predicate) | `test/case_instalments.lua` |
| a finished case that lost a clue | `Generated/RetiredCase.lua` (`retire` asks `Session.accounted`) | `test/case_instalments.lua` |
| the ladder | `client/GeneratedRuntime.lua` (`rungNow`, rungs in `prepare` and `R.nextCase`), `Reach.wider`, `T3Nearby.start`'s radius source, `Generator.generateNew`'s `context.radius` | `test/case_ladder.lua` |
| the budget | - | `test/case_budget_headroom.lua` |

## What was built differently, and why

Everything above is built as decided except these five points, each of which the
code forced.

1. **The fourth rung - a single-site case - is not built.** A case is
   re-derived from its seed on every load (`Generator.validate` rebuilds it and
   compares), and the schema requires exactly two locations, each a distinct
   building with observed storage. A one-location case is therefore a generator
   revision: every case in every existing save stops validating, which is a
   fresh game (P4-R77). Nor can the second site simply be a building with no
   loaded container: a site is only eligible once a container has actually been
   seen in it, and reserving a site to write the clue later is the idea this
   design already rejected. `SuccessiveCases.MAX_RUNG` is therefore **3**, and
   `automaticStatus` reports `rungMax` so a check can tell a ladder that has
   run out of rungs from one that is stuck. **Owner decision needed** if the
   fourth rung is wanted: it costs a generator revision, so a new game.
2. **A case still needs one container at each of its two sites**, not merely
   "anything at all that fits". A case is a claim and a record that contradicts
   it, in two places (`Generator.MIN_EVIDENCE`), and a case that went live with
   a single clue could never finish: `RetiredCase` needs at least two rows, so
   the case would squat one of the four active slots for ever - the starvation
   this design's own risk section warns about. The first case's opening clue is
   also never an instalment (P4-R66).
3. **`cooldown` and `busy` are logged but never counted.** A cooldown is the
   wait we imposed ourselves (P4-R125) and busy is a placement in progress.
   Both are polled every ten seconds, so counting them would walk the ladder up
   for nothing and would validate and rewrite the whole case store every ten
   seconds - the fault P4-R125 was written to fix, in a new place. They are
   logged at debug level with the standing debt's numbers. The counted codes
   are `no-reach`, `no-containers`, `cap`, `active-limit` and `disabled`, and
   the same code counts at most once every quarter of an in-game hour.
4. **The rung is the highest any one code has earned**, not the current code's.
   Refusals are counted per code (so a `busy` in between cannot reset a
   `no-containers` count), and the ladder position is a property of the
   generator rather than of one refusal.
5. **Rung 1 searches seeds rather than trimming clues.** A case cannot be made
   smaller: a smaller case is a different case. So the rung generates up to
   three further cases from seeds derived deterministically from the one asked
   for and keeps the smallest, down to the generator's own minimum (measured:
   two clues, seed 7 of the synthetic fixture). It re-draws the site pair too,
   which is a second reason it helps.

**Measured.** The debt costs 358 bytes by the project's own estimator (a
deliberate 4x ceiling; the real record is about 90 characters) and the whole
schedule 1,548 bytes at sixteen cases. Four partial cases plus the full archive
come to 314,944 bytes against 326,108 for four fully-placed ones, so
instalments make the worst case *smaller*: a waiting clue has no target, no
sprite and no coordinates. Worst case whole save is unchanged at 326,108 +
120,000 reserved of 500,000 (test/case_budget_headroom.lua).

**What still needs a real game.** Everything above is proven in plain Lua. Not
yet proven in play: that the filler's `boundsScan` really finds containers in a
house the survivor has walked into, that a clue arriving late is found by
Search Mode exactly like any other (P4-R132), that nothing appears in view of
the survivor, and that a long run's `ev=defer` lines show a count rising and a
rung rising with it.

## Risks

- **Starvation moving up a level:** deferred clues that never place would block
  the active slots. Expiry (section 2) is what prevents it, and the campaign
  check must assert that no case stays partial past expiry.
- **A ladder that satisfies the check instead of the player:** a wider reach or
  a released site could deliver a case whose clues sit far away or in
  containers already looted. The assertion is therefore on clues reaching
  `placed`.
- **Determinism:** a case is re-derived from its seed, so instalments must not
  change the case's content, only where and when its clues land.
