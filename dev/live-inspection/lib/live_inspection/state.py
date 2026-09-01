from __future__ import annotations

import re
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Callable

from .model import Gate, HarnessError


@dataclass(frozen=True)
class GateResult:
    name: str
    attempt: int
    elapsed_seconds: float
    matched_line: str


class LogFollower:
    def __init__(self, path: Path, start_at_end: bool = False):
        self.path = path
        self.offset = path.stat().st_size if start_at_end and path.exists() else 0
        self.carry = ""

    def read_lines(self) -> list[str]:
        if not self.path.exists():
            return []
        if self.path.stat().st_size < self.offset:
            self.offset = 0
            self.carry = ""
        with self.path.open("r", encoding="utf-8", errors="replace") as stream:
            stream.seek(self.offset)
            data = stream.read()
            self.offset = stream.tell()
        data = self.carry + data
        parts = data.splitlines(keepends=True)
        self.carry = ""
        if parts and not parts[-1].endswith(("\n", "\r")):
            self.carry = parts.pop()
        return [line.rstrip("\r\n") for line in parts]


def wait_for_gate(
    gate: Gate,
    follower: LogFollower,
    alive: Callable[[], bool],
    on_timeout: Callable[[Gate, int, list[str]], None],
    poll_seconds: float = 0.25,
) -> GateResult:
    pattern = re.compile(gate.pattern)
    recent: list[str] = []
    for attempt in range(1, gate.retries + 2):
        started = time.monotonic()
        while time.monotonic() - started < gate.timeout_seconds:
            if not alive():
                raise HarnessError(f"process exited while waiting for gate {gate.name}")
            for line in follower.read_lines():
                recent.append(line)
                recent = recent[-80:]
                if pattern.search(line):
                    return GateResult(gate.name, attempt, time.monotonic() - started, line)
            time.sleep(poll_seconds)
        on_timeout(gate, attempt, recent)
    raise HarnessError(
        f"gate {gate.name} timed out after {gate.retries + 1} attempt(s); "
        f"last log lines: {' | '.join(recent[-8:]) or '<none>'}"
    )
