# Cases keep coming, and a refusal is honest (P4-R133)

- **Status:** **Built 2026-09-17**, steps 1-5 of the build order below. **Step 6
  done 2026-09-18**: the campaign assertions, the refusal histogram in the
  evidence, a ten-minute `promise.sh` that provokes every refusal code, and
  three `prove.py` mutations (the promise from the wrong clock, a ladder that
  never climbs, the poller's gap going quiet). Step 6 then found a fault in the
  mod itself - **every promise was made in the past** - which was fixed the same
  day and is the last section of this file; `promise.sh` PASSES since
  `20260918T061309-promise.txt`. What a real game then showed is
  under "What the running game said (2026-09-18)" below. The
  fourth rung of the ladder is **not built** and cannot be without a generator
  revision - see "What was built differently" below. Owner approved the shape
  ("I agree with all you wrote").
- **Proven over a journey as well as in one neighbourhood, 2026-09-18.**
  `tools/autotest/checks/travel.sh` walks 9,689 tiles from Irvington to
  Muldraugh in legs of 400 and reads the promise at every one.
  `20260918T232132-travel.txt`: four cases arrived over the journey - one where
  the survivor started, one in the town on the way, two at the destination -
  every refusal typed (`no-containers`, `no-reach`, `active-limit`), no promise
  overdue, no clue placed outside the reach of the trail, and no mod error. A
  case still needs the survivor to have MOVED and to stand still long enough
  for a nearby scan: in three runs out of three the town on the way gave its
  case only after one 80-tile move (`why=busy`, then the case), which is P4-R125
  working as written.
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
  The clue taken is the next one in turn (`Session.pick`, a wrapping cursor
  per session), not always the first: until 2026-09-24 it was `waiting[1]`
  every attempt, and one receipt with "no-containers" at a house the survivor
  had left held four placeable clues behind it at a loaded site.
- **"Already searched"** means the player looked — took something out, or the
  loot panel showed the contents — never that the engine generated the loot
  (`SearchedContainers`, DR-20260924-SEARCHED-MEANS-LOOKED). Reading
  `isExplored` for this refused 23 of 24 containers in a house never entered,
  which is why instalments used to find nowhere to go.
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
`no-containers`, `cap`, `active-limit`, `cooldown`, `disabled`, `busy`,
`gap` and `outdoors` (both added 2026-09-18, see below). Each
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

**And it turns out the reach filter is not what keeps a case near the survivor**
(measured 2026-09-19, `20260919T003043-prove.txt`, mutation `reach-traded`).
`Reach.radius` was doubled for a fresh survivor (250 to 500 tiles) and the
travel check's per-leg reach assertion did not move: `CFCamp.placement` duly
reported "reach 500", and all 6 sites and 18 placed clues of the run's three
cases were still inside 250 tiles of the trail. Three other guarantees bind
first, and any one of them is enough:

- `T3Nearby` keeps the **nearest three buildings per category**, so a wider
  radius adds candidates that the selection then never reaches;
- `prepare` keeps only sites with **observed storage** (`#available>=1`), and
  storage can only be observed in the streamed world, which is where the
  survivor is;
- `Session.target` requires every container to lie **inside the site's own
  footprint**, so a site cannot be recorded in one place and filled in another.

So a site outside the reach of anywhere the survivor has been is not something
a single-line reach bug can produce - the assertion is a consequence of those
three rather than a guard of its own, and it is kept as a regression net, not
as a proven-falsifiable assertion. What DID have to change first is the check:
`travel.lua` judged every site with `Reach.radius` itself, so widening the
mod's reach widened the yardstick with it and no reach mutation could ever have
been caught at all. It now keeps its own copy of P4-R55's radii.

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
- **One more new code, `outdoors`** (2026-09-18, found by the travel check).
  The first case of a save is anchored on the building the survivor is standing
  in, so `GeneratedRuntime.start`'s `firstHouse` path waits until they are
  inside one - and that wait said nothing at all: a player who spawned on a
  street got no case and `automaticStatus()` read `why=nil`, the one gap left in
  "every silence has a reason". `travel.sh` had written it into its own header
  as a fact to live with. None of the eight existing codes fits: `busy` is a
  placement already running, `cooldown` is P4-R125's fifty-tile wait and would
  promise half an hour, `gap` is the wait between cases and there is no previous
  case to pace from, and a counted code would walk the ladder up for a standard
  no rung can lower - only stepping indoors ends this wait. Like `cooldown`,
  `busy` and `gap` it is **never counted**, and like them it changes nothing
  about WHEN the first case is created: only what is said about the wait.
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
| the poller's own silence (`gap`, `busy`, `cap`, `disabled`, `active-limit`, `outdoors`) | `client/AutomaticInvestigations.lua` (`poll`), `client/GeneratedRuntime.lua` (`R.deferPoll`, `silence`) | `test/auto_poll_reasons.lua`, `test/automatic_investigations.lua` |
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
   also never an instalment (P4-R66). Under the owner's 2026-09-22 clarification
   it is delivered on the survivor and noted immediately; its starting-house
   container assignment remains the physical origin and fallback.
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

## What the running game said (2026-09-18)

Step 6, run on the Linux machine at commit `dbbf659` and after. Every number
below is in the evidence file named beside it.

| what | seen | where |
|---|---|---|
| a clue placed later as an instalment | **yes**, `ev=placed doc=generated:1442066456:document-4 why=instalment` - and it went onto a carrier, because the site had no free container left | `20260918T032829-instalments.txt` |
| a clue that never found a home expiring | **yes**, `ev=stale doc=generated:1442066456:document-6 why=expired n=1`, with `DEFER_EXPIRE_HOURS` lowered from 72 to 1 for the stage (the constant is the only thing changed) | `20260918T032829-instalments.txt` |
| the filler placing at the waiting clue's own site | **yes** - the only instalment of the campaign run was placed after the survivor was sent back to that clue's site | `20260918T023400-campaign.txt` |
| every refusal code carrying a non-nil `why`, a due hour and an `ev=defer` line | **yes** for `gap` (`due=17:03`), `active-limit` (`active=1/1`, and `n=3 rung=1/3` at `active=4/4`) and `cap` | `20260918T035305-promise.txt` |
| `why` no longer nil at `active=4/4` | **yes**: `why=active-limit n=3 due=03:16 rung=1/3 active=4/4`. It does read nil for the few seconds after a case arrives, which is correct - nothing is being withheld then | `20260918T035305-promise.txt` |
| no spurious broken promise | **yes**: `gap`, `active-limit` and `cap` were each offered to the assertion and each answered "nothing was promised worth failing on" | `20260918T035305-promise.txt` |
| the ladder rising with the count | **yes**: 3 refusals of one code, rung 1 of 3, in both the campaign histogram and `promise.sh` | both |
| the count rising over a long run | **yes**: `active-limit: 5 lines, longest run of 3, rung 1` and `no-containers: 2 lines` | `20260918T023400-campaign.txt` |
| a clue arriving late found by Search Mode | **not until 2026-09-18**: the one late clue of these runs went onto a zombie that then walked out of the mod's find radius, and Search Mode will not stay on beside a walker. A corpse can carry a clue since the `getContainer` fix, and only a corpse may (P4-R136) - see CLUES_ON_THE_MOVE | - |

### Fixed 2026-09-18: the promise was made in the past

`promise.sh` failed on this deliberately, at commit c0071c3 and after
(`20260918T045250-promise.txt`):

    why=no-containers n=1 due=02:10 rung=0/3 now=02:11 overdue=true(0.01h)
    FAIL: the refusal promised 02:10 and it is already 02:11 - a promise cannot
          be kept, or broken, if it is made in the past

`dueFor` answered `math.max(now, last+gap)` for every code but `cooldown`, and
`AutomaticInvestigations.poll` only ever asks the generator for a case once that
gap has passed - so `last+gap <= now` by construction, the due hour WAS `now`,
and a fresh `no-containers` or `no-reach` refusal was overdue a minute of
in-game time later. Step 6's own rule - "before the promised hour it is a
finding, past it a failure" - therefore could not mean anything for exactly the
two codes it was written for.

It was not noticed for a day because the code that stands a second later is
usually `cooldown`, whose due hour came from the other line (`now +
DEFER_HOURS`) and was honest; a check that re-read the promise instead of
keeping the refusal it matched was always asking about the cooldown.

**The fix.** The rule is now pure and lives in the domain module,
`Generated/SuccessiveCases.dueHours(code, now, wait, gap, last)`, where a unit
test can hold it to account without a game (`test/case_refusals.lua`, section
1b: every code, every state of the save, always in the future):

- `wait` - P4-R125's half hour - is the **floor** under every promise, because
  nothing is re-scanned inside it. A `cooldown` is that wait still standing, so
  its end is the whole of its promise.
- every other code promises whichever is later, the floor or the ordinary gap
  measured from the last case created. Never `now`, and never `math.max(now,
  ...)`, which is the shape of the fault.
- the least a promise may be is `MIN_PROMISE_HOURS` (a quarter of an in-game
  hour, the same interval inside which a repeated refusal is the same refusal),
  so a check that turns the movement wait down to nothing still gets a promise
  that means something.

`prove.py`'s `promise-overdue` mutation now points at that floor and is
catchable for the first time.

## Known unexplained

### A clue the record calls `placed` that is not in its container

**2026-09-18: the diagnostic is in, and it has fired once - on something else.**
`CFCamp.faultFive` now prints, on any clue the harness cannot find, the stored
target, `World.resolve`'s verdict on it, the `relocations` count, the last
sighting, and whether the item is really in the world within four tiles of its
recorded square (suspect 1 below). The campaign run `20260918T023400` fired it
once, and the answer was not this fault:

    status=placed relocations=0 site=t3:10977704480342026 missingHours=4.15;
    target=10762,10120,0 type=carrier sprite=zombie carrier=zombie;
    World.resolve REFUSED the target (nil); no item carrying the token within
    4 tiles of the recorded square or of the survivor;
    whereabouts=uncertain (On a zombie close by.)

That is a clue on a zombie that walked off - P4-R134's own "a carrier that is
gone", already counting its hours towards the drop - not a clue missing from a
cupboard. Suspect 1 (the mod sees two tiles, the harness searched one) is
therefore still untested by a real firing, and suspects 2 to 4 are untouched.
The diagnostic stays in; the next run that fires it on a FIXED container will
say which suspect it is.

**What was seen.** Three of nine overnight runs (2026-09-17/18) reported one
clue the record called `placed` and the harness could not find: `accounted In a
cupboard at 302 Irma Dr.` with nothing in that cupboard, after the survivor had
travelled away and come back. Two other failures of the same shape were harness
faults and are fixed (a clue in a dead man's jacket, which the harness did not
know to look in, and a carrier that had walked off, which it now finds by the
mod's own mark - campaigns `20260917T234706` and `20260918T003507`). This one
has no cause. Nothing was invented to fix it; what follows is what the code can
and cannot do, so the next run can settle it.

**Ruled out, with the reason.**

1. **The filler cannot write an item into a container that then fails
   validation.** It validates the target through `api.assign` *before* anything
   is created: a refused assignment is logged and the attempt ends, and only a
   successful one enqueues the ordinary placement job. That job re-resolves the
   container, creates the item, counts it, and only then records `placed`. So a
   clue's first `placed` is always true. *(One wrinkle, not a fault: the
   filler's `ev=placed why=instalment` line is written when the clue is
   ASSIGNED, a moment before the item exists. A reader auditing the log, rather
   than the store, can see "placed" for an item that is one scheduler step
   away.)*
2. **A chunk unloading and reloading does not lose the item.** Item ModData
   survives it - that is how the clue is recognised again at all - and the only
   thing the mod re-stamps on load is `setDisplayCategory`, which is a runtime
   property the engine never saved (2026-09-13). If the square's object list
   shifts, `World.resolve` refuses the target on its sprite and container type,
   which makes the clue temporarily *unresolvable*, never removed: the record
   then says "uncertain", and the periodic scan finds the item again by walking
   every container within two tiles of the survivor.
3. **The whereabouts scan does not invent `accounted`.** Both `placed` and
   `accounted` require a real sighting of an item carrying the clue's token.

**Not ruled out, in the order I would bet on them.**

1. **`placed` does not mean "in the container the record names".** The periodic
   identity scan sets `placed` whenever it sees the item *anywhere* it looks:
   the survivor's inventory and bags, their vehicle, the resolved target
   container, and **every container within two tiles of the survivor**. The
   harness searches the recorded square and the eight around it - **one** tile.
   A clue genuinely findable two tiles from its recorded square therefore reads
   as "not on or next to its square" while the record honestly says "In a
   cupboard at 302 Irma Dr". This costs nothing to test and would explain the
   record and the failure together.
2. **Relocation is not atomic, and the canonical write comes last.** The
   relocation job removes the old item and adds the new one, and only then calls
   `api.relocate` to move the target. If that canonical write is refused - a
   save refusing the write, the budget, any validation - the clue is already in
   its new cupboard while the record still names the old one, and the scheduler
   swallows the error as a subsystem failure, so nothing in a run's evidence
   would show it. The shape it leaves is exactly the shape reported, including
   the address: relocation moves a clue to ANOTHER of the case's sites, so the
   record's words would name the new building while its coordinates name the
   old one. It also only ever fires while the survivor is more than twenty tiles
   away from both ends - which is "travelled away and came back".
3. **A stale sighting reads as current for longer than it should.** A miss never
   clears `seen`: the state stays `accounted` with the old words until
   `MISSES_BEFORE_UNCERTAIN` (5) reported scans have missed. Worse, the
   scheduler takes at most `maxJobs=32` queued jobs and silently refuses the
   rest, and each tick enqueues a placement job per document of every live case
   *first*: at four active cases with twenty-two documents that is 22 jobs
   before the four identity jobs, the four relocation jobs, the four filler jobs
   and the carrier watches are even offered. So near the active limit the scan
   that would notice a clue had gone can be skipped for whole ticks, and
   "accounted" can be minutes old rather than seconds. (The same cap starves the
   filler at the limit, which is worth its own look: it is a plausible second
   reason a waiting clue sometimes never arrives.)
4. **Relocation may put a clue in a container another CASE's clue holds.** Its
   destination scan passes no accept predicate, unlike the filler's, and
   `Session.validate` does not check container distinctness - P4-R67 is enforced
   at creation (`createDistributed`) and by the filler (`usedPhysicalKeys`)
   only. `StaleClue.destinations` excludes sites holding another clue of the
   same case, so this needs two cases sharing a building. It would not lose a
   clue, but it breaks a guarantee the design leans on.

**The cheapest next diagnostic.** One read-only line, and the next campaign
failure answers the question by itself. When the check cannot find a document,
it should print, beside what it prints now:

- the target as the store holds it (`x,y,z`, `objectIndex`, `containerIndex`,
  `containerType`, `sprite`) and **what `World.resolve` says about it** -
  `unloaded`, `target-changed`, or a container;
- **where the last sighting actually was, in coordinates** - the square of the
  item's own container, not only the words - and how many scans ago it was
  (`sightings[id].misses`);
- the assignment's `relocations` count.

That distinguishes every candidate above in one line: two tiles away (candidate
1) shows a resolvable target and a sighting square one or two tiles off; a
failed relocation (candidate 2) shows `relocations` unchanged with the sighting
in a different building; a stale record (candidate 3) shows misses climbing with
no sighting square at all. It needs `sightings` to remember the coordinates it
already reads from the item, and a `R.devSighting(id)` beside `R.devLocations` -
both read-only, both debug-only, neither touching how a clue is placed.

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
