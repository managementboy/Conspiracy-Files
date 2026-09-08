# The campaign — where this is actually going

Owner statement, 2026-09-08. Recorded because it reframes the roadmap: what the
project currently calls "the product" is, in the owner's words, **"just a
module of what we want to achieve"**.

## The statement

> The player starts in some city without knowing how they ended up there. A set
> of mysteries that build upon each other guides them through the map of Knox -
> not exhaustively, but not Irvington directly to Louisville either. On the way
> the player builds bases they should return to, and builds crafting skills to
> further a dynamically built mastery.

Four things, none of which the current roadmap describes:

1. **An amnesiac opening.** The player does not know how they got here. That is
   the first mystery, and it is about them.
2. **Mysteries that build on each other.** Not independent cases; a sequence
   where a later case means more because of an earlier one.
3. **A journey across Knox.** Directed, but not a straight line and not a
   crawl of every building.
4. **Bases and crafting as part of the arc.** Places to return to, and mastery
   that grows with the story rather than beside it.

## What already exists

More than the roadmap suggests. The campaign skeleton is built and tested:

- `Generated/SuccessiveCases.lua` - `MAX_CASES=10`, `MAX_ACTIVE=4`, case
  retirement, and a **global discovery ordering** across cases. The bound is
  derived from the save budget, not invented: 2 x 45.6 kB + 8 x 31.9 kB =
  346.3 kB of the 500 kB ceiling.
- `CampaignPolicy` - minimum gap between cases, concurrency and retention
  limits, an anchor per case, and **a reach that grows with survival time**:
  250 tiles before 96 hours, 500 after.
- Case retirement, which is what makes a long campaign affordable at all.
- Per-case provenance, so a discovery always knows which case it belongs to.

That growing reach is the seed of the journey. It already says: the longer you
survive, the further the world opens.

## The hard question, which must be answered before anything is built

**"Guides them through the map" is in direct tension with the spine of this
project.**

The rule, stated in `PM_HANDOFF.md` and honoured everywhere in the code, is:

> It never sets objectives, never announces a solution, and never asserts a
> fact it only has a lead for.

A campaign that walks a player from Muldraugh to Louisville is, mechanically, a
quest chain. `Zomboid Storylines` already does quest chains, and the audit of
2026-09-08 recorded that we are deliberately *not that*.

So which is it? Three honest positions:

1. **Leads only, geography emergent.** Cases keep appearing within a widening
   reach, and the journey happens because the player follows leads that happen
   to lie further out. Nothing ever says "go to Louisville". Faithful to the
   rule; the risk is that the player wanders and the arc never lands.
2. **Leads with a pull.** Cases are still leads and still refuse to conclude,
   but placement is *biased* along a corridor, so the journey emerges from
   where evidence is, not from instruction. The notebook still never sets an
   objective. This keeps the rule while making the arc reliable.
3. **Explicit objectives for the campaign layer.** The individual mystery keeps
   its caution, but the campaign tells the player where to go next. Honest, and
   a different product from the one described in every existing decision.

**Recommended: option 2.** It is the only one that delivers a journey without
breaking the rule the whole design rests on. "A lead is never proof" survives
intact - the mod still records rather than directs - while the *distribution*
of evidence does the guiding. The player is pulled north because that is where
the threads lead, not because a quest marker told them.

That distinction is the product. It should be written into `DECISIONS.md` as a
decision, not left as a tone.

## What is genuinely new work

Beyond the existing skeleton:

- **A directional model.** The current reach is a **circle** that grows from
  250 to 500 tiles. Knox is thousands of tiles across; Muldraugh to Louisville
  is not reachable by widening a 500-tile circle. A campaign needs a corridor
  or a sequence of anchors, not a radius.
- **Inter-case linkage.** Cases are currently independent. "Build upon each
  other" means a later case must be able to reference an earlier one's people,
  places or organisations - and the notebook must express that without
  concluding.
- **The amnesiac opening.** A first case whose subject is the player. This is
  the strongest idea in the statement and the one most likely to define the
  mod's identity, and it has no implementation at all.
- **Bases as first-class places.** Nothing currently models a base. "Should
  return to" implies the mod knows where the player has settled - which is
  observable (a claimed safehouse, repeated presence) and would let a case
  deliberately send someone home.
- **Crafting mastery.** Nothing exists. Build 42's crafting depth is the
  obvious hook, but this is the least defined of the four and should be last.

## Sequencing, honestly

The existing v0.1 acceptance work is not wasted - every mechanism a campaign
needs is a mechanism v0.1 is proving. But the roadmap's v1 ("generated
investigation experience") is now clearly **not** the destination. It is the
module the owner named.

A defensible order:

1. Finish v0.1 acceptance (the seven-session ladder). It proves the mechanisms
   the campaign will lean on hardest: exactly-once placement, identity across
   moves, persistence across death.
2. **Decide the guidance question** above, and record it.
3. Prototype the **amnesiac opening** as one authored first case. It is small,
   it is the thing that makes the mod memorable, and it forces the inter-case
   linkage question immediately.
4. Replace the radius with a directional model.
5. Bases.
6. Crafting mastery.

Phase 3 of `USING_GAME_ASSETS.md` - more roles - still belongs early, because
inter-case linkage needs roles that can *reference* things across cases, and
four of six roles currently permit exactly one carrier.

## What this does not change

- A lead is never proof. Two disagreeing leads remain the feature.
- The notebook records; it does not assign objectives.
- Never delete, reset or rewrite a player's save.
- Solo-first. Multiplayer stays out.
