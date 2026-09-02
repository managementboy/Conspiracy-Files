# PM-GOV-001 — Integrity Evidence and Promotion

**Status:** Accepted

**Scope:** Any change that can affect canonical save validity, chronology, physical item identity, presentation authorization, release contents, or acceptance claims.

## Ruling

An integrity-sensitive candidate is promotable only when all of the following evidence exists for the exact candidate commit:

1. Positive behavior and adversarial negative behavior are both exercised. A happy path alone is insufficient.
2. Raw generated artifacts are inspected, not merely the command exit code or a summarized report.
3. Persistence evidence includes valid round trips plus corruption, partial-state, conflicting-state, tampered-state and structurally compatible older-content cases where applicable. Every rejected replacement preserves the last known-good canonical root.
4. Independent offline QA passes before any new live-preparation claim. A production-code change after that QA invalidates the result and requires independent QA again on the new commit.
5. The changed range is explicit and fail-closed. Range validation must reject a missing base, include all intended commits, and audit unexpected paths, removed-feature residue, localization coverage, release metadata and stale documentation.
6. Evidence is traceable from the owning decision and acceptance criterion to the exact offline command/output and, where required, the exact live matrix. Offline evidence never substitutes for a live criterion.

## Required record

The handoff for a candidate records repository, branch, base, exact commit, commit range, commands, raw artifact paths/checksums where artifacts exist, failures and limitations. It distinguishes historical mechanism evidence from current production-invariant evidence and states whether any live runtime was launched.

## Promotion boundary

Passing local implementation tests permits independent offline QA only. Passing independent offline QA permits preparation of the named live matrices only. Live acceptance, prerelease, cross-device testing and public distribution retain their own gates; this policy does not grant or imply any of them.
