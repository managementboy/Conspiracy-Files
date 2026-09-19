# Development plan — from the 19 September reconciled direction

Planning document. Nothing here is built. Written in plain language for the
owner; the decisions it implements are in [DECISIONS.md](../../DECISIONS.md)
under *Reconciled development direction — 2026-09-19*.

**Revised the same evening**, after review, in six ways: the groundwork is now
built around the first concrete pair of cases instead of ahead of all content;
the retention claim is bounded rather than permanent; the placement fix no
longer claims to guarantee solvability; the follow-up's completion criteria are
objective rather than a feeling; the occupation pilot's refusal policy is marked
as an open question rather than a decision; and map coverage follows a map's
destination rather than where the map was found.

The agreed order of focuses is fixed (`DR-20260919-Q31`): the personal opening
mystery, then a survival connection, then improvements to the current loop. The
milestone gate is unchanged (`DR-20260919-Q30`): passing technical checks.

---

# The committed increment

One increment, three parts, in this order. **No duration is given.** The
earlier three-week estimate was an estimate presented as a necessity; estimates
for everything after this increment are revised once it has actually landed.

The evidence rules and the retention change are built **for this pair of cases
and no further**. Generalising them across all content comes after the pair
works, not before it exists.

## A — Reproduce and fix the placement mismatch

A clue the record calls placed is sometimes not in the container it names.
Reported from my own long runs — three of nine, evidence under
`docs/management/evidence/linux-autotest/` — and not independently verified.

Three things are required, not one:

1. **Reproduce it.** A fault seen but not reproduced is not understood. Four
   possible causes remain and the diagnostic is in place.
2. **A targeted regression check** that fails if the fault returns. Not a clean
   long run — a clean run is weak evidence and proves nothing about the general
   case.
3. **A check that essential evidence which cannot be reached never silently
   counts as a delivered ending.** This is a separate failure from the
   placement bug and is the more dangerous of the two: a case that quietly
   completes without its evidence hides the problem instead of reporting it.

**Goal reached:** a specific, reproduced fault is fixed and guarded, and a case
that cannot be completed says so instead of pretending. Not "a mystery is
always solvable" — that guarantee cannot be established this way and is
withdrawn.

## B — The personal opening

The first case of a new save, built on the survivor's **actual starting
skills**. No invented employment history: the game gives occupations and skill
levels, not a biography, and the mystery hangs on what this character can
demonstrably do and notice. The electrician is the pilot because electrical
skill gives the clearest observations to build on.

Its payoff is written before its clues. It depends on no printed item and no
lucky drop. It still pays off for a player who plays it badly.

Carried with it, sized to this case only: the observed / claimed / supported
distinction where this case's findings need it, and enough retained source
context for its own findings to be reconsidered later.

**Goal reached:** the first hour of a new save is a mystery grounded in this
survivor's skills — the first focus of the agreed order.

**Finished when:** checks pass, and it plays through on a fresh save in the
real game.

**Open question, not decided:** what happens when a survivor's starting skills
give the opening nothing to work with. My recommendation was that the mod
refuse and say so, replacing the proposed unemployed fallback — that is a
recommendation, not an agreed decision, and it needs an owner ruling before it
is built either way.

## C — The follow-up, built to keep

A second case that follows a finding from the opening and can challenge how it
was read. Kept, not thrown away.

**Completion criteria — objective, per the agreed gate.** The earlier "feels
like one investigation" is withdrawn; it restored a subjective gate after that
was already settled. What must hold:

- **A sourced connection** — the follow-up cites a specific finding from the
  opening, with its source, not a repeated name.
- **Consistent chronology** — the two cases' events order correctly against the
  event record and against each other.
- **Meaningful new evidence** — the follow-up adds findings rather than
  restating the opening's.
- **Persistence** — the connection survives a save and reload, and survives the
  opening being retired.

Play feedback is still wanted, and is a source of requirements; it is not the
criterion.

**Goal reached:** the investigation demonstrably continues instead of
resetting. This is the specific gap the audit identified.

---

# Roadmap after the increment

Kept as direction, deliberately unestimated until the increment lands.

**Generalise the evidence rules.** Extend observed / claimed / supported across
all existing content, once the pair has shown what the distinction actually
needs to carry.

**Retention and growth.** Preserve source context and the player's own notes,
then **test growth across many cases** rather than asserting a limit. The
measured reserve below does not establish that findings can be kept
indefinitely — see the provenance section; the discovery ledger's cap is the
real wall and has not been tested at its limit.

**The survival connection.** The second focus of the agreed order: a mystery
that touches staying alive — a journey involving your base, or a skill or tool
that opens something up.

**Believable discovery.** The third focus: the ten dust masks in a place
already searched (`DR-20260919-SEARCH`); places going stale so one cupboard is
not searched forever; and settling the instalment timing, where the long check
assumes about four in-game hours and the rule says three in-game days.

**Annotated maps, by destination.** Support one town as a pilot: every
annotated map **whose marks point into that town** gets real evidence at those
marks, wherever the map itself was found. A map is honoured by its destination,
not by where it dropped. Each map's payoff is written before its clues.
Coverage is stated in release notes and development feedback, never in the
survivor's voice; vanilla maps behave exactly as they do now; universal
coverage stays on the books as unfinished work (`DR-20260919-MAP-PAYOFF`).

---

# Deliberately not in this plan

- The other 24 professions. One is a pilot; the premises still need approval
  under `DR-20260919-Q27`.
- Universal annotated-map coverage — the target, not the next task.
- A full campaign with a single ending destination. Rejected for this scope; a
  future possibility.
- A separate relationship graph (`DR-20260919-Q21`).
- Computer and CD-ROM discoveries (`DR-20260919-Q19`).

---

# Where the storage figures come from

Attached because they were being used to set policy without their conditions.

**Test:** `test/case_archive.lua`. **Code revision:** the archive code and this
test last changed at `7a63ed8` (2026-09-17); re-run on 2026-09-19 against the
working tree at `34ecdb4` and reproducing its figures exactly.

**Conditions:** 1,000 seeds, worst case per tier; the **synthetic location
fixture** (`test/fixtures/synthetic_locations.lua`), not the real world
catalogue; 7 documents a case; one worst-case save assembled from distinct
seeds.

**Figures:** live case 42,024 bytes; archived with rows 33,135; stubbed 3,130;
shrink 12,914 → 1,821 (−86%). Sixteen-case save: campaign 338,540 + ledger
61,843 + 73,000 reserved = 473,383 of 500,000, leaving 26,617.

**What these figures do not establish:**

- **The 73,000 reserve is an allowance, not a measurement.** Every other stored
  root is assumed to fit inside it. The 26,617 spare rests on that assumption.
- **Synthetic locations are not real ones.** Real addresses now carry street
  names and town qualifiers, so real per-case costs may differ.
- **Nothing about indefinite growth.** The figures describe a sixteen-case save.
  Sixteen is a storage ceiling, not a playthrough length, and the discovery
  ledger — 545 bytes for every document ever found, capped at 512 entries — is
  the real wall and has never been tested at its limit.
- **Therefore findings cannot be promised permanently.** The honest claim is
  that source context and player notes are preserved, and that growth is
  measured across many cases before any retention limit is fixed.
