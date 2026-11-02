# The bored survivor, round 2: channels that are not paper in a drawer

**Status:** ideas, not built. Round 2 of the 2026-11-02 question.
**Round 1:** [`BOREDOM_PULL_2026-11-02.md`](BOREDOM_PULL_2026-11-02.md), whose
diagnosis stands and whose mechanisms the owner rejected as a rehash of
existing designs. That was a fair reading. Round 1 recombined the repo's own
ideas.

## The actual rut

Every attempt since September uses one channel: paper, in a container, near
the player. Reach ladder, case filler, map trails, bespoke mysteries and No
Help differ in policy and all share the channel. The ideas below each use a
different channel. None of them exists in the repo.

## Ten mechanisms

1. **Follow the dead upstream.** Once the player is settled, zombies arriving
   in their area wear one consistent distant origin: prison jumpsuits, a
   plant's hi-vis, a hospital's lanyards, a town patch, a numbered badge.
   Nobody explains it. PZ exposes outfit spawning (`addZombiesInOutfit`); the
   mod already logs body outfits (`BodyOutfitLog`).
2. **The signal clears as you walk.** A mod-placed transmitter at a far site
   broadcasts on one frequency with limited range, the way walkie-talkies
   already work. At the base it is static with two words in it; each day's
   travel the right way clears another sentence. Needs a spike on scripted
   range-limited transmission in Build 42.
3. **Evidence you can carry but cannot read.** The local find is a film
   cartridge, a reel, a floppy, a microfiche card, unreadable until the player
   stands in the one building that can read it. The content comes to the
   player; the meaning is elsewhere. The mod already owns the context menu
   (P4-R45), so "Read" stays disabled outside the right building. No new
   state.
4. **Mail for a person who does not remember being there.** The survivor's
   own name turns up at addresses further out: a library card, a parking
   ticket, a visitor log. Extends the amnesiac opening past the first house,
   which nothing has done. The generator already has `{SELF}` and the address
   book.
5. **Someone is ahead of you.** Dated notes in a stranger's hand, written
   after the world started, each saying where they went next. The person is
   never shown. Content only; feasible now.
6. **Your base is in on it.** The house the player settled in was used by the
   program. Compartments, wall cavities and things behind fixtures appear only
   when the player renovates, which is what a bored settled player does. The
   paperwork in the walls names the next place. Connects base-building and
   crafting to the story. Spike: deconstruction and wall-destruction hooks.
7. **Memory returns in sleep.** On waking, sometimes, a fragment: a road
   sign, a smell, a loading bay. Memories are place-bound; standing at the
   place returns more. Bored players sleep and wait, so the trigger is free.
   Memory is unreliable by nature, so it is a lead and never proof, and no
   belief is tracked. Spike: detect the sleep-to-awake transition.
8. **The conspiracy owns the good stuff.** Late-game B42 crafting wants rare
   inputs. The containment program's depots are the reliable source of fuel,
   generators and medicine; the agricultural program's sites hold the seed
   vaults and tractor parts. The player goes for the loot and finds the
   evidence while looting. Revisit principle 1.6 ("no loot windfalls"), which
   was about starter kits.
9. **The conspiracy takes something from you.** While the player sleeps, one
   piece of evidence leaves the base and a trace is left: a fuel receipt from
   a distant station, a dropped gate pass. The player chases their own stolen
   evidence. This also offers a trigger that is not a boredom meter: the more
   fortified and stocked the base, the more the world notices it.
10. **Ear tags.** B42 animals. Livestock and strays near the player carry tags
    numbered to a registry at a farm far away. Theory B's couriers are cows.
    Spike: animal mod data.

## Composition

Three compose into one loop with no quest marker anywhere: the dead arrive
wearing somewhere else (1), the player finds things they cannot read until
they get there (3), and the base keeps revealing it was part of it (6).
Memory in sleep (7) is the cheapest to add and pays off the premise directly.
The signal (2) is the one worth a quiet-evening spike, because a signal that
clears as you walk is the purest gradient this game can offer.

## Rails, unchanged

A lead is never proof; the organiser records and never directs; nothing
expires; no belief is tracked anywhere; No Help keeps zero state (1, 3, 4, 5,
8 and 10 work without state; 6, 7 and 9 need the main mod's logs or a spike).
