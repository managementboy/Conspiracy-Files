# The bored survivor and the pull across Knox

**Status:** diagnosis stands; mechanisms superseded by [round 2](BOREDOM_PULL_ROUND2_2026-11-02.md), which the owner asked for after judging these a rehash. Written in the project's ADHD shape
(brief, wide set, converge, focus, provocation) at the owner's request.
**Question asked, 2026-11-02:** *"None of the mods we have developed in the
past have solved the premise I had at the beginning. How do we make the player
wander through the map of Knox following one or many conspiracies when the game
has progressed to being boring?"*

---

## 1. Brief: what the premise was, and what was built instead

The premise is recorded twice.

- `CAMPAIGN_VISION.md`, 2026-09-08: *"A set of mysteries that build upon each
  other guides them through the map of Knox - not exhaustively, but not
  Irvington directly to Louisville either. On the way the player builds bases
  they should return to."*
- `DECISIONS.md` DR-20260919-Q05: *"in the later sections of the game we need
  to generate mysteries that require travel... proactively giving the player
  reasons to move."* With the explicit instruction: *do not silently
  substitute fixed survival-hour thresholds, a prescribed town route, exact map
  waypoints.* "How to determine later" was left open.

Six things were built or designed since. Measured against the premise, each
one is anchored on the player's current position, so none of them can pull:

| Attempt | What it does | Why it does not pull |
|---|---|---|
| Reach ladder (P4-R55, `Reach.lua`) | A permission circle, 250 to 1,500 tiles, growing with hours survived. | It permits distance; it never produces it. The circle is centred on the player (P4-R62), so a settled player gets cases within walking distance for ever. It is also exactly the survival-hour threshold Q05 said not to use as "later". |
| Case filler (P4-R133) | Keeps clues placeable "near a settled player", widening one rung when the neighbourhood runs dry. | Deliberately tuned so staying home never starves. That is kindness, and it is the opposite of a pull. |
| Cold trail and pull (`COLD_TRAIL_AND_PULL.md`, 2026-09-08) | Player declares a trail cold; next case anchors somewhere distant. | The only design that ever modelled "boring". Never built: "leave it cold is left out of the first cut until the cold trail state exists" (DECISIONS, Threads section). |
| Annotated maps (DR-20260920-Q33, built) | Read a vanilla map; fragments appear near the player; a payoff waits at the mark. | Depends on vanilla luck to find a map; the mod never seeds one. Fragments appear where the player already is, no deadline, payoff is one document. The design's own insight ("reward starts immediately where you are") rewards staying home. Only 17 stories and about 14 reviewed destinations are funded; every other map is inert by rule (constraint 4). The retention question was withdrawn "pending measurement" and never measured. |
| Every mystery its own (2026-09-25) | Bespoke shapes, 0..N sites. | Diversity of shape, not of geography. Sites are still chosen near the player. |
| CF: No Help (2026-09-26/27) | Two static hand-authored conspiracies, zero tracked state, container-function affinity across the map. | By construction it cannot know the player is bored, cannot know where they have been, and cannot place anything in response. It is a world to wander in with no gradient. |

Three things the premise needs were named in September and never started: a
directional model (corridor or anchor sequence), inter-case linkage, and base
tracking (Q13a, answered yes).

**The structural cause.** The spine rule "the organiser never sets objectives"
was read, in practice, as "the mod has no opinion about where the player is".
Those are different rules. A mod can have a strong opinion about *where
evidence sits* while having none about *what it means*. `CAMPAIGN_VISION.md`
already named this as option 2, "leads with a pull", and recommended it; it was
never recorded as a decision and nothing was built on it. Meanwhile "boring"
was never given a definition the code can read, so every mechanism fell back on
the one number it had: hours survived.

---

## 2. Wide set: five frames on the same question

**Game design.** Boredom is a pacing state, not a time. The mod should detect
it and switch placement policy from "near the player" to "away from the player,
toward a chosen far anchor". The organiser still only records. The distribution
of evidence does the guiding.

**Ecology.** Evidence is a grazed resource. The reach circle is a pasture; when
it is eaten down, the herd moves. The gradient is depletion, and depletion is
already observable: `VisitedBuildingLog` against the 8,908-building fixed
container index gives "fraction of the local world already searched" for free.

**Logistics.** Paper moves along routes. Every document in this project is
already a waybill, a manifest, a memo naming a place. A conspiracy is a supply
chain, and a supply chain has an upstream and a downstream. Follow the paper
trail literally: the next case sits one hop further along the chain, and the
local opening clue is the waybill that names it. `AddressRoads.lua` already
knows the roads.

**Memory (No Help's own constraint).** With zero tracked state, the only thing
that can carry a pull is the authored content itself. The redundancy rule
already in `NO_HELP_CONSPIRACY_DESIGN.md` §3a (the same crate ID planted 3 to
4 times across dispersed sites) becomes a gradient if the copies are authored at
*increasing distance along a direction*, and each copy names the next place.
Theory A's copies trend one way across Knox, Theory B's the other.

**Survival kindness (the rail that blocked everything).** "Never strand anyone"
is right and stays. But a hop of one reach rung (250 to 500 tiles) is not
stranding; it is a day trip with a base to return to. The fear of Louisville
stopped the project from building Rosewood.

---

## 3. Converge: the mechanism

Four parts. The first is the one everything else hangs on, and it is the one
the project never had.

### 3.1 A boredom signal the code can read

Three proxies, combined as "settled and dry". None is a survival-hour
threshold.

1. **The game's own boredom.** Project Zomboid has a Boredom moodle. The
   character's boredom and unhappiness stats are readable from Lua on the
   character's stats and body damage objects. This is, literally, "the game
   has become boring". **Needs a spike** (project rule: no production feature
   on an unverified Build 42 assumption). One evening.
2. **Saturation.** Share of buildings inside the current reach circle that are
   in `VisitedBuildingLog`, computed from the fixed container index without a
   world scan (T2 forbids one). Above a threshold, the local world is used up.
3. **Investigation stall.** The discovery ledger's highest sequence number has
   not moved for N in-game days while the character is alive and has moved
   around. The ledger already exists; this is one comparison.

When two of three hold, the survivor is bored. This is the definition of
"later" that Q05 left open.

### 3.2 The anchor flip

Today `GeneratedRuntime` anchors a new case at the player's position with
radius from `Reach.radius`. When bored:

- The next case's **anchor is chosen in the ring** between the current reach
  and the next rung (`Reach.wider`), in the direction holding the most
  unvisited funded sites. Funded means present in the address book and the
  fixed container index, never T3 room-name categorisation (advisory only).
- The case's **opening clue is still placed locally**, exactly as today, and it
  **names the far place** in the author's voice. This is the "role that names
  a distant place" from `COLD_TRAIL_AND_PULL.md` and the `{place}` token the
  map stories already use 39 times. It is a document, not a waypoint.
- Everything else in the case sits at the far anchor.

Each hop is one ring, so Irvington to Louisville is five or six hops over
weeks of play, never a jump. This is the corridor model without a corridor
table, and it supersedes P4-R62 ("anchor at current position") **for the bored
branch only**. Unbored play is unchanged.

### 3.3 The thread across hops

Inter-case linkage was never built; this is the smallest version of it. Each
hop reuses **one** named organisation, person, or object identity from the hop
before it (the recurring-props rule from No Help §3a, applied along the route).
The player goes north because the name they met in Muldraugh turns up on paper
that says Rosewood, not because anything told them to. With two live
conspiracies, each thread can pull a different direction; the player picks
which to follow, which is "one or many conspiracies" in the owner's words.

### 3.4 The return

Q13a said yes to base tracking for outbound and return journeys. The cheapest
base is the building with the highest `PlaceVisitLog` count over the last few
in-game days. The hop *after* a far case places its payoff **at home**: a
reply that arrived while the survivor was away, a delivery left at the door.
That is the rail from `COLD_TRAIL_AND_PULL.md`: "a later case that leads back
is as valuable as one that leads away". It also makes the base matter, which
the premise asked for and nothing has touched.

### What this means for each mod

- **Main mod (Knox.OS):** all four parts apply. It has the state, the logs,
  the generator, and the address book. Build it here.
- **CF: No Help:** it cannot run 3.1 to 3.4; it has no state by decision.
  Two honest choices. (a) Accept that No Help is a world, not a journey, and
  say so. (b) Author the gradient into the static content: every copy of a
  load-bearing fact names a place further out than the place it is found in,
  and the two theories' copies trend in different directions across Knox. (b)
  costs nothing at runtime and is an authoring rule, so I would adopt it as
  the rule and still say (a) out loud.
- **Annotated maps:** they stay what they are. One addition if the spike
  allows it: when the survivor is bored, the local trail may seed one vanilla
  annotated map whose destination lies in the ring. This reuses exact-once
  placement; the risk is vanilla's own stash preparation (risk 4 in
  `WHAT_WE_ARE_BUILDING_2026-09-20.md`), which has still never been watched
  running.

---

## 4. Focus: what to do first, in order

1. **Spike: read boredom in Build 42.** One session on a running game. Record
   the result either way.
2. **Build the saturation and stall proxies offline.** Pure functions over
   `VisitedBuildings`, the fixed container index and the discovery ledger.
   Tests in plain Lua 5.1 like the rest of the domain.
3. **Build the cold state** from `COLD_TRAIL_AND_PULL.md` items 1 and 2 (free
   the slot, stop nudging, leave documents, keep what was learned,
   reversible), with the player action worded in the survivor's voice. It is
   small, independently useful, and it is the consent route into the same
   anchor flip: the boredom signal is the mod noticing; going cold is the
   player saying so. Both land in 3.2.
4. **The anchor flip**, as a policy branch in case creation: ring anchor,
   local opening clue naming the far place, rest of the case at the anchor.
   Supersede P4-R62 for this branch in `DECISIONS.md`.
5. **One linked hop** (3.3) and **one return hop** (3.4), played to the end on
   Linux. That is the first moment the owner can judge whether it feels like a
   journey rather than review it.
6. **Measure map retention** (the round-2 measurement that was never run)
   before touching map cadence at all.

Decisions to record: Q05's "later" is the boredom signal, not hours;
`CAMPAIGN_VISION.md` option 2 "leads with a pull" is the decision; P4-R62 gets
a bored-branch exception; No Help adopts the "every copy points further out"
authoring rule or is declared a world, not a journey.

Rails that still hold: never strand (one ring per hop, no timer, nothing
expires); a lead is never proof; the organiser records and never directs; no
quest marker (the far place is named in a document in the author's voice);
save budget (one anchor and one linked identity per case, negligible against
the 500 kB ceiling); curated far anchors only, never T3 categorisation.

---

## 5. Provocation

The project has spent two months protecting a rule it never actually tested
against this premise. "A lead is never proof" is about meaning. "The mod has no
opinion about where the player is" is about geography. Only the first is in
the spine. The second was inherited by habit, and it is the reason every
mechanism, including the one built to be the pull, ends up placing evidence
within walking distance of a settled survivor.

Two sharper versions of the same point:

- **Q33's "real insight" is backwards for a bored player.** Laying the trail
  where the player already is was right for a fresh survivor who should not be
  sent to Louisville on day two. For a survivor who has emptied the town, it
  removes the last reason to leave. The same mechanism needs the opposite
  setting once the player is bored, and today it has no way to know.
- **No Help's zero-state rule has a price the owner has not been shown.** A
  mod that keeps nothing cannot notice boredom, cannot know where the player
  has been, and cannot respond. If the journey across Knox is the premise, No
  Help as currently defined cannot deliver it at runtime; only its authoring
  can, and only if the content is written as a gradient on purpose. That is a
  decision to make with eyes open, not a consequence to discover in playtest.
