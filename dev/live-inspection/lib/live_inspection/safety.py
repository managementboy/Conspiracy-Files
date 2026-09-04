from __future__ import annotations

import fcntl
import hashlib
import json
import os
import shutil
import tempfile
from dataclasses import dataclass
from pathlib import Path, PurePosixPath

from .model import HarnessError, Profile

SOFTWARE_RENDERERS = ("llvmpipe", "softpipe", "swrast", "software rasterizer")
PZ_PROCESS_MARKERS = ("ProjectZomboid64", "projectzomboid.sh", "zombie.gameStates.MainScreen")
CONTROL_ALLOWLIST = {"latestSave.ini", "mods/default.txt", "options.ini", "debuglog.ini"}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def atomic_copy(source: Path, destination: Path) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=f".{destination.name}.", dir=destination.parent)
    os.close(fd)
    temporary_path = Path(temporary)
    try:
        shutil.copyfile(source, temporary_path)
        shutil.copymode(source, temporary_path)
        os.replace(temporary_path, destination)
    finally:
        temporary_path.unlink(missing_ok=True)


class ExclusiveRunLock:
    def __init__(self, path: Path):
        self.path = path
        self.stream = None

    def __enter__(self):
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.stream = self.path.open("a+", encoding="utf-8")
        try:
            fcntl.flock(self.stream.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            self.stream.close()
            self.stream = None
            raise HarnessError(f"another live inspection owns lock {self.path}") from exc
        self.stream.seek(0)
        self.stream.truncate()
        json.dump({"pid": os.getpid()}, self.stream)
        self.stream.flush()
        return self

    def __exit__(self, *_):
        if self.stream:
            fcntl.flock(self.stream.fileno(), fcntl.LOCK_UN)
            self.stream.close()


def matching_pz_processes(proc_root: Path = Path("/proc"), own_pid: int | None = None) -> list[tuple[int, str]]:
    own_pid = own_pid or os.getpid()
    matches = []
    for entry in proc_root.iterdir():
        if not entry.name.isdigit() or int(entry.name) == own_pid:
            continue
        try:
            command = (entry / "cmdline").read_bytes().replace(b"\0", b" ").decode("utf-8", "replace")
        except (OSError, PermissionError):
            continue
        if any(marker.lower() in command.lower() for marker in PZ_PROCESS_MARKERS):
            matches.append((int(entry.name), command.strip()))
    return sorted(matches)


def assert_save_safety(profile: Profile) -> None:
    save_root = (profile.pz_user_root / "Saves" / "Sandbox").resolve()
    source = profile.source_save.resolve()
    if source.parent != save_root:
        raise HarnessError(f"source save must be an immediate child of {save_root}")
    if not source.is_dir():
        raise HarnessError(f"source save does not exist: {source}")
    marker = source / profile.source_marker
    if not marker.is_file():
        raise HarnessError(f"source save lacks disposable marker {marker}")
    if source.name.startswith("CF_INSPECT_"):
        raise HarnessError("an inspection output cannot be used as a source save")


@dataclass
class ControlRecord:
    relative: str
    existed: bool
    digest: str | None


class ControlTransaction:
    def __init__(self, root: Path, names: tuple[str, ...], backup: Path):
        self.root, self.names, self.backup = root, names, backup
        self.records: list[ControlRecord] = []
        self.active = False

    def backup_exact(self) -> list[ControlRecord]:
        self.backup.mkdir(parents=True, exist_ok=False)
        for relative in self.names:
            source = self.root / relative
            existed = source.is_file()
            digest = sha256(source) if existed else None
            self.records.append(ControlRecord(relative, existed, digest))
            if existed:
                target = self.backup / relative
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source, target)
        (self.backup / "manifest.json").write_text(
            json.dumps([record.__dict__ for record in self.records], indent=2) + "\n", encoding="utf-8"
        )
        self.active = True
        return self.records

    def restore_exact(self) -> None:
        if not self.active:
            return
        failures = []
        for record in self.records:
            destination = self.root / record.relative
            if record.existed:
                atomic_copy(self.backup / record.relative, destination)
                if sha256(destination) != record.digest:
                    failures.append(record.relative)
            else:
                destination.unlink(missing_ok=True)
        self.active = False
        if failures:
            raise HarnessError("control restoration hash mismatch: " + ", ".join(failures))


def recover_interrupted_runs(pz_root: Path, evidence_root: Path) -> list[Path]:
    """Recover journaled mutations left by a terminated runner, with no PZ process present."""
    recovered = []
    if not evidence_root.is_dir():
        return recovered
    save_root = (pz_root / "Saves" / "Sandbox").resolve()
    mod_root = (pz_root / "mods").resolve()
    for state_path in sorted(evidence_root.glob("*/run-state.json")):
        try:
            state = json.loads(state_path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            raise HarnessError(f"cannot read interrupted-run journal {state_path}: {exc}") from exc
        if state.get("status") in {"CLEAN", "RECOVERED"}:
            continue
        save_name, mod_name = state.get("save_name", ""), state.get("mod_name", "")
        payload_name = state.get("payload_name")
        payload_staging_name = state.get("payload_staging_name")
        save, mod = (save_root / save_name).resolve(), (mod_root / mod_name).resolve()
        if save.parent != save_root or not save_name.startswith("CF_INSPECT_") or "/" in save_name:
            raise HarnessError(f"refusing recovery with unsafe save path in {state_path}")
        if mod.parent != mod_root or not mod_name.startswith("CF_LiveInspection_") or "/" in mod_name:
            raise HarnessError(f"refusing recovery with unsafe mod path in {state_path}")
        payload = None
        if payload_name is not None:
            if not isinstance(payload_name, str):
                raise HarnessError(f"refusing recovery with invalid payload path in {state_path}")
            payload = (mod_root / payload_name).resolve()
            if payload.parent != mod_root or not payload_name.startswith("CF_Payload_") or "/" in payload_name:
                raise HarnessError(f"refusing recovery with unsafe payload path in {state_path}")
        payload_staging = None
        if payload_staging_name is not None:
            if not isinstance(payload_staging_name, str):
                raise HarnessError(f"refusing recovery with invalid payload staging path in {state_path}")
            payload_staging = (mod_root / payload_staging_name).resolve()
            if payload_staging.parent != mod_root or not payload_staging_name.startswith("CF_Payload_") or not payload_staging_name.endswith(".staging") or "/" in payload_staging_name:
                raise HarnessError(f"refusing recovery with unsafe payload staging path in {state_path}")
        bundle = state_path.parent
        archive = bundle / "archive-recovered"
        archive.mkdir(exist_ok=True)
        owner_mailbox_relative = state.get("owner_mailbox_relative")
        if owner_mailbox_relative is not None:
            expected = ("CF_LiveInspectionMailboxes", state.get("run_token", ""), "owner-release")
            relative = PurePosixPath(owner_mailbox_relative)
            if relative.is_absolute() or relative.parts != expected or any("\\" in part or "\x00" in part for part in relative.parts):
                raise HarnessError(f"refusing recovery with unsafe owner mailbox path in {state_path}")
            mailbox_root = pz_root / expected[0]
            run_dir = mailbox_root / expected[1]
            if mailbox_root.is_symlink() or run_dir.is_symlink():
                raise HarnessError(f"refusing recovery through owner mailbox symlink in {state_path}")
            if run_dir.exists():
                shutil.move(str(run_dir), str(archive / "owner-release-mailbox"))
            if mailbox_root.is_dir():
                try:
                    mailbox_root.rmdir()
                except OSError:
                    pass
        for source, name in ((save, "save"), (mod, "mod")):
            if source.exists():
                shutil.move(str(source), archive / name)
        if payload and payload.exists():
            shutil.move(str(payload), archive / "production-payload")
        if payload_staging and payload_staging.exists():
            shutil.move(str(payload_staging), archive / "production-payload-staging")
        manifest_path = bundle / "control-before" / "manifest.json"
        if manifest_path.is_file():
            records = json.loads(manifest_path.read_text(encoding="utf-8"))
            for record in records:
                relative = record["relative"]
                if relative not in CONTROL_ALLOWLIST:
                    raise HarnessError(f"unsafe control path in recovery manifest: {relative}")
                destination = pz_root / relative
                if record["existed"]:
                    source = bundle / "control-before" / relative
                    atomic_copy(source, destination)
                    if sha256(destination) != record["digest"]:
                        raise HarnessError(f"recovery hash mismatch: {relative}")
                else:
                    destination.unlink(missing_ok=True)
        state["status"] = "RECOVERED"
        state_path.write_text(json.dumps(state, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        recovered.append(bundle)
    return recovered


def parse_renderer(glxinfo: str) -> dict[str, str | bool]:
    values: dict[str, str | bool] = {}
    for line in glxinfo.splitlines():
        for key in ("OpenGL vendor string", "OpenGL renderer string", "OpenGL version string"):
            if line.startswith(key + ":"):
                values[key.split()[1]] = line.split(":", 1)[1].strip()
    renderer = str(values.get("renderer", ""))
    values["software"] = not renderer or any(token in renderer.lower() for token in SOFTWARE_RENDERERS)
    return values
