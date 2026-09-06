# DEV-0.8.5-local-links — native acceptance

Fresh debug single-player save required after a complete game restart. Generated schema2 deliberately refuses earlier cases; existing saves are not reset or migrated. The 24-hour later-case playthrough remains deferred by the owner.

Implemented candidate:

- Seed-stable 3–7 generated clues, with three core relationships and optional corroborating objects. Types now include handwritten letters, receipts and notepads. Container counts follow the chosen case, with distinct containers and the first-house opening preserved.
- First office copy is unsigned. Other fictional participants in the existing shipment template remain; the local-person connection does not retroactively rewrite them or the original clue.
- Seeing a named ID/card on a corpse can bind its observed source to the initial house. A story-authored electrician occupation is stored separately from the native descriptor. A real building key is created with a persisted placement intent and a unique token. This is an observation-driven corpse path, not a hidden living-zombie population sampler.
- Only actually visible rows feed identity/key observations. Closed wallet contents are never enumerated. A wallet first seen on a corpse retains that observed source after movement/restart; opening its ID can bind a name, with key placement deferred until the same corpse is observed again. A wallet never seen on a corpse cannot retrospectively reveal a corpse origin.
- An observed key plus observed named document from the same source and an actual door interaction can derive a journal connection to the earlier inspected clue. Opening/closing and native lock/unlock completion are observed cooperatively. Matching is not represented as proof that an unlock succeeded, or of ownership/authorship.
- Combined journal numbering no longer restarts for identity entries. Key facts and local-person bindings join the aggregate 500KB budget. Replays do not duplicate facts; uncertain interrupted placement does not respawn missing keys.

Native sequence:

1. Restart PZ fully; start a fresh debug-SP game indoors. Confirm notebook title DEV-0.8.5-local-links and automatic opening evidence in that house.
2. Inspect the unsigned first document. Note the house; do not require a specific clue count/type.
3. Nearby, show a named ID card row in a corpse's inventory, with the initial house still loaded. Briefly unpause for queued observations. Reopen/refresh the corpse inventory and find Electrician's house key. The first slice requires a displayed label with the existing `: Name` format; it does not invent a missing ID.
4. Show the key row before taking it. Take the key (a key ring is supported), return to the starting house, and use a door. If its lock ID is still uninitialised, use the game's normal Lock/Unlock action. The mod never initialises or changes the lock itself.
5. Journal should add one Possible connection naming the observed ID, while preserving the earlier clue. Repeat the interaction and save/reload: no duplicate journal entry or key.

Automated verification: 53-test main suite plus focused generator/storage/automatic-start, identity visibility, local-person reducer/placement integration, key reducer/adapter/journal, aggregate budget, notebook memory and cooperative action-hook checks pass under Lua5.1. These are mocks/source checks, not native gameplay acceptance. The new corpse/key path has not yet been accepted in-game. Broader living-zombie casting, additional story templates and custom photo/recording mechanics are future work.

Installed 2026-09-06: 14 changed/new Lua files hash verified. Replaced-file backup: C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-200423-local-links. Final moved-wallet correction also installed and hash verified. No game saves were modified.
