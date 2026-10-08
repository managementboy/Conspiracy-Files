# CF: No Help tickets

Tickets are opaque serials: `T0000`, `T0001`, ... The serial is the only name a
ticket has anywhere the owner can see it: file names (`incoming/T0003.json`),
row ids (`t0003-01`), commit messages, CI output and `STATE.md`. The owner plays
blind, so what a serial is about never appears outside the writer-only folder.

- **The mapping is writer-only:** `docs/writer-only/nohelp-tickets.tsv` holds
  serial, type (STAGE0, PLACE, PERSON, MAP, SCENE, UNIQUE), target, status
  (open, blocked, delivered, accepted, deferred, closed), attempts, opened and
  closed dates. Claude opens and closes tickets there.
- **The writer takes the lowest open serial** (status `open`, not `blocked`),
  delivers `incoming/<serial>.json` with row ids `<serial in lower case>-NN`,
  and commits with the serial only (e.g. `T0003 delivery`).
- `T0000` is stage 0 (the axiom list and glosses, handoff section 5); the
  converter leaves it in `incoming/` for Claude's sign-off
  (`approved/axioms.json` plus `approved/SIGNOFF` holding its sha256).
- A file in `incoming/` whose serial is not in the registry is reported as
  `ORPHAN_TICKET` by `tools/nohelp_content/progress.lua`.
