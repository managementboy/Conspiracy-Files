# THREAD-001 — Dead Air

**Status:** Hand-authored schema fixture, not final canon.
**Purpose:** force the data model to serve real content before generic content-pack schema design.

## Premise
A routine county communications contractor appears in police paperwork, a transmission-site maintenance trail and two pieces of personal writing. Nobody agrees who ordered a late-night retune or why a carrier appeared on a frequency nobody claims to own. The documents are mundane, bureaucratic and contradictory; nothing confirms the cause of the Knox Event.

## Entities

### Organisation (1)
**Cumberland Signal Services (CSS)** — regional radio/communications maintenance contractor. Plausibly boring enough to be everywhere and important enough that nobody remembers hiring them.

### Identities (3)
1. **M. Rourke** — field technician; tired, sarcastic, keeps personal notes.
2. **Sgt. Dana Pike** — police property/evidence supervisor who records an odd device recovered near a tower service road.
3. **H. Vale** — name/signature appearing on a procurement/authorisation memo; role uncertain. May be a real identity or cover.

### Locations (2)
1. **Transmission site** — v0.1 hardcoded/curated target location.
2. **Police station** — v0.1 hardcoded/curated target location.

## Documents (6)

### D1 — CSS maintenance ticket
**Found:** transmission site.
**Text concept:** repeated 37-second carrier after midnight; technician instructed to retune a channel not present on the station's normal list. Handwritten footer: “If this is an exercise, it has better paperwork than we do.”
**Links:** CSS, M. Rourke, transmission site.

### D2 — Police property log
**Found:** police station.
**Text concept:** an “unlicensed signal tracer / modified receiver” logged from the tower service road. Chain-of-custody line is complete except for the requesting agency. Sgt. Pike adds: “Apparently ‘nobody’ has excellent stationery.”
**Links:** Dana Pike, transmission site, CSS indirectly via a service sticker.

### D3 — CSS parts invoice
**Found:** transmission site or associated container.
**Text concept:** ordinary replacement components plus one line item with a procurement code not used elsewhere in CSS paperwork. Approved by H. Vale.
**Links:** CSS, H. Vale.

### D4 — Rourke notebook page
**Found:** transmission site.
**Text concept:** Rourke complains about being told to retune equipment, then told the retune never happened. Notes the police confiscated his spare receiver “because listening to a radio is apparently espionage now.”
**Links:** Rourke, Dana Pike, D2, transmission site.

### D5 — Internal authorisation memo
**Found:** police station files.
**Text concept:** requests that local police treat specified tower access as “scheduled infrastructure activity” and not create an incident report unless public safety is affected. Signature block: H. Vale. Organisation line is partly illegible/ambiguous.
**Links:** H. Vale, police station, transmission site. Contradicts D2's implication that police had no requesting agency.

### D6 — Handwritten shift note
**Found:** police station desk/files.
**Text concept:** Pike tells the next shift that the receiver is to be returned if “the phone call from Frankfort happens again,” but no return is recorded. Ends with “If anyone asks, the radio arrested itself.”
**Links:** Dana Pike, D2, D5.

## Anchor and fallback

- **Anchor:** D1 at the transmission site. It creates the initial pattern: unexplained carrier + CSS + Rourke.
- **Fallback:** D2 at the police station. It can introduce the same narrative thread from the opposite direction if D1 cannot safely materialise.
- Only one entry path should be intentionally activated for v0.1 placement tests; the other exists to test fallback/idempotency, not to create a meaningless duplicate lead.

## Intended player sequence (not a quest order)
The player may encounter either location first. D1/D2 establish a strange but mundane radio problem. D3/D4 connect CSS and Rourke. D5/D6 add H. Vale and expose a contradiction in what the police supposedly knew. The thread ends without explaining who Vale really is or why the frequency mattered.

## Schema pressure this fixture creates
The model must represent:
- six authored assets;
- evidence discovery context distinct from asset definition;
- three separate identities;
- one organisation;
- two exact locations;
- explicit relationships;
- one contradictory relationship;
- anchor/fallback placement;
- an identity whose role remains unresolved;
- player-visible ambiguity without a final truth.
