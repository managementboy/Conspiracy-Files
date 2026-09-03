from __future__ import annotations

import hashlib
import os
import re
import shutil
import stat
import subprocess
import zipfile
from dataclasses import dataclass
from pathlib import Path

from .model import HarnessError, Payload

MAX_PACKAGE_FILES = 10000
MAX_PACKAGE_BYTES = 256 * 1024 * 1024


@dataclass(frozen=True)
class PayloadEvidence:
    source: str
    checksum: str
    source_commit: str | None
    mod_id: str
    installed_directory: str


def tree_checksum(root: Path) -> str:
    """Hash a directory as stable relative names, file modes, and bytes."""
    digest = hashlib.sha256()
    if not root.is_dir():
        raise HarnessError(f"payload source is not a directory: {root}")
    for path in sorted(root.rglob("*"), key=lambda item: item.as_posix()):
        relative = path.relative_to(root).as_posix()
        if path.is_symlink():
            raise HarnessError(f"production payload contains a symlink: {relative}")
        if path.is_dir():
            continue
        if not path.is_file():
            raise HarnessError(f"production payload contains a non-regular file: {relative}")
        digest.update(relative.encode("utf-8") + b"\0")
        digest.update(f"{stat.S_IMODE(path.stat().st_mode):04o}".encode("ascii") + b"\0")
        with path.open("rb") as stream:
            for block in iter(lambda: stream.read(1024 * 1024), b""):
                digest.update(block)
    return digest.hexdigest()


def file_checksum(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def clean_git_identity(source: Path) -> str | None:
    probe = subprocess.run(
        ["git", "-C", str(source), "rev-parse", "--show-toplevel"],
        text=True, capture_output=True, check=False,
    )
    if probe.returncode:
        return None
    top = Path(probe.stdout.strip()).resolve()
    status = subprocess.run(
        ["git", "-C", str(top), "status", "--porcelain", "--untracked-files=all"],
        text=True, capture_output=True, check=False,
    )
    if status.returncode or status.stdout:
        raise HarnessError("production payload source belongs to a dirty Git worktree")
    commit = subprocess.run(
        ["git", "-C", str(top), "rev-parse", "HEAD"], text=True, capture_output=True, check=True,
    ).stdout.strip()
    return commit


def _safe_extract(archive: Path, destination: Path) -> None:
    with zipfile.ZipFile(archive) as source:
        members = source.infolist()
        if len(members) > MAX_PACKAGE_FILES or sum(member.file_size for member in members) > MAX_PACKAGE_BYTES:
            raise HarnessError("production package exceeds bounded file-count or uncompressed-size limits")
        for member in members:
            target = (destination / member.filename).resolve()
            if destination.resolve() not in target.parents and target != destination.resolve():
                raise HarnessError(f"production package escapes extraction root: {member.filename}")
            mode = member.external_attr >> 16
            if stat.S_ISLNK(mode):
                raise HarnessError(f"production package contains a symlink: {member.filename}")
        source.extractall(destination)


def _mod_root(staged: Path) -> Path:
    candidates = [path.parent.parent for path in staged.rglob("42/mod.info")]
    unique = sorted({path.resolve() for path in candidates})
    if len(unique) != 1:
        raise HarnessError("production payload must contain exactly one Build 42 mod root")
    root = unique[0]
    extras = [path for path in staged.rglob("*") if path.is_file() and root not in path.resolve().parents]
    if extras:
        raise HarnessError("production package contains files outside its single mod root")
    return root


def _read_mod_id(mod_root: Path) -> str:
    text = (mod_root / "42" / "mod.info").read_text(encoding="utf-8")
    matches = re.findall(r"(?m)^id=([^\r\n]+)$", text)
    if len(matches) != 1:
        raise HarnessError("production payload mod.info must declare exactly one id")
    return matches[0].strip()


def install_production_payload(payload: Payload, destination: Path) -> PayloadEvidence:
    if payload.mode != "production" or not payload.source or not payload.expected_sha256 or not payload.expected_mod_id:
        raise HarnessError("incomplete production payload contract")
    source = payload.source.resolve()
    source_commit: str | None = None
    staging = destination.with_name(destination.name + ".staging")
    if destination.exists() or staging.exists():
        raise HarnessError("generated production payload path unexpectedly exists")
    try:
        if source.is_dir():
            checksum = tree_checksum(source)
            source_commit = clean_git_identity(source)
            if source_commit is None:
                raise HarnessError("production payload directory must belong to a clean Git worktree; use an exact .zip checksum otherwise")
            shutil.copytree(source, staging, symlinks=False)
        elif source.is_file() and source.suffix.lower() == ".zip":
            checksum = file_checksum(source)
            staging.mkdir(parents=True)
            _safe_extract(source, staging)
        else:
            raise HarnessError("production payload source must be a directory or .zip package")
        if checksum != payload.expected_sha256:
            raise HarnessError(f"production payload checksum mismatch: expected {payload.expected_sha256}, got {checksum}")
        root = _mod_root(staging)
        mod_id = _read_mod_id(root)
        if mod_id != payload.expected_mod_id:
            raise HarnessError(f"production payload mod identity mismatch: expected {payload.expected_mod_id}, got {mod_id}")
        if root == staging:
            os.replace(staging, destination)
        else:
            shutil.move(str(root), destination)
            shutil.rmtree(staging)
        return PayloadEvidence(source.name, checksum, source_commit, mod_id, destination.name)
    except Exception:
        shutil.rmtree(staging, ignore_errors=True)
        shutil.rmtree(destination, ignore_errors=True)
        raise
