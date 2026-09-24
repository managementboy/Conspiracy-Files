# Map trails, round 2: what the review changed

**Status:** proposal, not built. Second round.
**Round 1:** [`MAP_TRAIL_SHAPE_PROPOSAL_2026-09-24.md`](MAP_TRAIL_SHAPE_PROPOSAL_2026-09-24.md)
**Reviewer:** external (ChatGPT), reviewing round 1.

Round 1 was wrong on three of its four substantive points. This document records
what the review changed, what I still dispute and why, and the spec that
survives. It is written to be reviewed again.

---

## 1. Conceded, with verification

### 1.1 The argument for Problem B was weak; the review's is correct

Round 1 argued for authoring freedom from variety: 125 maps, 17 stories. The
review dismantled it correctly — 125 *bindings* to 17 reusable stories says
almost nothing about what one player sees in one campaign.

The real argument is one I had not found, and the review did. From
[`CENTRAL_MYSTERY_REVIEW_2026-09-19.md:19`](CENTRAL_MYSTERY_REVIEW_2026-09-19.md):

> *"Intermediate stops are optional, not compulsory padding."*

That is a recorded design direction from 2026-09-19. `MapMediaContent.lua:16`
asserts `#f.parts==4`, which makes intermediate stops **compulsory**. The code
contradicts a recorded decision. That is the case for Problem B, and it is much
stronger than the one round 1 made.

### 1.2 The pool proposal is dead

The review's reasoning is the reasoning round 1 should have followed to its own
conclusion: the third comparison synthesises **all** sources
(`requirements={{1,2},{3,4},{1,2,3,4}}`, `MapMediaContent.lua:191`). A draw from
a pool cannot retain an authored synthesis without authoring every possible set.
Pairwise lines lose the synthesis; coherent triples are fixed variants wearing a
hat; derived prose is banned. Round 1 listed the synthesis as a *cost of one
escape* and failed to notice it was fatal to the whole proposal.

### 1.3 The "cheap fix" was wrong, and also unnecessary

The review rejected appending a destination line to a found record on two
grounds: it is mechanically generated prose, and making an independent record
refer to the unsigned map's mark asserts a connection the record may not
support. Both correct — and it is the exact discipline applied elsewhere in this
codebase, where the payoff explicitly refuses to name a map's author.

Verification found a third reason the review did not have: **the authored
sources already name the destination.** `{place}` appears 39 times across
`MapMediaServiceStories.lua` and `MapMediaCivicStories.lua`, resolving to
`binding.label` (`MapMediaContent.lua:93`). The records already say where, in
the author's own voice. The fix was redundant on top of being wrong.

### 1.4 The retention diagnosis was unverified

The review caught a straightforward error: round 1 claimed the 120-tile gate
"silences the trail exactly when the player has wandered furthest". Backwards.
The gate measures distance from the player to an **unfound placed fragment**
(`MapMediaState.lua:107`), so wandering away from it *opens* the gate.

The larger concession: round 1 asserted a retention problem from reading gate
conditions, without measuring whether trails actually produce finds. The review
is right that exposure depends on eligible containers and whether the player
searches them, neither of which round 1 considered.

**Retention is withdrawn as a problem statement** until measured. Proposed
measurement, before any fix is designed:

- over N seeded trails, how many produce a first find, and after how many
  in-game hours;
- how often `nextFragment` returns nil, and which gate refused;
- how often a placed fragment is never found.

---

## 2. Disputed

### 2.1 "Two-part trail" read literally destroys authored content

The review's §4 proposes a two-part trail. Read literally — every trail is two
parts — it orphans roughly half of the existing authored corpus:

| | count |
|---|---|
| stories | 17 |
| authored sources | **68** |
| authored comparison lines | **51** |
| sources that are physical objects | **0** |

Read together with the review's own §2 ("give each incident its own fixed,
authored source set"), it means *variable-length fixed sets with two as the
floor*. That reading is coherent and is what this spec adopts. The literal
reading is content destruction and is rejected.

### 2.2 The change is smaller than either round assumed

Both rounds treated variable length as expensive. It is not.
`MapMediaState.lua` already stores fragments as a sparse table validated as
`integer(part,1,3)` (line 52). **State already permits one, two or three
fragments.** No schema change, no save migration.

What forces the padding is only:

- `MapMediaContent.lua:16` — `assert(#f.parts==4)`
- `MapMediaState.lua:98,103,111` — three `for part=1,3` loops in `nextFragment`

### 2.3 One case the review could not know about

`MulStashMap11` and `MulStashMap16` share a destination, and `sharedFinding`
(`MapMediaContent.lua:204`) requires **all four parts of both files** before its
line appears. A variable-length shape must either rework that requirement or
drop the shared finding. It is one authored line covering one pair of maps; I
would rework rather than lose it, but it is the only true migration cost found.

---

## 3. The spec that survives

### 3.1 Story-driven chain length

`parts` becomes 2 to 4. A story declares what it earns:

```lua
assert(type(f.parts)=="table" and #f.parts>=2 and #f.parts<=4,
    "a map story needs a payoff, a local record, and no padding beyond what it earns")
```

The **last** declared part is always the payoff and remains destination-bound.
Earlier parts are local fragments. `nextFragment`'s loops become
`for part=1,localCount` where `localCount = #f.parts - 1`.

This implements the 2026-09-19 direction directly: a story that needs one local
record declares two parts; one that earns three declares four.

### 3.2 Comparisons keyed to named sources, not slots

Today: `requirements={{1,2},{3,4},{1,2,3,4}}` — positional, and the coupling
that killed the pool.

Proposed: each story names its own sources and keys comparisons to those names.

```lua
parts={ dispatch={...}, query={...}, manifest={...}, correction={...} },
order={"dispatch","query","manifest","correction"},   -- last is the payoff
findings={
  {requires={"dispatch","query"},   at="query",      text="..."},
  {requires={"manifest","correction"}, at="correction", text="..."},
  {requires={"dispatch","query","manifest","correction"}, at="correction", text="..."},
}
```

A comparison that names its sources cannot describe evidence the trail does not
contain — which is the defect `comparison_describes_evidence.lua` exists to
catch, and the one the pool would have reintroduced at scale.

### 3.3 A textless physical anchor at the destination

The review's strongest original idea, and the supporting number is worse than
either round argued: **0 of 68 map sources are physical objects.** The entire
map system is paper, while the scenario system is now ~69% object-bearing.

The destination gains one object alongside the authored payoff. It carries no
readable text, no case reference, and states only what is visibly true — the
rules already enforced for scenario objects by `object_rules.lua`,
`marked_objects.lua` and `premise_consistency.lua`.

Open: whether the object should be drawn from the existing rule-eligible
catalogue (`ObjectRules`, as scenarios do) or authored per story. Scenario
experience suggests per-story authoring, because a generic object carries no
claim.

---

## 4. What is explicitly not being built

- **The fragment pool.** Dead, per §1.2.
- **Appending destination lines to found records.** Dead, per §1.3.
- **Any retention fix.** Withdrawn pending measurement, per §1.4.

---

## 5. For round 3

1. **Is "last part is the payoff" the right rule**, or should the payoff be
   named explicitly? Implicit ordering is less code; explicit naming is harder
   to get wrong when a story is edited.
2. **Should the minimum be two or one?** A one-part trail — map points, payoff
   waits, no local record at all — is the purest reading of "intermediate stops
   are optional". It also means some maps offer nothing at all until arrival.
   Is that a better trail or an emptier one?
3. **The `sharedFinding` rework** (§2.3): keep it by requiring "all parts of
   both" rather than "all four of both", or drop it?
4. **Per-story authored object, or rule-eligible draw?** (§3.3)
5. **Is anything in §3 still solving a problem that has not been demonstrated?**
   Round 1 failed that test twice. The 2026-09-19 citation grounds §3.1 and the
   0-of-68 count grounds §3.3, but §3.2 is justified mainly by a defect that has
   not yet occurred in the map system — it occurred in the scenario system. Say
   so if that is too thin.
