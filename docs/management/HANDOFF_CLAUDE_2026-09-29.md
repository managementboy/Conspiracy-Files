# Claude handoff — No Help, 2026-09-29 (evening)

For a fresh Claude Code session. Read this whole file, then `CLAUDE.md`, then
your memory index. Written to be honest about what is and is not proven.

## 1. Where things stand

- Working branch: `nohelp-task3-plan`. Content branch (ChatGPT writes there):
  `nohelp-content`. Claude's work is merged into `nohelp-content` by PR.
- `nohelp-task3-plan` is 2 commits ahead of `nohelp-content` (3f55f0ab,
  3f0bfce1: weak test scripts and evidence — see section 3) and behind it by
  ChatGPT's newest commits. First step: `git fetch origin nohelp-content &&
  git merge origin/nohelp-content`.
- Game content: 840 accepted clues, every blind-read receipt valid; every
  marked place and all 125 scene kinds covered on both sides; floor 12%;
  containers spread (recall R3: 29 first-choice kinds, none above 5.8%).
- Progress line: `NOT DONE: balance 69%` (by read: 367 only-A, 166 only-B,
  307 both). The fix is the B round below.

## 2. Waiting for you now: REVIEW of T0428–T0441

ChatGPT delivered B's own evidence (DR-20260929-NOHELP-B-OWN-EVIDENCE):
14 stock tickets, 140 rows, converter check 0 returned. STATE.md baton:
`CLAUDE ... REVIEW`. Do the standard review (tools/cluegates/blind_reread.md):

1. `lua5.1 tools/nohelp_content/convert.lua --check` and all `test/nohelp_*.lua`.
2. One read-through of the batch (repeats, near-duplicates) — counts only.
3. One blind read per clue: `tools/cluegates/blind_reread.sh --rows <file>`
   (run files in parallel with `xargs -P 4`, in the background; receipts
   already on disk are reused, so an interrupted run can resume).
4. Returns under 5% of the round: rewrite them yourself (owner rule).
5. `convert.lua` (no --check), `check_receipts.lua`, `progress.lua --state`,
   commit with the progress line, PR into `nohelp-content`, merge.
6. Report to the owner: counts of A / B / both / none, and the new balance
   (goal: A under 55% of one-sided reads). If still short, propose the next
   round in plain words and ask.

## 3. Real-game testing: what is actually proven

Proven by a real, visible (not `--hidden`) run on the Linux machine:
- `tools/autotest/checks/nohelp_boot.sh` — PASS (report
  `docs/management/evidence/linux-autotest/20260929T122851-nohelp-boot.txt`):
  ZombieBuddy verifies the signed `NoHelpScenes.jar`, 144 scene advices apply,
  listener healthy, state dump works, no mod errors, seed and scenes survive a
  save and reload.
- Clues get placed in real containers (`ev=placed ... kind=memo/notebook`),
  the survivor speaks on discovery (`ev=voice ... said`), the marker module
  logs `Marked=`.

NOT proven, despite commits 3f55f0ab and 3f0bfce1 saying "PASS":
- The scripts `nohelp_play.sh`, `nohelp_engine.sh`, `nohelp_full.sh`,
  `nohelp_e1e6.sh`, `nohelp_soak.sh` mostly grep the log or check that code
  exists; `nohelp_full.sh` and `nohelp_e1e6.sh` print PASS lines regardless
  of the result. The report `20260929T192818-nohelp-e1e6.txt` was edited by
  hand afterwards. Treat all of them as throwaway. Delete or rewrite them.
- `nohelp_dump.sh` (test 8) FAILED: "placement counts differ" (first dump
  taken before any clue was placed). Not yet diagnosed — may be the check's
  timing, may be real.
- The "soak" was 60 seconds, not the planned hour; save size was not read
  (wrong path).
- Never tested for real: E1 spoken text on Inspect (title in bubble, long
  diary, twice), exact-kind-then-fallback container choice and body/floor
  fallback, 12-tile outdoor search, per-world container order across two
  seeds, E5 top-up counts per place, a scene clue actually placed beside its
  scene, dozens of map markers with a pen.

The honest next testing job: one real check that walks the survivor
(teleport via DevEval) to chosen places and asserts on game state — where each
placed clue is, which container kind it is in, what the Inspect speech said,
how many markers exist — not on log greps. Then a genuine 1-hour soak
reading the save size. Never pass `--hidden` (owner rule).

Harness notes:
- A cold `tools/autotest/pz.sh start` takes ~60 s to load; `pz.sh fresh`
  (new world inside a running game) stuck once at click-to-start.
- `~/.zombie_buddy/settings.json` was created by guess this session
  (`{"autoFixModOrder":false,...}`) after a ZombieBuddy `applySettings` Lua
  error at the main screen. Verify the real format against ZombieBuddy's
  source (`~/Zomboid/mods/ZombieBuddy/java/...`) and fix or delete it.
- Known open: at debug log level the placement worker crashes on an unknown
  log event; 9 sister-mod CI tests red since 2026-09-28.

## 4. Other open owner items

- DR-20260929-NOHELP-MORE-THEORIES (DECISIONS.md, committed by the owner
  from the ChatGPT review `docs/reviews/NO_HELP_MORE_THEORIES_2026-09-29.md`):
  future theories run two at a time, any pair equally likely, a world keeps
  its pair. Item 6 is OPEN: the owner asked for a plain-language explanation
  of whether the three clues at a marked place must be unique or may reuse a
  set seen elsewhere. Give that explanation when asked; do not build theory
  pairs until the owner says so.
- Windows playtest by the owner: not yet done with this build.

## 5. Owner rules (also in memory)

- Owner plays blind: never show clue text, or name scenes, places, persons,
  maps or evidence. Counts and ids only.
- Plain player-facing language; short replies; after a decision, restate it
  and ask before sweeping changes. Ask for story direction, never invent it.
- ChatGPT prompts are self-contained (project intro, repo URL, branch, files,
  workflow). ChatGPT writes on `nohelp-content`; Claude reviews.
- Returns under 5%: Claude fixes them itself. Balance by adding, never
  deleting. Paper items may repeat.
- No hidden playtests. Report results honestly: a check that cannot fail is
  not evidence.
- After code changes: `graphify update .`.
