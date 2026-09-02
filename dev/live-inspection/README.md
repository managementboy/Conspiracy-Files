# Reusable Project Zomboid live-inspection harness

`dev/live-inspection` is the repository-wide runner for disposable Build 42 map and runtime investigations. It separates reusable orchestration from declarative site facts, fails closed around saves, processes and renderers, and archives a sanitized evidence bundle after every owned run.

It is development tooling, not production Conspiracy-Files code. It does not change vanilla game files, install Java/JNI helpers, inject into the process, alter security settings, or expose normal-play diagnostics. T10 reruns remain manual-GUI-only under P4-R44. P4-R48 permits one narrowly verified ordinary startup-gate action for non-T10 runs; the current evidence-supported implementation is one left click and does not permit T10, context-menu, inventory, gameplay or acceptance automation.

## Architecture

The operator supplies a TOML profile. The Python runner validates the profile, renderer and machine state before mutation, owns a global file lock for the whole run, creates unique disposable save/mod paths, backs up protected controls with SHA-256 manifests, starts one owned launcher, advances through bounded log gates, and restores controls byte-for-byte during signal, error and normal cleanup. It never adopts, stops or cleans up a process it did not start. A production profile may install one exact candidate payload beside the observer; a directory must be in a clean Git worktree and a ZIP must be checksum-pinned.

The temporary pure-Lua probe loads only the generated profile adapter. Its core contains no site coordinates. It validates the exact save and exact active-mod set, teleports only the disposable character, waits for an unpaused loaded player square, scans in batches constrained by both count and elapsed milliseconds, emits structured `[CF-INSPECT]` records, requests a normal quit, and never calls `saveGame()` or mutates map objects or containers.

Profiles define paths, the protected control set and disposable-source marker, acceptance criteria and interaction scope, payload identity, sites with role/bounds/entry/levels/room hints, ordered lifecycle gates, time budgets, and whether explicitly requested multi-site operation is allowed. The [Dead Air P2/R2 adapter](profiles/dead-air-p2-r2.toml) migrates provisional inputs only. The [production unattended example](profiles/dead-air-production-unattended.toml) uses environment-expanded machine paths and a repository-relative payload path; update its exact checksum whenever the candidate payload changes. Neither profile is new live evidence.

## Safety contract

A live run is refused unless the following are all true:

1. The profile parses and selects known sites.
2. `DISPLAY` identifies the current graphical session and `glxinfo -B` returns a non-software renderer.
3. The source is an immediate child of `Zomboid/Saves/Sandbox`, is not named like an inspection output, and contains the configured `.cf-live-inspection-source` marker.
4. The exclusive `/tmp/conspiracy-files-live-inspection.lock` is acquired.
5. `/proc` contains no Project Zomboid binary, launcher, main-screen JVM marker, or other inspection launcher.
6. Generated `CF_INSPECT_*` save and `CF_LiveInspection_*` mod paths do not exist.

For `payload.mode="production"`, the runner additionally requires an exact lowercase SHA-256 and expected mod ID. It rejects dirty Git directory candidates, ZIP traversal/symlinks, multiple or missing Build 42 mod roots, identity drift and checksum drift. The active set is exactly the production mod plus the generated observer. Evidence records the candidate path, tree/package checksum, source commit when Git-backed, mod ID and temporary install identity.

The marker is deliberate operator authorization that a save is already disposable. Create it only in a save reserved as a clone source. Never add it to a real play save.

The runner backs up existence, bytes, modes and hashes for `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` before changes. Cleanup archives the generated save/mod into the bundle, restores existing files atomically, removes control files that did not previously exist, verifies every restored hash, sanitizes console output, and emits a hash manifest. Cleanup errors produce `CLEANUP_FAILED` and are never hidden.

The runner sends `SIGTERM` only to its owned launcher if abnormal cleanup requires it. It does not use `pkill`, adopt an old process, manipulate Xephyr, or force-kill an unverified PID.

Every mutation phase is journaled in `run-state.json`. Signals perform immediate cleanup; after a process/session/power interruption, the next locked invocation first detects unfinished journals, archives only their exact generated paths, restores and hashes the recorded controls, marks the run `RECOVERED`, and only then continues preflight. Recovery is refused while any PZ process exists or if a journal path escapes the strict generated-save/mod roots.

## Renderer choice and benchmark

The normal desktop display is primary because it can use the laptop's real GPU through the signed-in session. Every copied historical Xephyr run reported `OpenGL renderer string: llvmpipe (LLVM 20.1.2, 256 bits)`, so the nested-display path is rejected rather than treated as hardware-isolated execution.

No `LIBGL_ALWAYS_SOFTWARE=1` assignment exists on the normal path; the runner removes an inherited value. Before each live run, `glxinfo -B` is stored in `renderer-glxinfo.txt`. A fallback requires `--allow-software-renderer`; its manifest records `software=true`, and it is unsuitable for timing or graphics conclusions.

The reusable timing benchmark is gate elapsed time plus the dual-bounded Lua scan (80 squares and 2 ms per tick). A real-GPU end-to-end benchmark compares menu-to-player-ready, chunk-stable and scan-complete timing from clean boots. It is deferred until no other PZ task is active; this implementation claims no new live result.

Use the normal graphical session and move PZ to a dedicated workspace with ordinary desktop controls. The harness does not rearrange the session. `showSurvivalGuide=false` and `focusloss=false` are temporary, exactly restored controls. Manual profiles retain manual click/modal gates. An unattended profile may change only `click-to-start` to `action="startup-gate"`; its player-ready check is observation or screenshot only. The Lua streaming clock resets while paused or while the player square is unavailable.

### Unattended startup boundary

An unattended profile must declare `interaction_scope=["startup-gate"]`, a non-T10 criterion list, the exact click gate pattern `game loading took`, the exact observer pattern `\[CF-INSPECT\].*kind=PLAYER_READY`, `max_actions=1`, `action="left-click"`, and a positive post-signature settle time shorter than its at-most-30-second signature freshness budget. `Return`/`space` are rejected: the 2026-09-02 real-desktop replay showed a successful Return XTEST command without any PZ state transition.

The loading signature is now only the start of a bounded readiness check, not proof that PZ accepts input. After the settle interval, the runner focuses the sole mapped title-matching window owned by the launcher process group and captures a fresh focused-window PNG. The visual gate is an exact-dimension mask comparison against the two retained English `Click to Start` labels, not a bright-pixel count: only a 960x1008 client in a 960x1040 decorated frame is supported, the label must correlate with a recorded shape in the exact lower-center region, and generic white rectangles, loading bars, shifted labels and wrong-size frames fail closed. The action remains client `(480,960)`. A changed localisation, font, scaling, decoration or layout requires owner-attended confirmation and a new reviewed signature; weakening the classifier is not an allowed fallback.

After the screenshot and again after pointer warp immediately before XTEST, the runner revalidates launcher PID/start time, window PID/start time, sole-window identity, title, mapped state, client root origin/dimensions, active window, X11 focus, pointer root coordinates and topmost owned frame. It then establishes the exact console device/inode/EOF byte boundary, discards any partial boundary record, records the current observer sequence watermark, and atomically writes `startup-readiness-cursor.json` before the sole click. Only complete records whose first byte is at or after that cursor are eligible. A source `emittedAtMs` older than action completion, a non-increasing sequence, or a duplicate/conflicting post-cursor record fails closed, so unread, partial, replayed, reordered and late-flushed pre-action data cannot confirm delivery.

The generated observer attaches exact run, disposable save, observer-mod ID, random per-run session ID, monotonic event sequence, source timestamp, payload mode/ID/checksum and validated active-mod identity to `PLAYER_READY`. Every field is required and duplicate, missing, malformed or foreign values are rejected. Immediately before confirmation, the runner re-reads the launcher/window PID start identities, process group, exact XID/title/origin, 960x1008 geometry, active window, input focus and `DISPLAY`. Only then is `unattended-startup-input.json` atomically replaced from `PENDING_TRANSITION` with `CONFIRMED`; rejection, timeout or process exit atomically records `NOT_CONFIRMED`. The evidence preserves the cursor and exact record byte range, log observation monotonic/wall times, file mtime, source sequence/timestamp and confirmation identity. XTEST completion alone is never delivery success.

Every unattended bundle writes `criteria-disposition.json` with T10 and CF-V01-E08 as `NOT RUN`. A profile that requests T10/E08, right-click, context menu, inventory/menu, gameplay or acceptance interaction is refused before save, mod or control mutation; the refused run still retains that disposition and a cleanup manifest. There is no retry input budget.

## Operator workflow

From the repository root:

```bash
dev/live-inspection/bin/cf-live-inspect preflight dev/live-inspection/profiles/dead-air-p2-r2.toml --site P2
dev/live-inspection/bin/cf-live-inspect dry-run dev/live-inspection/profiles/dead-air-p2-r2.toml --site P2
dev/live-inspection/bin/cf-live-inspect run dev/live-inspection/profiles/dead-air-p2-r2.toml --site P2
```

Use one site for a clean boot. Multi-site mode requires both profile permission and explicit flags:

```bash
dev/live-inspection/bin/cf-live-inspect run dev/live-inspection/profiles/dead-air-p2-r2.toml --site P2 --site R2
```

Prefer clean boots for map, access and lifecycle conclusions. Multi-site mode is only for questions unaffected by teleport/streaming history. `--non-interactive` fails at manual gates. With a valid unattended profile it can cross only the ordinary startup gate; it never dismisses a modal or performs another interaction.

For the checked-in production example, export machine-local values without editing the profile:

```bash
export PZ_SOURCE_SAVE=/absolute/path/to/Zomboid/Saves/Sandbox/disposable-source
export PZ_USER_ROOT=/absolute/path/to/Zomboid
export PZ_LAUNCHER=/absolute/path/to/projectzomboid.sh
dev/live-inspection/bin/cf-live-inspect run dev/live-inspection/profiles/dead-air-production-unattended.toml --site P2 --non-interactive
```

Recompute a directory candidate checksum with `PYTHONPATH=dev/live-inspection/lib python3 -c 'from pathlib import Path; from live_inspection.payload import tree_checksum; print(tree_checksum(Path("mod")))'`. Commit the candidate first: a dirty worktree is intentionally refused. The checked-in production profile is a bootstrap/player-ready/site-scan smoke only; its empty criterion list deliberately does not claim E09/E12/E13, whose dedicated live matrices remain required.

Timeouts capture the active window (normally the dedicated PZ window) plus gate/attempt/recent-log JSON, avoiding a whole-desktop capture. Retries repeat observation only; they never relaunch or recreate state. A failed assertion cannot satisfy the configured `RUN_COMPLETE status=PASS` gate.

## Evidence bundle

Each unique bundle contains `manifest.json` with status/sites/renderer/cleanup/file hashes, renderer diagnostics, sanitized launcher/console output, filtered structured events, gate/timeout screenshots and sanitized diagnostics, the exact pre-run controls and manifest, criteria disposition, any startup-input evidence, production-payload provenance, and archived disposable save/probe/payload.

Home paths and common credential/header-shaped secrets are redacted from exportable text, and the recovery journal stores generated basenames rather than home paths. Raw console output stays outside Git. `control-before/` and `archive/` are explicitly marked private in the manifest because exact restoration and a disposable save cannot be content-sanitized; never check them in. Review `probe-events.txt` before checking evidence in; physical observations do not decide story suitability.

## Extension rules

Copy the example TOML and keep site facts and expected inputs in profiles. Keep reusable core free of story coordinates and outcomes. Match structured events where possible and native text only at unavoidable lifecycle boundaries.

If an investigation needs more read-only facts, add a profile-controlled capability, retain count/time bounds, wrap engine calls with `pcall`, and add an offline contract test. Criterion-specific profiles declare their criteria and payload without adding absolute source paths to reusable code. Do not add object/container mutation, vanilla-file replacement, automatic T10 interaction, right-click/context-menu/gameplay automation, injected helpers, or security workarounds.

## Offline verification

Offline tests never launch PZ or touch its user root:

```bash
dev/live-inspection/test/run.sh
```

They cover profile validation, real-save marker enforcement, exact control round trips (including absent files), exclusive locking, renderer classification, gate/process diagnostics, PID/start-time/window ownership filtering, focus/window/geometry races, one-shot/stale-signature input bounds, stale log and screenshot rejection, visible startup-control recognition, transition-confirmed delivery, T10/E08 and interaction-scope refusal, production payload validation/install/recovery cleanup, sanitization, Lua/Python parsing, and static rejection of embedded P2/R2 coordinates, Xephyr, forced software mode, right-click automation, and the prohibited helper name in reusable core.

## Deferred live validation

After all other PZ work is complete:

1. Let `preflight` prove no PZ/inspection process exists.
2. Mark only an audited disposable source clone.
3. Run P2 on the normal display and record renderer/gate timing.
4. Verify click/modal gates, player-ready, pause-aware chunk stability, scan completion, screenshots, and normal exit.
5. Verify `PASS`, restored hashes, absent active save/mod, and no remaining PZ process.
6. Repeat from a fresh R2 clean boot; exercise multi-site only as an extra convenience test.
7. Human-review any evidence before updating bindings or checked-in research.
