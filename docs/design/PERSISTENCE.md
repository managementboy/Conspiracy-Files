# Persistence

**Status:** Provisional until Spike T1.

Current rules:
- persist only canonical state that cannot be reconstructed;
- use stable IDs between records rather than assuming object references/cycles survive serialization;
- rebuild caches/indexes on load;
- provisional target is ≤500 KB canonical Conspiracy-Files state per save;
- do not persist a full map/location registry in v0.1;
- multi-step writes must be staged so adapter errors do not leave half-applied canonical state.

T1 must measure actual ModData serialization types, save/load correctness, size and timing before this design is final.
