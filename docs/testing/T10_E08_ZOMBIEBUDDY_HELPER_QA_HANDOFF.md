# T10/E08 bounded ZombieBuddy helper — QA handoff

**Status:** engineering complete; independent offline QA required; no live run
performed or accepted

## Candidate under review

- Branch: `engineering/2026-09-04-zombiebuddy-helper-contract`
- Base: `e9c09b1a5b30d3decb419cbd467bc33f75f81141`
- Scope: ADR-0006 and `dev/t10-zombiebuddy-helper/` only, plus the linked
  authoritative decision, acceptance, presentation, live-inspection and
  provenance documentation.
- Production payload: unchanged; expected deterministic `mod/` tree checksum
  `02947f3b32fa86f1971ac8b1f9fb15b7a13d2d9a7f1cffc0e814f8a7f3013357`.
- Helper artifact: `dev/t10-zombiebuddy-helper/artifacts/zombiebuddy-helper-v1.py`,
  SHA-256 `2ae0dba1a79c1972d193efad119b05515a3364316b46fcb6ba3f5ede3f082963`.
  Its required adjacent sources are `contract.py`
  (`940e95a9d5c66aa1cbf0c1e5e0a3a732897e3e1010cea6541e244a86f6600030`) and
  `helper.py` (`b56c8815efba1a303c35ba3a732ab8169ccae3d2468aa982486563607a21600d`).

## What QA must verify independently

1. Fresh-clone the candidate with no origin, alternates, hardlinks or shared
   tracked-file/Git-object inodes with the source being audited.
2. Confirm `git diff e9c09b1a5b30d3decb419cbd467bc33f75f81141 -- mod` is
   empty and recompute the stated production checksum with the repository
   `tree_checksum` helper.
3. Read ADR-0006 and P4-R44/P4-R45. Confirm that only the historical
   T10/E08 manual-only clause changed; the former decision remains historically
   described, and all non-fixture automation remains prohibited.
4. Run, inspect raw output from, and retain results for:

   ```bash
   dev/t10-zombiebuddy-helper/test/run.sh
   dev/live-inspection/test/run.sh
   lua5.1 test/run.lua
   git diff --check
   ```

5. Inspect the contract refusal cases: wrong game version/provider/checksum,
   stale or drifting process/window/display/save/payload identity, duplicate or
   non-contiguous actions, direct-world pane, arbitrary input verb, Ground Mark,
   missing foreign-handler/gateway/cleanup proof, and over-budget action count.
6. Confirm the retainable evidence shape contains exact helper provider/version/
   SHA-256, runtime identity, bounded action ledger, raw-event SHA-256 and
   sanitized raw event lines; it must not retain bodies, physical tokens,
   secrets or hidden truth.

## Live boundary and stop rules

No QA step above authorizes installing, downloading, activating or configuring
ZombieBuddy; launching Project Zomboid; changing a save, controls, vanilla
files, security settings or power state; or entering normal play. Stop with no
retry on any identity/provenance/checksum/focus/process/cleanup discrepancy.

Only after independent offline QA passes may the owner separately approve review
of an actual pinned helper adapter and a disposable Build 42.20.4 matrix. That
future run must use only `t10-e08-disposable-fixture-v1`, player or Ground/loot
inventory panes, and the 96-action vocabulary. It must preserve vanilla and
foreign handlers, never assume direct-world right-click support, and must not
claim T10 or CF-V01-E08 acceptance from helper command success alone.

Engineering did not copy the artifact into the installed ZombieBuddy location,
enable it, launch Project Zomboid, or execute the live matrix.
