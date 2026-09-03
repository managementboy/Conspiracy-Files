from __future__ import annotations

import base64
import binascii
import json
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
    matched_raw_bytes: bytes | None = None
    matched_decode_error: bool | None = None


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
    raw_bytes: bytes
    decode_error: bool


_GATE_EVIDENCE_MARKER = "\n[CF_GATE_EVIDENCE_BASE64="


def _serialized_gate_result(value: GateResult) -> dict[str, object]:
    return {
        "name": value.name,
        "attempt": value.attempt,
        "elapsed_seconds": value.elapsed_seconds,
        "matched_line": value.matched_line,
        "matched_at": value.matched_at,
        "matched_wall_time_ns": value.matched_wall_time_ns,
        "matched_start_offset": value.matched_start_offset,
        "matched_end_offset": value.matched_end_offset,
        "matched_file_mtime_ns": value.matched_file_mtime_ns,
        "log_device": value.log_device,
        "log_inode": value.log_inode,
        "matched_raw_bytes_base64": (
            base64.b64encode(value.matched_raw_bytes).decode("ascii")
            if value.matched_raw_bytes is not None else None
        ),
        "matched_decode_error": value.matched_decode_error,
    }


def _deserialized_gate_result(value: dict[str, object]) -> GateResult:
    raw_base64 = value.get("matched_raw_bytes_base64")
    raw = base64.b64decode(raw_base64, validate=True) if isinstance(raw_base64, str) else None
    return GateResult(
        name=str(value["name"]),
        attempt=int(value["attempt"]),
        elapsed_seconds=float(value["elapsed_seconds"]),
        matched_line=str(value["matched_line"]),
        matched_at=float(value["matched_at"]),
        matched_wall_time_ns=(
            int(value["matched_wall_time_ns"])
            if value.get("matched_wall_time_ns") is not None else None
        ),
        matched_start_offset=(
            int(value["matched_start_offset"])
            if value.get("matched_start_offset") is not None else None
        ),
        matched_end_offset=(
            int(value["matched_end_offset"])
            if value.get("matched_end_offset") is not None else None
        ),
        matched_file_mtime_ns=(
            int(value["matched_file_mtime_ns"])
            if value.get("matched_file_mtime_ns") is not None else None
        ),
        log_device=int(value["log_device"]) if value.get("log_device") is not None else None,
        log_inode=int(value["log_inode"]) if value.get("log_inode") is not None else None,
        matched_raw_bytes=raw,
        matched_decode_error=(
            bool(value["matched_decode_error"])
            if value.get("matched_decode_error") is not None else None
        ),
    )


class GateEvidenceError(HarnessError):
    """A gate rejection that carries every exact record which caused it."""

    def __init__(
        self,
        message: str,
        records: tuple[GateResult, ...],
        record_reasons: tuple[str | None, ...] | None = None,
    ):
        self.message = message
        self.records = records
        self.record_reasons = record_reasons or (None,) * len(records)
        if len(self.record_reasons) != len(records):
            raise ValueError("gate evidence reasons must align with records")
        payload = json.dumps(
            [
                {
                    **_serialized_gate_result(record),
                    "record_rejection_reason": reason,
                }
                for record, reason in zip(records, self.record_reasons)
            ],
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
        encoded = base64.urlsafe_b64encode(payload).decode("ascii")
        # Keep the exact evidence self-contained even for compatibility callers
        # which preserve only str(exc) before passing it to fail_delivery().
        super().__init__(message + _GATE_EVIDENCE_MARKER + encoded + "]")


def extract_gate_evidence(
    error: str | BaseException,
) -> tuple[str, tuple[GateResult, ...], tuple[str | None, ...]]:
    if isinstance(error, GateEvidenceError):
        return error.message, error.records, error.record_reasons
    text = str(error)
    message, marker, encoded = text.rpartition(_GATE_EVIDENCE_MARKER)
    if not marker or not encoded.endswith("]"):
        return text, (), ()
    try:
        payload = base64.urlsafe_b64decode(encoded[:-1].encode("ascii"))
        values = json.loads(payload.decode("utf-8"))
        if not isinstance(values, list):
            raise ValueError("gate evidence payload is not a list")
        records = tuple(_deserialized_gate_result(value) for value in values)
        reasons = tuple(
            value.get("record_rejection_reason")
            if isinstance(value.get("record_rejection_reason"), str) else None
            for value in values
        )
    except (KeyError, TypeError, ValueError, binascii.Error, json.JSONDecodeError):
        return text, (), ()
    return message, records, reasons


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
            raw_bytes = data[position:newline + 1]
            decoded_bytes = data[position:newline]
            if decoded_bytes.endswith(b"\r"):
                decoded_bytes = decoded_bytes[:-1]
            try:
                text = decoded_bytes.decode("utf-8", "strict")
                decode_error = False
            except UnicodeDecodeError:
                text = decoded_bytes.decode("utf-8", "replace")
                decode_error = True
            records.append(ObservedLine(
                text=text,
                observed_at=observed_at,
                observed_wall_time_ns=observed_wall_time_ns,
                start_offset=read_start + position,
                end_offset=read_start + newline + 1,
                file_mtime_ns=stat.st_mtime_ns,
                log_device=stat.st_dev,
                log_inode=stat.st_ino,
                raw_bytes=raw_bytes,
                decode_error=decode_error,
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
    match_validator: Callable[[GateResult], None] | None = None,
    on_rejected_match: Callable[[GateResult, HarnessError], None] | None = None,
) -> GateResult:
    if not_before is not None and cursor is None:
        raise HarnessError("post-action log gates require an exact pre-action byte cursor")
    pattern = re.compile(gate.pattern)
    recent: list[str] = []
    for attempt in range(1, gate.retries + 2):
        started = time.monotonic()
        accepted: GateResult | None = None
        post_acceptance_matches: list[GateResult] = []
        post_acceptance_reasons: list[str | None] = []
        records_after_acceptance: list[ObservedLine] = []
        trailing_poll_required = False

        def gate_result(record: ObservedLine) -> GateResult:
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
                record.raw_bytes,
                record.decode_error,
            )

        while time.monotonic() - started < gate.timeout_seconds:
            if not alive():
                if accepted is not None:
                    raise GateEvidenceError(
                        f"process exited while gate {gate.name} was settling its valid candidate",
                        tuple(post_acceptance_matches),
                        tuple(post_acceptance_reasons),
                    )
                raise HarnessError(f"process exited while waiting for gate {gate.name}")
            try:
                records = follower.read_records(cursor=cursor)
            except HarnessError as exc:
                if accepted is not None:
                    raise GateEvidenceError(
                        f"gate {gate.name} could not finish settling its valid candidate: {exc}",
                        tuple(post_acceptance_matches),
                        tuple(post_acceptance_reasons),
                    ) from exc
                raise
            for index, record in enumerate(records):
                recent.append(record.text)
                recent = recent[-80:]
                if accepted is not None:
                    records_after_acceptance.append(record)
                if not pattern.search(record.text) \
                        or (not_before is not None and record.observed_at <= not_before) \
                        or (cursor is not None and record.start_offset < cursor.offset):
                    continue
                result = gate_result(record)
                validation_error: HarnessError | None = None
                if match_validator is not None:
                    try:
                        match_validator(result)
                    except HarnessError as exc:
                        validation_error = exc
                if validation_error is not None:
                    if accepted is None:
                        if on_rejected_match is not None:
                            on_rejected_match(result, validation_error)
                    else:
                        # A readiness-shaped record after the first valid one is
                        # fail-closed noise. Defer its evidence with the valid
                        # candidate so their byte order cannot be inverted.
                        post_acceptance_matches.append(result)
                        post_acceptance_reasons.append(str(validation_error))
                    continue
                if cursor is None:
                    follower.prepend_records(records[index + 1:])
                    return result
                if accepted is None:
                    accepted = result
                    post_acceptance_matches.append(result)
                    post_acceptance_reasons.append(None)
                    trailing_poll_required = True
                else:
                    post_acceptance_matches.append(result)
                    post_acceptance_reasons.append(None)

            if accepted is not None:
                # Do not expose a transient pass. Drain complete adjacent
                # records through one quiet poll (and wait out a partial
                # record) before committing the unique valid candidate.
                if trailing_poll_required:
                    trailing_poll_required = False
                elif not records and not follower.carry:
                    if len(post_acceptance_matches) > 1:
                        raise GateEvidenceError(
                            f"gate {gate.name} observed duplicate or conflicting post-cursor "
                            "records after independently validating each readiness candidate",
                            tuple(post_acceptance_matches),
                            tuple(post_acceptance_reasons),
                        )
                    follower.prepend_records(records_after_acceptance)
                    return accepted
            time.sleep(poll_seconds)
        if accepted is not None:
            raise GateEvidenceError(
                f"gate {gate.name} did not reach a complete quiet record boundary "
                "after its valid candidate",
                tuple(post_acceptance_matches),
                tuple(post_acceptance_reasons),
            )
        on_timeout(gate, attempt, recent)
    raise HarnessError(
        f"gate {gate.name} timed out after {gate.retries + 1} attempt(s); "
        f"last log lines: {' | '.join(recent[-8:]) or '<none>'}"
    )
