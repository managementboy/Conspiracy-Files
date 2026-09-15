# How to use the game's own objects in mysteries — plan, 2026-09-07

## The principle that should govern all of it

The game supplies **facts**. The mod supplies **structure**.

Project Zomboid has already decided that this corpse wears a security guard's
uniform, that this room is an office, that this key opens that house, that this
diary belongs to Kirk Key. Those are world facts we did not invent and cannot be
accused of fabricating. Our job is to notice them and attach meaning.

Every time we have fabricated instead of observed, it has been the weaker
result: the invented "electrician" occupation, and a spawned key standing in for
the real one already on the body.

## Three uses, in increasing order of risk

**1. Carriers** — objects that physically hold a clue we wrote. Hard-limited by
T7 text capability: a letter can hold prose, an ID card cannot. Twelve today.
Low risk, low reward. Adding more is easy and does almost nothing for variety.

**2. Observed leads** — things the game placed that we merely notice and record.
Owner-named documents, vanilla keys, outfits, room labels. **Zero fabrication,
highest authenticity, and no authoring cost per instance.** This is where the
return is.

**3. Anchors** — existing world content our fiction references: radio and TV
broadcasts, named literature, street addresses. Grounds the story in something
the player can independently encounter. Highest flavour, highest work.

## The bottleneck is roles, not carriers

Six roles exist and four of them permit exactly one carrier, so the
role/carrier split currently expresses real choice in two places. The first
three documents of every case are still fixed.

Adding items to a whitelist does not create mysteries. We have now shipped
whitelist entries that nothing selected **twice** - the card carriers, and the
observed-key catalogue path. A new *role* multiplies the shapes a case can take;
a new *carrier* only changes what the same clue is printed on.

Note that roles are also free in save terms: MAX_EVIDENCE caps a case at seven
documents regardless, so more roles buy variety without costing bytes.

## Recommended order

### Phase 1 — outfits as corroborating and contradicting leads

`IdentityProbe` already reads `getPersistentOutfitID` and the body descriptor.
A corpse in a security guard's uniform carrying an accountant's ID is two
observed leads that disagree.

This suits the standing caution rule better than any single lead can: instead of
asserting who the body was, the notebook can record that two independent
signals point different ways and let the player weigh them. No new content to
author, no fabrication, and it uses a probe that already exists.

### Phase 2 — room labels as role constraints

T3 already extracts `office`, `toolstore`, `garagestorage`, `medical`,
`derelict`. Today they only pick a container. Let the label constrain *which
role* a site can host: paperwork belongs in an office, a tool receipt does not.
Placement stops being a container hunt and starts carrying meaning.

### Phase 3 — more roles

The actual variety multiplier. Candidates: places a person somewhere, disputes a
time, names an organisation, contradicts an earlier document, records a payment.
Each new role should declare which carriers can express it and which room labels
can host it, so Phases 1 and 2 compound rather than sit alongside.

### Phase 4 — broadcast anchoring

1.16 MB of authored, in-fiction dated transmissions. A clue that references
something the player can actually hear is the strongest grounding available -
and the most work, since the corpus needs indexing by date and station first.

## Anti-patterns, learned the hard way

- Do not add carriers to a whitelist without a role that selects them.
- Do not fabricate a fact the game already provides.
- Do not let a lead become an assertion. Two disagreeing leads are a feature.
- Do not ship a mechanism unwired. Three times now a module has been complete,
  tested and called by nothing.
