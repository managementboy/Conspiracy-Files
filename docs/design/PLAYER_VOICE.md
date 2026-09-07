# Player voice lines

Owner request 2026-09-07: the survivor should speak when the journal gains an
entry, and again when a person-key-door link is discovered.

## Register

The **journal stays hedged**; the **character may speculate**. A survivor
thinking aloud is not the record asserting a fact, so these lines can carry
excitement the notebook never will. They still stop short of certainty: no line
states as fact that the named person lived somewhere or owned anything. "Their
place, I'd bet" is in character. "This was their house" is not.

## Set A — a journal entry was added

Delivered whenever a new discovery reaches the ledger, whatever its kind.

1. "That's worth writing down."
2. "Interesting. Into the notebook it goes."
3. "I should note this before I forget."
4. "Hm. That's going in my notes."
5. "Better write this one down."
6. "That means something. Noting it."
7. "I'll want to remember this."
8. "Worth keeping a record of that."
9. "Let me get this down on paper."
10. "That's a detail I shouldn't lose."

## Set B — a person-key-door link was discovered

`<name>` is the name observed on a document found with that body. Used only
when a name is actually known; otherwise fall back to Set C.

1. "Wait - <name>'s key opens this door. Was this their place?"
2. "This is <name>'s key. So this is where they came home to?"
3. "<name>... this key of theirs fits right here. Their house, maybe."
4. "The key I took off <name> opens this. That's no coincidence."
5. "So <name> had a key to this place. Worth knowing."
6. "<name>'s key, this door. Somebody lived here."
7. "Huh. <name> could get in here. Might have been home."
8. "That key came off <name>, and it opens this. Their place, I'd bet."

## Set C — the same link, no name known

The key's provenance is known but no identity document was ever observed with
that body. Never invent a name.

1. "This key came off a body, and it opens this door."
2. "Whoever I took this key from could get in here."
3. "Someone I found dead had a key to this place."
4. "That key fits. Whoever carried it belonged here, maybe."

## Set D — an uninspected evidence item entered the inventory

Owner request 2026-09-07, UI proposal 8: reading evidence requires a
right-click "Inspect Investigation Evidence" action a new player has no
reason to guess. Proximity clue hints say something nearby is worth finding;
nothing says what to do once it is in hand. Fired once, the first time a
generated-case evidence item the player has not yet inspected settles into
their inventory. Never fired for ordinary loot, and never again once the item
is inspected or has already spoken once. Points at the *idea* of reading it
properly, never at the keybind or the context-menu action by name.

1. "I should take a proper look at this."
2. "Worth reading this properly when I get a moment."
3. "This deserves more than a glance. I'll read it properly, later."
4. "I shouldn't just carry this around unread."
5. "Better sit down and go through this properly."
6. "That's worth a proper read, not just a pocket."
7. "I'll want to go through this properly when I get the chance."
8. "This isn't something to skim. Read it properly, later."

## Delivery rules

- Speech bubble plus a halo note with an explicit duration, exactly as
  `ClueHints` does. `HaloTextHelper.addText` takes no duration and flashes too
  fast to read; `setHaloNote(text, r, g, b, duration)` is the one to use.
- Never a world sound and never an emitter: UI channel only, so the survivor's
  thinking never attracts zombies.
- Rotate phrasings; never repeat the previous line twice running.
- A cooldown so a burst of discoveries does not produce a burst of chatter.
- Set B/C is the more significant event and must not be suppressed by a Set A
  line fired moments earlier.
- Set D shares Set A's cooldown, not a cooldown of its own: both are ambient
  survivor musing, so a burst of looting or discovery in one trip produces at
  most one line of either kind, not one of each. Set D also fires at most
  once per physical item, tracked on the item itself so it survives a
  drop/re-pickup or a save/reload.
