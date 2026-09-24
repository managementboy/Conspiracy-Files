# Map trails: retention and the four-part chain

**Status:** proposal, not built. Written to be argued with.
**Context:** Conspiracy Files, a procedural detective mod for Project Zomboid B42.

This document exists to be torn apart. It states what the code does today, two
problems that are easy to conflate, one proposal per problem, and the flaw in
the main proposal that I found while writing it. If you are reading this as a
sparring partner: the last section is the part I most want disagreement on.

---

## 1. What exists today (verified in code, not from memory)

**The content.** 125 vanilla annotated stash maps — real Project Zomboid items,
carrying the base game's own handwriting ("mom's trailer / remember: one bite =
death"). They select from **17 authored incidents**, chosen by theme words in
the map's own scrawl, falling back to the map's declared story families.

**The chain.** Every incident has exactly **4 parts** and **3 comparisons**:

- parts 1–3 are *local fragments*, placed near wherever the player happens to be
- part 4 is the *payoff*, placed only at the marked destination
- `MapMediaRuntime`: `if (choice.part==4) ~= atDestination(id,square) then return false end`

**The comparisons** are keyed to slot positions, not to content:

```lua
local requirements={{1,2},{3,4},{1,2,3,4}}   -- which parts must be held
local at={2,4,4}                              -- which part shows the line
```

**Placement is fully dynamic.** Nothing is reserved ahead of time. Candidate
containers are offered as the player loads squares; the payoff materialises only
when the player is at the destination. (This is worth stating because the mod's
*other* system — generated cases — does plan ahead, and needs a whole-map scan
of ~10,000 buildings taking 40+ minutes. The map system does not. Any proposal
here should preserve that.)

**Fragment cadence**, from `MapMediaState.nextFragment`:

```lua
if at < t.at + 2 + t.seed%5 then return nil end   -- first: 2–6 in-game hours after the read
... if at - p.at < 6 then return nil end          -- then: >=6 in-game hours apart
... if dx*dx + dy*dy < 14400 then return nil end  -- and not within 120 tiles of an unfound one
```

A missed fragment is **re-offered** later. The state comment is explicit:
*"Three logical fragments do not mean three chances."*

**Where the chain is hardcoded** — three layers, which is why "just change the
number" is not small:

| Layer | Constraint |
|---|---|
| `MapMediaContent` | `assert(#f.parts==4)`, `assert(#f.findings==3)` |
| `MapMediaState` | `integer(part,1,3)` for fragments, `part==4` for payoff |
| `MapMediaRuntime` | `for part=1,4` loops, `part==4` branches |

**Budget ceiling.** At full catalogue the save has ~22,289 bytes of headroom
against a 17,567-byte reserve. Anything that adds per-trail state must justify
itself against that.

---

## 2. Two problems, which I had been conflating

### Problem A — retention

A player reads a map, gets a destination, and wanders off. The pull mechanism is
three fragments, ≥6 in-game hours apart, suppressed while an unfound one sits
within 120 tiles. **A player who reads a map and travels for two in-game days
may see exactly one fragment.** Then nothing until they happen to return.

The only *persistent* reminder is an organiser row (added 2026-09-24) showing
the scrawl, where it points, and "I have not been there". It is passive — the
player must open the organiser to see it.

### Problem B — authoring wiggle room

Every one of the 17 incidents must supply exactly 4 sources that work at any of
125 places. An author cannot say "this incident earns two pieces" or "this one
deserves six". The rigidity is not really the number 4 — it is that the shape is
fixed: 3 local + 1 destination, all four mandatory, all four portable anywhere.

**These are different problems.** More parts does not fix retention (the cadence
gates it, not the supply), and better reminders do not buy authoring freedom. I
had been treating them as one.

---

## 3. Proposal for Problem A (retention)

**A fragment should say where the destination is.**

Today a fragment is a document from the same incident; it does not restate the
marked place. A player who finds one gets a page about a fuel reservation, not a
nudge toward Brandenburg. Making each fragment's record name the destination
turns every fragment into a signpost:

> …retained copy at *the marked address in Brandenburg*.

Cost: one generated line appended where fragments render. No state, no cadence
change, no new content. This is the cheapest available fix and I would do it
first regardless of what happens to Problem B.

**Secondary, if that is not enough:** relax the 120-tile suppression when the
player is far from the destination. The suppression exists so fragments do not
pile up; it currently also silences the trail exactly when the player has
wandered furthest, which is when the reminder is most needed.

---

## 4. Proposal for Problem B (wiggle room) — and its flaw

**The proposal:** keep the payoff as the single required destination-bound part.
Let an incident declare *N* local sources (2, 3, 6 — whatever it earns) and have
the runtime draw up to 3 for a given trail, seeded from the trail.

Why it looked good:

- no state-schema change — the drawn selection is derivable from the trail seed,
  so nothing new is saved and the budget ceiling is untouched
- authoring freedom without touching placement or persistence
- variety across the 125 maps that share an incident
- a deeper re-offer pool, which also helps Problem A

**The flaw, found while writing this.** The three comparisons are keyed to slot
*positions* — `{1,2}`, `{3,4}`, `{1,2,3,4}` — not to content identity. Swap
which source fills slot 1 and the `{1,2}` comparison still fires, but its
authored text describes the two specific documents that *used* to be there.

The result is a comparison describing evidence the case does not contain. That
is a defect this project has already had and already built a test for
(`comparison_describes_evidence.lua`, which caught twenty such lines when the
scenario anchors changed). This proposal would reintroduce it at scale.

Authoring around it is worse than it sounds: drawing 3 from a pool of 6 gives
C(6,3) = 20 combinations, each needing comparisons that hold. That is an
authoring *explosion*, not the reduction the proposal was meant to deliver.

**Possible escapes, none yet convincing:**

1. **Key comparisons to pairs rather than slots.** Author a line per meaningful
   pair; only the drawn pairs fire. 6 sources → up to 15 pairs, but each is a
   single short line and most pairs can be left unauthored (no line = no claim).
   Cost: the "all four together" summary comparison has no obvious home.
2. **Group the pool into coherent triples.** An incident declares sets of 3 that
   are known to work together. Keeps comparisons slot-keyed. Cost: this is just
   "several variants of the same incident" wearing a hat, and the variety is
   shallower than it looks.
3. **Derive comparisons from part metadata** rather than authoring them. Cost:
   generated prose, which this project has deliberately avoided — the authored
   voice is most of what makes the evidence feel handmade.

---

## 5. Constraints any answer must respect

Not preferences — these are project rules with tests behind them.

- **Observe before inferring.** A record may state what is physically true and
  must not conclude. The marks on a map are unsigned; naming a person found at
  the destination as the map's author is forbidden.
- **Two central conspiracies stay live.** Every incident names an *axis*
  (movement, records, access, protection, absence); the live conspiracy supplies
  a sentence for that axis. Neither reading may ever be declared correct.
- **Paper establishes names, dates and claims; it does not replace physical
  events.** ~69% of scenarios now carry a physical object anchor; objects carry
  no readable text and no case reference.
- **Placement stays dynamic.** No reserving targets ahead of time.
- **Kahlua, not Lua 5.1.** The game's interpreter is incomplete; it throws on the
  index rather than the call, so defensive guards need `pcall` around a closure.
- **Save budget.** ~22,289 bytes headroom at full catalogue.

---

## 6. What I actually want argued

1. **Is Problem B real, or am I inventing authoring freedom nobody asked for?**
   17 incidents × 125 places already yields more variety than a player sees in
   one campaign. Maybe 4 parts is fine and the wiggle room should come from more
   *incidents*, not more shapes.
2. **Is there an escape from the comparison explosion that I missed?** The three
   listed above all cost more than they give.
3. **Is signposting the destination enough for retention**, or does the trail
   need something structurally louder — a map annotation, a world marker, a
   survivor mentioning the place?
4. **Should retention material be story parts at all?** A reminder that is *not*
   an evidence part — something the player finds that is purely "this place is
   still unvisited" — would decouple the two problems entirely. I do not know
   whether that reads as helpful or as the mod nagging.
5. **Is the re-offer cap right?** "Three logical fragments, not three chances"
   is a deliberate scarcity rule. Retention may want the opposite.
