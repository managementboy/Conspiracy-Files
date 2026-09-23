# Audit and repair: objects, maps, and the central conspiracies

Four questions, answered from the code, then fixed and tested.

## What was true before

| Question | Answer | Measurement |
|---|---|---|
| Do objects drive the mysteries? | **No** | 12 of 14 evidence kinds were paper. Of 4,547 catalogued Project Zomboid objects, scenarios used **12**. 1 of 58 reachable scenarios carried a physical anchor. |
| Are annotated maps used for it? | **Partly** | 125 real vanilla stash maps drive placement, with their own handwriting preserved. Their families are `repairs`, `housing`, `fuel` — not the conspiracy. **1 of 125** has an authored story. |
| Two or more hidden main conspiracies from the start? | **No** | One pair, hardcoded. `M.current()` returned it and `validate()` refused every other id, so nothing was ever chosen and nothing was hidden. |
| Are all mysteries bound to them? | **No** | Every case carried the pair as a stamp it never mentioned. Of 27 scenario `unresolved` lines, **1** touched a farm, sample, infection or animal. The other 26 were clerical. |

## What is true now

**Two hidden conspiracies, drawn from the save's seed.** `ConspiracyPair` is a
registry: *Farm Zero / Delivered Agent*, and a new *Failed Cordon / Drawn
Boundary* — was the cordon a containment that was overwhelmed, or a line drawn
to hold people inside a district already written off? Selection is stable
across reloads and never announced. Neither pair carries a winner; a winner
smuggled into a hand-edited save is still refused.

**Every mystery is bound, and the binding is checked.** Each scenario declares
an *axis* its evidence bears on — `movement`, `records`, `access`,
`protection`, `absence` — and each pair says how that axis reads under its own
question. The same clerical discrepancy bridges to the farm question in one
campaign and the cordon question in another. `Story.validate` refuses a
scenario without a valid axis. **58 scenarios bound**, plus the one authored
map place-story.

Content written for one conspiracy pins it: the Fitness opening's feed sack,
spent protective equipment and farm-connected client are a farm story, so it
declares `requiresPair` and never lands in a cordon campaign.

**Objects carry the mysteries.** The middle record — the one that contradicts
the opening claim — is now a real object in 30 scenarios across the
Administrative, Inventory and Ordinary families. **40 of 58 reachable
scenarios (69%)** carry at least one physical anchor, from 1 at audit.

A radio under another customer's tag. A bench saw cleaned but still blunt. One
crate stencilled 47 carrying two deposit chalks. Shingles batch-marked before
approval. Twelve unswung bats. A shut padlock behind a paid shift. A mill
shovel worn back an inch against a card calling its owner a new starter. A
cook's seasoned pan still on the range against final pay prepared before the
resignation. A ratchet beside parts whose HOLD tie has been cut.

Paper keeps its proper job: names, dates, destinations, and what somebody
claimed.

## Four product rules this work had to respect

Each surfaced only as a test failure, and each was respected rather than
worked around:

1. **`ObjectRules` eligibility.** "An authored scenario cannot smuggle a
   shotgun into a bedside drawer by naming it directly." Three picks were
   ineligible and were swapped.
2. **Marked objects.** A lone object carrying no name is noise. All 30 carry
   the case person's mark inside the 240-character object cap, and none claims
   more than the mark.
3. **The second person.** Object text replaced document bodies that mentioned
   `{P2}`, silently dropping a character from five cases. A real content
   regression, restored as a checking signature in each review record.
4. **No case reference on a thing.** Object names lost their `/ {CODE}`
   suffix: a case code stencilled on a radio is the mod writing on the world.

## Two test assumptions updated — both strengthened

Neither was relaxed to obtain a pass:

- `premise_consistency` required every anchor to render a calendar date.
  Documents still must; objects must now carry **none**, because a dated
  object means text was written onto a thing.
- `one_story` required every anchor to have a readable page distinct from its
  body. Documents still must; objects must now have **no page**, because
  nothing is written on a bench saw.

## A coverage hole found and closed

Every rule test passed the moment the first conversion landed — and the cases
were incoherent, because the comparisons still said *"the job record has them
beside the broken truck"*, *"the counter book has {P1} alone"*, *"the desk card
has {P1} on nights"*. Those documents no longer existed. Nothing related a
comparison's **words** to the evidence it compares.

`test/comparison_describes_evidence.lua` closes it: if a comparison relates an
object, it must mention that object. It found **twenty** incoherent lines,
including one in pre-existing owner-approved content — the Fitness vehicle
comparison related the cooler *to the feed sack* and never mentioned the sack.

The test was wrong twice before it was right, and both corrections were the
author's: a banned-word list cannot tell a correct mention of paper from a
stale one, and `requires` is a gate (which findings the player must hold), not
a claim that each is described.

## What is still not true

- **17 scenarios remain paper-only.** Correspondence (10) and Personal (6) and
  the two continuations are dispatch and clerical mysteries whose evidence is
  intrinsically documentary: a photograph with three figures and two names, a
  cut-out attendance page, a withdrawn telephone extension, a practice
  manifest, a refund envelope. The eligible object catalogue offers no drive
  belt, brake hose or hard hat, and substituting a generic screwdriver for
  "the vehicle went for a drive belt" would invent evidence the fiction does
  not support. Left paper deliberately, not overlooked.
- **124 of 125 annotated map destinations have no authored story.**
  `MapMediaContent` binds exactly one by id. The maps are the strongest
  evidence surface the mod has — somebody's own handwriting marking a real
  place — and they are almost entirely unwritten. This is the largest
  remaining content gap found by this audit.

## Verification

```bash
lua5.1 test/central_conspiracy_binding.lua
lua5.1 test/comparison_describes_evidence.lua
tools/autotest/unit.sh          # 190 run, 0 failed
tools/kahlua/run.sh --parse-all # 131 ok, 0 failed
```

Both regressions fail with their defect restored: collapsing the registry to
one pair fails with *"a single hardcoded pair cannot be hidden, because nothing
is chosen"*; removing any scenario's axis fails by name.

The bridge sentence and the axis lines are derived, never saved — storing them
cost 13,128 bytes of campaign state and broke the whole-catalogue headroom
assertion the first time it was tried.
