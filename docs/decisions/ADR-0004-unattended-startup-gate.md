# ADR-0004 — One-shot unattended startup gate

**Status:** Corrected offline after failed real-desktop delivery; independent live validation pending
**Decision date:** 2026-09-01

## Context

The development laptop may be physically unattended while a non-T10 live matrix runs. Project Zomboid's ordinary click-to-start gate can halt an otherwise bounded disposable run. P4-R44 separately requires human-driven GUI interaction for T10 and every CF-V01-E08 context-menu acceptance rerun.

## Decision

The reusable hardware-rendered live-inspection harness may emit one XTEST left click only at the ordinary startup gate. The earlier `Return`/`space` implementation is disabled because the 2026-09-02 real-desktop attempt returned command success without advancing PZ. Before the click it must have:

- matched the exact `game loading took` signature within at most 30 seconds, then completed a bounded settle and fresh visible startup-control check;
- retained the launcher PID it created;
- found exactly one mapped Project Zomboid window on the current `DISPLAY`;
- verified launcher and window PID/start-time identities, process-group ownership, client geometry, active-window/focus state and the unobscured pointer target immediately before XTEST; and
- retained an unused action budget of exactly one.

The command and ownership facts are written as structured evidence, but delivery remains pending until a fresh run-scoped observer `PLAYER_READY` line occurs after the click. Command success without that transition is explicitly `NOT_CONFIRMED`. Any ambiguity, stale log/screenshot, focus/window/geometry drift, missing Xlib/XTEST/Pillow capability or second request fails closed. No right-click, context menu, inventory/menu action, gameplay action or acceptance interaction is implemented.

An unattended profile always records T10 and CF-V01-E08 as `NOT RUN`. If it requests either criterion or any prohibited interaction scope, the run is refused before save, mod or control mutation. P4-R44 is unchanged.

Production-observation profiles may additionally install either a checksum-pinned ZIP or a checksum-pinned directory from a clean Git worktree. The harness verifies one Build 42 mod root and the expected mod ID, records checksum and source commit when applicable, activates exactly that payload plus the read-only observer, and archives/removes both during normal, error, signal or journal recovery cleanup.

## Consequences

- Non-T10 live work can continue on an unattended normal desktop without injected/JNI helpers or software rendering.
- The startup exception cannot be reused as T10 or gameplay automation authority.
- Checked-in profiles can use environment-expanded machine paths and relative candidate paths rather than user-specific absolute paths.
- Live acceptance is not claimed until a separate run validates the real window/PID/XTEST path and reviews the evidence bundle.
