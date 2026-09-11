# Test catalogue

Written 2026-09-11 from every plan, playtest, audit, research spike and commit
of the first weeks (sources named per line), for the weekend run under P4-R73.
One line per test. This file is the list; results go in the log at the end and
in `docs/management/evidence/linux-autotest/`.

**How** — **A**: automated script in `tools/autotest/` (repeatable, counts as
evidence, P4-R69). **S**: scripted in the real game through `pz.sh eval`, to be
turned into an A script where worth it. **U**: unit/offline only.
**O**: needs the owner (feel, readability, sound, controller, Windows/Workshop).

**State** — ✅ proven (how, when) · ↺ fixed after a live failure, needs a live
regression run · ◻ unproven · ❌ known defect, open · ⛔ dropped or not built.

**Priority** — P1 core loop and past live crashes · P2 features and
persistence · P3 edges, polish, performance headroom.

## Infrastructure the tests need

- **INF-01** [P1] Reload: restart the game into the *same* save (`start --continue`), so save/reload tests run unattended. ◻
- **INF-02** [P1] Core-loop driver: find each placed document, walk/teleport to it, open its container through the loot panel, take it, choose "Inspect Investigation Evidence" from the real right-click menu. ◻
- **INF-03** [P2] Walking instead of teleporting (T8: teleports emit no OnPlayerMove), for arrival tests. ◻
- **INF-04** [P2] Time control: advance world hours or shorten policy gaps for 24 h scheduling and 72 h relocation. ◻
- **INF-05** [P2] Player death on demand (god mode off, then kill), for E10. ◻
- **INF-06** [P2] Frame-cost sampling from `GeneratedRuntime.metrics()` / `Runtime.metrics()` during scripted play. ◻
- **INF-07** [P3] Writing tool in inventory (map markers need one). ◻
- ✅ Boot check, wallet check, eval channel, unit runner with engine compile (2026-09-11).

## A. Case generation

- **CG-01** [A][P1] A case commits in the starting house under the 500 KB budget. ✅ live 09-05/06; ✅ Linux 09-11 (case active after indoor start) — G2_PLAYABLE_TRIAL
- **CG-02** [A][P1] Reload never rerolls an existing case (same documents, same places). ✅ live — needs INF-01 for a Linux run
- **CG-03** [U][P3] 100-seed sample: ≥2 location pairs, both outline kinds. ✅ offline — evidence/2026-09-05-g1
- **CG-04** [U][P3] Same seed gives the same case whatever the catalogue order. ◻ partial offline
- **CG-05** [S][P2] Generated mode switches off the authored Dead Air runtime, which blocks E07. ❌ — TESTING_PLAN_TO_V1 S6
- **CG-06** [A][P1] Mixed evidence: distinct containers per clue (P4-R67), first-house opening kept. ✅ live 09-06 — MIXED_EVIDENCE_DEVELOPMENT
- **CG-07** [A][P1] Two or more cases coexist with continuous global numbering. ✅ live 09-06
- **CG-08** [S][P3] Local links: 3–7 clues, three core relationships, first office copy unsigned. ◻ — LOCAL_LINKS_ACCEPTANCE
- **CG-09** [A][P1] Retirement at MAX_CASES=8 keeps the save under budget and never retires a case with undiscovered documents. ◻ never run natively — CASE_RETIREMENT
- **CG-10** [A][P2] A save from an older generator revision is refused with a plain error, not a crash. ✅ live
- **CG-11** [S][P2] Empty persisted-intent recovery gap. ❌ — GENERATED_INVESTIGATION_PROTOTYPE
- **CG-12** [U][P2] Reach tiers 250/500/1000/1500 by survival hours; never widen for scarcity; restore never re-filters. ◻ partial offline (P4-R55)
- **CG-13** [O][P3] No solved-state, objective or completion markers appear. ◻
- **CG-14** [S][P2] Role/carrier schema (ID/credit/business card/ticket) reachable by the generator. ❌ structurally unreachable — EVIDENCE_ROLE_SCHEMA
- **CG-15** [U][P3] Document count varies 2–7 across seeds. ◻ offline only — PREMISES
- **CG-16** [U][P3] All 20 premises reachable in both outcome branches. ◻ partial
- **CG-17** [O][P2] Two full generated cases played: leads understandable, pacing fits survival. ◻
- **CG-18** [S][P2] Later cases anchor at the player's current position with the minimum gap and a cap (P4-R62). ◻ — conflicting docs, see AS-06

## B. Automatic and successive cases

- **AS-01** [A][P1] First case opens in the starting house, no console. ✅ Linux 09-11
- **AS-02** [A][P1] A later case appears after 24 in-game hours. ◻ — needs INF-04
- **AS-03** [A][P2] The cap on retained cases holds; no completion needed for the next one. ◻ partial
- **AS-04** [A][P2] Save/reload does not reset the 24 h clock; a failed commit does not advance it. ◻ mock only
- **AS-05** [S][P3] Leaving the building during preparation aborts/retries rather than committing the wrong site. ◻
- **AS-06** [S][P2] Resolve the doc conflict: is automatic scheduling live? (LIVE_SESSION_2026-09-06 vs AUTOMATIC_INVESTIGATIONS) ◻

## C. Clue placement, recovery, relocation

- **CP-01** [A][P1] Zero observations never respawn a clue (`unknown` stays unknown). ✅ offline, ◻ native — G2_FAULT_MATRIX
- **CP-02** [S][P2] Two items with one token become a sticky `conflict`. ✅ offline, ◻ native
- **CP-03** [A][P2] Room-aware placement: paperwork in offices, not garages. ◻
- **CP-04** [A][P2] Basement placement is reachable. ✅ live 09-06
- **CP-05** [A][P2] Upper-floor placement works and is reachable. ◻ repeatedly deferred
- **CP-06** [A][P1] Reachability gate: no clue in a room with no walkable path. ↺ (d4545ff after a live 3-of-4 unreachable case)
- **CP-07** [A][P2] An undiscovered clue relocates after 72 h to an unvisited building with no other clue. ◻ — needs INF-04
- **CP-08** [A][P2] Relocation is skipped with the player within ~20 tiles or the container open; old item removed before the new one is placed (c7ee42b). ◻
- **CP-09** [S][P3] Vanilla dead-survivor stories colliding with mod documents. ◻ open question — AUDIT_2026-09-08
- **CP-10** [S][P2] T4 13-scenario fault/reload matrix. ✅ live 42.20.4
- **CP-11** [O][P3] Power-cut atomicity across container file and ModData. ◻ not provable from Lua
- **CP-14** [S][P2] `copyModData` duplicates the identity stamp onto another item (incl. vanilla `ISClothingExtraAction`). ❌ hazard — T5
- **CP-16** [O][P3] Exterior basement entrances: a clue may need the outside perimeter. ❌ design hazard
- **CP-17** [S][P3] Stair-link model on real staircases (under-reports, never invents). ◻
- **VC-01** [A][P1] A clue in a vehicle: placed, marked, re-found (VehicleProbe). ✅ live 09-11 (bbcb5b8) — regressions 431d851, 6d2d3c3, 39a8aae
- **VC-02** [A][P1] One car is never a candidate for two case sites (the "repeated physical container" crash). ↺ ef51729
- **VC-03** [A][P1] The proximity hint reaches around a car, not only its middle square. ↺ 7983376
- **VC-04** [O][P3] Vehicle identity and boot contents survive save/reload. ✅ owner-observed 09-09

## D. Identity, wallets, outfits, keys

- **ID-01** [A][P1] An ID on a body is a lead, never an identity claim. ✅ Linux 09-11
- **ID-02** [A][P1] An ID inside a wallet taken off a body: "taken off a corpse". ✅ Linux 09-11 (checks/wallet_id.sh)
- **ID-03** [A][P1] A loose ID on a body is recorded as a corpse source. ✅ Linux 09-11
- **ID-04** [A][P2] Two IDs on one body are reported as two names, no identity claim. ◻
- **ID-05** [A][P2] The outfit lead reaches the notebook (the ordering race of 09-08). ↺ d1fac42; ✅ once in the first Linux wallet run (the "young" record)
- **ID-07** [A][P2] A distinctive outfit disagreeing with a document renders as two separate observations. ◻ never rendered live
- **ID-08/09** [U][P2] Outfit prose: no article ("wore a police"); generic outfits suppressed. ↺ 0.8.22/0.8.23; ✅ "Young" suppressed 36ebc2d
- **ID-10** [A][P1] Every documented console switch exists and does not crash (`verboseDoors`, `IdentityObserver.verbose`). ↺ 03d9329 — test/console_switches.lua covers offline
- **ID-11** [A][P2] No building id in player-facing prose; addresses instead. ↺ 0.8.25
- **ID-12** [S][P3] Silent early returns in player-facing gates (252 counted). ❌ systemic — AUDIT_2026-09-08
- **ID-13** [A][P1] Document whereabouts stay truthful: inventory, container, floor, vehicle, reload, destroyed (E05). ✅ live 09-09
- **ID-14** [A][P2] Duplicate document deliberately reproduced for E05. ◻
- **ID-15** [A][P2] Document in a vehicle for E05. ◻
- **ID-16** [S][P3] ObservedKeyAdapter only matches the current case's own locations (dead code?). ❌ — AUDIT_2026-09-07
- **ID-17/18/19** [A][P2] Every owner-named item type is observed: dog tags, passport, press ID, badge, diaries; `applyownername` tag form. ❌ coverage gap / ◻ — OWNER_NAMED_ITEMS
- **ID-20** [O][P3] Identity "#1" visually collides with case entries "#1–3". ❌
- **ID-21** [S][P3] Zombie descriptors expose names; professions all "unemployed". ✅ live 09-06
- **ID-23** [—] Late-binding names. ⛔ not built (ROADMAP owner requests)
- **ID-24** [A][P1] A vanilla residence key off a body opens its door; Set B voice line fires. ✅ live 09-09
- **ID-25** [A][P2] The case's own key never counts as an observed vanilla key. ✅ by design, ◻ live
- **ID-26** [A][P1] Person → key → building renders as a cautious connection, never residence. ✅ live 09-07/08
- **ID-27** [A][P2] A key inside a keyring can be inspected. ◻
- **ID-28/29** [S][P3] Detached house key for a building with a keyId; door interaction without altering the lock. ◻ — HOUSE_KEY_CONNECTION
- **ID-30** [U][P1] A same-name ticket/credit card is not "another person's card". ✅ 36ebc2d, live 09-11 ("same name as the ID")
- **CN-01** [A][P1] Named zombie / case person: a zombie carries the case person's name and ID (09eb46f, CasePerson). ◻ live regression

## E. Notebook and UI

- **NB-01** [A][P2] Title shows the survivor's forename; fallback "Survivor's Notebook". ✅ forename live 09-08; ◻ fallback
- **NB-02** [A][P1] The version in title and log matches the running build. ✅ 09-08
- **NB-03** [A][P1] Ledger order is chronological by game hour, never renumbered. ✅ live
- **NB-04** [O][P3] Read-state highlighting. ✅ live 09-08
- **NB-05** [A][P1] Continuous numbering across cases; earlier evidence still discoverable. ✅ live 09-06
- **NB-06** [A][P2] Window position and open state survive a real quit and reload. ◻ — needs INF-01
- **NB-07** [O][P3] Readability at 3200x2000 / font 3, high contrast. ❌ then partial fix, unconfirmed
- **NB-08–12** [O][P3] Scrollbar, wide/compact layouts, keyboard navigation, keybind, controller. ◻ (checklist unticked; controller unsupported)
- **NB-13** [O][P2] Every document type readable in full, no mid-sentence truncation (E06). ◻
- **NB-15/16** [O][P3] Toolbar icon beside Search; generic "Open Journal" menu entry gone. ✅ live 09-06
- **NB-17/18** [O][P3] Selected tab visible; the reverted amber restyle stays reverted. ✅/regression watch
- **NB-19–22** [—] Title prefix, tooltips, new-since-last-open, filter box. ⛔ design only — UI_POLISH_PROPOSALS
- **NB-23** [U][P2] The journal never reorders, groups, renumbers or hides entries by default. ◻ regression watch
- **NB-24–27** [O][P3] T12 layout/scroll/contrast items; T12 verdict pending. ❌/◻ (older T12 candidate)
- **NB-28** [A][P1] Evidence category label is translated, not raw `IGUI_ItemCat_Evidence`. ↺ 767627a
- **NB-29** [A][P1] The survivor's papers open automatically at start. ↺ 370c1d6
- **NB-30** [A][P1] Completing a case does not make LocalPersonIntegration throw every tick. ↺ 3fe1813 ("worst failure so far")

## F. Map markers and writing tools

- **MM-01** [A][P2] No map mark without a writing tool; pending until one is held. ✅ live 09-06
- **MM-02** [A][P2] Catch-up: getting a tool later marks the original place, across reload. ✅ live 09-06/09
- **MM-03** [A][P3] Dropping the tool keeps existing marks. ✅ live
- **MM-04** [O][P3] Ink colour follows the tool; green untested. ✅ except green
- **MM-05–07** [O][P3] Question-mark symbol, reload survival, pan/zoom stability. ✅ live 09-06
- **MM-08/12** [O][P3] Label layout; markers near the window edge. ◻ partial
- **MM-09–11** [—] Wood St number, road-text overlap, colour-test paper. ❌ deferred/accepted
- **MM-13** [U][P3] Tool eligibility mirrors vanilla `canWrite`, bag contents count. ✅
- **MM-14** [A][P2] Marker stacking: two markings on one house stay readable (owner 09-11, house 104). ◻ regression — test/marker_clusters.lua offline

## G. Addresses

- **AD-01–03** [A][P2] Street names instead of coordinates; unexplored numbers hidden; undiscovered markers hidden. ✅ live 09-05/06
- **AD-04** [A][P3] Full-viewport audit without the 60-detail cap; Wood St root cause. ◻ native
- **AD-06/08** [A][P3] Coverage repairs; curved/diagonal roads. ◻ native
- **AD-09** [S][P3] Overlay masking via `WorldMapVisited:isKnown`. ◻
- **AD-10** [—] Address book for all of Knox. ⛔ not built (owner request)

## H. Performance

- **PF-01** [A][P2] Building/room scan ≤2 ms peak, zero frames over budget. ✅ live 09-08
- **PF-02** [A][P2] Synchronous canonical/UI/native call cost (E12). ◻ never measured — INF-06
- **PF-03** [A][P2] Identity render hook cost against the 2 ms budget. ◻
- **PF-04** [S][P3] Diagnostics are unconditional in release builds. ❌
- **PF-09/10** [A][P3] Real adapter timing; combined save-budget preflight. ◻

## I. Persistence, reload, death

- **PS-01–06** [S][P3] T1 ModData rules: plain tables survive; cycles lose everything silently; functions/metatables dropped. ✅ live 42.20.4 (rules; guard in SaveBudget)
- **PS-07** [A][P1] Clean round-trip keeps notebook order, text and ordinals; encoded size unchanged (E09). ◻ — INF-01
- **PS-08** [A][P1] Three reloads do not grow the budget total (E09). ◻ — INF-01
- **PS-09** [A][P2] Abrupt kill: the last good root survives, nothing corrupted (E09). ◻ — kill -9 via pz.sh
- **PS-10** [A][P2] Death after discoveries: intact, ordered; new notebook with the new forename; no recap (E10). ◻ — INF-05
- **PS-11** [A][P2] Death mid-discovery: fully recorded or fully absent (E10). ◻
- **PS-12** [A][P2] A document recovered from the player's own corpse is the same evidence, not a duplicate (E10). ◻
- **PS-14/15** [S][P3] Stamp survives all moves with reload; OnPlayerDeath carries it to the corpse. ✅ live 42.20.4
- **PS-16** [S][P3] Corpse persistence when reloading an already-dead character. ◻

## J. Multiplayer and fault containment

- **MP-01/02** [—] Multiplayer fail-closed in real sessions. ⛔ dropped 09-08 (E11); Workshop says single-player only
- **FC-01** [A][P2] Injected faults at each adapter boundary: no crash, corruption or log spam (E13). ◻
- **FC-02** [S][P2] The context menu with several/duplicate selections (E08). ❌ first item only — PM_TAKEOVER_AUDIT
- **FC-04** [A][P1] A failing operation does not retry itself every tick (84404dc, 20 errors a second). ↺
- **FC-05** [A][P1] An ordinary sequence of player actions never trips an `assert` (a5dc1bf). ↺

## K. Voice, halo, hints

- **VH-01** [A][P2] Evidence pickup voice line, not repeated for the same item. ✅ live 09-08
- **VH-02** [A][P2] Proximity hints at the placed container. ✅ live 09-08
- **VH-03** [A][P2] Set B line on an observed key door. ✅ live 09-09
- **VH-04** [A][P2] Speech bubble and halo text never identical. ↺
- **VH-07** [O][P2] Voice sounds and halo are actually seen and heard (colon-call bug class 5f12fa1/d747a25). ↺ — screenshot can check the halo; sound needs the owner
- **VH-08** [A][P2] A pile of several items can trigger a hint (098a1ab: exactly-one rule). ↺
- **VH-05/06** [—] Disagreeing-records line; burst cooldown. ⛔ design only

## L. Engine facts from the research spikes

- **T7-01–04** [S][P3] Item text persistence; `setDescription` not persistent; journal markup literal; "%" crash. ✅/❌ recorded — T7
- **T8-02** [S][P3] Arrival confirmation (15 ticks, 2 samples). ✅ live; **T8-03** real walking ◻ (INF-03)
- **T10-01** [O][P3] Cooperative inspect hook keeps vanilla and foreign options. ✅ live
- **T11-01** [—] Full T11 composition matrix. ◻ never run (older authored path)
- **MO-01** [S][P3] `setBloodLevel` survives save/reload. ◻
- **KC-01** [U][P1] Every mod file compiles with the engine's own compiler. ✅ 85/85, in `unit.sh` since a0e0dcf

## M. Tooling and delivery

- **DT-01** [A][P1] All expected modules loaded (IdentityObserver self-check line). ✅ each boot
- **DT-02/03** [A][P1] Boot check proves both ways; wallet check unattended. ✅ 09-11
- **DT-05** [O][P2] Workshop delivered the published version (log tag and title bar). ❌ Steam served stale files ≥3 times
- **DT-07** [S][P2] Modules that load only by auto-execution actually load. ✅ boot check (85/85 files loaded)

## Owner acceptance gates

- **E01** Static map bindings — accepted (TESTING_PLAN_TO_V1, 09-08).
- **E02–E04** Exactly-once materialisation on interrupted paths; no loss inferred from absence; at most once per document — open → CP-01/02/10, PS-09.
- **E05** Truthful physical identity — passed 09-09 → ID-13/14/15 extend it.
- **E06** Full readability — open → NB-13 (owner).
- **E07** Arrival from real walking — blocked by CG-05 (generated mode disables the authored runtime).
- **E08** Context-menu correctness — partial → FC-02.
- **E09** Persistence round-trip — open → PS-07/08/09.
- **E10** Death/reload integrity — open → PS-10/11/12.
- **E11** Multiplayer — dropped 09-08.
- **E12** Synchronous cost — partial → PF-02/03.
- **E13** Fault containment — open → FC-01.

## Rules for running tests

Fresh world for each run (P4-R63). `-debug` always. Indoor start. Never delete
or rewrite a player's save. Walk, do not teleport, for arrival tests. A run that
finds nothing is still a result. Boot check before every Workshop publish
(P4-R76). Check the build marker first. On Windows attended sessions: no eval,
no injected helpers.

## Conflicts between older documents

1. Wallet defect cause: stale `dragStarted` (PLAYTEST_2026-09-09) supersedes "nested containers" (AUDIT_2026-09-07).
2. E01: accepted (09-08) supersedes unaccepted (09-05).
3. Automatic scheduling live or not on 09-06: resolve in AS-06.
4. E11: dropped (09-08) supersedes high priority (09-05).
5. Reach tiers: P4-R55 four tiers supersede CAMPAIGN_VISION's two.
6. Wood St missing number: parked at the owner's request.

## Log

- 2026-09-11 — Catalogue written. Linux: boot ✅ ×3, wallet ✅ ×2 (a0e0dcf shows the same-name fix live). Unit suite all green (53 specs, 96 standalone, 85/85 engine compile).
