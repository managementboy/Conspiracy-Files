# PM checklist — No Help, 2026-10-02

Tick when done AND pushed. Counts only; no clue text (owner plays blind).

- [x] 1. Review ChatGPT batch T0428-T0441 (checks, blind reads, fix returns, merge, balance report) - done 2026-10-02: 140 B-only 118, both 22, A 0, none 0; balance 56%, goal not met
- [x] 2. Diagnose the failed state-dump autotest (real bug or bad timing?) and fix
- [x] 3. Delete or rewrite the throwaway autotest scripts that print PASS regardless
- [x] 4. DONE 2026-10-02: debug-only Shift+L logs the nearest clue (ev=clue_where: id, status, x/y/z, place, vehicle part, distance); NHShared/ClueWhere.lua, test/nohelp_clue_where.lua. Offline only - not yet seen in the real game
- [x] 5. Trim log noise ("pane skipped: observer unsupported")
- [x] 6. DONE 2026-10-02 (6a+6b; offline only, not yet seen/heard in the real game; test/nohelp_clue_cue_spoken.lua). Clue-nearby cue - OWNER DECIDED 2026-10-02: more reliable (keep trying while near), more verbose, much more varied. [x] 6a reliability: DONE (re-roll every 3 s while near; not yet seen in the real game). 6b wording: OWNER DECIDED spoken lines (survivor says them, varied, never reveal the clue or theory); OWNER: Claude writes them (ChatGPT dropped as unreliable, 2026-10-02)
- [x] 7. DONE 2026-10-02: a clue in a container of the car you sit in counts as found (how=search) when the loot panel opens it; SearchedContainerWatch.findSeated, test/nohelp_seated_car_find.lua. Offline only - not yet seen in the real game
- [x] 8. DONE, engine already does it (object sets are reused as extra copies when fresh ones run out; written clues are never reused; a short place is reported, not refused). OWNER DECIDED 2026-10-02: a marked place prefers clues not seen elsewhere, but may reuse a set seen elsewhere if it must. 8a: check what the engine does now when unused clues run short
- [ ] 9. Queued, not scheduled (owner to prioritise): first-person record headings, PDA thread tracker, whole-map house numbers, 240-char cap question
- OWNER DECIDED 2026-10-02: NO further clue round to ChatGPT for balance now (balance stays 56%, target under 55%). Do not request one unless the owner reopens it.
