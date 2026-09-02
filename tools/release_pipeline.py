#!/usr/bin/env python3
"""Offline deterministic validation and packaging for Conspiracy-Files."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import stat
import subprocess
import sys
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
CONFIG_PATH = ROOT / "release" / "release.json"
MOD_ROOT = ROOT / "mod"
FIXED_ZIP_TIME = (1980, 1, 1, 0, 0, 0)
FIXED_FILE_TIME = 315532800
EXPECTED_SOURCE_ONLY = {Path("42/README.md")}
ALLOWED_COMMON_SUFFIXES = {".lua", ".png", ".txt"}
FORBIDDEN_PARTS = {
    ".git", ".github", "dev", "test", "tests", "research", "saves", "save",
    "logs", "log", "secrets", "credentials", "profiles", "coverage", "tmp",
}
FORBIDDEN_SUFFIXES = {
    ".log", ".save", ".sqlite", ".db", ".pem", ".key", ".p12", ".pfx",
    ".exe", ".dll", ".so", ".dylib", ".class", ".jar", ".pyc",
}
TEXT_SUFFIXES = {".lua", ".txt", ".md", ".json", ".info"}
SECRET_PATTERNS = (
    re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----"),
    re.compile(rb"\bAKIA[0-9A-Z]{16}\b"),
    re.compile(rb"\bgh[opsu]_[A-Za-z0-9]{30,}\b"),
    re.compile(rb"\bsk-[A-Za-z0-9_-]{20,}\b"),
    re.compile(rb"(?i)\b(?:api[_-]?key|client[_-]?secret|access[_-]?token)\s*[:=]\s*['\"][^'\"]{8,}['\"]"),
)
LOCAL_PATH_PATTERNS = (
    re.compile(rb"/(?:home|Users)/[A-Za-z0-9._-]+/"),
    re.compile(rb"[A-Za-z]:\\Users\\[^\r\n]+"),
    re.compile(rb"(?i)(?:Zomboid[/\\\\](?:Saves|Logs)|latestSave\.ini)"),
)


class ReleaseError(RuntimeError):
    pass


def run(command: list[str], *, cwd: Path = ROOT, capture: bool = True) -> str:
    completed = subprocess.run(
        command,
        cwd=cwd,
        check=False,
        text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.STDOUT if capture else None,
    )
    output = completed.stdout or ""
    if completed.returncode != 0:
        raise ReleaseError(f"command failed ({completed.returncode}): {' '.join(command)}\n{output.rstrip()}")
    return output


def load_config() -> dict:
    try:
        config = json.loads(CONFIG_PATH.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise ReleaseError(f"cannot read {CONFIG_PATH.relative_to(ROOT)}: {error}") from error
    expected = {
        "version", "content_revision", "state_schema_version", "project_zomboid",
        "known_limitations", "save_compatibility",
    }
    if set(config) != expected:
        raise ReleaseError(f"release metadata keys must be exactly {sorted(expected)}")
    pz_expected = {
        "minimum_version", "supported_line", "verified_build", "verified_revision",
        "verified_steam_build_id",
    }
    if set(config["project_zomboid"]) != pz_expected:
        raise ReleaseError(f"project_zomboid keys must be exactly {sorted(pz_expected)}")
    if not re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+", config["version"]):
        raise ReleaseError("version must be a three-part numeric version")
    if not isinstance(config["state_schema_version"], int) or config["state_schema_version"] < 1:
        raise ReleaseError("state_schema_version must be a positive integer")
    if not config["known_limitations"] or not all(isinstance(item, str) and item for item in config["known_limitations"]):
        raise ReleaseError("known_limitations must contain non-empty strings")
    return config


def git(*arguments: str) -> str:
    return run(["git", *arguments]).strip()


def require_clean_source() -> str:
    inside = git("rev-parse", "--is-inside-work-tree")
    if inside != "true":
        raise ReleaseError("release root is not a Git working tree")
    dirty = git("status", "--porcelain=v1", "--untracked-files=all")
    if dirty:
        raise ReleaseError("release builds require a clean source tree:\n" + dirty)
    commit = git("rev-parse", "--verify", "HEAD")
    if not re.fullmatch(r"[0-9a-f]{40}", commit):
        raise ReleaseError("HEAD did not resolve to a full Git commit")
    return commit


def parse_mod_info(path: Path) -> dict[str, str]:
    values: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line.lstrip().startswith("#"):
            continue
        if "=" not in line:
            raise ReleaseError(f"invalid mod.info line: {line!r}")
        key, value = line.split("=", 1)
        if not key or key in values:
            raise ReleaseError(f"duplicate or empty mod.info key: {key!r}")
        values[key] = value
    return values


def all_mod_files() -> list[Path]:
    if not MOD_ROOT.is_dir():
        raise ReleaseError("mod/ is missing")
    top_level = {entry.name for entry in MOD_ROOT.iterdir()}
    if top_level != {"42", "common"}:
        raise ReleaseError(f"mod/ top-level entries must be exactly 42 and common, got {sorted(top_level)}")
    files: list[Path] = []
    for path in sorted(MOD_ROOT.rglob("*")):
        if path.is_symlink():
            raise ReleaseError(f"symlinks are forbidden in production source: {path.relative_to(ROOT)}")
        if path.is_file():
            files.append(path.relative_to(MOD_ROOT))
    return files


def production_files(config: dict) -> list[Path]:
    source_files = all_mod_files()
    if not EXPECTED_SOURCE_ONLY.issubset(set(source_files)):
        raise ReleaseError("expected source-only documentation is missing: mod/42/README.md")
    selected: list[Path] = []
    for relative in source_files:
        if relative in EXPECTED_SOURCE_ONLY:
            continue
        if relative == Path("42/mod.info"):
            selected.append(relative)
            continue
        if relative.parts[:2] == ("common", "media") and relative.suffix.lower() in ALLOWED_COMMON_SUFFIXES:
            selected.append(relative)
            continue
        raise ReleaseError(f"unexpected file in production mod source: mod/{relative.as_posix()}")

    required = {
        Path("42/mod.info"),
        Path("common/media/lua/shared/ConspiracyFilesBootstrap.lua"),
        Path("common/media/lua/shared/ConspiracyFiles/init.lua"),
        Path("common/media/lua/shared/ConspiracyFiles/Content.lua"),
        Path("common/media/lua/shared/ConspiracyFiles/ThreadState.lua"),
    }
    missing = required.difference(selected)
    if missing:
        raise ReleaseError(f"required production files missing: {[item.as_posix() for item in sorted(missing)]}")
    tracked = set(git("ls-files", "--", "mod", "release/release.json").splitlines())
    required_tracked = {f"mod/{relative.as_posix()}" for relative in selected} | {"release/release.json"}
    untracked_sources = required_tracked.difference(tracked)
    if untracked_sources:
        raise ReleaseError(f"production metadata/files are not tracked by Git: {sorted(untracked_sources)}")

    info = parse_mod_info(MOD_ROOT / "42" / "mod.info")
    exact_info = {
        "id": "ConspiracyFiles",
        "modversion": config["version"],
        "versionMin": config["project_zomboid"]["minimum_version"],
    }
    for key, expected in exact_info.items():
        if info.get(key) != expected:
            raise ReleaseError(f"mod/42/mod.info {key} must be {expected!r}, got {info.get(key)!r}")

    content = (MOD_ROOT / "common/media/lua/shared/ConspiracyFiles/Content.lua").read_text(encoding="utf-8")
    content_match = re.search(r'contentRevision\s*=\s*"([^"]+)"', content)
    if not content_match or content_match.group(1) != config["content_revision"]:
        raise ReleaseError("release content_revision does not match Content.thread.contentRevision")
    validator = (MOD_ROOT / "common/media/lua/shared/ConspiracyFiles/Validator.lua").read_text(encoding="utf-8")
    schema_match = re.search(r"CURRENT_SCHEMA_VERSION\s*=\s*([0-9]+)", validator)
    if not schema_match or int(schema_match.group(1)) != config["state_schema_version"]:
        raise ReleaseError("release state_schema_version does not match Validator.CURRENT_SCHEMA_VERSION")
    for relative in selected:
        if relative.suffix == ".lua":
            source = (MOD_ROOT / relative).read_text(encoding="utf-8")
            if re.search(r'require\(["\']ConspiracyFiles\.', source):
                raise ReleaseError(f"dotted ConspiracyFiles require is forbidden: {relative.as_posix()}")
    return selected


def scan_file_content(path: Path, display_name: str) -> None:
    data = path.read_bytes()
    if b"\x00" in data and path.suffix.lower() in TEXT_SUFFIXES:
        raise ReleaseError(f"NUL byte in text payload file: {display_name}")
    for pattern in SECRET_PATTERNS:
        if pattern.search(data):
            raise ReleaseError(f"credential-like content in payload: {display_name}")
    for pattern in LOCAL_PATH_PATTERNS:
        if pattern.search(data):
            raise ReleaseError(f"machine-local path or runtime location in payload: {display_name}")


def scan_payload_sources(files: list[Path]) -> None:
    for relative in files:
        lowered_parts = {part.lower() for part in relative.parts}
        if lowered_parts.intersection(FORBIDDEN_PARTS):
            raise ReleaseError(f"forbidden path component in payload: {relative.as_posix()}")
        if relative.suffix.lower() in FORBIDDEN_SUFFIXES:
            raise ReleaseError(f"forbidden file type in payload: {relative.as_posix()}")
        scan_file_content(MOD_ROOT / relative, relative.as_posix())


def find_lua_tool(environment_name: str, candidates: tuple[str, ...], label: str) -> str:
    configured = os.environ.get(environment_name)
    tool = configured or next((path for name in candidates if (path := shutil.which(name))), None)
    if not tool:
        raise ReleaseError(f"{label} not found; set {environment_name} to a Lua 5.1-compatible executable")
    version = run([tool, "-v"]).strip()
    if "5.1" not in version:
        raise ReleaseError(f"{label} must report Lua 5.1 compatibility, got: {version}")
    return tool


def validate_lua_syntax(files: list[Path]) -> None:
    luac = find_lua_tool("CF_LUAC", ("luac5.1", "luac"), "Lua compiler")
    lua_files = [MOD_ROOT / relative for relative in files if relative.suffix == ".lua"]
    if not lua_files:
        raise ReleaseError("production payload contains no Lua files")
    for path in lua_files:
        run([luac, "-p", str(path)])


def run_project_suite() -> str:
    lua = find_lua_tool("CF_LUA", ("lua5.1", "lua"), "Lua interpreter")
    return run([lua, "test/run.lua"])


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8", newline="\n")
    path.chmod(0o644)
    os.utime(path, (FIXED_FILE_TIME, FIXED_FILE_TIME))


def metadata(config: dict, commit: str) -> dict:
    return {
        "artifact_format": 1,
        "conspiracy_files_version": config["version"],
        "content_revision": config["content_revision"],
        "project_zomboid": config["project_zomboid"],
        "save_compatibility": config["save_compatibility"],
        "source_commit": commit,
        "state_schema_version": config["state_schema_version"],
    }


def release_notes(config: dict, commit: str) -> str:
    limitations = "\n".join(f"- {item}" for item in config["known_limitations"])
    pz = config["project_zomboid"]
    return (
        f"# Conspiracy-Files {config['version']} prerelease payload\n\n"
        f"- Source commit: `{commit}`\n"
        f"- Content revision: `{config['content_revision']}`\n"
        f"- Canonical-state schema: `{config['state_schema_version']}`\n"
        f"- Supported PZ line: `{pz['supported_line']}`\n"
        f"- Verified PZ build: `{pz['verified_build']}` (revision `{pz['verified_revision']}`, "
        f"Steam build ID `{pz['verified_steam_build_id']}`)\n\n"
        "## Save compatibility\n\n"
        f"{config['save_compatibility']}\n\n"
        "## Known limitations\n\n"
        f"{limitations}\n"
    )


def stage_payload(destination: Path, files: list[Path], config: dict, commit: str) -> None:
    destination.mkdir(parents=True, exist_ok=False)
    for relative in files:
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(MOD_ROOT / relative, target)
        target.chmod(0o644)
        os.utime(target, (FIXED_FILE_TIME, FIXED_FILE_TIME))
    write_text(destination / "release-metadata.json", json.dumps(metadata(config, commit), indent=2, sort_keys=True) + "\n")
    write_text(destination / "RELEASE_NOTES.md", release_notes(config, commit))
    manifest_entries = []
    for path in sorted(item for item in destination.rglob("*") if item.is_file()):
        manifest_entries.append(f"{sha256(path)}  {path.relative_to(destination).as_posix()}")
    write_text(destination / "SHA256SUMS", "\n".join(manifest_entries) + "\n")
    verify_staged_payload(destination, config, commit)


def verify_staged_payload(payload: Path, config: dict, commit: str) -> None:
    expected_metadata = metadata(config, commit)
    actual_metadata = json.loads((payload / "release-metadata.json").read_text(encoding="utf-8"))
    if actual_metadata != expected_metadata:
        raise ReleaseError("staged release metadata is not exact")
    manifest_path = payload / "SHA256SUMS"
    seen: set[str] = set()
    for line in manifest_path.read_text(encoding="utf-8").splitlines():
        match = re.fullmatch(r"([0-9a-f]{64})  ([^\r\n]+)", line)
        if not match:
            raise ReleaseError(f"invalid payload manifest line: {line!r}")
        digest, relative_text = match.groups()
        if relative_text in seen or relative_text == "SHA256SUMS":
            raise ReleaseError(f"invalid duplicate/self manifest entry: {relative_text}")
        seen.add(relative_text)
        target = payload / Path(relative_text)
        if not target.is_file() or sha256(target) != digest:
            raise ReleaseError(f"payload manifest mismatch: {relative_text}")
    expected = {
        path.relative_to(payload).as_posix()
        for path in payload.rglob("*") if path.is_file() and path != manifest_path
    }
    if seen != expected:
        raise ReleaseError("payload manifest does not cover exactly every non-manifest file")
    all_paths = [path.relative_to(payload) for path in payload.rglob("*") if path.is_file()]
    for relative in all_paths:
        lowered_parts = {part.lower() for part in relative.parts}
        if lowered_parts.intersection(FORBIDDEN_PARTS) or relative.suffix.lower() in FORBIDDEN_SUFFIXES:
            raise ReleaseError(f"forbidden staged payload file: {relative.as_posix()}")
        scan_file_content(payload / relative, relative.as_posix())


def zip_payload(payload: Path, archive: Path, prefix: Path) -> None:
    archive.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as output:
        for path in sorted(item for item in payload.rglob("*") if item.is_file()):
            archive_name = (prefix / path.relative_to(payload)).as_posix()
            info = zipfile.ZipInfo(archive_name, FIXED_ZIP_TIME)
            info.compress_type = zipfile.ZIP_DEFLATED
            info.create_system = 3
            info.external_attr = (stat.S_IFREG | 0o644) << 16
            output.writestr(info, path.read_bytes(), compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)


def tree_manifest(root: Path) -> dict[str, str]:
    return {
        path.relative_to(root).as_posix(): sha256(path)
        for path in sorted(item for item in root.rglob("*") if item.is_file())
    }


def build_once(output: Path, files: list[Path], config: dict, commit: str) -> None:
    if output.exists():
        raise ReleaseError(f"build destination already exists: {output}")
    output.mkdir(parents=True)
    canonical = output / ".canonical-payload"
    stage_payload(canonical, files, config, commit)
    version = config["version"]
    github_zip = output / f"Conspiracy-Files-{version}-github.zip"
    workshop_name = f"Conspiracy-Files-{version}-workshop"
    workshop_payload = output / workshop_name / "Contents" / "mods" / "ConspiracyFiles"
    workshop_payload.parent.mkdir(parents=True)
    shutil.copytree(canonical, workshop_payload, copy_function=shutil.copyfile)
    for path in workshop_payload.rglob("*"):
        if path.is_file():
            path.chmod(0o644)
            os.utime(path, (FIXED_FILE_TIME, FIXED_FILE_TIME))
    if tree_manifest(canonical) != tree_manifest(workshop_payload):
        raise ReleaseError("Workshop wrapper drifted from the canonical production payload")
    zip_payload(canonical, github_zip, Path("ConspiracyFiles"))
    workshop_zip = output / f"{workshop_name}.zip"
    zip_payload(canonical, workshop_zip, Path("Contents/mods/ConspiracyFiles"))
    shutil.rmtree(canonical)
    checksums = [
        f"{sha256(github_zip)}  {github_zip.name}",
        f"{sha256(workshop_zip)}  {workshop_zip.name}",
    ]
    write_text(output / "SHA256SUMS", "\n".join(checksums) + "\n")


def assert_reproducible(files: list[Path], config: dict, commit: str) -> None:
    with tempfile.TemporaryDirectory(prefix="cf-release-repro-") as temporary:
        first = Path(temporary) / "first"
        second = Path(temporary) / "second"
        build_once(first, files, config, commit)
        build_once(second, files, config, commit)
        first_manifest = tree_manifest(first)
        second_manifest = tree_manifest(second)
        if first_manifest != second_manifest:
            different = sorted(set(first_manifest) | set(second_manifest))
            detail = [name for name in different if first_manifest.get(name) != second_manifest.get(name)]
            raise ReleaseError(f"two builds produced different manifests: {detail}")
        for channel in ("github", "workshop"):
            archive = first / f"Conspiracy-Files-{config['version']}-{channel}.zip"
            with zipfile.ZipFile(archive) as package:
                if package.testzip() is not None:
                    raise ReleaseError(f"corrupt {channel} ZIP")


def replace_output(output: Path, files: list[Path], config: dict, commit: str) -> None:
    output = output.resolve()
    if output == ROOT or ROOT not in output.parents:
        raise ReleaseError("output must be a dedicated directory inside the repository")
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=".cf-release-", dir=output.parent) as temporary:
        staged = Path(temporary) / "result"
        build_once(staged, files, config, commit)
        if output.exists():
            if output.is_symlink() or not output.is_dir():
                raise ReleaseError(f"refusing to replace non-directory output: {output}")
            shutil.rmtree(output)
        shutil.copytree(staged, output)


def validate_source(*, suite: bool, syntax: bool) -> tuple[dict, list[Path], str, str]:
    config = load_config()
    commit = require_clean_source()
    files = production_files(config)
    scan_payload_sources(files)
    if syntax:
        validate_lua_syntax(files)
    suite_output = run_project_suite() if suite else ""
    return config, files, commit, suite_output


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    verify_parser = subparsers.add_parser("verify", help="validate source, Lua syntax, and project tests")
    verify_parser.add_argument("--skip-suite", action="store_true", help="skip the Lua project suite")
    build_parser = subparsers.add_parser("build", help="verify and create GitHub/Workshop artifacts")
    build_parser.add_argument("--output", type=Path, default=Path("dist"))
    reproduce_parser = subparsers.add_parser("reproducibility-test", help="build twice and compare every output hash")
    reproduce_parser.add_argument("--skip-suite", action="store_true", help="skip the Lua project suite")
    all_parser = subparsers.add_parser("all", help="verify, reproduce, and write artifacts")
    all_parser.add_argument("--output", type=Path, default=Path("dist"))
    arguments = parser.parse_args()

    try:
        config, files, commit, suite_output = validate_source(
            suite=not getattr(arguments, "skip_suite", False),
            syntax=True,
        )
        if suite_output:
            print(suite_output, end="" if suite_output.endswith("\n") else "\n")
        print(f"Validated {len(files)} production source files at {commit}.")
        if arguments.command in {"reproducibility-test", "all"}:
            assert_reproducible(files, config, commit)
            print("Reproducibility test passed: two complete build manifests are identical.")
        if arguments.command in {"build", "all"}:
            output = arguments.output if arguments.output.is_absolute() else ROOT / arguments.output
            replace_output(output, files, config, commit)
            print(f"Wrote deterministic release artifacts to {output.resolve()}.")
    except ReleaseError as error:
        print(f"release pipeline failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
