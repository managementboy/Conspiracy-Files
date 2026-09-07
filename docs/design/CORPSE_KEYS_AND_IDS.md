# Corpse keys and loose IDs — observed 2026-09-07

**Status:** Owner field observation during live testing. Design implication
recorded; no decision taken.

## What the owner saw

A single corpse carried, in addition to a wallet containing an ID:

- **a key to a residence** (ordinary vanilla loot), and
- **a second, loose ID card lying directly in the corpse container**, not in
  the wallet.

Both were placed by the base game. Neither came from this mod.

## Why this matters

### 1. We fabricate a key the game already provides

`LocalPersonRuntime.createKey` builds a `Base.Key1`, stamps it with the *first
clue building's* `getDef():getKeyId()`, names it, and `LocalPersonIntegration
.place` adds it to the corpse. That manufactures the "this person could get
into the clue building" link.

Meanwhile the base game had already put a **real** key on that same corpse,
bound by `keyId` to a **real** residence. That vanilla key is a stronger lead
than ours in every respect that matters:

- it is genuine world content, not something we injected;
- it points at a building the game itself associated with that body;
- it needs no spawning, so no exact-once placement, no reconciliation, no
  duplicate-token conflict risk.

It also inverts the direction of the story. Ours says *"this person could
reach the place we already chose."* The vanilla key says *"this named person
lived somewhere specific"* — a location the mod did not author and the player
discovers. That is much closer to the stated goal that a key found on a named
corpse should connect that person to an otherwise unnamed place.

`LocalPersonIntegration.heldKey` already anticipates the collision — its
comment reads "A vanilla spare key may precede our key" — but it disambiguates
rather than exploiting the vanilla key.

**Open question:** should the strand *observe* the corpse's existing key
instead of creating one? Going from a `keyId` back to its building needs a
bounded scan of catalogued buildings comparing `getDef():getKeyId()`. Feasible
with the T3 catalog we already build; **not proven**, and not attempted.

### 2. A loose ID is a second, simpler observation path

The tested flow is deliberately awkward because the engine cannot open a wallet
while it sits on a corpse: move wallet → inventory, open, inspect, return it.

A loose ID needs none of that. `IdentityObserver.afterRender` already reads
rows from a corpse container directly, so an ID lying loose in the body should
be recorded as soon as its row is drawn — no transfer, no provenance dance.

This is worth confirming in play. If it holds, the wallet path is the awkward
special case rather than the norm, and the mod should not assume IDs arrive
wrapped in wallets.

### 3. Two IDs on one body is a story, not a problem

A wallet ID and a second loose ID on the same corpse is exactly the kind of
ambiguity the project's caution rule exists for: an ID on a body is a lead,
never proof of who the body was. Two conflicting IDs make that concrete, and
the notebook's existing wording already handles it without asserting identity.

## Constraints if this is pursued

- Never assert that the corpse *is* the named person, or that they lived at the
  building their key opens.
- Do not remove or alter vanilla loot; observe it.
- Bounded keyId lookup only; no unbounded scan over catalogued buildings.
- Preserve the existing spawned-key path until an observed-key path is proven,
  and do not run both for one case.
