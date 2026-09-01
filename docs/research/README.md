# Build 42 Research

Verified Project Zomboid Build 42 modding research belongs here.

Record concrete API findings, tested hooks, limitations, performance measurements, and version-specific behavior. Distinguish verified behavior from assumptions.

Completed reports include T1 persistence, T9 network egress, T2 map enumeration cost, T3 location categorisation reliability, T4 exact-once placement, T5 physical item identity, T7 runtime item text and T8 curated arrival detection. T3 establishes that automatic categorisation is advisory room/area-level candidate discovery only; curated catalogs remain authoritative. T8 establishes bounded/debounced state sampling with exact shape predicates because `OnPlayerMove` alone missed scripted teleports.

Priority research topics:
- persistence/save APIs;
- map/meta-grid enumeration and location classification;
- building/room/non-building arrival detection — T8 complete on Build 42.20.4; see `T8_LOCATION_ARRIVAL.md`;
- loaded vs never-loaded chunk history;
- deferred exact-once item placement — T4 complete on Build 42.20.4; see `T4_EXACT_ONCE_PLACEMENT.md`;
- persistent item identity;
- native literature/readable item mutation;
- custom Inspect integration;
- map-mod discovery;
- HTTP/network availability from vanilla Lua;
- situations that may require ZombieBuddy.
