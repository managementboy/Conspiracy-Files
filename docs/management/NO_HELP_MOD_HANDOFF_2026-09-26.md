# "Conspiracy Files: No Help" — handoff

Written at the point the second mod first booted clean, standalone and
alongside the original, in the same Claude Code session that built it.
Read this before touching `mod-nohelp/`.

## The mod in one paragraph

A second, independent Project Zomboid mod extracted from this repo's own
`mod/` (Conspiracy-Files: Dead Air), containing only module A's
interaction hooks and module B's mystery/case-generation engine — no
PDA, no Knox.OS, no physical organiser item at all. Per the owner's own
instruction: *"Assume that we do not have an organizer in the future"*.
Intended as a separate Steam Workshop item, with a different front-end
built on top later.

## State at handoff

`HEAD fcb95bb` on `main` (this repo), not pushed to `origin` — check
`git log origin/main..main` before assuming it's shared anywhere yet.
No branch of its own; it landed as ordinary commits on `main` alongside
the blueprint that specifies it.

Read in this order:
1. `docs/design/MODULE_SEPARATION_2026-09-26.md` — the original three-way
   split (A/interaction, B/engine, C/PDA) this mod is extracted from.
2. `docs/design/MODULE_EXTRACTION_BLUEPRINT_2026-09-26.md` — the actual
   blueprint, sections 0 and 6 especially: the real cross-mod collision
   risks found (Lua globals, ModData tags, a translation key, two on-disk
   filenames, a duplicated Lua file path) and the corrected build order
   (rename before extraction, not after).
3. `mod-nohelp/` itself — the built package. `mod-nohelp/42/mod.info`:
   `id=ConspiracyFilesNoHelp`, distinct from the original's
   `id=ConspiracyFiles`.

## Verified, for real, not assumed

- Every `.lua` file under `mod-nohelp/` parses clean (`luac5.4 -p`).
- Every `require("NHShared/...")` path resolves to a real file inside
  the package (checked by grepping every require call site against the
  actual file tree — one exception, closed: `InteractionAPI.lua` no
  longer requires the now-absent `Organiser.lua` at all, rather than
  relying on this build's `require()` returning `nil` for a missing
  module, which it does, but which is a worse failure mode to lean on
  than removing the dead reference outright).
- **Standalone boot**: on a scratch branch (discarded, never merged),
  every module-C file plus `Organiser.lua`/`CaseFile.lua` were `git rm`'d
  from the *original* mod and the real boot-check autotest
  (`tools/autotest/boot_check.sh`, visible game window, real GPU, no
  `--hidden`) run against what remained: 146/146 files loaded, 0 errors.
- **Co-install boot, the real test** (not simulated): both the original
  mod and `mod-nohelp/` synced into this machine's own
  `~/Zomboid/mods/` (`ConspiracyFiles` and `ConspiracyFilesNoHelp`),
  both listed active in `~/Zomboid/mods/default.txt`, booted together
  for real. First attempt failed — `shared/Fieldnote/Geometry.lua` had
  been copied into the new mod by mistake (it belongs only to
  `OrganiserScreen.lua`, not part of this mod) and two mods shipping the
  identical relative Lua path is exactly the file-path collision the
  blueprint's section 0 predicted; a single-mod check could not have
  caught it. Deleted the stray file, re-ran: **157/157 files loaded, 0
  errors**, both mods' own startup log lines printed independently.
  Confirmed live via `pz.sh eval`: `ConspiracyFiles` and `NHShared` are
  genuinely distinct table objects; `ConspiracyFiles.Organiser` exists
  (the original ships its item); `NHShared.Organiser` is `nil` (this mod
  correctly has none); `CFInteract`/`NHInteract` hold separate, correct
  entry counts with zero cross-contamination.

**This machine's local test state, left as-is at handoff**: both mods
are still synced into `~/Zomboid/mods/` and both still listed in
`default.txt`. Anyone continuing this needs to know that before
assuming a fresh `pz.sh start` is testing the original mod alone.

## NOT verified — do not treat as working

- **Never played.** Every check above is a boot/load check (files
  present, no Lua error, globals distinct). Nobody has actually walked
  around, found a clue, or watched the mystery engine produce a case in
  this extracted mod specifically. `AutomaticInvestigations.lua` firing
  a real case end-to-end, with no `Organiser`/`CaseFile` in the picture
  at all, is unverified.
- **The emit-based decoupling this mod depends on** (`Organiser.lua`
  emitting `organiser.open`/`.close`/`.boot` instead of calling the PDA
  directly, `OrganiserPDABridge.lua` owning the two-way sync) is real,
  committed, and boot-verified *in the original mod* — but this new mod
  doesn't ship `Organiser.lua` at all, so that machinery is moot here.
  What matters for this mod is only that nothing it *does* ship still
  reaches for a `PDAAPI`/`Organiser`/`CaseFile` name — checked with
  `grep`, confirmed clean, not re-verified by actually playing.
- **Steam Workshop publication has not happened.** This is a local,
  boot-tested package sitting in the repo, not an uploaded listing. No
  Workshop item id exists yet for it.
- **No new front-end exists.** The owner's own framing — "I am thinking
  of changing the game mechanics on the front-end" — means this mod's
  actual point (something other than a PDA sitting on top of A+B) is
  still unbuilt. What ships today is the *engine with nothing on top of
  it*, correctly isolated, not a playable feature.
- **`module_coinstall.sh` and `module_extraction.sh` as reusable scripts
  do not exist yet.** Both are specified in
  `MODULE_EXTRACTION_BLUEPRINT_2026-09-26.md` section 4 and were run
  *manually*, by hand, for this one extraction (`git rm` on a scratch
  branch; a manual `rsync` into `~/Zomboid/mods/` and a hand-edited
  `default.txt`). Turning that manual sequence into an actual checked-in
  script under `tools/autotest/checks/` is real, not-yet-done work — the
  blueprint names it as the reusable part for whichever module subset
  gets extracted next.
- **The collision audit may not be exhaustive.** Three collision classes
  were found and fixed (Lua globals + file paths, ModData tags, a
  translation key + two on-disk filenames) by grepping for the string
  `ConspiracyFiles` across the copied tree - not by a systematic pass
  over every file type PZ mods can carry (item/recipe scripts, sandbox
  options, `mod.info` `requiredMods`). None of those turned out to be
  live risks *in this specific repo* when checked, but "checked and
  found none today" is not the same guarantee as "structurally cannot
  happen" for whatever gets added to either mod next.

## Rules that are not negotiable (inherited from the original mod)

- **Never delete, reset or rewrite a player save.** This applies to
  `~/Zomboid/Saves/` on this machine the same as anyone else's.
- **The player tests in game. Do not automate their play.** Every
  verification above was a boot/load check or a scripted `pz.sh eval`
  query - never a substitute for someone actually playing this mod.
- **A silent early return is a bug you cannot find.** This is exactly
  why `Organiser.lua`'s old direct reads of `PDAAPI`/`Organiser` were
  worth removing outright rather than leaving as a `require()` that
  happens to return `nil` - see the original mod's own
  `docs/design/MODULE_EXTRACTION_BLUEPRINT_2026-09-26.md` section 4 for
  the exact finding.

## Next planned work, in order

1. **Decide and build the actual new front-end.** Nothing here is
   useful to a player until something replaces Knox.OS. This is the
   owner's own stated reason for the whole extraction.
2. **Play it.** A real save, a real case, start to finish, with only
   this mod installed - the thing the boot checks above cannot
   substitute for.
3. **Turn the manual extraction/co-install steps into real scripts**
   (`tools/autotest/checks/module_extraction.sh`,
   `module_coinstall.sh`) per the blueprint's own section 4, so the
   *next* subset extraction (or the *next* release of this one) doesn't
   repeat this session's by-hand `git rm`/`rsync`/`sed` sequence.
4. **Decide on Workshop publication** once (1) and (2) are real -
   register a Workshop item, and re-run the co-install boot test against
   the actual uploaded build before announcing it, not just the local
   package.
