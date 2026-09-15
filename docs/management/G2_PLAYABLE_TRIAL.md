# G2 generated investigation — development playtest

Status: implemented development path; owner confirmed placement/reading, shared notebook and evidence save/reload retention. New marker/address refinements and recovery/performance gates remain pending. One generated case per save. New reusable prose remains development draft, not an accepted content release.

## What is connected

Shared pure generator/catalog modules now serve both the offline fixtures and G2. GeneratedSession is a separate strictly validated canonical aggregate: immutable case definition, three token/target assignments and ordered discoveries. Existing Dead Air validators remain intact. Generated mode disables its runtime while active. No fixed-site fallback is used.

Manual start runs the survival-radius T3 selector, scans actual loaded containers inside the selected room rectangles incrementally, generates from eligible sites, re-resolves selected containers, validates the complete root under 500 KB and commits once. Unloaded or unsuitable locations remain ineligible; insufficient eligible sites defer without committing a partial case. The current anchor is captured at manual start. No historical spawn is invented.

Placement uses Base.Note, exact target/sprite/container identity, durable intent and physical tokens. Repeated starts and saved-case resumes retain the existing case even with another seed. Periodic partial identity scans detect duplicates without interpreting missing items as destruction. Known documents are read from canonical text; the journal displays discovered documents and only connections whose source documents are known.

All work is development/debug single-player. T11/T12 cannot be active. No old save migration, multi-case progression, multiplayer, autonomous new-game launch, UI automation or item spawning at player position is included.

## Owner run

Keep Conspiracy-Files: Dead Air enabled; leave T11/T12 off. In the ordinary debug Lua console:

```lua
require("ConspiracyFiles/GeneratedRuntime").start()
```

Unpause. Preparation prints T3 output, then either `[CF-G2] Generated case active` or an explicit wait/error. Tell the PM when it finishes: they read the log and give the development first-clue container coordinate. No discoveries are granted by that diagnostic.

Travel manually, loot the note into your inventory, right-click **Inspect Investigation Document**. **Open Investigation Journal** reopens known documents. Follow the location reference in the dispatch copy to the receiving records. Save normally and reload; the existing generated case resumes automatically in debug mode. Verify known text remains and no extra copies appear. This requires actual owner play; mocks cannot certify it.

## Known gates and limits

- Empty persisted placement intent plus no observed token stays uncertain and never auto-respawns. This unresolved exact-once recovery gate prevents production acceptance. A positively observed surviving note can reconcile it; duplicate conflict is sticky.
- New schema/tag: `ConspiracyFiles.Generated.G2`, schema 1. Invalid roots refuse; no retrofit or migration. Existing fixture data/items are not deleted.
- This is one case per save, not automatic scheduling of successive conspiracies. Survival policy is enforced at creation; existing cases never move.
- First-clue guidance is development-only. Natural introductory clue discovery and broader content/playtest polish remain work after the mechanism passes.
- Console radius/performance observations do not measure synchronous case validation/UI calls. Full live performance and interruption checks remain open.
- Only two selected locations with currently loaded observed storage can generate now; pending unloaded storage does not force a long trip or weaken eligibility.

## Verification

`test/run.lua`: 52 tests, zero failures. `test/g2_smoke.lua`: mocked loaded storage -> case commit -> three physical notes -> inventory-only Inspect -> persisted discovery -> restart/game-load restore without reroll or duplicates -> sticky duplicate conflict. Focused T3 selection tests and Lua 5.1 syntax checks also pass. These are development checks, not live acceptance.

## Navigation finding from owner playtest

Owner successfully looted and inspected the dispatch note, but its raw-coordinate destination requires debug knowledge. P4-R57 requires recognizable place names/available real addresses and a grounded fallback that distinguishes the actual destination. T3 does not currently extract addresses or signage. Naming is a playability blocker; do not treat successful note display as proof that the investigation is navigable without debug assistance.

## Shared notebook restored

Owner approved bringing generated discoveries into the existing Survivor Notebook. DEV-0.7-generated-notebook uses the shared evidence list, selected-document pane, discovery-order journal, contrast, help and keyboard/compact-layout controls. Generated rows come only from the known projection; canonical facts, saved text and discovery order are unchanged. UI tests cover selection, journal order, hidden-link exclusion and generated Help; all 52 suite tests pass. Owner visual verification remains pending. Hot-load the existing Notebook.lua file, then use Open Investigation Journal.

## Owner live confirmation — 2026-09-05

Owner confirmed the restored DEV-0.7 notebook works, then reported that all discoveries survive saving/reloading. Returning the physical documents to storage also leaves the evidence in the journal, as intended. Record these as owner-observed passes for generated notebook display, discovery persistence across reload, and independence of learned evidence from continued item possession.

This does not certify all interruption/duplicate recovery paths, proximity hint behavior, performance limits or non-debug navigation. Those retain their separately recorded status.

## Street-based presentation trial

DEV-0.7.1-place-labels removes legacy coordinate labels from the generated notebook using installed-map streets and relative directions. Current case: receiving building near 3rd St, roughly 30 paces east of dispatch building. No house numbers or business names were invented. Saved facts/targets are unchanged. Street coverage is limited to the Muldraugh trial rectangle; broader address/name coverage and ordinary-player navigation remain open. Reload Notebook.lua to apply to the current case.
