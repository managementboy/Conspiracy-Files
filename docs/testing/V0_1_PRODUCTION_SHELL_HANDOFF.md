# v0.1 Build 42 Production Integration Shell — Handoff

**Implementation branch:** `codex/production-integration-shell`

**Base commit:** `1be30c45da8f8b481d508c4f7f1acead2ff6c778`

**Runtime target:** Project Zomboid Build 42.20.x; the relevant spike evidence
was observed on 42.20.4. Production acceptance must rerun on the supported live
build.

## Delivered boundary

The `mod/` directory is an installable Build 42 mod root with `42/mod.info` and
shared Lua beneath `common/media/lua/shared`. The top-level
`ConspiracyFilesBootstrap.lua` owns the sole global `ConspiracyFiles` namespace
and is idempotent if loaded twice.

The shell contains only:

- a fail-closed multiplayer decision made before event registration, canonical
  initialization, or world mutation;
- additive `OnInitGlobalModData`, `OnGameStart`, and `OnTick` registration;
- a FIFO scheduler capped at 24 work units and 1 ms measured elapsed time per
  drain, with at most 256 queued keys and duplicate queued keys rejected;
- `pcall` containment and a three-consecutive-failure budget per subsystem,
  with one concise report per subsystem and session auto-disable;
- a Global ModData adapter using the exposed `ModData.get`/`ModData.add` facade;
- staged complete-root P4-R32 validation, the conservative hard 500 KB gate,
  monotonic replacement checks, last-known-good preservation, and reconstruction
  of `ThreadState` plus derived journal/lead projections.

Each scheduled callback remains responsible for being one small, non-blocking
work unit. Lua cannot preempt a callback that individually exceeds the time
budget; the live profiler must therefore verify both task granularity and total
callback time.

## Acceptance matrix

| Surface | Offline evidence in this branch | Live Build 42 evidence still required | Status |
|---|---|---|---|
| Package/bootstrap | `luac5.1` parses every Lua file; fake entrypoint creates one namespace and registers each hook once | Enable from the B42 mod UI, load a clean save, confirm the script loads once without loader/path errors | offline pass; live pending |
| CF-V01-E09 persistence | Fake storage covers new root, existing-root reconstruction, round trip, unsafe/cyclic/oversized/regressive rejection, derived-projection equivalence, and failed-replace last-known-good preservation | Clean/repeated save-reload against Global ModData; invalid replacement; exact persisted fields/ordinals and actual file delta | **not passed; live pending** |
| CF-V01-E11 multiplayer disablement | MP=true and detector-fault decisions register zero hooks and perform zero storage calls | Host/client and dedicated-server smoke; inspect ModData/world/container state and confirm one concise disable line | **not passed; live pending** |
| CF-V01-E12 performance | Scheduler tests cover key deduplication, queue cap, per-drain work cap, and elapsed-time deadline | Profile idle, queued, initialization-adjacent, and worst-case canonical work; confirm every normal-play callback is ≤2 ms | **not passed; live pending** |
| CF-V01-E13 containment | Fake faults prove per-subsystem isolation, success reset, one-time reporting, three-consecutive-failure disablement, and no post-disable execution | Inject faults at all three production event boundaries and `ModData.add`; verify unrelated handlers continue and canonical state remains intact | **not passed; live pending** |

The completed T1/T2 spike reports justify the mechanisms but are not production
adapter evidence. In particular, a successful Lua test or package load must not
be reported as a pass for E09, E11, E12, or E13.

## Verification commands

Run from the repository root:

```text
lua5.1 test/run.lua
find mod test -type f -name '*.lua' -print0 | xargs -0 -n1 luac5.1 -p
git diff --check
```

The plain-Lua suite preserves all accepted domain-core criteria while adding
fake-backed integration-shell cases. It does not need PZ or Java globals except
for the entrypoint smoke's temporary fakes.

## Deliberate exclusions

This shell does not implement map bindings, D1–D6 placement, physical identity
scans, arrival detection, Inspect/Mark UI, notebook UI, graph, theories, AI,
content packs, retrofit, migrations, multiplayer support, or any world mutation.
It replaces no vanilla Lua and introduces no Java/ZombieBuddy dependency.

The persistence replacement uses the documented Build 42 Lua facade
`ModData.add(String, KahluaTable)`. T1 established the serializer guardrails;
the production `ModData.add` commit and end-to-end save/reload behavior remain
explicit live verification items.
