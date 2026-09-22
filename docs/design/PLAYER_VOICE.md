# Player voice lines

Owner request 2026-09-07: the survivor should speak when the journal gains an
entry, and again when a person-key-door link is discovered.

## Register

The **journal stays hedged**; the **character may speculate**. A survivor
thinking aloud is not the record asserting a fact, so these lines can carry
excitement the record never will. They still stop short of certainty: no line
states as fact that the named person lived somewhere or owned anything. "Their
place, I'd bet" is in character. "This was their house" is not.

## Set A — removed (P4-R132, stage 2, 2026-09-17)

Set A was a line whenever a discovery reached the ledger ("That's worth
writing down.", tag "Noted"), and from P4-R130 it named the thing noted. Clues
are now found by searching (docs/design/SEARCH_TO_FIND.md): noting is a timed
action with the game's progress bar, and the item changing is what says it was
noted. So nothing is said, and P4-R130's "say what is noted" is moot. The
lines, the naming code (`V.describe`) and its test are gone.
`PlayerVoice.onDiscovery` stays as the hook DiscoveryLog calls, and logs
`discovery <kind> <ref>; nothing said`.

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
reason to guess. Fired once, the first time a generated-case evidence item the
player has recognised (P4-R132: spotted or looked over) but not yet inspected
settles into their inventory. A clue nobody has recognised is the plain item it
looks like and says nothing. Never fired for ordinary loot, and never again once the item
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

## Personal opening — the first clue was already on the survivor

The first investigation begins with its opening paper in the survivor's main
inventory and records it automatically. It therefore does not use Set D or ask
the player to infer an Inspect action. Once, persisted on that physical item:

- Halo: “This has my name on it. Why was I supposed to be here?”
- Bubble: `My name`

The same item flag consumes the ordinary Set D hint so both lines cannot fire.
If direct delivery fails, the clue remains undiscovered in its assigned
starting-house container and the normal proximity cue remains active.

## Delivery rules

- Speech bubble plus a halo note with an explicit duration, exactly as
  the clue hints did. `HaloTextHelper.addText` takes no duration and flashes too
  fast to read; `setHaloNote(text, r, g, b, duration)` is the one to use.
- Never a world sound and never an emitter: UI channel only, so the survivor's
  thinking never attracts zombies.
- Rotate phrasings; never repeat the previous line twice running.
- **Speak only when the player learns something they could not have known a
  second earlier.** Owner, 2026-09-10: "I would also like us to use it much
  more to interact with the player." The rule is what lets that be true without
  the mod nattering: it rules out ambient observation entirely - walking past a
  marker, opening the organiser, reading a page - and rules in every moment
  below. A line the survivor has not earned makes the next one cheaper.

  | Moment | Halo (white) | Bubble (colour) |
  |---|---|---|
  | A found record meets one already held | "This doesn't match what the other one said." | `Two records disagree` |
  | ...and agrees with it | "That fits with the other one." | `Records agree` |
  | The last document of a case | "That's all of it, I think." | `Nothing left to find here` |
  | Arrival at a building the file named | "This is the address from the file." | `Named in the file` |
  | Far too many of one thing | "Why would anyone need this many?" | `Far too many` |
  | A body where a body should not be | "There's a person in here." | `A body` |

  Each is gated on its own once-per-thing flag rather than the shared cooldown,
  because none can legitimately repeat: a connection is new once, a case
  retires once, an address is arrived at once.

  Two of them carry a rule of their own. The **connection** line never says
  which record is true - "they do not match" is a fact about two pieces of
  evidence, "someone is lying" is a conclusion. The **arrival** line fires only
  from a document the player has already read, and only once they are inside:
  a step earlier, or from an unread lead, it stops being recognition and
  becomes a quest marker.
- **The bubble and the halo never say the same thing.** Reported in play,
  2026-09-10: "some messages on top of the player repeated once in colour once
  in white". They did - `Say` and `setHaloNote` were both handed the same
  sentence, so every line appeared twice above the survivor's head.

  The white halo is the survivor thinking, in their own words, and holds the
  longer display. The coloured bubble is the fact, in as few words as fit
  above a head: `Unread`, `Key matches this door`, `Records agree`. (`Noted`
  and the clue hints' `Something nearby` are gone since P4-R132 stage 2.)
  Swapped round on 2026-09-14 (owner: "switch arround the speach text. colored
  and white. it makes more sence"); a player object with no halo gets the words
  in the bubble instead. Lines that fire together are shown one after another,
  each held long enough to read.

  `speak` refuses a halo label equal to the spoken line, so the split cannot
  quietly lapse when somebody adds the next voice line. It survived this long
  because two tests asserted the echo instead of questioning it; those
  assertions are now inverted rather than deleted, so the reversal is on the
  record.
- A cooldown (45 s) on Set D so a burst of looting does not produce a burst of
  chatter. It was shared with Set A until Set A was removed.
- Set B/C is the more significant event and must not be suppressed by a Set D
  line fired moments earlier.
- Set D fires at most once per physical item, tracked on the item itself so it
  survives a drop/re-pickup or a save/reload.

## The wordless cue (P4-R132, stage 2)

Not a voice line in the sense above, and not delivered through `speak`: near a
clue nobody has recognised, where the survivor could see it, the speech bubble
alone may say "Hm?" (no halo, only the soft UI tick). The first cue of a save
says "Hm? I should have a proper look around here." - the only teaching - and a
later cue of the same case says "...again?". Rules and numbers:
docs/design/SEARCH_TO_FIND.md, "Stage 2 built". It replaced the clue hints
("Is this a clue?", "Something nearby").
