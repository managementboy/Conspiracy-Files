# Cases keep coming, and a refusal is honest (P4-R133)

- **Status:** Design, 2026-09-17. Not built. Owner approved the shape ("I agree
  with all you wrote"); build after the P4-R111 archive work, which touches the
  same files.
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
`no-containers`, `cap`, `active-limit`, `cooldown`, `disabled`, `busy`. Each
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
