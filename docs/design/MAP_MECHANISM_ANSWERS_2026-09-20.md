# Five answers, not a sixth revision

Response to `docs/management/reviews/` revision-2 review, which asked for five
compact decisions or artifacts and explicitly said **not** to produce another
expansive rewrite. The plan itself
(`MAP_MECHANISM_PLAN_2026-09-20.md`) is corrected in place at four points
(§6 below) and not restructured.

**Headline: the budget is far worse than either document said, and the finding
is now a test rather than an argument.** 7,826 bytes are spendable. Nine to
fifteen destinations are fundable. Not 125, and not the "sixteen trails" the
plan claimed.

---

## 1. The whole-save budget fixture — `test/map_feature_budget.lua`

Written, runs under PUC Lua 5.1, measures rather than subtracts.

```
MEASURED campaign 339764 + ordinary ledger 61843 (112 events) + reserved 73000 = 474607 of 500000
MEASURED reserve 17567 (case_archive headroom) -> SPENDABLE BY THE MAP FEATURE: 7826 bytes
MEASURED per event: ordinary average 553, long-ref payoff 903, short-ref payoff 411, coded no-place 225
MEASURED whole-catalogue state: 125 trail records 25699 bytes (206 each), 125 entry records 8449 bytes
```

| representation at all 125 destinations | cost | verdict |
|---|---|---|
| A every fragment and payoff a ledger event | 310,648 | over by 302,822 |
| B payoff in the ledger, fragments compact | 103,273 | over by 95,447 |
| C payoff with a short ref, fragments compact | 85,523 | over by 77,697 |
| D payoff coded, no place, fragments compact | 62,273 | over by 54,447 |

**Fundable destinations within the measured budget: 9 at an ordinary-cost
payoff, 15 at a coded payoff.**

**Where my revision-2 figures went wrong.** I said 88,460 bytes were available
to the ledger and 50 events were spare. Both were subtractions from a budget the
campaign store had *already* been measured against, so they double-counted the
ordinary ledger that `test/case_archive.lua` includes, and they ignored the
17,567-byte headroom that test asserts. The review's own arithmetic (237 events,
540,705 bytes) was closer but still understated it, because it treated the
reserve as optional. The real spendable figure is **7,826**.

**The reserve is justified, not chosen.** `test/case_archive.lua:336` asserts the
16-case archive must leave at least the 17,567 bytes the ten-case cap it replaced
left spare. Spending it would make the archive tighter than the thing it
replaced. If the owner decides to spend it, that is a decision to record, not an
accounting adjustment.

**What the review asked to be costed together, costed together:** ordinary
discoveries (112 events, 61,843 — already committed), destination payoffs
(225–903 bytes each, measured at three ref lengths), trail state (206 bytes a
trail), entry state (68 bytes a destination). Identity and connection history is
inside the 73,000 reserved for other roots and is not separately measured — that
is the one remaining gap in this fixture, and it can only shrink the 7,826.

**Answer to the review's "make fragments free" point: it does not rescue
anything.** Even representation D — fragments costing nothing at all, payoff
coded to a five-character ref with no place string — is over by 54,447. The
binding cost is not the fragments. It is one ledger event per destination
multiplied by the catalogue.

**Corollary the plan must absorb:** the funded-destination count is a **budget
quantity of roughly a dozen**, and "every annotated map ties in" cannot mean
every annotated map *in one save*. It can still mean every annotated map is
*eligible*, with which dozen are funded varying per playthrough — which is
`DR-20260920-NO-CONCLUSION`-shaped rather than a restriction, but it is a product
change and therefore the owner's, in §5.

**Registered, per the review's §2 point about `SaveBudget.lua`:** the two new
stores must be added to the `tags` table at
`mod/common/media/lua/client/ConspiracyFiles/SaveBudget.lua:3`. An unregistered
root is invisible to `B.check`, so writes to other roots would not account for
it. Test alternating ordinary-case and trail writes near capacity, not a trail
store in isolation.

## 2. Identity mapping

Four identities, previously collapsed into one. The review is right that "one
trail per destination" was suppression dressed as idempotency: two different
authored maps pointing at the same place are not duplicates, and a
destination-keyed trail would have swallowed the second map's testimony,
contradicting "every annotated map ties in".

| identity | what it is | what it keys | dedupes |
|---|---|---|---|
| **design id** | the authored vanilla item (`LouisvilleStashMap15`) | the authored binding: fragments, payoff, readings | nothing |
| **copy identity** | one physical item instance in the world | nothing persistent | reread, reload, repeated callback |
| **trail binding** | one activation of one design in one save | trail state, progress, scheduling position | a second copy of the **same design** reuses it |
| **destination id** | the place the marks resolve to | entry state, payoff anchoring | nothing — several trails may share it |

Rules that follow:

- A repeated copy of the **same design** reuses its existing trail binding.
- **Distinct designs keep their own bindings and their own contributions**, at the
  same destination or not.
- Replay (callback, reload, reread) is deduplicated against the **trail
  binding**, never against the destination.
- If several designs deliberately share one payoff, the grouping is **declared
  in the authored binding** and each source keeps its own fragments.

**Consequence for Phase 0, which the review is right to insist on:** the read
hook must identify the **actual annotated design**, not merely that a map item or
a map window was used. Detecting "a map was read" cannot select a binding. If the
hook can only report the generic item, the feature does not work as designed and
that returns to the owner — it does not get patched with a guess.

**Withdrawn:** revision 2's §12.2 suggestion that an identical duplicate copy
might spawn a second contradictory trail. Contradiction is the product, but it is
authored between *designs*, not manufactured out of a replayed callback.

## 3. The finite lifecycle

Revision 2 said "place the next unplaced fragment" and left progression,
exhaustion and retries undefined. The review is right that the two obvious
progression rules each fail: advancing on **placement** lets a player outrun the
whole trail without ever seeing a fragment, and advancing on **discovery** lets
one missed clue stall it forever.

**States:** `INERT` → `ACTIVE` → `EXHAUSTED`, with `ARRIVED` and `PAID` recorded
independently of all three.

| transition | rule |
|---|---|
| `INERT` → `ACTIVE` | the design is read **and** funded. An unfunded design stays `INERT` and records the read, so it is not silently forgotten |
| next fragment eligible | when the previous one is **placed** — but at most **one outstanding unfound fragment at a time**. Placement advances; the outstanding cap stops a moving player draining the trail |
| a missed fragment | does **not** stall it. After a bounded interval the outstanding fragment is **released** — it stays in the world, findable, but no longer blocks the next placement |
| no eligible carrier | the trail **defers** without consuming its turn and without blocking others |
| `ACTIVE` → `EXHAUSTED` | all authored fragments placed. The trail stops placing and stays open for arrival |
| `ARRIVED` | the player entered the authored building of the destination |
| `PAID` | the destination evidence was found **and** noted |
| arrival before payoff | arrival does **not** stop local placement. Stopping it on arrival is the accidental dead end the review names |

**Scheduling, replacing "none may starve" with something testable:** every
`ACTIVE` trail with an eligible carrier receives a turn within a bounded number
of scheduler passes; a trail without a carrier defers; scheduling position
survives reload. Tests: a stationary player, a fully searched neighbourhood,
several trails at once, repeated reloads.

**Carrier eligibility needs its own definition**, and the review is right that I
cannot assume an engine flag means "the player searched here". It must be
established against the mod's own discovery mechanics, tested separately from
ordinary inventory inspection. And the honest limitation, stated rather than
worked around: **a fully searched base cannot receive a new container fragment.**
The trail defers there; it does not add items to searched containers.

**Withdrawn:** "cannot orphan a physical item". Avoiding relocation removes one
failure path. Initial placement can still disagree with canonical state.

## 4. The placement gate, rebuilt around the new path

Revision 2's exit criterion was incoherent: it required avoiding an "identified
mechanism" while the mechanism stayed unidentified. Adopting the review's
answer — **the historical fault is labelled unresolved**, and the gate verifies a
specific contract for the new path.

The contract, each clause a check:

1. every logical placement has a **stable identity** and a **recorded intended
   carrier**;
2. a failed or refused insertion **cannot** advance to `placed`;
3. repeated callbacks and reload do **not** multiply one logical placement;
4. an unloaded or uninspectable carrier is **unknown** — not absent, and not
   verified present;
5. player collection, movement or destruction of an item does **not** trigger
   false insertion-failure recovery;
6. interrupted transitions have explicit recovery that preserves recorded
   evidence.

Exercised as controlled failures in domain tests **and** through the real
production insertion and persistence path in a running game — simulated failures
do not prove engine behaviour.

**Whether the old fault is in scope is a finding, not an assumption:** establish
whether the new path and the old rolling placement share placement or persistence
code. Where they do, verification covers that shared code.

**The release claim is bounded to exactly this:** this feature's specified
placement behaviour passed named checks; the historical mismatch remains
unresolved. Clean-run counts are not part of the claim.

## 5. Pilot acceptance — exact outcomes, and one authored example

Revision 2's matrix let "defined behaviour" pass as a criterion, which the review
correctly says permits almost anything. Exact outcomes for the pilot
(`LouisvilleStashMap15` + gallery brochure):

| situation | required outcome |
|---|---|
| read, never travelled | fragments appear near the player; payoff stays at the gallery, untouched |
| destination entered before the read | entry is already recorded; the read still activates the trail; payoff is placed and findable |
| map read inside the gallery | trail activates, payoff placed; the first fragment is placed on the player's next arrival elsewhere |
| arrival before payoff prepared | payoff placed before the carrier can be inspected, or arrival does not count as arrival yet |
| late arrival, weeks later | payoff present and findable; no expiry |
| carrier looted or destroyed | payoff moves to another authored carrier at the same destination; vanilla contents and effects unchanged |
| interrupted placement | trail returns to its prior state; no `placed` record without an object |
| reload at every stage | state, fragment positions and scheduling position identical |
| an **unfunded** map read | no trail, no placement work, no implied payoff — and the read is recorded, not forgotten |

**Timing, which the review is right to separate:** entry and preparation are not
the same event. Evidence must be available when the player can inspect its
carrier, and detecting entry may be too late to start preparing. The order gets
verified in a running game, not assumed.

**The funded-binding guard applies from Phase 1**, not only at town rollout.

### The complete authored example

Supplied because the review is right that without it nobody can judge whether
following a trail offers anything beyond recurring ominous prose. It needs no
hook.

**Local fragment — haulage docket, third carbon.** Knox Freight consignment
sheet. Fourteen crates, *unglazed*, consigned to "Gallery annex, receiving bay —
**hold for collection**". Signed for with initials only. The collection line is
blank.

- reading one: nothing was ever collected, so fourteen crates may still be there.
- reading two: the third carbon is the driver's copy, where the collection line is
  *always* blank. It means nothing at all.

**Destination evidence — receiving bay tally, week ending.** The same consignment
number appears twice. Upper line: *held*. Lower line: *released*, in a different
hand, **dated three days earlier**.

- **default reading:** the two lines disagree about the date.
- **police-officer reading** (`DR-20260919-Q03`/`Q16`): tally sheets are worked
  top to bottom, so a line sitting above an earlier-dated line was either entered
  afterwards and placed above it, or the sheet was reused from a previous week.
  Which of the two, the sheet cannot say.

Both readings rest on the **same source facts** — the consignment number, the two
hands, the two dates. The specialist reading adds a *procedural* observation, not
a conclusion. Nothing here says what was in the crates, who moved them, or
whether any of it connects to anything else, and the tally sheet contradicts the
docket about whether the consignment was ever collected — which is the product.

## 6. Corrections applied to the plan, and one that is not a defect

Applied in place:

- **Visited buildings.** "Every destination reads as unvisited" was **wrong**.
  `VisitedBuildings.has` still answers true for ids already stored
  (`VisitedBuildings.lua:33,43`); only buildings entered *after* the 256-id cap go
  unrecorded. The swallowed capacity reason is still real and still the reason not
  to reuse the store.
- **Gate count.** The plan said "two gates" and labelled three. Each gate now
  names the work it blocks and the work that proceeds regardless.
- **The consistency harness.** "Any document asserting a conclusion" overstates
  it. It checks specific patterns and contracts; those, and its limits, are
  described rather than summarised as a capability.
- **Capacity.** §5 is replaced by the fixture's measured figures and the fundable
  count.

**Not a defect:** the review's last §8 bullet reports a trailing `MD` marker,
shell commands, a commit message and an author trailer as accidental document
content. **None of that is in the file** — `grep` for `Co-Authored-By`,
`GRAPHIFY_SKIP_HOOK`, `git commit` and a bare `MD` line all return nothing across
all 400 lines, which end at question 5. It was picked up from the terminal
transcript around the file when it was copied. Nothing to fix, but worth knowing
for the next hand-off: paste the file, not the session.

## 7. What is still the owner's

1. **How many destinations get funded**, given that the measured answer is
   **nine to fifteen**, not 125. Fund about a dozen per playthrough with which
   dozen varying, or spend the campaign store (fewer ordinary cases) to buy more,
   or spend the 17,567-byte reserve.
2. **Essential-evidence recovery** — unchanged, and now sharper: a trail is an
   invitation the player honours by walking, and the acceptance table above
   refuses "an honest log" as fulfilment of it.
3. **Q31 sequencing** — the "survival connection" label still has to be earned by
   naming the interaction. Not claimed.
