# Owner attendance checklist

**P4-R53 update, 2026-09-05:** the manual location-plausibility itinerary is suspended. Do not ask the owner to approve individual shelves or sites; guide steps 3–4 below are historical instructions, not the next task. The active plan is the generated-investigation prototype in docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md. No new game session is required for the approved planning increment. The CPU-strain report was unrelated; technical performance criteria still stand.

The product decisions are recorded in P4-R48–R52. This checklist contains manual observations still needed for the DEV-0.6 candidate. No game launch, mod deployment or live acceptance was performed by the correction work.

## Recorded choices

- [x] Two Muldraugh story sites; D4 belongs at electronics/relay; no motel.
- [x] Police arrival is an ordinary journal entry.
- [x] Availability messages use plain language.
- [x] Death recap is deferred beyond v0.1; actual death/save integrity remains in E10.
- [x] Preserve approved contextual introductions, 23:58/7C-41 consistency, separate Help, native X and configurable toggle; Escape belongs to the game.

## Preparation and stop rule

Use debug mode and a disposable save. Verify build/revision, enabled mods and deployed source hashes from the correction evidence manifest. Retain existing saves/profile files. The schema-2 T11/world candidate needs a fresh disposable save because migration is out of scope; it refuses legacy data. T12 synthetic UI does not write the world/session root and can use an existing disposable UI save after a verified startup with the correct wrappers.

Enable ConspiracyFiles plus exactly one wrapper: T12 for synthetic UI, or T11 for one-item composition. Never enable both wrappers. The ordinary production candidate has no wrapper. No helper injection, synthetic GUI input, UI automation or security changes. Stop on a security alert, wrong save/mod set, unsupported build, unexplained duplicate or canonical validation error.

## Smallest next session: shared T12

Open the ordinary debug console and manually enter ConspiracyFiles.T12Probe.open(). Verify the DEV-0.6 version marker. This prepares synthetic known-state data; it does not count as a real discovery.

- [ ] Start at the previously failing 3200×2000 / font setting 3. Confirm readable ordinary and high-contrast text.
- [ ] Verify the visible 22 px scrollbar, wheel, track paging, thumb drag and reaching both ends without title/actions moving.
- [ ] Test wide and compact layouts, long titles, Back, separate Help, native X and repeated reopening.
- [ ] Test keyboard Tab/arrows/Enter/Page Up/Page Down; confirm Escape still reaches the game.
- [ ] Assign the notebook toggle through game settings and verify open/close.
- [ ] Check agreed lower resolutions/font sizes, vanilla coexistence and geometry after resize/reopen.
- [ ] Record controller unsupported/unavailable unless a cooperative route is actually observed. Do not infer support from keyboard behavior.
- [ ] Archive visible verdict and console/version evidence. A repeated failure should produce one focused correction, not another unchanged full rerun.

## Muldraugh binding

- [ ] Verify an ordinary road route between electronics/relay around (10614,9604,0) and police around (10637,10410,0), including survival/access plausibility.
- [ ] Record exact coordinates, object/container indices, sprite and type for three relay and four police candidates, or reject unsuitable candidates.
- [ ] Test both candidate arrival areas: correct square, adjacent room/outside, boundary edge and wrong floor/basement.
- [ ] Confirm that each rectangle really represents the intended room/area; narrow or replace it from observations. Bindings.accepted must stay false until this evidence is incorporated.

The old P2/R2 checkpoint is preserved history, not the default route.

## T11 after binding

Use [the T11 runbook](../../dev/t11-adapter-integration/README.md) and its evidence template.

- [ ] One real D1, detached stamp, count-one commit and repeated callbacks/streaming.
- [ ] Owner manually Inspects, saves and reloads; repeat Inspect creates no new Evidence or JournalEntry.
- [ ] Move through inventory/bag/floor/storage and observe token reconciliation; zero at source never proves loss.
- [ ] Run explicit copied-token conflict and one-shot fault cases on disposable state.
- [ ] Record same-tick arrival/reconciliation, timing, canonical size and actual save/reload accounting.
- [ ] Review any missing fault controls/coverage as inconclusive, not passed.

## Full acceptance

E01–E13 remain open. Real death/corpse/reload, all multiplayer disable modes, performance and an additive foreign mod require owner-observed evidence. A passing T12 or T11 alone cannot accept the slice.
