# Occupational world leads

**Status:** Direction captured from the owner's playtest on 2026-09-23. The
observation foundation exists; occupational case generation does not.

## The playtest that exposed the requirement

The survivor found a vanilla business card labelled `Rolf White (Journalist)`
inside a wallet taken from an unidentified corpse. The same wallet also held a
credit card naming Henrietta Isaacs.

The current identity observer correctly preserves the facts it actually saw:

- the business card names Rolf White and prints `Journalist`;
- the credit card names Henrietta Isaacs;
- both items came from the same corpse-carried container;
- the body remains unidentified;
- the observation has a real place and time.

This is valuable emergent material. It is not yet a mystery. A later press
card, notebook, photograph, recording, police record, vehicle scene, farm,
clinic, checkpoint or broadcast does not exist merely because a design example
mentions it. The engine must either observe that thing in the current save or
generate and place it. Narrative prose may not pretend the connection exists.

## Settled boundaries

1. A printed occupation is a **claimed role**, not proof of employment.
2. A card in a corpse's wallet is evidence of possession, not proof that the
   corpse is the named person.
3. A body outfit or engine profession is an **observed body role**. It remains
   separate from the claimed role on a carried item.
4. The survivor's occupation is expertise and ordinary access. It is separate
   from both of the above and never explains immunity.
5. A name, role or repeated object is a lead. It becomes a relationship only
   when the player has found an independent connection.
6. Every connection presented as evidence needs a physical or audible carrier
   that actually exists in the save.
7. Paper is mainly for names, dates, destinations and claims. Physical objects,
   places, bodies, vehicles and arrangements should carry most of the event.
8. A local incident may be solved. The central Farm Zero versus Delivered
   Agent question remains supported by two live readings, with no truth score
   or declared winner.

## Required source distinctions

The data model must not collapse these signals:

| Source | Safe claim |
|---|---|
| Business card labelled `Rolf White (Journalist)` | Rolf White is named and the card claims a journalist role |
| Press ID or badge | The credential makes a stronger claim; authenticity and bearer identity remain unresolved |
| Corpse outfit or descriptor profession | The body appeared in that occupational role |
| Survivor profession and skills | The survivor may recognise different details or have a plausible reason for access |

The original printed label and source provenance remain immutable. Any
normalised role is derived data and must be reproducible from the saved input.

## Recommended engine shape

The engine should compose three kinds of input rather than spawning an entire
paper trail when a role-bearing card is read.

### 1. Observed world facts

Facts already supplied by the current save: named items, shared containers,
corpse provenance, outfits, rooms, addresses, vehicle clusters and contextual
cargo. These are preferred because the player can independently inspect them.

### 2. Hidden case grammar

A deterministic, saved structure that defines compatible roles, physical
evidence functions and the two conspiracy readings. It may contain open role
slots such as investigator, police contact, clinician, courier or witness.
It must not assign a discovered person to a slot merely because the occupation
looks convenient; the observed source and the resulting placement must satisfy
the grammar.

### 3. Generated missing bridges

Only the connections the world did not supply are materialised. They must be
placed in reachable, unvisited locations and exist as real items or scenes.
Nothing may be retroactively inserted into a place the player already searched.
Generation should complete a playable chain, not manufacture five documents
that all repeat the same conclusion.

The target flow is:

```text
observed named item
  -> persisted claimed-role lead
  -> compatible hidden role slot
  -> adopted vanilla facts where available
  -> generated physical bridges for missing functions
  -> one local incident with two central readings
```

## First vertical slice: Journalist

The Rolf/Henrietta observation is a real test input, not approved canon and not
a name to hard-code. A Journalist slice should be able to use an arbitrary
vanilla-generated name and preserve every uncertainty in its provenance.

A five-finding case could be composed from:

1. the existing corpse-carried wallet as one grouped finding;
2. a distinctive observed body outfit, when one exists;
3. a stable vanilla vehicle or emergency scene, when the current save provides
   one;
4. one generated physical bridge connecting the named journalist to a real
   location or object;
5. one independent counter-source or physical contradiction.

The first three are optional inputs, not promises. If the save does not supply
a suitable scene, the case grammar must select another reachable physical
function or generate a bounded replacement in unexplored space. An optional
random vanilla event can enrich a case but cannot strand an essential chain.

Useful Journalist carriers include a camera, film, recording equipment,
marked map, press credential, vehicle cargo or photographs. Their exact item
IDs and runtime capabilities must be verified against the installed Build 42
catalogue before authoring. A notebook or official record is allowed when a
name, date or claim is needed; it must not substitute for the whole event.

## Later role packs

Each role needs its own physical vocabulary and authored evidence grammar:

| Role | Candidate physical vocabulary |
|---|---|
| Police | Badge, evidence bag, patrol vehicle, roadblock, confiscated property, custody key |
| Medical | Medical bag, ambulance, PPE accumulation, medicine or specimen discrepancy |
| Farmer / veterinarian | Feed, animal medication, work clothing, livestock equipment, transport |
| Mechanic | Vehicle parts, service keys, altered plates, damaged transport, repair state |
| Utility / communications | Service vehicle, tools, access key, relay equipment, interrupted infrastructure |

These are candidate vocabularies, not claims that the current engine can
already observe or generate every item.

## Current implementation boundary

Implemented now:

- named-document observation from corpses, corpse-carried containers and
  selected furniture;
- same-container provenance and cautious co-carried-item wording;
- body outfit recording where Build 42 exposes a readable outfit;
- address-aware observation rows;
- reuse of encountered names as bounded generator inputs;
- a limited, repeated-observation vehicle classifier and optional vehicle
  finding for the Fitness Instructor opening.

Not implemented now:

- extracting and normalising claimed occupations from item labels;
- a persisted occupational-role lead store;
- matching role leads to hidden case slots;
- a Journalist evidence grammar;
- rich vehicle/corpse/outfit/fire/roadblock scene composition;
- role-driven generation of cameras, photographs, recordings or broadcasts;
- just-in-time bridge placement governed by exploration history.

No build or test report may describe those unimplemented items as working.

