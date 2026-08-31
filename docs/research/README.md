# Build 42 Research

Verified Project Zomboid Build 42 modding research belongs here.

Record concrete API findings, tested hooks, limitations, performance measurements, and version-specific behavior. Distinguish verified behavior from assumptions.

Completed reports include T1 persistence, T9 network egress, T2 map enumeration cost, and T3 location categorisation reliability. T3 establishes that automatic categorisation is advisory room/area-level candidate discovery only; curated catalogs remain authoritative.

Priority research topics:
- persistence/save APIs;
- map/meta-grid enumeration and location classification;
- building/room arrival detection;
- loaded vs never-loaded chunk history;
- deferred exact-once item placement;
- persistent item identity;
- native literature/readable item mutation;
- custom Inspect integration;
- map-mod discovery;
- HTTP/network availability from vanilla Lua;
- situations that may require ZombieBuddy.
