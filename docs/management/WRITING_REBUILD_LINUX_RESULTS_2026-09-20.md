# Writing rebuild: Linux build and validation results — handover back to Codex

**Tested commit:** `3abdeeb` (baseline `8cdf2c6` confirmed as ancestor), version
`DEV-0.46.0-writing-rebuild`. Fixes pushed on `main` through `82957ab`.
**Workshop: nothing published.** `DEV-0.45.1-map-media` remains the last release
tag. This candidate is **not validated** and must not be published as passed.

Machine: Linux dev box, Build 42.20.4 (`b0bbce05d5`). Hidden runs use software
rendering (Mesa llvmpipe), so no performance conclusion is drawn from them
except where stated.

---

## What passed

| Gate | Result |
|---|---|
| Kahlua parse | **PASS** — 124 of 124 files |
| Story sample export | **PASS** — 5,328 lines, clean exit |
| Package build | **PASS** — 124 Lua files, `DEV-0.46.0-writing-rebuild` |
| Boot check | **PASS** — 124/124 files loaded, player alive, **zero errors**, evidence album opened after 11 ticks (evidence `20260920T213141-boot.txt`) |

**The rewrite is sound as software.** It compiles, packages, starts and runs
clean. Everything below is content or one runtime regression, not structural
breakage.

**The writing itself is good.** Read end to end, the cases land the intended
register: a coherent event, three records that each add a fact, survivor notes
in the first person that observe without concluding, and dry institutional
comedy that pays off. From `transfer-nobody-arranged`:

> *"The bill was accepted, the mechanic returned on paper, and the yard got its
> zero. I can see what improved: the report."*

That meets the brief. Nothing below is a criticism of the prose.

---

## 1. BLOCKER, new and not in any earlier report: destination indexing no longer finishes

**This is the most urgent item and it is not a content gap.**

The map placement check **aborted** (`map-placement: indexing did not finish`),
so that gate could not run at all.

Measured directly afterwards on a fresh world:

| elapsed | `MapMediaRuntime.status()` |
|---|---|
| 15 s | `ready=true indexed=false peakMs=3` |
| 30–90 s | `ready=true indexed=false peakMs=10` |
| ~150 s | still `indexed=false`; **17 of 125** designs had resolved a building |

The world's metagrid holds 9,978 buildings. On the previous build
(`DEV-0.45.x`) indexing completed effectively instantly — the same wait returned
true on its first poll.

**Why it matters:** indexing is how the mod works out where each annotated map
actually leads. While it is incomplete, destinations do not resolve, so map
trails cannot be paid off and the placement gate cannot be exercised.

**Where to look:** `MapMediaRuntime` `indexStep`/scheduler. Something in the
rebuild made the per-step work much more expensive or the step budget much
smaller. Note `peakMs` settles at 10 against a 2 ms scheduler target.

---

## 2. Sources can never disagree — only one relationship kind is authored

The organiser renders three relationships between documents
(`EvidenceRows.lua:49`):

- `corroborates` → "Agrees with"
- `disputes-delivery` → "Does not match"
- `recontextualises` → "Adds context to"

**Every authored comparison in the rebuild is `recontextualises`** — 18 of them
across the scenario files, and not one instance of the other two. Measured over
600 generated seeds: 1,880 connections, all `recontextualises`.

**Why it matters more than a failing test:** contradiction between sources is
the product. As shipped, every connection a player can see is one document
*adding context* to another. Nothing ever contradicts anything, so the central
experience cannot occur.

Fails: `phase3_roles`, and the `generated 100-seed sample` spec (its last
remaining assertion is exactly `kinds.corroborates` and
`kinds['disputes-delivery']`).

**What is needed:** comparisons authored with `kind="corroborates"` and
`kind="disputes-delivery"` in the scenario families, with their `requires`
sources, so both relationships actually occur in generated cases.

---

## 3. There are no physical objects — every clue is a piece of paper

The slots for optional evidence exist throughout the content files and are
empty:

- `OrdinaryScenarios`: **all ten** `["optional"]` blocks are `{}`
- `InventoryScenarios`, `AdministrativeScenarios`, `CorrespondenceScenarios`,
  `PersonalScenarios`: no optional blocks declared at all

Measured: across 200 generated seeds, **374 documents, every one prose**
(dispatch, letter, notebook, notepad, receipt, clipping, transcript,
photograph, key as *written* kinds). Not one object-capacity carrier is ever
produced.

**Why it matters:** keys, photographs and the rest never appear as findable
things. The evidence-kind vocabulary supports them (`EvidenceKinds` still
defines `idcard` and friends) and the placement machinery supports them, but no
event declares any, so the feature is inert.

Fails: `object_rules` (expects ≥20 distinct objects across 400 cases, gets 0),
`marked_objects` (0 across 500), `pile_paperwork`, `evidence_role_carrier`
(`carrier idcard was never reachable across 400 seeds`).

**What is needed:** optional evidence authored into the events that should carry
it, per the rebuild's own rule that optional evidence belongs to its event.

---

## 4. Two remaining failures that are neither of the above

- **`room_affinity`** needs a deliberate fixture redesign, not a patch. Its
  assertions encode which container slot each kind should win under a
  two-clues-at-each-of-two-sites arrangement. The rebuild puts exactly one clue
  at the first site and the rest at the second (measured across 4,000 seeds), and
  one of its four required kinds (`idcard`) is never generated. Rewriting the
  expected slots would mean deriving expectations from current behaviour, which
  would bless whatever the code does. Left failing deliberately.
- **`investigation_flow`** tests `dev/next-phase/InvestigationFlow.lua`, a
  prototype outside the shipped mod. Its expectation is that the OLDER document
  is marked updated when a newer one recontextualises it; the implementation
  attaches the comparison to the document that *makes* it. Worth a decision on
  which is intended, but it is not shipped code.

---

## What I fixed (22 fixtures, suite 27 → 8 failing)

Commits `ea981b8`, `c85d81f`, `4120c2a`, `0b60fba`, `e17bc77`, `82957ab`.

Every fix was checked against the implementation first. **No bound was weakened
and no assertion was deleted to reach green.** Highlights:

- **Returning organisation** (`case_archive`, `case_budget_headroom`,
  `map_feature_budget`): a returning organisation now selects an event authored
  for that business, so 60 arbitrary characters named nothing and every seed was
  refused. They now find the longest genuinely steerable organisation at runtime.
- **Prose rewritten into the survivor's first-person voice** (six identity/key
  fixtures). The new text was read before each assertion moved; the refusals are
  intact and several read better.
- **`identity_observations` had become the naive-blacklist trap** its own
  neighbour warns about: banning `"the body is"` now caught the mod's own
  refusal, *"the body is still unidentified"*. It tests the claim instead.
- **Completion state**: every variant now declares its three records essential,
  so a lost clue is `incomplete-essential`, not `complete-with-gaps`.
- **Three fixtures had gone silently vacuous** and now test something again:
  `g2_smoke` stubbed a module through `package.preload` after it was already
  loaded (the real module ran, the stub was inert); `files_questions_row` never
  supplied the readings it asserted on; `story_archive` leaked a second return
  value through `assert()` into a function argument.

### Two corrections to my own earlier reporting

1. **Connections are not dead.** I first reported inter-document links as gone.
   I was reading `links` on the stored case, which is correctly empty because
   comparisons only exist once their sources are known. The projection carries
   them — 1,880 across 600 seeds.
2. **The case reference is not missing from 44 documents.** I reported 44 bodies
   omitting their case code as a coherence defect. All 44 carry it in the
   document **title**; none is missing it entirely, so a player can always tie a
   case's papers together.

---

## Two design consequences, noted rather than fixed

- Every generated variant declares all three of its records essential, so
  `complete-with-gaps` is now unreachable for a generated case: a single
  unplaceable clue kills the conclusion outright, where it used to finish with an
  acknowledged gap. Five completion states, one dead in practice.
- `Catalog.validate` no longer refuses an unrecognised container type (a
  consequence of widening furniture eligibility). A catalogue naming a container
  that does not exist now validates cleanly and simply never places anything.

---

## What is still unrun, and why

Gate 5 (map placement) **aborted** on item 1 above. All six native acceptance
gates are untouched, because they depend on destinations resolving and on the
placement gate passing.

**Order I would suggest:** fix indexing first — it blocks a gate and a whole
feature — then author the missing relationship kinds, then the optional objects.
The first is code and is yours; the second and third are writing.
