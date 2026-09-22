# Release candidate — updated 2026-09-22

**Superseded.** The 2026-09-21 edition is kept below the line.

## Verdict

**BLOCKED.** Not a release candidate.

The campaign gate now **passes**, which it did not on 21 September. What blocks
the candidate is the destination gate's mod errors and the gameplay gates that
have never been run. Nothing is proposed for tagging.

| | |
|---|---|
| Version | `DEV-0.46.1-writing-rebuild` |
| Game | Project Zomboid **42.20.4 (`b0bbce05d5`)** |
| Workshop item | `3797999299`, unlisted, still at `e431d82` — far behind this line |

## Results

| Gate | Result |
|---|---|
| Shipped offline suite | **PASS** — 173 run, 0 failed |
| Prototype suite | **PASS** — 9 run, 0 failed |
| Kahlua parse-all / gate | **PASS** — 124 ok, 0 failed |
| luacheck (errors) | **PASS** — 0 errors |
| Secret scan | **PASS** — 0 findings |
| `git diff --check` | **PASS** |
| Native boot | **PASS** |
| **Native campaign gate** | **PASS** — 0 product, 0 harness failures |
| Gameplay gates (6) | **5 PASS**, 1 re-verified after a stale literal |
| Native: 125 destinations | **INCOMPLETE** — 125/125 reached, **0 mod errors**, 123 place a payoff |
| Combined native save | **PARTIAL** — each half measured, the maximum not |

## What blocks it

1. **Two destinations place no payoff.** `WorldStashMap9` has **no eligible
   non-floor container within twelve tiles** — a content problem with that
   destination, not a timing artefact. `WorldStashMap20` has six eligible
   containers and the trail or scan never reaches them.
2. **The shared-restaurant behaviour is untested in play.** Both designs
   resolve to the same building, but the cross-file finding that needs all
   eight records has never been seen in a game.
3. **The maximum combined save is not established.** Sixteen cases *and* all
   125 trails in one save; no run has produced both.
4. **Following a trail on foot to its destination is unexercised.** Payoff
   insertion and access are proven for 123 of 125; walking one is not.

None of these is the steering defect that blocked the candidate yesterday —
that was never a product defect.

## What was fixed to get here

Zero production defects were found in the campaign. The blockers were in the
harness, and the count is worth stating plainly: **eleven harness defects**,
most of them mine, several introduced while fixing an earlier one.

- three stale expectations asserting the superseded P4-R113 steering rule;
- a stall detector whose fingerprint contained counters that always rise;
- a stall that fired before the remedy it was meant to allow;
- a step-back that parked the survivor in the street;
- `pcall` reported as silencing a Kahlua log it does not silence;
- a polling "speed-up" that cut the waiting by 62% and produced 62 false
  negatives;
- a cleanup trap that swallowed `TERM`, making killed runs hold the machine
  lock;
- liveness decided by matching command lines, which matched the asker;
- evidence stamped with a commit made *during* the run;
- a headline printing PASS while two columns were short;
- an opening pinned to one premise id after they were diversified.

Every one now has a test that fails if it returns.

## The steering "blocker" was never a product defect

Eleven failures on 21 September, and every one came from the gate asserting
the superseded P4-R113 rule. `DR-20260919-CONTINUITY` makes a followed
**finding** outrank the closing questions, and the game logged
`next case follows the finding recorded in generated:1247366911:case` for the
very case the gate called unsteered. No source fix was made or needed.

## Packaging and verification — prepared, NOT executed

```bash
tools/autotest/unit.sh && tools/autotest/prototype.sh
tools/autotest/kahlua_gate.sh
tools/ci/lint.sh && tools/ci/secret_scan.sh
tools/autotest/checks/campaign.sh          # PASSES
tools/autotest/checks/map_coverage.sh      # must reach 0 mod errors
tools/autotest/native.sh --gates           # the six gameplay gates
tools/package.sh && tools/verify_install.sh
```

**No publish, no push of a tag, no release.** Nothing above publishes.

---

# (superseded) # Release candidate — 2026-09-21

## Verdict

**BLOCKED.** Not a release candidate.

One required gate fails on the product, and most required native gates were
never run. The build remains what the owner already authorised it to be:
**playable and unvalidated.**

| | |
|---|---|
| Final HEAD | `9cc5fa5c65b81ffac33848c53e099f17b06a762d` — **nothing is proposed for tagging** |
| Version | `DEV-0.46.1-writing-rebuild` |
| Game | Project Zomboid **42.20.4 (`b0bbce05d5`)** |
| Machine | Linux development box, Intel Iris Xe on display `:0` (hardware) |
| Published Workshop item | `3797999299`, unlisted, at `e431d82` — **older than this line and not what was tested here** |

## Results

| Gate | Result | Revision |
|---|---|---|
| Shipped offline suite | **PASS** — 169 run, 0 failed | final HEAD |
| Prototype suite | **PASS** — 9 run, 0 failed | final HEAD |
| Kahlua parse-all | **PASS** — 124 ok, 0 failed (`kahlua_gate.sh`: PASS) | final HEAD |
| Static checks (luacheck errors) | **PASS** — 0 errors, 2,403 warnings | final HEAD |
| Secret scan | **PASS** — 2,320 tracked files, 0 findings | final HEAD |
| Native boot | **PASS** | `53dbc61` |
| **Native campaign gate** | **FAIL** — 11 product failures, one cause | `e6b9397` |
| Native: 125 destinations | **FAIL** — all 125 reached; 123 pass every column, 2 resolve no payoff, and the run logged **24 mod errors** | `5845cf2` + `d87bc99` |
| Native: opening + continuation | **NOT EXERCISED** | — |
| Native: map journey to payoff | **NOT EXERCISED** | — |
| Native: organiser scrolling / rocker | **NOT EXERCISED** | — |
| Native: shared restaurant in game | **NOT EXERCISED** | — |
| Native: placement interruption/recovery | **NOT EXERCISED** at this line | — |
| Combined native save-state maximum | **PARTIAL** | `e6b9397` |

Release-candidate acceptance requires: shipped suite zero failures **(met)**,
Kahlua zero failures **(met)**, campaign gate PASS **(not met)**, required
native gates PASS or owner-waived with the waiver recorded **(not met, no
waiver)**.

## The blocker

**The survivor's answers steer the case after next, not the next case.**

Proven by the gate, not inferred — it printed the case id:

```
FAIL: case 2 was not built from case 1's answers (steer from: unsteered)
FAIL: case 3 should be unsteered (case 1's answers used, case 2's empty)
FAIL: reload 2: case 3 gained a steer (generated:1357886097:case)
```

`generated:1357886097:case` is case 1. All eleven failures are this one defect
and its consequences.

Inspecting the saved world found case 1's persisted answers to be
`way=person, reading=nil, matters=nil, usedBy=<case 3>`, while the organiser
reported `reading=two, matters=person2, way=records` at answer time and the
gate's assertion on that passed. **Whether that discrepancy is the cause is NOT
ESTABLISHED.** It is the next investigation and wants a focused offline
reproduction, not another ninety-minute run.

Evidence: `evidence/linux-autotest/20260921T154959-campaign.txt`.

## Known limitations

1. Four gameplay gates need long attended sessions and were not run. Absent
   evidence, not passing evidence.
2. The combined save-state maximum is not established. The run reached 192,899
   bytes at 7 of 16 cases with `MapMedia=349` — the map-media root is nearly
   empty because the campaign gate reads no maps. The offline estimator puts a
   combined fixture at **959,031 estimated bytes, 96% of the limit**; an
   estimate is not a native measurement and the two must not be quoted as one.
3. Kahlua cannot run on hosted CI (licensed game jar). CI prints
   `NOT EXERCISED` for it and `tools/autotest/kahlua_gate.sh` is the local gate.
4. The prototype under `dev/next-phase/` is not shipped. Its suite passing says
   nothing about the released mod.
5. `luacheck` reports 2,403 warnings. Errors block; warnings do not.

## Corrections to earlier status documents

- **"All 125 destinations PASS"** was broader than its evidence, which says in
  its own closing section that it establishes geometry only. Corrected; the
  phrase appears nowhere in this line's reports.
- **Save sizes in every earlier campaign report are undercounts.**
  `CFReload.bytes()` summed 11 of `SaveBudget`'s 14 roots under a comment
  claiming it summed all of them, omitting `mapMedia`, `placeVisits` and
  `casePeople`. The 500 kB assertion was made against the wrong number.
- **The updated-marking question is not an open product decision.** The
  prototype's derive was repaired in `a80ef28`; the open item was a
  three-document assumption, now closed.
- **`docs/design/CI_PLAN.md`** said CI was "intentionally not enabled while the
  repository contains no Lua implementation" while 124 shipped Lua files
  existed. Replaced.

## Packaging and verification — prepared, NOT executed

Nothing below has been run. **No publish, no push, no tag has been made or
moved, and none will be without explicit authorisation.**

```bash
tools/autotest/unit.sh                 # shipped suite
tools/autotest/prototype.sh            # prototype, separately
tools/autotest/kahlua_gate.sh          # engine compile gate, needs the game
tools/ci/lint.sh && tools/ci/secret_scan.sh
tools/autotest/checks/campaign.sh      # the blocking gate; must PASS first
tools/package.sh                       # -> dist/ConspiracyFiles-<version>.zip
tools/verify_install.sh
```

Publishing and tagging are deliberately absent from that list.

## The honest summary

The offline baseline is green and now genuinely covers the shipped product.
The campaign gate ran every stage for the first time and found a real defect
that had been hidden behind harness faults. The build is playable. It is not
validated, and one core mechanic — the survivor's answers shaping the next
case — does not work as specified.
