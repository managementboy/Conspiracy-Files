"""Pinned source artifact for ADR-0006.

This artifact is intentionally a source-only copy of the offline helper
boundary. It has no third-party dependency and no process/input/PZ access.
The profile records its SHA-256; any reviewed bridge must replace it with a
separately audited artifact rather than mutating this file in place.
"""

from helper import ZombieBuddyT10E08Helper

__all__ = ["ZombieBuddyT10E08Helper"]
