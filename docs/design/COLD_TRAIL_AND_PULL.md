# The cold trail, and being pulled somewhere else

Owner proposal, 2026-09-08:

> Maybe we need a switch the player can trigger when a local conspiracy becomes
> tiresome. Then and only then do we pull him to another place in the map. A
> race track? A hospital? There are so many places we could pull from.

## Why this resolves the guidance problem

`CAMPAIGN_VISION.md` records a genuine conflict: a campaign that guides a
player across Knox is mechanically a quest chain, and this project's spine is
that it **never sets objectives**.

The switch dissolves it. The mod does not decide the player should travel; the
player decides a trail has gone cold and asks for something else. A response to
a request is not an objective. "A lead is never proof" is untouched, and so is
"the notebook records, it does not direct".

It is also the right call for survival play. An unrequested pull across Knox
can get somebody killed a long way from their base, and a mod that does that
to people is a mod they uninstall. Consent is not only philosophically tidier,
it is kinder.

## Cold is not the same as retired

The codebase already has retirement, and this is **not** it.

- **Retired** (`Generated/RetiredCase.lua`): every document was found. The
  session root becomes worthless and is compressed to the evidence rows the
  notebook renders. A finished thread.
- **Cold** (new): the player is done with it, and documents are **still out
  there undiscovered**. An abandoned thread.

Conflating them would either destroy evidence the player might still return to,
or keep a dead case occupying one of the four active slots forever.

## What "cold" should do

1. **Free the slot.** `MAX_ACTIVE` is 4; a cold case stops occupying one, so a
   new case can begin. This is the mechanism that makes the pull possible at
   all.
2. **Stop nudging.** No more proximity hints, no more marker prompts, no voice
   lines for that case. The world goes quiet about it.
3. **Leave the documents exactly where they are.** Do not delete, do not
   relocate on abandonment. If the player passes that building in three weeks,
   the clue is still in the drawer, and finding it then is a better moment than
   any the mod could have engineered. This also respects the rule that we never
   rewrite what a player's world already contains.
4. **Keep what was learned.** Everything already in the notebook stays, in
   order. Going cold on a trail does not unlearn it.
5. **Stay reversible.** A cold trail that the player stumbles back into should
   be able to warm up again. Nothing about "cold" should be permanent, because
   nothing else in this mod is.

## What "pull" should do, and what it must not

The next case anchors somewhere distant and distinctive rather than in the next
street. **But the pull must still be a lead, not a waypoint.**

The wrong shape: a notebook entry saying "travel to the race track". That is a
quest marker with better prose.

The right shape: **a document, found locally, that refers to somewhere else.** A
delivery manifest routed to a hospital's loading bay. A membership card for a
club two towns over. A payroll stub from an employer that is not here. The
player reads it, forms an intention, and travels because they decided to - the
notebook only ever recorded what was on the paper.

This is exactly the mechanism `USING_GAME_ASSETS.md` Phase 3 describes: a role
that **names an organisation** or **places a person somewhere**. The pull is not
new machinery. It is a role, pointed further away.

## Where to pull toward

Twelve maps ship: Brandenburg, Echo Creek, Ekron, Fallas Lake, Irvington,
March Ridge, Muldraugh, Riverside, Rosewood, Valley Station, West Point, and
the challenge maps.

**Landmarks must be curated, and T3 already proved why.** Its live scan found
that building-wide categorisation stays context-sensitive and that **no
semantic non-building landmark zone exists** - "such targets need curated
coordinates or object signatures". A race track is not something the engine
will hand us by asking; it is a coordinate somebody wrote down.

That is consistent with everything already decided: v0.1 and v1 use curated
locations, and automatic categorisation is advisory only. A curated landmark
list is not a compromise, it is the established approach.

Good candidates are the places a survivor would already recognise as
significant - somewhere with a reason to hold records, a reason people
gathered, or a reason it was evacuated. The specific list is content work and
belongs to the owner, not to engineering.

## Safety rails

These are the ways this idea goes wrong, written down before it is built:

- **Never strand anyone.** The pull is an invitation. Nothing expires if the
  player ignores it, and no case should ever become unreachable because they
  stayed home.
- **The base must stay relevant.** The owner's vision has the player returning
  to bases. A pull that makes home worthless breaks the arc it is meant to
  serve; a later case that leads *back* is as valuable as one that leads away.
- **Distance must be earned, not imposed.** `CampaignPolicy` already grows
  reach with survival hours. A pull should respect that: an eight-hour-old
  character asking for a change of scene should not be pointed at Louisville.
- **One switch, not a menu.** If the player has to choose a destination, it
  becomes fast travel with extra steps.

## What this needs, smallest first

1. A **cold** state distinct from retired, with the five behaviours above.
2. A player action to enter it - in the notebook, worded as the survivor's own
   judgement rather than as a game function.
3. A **role that names a distant place** (Phase 3 work, already planned).
4. A **curated landmark list** with coordinates, as T3 requires.
5. Anchor selection that can use a landmark instead of a radius.

Items 1 and 2 are small and independently useful: a player can already have
four active cases and no way to say "enough". Items 3 to 5 are the campaign.

## Open questions

- **What wording?** "This trail has gone cold" is the survivor's voice. "Retire
  case" is a database operation. The wording is the feature here.
- **Can a cold trail warm up?** Recommended yes, on rediscovery, but it needs a
  rule for what happens if the case's slot is taken.
- **Does going cold cost anything?** A free switch may be used constantly. A
  cooldown, or letting only a *stale* case go cold, would keep it meaningful -
  `StaleClue` already models staleness.
