# CF-V01-E10 Live Death/Reload Matrix

**Status:** Required; not run by this implementation task

Run only on disposable single-player saves using the supported Build 42 line.
Record exact game/revision/Steam build metadata, mod commit, callback order,
pre-save canonical root, post-load canonical root, validation result and
`global_mod_data.bin` size/hash for every row. Do not use a returned
`saveGame()` call, callback receipt or process exit code as proof; the next
successful `OnInitGlobalModData` validation is the persistence result.

For root comparison, record every canonical field plus Evidence
`evidenceId/discoveryOrdinal` and JournalEntry `entryId/ordinal/kind/subjectId`
in array order. Derived journal output must be byte-identical before and after
load. Never log hidden authored truth as a normal-play surface.

## Matrix

| ID | Pre-state and action | Required observation after the next successful load |
|---|---|---|
| E10-L01 | Fresh root; normal save; reload. | Empty canonical root validates exactly; no Evidence or Journal entries appear. |
| E10-L02 | Discover D1 then D3; normal save; reload. | Evidence ordinals remain `1,2`; all Journal IDs/ordinals remain contiguous and byte-for-byte ordered; derived journal matches. |
| E10-L03 | Repeat save/reload twice from L02 without new domain input. | Roots and projections remain identical; no duplicate discovery or lifecycle record appears. |
| E10-L04 | Die before any discovery; observe callbacks; complete the engine's normal supported save/exit path; reload. | Root is the same valid empty root. Record actual death/save callback order. |
| E10-L05 | Discover D1/D3, die, then complete the normal supported save/exit path; reload. | The exact pre-death canonical root survives with no duplicate, reorder, erasure or extra death state. |
| E10-L06 | Save immediately before death, then die and reload through every engine-offered supported route. | Each successful load yields a complete valid root equal to one recorded completed save prefix; no mixed/partial root. |
| E10-L07 | After a completed canonical transaction, close via normal quit-to-desktop; repeat with window close/Alt-F4 in a disposable copy. | Record whether `OnSave`/`OnPostSave` fire and in what order. A load may reflect only the last actual game save, but must validate as one complete recorded prefix. |
| E10-L08 | Development-only fault after private candidate mutation and before `ModData.add`, then perform a supported save/reload. | Only the prior last-known-good root loads; the staged discovery is absent as a whole. |
| E10-L09 | Development-only `ModData.add` fault during `OnSave`, then during `OnPlayerDeath`; continue through a valid later save/reload. | Fault is contained/reported once per session budget; no invalid root replaces the previous good root; unrelated hooks continue. |
| E10-L10 | Deliver repeated `OnSave` and repeated death callbacks without new domain input in an isolated probe. | Canonical state is unchanged and valid; callbacks never append Evidence/Journal records. |
| E10-L11 | Attempt the already-dead-save reload path that stalled in T5, with a bounded timeout and no acceptance claim if `OnInitGlobalModData`/`OnGameStart` are not both reached. | If reachable, root matches the last completed save exactly. Otherwise retain the limitation and define the supported player flow before acceptance. |
| E10-L12 | In a disposable copy, replace the saved tag with an invalid/cyclic root before a same-process reload. | Reload fails closed, the prior session root is not exposed, `OnGameStart` cannot enter `running`, and later save/death callbacks do not overwrite the invalid evidence under test. |

## Acceptance and stop rules

E10 passes only when L01–L10 and L12 pass on the supported production adapter. L11 must
either pass or be explicitly excluded from the supported base-v0.1 player flow
with the observed limitation retained. Stop and preserve evidence on any schema
failure, missing/duplicate ordinal, reordered prior entry, unexpected root
replacement, repeated error spam or unrelated handler failure.

Do not power-cut the operating system, modify a real save, claim cross-file
atomicity, or infer behavior for callbacks that were not logged. A deterministic
No player-facing lifecycle summary is in scope for this matrix.
