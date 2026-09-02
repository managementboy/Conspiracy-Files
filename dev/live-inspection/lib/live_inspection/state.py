from __future__ import annotations

import os
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
    matched_wall_time_ns: int | None = None
    matched_start_offset: int | None = None
    matched_end_offset: int | None = None
    matched_file_mtime_ns: int | None = None
    log_device: int | None = None
    log_inode: int | None = None


@dataclass(frozen=True)
class LogCursor:
    offset: int
    established_monotonic: float
    established_wall_time_ns: int
    file_mtime_ns: int
    log_device: int
    log_inode: int
    partial_record_at_boundary: bool
    observer_sequence_watermark: int | None = None


@dataclass(frozen=True)
class ObservedLine:
    text: str
    observed_at: float
    observed_wall_time_ns: int
    start_offset: int
    end_offset: int
    file_mtime_ns: int
    log_device: int
    log_inode: int


class LogFollower:
    def __init__(self, path: Path, start_at_end: bool = False):
        self.path = path
        self.offset = 0
        self.carry = b""
        self.carry_start_offset = 0
        self.pending: list[ObservedLine] = []
        self.log_device: int | None = None
        self.log_inode: int | None = None
        self.discard_until_newline = False
        if path.exists():
            with path.open("rb") as stream:
                stat = os.fstat(stream.fileno())
                self.log_device, self.log_inode = stat.st_dev, stat.st_ino
                if start_at_end:
                    self.offset = stat.st_size
                    self.carry_start_offset = self.offset
                    if stat.st_size:
                        stream.seek(-1, 2)
                        self.discard_until_newline = stream.read(1) != b"\n"

    def checkpoint(self) -> LogCursor:
        """Move to an exact EOF boundary and invalidate every earlier record."""
        if not self.path.exists():
            raise HarnessError("cannot establish pre-action cursor: console log is absent")
        with self.path.open("rb") as stream:
            stat = os.fstat(stream.fileno())
            partial = False
            if stat.st_size:
                stream.seek(-1, 2)
                partial = stream.read(1) != b"\n"
        cursor = LogCursor(
            offset=stat.st_size,
            established_monotonic=time.monotonic(),
            established_wall_time_ns=time.time_ns(),
            file_mtime_ns=stat.st_mtime_ns,
            log_device=stat.st_dev,
            log_inode=stat.st_ino,
            partial_record_at_boundary=partial,
        )
        self.offset = cursor.offset
        self.carry = b""
        self.carry_start_offset = cursor.offset
        self.pending = []
        self.log_device, self.log_inode = cursor.log_device, cursor.log_inode
        self.discard_until_newline = partial
        return cursor

    def read_records(self, *, cursor: LogCursor | None = None) -> list[ObservedLine]:
        pending, self.pending = self.pending, []
        if not self.path.exists():
            if cursor is not None:
                raise HarnessError("console log disappeared after the pre-action cursor")
            return pending
        with self.path.open("rb") as stream:
            stat = os.fstat(stream.fileno())
            if cursor is not None:
                if (stat.st_dev, stat.st_ino) != (cursor.log_device, cursor.log_inode):
                    raise HarnessError("console log identity changed after the pre-action cursor")
                if stat.st_size < cursor.offset or stat.st_size < self.offset:
                    raise HarnessError("console log was truncated after the pre-action cursor")
            elif (self.log_device, self.log_inode) != (stat.st_dev, stat.st_ino) or stat.st_size < self.offset:
                self.offset = 0
                self.carry = b""
                self.carry_start_offset = 0
                self.discard_until_newline = False
                pending = []
            self.log_device, self.log_inode = stat.st_dev, stat.st_ino
            read_start = self.offset
            stream.seek(self.offset)
            data = stream.read()
            self.offset = stream.tell()
            stat = os.fstat(stream.fileno())
        if self.discard_until_newline:
            boundary = data.find(b"\n")
            if boundary < 0:
                return pending
            data = data[boundary + 1:]
            read_start += boundary + 1
            self.discard_until_newline = False
        if self.carry:
            data = self.carry + data
            read_start = self.carry_start_offset
            self.carry = b""
        records: list[ObservedLine] = []
        observed_at = time.monotonic()
        observed_wall_time_ns = time.time_ns()
        position = 0
        while True:
            newline = data.find(b"\n", position)
            if newline < 0:
                break
            raw = data[position:newline]
            if raw.endswith(b"\r"):
                raw = raw[:-1]
            records.append(ObservedLine(
                text=raw.decode("utf-8", "replace"),
                observed_at=observed_at,
                observed_wall_time_ns=observed_wall_time_ns,
                start_offset=read_start + position,
                end_offset=read_start + newline + 1,
                file_mtime_ns=stat.st_mtime_ns,
                log_device=stat.st_dev,
                log_inode=stat.st_ino,
            ))
            position = newline + 1
        if position < len(data):
            self.carry = data[position:]
            self.carry_start_offset = read_start + position
        else:
            self.carry_start_offset = self.offset
        return pending + records

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
    cursor: LogCursor | None = None,
) -> GateResult:
    if not_before is not None and cursor is None:
        raise HarnessError("post-action log gates require an exact pre-action byte cursor")
    pattern = re.compile(gate.pattern)
    recent: list[str] = []
    for attempt in range(1, gate.retries + 2):
        started = time.monotonic()
        while time.monotonic() - started < gate.timeout_seconds:
            if not alive():
                raise HarnessError(f"process exited while waiting for gate {gate.name}")
            records = follower.read_records(cursor=cursor)
            matches = [
                record for record in records
                if pattern.search(record.text)
                and (not_before is None or record.observed_at > not_before)
                and (cursor is None or record.start_offset >= cursor.offset)
            ]
            if cursor is not None and len(matches) > 1:
                raise HarnessError(
                    f"gate {gate.name} observed duplicate or conflicting post-cursor records"
                )
            if cursor is not None and len(matches) == 1:
                # Give a single buffered writer flush interval to expose an
                # adjacent duplicate/conflict before the candidate is returned.
                time.sleep(poll_seconds)
                trailing = follower.read_records(cursor=cursor)
                trailing_matches = [record for record in trailing if pattern.search(record.text)]
                if trailing_matches:
                    raise HarnessError(
                        f"gate {gate.name} observed duplicate or conflicting post-cursor records"
                    )
                records.extend(trailing)
            for index, record in enumerate(records):
                recent.append(record.text)
                recent = recent[-80:]
                if record in matches:
                    follower.prepend_records(records[index + 1:])
                    return GateResult(
                        gate.name,
                        attempt,
                        time.monotonic() - started,
                        record.text,
                        record.observed_at,
                        record.observed_wall_time_ns,
                        record.start_offset,
                        record.end_offset,
                        record.file_mtime_ns,
                        record.log_device,
                        record.log_inode,
                    )
            time.sleep(poll_seconds)
        on_timeout(gate, attempt, recent)
    raise HarnessError(
        f"gate {gate.name} timed out after {gate.retries + 1} attempt(s); "
        f"last log lines: {' | '.join(recent[-8:]) or '<none>'}"
    )
