# What we are going to develop

Plain description, no jargon. Companion to
`MAP_MECHANISM_PLAN_2026-09-20.md`, which is the same thing written for a
reviewer.

## The thing itself, from the player's side

You are surviving somewhere. In a drawer you find one of the game's own
hand-marked maps — the kind that already exists in Project Zomboid, with a
circle drawn on it and a note in the margin. You read it.

Nothing happens immediately. But over the following days, in the places you were
going to search anyway, paperwork starts turning up that is **about that circled
place**. A carbon copy in a warden post two towns away. Something in a filing
tray. Each scrap makes sense on its own and settles nothing.

Then, whenever you feel like it — next week, next month, never — you go there.
And in the building on the map, there is paperwork waiting that **flatly
contradicts** the scrap you found at home. One sheet says the crates left at ten
past four in the morning. The sheet at the destination says that at five o'clock
every single one of them was still sitting there, and nothing had moved since
eleven the night before.

Nobody tells you which is true. That is the whole point.

## Why this is the mechanic and not something else

The mod already generates cases, hides clues, and lets you read them. What it
never had was **a reason to walk somewhere specific**. We tested travel: the
player went from Irvington to Muldraugh and the mod worked fine — it just had no
opinion about where they went.

A marked map is a reason. It is also the game's own object, which means we are
not inventing a quest system; we are giving meaning to something the game already
puts in drawers.

## What we build, in order

### 1. Find out whether the game will tell us a map was read

Everything rests on this and it is not yet known. We need the game to tell us two
things: that a map was read, and **which** map. If it only tells us "a map", we
cannot know which place to send you to, and the whole design has to change.

This is a night of work in a running game, with the answer written down either
way. If the answer is no, that comes straight back to you — I do not want to be
found guessing about it three weeks later.

### 2. Settle an old worry about hidden objects

Months ago, a few times, the mod believed it had hidden a clue in a container and
the clue was not there. It has never happened again and we never found out why.

A trail of clues laid down over a week of play is the worst possible place for
that to happen. So before we build on it, we test the *new* way of hiding things
against six specific promises — chiefly that if putting the object in fails, the
mod must never record it as done. I am not going to pretend we found the old
cause. We label it unexplained and make sure the new path does not depend on
luck.

### 3. One map, all the way through

One map, one place, one payoff, played by hand in a real save and then reloaded.
The Louisville gallery, because the research already proves that map and a
brochure point at the same building.

This is the first point where you can look at it and tell me whether it is any
good. Everything before it is plumbing.

### 4. Two maps that disagree about the same place

This is the step that matters most to what you actually want. One map proves the
machinery. It cannot prove **contradiction**, because contradiction needs two
sources. So: two different maps, both pointing at the same building, both leaving
paperwork, disagreeing — and the organiser refusing to say which is right.

If this works, the mod does the thing you have been describing for weeks.

### 5. Pacing

Several maps live at once without flooding you, and without one quietly starving
because another is greedy.

### 6. One town paid for

Every supported map pointing into one town gets real paperwork. Everything else
stays ordinary vanilla and says nothing at all. Then we know what a town costs
and can price the rest.

### 7. Volume

Lots of paperwork, lots of premises. This is where the "we can use bulk" argument
gets cashed in, and where the only real check is a person reading them and saying
whether they rhyme.

## What we already know, before writing any of it

**The pilot fits in a save. The full set does not.** Measured, not guessed
(`test/map_feature_budget.lua`).

- Two maps sharing one destination, with everything you find kept permanently:
  **4,846 bytes** of the **7,826** we have spare. Comfortable.
- All 125 maps: over by **54,447** even in the cheapest arrangement I could
  construct. Not close.
- Squeezing the existing records buys about **10.9 kB** — roughly twenty more
  destinations, not a hundred and ten.

So the pilot is not blocked by space. And full coverage may not be either —
**the 500 kB is a number we chose, not a limit of the game.** The game's save
format handled 44 MB intact, and the test our ceiling came from saved 4.4 MB in
half a second with no stutter at all. The catalogue needs about 555 kB.

So before anyone rations maps or throws away case history, the thing to do is
**measure our own save at 600 kB, 800 kB and 1 MB and see whether it stutters**.
One night. If it behaves like that test did, the coverage problem was never real.
Details in `WHY_500KB_2026-09-20.md`.

## What could stop us, in order of how likely

1. **The game will not say which map was read.** Everything else is waiting on
   this one answer.
2. **Space, for the full set.** Not for the pilot.
3. **The old hidden-object worry** turns out to be real and in the new path too.
4. **The stash system.** The game prepares those marked stashes itself, and I
   have only read the code, never watched it run. It could remove our paperwork
   without telling us.
5. **A fully searched base.** If you have emptied every container at home, a
   trail has nowhere to put anything and simply waits. Stated honestly rather
   than worked around.

## Priorities, if you only want three things

1. **Step 1**, tonight or soon — because it is cheap and it can invalidate the
   design.
2. **Step 3**, the single playable map — because it is the first thing you can
   judge rather than review.
3. **Step 4**, two maps disagreeing — because that is the mod you actually asked
   for, and everything after it is scale.

## Two things I am not claiming

- The trail offers **three chances** near you. If you walk past all three, they
  stay where they were left, findable, and nothing new is placed. That is a
  narrower promise than "the trail follows you", and I have not marked it as your
  decision.
- If the paperwork's building is looted or burned after we put something there,
  nothing new appears. The world breaking things is the world working.
