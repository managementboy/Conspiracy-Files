# Dead Air live validation — 2026-09-04

Build: Project Zomboid 42.20.4 (`b0bbce05d5`), single-player debug mode.

## Confirmed locations

- Electronics store / relay: `(10615, 9603, 0)`; items placed on shelves near `(10614, 9604)`.
- Police station: `(10638, 10411, 0)`; items placed on the property counter near `(10637, 10410)`.
- Rourke motel room: `(10649, 9827, 0)`; D4 placed in dresser near `(10648, 9826)`.

## Validated chain

D1 ticket → D2 property record → D3 invoice → D4 notebook → D5 access memo → D6 shift note → B-37 key.

Every document was physically placed, retrieved, and inspected. Repeated inspection produced `created=false`. The key was physically placed and successfully marked, producing `dead-air:evidence:marked:0001`.

## Automated test

The debug harness is `common/media/lua/client/ConspiracyFiles/DebugHarness.lua` and is started with:

```lua
ConspiracyFiles.DebugHarness.run()
```

It logs `HARNESS|step=complete` after the D1–D6 state chain. Physical placement is logged separately as `physical-dN|result=placed`.

The 2026-09-05 order-independent placement refactor preserves that command, route, and completion marker. It additionally logs the persisted placement seed and candidate IDs. The refactored candidate pool itself has not yet received a live Build 42 validation pass; the results above validate the coordinates/furniture areas and the earlier scaffold only.

## Caveat

Instant debug teleports can briefly expose no loaded square. Runtime placement therefore retries pending deliveries; normal walking/arrival is the representative gameplay path. The harness is debug-only test tooling and should be gated or excluded before production shipping.
