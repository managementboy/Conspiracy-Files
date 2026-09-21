# A site with no address still shows its coordinates — intended or not?

**Status:** open question for the owner. No code changed. Not a defect I can
call on my own, because the current behaviour is deliberately tested.

## The tension

The handoff's Navigation and UI row asks for two things that pull against each
other when a site is not in the address book:

> Numbered, mixed and wholly unnumbered sites must be locatable from the
> discovered text. … **No raw coordinate labels** or clipped answers.

`test/address_shipped.lua` establishes the current behaviour, on purpose:

    describe("Dispatched from Building at 1900, 14370 to Building at 2000, 14400.", mixed)
      == "Dispatched from 201 N Carl St to Building at 2000, 14400."

So when one site of a case has an address and the other does not, the named one
is written and the unnamed one **keeps its raw coordinates in player-facing
text**. When no site has an address, `describe` returns nil and the row reads as
it did before addresses existed.

That is a reasonable design — naming the site you can name beats naming
neither — and the test says so in as many words: *"a case with one unnumbered
site must still name the other"*. But "Building at 2000, 14400" is a raw
coordinate label, and a player cannot find a building from a coordinate pair.

## Why I did not change it

Three reasons. It is tested as intended, so changing it would break a test that
knows why it exists. The shipped book covers 6,796 addresses and every case
building observed in campaign runs had a real one ("203 E Maple St", "202 E
Maple St", "101 W Maple St", "103 Balsam St"), so the fallback may be rare
enough not to matter. And which way to resolve it is a writing decision, not a
correctness one.

## The options, if you want it resolved

1. **Leave it.** Rare, and the alternative may be worse.
2. **Describe the place instead of the point** — "the building behind the
   Spiffo's on the corner", from the room and landmark data the catalogue
   already carries. Best for the player, most work, and needs writing.
3. **Say plainly that it has no address** — "an address the file does not
   record" — which is honest, in the mod's voice, and cheap. It loses the
   ability to find the place at all.

## How to measure whether it matters first

Count, in a running game, how many sites actually chosen for cases fall outside
the address book. If it is near zero this stays a curiosity; if it is common,
option 2 is worth the writing. That measurement needs the game and is not
expensive — one pass over the catalogue sites against the shipped book.
