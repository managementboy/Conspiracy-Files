# Result: occupational-lead foundations, tested on real Project Zomboid

Answers [`CLAUDE_OCCUPATIONAL_WORLD_LEADS_HANDOFF_2026-09-23.md`](CLAUDE_OCCUPATIONAL_WORLD_LEADS_HANDOFF_2026-09-23.md).

Tested commit: `fcfdc09` (start) through `44207bc` (end).
Game: Project Zomboid **42.20.4 `b0bbce05d5`**, Linux, Intel Iris Xe, display `:0`.
Mod: `DEV-0.47.6-functional-opening-key`.

## Gates

| Gate | Verdict | Evidence |
|------|---------|----------|
| 1 source and offline baseline | **PASS** | `evidence/linux-autotest/20260923T190524-boot.txt` |
| 2 corpse-wallet identity provenance | **PASS** | `evidence/linux-autotest/20260923T204804-wallet-id.txt` |
| 3 opening regression | **FAIL** | `evidence/linux-autotest/20260923T203602-fitness-world-opening.txt` |
| 4 limited vehicle observer | **PARTIAL** | same file; offline `test/vanilla_scene_observer.lua`, `test/fitness_world_placement.lua` |
| Occupation-driven mystery generation | **NOT IMPLEMENTED** | `Generated/Generator.lua:493-494` |

### Gate 1 — PASS

```bash
git status --short --branch
lua5.1 test/run.lua                 # 52 tests, 0 failures
tools/kahlua/run.sh --parse-all     # 131 ok, 0 failed
tools/autotest/unit.sh              # 188 run, 0 failed
tools/autotest/boot_check.sh        # PASS
```

Boot: 131 of 131 mod files loaded, no mod stack error, player alive, 0 mod
errors. All seven handoff-named fixtures were reached and run individually
(`lua5.1 test/<name>.lua`) as well as by `unit.sh`'s `for t in test/*.lua`:
`identity_observations`, `container_provenance_text`, `identity_observer`,
`identity_outfit_backfill`, `generated_evidence_identity_collision`,
`opening_premise`, `fitness_openings` — all PASS. None skipped.

### Gate 2 — PASS

`tools/autotest/checks/wallet_id.sh`, native, 0 mod errors. One recorded row
carries the contract:

> I saw an ID card with the name "Wilma Calabrese" on it, inside a wallet.
> That container was taken off a corpse. The same one carried:
> Business Card: Don Chastain (Scientist) (another person's card, kept);
> Credit Card: Wilma Calabrese (same name as the ID).
> The name on an ID card is my lead. The body remains unidentified.
> Observed at 202 E Maple St.

Expected results 1-6, 8 and 10 confirmed natively; 7, 9, 11 offline
(`identity_outfit_backfill`, `identity_observer`,
`generated_evidence_identity_collision`). Result 12 is the NOT IMPLEMENTED
boundary below, and is the correct current behaviour, not a failure.

### Gate 3 — FAIL

Confirmed natively, twice, on two independent worlds:

- opening clue on the player **3 in-game minutes** after spawn, a real `Base.Key1`;
- recorded house matches the real starting building (key target building ==
  survivor building == `202 E Maple St`);
- first-person present-voice opening line intact.

**The key opens no door.** Reproduced on both worlds (variants
`Loan collection` and `Home assessment`; key ids `1160462` and `79252202`);
7 doors examined each time, 0 matching. Root cause measured — see the
conflict below. This is the gate's FAIL.

**NOT EXERCISED:** the PPE scene. Finding 4 stayed `indexed, itemsInWorld=0`
in both runs. The check never travels to the site, so "nine items, one
finding" has no native evidence either way. This is missing coverage, not a
placement defect, and closing it needs a check that walks the survivor to the
indexed container.

Ten variants validated **offline** (`test/fitness_openings.lua`). **One**
variant was played natively per run, two distinct variants across runs. That
is offline validation plus two native samples, not native acceptance of ten.

### Gate 4 — PARTIAL

- **PASS, natively:** no missing random vehicle scene blocks the essential
  chain. With 0 confirmed scenes, clue five stayed `deferred` while the first
  four proceeded.
- **PASS, offline:** two matching observations before confirmation, a changed
  observation restarting rather than rewriting an accepted scene, and an
  assigned optional finding persisting its `sceneSignature`.
- **NOT EXERCISED, natively:** signature persistence. No scene was ever
  confirmed in any run, so there was no signature to persist.
- The journal claims nothing the observer did not read: the authored vehicle
  text speaks only of a vehicle, its position and its contents, which is
  exactly what `VanillaSceneRuntime.snapshot` records. No damage, fire, corpse
  relationship, roadblock or hidden randomized-story identity.

The richer future scene system is **not** marked PASS. It is not implemented.

## CORRECTED 2026-09-24: the opening key was never broken

**The conflict recorded below is withdrawn. The conclusion was wrong.**

It rested on a door-by-door comparison of `IsoDoor:getKeyId()` against the
key, which found every door reporting `-1` while the building definition
carried a real key id. From that I concluded the key could open nothing on
this baseline and asked the owner to decide between gameplay changes.

Comparing ids is not using a key. Measured on 2026-09-24 by performing the
interaction through the game's own timed action
(`tools/autotest/checks/opening_key_door.sh`, run `20260924T113438`):

```
keyId = 84227980, buildingDefKeyId = 84227980
doors = 7, matchingByKeyId = 0, locked = 6
door opened: TRUE
```

Zero doors report a matching key id **and the door opens anyway**. The engine
resolves the key against the building rather than stamping the id onto each
door instance. The Windows playtest of 2026-09-24, in which the owner's key
opened the current house, was right; this report's Gate 3 FAIL was an artefact
of its method.

The real defect was narrower and is now fixed: using the key recorded nothing,
because `heldKey` sees only local-person case keys. No key or lock behaviour
was changed to achieve that.

The original text is kept below for the record.

## Conflict recorded, not fixed: the opening key (WITHDRAWN, see above)

Measured on 42.20.4, in the starting building:

```
keyItemId = 37335555,  buildingDefKeyId = 37335555   (identical)
every door of that building: getKeyId() = -1
```

and over a 121x121 tile census of the surrounding area:

```
doors=72   withRealKeyId=0   minus1=72   unreadable=0
locked=50  lockedWithNoKeyId=50
buildings=11  buildingsWithDefKeyId=11  buildingsWithAMatchingDoor=0
```

The mod's side is correct. `HouseKeyAdapter.createForBuilding` copies the
building definition's own key id onto a fresh `Base.Key1`, verifies the
assignment, and refuses to invent one where the building has none. The engine
locks doors **without** stamping that id onto the door instance: `isLocked()`
is true while `getKeyId()` is `-1`. Nothing in the mod ever sets a door's key
id, and on this baseline nothing else does either.

**Not fixed, deliberately.** Every available fix is a gameplay change rather
than routine bug repair: stamping a door means modifying world objects the mod
does not own, and choosing a different building changes where the opening
happens. Both decide whether a survivor starts locked in or out of their own
house. Per the handoff's own rule, the conflict is recorded instead.

**Smallest philosophy-safe change, proposed not taken:** let the key remain a
question about access rather than a functional lock. The authored line is
already "This opens the house. Why did I have access?" — a question about
provenance. The case survives if the door is never asked to answer it. That is
a design decision about a build named `functional-opening-key`, so it is the
owner's.

**Not established:** how vanilla B42 intends house keys to work. It is
possible the engine matches keys by some path other than `IsoDoor:getKeyId()`,
in which case the mod's approach is wrong rather than the engine's support
being absent. That distinction changes what the right fix is and should be
settled first.

## Occupation-driven mystery generation — NOT IMPLEMENTED

Confirmed in source, not assumed. `Generator.lua:493` restricts `profession`
to `"fitnessinstructor"`; `:494` restricts it to an opening. `claimedRole`,
dormant leads and role-bearing discovery do not exist on this baseline.
Nothing reads an occupation off an observed card to start a case. Seeing
`(Journalist)` correctly starts nothing.

## What was actually wrong

Every defect fixed this session was in the **test harness**. Five of the six
produced false failures against healthy product code, and two wrote off whole
gates as COULD NOT RUN while the case they were looking for had existed since
forty seconds into the run.

| # | Defect | Effect | Regression |
|---|--------|--------|------------|
| 1 | The check drove the identity observer through a loot window it never made visible | Gate 2 false FAIL | `test/wallet_id_visibility_contract.lua` |
| 2 | It asserted after a fixed sleep; `selectContainer` does not repopulate `pane.items` in the same frame | asserted against the wrong corpse | same |
| 3 | Both openings checks collapsed `T3Nearby.progress()`'s three answers into the constant `"none"` | quit after 5% of budget calling a scan that had not started "stalled" | `test/scan_progress_probe_contract.lua` |
| 4 | Both openings checks read `store.canonical` directly, blind to the shipped `store.campaign` shape | Gates 3+4 false COULD NOT RUN, twice | `test/generated_store_access_contract.lua` |
| 5 | No check asked `automaticStatus()` why no case had come | reported the observation, never the reason | `CFFit.why()` |
| 6 | The wallet row was looked up by display name; a corpse's loose card and wallet card share a name | Gate 2 false provenance FAIL | `test/wallet_id_visibility_contract.lua` |

One assertion was **narrowed**, and it is the only place a check became less
strict: `indexed -> deferred` across a reload is documented correct behaviour
(`Session.unplan` — "an indexed signature that no longer matches the live
building becomes an ordinary deferred clue", preserving the original expiry
clock). Placed coordinates and confirmed scene signatures remain fully
asserted; the waiting transition is still printed in the evidence on every
run.

One reported problem was **not a defect**: the sixth finding
`Access memo / 7C-41` is the owner-approved relay memo — "the first case of a
game carries the relay memo (P4-R96); later cases never do". The offline
fixture asserts five documents because it does not pass `relayMemo`.

Every regression above was demonstrated failing with its defect restored, and
passing with it fixed.

## Environment blockers, distinguished from failures

- One wallet run met 30 corpses with no wallet-bearing body and correctly
  reported COULD NOT RUN (exit 2), not FAIL. The game decides what corpses
  carry.
- No missing executable, `PZ_HOME` or machine-configuration blocker occurred.

## Remaining reproducible defects

1. The opening key matches no door (above). Reproduced 2/2 worlds.
2. None others. No mod errors were logged in any native run today.

## Coverage not closed

1. Whether indexed clues ever reach the world — the PPE scene was never
   placed in either run, and no check travels to the site.
2. Native persistence of a confirmed vehicle scene signature — no scene was
   ever confirmed.

## Workshop

No Workshop upload, no Workshop metadata change, and no visibility change was
made at any point during this handoff.
