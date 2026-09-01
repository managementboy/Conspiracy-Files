# ADR-0004 — One-shot unattended startup gate

**Status:** Accepted for offline implementation; live validation pending
**Decision date:** 2026-09-01

## Context

The development laptop may be physically unattended while a non-T10 live matrix runs. Project Zomboid's ordinary click-to-start gate can halt an otherwise bounded disposable run. P4-R44 separately requires human-driven GUI interaction for T10 and every CF-V01-E08 context-menu acceptance rerun.

## Decision

The reusable hardware-rendered live-inspection harness may emit one XTEST left click or one allowlisted `Return`/`space` keypress only at the ordinary startup gate. Before that action it must have:

- matched the exact `game loading took` signature within at most 30 seconds;
- retained the launcher PID it created;
- found exactly one mapped Project Zomboid window on the current `DISPLAY`;
- verified that window's `_NET_WM_PID` belongs to the launcher's process group; and
- retained an unused action budget of exactly one.

The action and ownership facts are written as structured evidence. Any ambiguity, stale signature, missing Xlib/XTEST capability or second request fails closed. No right-click, context menu, inventory/menu action, gameplay action or acceptance interaction is implemented.

An unattended profile always records T10 and CF-V01-E08 as `NOT RUN`. If it requests either criterion or any prohibited interaction scope, the run is refused before save, mod or control mutation. P4-R44 is unchanged.

Production-observation profiles may additionally install either a checksum-pinned ZIP or a checksum-pinned directory from a clean Git worktree. The harness verifies one Build 42 mod root and the expected mod ID, records checksum and source commit when applicable, activates exactly that payload plus the read-only observer, and archives/removes both during normal, error, signal or journal recovery cleanup.

## Consequences

- Non-T10 live work can continue on an unattended normal desktop without injected/JNI helpers or software rendering.
- The startup exception cannot be reused as T10 or gameplay automation authority.
- Checked-in profiles can use environment-expanded machine paths and relative candidate paths rather than user-specific absolute paths.
- Live acceptance is not claimed until a separate run validates the real window/PID/XTEST path and reviews the evidence bundle.
