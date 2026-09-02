# CF-V01-E10 — Death and reload lifecycle boundary

> Integrated into the offline candidate with the world and presentation
> runtimes. Its live runbook remains required; integration does not promote any
> unobserved callback ordering or already-dead reload behavior to fact.

- **Status:** Production boundary implemented and fake-backed; live acceptance pending
- **Target:** Project Zomboid Build 42.20.x
- **Implementation base:** `0f90648`
- **Live runbook:** [`../testing/CF_V01_E10_LIVE_MATRIX.md`](../testing/CF_V01_E10_LIVE_MATRIX.md)

## Selected boundary

The smallest v0.1 boundary adds no death record or player-facing lifecycle state. Canonical
discoveries are already committed as complete validated Global ModData roots at
the domain transaction boundary. Lifecycle handling only re-stages the
persistence adapter's private last-known-good root and republishes that complete
root on `OnSave` and `OnPlayerDeath`.

Reload remains the existing `OnInitGlobalModData` validation/reconstruction
followed by `OnGameStart`. A lifecycle checkpoint never calls `saveGame()`,
does not scan a corpse or inventory, and does not create, reorder or reinterpret
knowledge. `OnPostSave` is not used as an integrity signal because T1 established
that a returned save and normal process exit do not prove serialized integrity;
only the next load can do that.

No player-facing lifecycle summary is part of base v0.1. This
keeps CF-V01-E10 knowledge preservation independent from UI, AI, network and
unverified already-dead-save behavior.

## Verified Build 42 inputs

These are observations from existing repository research, not new live results:

| Surface | Existing evidence | What is safe to use |
|---|---|---|
| `OnInitGlobalModData` | T1 validated loaded Global ModData from this callback after real save/reload. | Treat as the authoritative reload validation boundary. |
| `OnGameStart` | T4/T5 production-mechanism probes received it on ordinary successful loads. | Mark the reconstructed session runnable; do not force a save from it. |
| `OnSave` / `OnPostSave` | T1 observed both around explicit and normal-exit saves. | Use `OnSave` as a cooperative checkpoint input; do not treat either callback or a returned save as persistence proof. |
| `OnPlayerDeath` | T5 received it one tick after the disposable character entered the engine death flow. | Re-publish canonical last-known-good state without depending on the callback argument or corpse state. |
| Global ModData replacement | T1 proved validated plain tables round-trip and established P4-R32/P4-R17. | Publish only a complete validated copy, never a live domain object or partially mutated candidate. |

## Assumptions and unproven behavior

The implementation does **not** promote any of these to facts:

- event ordering among `OnPlayerDeath`, inventory-to-corpse transfer, `OnSave`
  and `OnPostSave`;
- whether every death, Alt-F4, window close or process termination performs a
  save or emits any particular callback;
- whether mutation performed inside production `OnSave` is included in that
  same Build 42 Global ModData serialization pass;
- atomicity between Global ModData, world/chunk data and the operating-system
  file write;
- successful reload of an already-dead character save. T5's attempt stalled
  before `OnGameStart`, so corpse persistence and that load path remain unproven;
- persistence of progress created after the game's last completed save when the
  process is terminated without a save callback. The supported invariant is a
  complete valid prefix matching the actual loaded save, not out-of-band
  durability beyond PZ's save semantics.

No `OnMainMenuEnter`, quit-specific or invented hook was selected. The live
matrix must measure the above ordering and durability cases before E10 is
accepted.

## Offline evidence

The fake-backed suite proves:

- save and repeated death checkpoints publish a deep-copied full
  last-known-good root;
- ordinary same-runtime reconstruction preserves Evidence discovery ordinals,
  JournalEntry IDs/ordinals and deterministic derived journal output exactly;
- a private candidate interrupted after mutation is never visible to storage;
- a checkpoint replacement fault leaves the adapter's private last-known-good
  root unchanged and is contained by the production error budget;
- a corrupt externally held published table is replaced by the adapter's
  private good copy at the next checkpoint;
- lifecycle callbacks before canonical initialization are harmless no-ops;
- an invalid same-process reload clears the prior session authority and cannot
  expose or checkpoint that stale root;
- the production entrypoint registers each cooperative hook once.

These tests do not pass live CF-V01-E10.

## Scope exclusions

No death UI, physical item/corpse reconciliation, placement, arrival,
graph, AI, network, migration or multiplayer behavior is implemented here.
