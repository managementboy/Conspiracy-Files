# CF: No Help content intake

Writer and engineer material. The owner plays blind and does not read the
files under this folder (only this README and the ones beside it, which hold
no content).

- `incoming/` — the content writer delivers one JSON file per ticket here
  (`<ticket-id>.json`), in the format of
  `docs/management/NO_HELP_CONTENT_WRITER_HANDOFF_2026-09-27.md` section 6.
- `accepted/` — rows that passed every check, game fields only; `sidecar/`
  keeps their authoring fields (rival reading, gloss, axioms, citations,
  provenance).
- `rejected/` — rows returned to the writer, each with reason codes.
- `approved/` — the signed-off stage-0 lists (`axioms.json`).

Run `lua5.1 tools/nohelp_content/convert.lua` from the repository root. It
converts every incoming ticket, then rewrites the derived clue file the game
loads (`mod-nohelp/.../NHShared/Mystery/Content/Clues.lua`). It prints counts,
row ids and reason codes only, never clue text.

The loop: `STATE.md` (who holds the baton, the ticket in hand, open returns),
`TICKETS.md` (opaque serials; the mapping is writer-only), `targets.lua`
(Claude-owned denominators and thresholds). `lua5.1
tools/nohelp_content/progress.lua` prints one line, counts only:
`NOT DONE: <failing gates>` or `DONE-CANDIDATE`. `convert.lua --check`
validates without writing. `.github/workflows/nohelp-content.yml` runs both on
pushes to the `nohelp-content` branch.
