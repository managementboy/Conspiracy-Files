#!/usr/bin/env python3
"""Select and run the release workflow's event-specific whitespace gate."""

from __future__ import annotations

import argparse
from pathlib import Path
import subprocess
import sys


ZERO_SHA = "0" * 40


class RangeError(RuntimeError):
    """Raised when the event does not provide a safe, resolvable range."""


def git(repository: Path, *arguments: str, check: bool = True) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        ["git", *arguments],
        cwd=repository,
        check=check,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )


def require_commit(repository: Path, revision: str, label: str) -> None:
    if not revision:
        raise RangeError(f"{label} SHA is missing")
    result = git(repository, "rev-parse", "--verify", f"{revision}^{{commit}}", check=False)
    if result.returncode != 0:
        raise RangeError(f"{label} SHA does not resolve to a commit: {revision}")


def empty_tree(repository: Path) -> str:
    return git(repository, "hash-object", "-t", "tree", "/dev/null").stdout.strip()


def range_arguments(
    repository: Path,
    event: str,
    sha: str,
    *,
    before: str = "",
    pull_request_base: str = "",
) -> tuple[list[str], str]:
    require_commit(repository, sha, "event")
    if event == "pull_request":
        require_commit(repository, pull_request_base, "pull-request base")
        range_spec = f"{pull_request_base}...{sha}"
        return [range_spec], range_spec
    if event == "push":
        if before and before != ZERO_SHA:
            require_commit(repository, before, "push before")
            range_spec = f"{before}..{sha}"
            return [range_spec], range_spec
        tree = empty_tree(repository)
        return [tree, sha], f"new-branch:{tree}..{sha}"
    if event == "workflow_dispatch":
        parent = git(repository, "rev-parse", "--verify", f"{sha}^{{commit}}^", check=False)
        if parent.returncode == 0:
            parent_sha = parent.stdout.strip()
            range_spec = f"{parent_sha}..{sha}"
            return [range_spec], f"manual:{range_spec}"
        tree = empty_tree(repository)
        return [tree, sha], f"manual-root:{tree}..{sha}"
    raise RangeError(f"unsupported workflow event: {event}")


def run_check(
    repository: Path,
    event: str,
    sha: str,
    *,
    before: str = "",
    pull_request_base: str = "",
) -> subprocess.CompletedProcess[str]:
    arguments, label = range_arguments(
        repository,
        event,
        sha,
        before=before,
        pull_request_base=pull_request_base,
    )
    result = git(repository, "diff", "--check", *arguments, check=False)
    result.range_label = label  # type: ignore[attr-defined]
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--event", required=True, choices=("pull_request", "push", "workflow_dispatch"))
    parser.add_argument("--sha", required=True)
    parser.add_argument("--before", default="")
    parser.add_argument("--pull-request-base", default="")
    parser.add_argument("--repository", type=Path, default=Path.cwd())
    arguments = parser.parse_args()
    try:
        result = run_check(
            arguments.repository,
            arguments.event,
            arguments.sha,
            before=arguments.before,
            pull_request_base=arguments.pull_request_base,
        )
    except RangeError as error:
        print(f"changed-range whitespace gate failed: {error}", file=sys.stderr)
        return 2
    print(f"Changed-range whitespace gate: {result.range_label}")  # type: ignore[attr-defined]
    if result.stdout:
        print(result.stdout, end="")
    return result.returncode


if __name__ == "__main__":
    raise SystemExit(main())
