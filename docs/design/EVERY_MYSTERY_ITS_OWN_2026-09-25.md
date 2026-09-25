# Every mystery its own — rebuild plan

Owner, 2026-09-25: *"Repetitions break the illusion of a true mystery. Every
mystery has to be different by design. No one can be like the other."* And,
on being asked how to proceed: *"rebuild it completely to make space for each
starting mystery is its own design, with its own shape, count, mechanics and
way of ending."*

This is the plan for that rebuild. Nothing in it is built. It names where the
current engine dictates a shape, what the engine must keep, what a mystery
becomes, the order of work, and the questions only the owner can answer.

## 1. What is being rejected

Not the content. The *recipe*: the assumption, everywhere below the content,
that a mystery is "three anchor sources plus optionals, at two sites, ending
when every essential source is known". The Fitness ten are that recipe ten
times; the twenty-four occupation families were it twenty-four more times
(withdrawn the same day, DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN). The
opening memory (DR-20260925-OPENING-MEMORY) rotates *variants* of a shape;
it cannot rotate shapes because there is one.

## 2. Where the shape lives today (measured, not guessed)

| Layer | What it fixes | Where |
|---|---|---|
| **Story** | three anchors `claim / response / review`, up to four optionals with a `records / person / listen` purpose, findings as pairwise comparisons, an "essential" set, a thread from one essential document | `Story.validate`, `ANCHORS`, `Story.build` |
| **Generator** | 3–7 documents, exactly two sites `a`/`b`, one calendar with claim/response/review dates, premise families with 1–2 variants (10 for a profession), the relay memo appended to the first case, steer/follows as rewrites of the same shape | `Generator.build`, `G.validate` (`MIN_EVIDENCE`, `MAX_EVIDENCE`), `Premises` |
| **Session** | placement into two sites' containers, at most one mobile clue (car or carrier) and it must be the last document, instalments for what does not fit | `Session.createDistributed`, `mobileDocId` |
| **Runtime** | `documents[1]` is "the opening clue" delivered to the hand; completion = `Session.accounted` (every document known or dropped) → retire → closing questions | `GeneratedRuntime` opening delivery, `retireIfAccounted` |
| **Content** | every scenario file is written to the anchor/optional grid | `*Scenarios.lua`, `MapMedia*Stories.lua` |

Everything *downstream* of a case is already shape-blind and stays: the
record and its rows, FILES/NAMES/DATES/PLACES/THREADS, map marks, place
visits, the discovery ledger, the continuity carrier, the identity and key
observers, the object rules, the pair registry. They consume `documents`,
`known` and `comparisons`; they do not care how many or in what pattern.

## 3. What the engine keeps (the rules of honesty and reality)

These are not shape. They are what makes a finding true in this world, and
every mystery must pass them:

- **Real objects.** A thing is a catalogued item one of the object rules would
  allow; its record is a sight and what the survivor made of it, never text
  on a thing; wear, count and room are declared.
- **Observe before inferring.** No record infers identity or ownership from a
  card, a key or a body; two readings stay live; nothing says "solved".
- **The central question is never named**, and every mystery says which axis
  it bears on; a pinned pair is honoured.
- **Nothing counts.** No totals, no "3 of 5", on any surface.
- **Placement is real**: fixed containers, carriers, vehicles, instalments,
  the searched-container rule, the guard radius, the save budget.
- **Discovery is the player's**: Search Mode, Look it over, Inspect; the
  ledger orders what was found by when.
- **Businesses are grounded** in a print the game ships.

## 4. What a mystery becomes

An authored module, one file, one design, with this contract and no other:

```
{
  id, title,                        -- its own
  question,                         -- the survivor's open question (the THREADS row)
  axis, pair = nil | id,            -- how it bears on the campaign
  sites = { {role="start"|"place"|"road"|"body", grounding=?}, ... },  -- 0..N
  findings = {                      -- ANY count >= 1; no fixed roles
    { key, kind, where = site key | "on me" | "carrier" | "vehicle",
      prose = {observation, source, note} or {title, body},
      state = {wear, quantity, members, roomIntent},
      mechanic = nil | {kind="door"|"use"|"skill"|"answer", ...} },
    ...
  },
  links = { {requires={keys}, text, from, to, kind}, ... },   -- free-form
  ending = { kind="all-of"|"any-of"|"mechanic"|"carried", keys={...} },
  thread = nil | { finding=key, point, question },
  memory = nil | {...}              -- what to remember for the case after
}
```

The engine validates the honesty rules over this and nothing else, places
`findings` by `where` (generalising Session from two sites to N and from "the
last document may be mobile" to "any finding may declare a carrier or
vehicle"), discovers as today, records as today, and ends the case when the
mystery's own `ending` says so — including *never* ("carried": a question the
survivor keeps, which is a legitimate way for a mystery to end).

Mechanics are findings too: trying the key on the door (already observed),
using a tool on a named object, a skill check at a panel, an answer given —
each recorded as what the survivor did and saw, never as proof.

## 5. Order of work

0. **Freeze.** No new content in the current mould. (Done: the families are
   withdrawn; the Fitness ten stay routed until replaced.)
1. **Engine, behind an adapter.** Generalise `Story` and `Session` to the
   contract above; wrap every existing scenario in an adapter that maps
   anchors/optionals onto `findings` and `all-of(essential)` onto `ending`,
   so the 20 ordinary premises, the 3 generic openings, the Fitness ten and
   the map stories keep working unchanged while the engine no longer knows
   the word "anchor". Offline suite and the native suite must stay green
   through this step; that is what the adapter is for.
2. **The first bespoke starting mystery**, designed with the owner from the
   plan's own table (`OCCUPATION_MYSTERIES_LINUX_PLAN_2026-09-19.md` §2) — the
   electrician's *unsigned repair* is the natural first: a returned radio
   component, a service stub, an isolated panel that needs tools and skill,
   ending on the panel, not on a count. Written as one module, played to its
   end on Linux, with a "shape card" in DECISIONS (sites, count, mechanic,
   ending).
3. **The second, deliberately unlike the first** — different site count,
   no object in the pocket, an ending by mechanic or by carrying. If the
   engine cannot hold both, step 1 was not finished.
4. **A shape-diversity guard**: a pure test over the registry that refuses
   two mysteries with the same (site pattern, finding count, ending kind,
   pocket object) — the test that would have failed today's twenty-four.
5. **Then one at a time**, each with its design note before code and its
   Linux run after, in bounded groups so the campaign meets both pairs.
6. **The Fitness ten** are redesigned as one or two mysteries of their own,
   or retired; they are not the template.

## 6. What tests may hold

Honesty and reality (§3), the contract's well-formedness, the diversity
guard, and that each mystery plays to its own ending on the real game.
Never: "five documents", "document 2 is a dated receipt", "document 5 waits
for a vehicle". Those assertions pinned the defect; they are already gone
with the routing.

## 7. Questions only the owner can answer

1. How far may a start diverge from "an errand in my name"? May a start be
   about the person next door, or a place, with the survivor incidental?
2. May a mystery **end without completing** — carried as an open question for
   the whole game — and if so, how does THREADS show that honestly?
3. Must every start put something **in the pocket**, or may the first finding
   be found?
4. How many **sites** may a start span, and may one be a road or a body
   rather than a building?
5. Mechanics (tool, skill, panel): built only after each is verified on Linux
   (the plan's §8 tickets), or may a mystery be designed around one before?

## 8. Cost

Step 1 is the expensive one: `Story`, `Session`, `Generator` and their
tests, with an adapter keeping 25 families and 18 map stories alive — days,
not an afternoon, and every native check re-run at the end. Steps 2–3 are
content-and-play, a day each with their Linux runs. The diversity guard is
an hour. Nothing here touches the Workshop until the owner says so.
