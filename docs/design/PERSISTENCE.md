# Persistence

**Status:** T1 constraints implemented by the production adapter; live E09/E10 acceptance pending.

Current rules:
- persist only canonical state that cannot be reconstructed;
- use stable IDs between records rather than assuming object references/cycles survive serialization;
- rebuild caches/indexes on load;
- hard v0.1 limit is ≤500 KB canonical Conspiracy-Files state per save;
- do not persist a full map/location registry in v0.1;
- multi-step writes must be staged so adapter errors do not leave half-applied canonical state.
- `OnSave` and `OnPlayerDeath` checkpoints re-stage only the adapter's private
  last-known-good complete root; they never force a save or treat callback
  receipt as durability proof.

T1 measured serializer types, save/load correctness, size and timing on Build
42.20.4. Production E09/E10 must still prove the adapter and lifecycle matrix on
the supported live build.
