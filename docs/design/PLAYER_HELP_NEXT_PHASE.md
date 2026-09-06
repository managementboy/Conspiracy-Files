# Player Help — investigation notes and maps

This is copy for a later player-facing Help screen. It does not promise a new access key, menu, or automatic investigation start.

## Addresses and the world map

Some buildings can show a Conspiracy-Files address. These are fictional game addresses, not real postal addresses. In the current Muldraugh trial, Main Street is the east/west numbering baseline and First Street is the north/south baseline. Numbers increase away from those lines, and nearby blocks use different hundred-number ranges. On east-west roads, odd numbers are on the north side and even numbers are on the south. On north-south roads, odd numbers are on the east and even numbers are on the west.

Addresses only appear for places your map already reveals. Reading a paper map reveals addresses in the area that paper map actually opens; simply carrying a map does not. An address label does not mean that a clue is there.

## Finding clues

When you successfully take a clue, the game remembers where it came from. Inspecting it records the evidence in your notes. Once inspected, that evidence stays in your notes even if you later drop the paper. Reading it somewhere else does not move its finding location.

Map marks need a pen or pencil in your carried inventory, including bags. Without one, your notes can still record the clue and its original finding place. The map mark waits until you have a suitable writing tool, then catches up at the original location. Existing marks remain if you drop the tool or the document.

If an older discovery has no recorded finding place, the game cannot rebuild it from where you are standing now. It stays in your notes without a map mark. If several clues came from the same place, each mark remains identifiable by its evidence number and title.

## Availability messages

- “Finding location remembered. Map marking waits for a pen or pencil.” — The finding place was captured. Inspect the clue to record its evidence, then carry a writing tool to add its mark later.
- “Map marking unavailable for this older clue.” — Its original finding place was never recorded, so no location is guessed.
- “Address unavailable here.” — This building or map area does not currently have a visible address label.

## Current work and later work

The address and clue-mark behavior above is implemented for the current development path but still awaits native gameplay verification. It is not yet a promise for every town, building, paper map, or ordinary play session.

Automatic first clues, several investigations in one save, and how later investigations choose their starting area are future work. They will not reveal hidden clues, replace missing historical locations, or turn uncertain records into a solved explanation.

Development policy update: P4-R62 selects the current player position when a later investigation is created, with a minimum in-game gap and small concurrent-case cap. Exact tuning remains configurable offline; this is not implemented in the live trial. Grounded, ambiguous story tone is approved; individual new draft text remains under review.
