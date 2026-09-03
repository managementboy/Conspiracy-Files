from __future__ import annotations

import argparse
import atexit
import json
import os
import re
import shutil
import signal
import struct
import subprocess
import sys
import time
import uuid
from dataclasses import asdict, replace
from pathlib import Path

from . import __version__
from .config import load_profile, runtime_game_version_for, unattended_refusal_reason
from .evidence import finalize_manifest, sanitize_line, write_sanitized
from .model import Gate, HarnessError, Profile, Site
from .payload import install_production_payload, tree_checksum
from .safety import ControlTransaction, ExclusiveRunLock, assert_save_safety, matching_pz_processes, parse_renderer, recover_interrupted_runs, sha256
from .state import LogFollower, wait_for_gate
from .unattended import ProcessIdentity, ReadinessIdentity, StartupGateController, confirm_delivery, evidence_dict, fail_delivery

LOCK_PATH = Path("/tmp/conspiracy-files-live-inspection.lock")
PREFIX = "[cf-live-inspection]"
STARTUP_CONTROL_REGION = (420, 982, 541, 1003)
STARTUP_CONTROL_TEMPLATE_ROWS = (
    (
        "0000000000000000000000000000000", "0000000000000000000000000000000",
        "0000000000000000000000000000000", "0000018400600000000000000000000",
        "0003f18e006000000007e0000000000", "0007b180006000c0000ee3000003000",
        "000e0180006000c0000c03000003000", "000c018c3e6181f1f00c07cfc37fc00",
        "000c018c726301c3980e0704e3f7000", "000c018c606600c30c0783006383000",
        "000c018ce07c00c70c03c303e383000", "000c018cc07e00c60c00e30fe303000",
        "000c018ce07600c70c00631c6303000", "000e018c606300c31c0063186303000",
        "0007f18c7e6380f3f81fe3dde303c00", "0003f18c3e61c0f1f00fc3cf2303c00",
        "0000000000000000000000000000000", "0000000000000000000000000000000",
        "0000000000000000000000000000000", "0000000000000000000000000000000",
        "0000000000000000000000000000000",
    ),
    (
        "0000000000000000000000000000000", "0000000000000000000000000000000",
        "0000000000000000000000000000000", "0000008400200000000000000000000",
        "0003f18c006000000007e0000000000", "00073180006000c0000e43000003000",
        "000e0180006000c0000c03000003000", "000c018c3e6181f1f00c07c7c377c00",
        "000c018c726301c3980e070063e7000", "000c018c606600c30c0783006383000",
        "000c018c407c00c20c01c300e303000", "000c018cc07c00c60c00e30fe303000",
        "000c018c407600c20c00630c6303000", "000e018c606300c30c0063186303000",
        "0007f18c766380e3b81fc38ce303800", "0003f18c3e618071f00f81cf2301c00",
        "0000000000000000000000000000000", "0000000000000000000000000000000",
        "0000000000000000000000000000000", "0000000000000000000000000000000",
        "0000000000000000000000000000000",
    ),
)


def log(message: str) -> None:
    print(f"{PREFIX} {message}", flush=True)


def run_command(command: list[str], *, env: dict[str, str] | None = None, timeout: int = 20) -> subprocess.CompletedProcess[str]:
    try:
        return subprocess.run(command, text=True, capture_output=True, timeout=timeout, env=env, check=False)
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise HarnessError(f"command failed: {command[0]}: {exc}") from exc


def renderer_diagnostics(allow_software: bool) -> tuple[dict, str]:
    display = os.environ.get("DISPLAY")
    if not display:
        raise HarnessError("DISPLAY is unset; use the normal signed-in graphical session")
    result = run_command(["glxinfo", "-B"])
    if result.returncode:
        raise HarnessError(f"glxinfo failed on DISPLAY={display}: {result.stderr.strip()}")
    renderer = parse_renderer(result.stdout)
    if renderer["software"] and not allow_software:
        raise HarnessError(
            f"software renderer selected ({renderer.get('renderer', '<unknown>')}); "
            "normal runs require hardware OpenGL. Use --allow-software-renderer only for a documented fallback run."
        )
    return renderer, result.stdout


def check_dependencies(profile: Profile, live: bool) -> list[str]:
    names = ["glxinfo", "lua5.1"]
    if live:
        names.append(str(profile.launcher))
    if profile.unattended_startup.enabled:
        names.append("gnome-screenshot")
    missing = [name for name in names if not (Path(name).is_file() if "/" in name else shutil.which(name))]
    if missing:
        raise HarnessError("missing dependency/dependencies: " + ", ".join(missing))
    if profile.unattended_startup.enabled:
        try:
            import Xlib  # noqa: F401
            from Xlib.ext import xtest  # noqa: F401
            from PIL import Image  # noqa: F401
        except ImportError as exc:
            raise HarnessError("missing dependency: python-xlib/XTEST and Pillow are required for unattended startup") from exc
        names.extend(["python-xlib/XTEST", "Pillow"])
    return names


def select_sites(profile: Profile, requested: list[str]) -> tuple[Site, ...]:
    by_id = {site.site_id: site for site in profile.sites}
    unknown = sorted(set(requested) - by_id.keys())
    if unknown:
        raise HarnessError("unknown site(s): " + ", ".join(unknown))
    selected = tuple(by_id[name] for name in requested) if requested else profile.sites[:1]
    if len(selected) > 1 and not profile.allow_multi_site:
        raise HarnessError("profile prohibits multi-site boot; run each site with a clean disposable save")
    return selected


def lua_string(value: str) -> str:
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n") + '"'


def render_lua_profile(profile: Profile, sites: tuple[Site, ...], identity: ReadinessIdentity) -> str:
    expected = ", ".join(lua_string(value) for value in identity.active_mod_ids)
    lines = [
        "return {",
        f"  runId = {lua_string(identity.run_id)},",
        f"  saveName = {lua_string(identity.save_name)},",
        f"  observerId = {lua_string(identity.observer_id)},",
        f"  sessionId = {lua_string(identity.session_id)},",
        f"  payloadMode = {lua_string(identity.payload_mode)},",
        f"  payloadId = {lua_string(identity.payload_id)},",
        f"  payloadChecksum = {lua_string(identity.payload_checksum)},",
        f"  expectedGameVersion = {lua_string(identity.expected_game_version)},",
        f"  activeModIds = {{ {expected} }},",
        "  sites = {",
    ]
    for site in sites:
        x1, y1, x2, y2 = site.bounds
        point = site.entry_point or ((x1 + x2) / 2, (y1 + y2) / 2, float(site.levels[0]))
        rooms = ", ".join(lua_string(value) for value in site.preferred_rooms)
        levels = ", ".join(str(value) for value in site.levels)
        lines.extend([
            "    {",
            f"      id = {lua_string(site.site_id)}, role = {lua_string(site.role)},",
            f"      x = {x1}, y = {y1}, x2 = {x2}, y2 = {y2},",
            f"      entry = {{ x = {point[0]}, y = {point[1]}, z = {point[2]} }},",
            f"      preferredRooms = {{ {rooms} }}, levels = {{ {levels} }},",
            "    },",
        ])
    lines.extend(["  },", "  limits = { streamStableTicks = 120, maxSquaresPerTick = 80, maxTickMillis = 2, exitDelayTicks = 180 },", "}", ""])
    return "\n".join(lines)


def mod_list(*mod_ids: str) -> str:
    entries = "\n".join(f"    mod = {mod_id}," for mod_id in mod_ids)
    return f"VERSION = 1,\n\nmods\n{{\n{entries}\n}}\n\nmaps\n{{\n}}\n"


def replace_option(path: Path, key: str, value: str) -> None:
    text = path.read_text(encoding="utf-8") if path.exists() else ""
    pattern = re.compile(rf"(?m)^{re.escape(key)}=.*$")
    updated, count = pattern.subn(f"{key}={value}", text)
    if not count:
        updated += ("" if updated.endswith("\n") or not updated else "\n") + f"{key}={value}\n"
    temporary = path.with_name(f".{path.name}.cf-inspection")
    temporary.write_text(updated, encoding="utf-8")
    os.replace(temporary, path)


def startup_gate_visual_evidence(
    path: Path,
    *,
    screenshot_size: tuple[int, int],
    client_size: tuple[int, int],
) -> dict[str, object]:
    from PIL import Image

    width, height = screenshot_size
    client_width, client_height = client_size
    if (client_width, client_height) != (960, 1008) or (width, height) != (960, 1040):
        raise HarnessError(
            "startup visual signature is supported only for the recorded 960x1008 client/960x1040 frame"
        )
    try:
        with Image.open(path) as source:
            image = source.convert("RGB")
        if image.size != screenshot_size:
            raise HarnessError("startup screenshot pixels do not match the recorded frame dimensions")
        crop = image.crop(STARTUP_CONTROL_REGION)
    except (OSError, ValueError) as exc:
        raise HarnessError(f"cannot inspect startup readiness screenshot: {exc}") from exc
    region_width = STARTUP_CONTROL_REGION[2] - STARTUP_CONTROL_REGION[0]
    candidate = {
        (index % region_width, index // region_width)
        for index, pixel in enumerate(crop.getdata())
        if min(pixel) >= 140 and max(pixel) - min(pixel) <= 45
    }

    def template_points(rows: tuple[str, ...]) -> set[tuple[int, int]]:
        points: set[tuple[int, int]] = set()
        for y, row in enumerate(rows):
            bits = int(row, 16)
            for x in range(region_width):
                if bits & (1 << (region_width - 1 - x)):
                    points.add((x, y))
        return points

    best_score, best_template, best_shift = 0.0, None, None
    for template_index, rows in enumerate(STARTUP_CONTROL_TEMPLATE_ROWS, 1):
        template = template_points(rows)
        for delta_y in range(-1, 2):
            for delta_x in range(-1, 2):
                shifted = {(x + delta_x, y + delta_y) for x, y in template}
                denominator = len(candidate) + len(shifted)
                score = (2 * len(candidate & shifted) / denominator) if denominator else 0.0
                if score > best_score:
                    best_score, best_template, best_shift = score, template_index, [delta_x, delta_y]
    minimum_score = 0.78
    count_ok = 250 <= len(candidate) <= 650
    visible = count_ok and best_score >= minimum_score
    return {
        "status": "VISIBLE" if visible else "NOT_VISIBLE",
        "classifier": "recorded-click-to-start-mask-v1",
        "region": list(STARTUP_CONTROL_REGION),
        "foreground_pixels": len(candidate),
        "foreground_range": [250, 650],
        "template_dice": round(best_score, 6),
        "minimum_template_dice": minimum_score,
        "matched_template": best_template,
        "matched_shift": best_shift,
    }


def capture_screen(
    destination: Path,
    *,
    required: bool = False,
    startup_client_size: tuple[int, int] | None = None,
) -> dict[str, object]:
    def failure(message: str) -> dict[str, object]:
        if required:
            raise HarnessError(message)
        log(message)
        return {"status": "UNAVAILABLE", "reason": message, "path": destination.name}

    if destination.exists():
        return failure(f"refusing stale screenshot destination: {destination.name}")
    tool = shutil.which("gnome-screenshot")
    if not tool:
        return failure(f"screenshot skipped (gnome-screenshot unavailable): {destination.name}")
    started_wall_ns = time.time_ns()
    result = run_command([tool, "-w", "-f", str(destination)], timeout=20)
    if result.returncode:
        return failure(f"screenshot failed: {result.stderr.strip()}")
    if not destination.is_file() or destination.stat().st_size == 0:
        return failure(f"screenshot command returned success without fresh evidence: {destination.name}")
    stat = destination.stat()
    if stat.st_mtime_ns + 1_000_000_000 < started_wall_ns:
        return failure(f"screenshot command returned stale evidence: {destination.name}")
    header = destination.read_bytes()[:24]
    if len(header) != 24 or header[:8] != b"\x89PNG\r\n\x1a\n" or header[12:16] != b"IHDR":
        return failure(f"screenshot is not a valid PNG: {destination.name}")
    width, height = struct.unpack(">II", header[16:24])
    evidence: dict[str, object] = {
        "status": "FRESH",
        "path": f"screenshots/{destination.name}",
        "sha256": sha256(destination),
        "bytes": stat.st_size,
        "mtime_ns": stat.st_mtime_ns,
        "width": width,
        "height": height,
    }
    if startup_client_size is not None:
        try:
            visual = startup_gate_visual_evidence(
                destination, screenshot_size=(width, height), client_size=startup_client_size
            )
        except HarnessError as exc:
            return failure(str(exc))
        evidence["startup_gate_visual"] = visual
        if visual["status"] != "VISIBLE":
            return failure("post-signature screenshot does not show the bounded lower-center startup control")
    return evidence


class LiveRun:
    def __init__(self, profile: Profile, sites: tuple[Site, ...], allow_software: bool, non_interactive: bool):
        self.profile, self.sites = profile, sites
        self.allow_software, self.non_interactive = allow_software, non_interactive
        self.run_token = time.strftime("%Y%m%d-%H%M%S") + "-" + uuid.uuid4().hex[:8]
        self.save_name = f"CF_INSPECT_{profile.profile_id}_{self.run_token}"
        self.mod_id = f"CF_LiveInspection_{self.run_token.replace('-', '_')}"
        self.bundle = profile.evidence_root / self.run_token
        self.destination_save = profile.pz_user_root / "Saves" / "Sandbox" / self.save_name
        self.installed_mod = profile.pz_user_root / "mods" / self.mod_id
        self.installed_payload = profile.pz_user_root / "mods" / f"CF_Payload_{self.run_token.replace('-', '_')}"
        self.installed_payload_staging = self.installed_payload.with_name(self.installed_payload.name + ".staging")
        self.controls: ControlTransaction | None = None
        self.process: subprocess.Popen | None = None
        self.launcher_stdout = None
        self.launcher_stderr = None
        self.launcher_identity: ProcessIdentity | None = None
        self.status = "INITIALIZING"
        self.cleanup_done = False
        self.renderer: dict = {}
        self.bundle_created = False
        self.startup_controller = StartupGateController(profile.unattended_startup)
        self.startup_evidence = None
        probe_root = Path(__file__).resolve().parents[2] / "probe"
        active_ids = (
            (profile.payload.expected_mod_id, self.mod_id)
            if profile.payload.mode == "production"
            else (self.mod_id,)
        )
        if any(value is None for value in active_ids):
            raise HarnessError("production payload identity is incomplete")
        self.readiness_identity = ReadinessIdentity(
            run_id=self.save_name,
            save_name=self.save_name,
            observer_id=self.mod_id,
            session_id=uuid.uuid4().hex,
            payload_mode=profile.payload.mode,
            payload_id=profile.payload.expected_mod_id or self.mod_id,
            payload_checksum=profile.payload.expected_sha256 or tree_checksum(probe_root),
            active_mod_ids=tuple(str(value) for value in active_ids),
            expected_game_version=runtime_game_version_for(profile.unattended_startup.supported_game_version),
            installed_game_version=profile.unattended_startup.supported_game_version,
        )

    def _launcher_process_identity(self) -> ProcessIdentity | None:
        if not self.process or self.process.poll() is not None:
            return None
        try:
            identity = StartupGateController._read_process_identity(self.process.pid)
        except HarnessError:
            return None
        if identity.process_group_id != self.process.pid:
            return None
        if self.launcher_identity is not None and identity != self.launcher_identity:
            return None
        return identity

    @staticmethod
    def _write_json_atomic(path: Path, value: dict[str, object]) -> None:
        staging = path.with_name(f".{path.name}.staging")
        with staging.open("w", encoding="utf-8") as stream:
            stream.write(json.dumps(value, indent=2, sort_keys=True) + "\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(staging, path)
        directory_fd = os.open(path.parent, os.O_RDONLY | os.O_DIRECTORY)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)

    def write_startup_evidence(self) -> None:
        if self.startup_evidence is None:
            return
        self._append_startup_readiness_journal()
        self._write_json_atomic(
            self.bundle / "unattended-startup-input.json",
            evidence_dict(self.startup_evidence),
        )

    def _append_startup_readiness_journal(self) -> None:
        """Fsync new immutable entries before replacing the summary state."""
        entries = list(self.startup_evidence.readiness_evidence_journal)
        path = self.bundle / "startup-readiness-evidence.jsonl"
        existing: list[dict[str, object]] = []
        if path.exists():
            raw_lines = path.read_bytes().splitlines(keepends=True)
            if any(not line.endswith(b"\n") for line in raw_lines):
                raise HarnessError("startup readiness journal has an incomplete trailing record")
            try:
                existing = [json.loads(line.decode("utf-8")) for line in raw_lines]
            except (UnicodeDecodeError, json.JSONDecodeError) as exc:
                raise HarnessError("startup readiness journal is malformed") from exc
        if len(entries) < len(existing):
            if entries != existing[:len(entries)]:
                raise HarnessError("startup readiness journal append-only prefix changed")
            # Crash recovery: the append-only journal is authoritative when it
            # is ahead of an older or independently reconstructed summary.
            self.startup_evidence = replace(
                self.startup_evidence,
                readiness_evidence_journal=tuple(existing),
            )
            entries = existing
        elif existing != entries[:len(existing)]:
            raise HarnessError("startup readiness journal append-only prefix changed")
        if len(existing) == len(entries):
            return
        with path.open("ab") as stream:
            for entry in entries[len(existing):]:
                stream.write(
                    (json.dumps(entry, separators=(",", ":"), sort_keys=True) + "\n").encode(
                        "utf-8"
                    )
                )
            stream.flush()
            os.fsync(stream.fileno())
        directory_fd = os.open(path.parent, os.O_RDONLY | os.O_DIRECTORY)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)

    def persist_pre_action_cursor(self, follower: LogFollower):
        cursor = follower.checkpoint()
        sequences: list[int] = []
        with follower.path.open("rb") as stream:
            stat = os.fstat(stream.fileno())
            if (stat.st_dev, stat.st_ino) != (cursor.log_device, cursor.log_inode) \
                    or stat.st_size < cursor.offset:
                raise HarnessError("console identity changed while persisting the pre-action cursor")
            raw_prefix = stream.read(cursor.offset)
            if len(raw_prefix) != cursor.offset:
                raise HarnessError("console became incomplete while persisting the pre-action cursor")
            prefix = raw_prefix.decode("utf-8", "replace")
        marker = "[CF-INSPECT]|EVENT|"
        for line in prefix.splitlines():
            position = line.find(marker)
            if position < 0:
                continue
            fields: dict[str, str] = {}
            malformed = False
            for part in line[position:].split("|")[2:]:
                if "=" not in part:
                    malformed = True
                    break
                key, value = part.split("=", 1)
                if not key or key in fields:
                    malformed = True
                    break
                fields[key] = value
            if fields.get("run") != self.readiness_identity.run_id:
                continue
            if malformed or fields.get("observer") != self.readiness_identity.observer_id \
                    or fields.get("session") != self.readiness_identity.session_id:
                raise HarnessError("current-run observer identity is malformed before startup input")
            sequence = fields.get("sequence", "")
            if not sequence.isdigit() or str(int(sequence)) != sequence or int(sequence) < 1:
                raise HarnessError("current-run observer sequence is malformed before startup input")
            sequences.append(int(sequence))
        if sequences != sorted(set(sequences)):
            raise HarnessError("current-run observer records are reordered or duplicated before startup input")
        cursor = replace(cursor, observer_sequence_watermark=max(sequences, default=0))
        self._write_json_atomic(
            self.bundle / "startup-readiness-cursor.json",
            {
                "status": "PRE_ACTION_CURSOR_ESTABLISHED",
                "cursor": asdict(cursor),
                "readiness_identity": asdict(self.readiness_identity),
            },
        )
        return cursor

    def write_state(self, status: str) -> None:
        self.bundle.mkdir(parents=True, exist_ok=True)
        (self.bundle / "run-state.json").write_text(json.dumps({
            "status": status, "run_token": self.run_token,
            "save_name": self.destination_save.name, "mod_name": self.installed_mod.name,
            "payload_name": self.installed_payload.name if self.profile.payload.mode == "production" else None,
            "payload_staging_name": self.installed_payload_staging.name if self.profile.payload.mode == "production" else None,
        }, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    def cleanup(self) -> None:
        if self.cleanup_done:
            return
        self.cleanup_done = True
        if not self.bundle_created:
            return
        errors = []
        termination: dict[str, object] = {
            "status": "NOT_STARTED",
            "launcher_identity": None,
            "sigterm_sent": False,
            "sigkill_sent": False,
        }
        if self.process:
            identity = self._launcher_process_identity()
            if identity is None:
                errors.append("launcher process could not be revalidated for cleanup; refusing to signal")
                termination["status"] = "UNVERIFIED"
            else:
                termination["status"] = "TERM_SENT"
                termination["launcher_identity"] = asdict(identity)
                try:
                    os.killpg(identity.process_group_id, signal.SIGTERM)
                    termination["sigterm_sent"] = True
                except ProcessLookupError:
                    termination["status"] = "ALREADY_EXITED"
                deadline = time.monotonic() + 20
                while time.monotonic() < deadline:
                    if self._launcher_process_identity() is None:
                        termination["status"] = "TERMINATED"
                        break
                    time.sleep(0.25)
                else:
                    refreshed = self._launcher_process_identity()
                    if refreshed is not None:
                        try:
                            os.killpg(refreshed.process_group_id, signal.SIGKILL)
                            termination["sigkill_sent"] = True
                            termination["status"] = "ESCALATED"
                            termination["launcher_identity"] = asdict(refreshed)
                        except ProcessLookupError:
                            termination["status"] = "ALREADY_EXITED"
                        errors.append("verified owned process group required SIGKILL after cleanup timeout")
                    else:
                        termination["status"] = "TERMINATED"
        for stream in (self.launcher_stdout, self.launcher_stderr):
            if stream:
                stream.close()
        archive = self.bundle / "archive"
        archive.mkdir(parents=True, exist_ok=True)
        for source, name in ((self.destination_save, "save"), (self.installed_mod, "probe-mod"), (self.installed_payload, "production-payload"), (self.installed_payload_staging, "production-payload-staging")):
            if source.exists():
                try:
                    shutil.move(str(source), archive / name)
                except OSError as exc:
                    errors.append(f"could not archive {source}: {exc}")
        if self.controls:
            try:
                self.controls.restore_exact()
            except Exception as exc:
                errors.append(str(exc))
        console = self.profile.pz_user_root / "console.txt"
        if console.is_file():
            write_sanitized(console, self.bundle / "console-sanitized.txt")
            write_sanitized(console, self.bundle / "probe-events.txt", rf"\[CF-INSPECT\].*run={re.escape(self.save_name)}")
        for name in ("launcher.stdout", "launcher.stderr"):
            raw = self.bundle / name
            if raw.is_file():
                write_sanitized(raw, self.bundle / f"{name}-sanitized.txt")
                raw.unlink()
        remaining = matching_pz_processes()
        if remaining:
            errors.append("Project Zomboid/inspection process remains: " + ", ".join(str(pid) for pid, _ in remaining))
        termination["remaining_processes"] = [pid for pid, _ in remaining]
        termination["errors"] = errors[:]
        termination["status"] = "CLEAN" if not errors else "CLEANUP_FAILED"
        self._write_json_atomic(self.bundle / "launcher-shutdown.json", termination)
        metadata = {"status": self.status if not errors else "CLEANUP_FAILED", "run_token": self.run_token, "profile": self.profile.profile_id, "probe": self.profile.probe_id, "sites": [s.site_id for s in self.sites], "renderer": self.renderer, "cleanup_errors": errors, "private_directories": ["archive", "control-before"]}
        self.write_state("CLEAN" if not errors else "CLEANUP_FAILED")
        finalize_manifest(self.bundle, metadata)
        if errors:
            log("cleanup warnings: " + "; ".join(errors))
        else:
            log(f"cleanup and exact control restoration complete; bundle={self.bundle}")

    def prepare(self) -> None:
        self.bundle.mkdir(parents=True, exist_ok=False)
        self.bundle_created = True
        (self.bundle / "screenshots").mkdir()
        self.write_state("PREPARING")
        if self.profile.unattended_startup.enabled:
            (self.bundle / "criteria-disposition.json").write_text(json.dumps({
                "T10": "NOT RUN", "CF-V01-E08": "NOT RUN",
                "reason": "P4-R44 manual-only governance; unattended authority is startup-gate only",
                "requested": list(self.profile.criteria),
            }, indent=2, sort_keys=True) + "\n", encoding="utf-8")
            refusal = unattended_refusal_reason(self.profile)
            if refusal:
                raise HarnessError(refusal)
        self.renderer, glx = renderer_diagnostics(self.allow_software)
        (self.bundle / "renderer-glxinfo.txt").write_text(glx, encoding="utf-8")
        assert_save_safety(self.profile)
        processes = matching_pz_processes()
        if processes:
            details = "; ".join(f"pid={pid} {cmd}" for pid, cmd in processes)
            raise HarnessError("refusing to race an existing Project Zomboid/inspection process: " + details)
        if self.destination_save.exists() or self.installed_mod.exists() or self.installed_payload.exists():
            raise HarnessError("generated disposable save/mod path unexpectedly exists")
        self.controls = ControlTransaction(self.profile.pz_user_root, self.profile.controls, self.bundle / "control-before")
        self.controls.backup_exact()
        self.write_state("CONTROLS_BACKED_UP")
        shutil.copytree(self.profile.source_save, self.destination_save, symlinks=False)
        (self.destination_save / ".cf-live-inspection-run.json").write_text(json.dumps({"run_token": self.run_token, "source": self.profile.source_save.name}) + "\n", encoding="utf-8")
        probe_root = Path(__file__).resolve().parents[2] / "probe"
        shutil.copytree(probe_root, self.installed_mod)
        mod_info = self.installed_mod / "42" / "mod.info"
        text = mod_info.read_text(encoding="utf-8").replace("__MOD_ID__", self.mod_id)
        mod_info.write_text(text, encoding="utf-8")
        generated = self.installed_mod / "common" / "media" / "lua" / "client" / "CFInspectionProfile.lua"
        active_ids = [self.mod_id]
        payload_evidence = None
        if self.profile.payload.mode == "production":
            payload_evidence = install_production_payload(self.profile.payload, self.installed_payload)
            active_ids.insert(0, payload_evidence.mod_id)
            (self.bundle / "production-payload.json").write_text(json.dumps(payload_evidence.__dict__, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        if tuple(active_ids) != self.readiness_identity.active_mod_ids:
            raise HarnessError("installed active-mod identity drifted from the readiness contract")
        if payload_evidence is not None and (
            payload_evidence.mod_id != self.readiness_identity.payload_id
            or payload_evidence.checksum != self.readiness_identity.payload_checksum
        ):
            raise HarnessError("installed production payload drifted from the readiness contract")
        generated.write_text(
            render_lua_profile(self.profile, self.sites, self.readiness_identity),
            encoding="utf-8",
        )
        active_mods = mod_list(*active_ids)
        (self.destination_save / "mods.txt").write_text(active_mods, encoding="utf-8")
        (self.profile.pz_user_root / "mods" / "default.txt").write_text(active_mods, encoding="utf-8")
        (self.profile.pz_user_root / "latestSave.ini").write_text(f"{self.save_name}\nSandbox\n", encoding="utf-8")
        replace_option(self.profile.pz_user_root / "options.ini", "showSurvivalGuide", "false")
        replace_option(self.profile.pz_user_root / "options.ini", "focusloss", "false")
        self.write_state("MUTATED")

    def execute(self) -> None:
        self.prepare()
        self.status = "RUNNING"
        self.launcher_stdout = (self.bundle / "launcher.stdout").open("w", encoding="utf-8")
        self.launcher_stderr = (self.bundle / "launcher.stderr").open("w", encoding="utf-8")
        env = dict(os.environ)
        env.pop("LIBGL_ALWAYS_SOFTWARE", None)
        console = self.profile.pz_user_root / "console.txt"
        follower = LogFollower(console, start_at_end=True)
        self.process = subprocess.Popen([str(self.profile.launcher), "-debug", "-nosteam"], cwd=self.profile.launcher.parent, env=env, stdout=self.launcher_stdout, stderr=self.launcher_stderr, start_new_session=True)
        self.launcher_identity = self._launcher_process_identity()

        def alive() -> bool:
            return self.process is not None and self.process.poll() is None

        def timeout(gate: Gate, attempt: int, recent: list[str]) -> None:
            capture_screen(self.bundle / "screenshots" / f"timeout-{gate.name}-{attempt}.png")
            sanitized = [sanitize_line(line) for line in recent[-80:]]
            (self.bundle / f"timeout-{gate.name}-{attempt}.json").write_text(json.dumps({"gate": gate.name, "attempt": attempt, "recent": sanitized}, indent=2) + "\n", encoding="utf-8")

        for gate in self.profile.gates:
            repetitions = len(self.sites) if gate.name == "scan-completion" else 1
            for occurrence in range(1, repetitions + 1):
                not_before = None
                cursor = None
                if gate.name == "player-ready-modal-check" and self.startup_evidence is not None:
                    not_before = self.startup_evidence.action_completed_monotonic
                    cursor = self.startup_evidence.pre_action_cursor
                match_validator = None
                on_rejected_match = None
                if gate.name == "player-ready-modal-check" and self.startup_evidence is not None:
                    def match_validator(result):
                        # Validate without publishing CONFIRMED. wait_for_gate()
                        # first drains and classifies every adjacent readiness
                        # record, then the block below commits the sole valid
                        # candidate after the one-shot policy is satisfied.
                        confirm_delivery(
                            self.startup_evidence,
                            transition=result,
                            identity_revalidator=(
                                self.startup_controller.revalidate_delivery_identity
                            ),
                        )

                    def on_rejected_match(result, error):
                        self.startup_evidence = fail_delivery(
                            self.startup_evidence,
                            reason=error,
                            transition=result,
                        )
                        self.write_startup_evidence()
                try:
                    result = wait_for_gate(
                        gate,
                        follower,
                        alive,
                        timeout,
                        not_before=not_before,
                        cursor=cursor,
                        match_validator=match_validator,
                        on_rejected_match=on_rejected_match,
                    )
                except HarnessError as exc:
                    if gate.name == "player-ready-modal-check" and self.startup_evidence is not None:
                        self.startup_evidence = fail_delivery(
                            self.startup_evidence,
                            reason=f"expected fresh run-scoped PLAYER_READY transition did not occur: {exc}",
                        )
                        self.write_startup_evidence()
                        raise HarnessError(
                            "startup XTEST command completed but delivery was not confirmed by PLAYER_READY"
                        ) from exc
                    raise
                suffix = f"-{occurrence}" if repetitions > 1 else ""
                if gate.name == "player-ready-modal-check" and self.startup_evidence is not None:
                    if self.startup_evidence.delivery_status != "CONFIRMED":
                        try:
                            self.startup_evidence = confirm_delivery(
                                self.startup_evidence,
                                transition=result,
                                identity_revalidator=(
                                    self.startup_controller.revalidate_delivery_identity
                                ),
                            )
                        except HarnessError as exc:
                            self.startup_evidence = fail_delivery(
                                self.startup_evidence, reason=exc, transition=result
                            )
                            self.write_startup_evidence()
                            raise
                        self.write_startup_evidence()
                    log("ordinary startup action delivery confirmed by fresh run-scoped PLAYER_READY")
                log(f"gate {gate.name}{suffix} passed in {result.elapsed_seconds:.1f}s (attempt {result.attempt})")
                if gate.action == "screenshot":
                    capture_screen(self.bundle / "screenshots" / f"gate-{gate.name}{suffix}.png")
                elif gate.action == "manual":
                    capture_screen(self.bundle / "screenshots" / f"manual-{gate.name}{suffix}.png")
                    if self.non_interactive or not sys.stdin.isatty():
                        raise HarnessError(f"gate {gate.name} requires bounded manual operator input")
                    input(f"{PREFIX} Complete the visible {gate.name} action, then press Enter: ")
                elif gate.action == "startup-gate":
                    if gate.name != "click-to-start" or not self.process:
                        raise HarnessError("startup-gate action is valid only for the owned click-to-start gate")
                    evidence = self.startup_controller.activate(
                        launcher_pid=self.process.pid,
                        signature=result.matched_line,
                        signature_seen_at=result.matched_at,
                        readiness_capture=lambda width, height: capture_screen(
                            self.bundle / "screenshots" / "startup-gate-ready.png",
                            required=True,
                            startup_client_size=(width, height),
                        ),
                        readiness_identity=self.readiness_identity,
                        pre_action_checkpoint=lambda: self.persist_pre_action_cursor(follower),
                    )
                    self.startup_evidence = evidence
                    self.write_startup_evidence()
                    log("ordinary startup XTEST action emitted; delivery awaits PLAYER_READY evidence")
        if not self.process:
            raise HarnessError("launcher ownership lost")
        try:
            code = self.process.wait(timeout=self.profile.time_budgets.get("normal_exit_seconds", 45))
        except subprocess.TimeoutExpired as exc:
            raise HarnessError("probe requested normal exit but Project Zomboid did not close in budget") from exc
        if code != 0:
            raise HarnessError(f"owned launcher exited with status {code}")
        self.status = "PASS"


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Safe Project Zomboid live-inspection harness")
    parser.add_argument("--version", action="version", version=__version__)
    sub = parser.add_subparsers(dest="command", required=True)
    for name in ("preflight", "dry-run", "run"):
        item = sub.add_parser(name)
        item.add_argument("profile", type=Path)
        item.add_argument("--site", action="append", default=[])
        item.add_argument("--allow-software-renderer", action="store_true")
        if name == "run":
            item.add_argument("--non-interactive", action="store_true")
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    try:
        profile = load_profile(args.profile)
        sites = select_sites(profile, args.site)
        check_dependencies(profile, live=args.command == "run")
        if args.command != "run":
            refusal = unattended_refusal_reason(profile)
            if refusal:
                raise HarnessError(refusal)
        with ExclusiveRunLock(LOCK_PATH):
            processes = matching_pz_processes()
            if processes:
                raise HarnessError("Project Zomboid or another inspection launcher is already running: " + ", ".join(str(pid) for pid, _ in processes))
            recovered = recover_interrupted_runs(profile.pz_user_root, profile.evidence_root)
            for bundle in recovered:
                log(f"recovered interrupted run before continuing: {bundle}")
            renderer, _ = renderer_diagnostics(args.allow_software_renderer)
            if args.command == "preflight":
                assert_save_safety(profile)
                log(f"preflight PASS; renderer={renderer.get('renderer')}; sites={','.join(s.site_id for s in sites)}")
                return 0
            if args.command == "dry-run":
                assert_save_safety(profile)
                plan = {"profile": profile.profile_id, "source_save": str(profile.source_save), "site_ids": [s.site_id for s in sites], "renderer": renderer, "mutations": ["create unique CF_INSPECT_* save", "install unique temporary probe mod", "backup/hash then temporarily update protected controls", "archive disposable paths and restore exact controls"]}
                print(json.dumps(plan, indent=2))
                return 0
            run = LiveRun(profile, sites, args.allow_software_renderer, args.non_interactive)
            atexit.register(run.cleanup)
            previous = {}
            for signum in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
                previous[signum] = signal.getsignal(signum)
                signal.signal(signum, lambda received, _frame: (_ for _ in ()).throw(HarnessError(f"interrupted by signal {received}")))
            try:
                run.execute()
            finally:
                run.cleanup()
                atexit.unregister(run.cleanup)
            return 0 if run.status == "PASS" else 1
    except HarnessError as exc:
        print(f"{PREFIX} ERROR: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
