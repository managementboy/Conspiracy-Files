# Windows playtest feedback — 2026-09-24

**Session:** Windows, single-player, `DEV-0.47.6-functional-opening-key` shown in `console.txt` at game start. The owner supplied feedback and stopped the game. Record findings here for a later fix pass; no gameplay code was changed during this session.

## Later fixes

### 1. PDA FILES exposes save terminology

- **Owner report:** “Why are we talking to the player about saves? The PDA is an immersive tool.”
- **Observed:** The opening key's FILES detail has `WHERE  Not checked since you loaded this save.`
- **Evidence:** [Screenshot](evidence/windows-playtest/2026-09-24-pda-save-wording.png), captured during this session.
- **Source trace:** `GeneratedRuntime.lua:2402-2412` returns the internal `unchecked` whereabouts state when there has been no sighting. `EvidenceRows.lua:126-149` turns that state into the quoted player-facing text. `KnoxApps.lua:122-129` displays it under `WHERE`.
- **Later requirement:** Keep the PDA's text inside the survivor's world. Its wording should convey only what the survivor can know about an item's whereabouts; it should not mention saves or loading.
- **Status:** Logged for later; no fix attempted.

### 2. The opening key works, but trying it records no result

- **Owner report:** The key was put in the survivor's inventory, opened the current house, and checking that it worked produced no recorded finding.
- **Positive result:** This Windows play observation contradicts the earlier Linux report that two sampled starting-house keys opened none of the tested doors (`CLAUDE_OCCUPATIONAL_WORLD_LEADS_RESULT_2026-09-23.md:62-65,94-116`). The difference in game behavior has not been explained.
- **Source trace:** `GeneratedRuntime.lua:215-223,296-317,1053-1058` creates the starting-building key and later stamps it as generated evidence. The door-match path in `LocalPersonIntegration.lua:561-583` records a match for a `cfLocalPersonCase` key, or calls the separate body-key path; the generated opening key has `cfGeneratedId` instead. This is a plausible reason the successful use did not become a case finding, but the live hook path was not instrumented in this session.
- **Later requirement:** A successful use of the opening key should become an observable, recorded fact in the personal investigation. Preserve the distinction between “this key opens this door” and any unproved claim about who owned or used it.
- **Status:** Logged for later; no fix attempted.

### 3. Pondview flyer opened without a purposeful lead

- **Owner report:** The Pondview Shopping Center flyer was opened. Check whether it has a mystery or any other use. The owner reaffirms that finding a flyer should give the player a purpose; this is a requirement, not an optional decoration.
- **Evidence:** [Screenshot](evidence/windows-playtest/2026-09-24-pondview-flyer-opened.png), captured during this session.
- **Source trace:** `MapMediaCatalogue.lua:253-254` inventories Pondview as a print with a destination. `MapMediaRead.lua:61-68` hooks the native print reader, and `MapMediaRuntime.lua:179-185` can save a read timestamp. The only consumer of read prints is the place-identification appendix to an already active map story (`MapMediaRuntime.lua:374-379`). No map binding names `Pondview` in `printIds`, and the catalogue contains no Pondview mystery binding. Thus there is no implemented Pondview mystery, travel lead, or payoff from opening this flyer. Whether this particular read timestamp was saved was not verified from game state.
- **Requirement trail:** `DECISIONS.md:1189-1191` records the owner's principle that a found annotated map or flyer should give purpose and a reason to act. The later map decision (`DECISIONS.md:550-551,1118`) left universal flyer coverage unconfirmed. This playtest reaffirms the purposeful-flyer requirement for an actually found item; later design must resolve coverage without treating Pondview as fulfilled by catalogue data alone.
- **Status:** Logged for later; no fix attempted.

## Log watch

- [Full session console snapshot](evidence/windows-playtest/2026-09-24-console.zip) was captured after the owner stopped play, before the next launch could replace `console.txt`.
- The mod reached the opening sequence and logged ordinary `[CF]` activity, including placement and recognition of the opening `Key1` at `201 N Carl St`. No Conspiracy Files Lua exception or error-level `[CF]` line was found during play. There was no `observedKeyDoor` or `keyDoorMatch` log line for the owner's key check.
- Startup produced engine/other-mod errors concerning vehicle templates, missing vegetation tiles, skeleton bones, and map data. Their relation to these reports is not established; do not treat them as the cause of the PDA wording, missing key finding, or flyer gap.
