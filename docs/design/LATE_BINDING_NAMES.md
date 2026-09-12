# Late-binding names

Owner, 2026-09-11, after the cast work landed:

> Even for evidence we have not found, we could "retroactively" add a found ID
> to it. The player does not know.

Correct, and sharper than what was built. The player cannot notice a change to
a page they have not read. This document is the design for doing it; it is not
built yet.

## What exists today

`DEV-0.22.2-cast`: when a case is **created**, it takes names read off bodies
the player has already looted and writes the paperwork around them. The names
are saved in the case (`case.cast`) exactly as its two buildings are, which is
what lets a case rebuild from its seed on every load.

That covers every case after the first. It cannot help the first case, because
at the moment it is made nobody has been looted yet - and the first case is the
one a new player meets.

## Why this is not a small change

Two things currently fix a name at creation:

1. **Validation.** Every case is rebuilt from its seed on load and compared
   word for word with what was saved. A changed name in an unread document is
   indistinguishable, to that check, from a corrupted save.
2. **Placement.** Documents are physical items sitting in drawers, and their
   pages are written the moment they are placed. An unread letter across town
   already has its signature in ink.

## The design

**People become roles in the case, and names become a table beside it.**

- The case text says `{PERSON-1}` and `{PERSON-2}` rather than a name. Its
  canonical form - the thing validation rebuilds and compares - contains the
  placeholders, not the names. Validation is untouched.
- A separate, mutable `names` table in the session root maps each role to a
  name, together with whether that name is **locked**.
- A name is locked **the first time any document showing it is read** - opened
  in the notebook, or read in game. After that it never changes.
- Until it is locked, a role's name may be replaced. When the player loots an
  identity document off a body and a role is still unlocked, that name fills
  the role.

The rule the player would feel: **a name is fixed the moment you have seen it,
and not before.**

**Pages are written when first read, not when placed.** A placed document
carries its title (which names nobody) and a marker; its pages are written from
the current name table the first time the item is inspected or read. This is
the part that touches the most code: `GeneratedRuntime.writePages` moves from
placement to first read, and the in-game Read action has to be intercepted
before it shows an empty page.

## What must stay true

- **A locked name never changes.** Not on reload, not when another body is
  looted, not when a case retires.
- **Never two bodies for one name.** A role filled from a looted body is marked
  met, as `identities[n].met` already is, so `CasePerson` gives no second
  zombie that name.
- **No claims.** A name reaching a document is still only a name on a
  document; the notebook still says a name is a lead.
- **Old saves keep working.** Cases created before this carry names in their
  text and must go on validating exactly as they do today.

## Open questions for the owner

1. Should a role be filled from the **next** body looted, or only from a body
   looted **near the case's buildings**? The second is more coherent - the
   dead in the neighbourhood are the people in its paperwork - and rarer.
2. What happens if the player never loots anyone? The role falls back to an
   invented name at first read, as today.
3. Does the case person's zombie (`CasePerson`) still get named at creation, or
   only once its role locks?

## Order of work, when it is built

1. Placeholders in case text, and a name table in the session. Validation
   compares placeholders.
2. Locking on first read in the notebook.
3. Pages written at first read rather than placement, including the in-game
   Read action.
4. Filling unlocked roles from looted bodies.
