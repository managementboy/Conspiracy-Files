# Project Zomboid Build 42 API Notes

This file distinguishes **reviewer hypotheses/current-context claims** from **observed project probe results**. Do not promote a claim to “verified” until a spike records the build/API/observed behaviour.

## Reviewer-reported baseline (2026-08-30)
- Build 42.20 is on stable; review reports current stable 42.20.4.
- Build 42 map is substantially larger than B41.
- Further modding support is expected during the Build 42 support cycle.
- Patch-exact mod-folder/version assumptions are unnatural; verify actual conventions in the first loadable-mod probe.

These statements came from the engineering review and are not yet independently re-verified in this repository.

## Required spikes

### T1 — ModData persistence limits
Test serialisable types, cycles, metatables, non-string keys, nesting and 1k/10k/100k record size/timing.

### T2 — Full map/meta-grid enumeration cost
Measure total cost on current B42 map and whether work must be spread across frames.

### T3 — Location categorisation reliability
Test police station, office, bookstore, hospital, transmission/non-building site across vanilla; map-mod support later. v0.1 uses curated locations regardless.

### T4 — Exact-once deferred placement
Find safest hook; test chunk reload, save/reload, burned/destroyed container, repeated load.

### T5 — Persistent physical item identity
Stamp project UUID/ID in item ModData if possible; test inventory/container/floor/vehicle/death/save-load transitions.

### T6 — Never-loaded chunk detection
Future retrofit only. Determine whether reliable per-candidate loaded-history state exists.

### T7 — Item name/description/page text mutation
Determine which asset types can show world-specific content and whether native reader behavior can be retained.

### T8 — Building/room/non-building arrival detection
Test multi-floor and basement cases plus a non-building landmark.

### T9 — Network egress from Lua
Confirm whether vanilla Lua can perform HTTP/network requests. The core design remains no-AI-primary regardless.

### T10 — Cooperative Inspect context-menu integration
Add/remove an `Inspect` entry without replacing vanilla or other-mod handlers.

Use `SPIKE_TEMPLATE.md` for every result.
