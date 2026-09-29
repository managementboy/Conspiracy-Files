# No Help — gap plan after the deep review (2026-09-29)

Source: docs/reviews/DEEP_REVIEW_NO_HELP_2026-09-29.md, checked against the
code by Claude. Owner decisions: DR-20260929-NOHELP-GAP-PLAN (DECISIONS.md).
Its finding "inventory actions unreachable" is false (it read
MapMediaRuntime's R.subject, not GeneratedRuntime's); the rest hold.

## Engine (Claude)

- [x] **E1 Spoken captions.** (2026-09-29: code and test/nohelp_voice_clue.lua; every Inspect, all clues, title in the bubble - owner answers; native check pending) On the first Inspect the survivor says the
  clue's text (PlayerVoice, the vanilla speech line); a long text is split
  into several lines said in turn. Paper clues are still read from pages.
- [x] **E2 Real container choice.** (2026-09-29: where.containers = exact kind + up to 5 fallbacks, owner; then any container, body, floor; Generated/ContainerKinds.lua, test/nohelp_containers.lua; native check pending) A clue may name a container kind from the
  game's own list (fridge, wardrobe, crate, locker, bin, dumpster, toolbox...),
  not only furniture/vehicle/corpse/mailbox. Missing kind: fall back to a
  similar kind, then any container, then a body, then the floor; never
  silently dropped (today a missing spot waits 72 h and is lost:
  GeneratedRuntime.lua ~1952, Session.lua ~472).
- [x] **E3 Outdoor containers - measured** (2026-09-29, a reflection-only
  exporter run on the game's own Java 25; scratch tool, not shipped). The
  runtime already finds outdoor containers live; the shipped census lists
  only rooms and mailboxes. At z=0, fruit bushes left out: all 11 area sites
  have containers near their marks; 56 of 81 point sites have at least one
  inside their 33x33 box, 62 within 12 more tiles; 19 have none (those clues
  fall back to a body, then the floor, E2). Owner: yes, search 12 tiles
  beyond outdoor map and flyer places (Session.outdoorSite; done 2026-09-29).
- [x] **E4 ZombieBuddy scene listener (required dependency).** (2026-09-29: tools/nohelp-scenes, NoHelpScenes.jar, 143 story classes, mod.info require=\ZombieBuddy; VanillaSceneRuntime drains it and skips the trace scan when present; test/nohelp_scene_listener.lua + SceneListenerTest.java; NATIVE CHECK PENDING - needs a visible run with ZombieBuddy) A Java patch
  on the game's story `randomize*` methods reports every generated scene
  (kind, building/zone/chunk, time) to Lua; replaces trace matching as the
  way scenes are known. Research: ZombieBuddy 2.3.2, @Patch advice, queue
  drained on the Lua thread. mod.info gains javaJarFile/javaPkgName.
- [x] **E5 Thin sites topped up** (2026-09-29: anchored clues first, then unanchored clues of the place as stock, then spares; Pick stock pass; inert until C3 writes unanchored mapNamed stock) from a stock of both-side clues per place
  type when an anchored site has fewer than its minimum or one side only
  (AreaCase.anchorPool).
- [x] **E6 Scenes pick a side that has a clue** (2026-09-29: drawn lean first, else the other; test/nohelp_scene_area.lua) (VanillaScenes lean choice).
- [x] **E8 Map markers scale with the game.** (2026-09-29: ceiling removed, shape kept, unchanged table not re-walked per frame; test/nohelp_markers_scale.lua; native check pending) Markers stay (owner). Their
  store refuses more than 64 records or 24 KB (ClueMarkers.lua valid()),
  far below 518 clues: lift the ceiling and test a world with hundreds of
  finds.
- [x] **E7 "DONE" means reachable.** (2026-09-29: progress.lua decides every
  map/flyer place with the game's own AreaCase.decide in 6 worlds, arguments
  shared with the runtime via Generated/MapSiteArgs; gates "places x/y" and
  "scene sides x/y". First run: places 0/253, scene sides 3/125; in one world
  246 places fall short by 1,210 clues in all and 227 have one side only.) progress.lua runs the real picker over
  every site and both scene sides; fails on short or one-sided sites.

## Content (ChatGPT, after its engine step)

- [ ] **C1 Longer texts, no maximum** (opened 2026-09-29: engine limits lifted, cards stay ~280 - owner; existing paper clues lengthened in R2 - owner) (owner): diaries, letters, notebooks
  much longer; spoken captions may be longer too. After E1.
- [ ] **C2 Spot round (recall R2, opened 2026-09-29, 446 clues with C1/C5 fixes; some may stay outside - owner):** floor clues move into the full range of
  containers; floor under 15% of clues (about 77 of 518). After E2, E3.
- [ ] **C3 Spare stock** (opened 2026-09-29: T0408-T0427, 200 clues, owner chose stock over per-place) of both-side clues per place type. After E5.
- [ ] **C4 Other-side scene clues** (opened 2026-09-29: 122 scene tickets, recipes keep+addSide) (about 120). After E4.
- [ ] **C5 Samey title openings rewritten.**

## Settled

- Map markers stay in No Help (owner, 2026-09-29: "Absolutely!").
