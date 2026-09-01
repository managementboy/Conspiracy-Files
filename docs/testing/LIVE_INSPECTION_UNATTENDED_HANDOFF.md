# Unattended live-inspection harness handoff

**Status:** Offline implementation complete; real-desktop live validation not run
**Branch:** `codex/unattended-live-inspection-harness`
**Base:** `e206e46b78c5c21dd381f6722a74698c2e12c324`

The implementation checkout was created with `git clone --no-local --no-hardlinks`, has no object alternates, and shared no object device/inode pairs with the source candidate at clone time. `/home/yogax380/Projects/Conspiracy-Files` was not used or modified.

## Delivered boundary

P4-R48 and ADR-0004 add a one-shot ordinary startup-gate capability for non-T10 profiles. The runner accepts only one left click or one `Return`/`space` press after the exact `game loading took` signature. It requires exactly one mapped title-matching window on the current `DISPLAY`, verifies the window PID belongs to the launcher-created process group, records the action/window/signature facts, and refuses stale, ambiguous or repeated requests.

P4-R44 is unchanged. Every unattended bundle records T10 and CF-V01-E08 as `NOT RUN`. A profile requesting T10/E08, context-menu, inventory/menu, right-click, gameplay or acceptance interaction is refused before save, mod or control mutation. No right-click or other gameplay input implementation exists.

Production mode accepts an exact clean candidate:

- a directory must belong to a clean Git worktree and match its declared deterministic tree SHA-256;
- a ZIP must match its file SHA-256 and pass traversal/symlink checks;
- either form must expose exactly one `42/mod.info` root with the declared mod ID.

The exact production payload and generated read-only observer are the only active mods. `production-payload.json` records the checksum, source commit for Git-backed candidates, mod ID and temporary install identity. The save, observer, payload, staging directory and controls participate in normal/error/signal cleanup and interrupted-run recovery.

## Migration notes for `cf-live-inspect`

Existing profiles remain manual and need no change. To create a non-T10 unattended profile:

1. Add `[acceptance]` with criterion IDs and `interaction_scope=["startup-gate"]`.
2. Add `[unattended_startup]` with `enabled=true`, `max_actions=1`, a maximum signature age no greater than 30 seconds, and `action="left-click"` or an allowlisted keypress.
3. Change only the `click-to-start` gate to the exact pattern `game loading took` and `action="startup-gate"`.
4. Change `player-ready-modal-check` to `wait` or `screenshot`; it cannot receive input.
5. Use `--non-interactive` for the run.

For a production probe, also add `[payload]` with `mode="production"`, a relative or environment-expanded `source`, exact `expected_sha256`, and `expected_mod_id`. Commit a directory candidate before running. Recompute its tree checksum with the documented `tree_checksum` command. The checked-in `dead-air-production-unattended.toml` demonstrates machine-path environment variables and a repository-relative candidate path.

## Offline evidence

`dev/live-inspection/test/run.sh` covers legacy regressions plus profile policy, one-shot bounds, stale signatures, process-group window ownership, T10/E08 and interaction refusal with `NOT RUN` evidence, payload checksum/identity/cleanliness, safe ZIP extraction, install, failure cleanup, interrupted restoration, sanitization, Lua parsing and Python compilation.

This implementation does not launch Project Zomboid, touch a real save, change security software, install dependencies, use injected/JNI helpers, select Xephyr/software rendering or claim a live acceptance result.

## Separate live-validation scope

The follow-up run must use the checked-in production unattended profile on the normal hardware-rendered display, a newly audited disposable source save, and the exact clean committed candidate. It should first run preflight, then one P2 non-interactive clean boot. Review renderer evidence, the one-action JSON, exact active-mod identity, criteria disposition, gates, normal exit, payload/save absence, control hashes and remaining processes before considering an R2 clean boot. Do not request or perform T10/E08, right-click, context-menu, inventory, gameplay or acceptance interaction.
