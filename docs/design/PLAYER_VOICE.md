# Player voice lines

Owner request 2026-09-07: the survivor should speak when the journal gains an
entry, and again when a person-key-door link is discovered.

## Register

The **journal stays hedged**; the **character may speculate**. A survivor
thinking aloud is not the record asserting a fact, so these lines can carry
excitement the record never will. They still stop short of certainty: no line
states as fact that the named person lived somewhere or owned anything. "Their
place, I'd bet" is in character. "This was their house" is not.

## Set A — a journal entry was added

Delivered whenever a new discovery reaches the ledger, whatever its kind.

1. "That's worth writing down."
2. "Interesting. That's going in the machine."
3. "I should note this before I forget."
4. "Hm. That's going in my notes."
5. "Better write this one down."
6. "That means something. Noting it."
7. "I'll want to remember this."
8. "Worth keeping a record of that."
9. "Let me key this in while I've got it."
10. "That's a detail I shouldn't lose."

**Saying what is noted (P4-R130, owner 2026-09-16).** When a plain noun can be
read from the record, the line names it, and the coloured tag carries the
record's own title ("Noted: Tagged key / AV-197"):

1. "That <what> is worth writing down."
2. "Interesting. The <what> goes in the machine."
3. "I should note this <what> before I forget."
4. "Hm. That <what> is going in my notes."
5. "Better write this <what> down."
6. "That <what> means something. Noting it."
7. "I'll want to remember this <what>."
8. "Worth keeping a record of that <what>."
9. "Let me key this <what> in while I've got it."
10. "That <what> is a detail I shouldn't lose."

Where `<what>` comes from:
- a document: its title before " / " or ":", without "Second"/"Another",
  lowercased except words in capitals ("Tagged key / AV-197" -> "tagged key");
- an identity document: the document after the person's name ("Found Ines
  Kubiak's ID card" -> "ID card"), never the name;
- one key off a body: "key"; a possible connection: "possible connection".

No `<what>` (the plain lines above, tag "Noted", or "Noted: <title>" when a
title is known): objects (their titles are counts and names, not nouns),
several keys, a noun longer than 24 characters, and anything not found.

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
  above a head: `Noted`, `Unread`, `Key matches this door`, `Something nearby`.
  Swapped round on 2026-09-14 (owner: "switch arround the speach text. colored
  and white. it makes more sence"); a player object with no halo gets the words
  in the bubble instead. Lines that fire together are shown one after another,
  each held long enough to read.

  `speak` refuses a halo label equal to the spoken line, so the split cannot
  quietly lapse when somebody adds the next voice line. It survived this long
  because two tests asserted the echo instead of questioning it; those
  assertions are now inverted rather than deleted, so the reversal is on the
  record.
- A cooldown so a burst of discoveries does not produce a burst of chatter.
- Set B/C is the more significant event and must not be suppressed by a Set A
  line fired moments earlier.
- Set D shares Set A's cooldown, not a cooldown of its own: both are ambient
  survivor musing, so a burst of looting or discovery in one trip produces at
  most one line of either kind, not one of each. Set D also fires at most
  once per physical item, tracked on the item itself so it survives a
  drop/re-pickup or a save/reload.
