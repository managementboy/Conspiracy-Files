# Live session plan — 2026-09-06

**Historical plan:** core marker, pending save/reload and map-knowledge checks have since passed; see LIVE_SESSION_2026-09-06.md. Owner subsequently authorized two isolated temporary colour-test notes after exhausting this save. These do not grant investigation knowledge. The original prohibition below applied to the real pickup/source validation, not this explicitly authorized colour-only fixture.

No testing or game input was automated while the owner was away. Updated Lua files require a full game restart for the new shared save-budget module; do not use the earlier Notebook-only hot-load instructions for this batch.

## Existing save: brief regression

1. Restart Project Zomboid in the same debug Build 42.20.4 setup, with Conspiracy-Files enabled and T11/T12 disabled. Load the existing save normally.
2. Open the notebook. Its three known clues and their text should remain. They now explain that historical finding locations were not recorded. No invented clue marks should appear.
3. Check the map: existing house numbers must remain stable. Any unfinished coverage update may run while unpaused. Save normally.

## Fresh save: marker behavior

Use a separate new save so we can observe genuinely new pickups without deleting discoveries from the existing case. Muldraugh is the supported trial area. After loading, run this one command:

```lua
require("ConspiracyFiles/Trial").start()
```

This enables finding capture, starts/reuses addressing, and starts/resumes the generated case. It never clears or rerolls an existing case. Unpause until ready; the PM can read the log and identify the first clue container, as before. Do not spawn test clues or alter knowledge flags.

1. Leave every pen/pencil outside your carried inventory (including bags). Pick up a clue, walk away, then Inspect it. Journal learns it; MAP NOTE says marking waits. No map X yet.
2. Acquire a pen or pencil. After an unpaused second, the original pickup location receives X plus the clue's notebook number/title. The place where you read it must not be marked.
3. Remove the writing tool. Find and Inspect the next clue: previous maasssssrks stay, new one waits. Recover the tool and verify catch-up without duplicate marks.
4. Where two clues share one container, inspect both: one X, both titles. Drop the papers; journal and marks remain.
5. Save and reload. Check marked clues and a queued clue (if available) persist. A pen inside a carried bag should qualify. Ordinary vanilla annotations remain unchanged.

Floor pickups and whole-bag pickups have mocked coverage; only test these in-game if convenient after the main path. Native rendering, nested-container API behavior, actual save serialization and frame cost remain unaccepted until observed. Stop and report any Lua error; do not rerun a failed action repeatedly.

## What remains outside this batch

One case per save, manual debug start, developmental prose, no multiplayer. The interrupted-placement ambiguity remains conservative: a missing token after an interrupted intent never triggers automatic replacement. No multi-case progression or production-release acceptance is claimed. Clue marks are mod-owned overlays, not editable vanilla annotations.

## Map-label edge check

When testing new clue marks, pan the map so a marked clue is near the right or bottom edge. Its X should stay attached to the finding location; text should remain within the map window, shortening long titles if needed. Notebook clue numbers and non-ground-floor identifiers should remain readable where the window has room. This is a pending native check, not an offline acceptance claim.
