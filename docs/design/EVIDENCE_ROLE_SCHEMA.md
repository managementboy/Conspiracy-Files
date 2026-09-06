# Evidence role schema — removing the real generation cap

**Status:** Design note, not yet implemented.

## The problem is structure, not text

`Generator.build` hardcodes one `kind` string per document role:

    ... nil,"notepad")   ... nil,"key")     ... nil,"diary")
    ... nil,"notebook")  ... nil,"clipping")

`EvidenceKinds` is only a lookup consulted at spawn time; nothing ever selects
from it. Four carriers added on 2026-09-06 — `idcard`, `creditcard`,
`businesscard`, `ticket` — are therefore **unreachable**, and that is the
lesson: adding nouns to a whitelist nothing reads changes nothing.

The cap is that a mystery's *shape* is written in code, not composed.

## What the installed game actually offers

Counted against installed 42.20.4, not assumed.

| Source | Scale | Currently used |
|---|---:|---|
| Item definitions (`media/scripts/generated/items/`) | 5,105 | ~12 |
| — clothing / normal / food | 1,395 / 1,099 / 722 | none |
| — literature | 561 (246 books, magazines, newspapers) | 4 |
| — container / moveable | 308 / 393 | placement targets only |
| Radio + TV broadcast script (`Translate/EN/RadioData.json`) | 1.16 MB of authored text | none |
| Room labels from T3 | office, toolstore, garagestorage, medical, derelict, ... | placement only |
| Body descriptor | forename, surname, profession, outfit id | name + profession |
| Street/address data | Muldraugh road geometry, fixed address book | notebook text |
| Building keys | `getKeyId()` bound per building | person/key strand |

## Proposed direction

Replace hardcoded roles with a composed schema, so one location, one person and
one carrier type are chosen independently:

- **Role** — what the evidence *does* in the case (introduces a person, places
  someone somewhere, contradicts another document, dates an event, names an
  organisation). Roles are structure and stay authoritative and deterministic.
- **Carrier** — which physical object expresses that role, chosen from the
  kinds whose text capability suits it. A cover letter and a business card can
  both introduce a person; only one can hold a page of prose.
- **Text capability** — constrained by T7: persistent custom names plus
  ModData, locked custom pages as limited plain text, and the custom Inspect
  reader. Do not design a role around text a carrier cannot hold.

A role/carrier split alone removes most of the authoring cap **with no AI**,
and it is the precondition for either branch of ADR-0003: an LLM can only
render prose for a role that already exists.

## Six mechanisms worth building, highest story value first

1. **Outfits as contradicting evidence.** `getPersistentOutfitID` is already
   read by `IdentityProbe`. A body in a security guard's outfit carrying an
   accountant's ID card is two leads that disagree — which fits the standing
   caution rule far better than any single lead that "proves" something.
2. **Room labels as story roles.** An `office` implies paperwork and someone
   who worked there; a `toolstore` implies a different person entirely. T3
   already extracts these and we use them only to choose a container.
3. **The broadcast corpus as a dating anchor.** In-fiction dated transmissions
   across the outbreak. A clue referencing something the player can actually
   hear grounds the case in the game's timeline instead of a parallel fiction.
4. **Named literature as a link.** 246 real titles; the same magazine issue in
   two places is a connection the player finds rather than is told.
5. **Tiered containers.** A document in a locked filing cabinet or a safe
   carries more signal than one on a random shelf.
6. **Vehicles.** Keys, registrations and contents, tied to the existing
   building-key mechanism.

## Constraints carried forward

- Immutable evidence facts; only interpretation is mutable.
- An ID, a card or an outfit is a **lead**, never proof of identity or
  ownership.
- Evidence must be physically reachable — see `Connectivity.lua` and the
  relocation safety net.
- Variable clue count per case, never a fixed set.
- Bounded work; no unbounded scans over a 5,105-item universe at runtime.

## Sequencing

1. Role/carrier schema, replacing the hardcoded seven.
2. Outfit and room-label signals, since both read data already extracted.
3. Broadcast anchoring.
4. Only then consider ADR-0003's runtime transport.
