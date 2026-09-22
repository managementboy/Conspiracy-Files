# ADR-0005 — Build-versioned fixed-container index

**Status:** Accepted, 2026-09-22. Extends the generated-placement decisions;
does not replace the exact live-target and bounded-fallback requirements.

## Context

Vanilla building geometry and fixed furniture come from the installed map, so
repeating a full square/object/container walk for every new game pays runtime
work to rediscover data that is identical for that exact map build. Loot,
vehicles, bodies, player-moved furniture, map mods and later game builds are not
identical and cannot safely be predicted by that catalogue.

A coordinate alone is not authority to write. A map update, mod or player action
can replace the object, and a player may search the container between selection
and materialisation. The existing exact-once protocol also requires placement
intent to be persisted before an item is created.

## Decision

Ship a derived, exact-map-member/exact-build index for fixed vanilla containers.
Project Zomboid reports the active maps as a semicolon-separated stack; the
index map must equal one complete member of that stack, never a substring. Each
row contains only:

`building ID, x, y, z, sprite, container type, room`

The generated schema uses string dictionaries, per-building coordinate bases
and base-36 packed rows. It is decoded lazily one selected building at a time.
No object index, container index, loot or save-derived state is shipped.

Case generation selects an indexed signature without reading world squares and
saves it as an `indexed` waiting assignment. Nothing is materialised until its
square is loaded. At that point runtime must verify:

- the live BuildingDef still has the indexed ID (except an exterior postbox,
  which may have no building on its square);
- sprite and container type match exactly;
- live object/container indexes can be resolved;
- `isExplored()` is available and false; and
- the container is not currently open in the player's loot UI.

The freshness check runs again immediately before the normal exact-once
placement intent and item creation. Unknown search state fails closed.

An exact build plus exact map-stack-member match avoids fixed-furniture
scanning. Vehicle parts remain a
bounded live scan because cars move. Bodies/zombies remain the carrier scan.
Changed indexed targets fall back to the existing bounded modified-building
scan. Unsupported maps/builds retain the original bounded fixed scan.

The current payload is derived from the installed Muldraugh aggregate reported
as Build 42.20: 240,059 signatures in 8,908 buildings, including fixed indoor
containers and nearby postboxes. Its source row SHA-256 is
`93afec58dd48cc0ed6068eb68218fd0c62e3108c284771b3575db764ef271ea5`.

## Alternatives considered

- **Scan every new game:** correct but repeats an avoidable map-wide/fixed-site
  discovery cost and delays case creation.
- **Ship live object/container indexes:** smaller lookup work, but unsafe because
  object ordering is runtime state and may change without moving the furniture.
- **Materialise all evidence at game start:** fast later, but writes unloaded
  world state, ignores player timing and expands exact-once recovery risk.
- **Trust coordinates without live validation:** fastest but can write into a
  replacement object, a modded building or storage the player already searched.

## Consequences

- Supported vanilla destinations are chosen immediately from compact data.
- The checked-in asset grows the mod by about 3.8 MB and must be regenerated for
  a changed map/build line.
- Fixed-container candidates are deterministic across fresh games for that map
  build; seeded selection still varies which suitable candidate a case uses.
- Dynamic world objects and modified/unsupported worlds remain flexible through
  bounded live discovery.
- Plain-Lua tests prove policy and exact matching; Kahlua proves parseability;
  live game acceptance is still required for engine behavior and feel.
