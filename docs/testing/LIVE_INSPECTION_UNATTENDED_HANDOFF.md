# Unattended live-inspection harness handoff

**Status:** Offline startup-delivery correction complete; fresh independent live validation not run
**Correction branch:** `fix/live-inspection-x11-startup-delivery`
**Correction base:** `ed2208311929c096921ca05509f645e6654522e2`
**Original implementation branch/base:** `codex/unattended-live-inspection-harness` / `e206e46b78c5c21dd381f6722a74698c2e12c324`

The correction checkout is `/home/yogax380/Documents/Codex/2026-09-02/conspiracy-files-fix-automated-harness-startup/work/conspiracy-files-live-inspection-startup-fix`. It was freshly created from the exact clean detached base with `git clone --no-local --no-hardlinks`, then had its origin removed. It has no alternates and shared zero Git-object and tracked-working-file device/inode pairs with either the harness source or the protected candidate. `/home/yogax380/Projects/Conspiracy-Files` was not used or modified.

## Failed-run evidence audit

The correction used both bundles under `/home/yogax380/Documents/Codex/2026-09-02/conspiracy-files-automated-live-test/outputs/evidence/`: mouse run `20260902-191127-b0b11249` and Return run `20260902-191904-f39c5e1c`. Each manifest contains 302 file records. Every recorded size/hash still matches except `run-state.json`, whose expected mismatch is the later non-launching recovery update from `CLEANUP_FAILED` to `RECOVERED`. Both consoles end at `game loading took` with no `OnGameStart`, canonical-ready, `PRODUCTION_READY` or `PLAYER_READY`; both 180-second timeout screenshots show the same ordinary gate. Candidate checksum/commit, observer profiles, control baselines, renderer records and archived save markers agree with the smoke report. The protected settings remain 960x1008, windowed and non-borderless, with a 960x1040 decorated capture.

## Delivered boundary

P4-R48 and ADR-0004 add a one-shot ordinary startup-gate capability for non-T10 profiles. The 2026-09-02 real-desktop attempts showed that the original implementation acted immediately after the textual load signature, clicked the client midpoint rather than the rendered lower-center control, and called an XTEST command success “delivery” without observing any state change. One midpoint click and one Return command both left the ordinary Click to Start screen unchanged for 180 seconds.

The corrected runner accepts only one left click. After the exact `game loading took` signature it waits the configured bounded settle, requires a fresh owned-window screenshot containing the lower-center startup-control visual signature, and targets `(width/2,height*20/21)`—`(480,960)` for the preserved 960x1008 client. It records the expected 960x1040 decorated screenshot separately. Immediately before the action and after pointer warp it revalidates exact launcher/window PID start identities, process group, sole mapped window, title, root origin/client geometry, active window, focus and unobscured pointer ownership.

XTEST completion is recorded as `PENDING_TRANSITION`, never successful delivery. Only a fresh run-scoped observer `PLAYER_READY` line after the click changes the evidence to `CONFIRMED`; timeout/process exit becomes `NOT_CONFIRMED`. Buffered pre-action log lines and stale/pre-existing screenshots cannot satisfy the boundary. The Return/space strategy is explicitly rejected pending new evidence rather than silently used as a fallback.

P4-R44 is unchanged. Every unattended bundle records T10 and CF-V01-E08 as `NOT RUN`. A profile requesting T10/E08, context-menu, inventory/menu, right-click, gameplay or acceptance interaction is refused before save, mod or control mutation. No right-click or other gameplay input implementation exists.

Production mode accepts an exact clean candidate:

- a directory must belong to a clean Git worktree and match its declared deterministic tree SHA-256;
- a ZIP must match its file SHA-256 and pass traversal/symlink checks;
- either form must expose exactly one `42/mod.info` root with the declared mod ID.

The exact production payload and generated read-only observer are the only active mods. `production-payload.json` records the checksum, source commit for Git-backed candidates, mod ID and temporary install identity. The save, observer, payload, staging directory and controls participate in normal/error/signal cleanup and interrupted-run recovery.

## Migration notes for `cf-live-inspect`

Existing profiles remain manual and need no change. To create a non-T10 unattended profile:

1. Add `[acceptance]` with criterion IDs and `interaction_scope=["startup-gate"]`.
2. Add `[unattended_startup]` with `enabled=true`, `max_actions=1`, a maximum signature age no greater than 30 seconds, `post_signature_settle_seconds` shorter than that maximum, and `action="left-click"`.
3. Change only the `click-to-start` gate to the exact pattern `game loading took` and `action="startup-gate"`.
4. Change `player-ready-modal-check` to the exact pattern `\[CF-INSPECT\].*kind=PLAYER_READY` and `wait` or `screenshot`; it cannot receive input.
5. Use `--non-interactive` for the run.

For a production probe, also add `[payload]` with `mode="production"`, a relative or environment-expanded `source`, exact `expected_sha256`, and `expected_mod_id`. Commit a directory candidate before running. Recompute its tree checksum with the documented `tree_checksum` command. The checked-in `dead-air-production-unattended.toml` demonstrates machine-path environment variables and a repository-relative candidate path.

## Offline evidence

`dev/live-inspection/test/run.sh` covers legacy regressions plus profile policy, one-shot bounds, real log-observation freshness, buffered-line retention, stale screenshot/log rejection, visible gate recognition, PID/start-time ownership, focus/window/geometry races, command-success-without-transition failure, successful run-scoped transition confirmation, T10/E08 and interaction refusal with `NOT RUN` evidence, payload checksum/identity/cleanliness, safe ZIP extraction, install, failure cleanup, interrupted restoration, sanitization, Lua parsing and Python compilation.

This correction did not launch Project Zomboid, touch a real save, change security software, install dependencies, use injected/JNI helpers, select Xephyr/software rendering or claim a live acceptance result.

## Separate live-validation scope

This remains offline-only. The lower-center visual classifier is derived from the two recorded English gate frames and the action has not yet been proven on a fresh PZ process. It deliberately fails closed if the theme, localisation, scaling or window-manager decoration no longer fits those bounds. `PLAYER_READY` confirms that startup crossed the ordinary gate; it does not by itself accept any downstream module criterion.

Independent QA must:

1. Obtain a new owner confirmation that no remote Project Zomboid gameplay is active.
2. Clone the committed correction independently and rerun the complete offline suite plus the two-bundle recorded-state replay.
3. Re-audit a disposable source save and exact clean committed candidate, then run the non-launching preflight on the normal hardware-rendered display.
4. Run exactly one P2 non-interactive clean boot. Do not use a key fallback or repeat input in that run.
5. Verify `startup-gate-ready.png` visibly contains the ordinary control, the action JSON records client `(960,1008)`, decorated `(960,1040)`, target `(480,960)`, stable PID/start identities and `delivery_status=CONFIRMED` only beside a later run-scoped `PLAYER_READY` line.
6. Review renderer/payload identity, criteria disposition, downstream gates, normal exit, archived/absent staging paths, exact restored control hashes and remaining processes. On any startup failure, stop and recover; do not attempt another strategy in the same run.
7. Consider a fresh R2 clean boot only after P2 passes. Do not request or perform T10/E08, right-click, context-menu, inventory, gameplay or acceptance interaction.
