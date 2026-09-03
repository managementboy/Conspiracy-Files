# Build 42 Research

Verified Project Zomboid Build 42 modding research belongs here.

Record concrete API findings, tested hooks, limitations, performance measurements, and version-specific behavior. Distinguish verified behavior from assumptions.

Completed reports include T1 persistence, T9 network egress, T2 map enumeration cost, T3 location categorisation reliability, T4 exact-once placement, T5 physical item identity, T7 runtime item text, T8 curated arrival detection and T10 cooperative Inspect integration. T3 establishes that automatic categorisation is advisory room/area-level candidate discovery only; curated catalogs remain authoritative. T8 establishes bounded/debounced state sampling with exact shape predicates because `OnPlayerMove` alone missed scripted teleports. T10 establishes privately keyed player/Ground inventory-pane actions and explicitly excludes direct-world-item right-click as a supported dependency.

Planned composition gates are T11 adapter integration (`T11_ADAPTER_INTEGRATION.md`) and T12 Build 42 ISUI feasibility (`T12_UI_RUNTIME.md`). They remain unproven until their live evidence is recorded.

Priority research topics:
- persistence/save APIs;
- map/meta-grid enumeration and location classification;
- building/room/non-building arrival detection — T8 complete on Build 42.20.4; see `T8_LOCATION_ARRIVAL.md`;
- loaded vs never-loaded chunk history;
- deferred exact-once item placement — T4 complete on Build 42.20.4; see `T4_EXACT_ONCE_PLACEMENT.md`;
- persistent item identity;
- native literature/readable item mutation;
- custom Inspect integration — T10 complete on Build 42.20.4 for player and Ground/loot inventory panes; see `T10_COOPERATIVE_INSPECT.md`;
- map-mod discovery;
- HTTP/network availability from vanilla Lua;
- situations that may require ZombieBuddy.
