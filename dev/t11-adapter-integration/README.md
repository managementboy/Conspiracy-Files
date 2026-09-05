# T11 v0.1 adapter-composition probe

Status: preparation scaffold; not live-proven.

This disposable probe will combine one final-bound Dead Air fixture with the accepted domain core and the mechanisms proven separately by T1, T4, T5, T8 and T10. It must remain isolated from `mod/` and must not become production code by copy/paste.

## Entry conditions

- Issue #28 has produced an exact target binding or the run is explicitly labeled provisional.
- The installed Build 42 version and revision are recorded at run time.
- A disposable save and this probe are the only enabled project test surface.
- Baseline profile/control files are hashed and archived before setup.
- The manual route required by P4-R44 is followed for context-menu interaction.

## Deterministic run matrix

| Phase | Action | Required evidence |
|---|---|---|
| A | Start with no T11 canonical root or stamped item | Build/mod/save identity and zero-count baseline |
| B | Load the exact target and allow queued placement | One detached-prestamped item, count one, canonical `placed` |
| C | Repeat callbacks; stream target out/in | Count remains one; no duplicate domain transition |
| D | Inspect once manually and save immediately | One Inspect intent and one Evidence; one asset-discovered entry plus one thread-introduced entry for fresh D1/D2; valid staged root |
| E | Reload and inspect again | Same item token; no duplicate Evidence/JournalEntry |
| F | Force arrival sample and reconciliation on one scheduled tick | One location confirmation at most; no partial state |
| G | Move item from original container and reload | Item remains `available`; placement remains `placed` |
| H | Copy token onto a second distinct item | Sticky `conflict`; no winner, deletion, restamp or new placement |
| I | Inject boundary faults one at a time | `pcall` containment, last-good root preserved, bounded log/disable behavior |
| J | Final save/reload and accounting | Stable root, token count, callback counts, timing and size evidence |

## Required fault controls

Faults must be explicit one-shot scenario values in probe-owned ModData, never timing guesses. Cover before/after placement intent, after add/before verify, before canonical swap, Inspect-domain call, arrival-domain call, persistence write and callback body.

## Stop conditions

Stop immediately on a security alert, unexpected non-disposable save/mod state, unsupported build, unexplained duplicate, canonical validation failure outside an intended fault, or evidence that the probe is mutating another mod's state.

## Completion

Populate `docs/research/T11_ADAPTER_INTEGRATION.md` with observed facts and archive the log, setup hashes and run record under `evidence/`. A clean static review does not complete T11.
