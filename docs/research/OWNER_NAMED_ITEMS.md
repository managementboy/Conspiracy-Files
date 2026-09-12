# Items that carry a person's name — Build 42.20.4

Found 2026-09-07 when the owner spotted `Diary: Kirk Key` on a corpse and asked
whether a diary might carry a name too. It does, and so do several things we
were ignoring.

## The engine marks them explicitly

`Diary1` in `media/scripts/generated/items/literature.txt` carries:

    Tags = base:applyownername

That tag is how the game decides to stamp an owner's name onto an item. It is a
designed naming system, not incidental text, and it gives an authoritative list
rather than a guessed one.

## The complete set — 16 items

    clothing.txt   Necklace_DogTag, Necklace_DogTag_Female, Necklace_DogTag_Male
    container.txt  KeyRing_SecurityPass
    literature.txt BusinessCard_Personal, Diary1, Diary2, IDcard, IDcard_Female,
                   IDcard_Male, ParkingTicket, Passport, PressID, SpeedingTicket
    normal.txt     Badge, CreditCard

`IdentityObserver` watched only eleven types, all guessed from the obvious
"card" nouns, and **missed eight**: Passport, PressID, Badge, Diary1, Diary2 and
the three dog tags, plus the security-pass key ring.

Passport, press ID and badge are among the strongest identity documents in the
game, and dog tags are a strong fit for this mod's subject matter.

## The better mechanism: ask, do not list

`InventoryItem:hasTag(name)` is a real Build 42 API, used in 57 vanilla files
(`ISInventoryBuildMenu.lua:8`, `CFarming_Interact.lua:9`, `ISBuildAction.lua:224`
and many more). Testing `item:hasTag("applyownername")` would observe every
owner-named item, including ones added by future builds or other mods, with no
list to maintain.

Verify the exact tag string at runtime before relying on it: the script file
writes `base:applyownername`, and whether `hasTag` expects the bare name or the
namespaced form is **not yet confirmed**.

## Wording problem to solve first

Current wording says *"I saw a document labelled ..."*. That is right for a
passport and wrong for a dog tag or a key ring, neither of which is a document.
Adopting the full tag-based set needs wording that generalises without weakening
the standing caution rule - the name is a lead, never proof of who the body was.

## Decision taken now

Add the five clearly document-like types - Passport, PressID, Badge, Diary1,
Diary2 - to the existing whitelist, since they need no wording change.

Dog tags, the security-pass key ring, and the switch from a whitelist to
`hasTag` are deliberately **not** done yet: they need the wording work above and
a runtime check of the tag string.
