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
    matched_at: float


@dataclass(frozen=True)
class ObservedLine:
    text: str
    observed_at: float


class LogFollower:
    def __init__(self, path: Path, start_at_end: bool = False):
        self.path = path
        self.offset = path.stat().st_size if start_at_end and path.exists() else 0
        self.carry = ""
        self.pending: list[ObservedLine] = []

    def read_records(self) -> list[ObservedLine]:
        pending, self.pending = self.pending, []
        if not self.path.exists():
            return pending
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
        observed_at = time.monotonic()
        return pending + [ObservedLine(line.rstrip("\r\n"), observed_at) for line in parts]

    def read_lines(self) -> list[str]:
        return [record.text for record in self.read_records()]

    def prepend_records(self, records: list[ObservedLine]) -> None:
        self.pending = list(records) + self.pending


def wait_for_gate(
    gate: Gate,
    follower: LogFollower,
    alive: Callable[[], bool],
    on_timeout: Callable[[Gate, int, list[str]], None],
    poll_seconds: float = 0.25,
    not_before: float | None = None,
) -> GateResult:
    pattern = re.compile(gate.pattern)
    recent: list[str] = []
    for attempt in range(1, gate.retries + 2):
        started = time.monotonic()
        while time.monotonic() - started < gate.timeout_seconds:
            if not alive():
                raise HarnessError(f"process exited while waiting for gate {gate.name}")
            records = follower.read_records()
            for index, record in enumerate(records):
                recent.append(record.text)
                recent = recent[-80:]
                if pattern.search(record.text) and (not_before is None or record.observed_at > not_before):
                    follower.prepend_records(records[index + 1:])
                    return GateResult(
                        gate.name,
                        attempt,
                        time.monotonic() - started,
                        record.text,
                        record.observed_at,
                    )
            time.sleep(poll_seconds)
        on_timeout(gate, attempt, recent)
    raise HarnessError(
        f"gate {gate.name} timed out after {gate.retries + 1} attempt(s); "
        f"last log lines: {' | '.join(recent[-8:]) or '<none>'}"
    )
