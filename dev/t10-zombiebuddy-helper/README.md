# T10/E08 bounded ZombieBuddy helper contract

**Status:** offline contract only; no helper binary is installed, configured or run.

This is the narrowly authorized replacement for only P4-R44's former T10/E08
manual-only procedure. It is not production mod code and does not grant any
general computer-control, game-play or unattended-live-run authority.

## Single permitted scenario

The contract admits only `t10-e08-disposable-fixture-v1` on Project Zomboid
Build `42.20.4`: the existing `ConspiracyFiles_T10_Probe` fixture in a newly
created `T10_cooperative_inspect_*` disposable save. It can address only the
player-inventory and Ground/loot inventory panes; a direct-world right-click is
not a supported target. The approved symbolic actions are bounded to 96 and
are the named context-menu Inspect/Mark, reader-dismissal and disposable reload
steps in the matrix. The contract accepts no coordinates, keys, selectors,
scripts, text, arbitrary commands or normal-play actions.

## Mandatory runtime admission

Before every action, an eventual separately reviewed adapter must prove the
same owned run ID; launcher-created process PID/start identity and executable
SHA-256; one mapped, active and focused PZ window; display; disposable-save ID
and SHA-256; and exact payload SHA-256. Duplicate action IDs, stale sequence
numbers, identity drift, unsupported version, duplicate window, focus loss,
unowned save, checksum failure, stale helper provenance, cleanup failure, or a
non-fixture action all fail closed with no retry.

The helper provenance is exactly `provider=ZombieBuddy`, its version and its
SHA-256. Evidence retains that provenance, runtime identity, bounded action
ledger, SHA-256 of the original raw event stream, and a raw-shape-preserving
sanitized event stream. Physical tokens, bodies, secrets and hidden-truth
fields are redacted before retention.

## Non-negotiable exclusions

Do not package this directory in `mod/**`; change vanilla files, saves,
controls, security products or power state; inject into PZ; restore the old
`runner.exe` path; use arbitrary or synthetic input outside the fixed action
vocabulary; automate normal gameplay; inspect hidden truth; or weaken the
existing live-inspection startup-only policy. No ZombieBuddy package, binary,
account, capability or configuration is present in this repository.

The fixture/probe must preserve all vanilla and foreign handlers. It may prove
only the existing cooperative T10/E08 matrix and never treats helper success as
E08 acceptance. A fresh independent QA pass and separately owner-authorized
live run remain required.

## Operator-only activation (not performed by engineering)

After independent QA, the live operator may copy the exact
`artifacts/zombiebuddy-helper-v1.py` source into the already-installed
ZombieBuddy extension location, verify SHA-256
`2ae0dba1a79c1972d193efad119b05515a3364316b46fcb6ba3f5ede3f082963`, and
configure only the contract in
`profiles/t10-e08-zombiebuddy-contract.toml`. Bind the launcher-owned Build
42.20.4 process/window/display, a newly created
`T10_cooperative_inspect_*` save, and exact probe/payload checksums before
starting. Run only the named fixture matrix; retain provenance/evidence and
archive the disposable save/extension during cleanup. Do not use the existing
`cf-live-inspect` unattended route, enable another capability, or retry a
failed check. Engineering did not perform these steps.

## Offline verification

```bash
dev/t10-zombiebuddy-helper/test/run.sh
```
