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
