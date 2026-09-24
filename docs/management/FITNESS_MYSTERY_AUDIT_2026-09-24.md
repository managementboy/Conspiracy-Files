# Fitness Instructor, first mystery — audited in a real game, 2026-09-24

Goal: play the opening as a Fitness Instructor and answer three questions
about the first mystery — is it part of the hidden central conspiracy, is it
made of real objects, do those objects add value — and fix what fails.

Check: `tools/autotest/checks/fitness_mystery_audit.sh` (+ `.lua`). Native,
PZ 42.20.4, mod `DEV-0.47.6-functional-opening-key`. Evidence in
`docs/management/evidence/linux-autotest/`.

## The three answers

| Question | Answer | Measured (run `20260924T191606`) |
|---|---|---|
| Bound to the hidden conspiracy? | **Yes** | pair `farm-zero-vs-delivered-agent`, registered, valid, no winner field, 2 readings; scenario axis `movement`, bridge sentence resolves; the opening's unresolved question is the central question |
| Real objects? | **Yes** | 4 of 6 documents are objects (Key1, AnimalFeedBag, 9× Hat_SurgicalMask, Cooler), 2 paper (receipt, memo). After the fix below, 3 of the 4 objects exist as items in the world; the Cooler waits for a confirmed vehicle at its site |
| Do they add value? | **Yes** | every object is the subject of 2–3 comparisons and named in each; each is distinct from every paper document; the case offers 2 rival readings |

## What the audit found that was not a check artefact

Run `20260924T183959` (source `0d86a1b`) passed all three questions but left
three object clues waiting, "last reason: none". Standing the survivor at
their site did not change that. Two product defects, both proven live:

**1. "Already searched" was read from the wrong flag.** At Building
10675,10266 — a house the survivor never entered — 23 of 24 indexed fixed
containers answered `isExplored()=true`, `isHasBeenLooted()=false`, with loot
inside. The engine sets `explored` when it *generates* loot, for the whole
building as the chunk loads. Every guard reading it as "the player searched
this" refused nearly every reachable container: instalments found
"no-containers" at their own sites, indexed plans were unplanned the moment
their building loaded. Fixed: `SearchedContainers` (either `isHasBeenLooted`,
which the engine sets only when the player takes something — measured: opening
does not set it — or the mod's own `cfSearched` mark written when
`ISInventoryPage:selectContainer` shows the contents). `isExplored` is no
longer consulted for this anywhere. DR-20260924-SEARCHED-MEANS-LOOKED.

**2. The filler pinned itself to the first waiting clue.** `id=waiting[1]`
every attempt: one receipt with nowhere to go at a house the survivor had left
held four placeable clues at a loaded site behind it, for up to three in-game
days. Fixed: `Session.pick`, a wrapping cursor; still one clue per attempt.

Both are in the mutation corpus (006, 007); each test fails with its defect
restored (`test/searched_means_the_player_looked.lua`,
`test/fixed_container_runtime.lua`, `test/case_instalments.lua`).

## Retest, run `20260924T191606` — PASS

- document 2 (receipt, start house): **placed**, 1 item — was "no-containers" for the whole earlier run
- document 3 (AnimalFeedBag): **placed within 10 s** of the survivor standing at the site's edge, 1 item
- document 4 (Hat_SurgicalMask): **placed within 10 s**, 9 items
- document 5 (Cooler, vehicle intent): still waiting after 120 s — needs a confirmed vehicle at the site; none was there. Not exercised, not a failure. Its wait now has a name (`declinePlacement`), wired after this run.
- errors inside the mod: 0

## Check artefacts corrected along the way

- The opening key is carried, not placed at a square: counting only the target square reported it "placed, 0 items". The audit now counts the survivor's inventory too.
- `setX/setY` does not move the survivor (the engine overwrites it the same tick); `teleportTo` does. The first "walk" never happened.
- Standing *on* the planned square is inside the guard radius where nothing may materialise; the audit now stands at the site's edge, `PROXIMITY_GUARD_TILES+2` away, as a player arriving would.

## Not done

- No Workshop publish, no release, no tag.
- The Cooler's vehicle placement was not exercised (no vehicle at the site).
- Unrelated, still open from earlier playtests: the receipt that vanished from a corpse; the Windows crash with nothing in the log.
