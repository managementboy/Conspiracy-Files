# The mystery engine, redesigned — three iterations

Owner, 2026-09-25: *"build the new engine and content. Take time to hone into
a good design first. Reiterate at least three times. Use the ADHD skill to
find alternatives."* Boundaries already decided: DR-20260925-MYSTERY-BOUNDARIES
(occupation is the way in; a mystery may end without completing; nothing has
to be in the pocket; as many sites as needed; mechanics before verification;
the Fitness ten are redesigned). Plan of record: `EVERY_MYSTERY_ITS_OWN_2026-09-25.md`.

Each iteration below opened with five divergent frames run in isolation
(no branch saw another), then scored, clustered and the strongest three
deepened, then converged into a design version. The next iteration attacks
the previous version.

---

## Iteration 1 — what should the engine *be*?

Frames: remove the load-bearing assumption · game designer · 3am on-call ·
biology · competitor trying to break it. 30 ideas.

### Wide set, clustered by angle `[novelty viability fit]`

**A. Engine as interpreter of a tiny vocabulary (author writes data, never logic)**
- five verbs — PLACE, LINK, REVEAL, GATE, CLOSE — interpreted at runtime `[7 8 9]`
- the ending predicate is data, including "none = carried" `[5 9 9]`
- a generic untyped clue; each mystery invents its own taxonomy `[6 8 9]`
- a static linter refuses any mystery that fails honesty or dangles a reference before it reaches a save `[6 9 9]`
- a silence is a first-class node with its own record line `[7 8 8]`
- kill runtime generation: author offline, interpret at play `[6 7 8]`

**B. Recomputation and idempotence (never get paged)**
- a mystery is a pure function of (seed, saved instalment log) `[6 6 7]`
- placement as an idempotent queue of "ensure" operations keyed by finding id `[5 8 8]`
- displaced-clue re-anchoring as a contract, not an edge case `[6 6 7]`
- a spatial reservation ledger so two live mysteries cannot claim one house, one body, one car `[6 8 8]`
- a condemned-site fallback for a building that burns `[5 6 6]`

**C. Shape from the world and the player, not a template**
- occupation-verb discovery: the mechanic checks the engine, the nurse the pulse — the PDA fills from what the job already does `[8 6 9]`
- a site-resolver by tags; site count falls out of what the mystery declared `[7 7 8]`
- the geometry resets mid-play: the third clue sends you away from the first two sites `[7 6 8]`
- Hox gradient: shape read off the mystery's position on the map `[9 5 7]`
- symbiont typing by occupation (mutualist / commensal / parasite mysteries) `[8 6 8]`
- lazy placement at search time, no placement pass at all `[8 4 6]` — **trap**: evidence must have *been there* for the reading to be honest

**D. Time as a shape**
- clues expire — a body decomposes, a note smears, a car is moved — so a mystery reached late is a carried question by consequence `[8 7 9]`
- retraction: a mystery loses evidence over time, its own kind of ending `[7 5 6]`
- scar-tissue locations: a finished mystery changes what can take root there `[7 6 7]`
- quorum endings: a mystery resolves only past a density of signal `[7 4 6]` — **trap**: counting in disguise

**E. More than one voice**
- two competing informants leave contradictory trails over the same sites; the seed picks which is louder `[7 7 9]`
- the answer first: an unlabelled key, a box that will not open; every later finding only adds readings `[7 8 9]`
- discovery as an event bus: a radio broadcast, another survivor's log `[7 6 7]`
- the world carries progress (a door found open, a radio mention) for the player who never opens the PDA `[7 6 7]`
- the player's own inventory as evidence against them `[8 5 6]`
- prion splicing of two live mysteries into one `[9 3 5]` — **trap**: two designs collapsing into an accident is the repetition problem in reverse

### Converge

1. **The five-verb interpreter with a load-time linter** — the engine core.
2. **Time as a shape** — ageing, retraction, world-carried progress; how "carried" is shown.
3. ★ **Occupation as the way in, answer first** — the start's grammar without a recipe.
4. The **reservation ledger** — infrastructure two live mysteries need.

Traps set aside, each with its reason above: lazy placement, quorum endings, prion splicing.

### Deepened

**1. Five verbs.** A mystery is one data file of PLACE (finding: kind, state,
where — a site tag, "on me", a carrier, a vehicle), LINK (what two known
findings say together), REVEAL (a record delta when a set is known), GATE
(a mechanic — door tried, tool used at an object, skill met, answer given —
that becomes a finding when satisfied), CLOSE (a predicate tree: all-of,
any-of, gate, none = carried). The interpreter folds PLACE into the existing
async placement, watches `known` for LINK/REVEAL/GATE, evaluates CLOSE after
every update; it is pure between calls, so a save replays. A load-time
linter resolves every catalogue reference, runs the honesty word rules over
all prose, checks every GATE has a reachable precondition and CLOSE names
only declared nodes; a failing file never reaches ModData. Downstream needs
no change: `documents / known / comparisons` are the interpreter's output.
*Load-bearing risk:* GATE is where data touches live mechanics; a linter can
check shape, not satisfiability against the world — so a GATE must also
declare what happens if it can never fire (a silence node), or the guarantee
breaks exactly where it matters. *First step:* write the linter first,
against one existing mystery transcribed into the vocabulary.

**2. Time.** Every finding gets a lifecycle alongside its instalment timer —
`stage` (fresh / faded / gone), `lastObservedHour`, `retracted` — advanced
by a pure function reading only what the game already exposes (corpse
decay, outdoor weathering, moved/burned flags); no new simulation, no
cause inferred. A second finding type, the *deferred reveal*, is keyed to an
event (a linked note read, a broadcast tick) rather than a container load,
so progress moves through the world's own causality. A mystery closes in
one of three shapes, each its own: **completed**, **carried** (open, no
state that reads as debt), **retracted** ("gone when I went back").
*Load-bearing risk:* honesty — the engine can never say *why* something is
gone; every retraction is phrased as an absence observed. *First step:* the
lifecycle table on the existing instalment schema and `advanceLifecycle`,
wired as one more read beside the 72-hour expiry.

**3. Occupation as the way in, answer first.** A start is an object graph of
*answer* nodes (the key, the sealed box, the badge with the wrong number)
met before any context, plus a sparse `reads` table keyed by occupation **or
skill threshold** (Electrical ≥ 2), not by occupation name alone — so an
engineer and an electrician share a panel gate and only the electrician
rewires it. The same verb on the same object yields an occupation-flavoured
reading when there is one and a generic, still-ambiguous reading when there
is not; the object and its place in the mystery never change, so one file
serves every occupation without being 25 copies. Misreads are content: a
burglar half-reads a padlock number and gets a false lead in their own
idiom. *Load-bearing risk:* coverage debt — authors write rich reads for the
two or three obvious trades and leave twenty on the flat fallback, which
makes "occupation is the way in" feel arbitrary in play; the diversity guard
must audit reads per occupation across mysteries. *First step:* one existing
start, one answer node, a `reads` map, two occupations played against the
same object.

### Design v1 (end of iteration 1)

- The engine is an **interpreter**, not a generator: mysteries are authored
  data files in a five-verb vocabulary; the seed only chooses *which* mystery
  and breaks ties inside it.
- **Honesty is enforced by a linter at load**, not by author discipline.
- **Endings are data**, three shapes: completed, carried, retracted.
- **Time is a first-class shape**; the world can carry progress.
- **Occupation is a finding source and a gate**, never a label.
- **Placement is a shared service** with a reservation ledger; findings
  declare `where`, the resolver finds it, instalments and expiry as today.
- Old content survives through an **adapter** until each piece is redesigned.

Attacked in iteration 2.

---

## Iteration 2 — attack v1

Frames: inversion (how would v1 still produce sameness?) · one hour, no team
(the crudest thing that proves the shape) · regulator (provable, traceable,
refusable) · speedrunner (skips and abuse) · logistics (findings as a supply
chain). 30 ideas.

### Wide set, clustered `[N V F]`

**F. Where v1 would still make everything the same** (inversion, negated)
- one shared site-tag pool nudges every author to the same convenient places → each mystery declares its own site vocabulary `[6 8 8]`
- LINK as "A + B = one sentence" makes all connective tissue identical → three-way ties, contradictions, red herrings as LINK shapes `[7 8 9]`
- authors default to the cheapest GATE (a skill check) → each mystery commits to one dominant, distinct mechanic `[6 7 8]`
- everyone reaches for `all-of` → CLOSE-shape quotas across the roster `[5 8 8]`
- honesty rules flatten every voice to one hedged register → a per-mystery voice profile the linter audits for drift `[8 6 8]`
- everyone writes for mechanic, doctor, farmer → occupation coverage rotated by the roster `[6 8 9]`

**G. The crudest thing that still proves the shape** (one hour)
- one Lua table, five array keys, one dumb interpreter, no linter yet `[4 9 8]`
- steal the placement service whole; do not touch instalments, expiry or the ledger `[3 9 9]`
- CLOSE as done / not-done first; carried and retracted after `[3 9 6]`
- GATE faked by a tester command before any real hook `[5 8 6]`
- pair binding as a comment, not code, for the first one `[3 8 5]`
- REVEALs straight into the record as plain rows; THREADS untouched `[3 9 7]`

**H. What must be provable, traceable, refusable** (regulator)
- every REVEAL's unlock set resolves against declared PLACE nodes at ship time `[4 9 9]`
- "no counts" checked on **rendered** text after substitution, not the template `[7 9 9]`
- CLOSE re-derivable byte-for-byte by a second interpreter run in parallel (shadow replay), not a checksum after `[7 6 8]`
- a GATE-derived finding proves it was earned this session; a stale carrier reference cannot resurrect it `[6 7 8]`
- the reservation ledger proven conflict-free with every occupation spawned into one seed `[6 7 8]`
- a retraction traceable to a logged absence event, distinguishable from a nil-index crash laundered as "gone" `[8 8 9]`

**I. Skips and abuse** (speedrunner)
- `CLOSE = none` as a zero-effort exit unless "carried" is defined precisely `[6 9 9]`
- REVEAL farming by re-forming a LINK across loads → first-time-only events in the ledger `[5 9 9]`
- a failed GATE persisting beside a later success → GATE findings record hour and mechanic; one per (mystery, node) `[6 8 8]`
- one corpse aliased by two mysteries' reservations → keyed by (mystery, physical key); a body belongs to one mystery at a time `[6 8 8]`
- expiry frozen by save/load or time-skip → in-game hours already saved; nothing wall-clock `[4 9 8]`
- destroying findings to force "carried" → `known` is a ledger and is never un-known; an unfound finding the world lost is *absent*, never a shortcut `[6 9 9]`

**J. Findings as a supply chain** (logistics)
- hub-and-spoke: the survivor's house is the hub; every mystery pre-stages a warm finding there so day one never waits on a container `[6 9 9]`
- cold chain: paper fades in ~24 in-game hours outdoors, photographs in ~48, a corpse on the game's own clock, metal never — readability tiers, not one deadline `[8 7 9]`
- a body ships in instalments: the wallet now, the second wound on a later load `[7 6 7]`
- returns pass: what a carried mystery's survivor took off-site becomes the seed of a later GATE `[7 6 8]`
- batching by dwell time: a cell yields a cluster, not a drip `[7 5 6]` — defer: changes pacing across the mod
- cross-docking a walked-off carrier onto another live mystery `[7 4 4]` — **trap**: two stories quietly become one, the repetition problem inverted

### Converge (iteration 2)

1. **Roster-level diversity guard** — computed shape cards, exact and fuzzy collision, quotas, coverage. The one that would have refused today's twenty-four.
2. **Precise, abuse-proof semantics** for CLOSE / REVEAL / GATE / reservations / expiry — the ledger is the truth.
3. ★ **Hub and cold chain** — a warm start guaranteed at the house; spoilage by material as the mechanism of "time is a shape".
4. **Build order from the one-hour frame**: table + dumb interpreter, steal placement whole, done/not-done first, REVEALs as plain rows, GATE faked by command — then linter, then endings, then time.

Traps: cross-docking carriers; dwell-time batching (deferred, not wrong).

### Deepened (iteration 2)

**1. The diversity guard.** The shape card is **computed, never declared**:
site pattern, finding count, dominant mechanic and CLOSE kind read straight
off the verbs; LINK shapes classified by arity and polarity (pair /
three-way / contradiction / red herring); occupation readings by scanning
REVEAL/GATE text for occupation-keyed sentences; voice by cheap stylometry
over the REVEAL corpus (sentence length, type-token ratio, hedge rate) — a
self-rated register is exactly what flattened voice under the honesty
rules. Two passes at load and in the offline suite: an exact pass on the
tuple {site pattern, count bucket, dominant mechanic, LINK-shape multiset,
CLOSE kind}; a fuzzy pass on TF-IDF cosine of REVEAL corpora (≈0.6). Quotas
cap how many mysteries share one mechanic or CLOSE kind; coverage fails if
any occupation has no authored reading anywhere. A refusal names the
colliding mystery, the matching fields or the score, and a concrete
suggestion. *Load-bearing risk:* calibration — too coarse and authors route
around it (padding prose), too loose and sameness slides through; there is
no ground truth for "too similar" but the owner's judgement. *First step:*
the extractor as a pure function over one file; run it on the Fitness ten
and check the cards against human intuition before any roster comparison.

**2. Abuse-proof semantics.** Three append-only ledgers and one table:
`known` (mystery, node, hour, mechanic) written once on the first REVEAL or
GATE and never deleted — burning the evidence changes nothing; `retracted`
(mystery, node, hour) written only when a not-yet-known node's backing
world state is confirmed gone, which forecloses that node for ever; a
`reservation` table keyed by physical key → one mystery, checked-and-set,
so no second mystery can alias a corpse; and CLOSE as a **pure fold** over
`known ∪ retracted` against the authored predicate — *completed* when the
predicate holds, *retracted* when a required node is in `retracted` and the
predicate can no longer hold, *carried* when the author declared no
completion predicate. "Carried" is therefore not a transition the player
can cause; it is what CLOSE reports for an open-ended design. Re-forming a
LINK is a no-op against `known`; a GATE finding records the hour and the
mechanic that earned it, one per (mystery, node); expiry is a stored
in-game hour checked lazily, so wall-clock tricks stall nothing.
*Load-bearing risk:* the line between "observed absent" and "not yet
searched" — infer absence too eagerly and true findings are retracted from
under the player; too conservatively and nothing ever retracts. It needs a
signal the engine gives honestly: the cell loaded and the container looked
into. *First step:* the ledger row shapes and the CLOSE evaluator as pure
functions, then replay the six exploits as event sequences and assert each
resolves.

**3. Hub and cold chain.** An author declares per PLACE only `kind` (paper /
photo / corpse / metal / key / vehicle) and `where` (hub = the house, a site
tag, a carrier, a vehicle) — no timer. The placement service stamps
`placedAt` when the finding actually spawns; readability is **pulled lazily
at REVEAL time** by a pure function `tier(kind, now − placedAt, site.outdoor)`
→ fresh / worn / illegible, with per-kind fade curves as data (paper ~24 h
outdoors, photo ~48 h, corpse = the game's own decay, metal and keys
constant). `site.outdoor` is a static authored property of the site tag, not
a weather query — no new simulation. The hub is the house's tag with
priority, so a first mystery's warm findings resolve before any spoke needs
the player to have walked. REVEAL text may branch on tier, so the same
mystery read on day three prints different prose. *Load-bearing risk:*
`site.outdoor` mis-tagged makes the curve lie silently, and lazy evaluation
means nobody sees it until a player reads an implausible tier. *First step:*
`spoilage` on the PLACE schema and the one pure `readability` function.

### Design v2 (end of iteration 2) — what changed from v1

- **Sameness is guarded at the roster, not the file**: computed shape cards,
  exact and fuzzy collision, quotas on mechanics and endings, occupation
  coverage. The linter refuses a *set*, and names the collision.
- **LINK is not a pair**: three-way ties, contradictions and red herrings are
  LINK shapes the card counts.
- **Ledgers, not flags**: `known` and `retracted` are append-only; CLOSE is a
  pure fold; "carried" is an authored absence of a predicate, not a state.
- **Every event is first-time-only** by (mystery, node); reservations are
  (physical key → one mystery); expiry is a stored in-game hour.
- **Time as a cold chain**: spoilage per material, readability pulled at read
  time, no new simulation; the house is the warm hub.
- **Honesty checks run on rendered text**, and a retraction must be traceable
  to an absence event so a crash can never masquerade as "gone".
- **Build order** from the one-hour frame: table + interpreter, steal
  placement, done/not-done, plain rows, faked GATE; then linter, endings,
  time, guard.

Attacked in iteration 3.

---

## Iteration 3 — attack v2

Frames: 10-year-old (what does a spreadsheet forget that a mystery needs) ·
hardware engineer (latency, memory, tick budget) · markets (scarce world
resources, several mysteries live, many playthroughs) · remove the
load-bearing assumption (authored-once, five-verbs-only, linter-as-the-only-gate,
one-mystery-at-a-time, PDA-as-the-only-interface).

### Wide set, clustered `[N V F]`

**K. What a checklist forgets** (10-year-old)
- a clue allowed to be wrong sometimes — the muddy print that's just the dog `[7 6 8]`
- showing a clue to someone else and watching their face change, not just logging it privately `[8 5 7]`
- a clue that's embarrassing to find, not neutral data `[7 6 8]`
- the decay clock reads like a chore chart, not dread — it announces its own schedule `[7 7 9]`
- no way to *lie* to get a clue out of someone — GATE only acts on objects, not people `[8 6 8]`
- setting a trap for your own future self (hiding something so later-you gets scared finding it) `[8 4 5]`

**L. Latency, memory, the tick budget** (hardware engineer)
- CLOSE as a dirty-bit fold: only re-evaluate mysteries touched since the last tick, never scan idle ones `[6 8 9]`
- ledgers laid out as parallel columns (mystery/node/hour arrays), not nested tables — cheaper for Kahlua to walk `[5 7 8]`
- reservation as one mutable slot per physical key with a generation counter, not an ever-growing append log `[6 8 9]`
- spoilage as a precomputed lookup table per material, not a function call on the hot path `[5 8 8]`
- mystery data chunk-streamed in lockstep with the world's own chunk boundary `[7 5 6]` — **trap**: couples authoring to engine internals no author should see
- the linter paced to the unfocused 1 fps clock as a background co-routine with its own tick budget, never blocking a focused frame `[6 8 9]`

**M. Scarce resources, many mysteries, many playthroughs** (markets)
- priority-weighted reservation instead of pure first-come: a mystery declares urgency, ties broken by that, not by scan order `[6 7 8]`
- unify spoilage and expiry into one clock instead of two competing timers `[5 7 8]`
- a losing mystery for a contested container gets a fallback site, never nothing `[6 6 7]`
- the diversity guard's quotas as a soft cost (crowding a popular shape gets harder, not refused) rather than a hard block `[6 6 7]` — worth weighing against §2's hard-refusal guard
- auctions / futures / Dutch decay pricing / prediction markets on player attention `[7 3 3]` — **trap**: engineering theatre for a single-player mod with one player and no real contention at the scale this ships

**N. Break the remaining assumptions** (remove the load-bearing assumption)
- a sixth verb, MUTATE: a placed finding rewritten by a later world event `[6 6 6]`
- clue-fragments assembled per seed instead of one complete authored file `[7 4 5]` — **trap**: reintroduces the recipe the whole rebuild exists to remove
- a finding that never reaches the PDA — an NPC's retold, degrading rumour `[8 7 8]`
- one physical object seeded as a finding in two unrelated closeable cases at once, so solving one contaminates the other `[8 5 6]`
- a post-hoc gate (ship unvetted, patch from play telemetry) instead of the load-time linter `[5 3 3]` — **trap**: this mod has one install's play, not telemetry at scale; contradicts §2's provable-before-ship regulator answer
- a later ledger event retracts an already-folded CLOSE, reopening a solved case `[6 3 4]` — **trap**: breaks the append-only ledger iteration 2 built specifically to stop this kind of exploit and to keep saves honest

### Converge (iteration 3)

1. **MUTATE as authored, not free-form** — a finding may change kind/state
   under an authored rule (decay is already this; extend it to "this key,
   once tried, becomes a different finding" — an authored transition, never
   an author-invented sixth freeform verb).
2. ★ **A finding that never reaches the PDA** — an oral or overheard channel,
   degrading with retelling, so the record is provably partial. This is the
   biggest single hole in v2: everything still assumes the PDA sees it all.
3. **Priority on contested resources**, replacing pure first-come.
4. **Chore-chart feeling** (10-year-old) is a real defect in the cold-chain
   design: a clock that announces its own schedule is homework. Spoilage
   must never be shown as a countdown; only its *effect* (fading prose) is
   ever visible.

Rejected, with the rule each breaks:
- clue-fragment assembly (reintroduces the recipe);
- ledgers that un-know (breaks the abuse-proofing iteration 2 built);
- post-hoc/telemetry gating (this is a single-player mod; there is no fleet
  to learn from, only the owner's own play — the linter is what a solo
  author gets instead of telemetry);
- auctions/futures/prediction markets (theatre at this scale — one player,
  a handful of live mysteries at once).

### Deepened (iteration 3)

**2. The second channel.** A finding may declare `heard=true`: it never
occupies a world container and is never searched for; it is spoken by an
NPC or overheard (a radio line, a survivor's aside) and enters `known`
through a listening GATE instead of an inspect GATE. Its REVEAL text is
drawn from a small set per finding and **degrades with retelling** — a
second hearing may drop a detail, never add a false one (the honesty rule
still binds: a rumour is recorded as "I heard that...", never as fact). It
lets a mystery about a person who is never met still be a mystery, and it
answers 10-year-old cluster K's wish to show a clue to someone and watch
their face change — the reverse of that is being *told* something and
having to weigh it. *Load-bearing risk:* "heard" content can't be verified
by the object rules that ground everything else, so it needs its own
honesty rule: a heard finding may never assert what an object finding
proves, only what someone claims. *First step:* one finding kind, `heard`,
in the vocabulary; one existing NPC-adjacent hook (a radio, a met person)
as its first source.

**3. Priority, not pure FIFO.** Each mystery's PLACE call carries a small
declared urgency (already implicit in "essential" vs "optional" today); the
placement service's existing tie-break (`StorageChoices.choose`, a seeded
stable choice) gains urgency as its first sort key, so a mystery close to a
GATE a player is standing at is not starved by one that has not been
touched yet. No auction, no price — one more field on an existing sort.

### Design v3 (final)

Everything from v2, plus:
- **MUTATE is an authored transition on a finding**, not a new freeform verb:
  "tried → confirmed", "fresh → faded" (spoilage), "sighted → lost" (carrier
  gone) are all the same mechanism already used for keys and spoilage,
  generalised and named once.
- **A finding may be heard, not only found** — the PDA is not the only
  interface; a rumour is recorded as a claim, degrading with retelling,
  never promoted to fact.
- **Placement priority, one field**, no market.
- **Spoilage is never shown as a countdown** — only its effect on the prose
  the player reads. (Corrects a v2 gap the 10-year-old frame found.)
- **The diversity guard stays a hard refusal at load**, not a soft price —
  iteration 3's market frame proposed softening it; rejected, because a
  refused roster is provable and a priced one is not, and provability was
  the regulator's whole point in iteration 2.
- **The ledger stays strictly append-only and monotonic** — iteration 3's
  "un-know" idea rejected for the reason above.

This is the design taken into the build plan below.

---

## Build plan, drawn from design v3

Not built. This is what step 1 of `EVERY_MYSTERY_ITS_OWN_2026-09-25.md` (the
engine, behind an adapter) now means concretely, so it can be reviewed
before code moves.

### File layout

```
mod/common/media/lua/shared/ConspiracyFiles/Mystery/
  Vocabulary.lua      -- PLACE/LINK/REVEAL/GATE/CLOSE/MUTATE node shapes; pure
  Linter.lua           -- honesty rules on RENDERED text, reference resolution,
                          catalogue/object-rule checks, GATE reachability
  ShapeCard.lua        -- the computed card (site pattern, count, mechanic,
                          LINK shapes, CLOSE kind, occupation coverage, voice)
  DiversityGuard.lua    -- roster comparison: exact + fuzzy collision, quotas
  Ledger.lua            -- known / retracted / reservation, pure fold for CLOSE
  Spoilage.lua          -- per-material fade curves, tier(kind, elapsed, site)
  Interpreter.lua        -- folds ledger events, evaluates REVEAL/CLOSE, no PZ calls
mod/common/media/lua/client/ConspiracyFiles/
  MysteryPlacement.lua  -- adapter onto the EXISTING Session/World/Storage
                          placement, instalments, carriers, vehicles, priority
  MysteryRuntime.lua    -- wires GATE to real hooks (door tried, tool used,
                          skill met, answer given, heard), replaces the
                          documents[1]/accounted assumptions in GeneratedRuntime
mod/common/media/lua/shared/ConspiracyFiles/Generated/
  LegacyAdapter.lua      -- maps every existing scenario (20 ordinary premises,
                          3 generic openings, Fitness ten, 18 map stories) onto
                          the vocabulary, so nothing already shipped changes
                          behaviour until it is individually redesigned
```

Everything downstream (record rows, THREADS, marks, ledger UI, continuity
carrier, pair registry, object rules, save budget) is untouched: it already
reads `documents / known / comparisons`, and the interpreter still produces
those as its projection.

### Sequencing (unchanged in order from the plan, sharpened in content)

1. **Vocabulary + Linter + Ledger + Interpreter**, proven only against the
   `LegacyAdapter`'s transcription of the existing 20 ordinary premises —
   offline suite green, no behaviour change, before anything new is
   authored. This is where "provable before it reaches a save" is built.
2. **MysteryPlacement + MysteryRuntime**, proven by replaying the Fitness
   opening through the adapter and the native `knox`/`core_loop`/
   `profession_openings` checks — still no new content, same result as today.
3. **DiversityGuard + ShapeCard**, run once over the *legacy* roster as a
   calibration: it must NOT refuse the 20 ordinary premises (they are
   already varied by hand), and it SHOULD have refused the withdrawn 24
   occupation families if pointed at them — that is the guard's own test.
4. **The first bespoke mystery**, written directly in the vocabulary, no
   adapter: the electrician's *unsigned repair* (plan §2), including a GATE
   at a real panel. Played to its own ending on Linux.
5. **The second, deliberately unlike the first**: a different site count, no
   pocket object, the `heard` channel, an ending by carrying.
6. **One at a time from there**, in bounded groups meeting both pairs, each
   with a design note and a Linux run; the Fitness ten and the 24 withdrawn
   families redesigned or retired case by case, never templated again.

### What each step proves on Linux before the next starts

| Step | Native proof |
|---|---|
| 1 | offline suite unchanged; `mutants/run.sh` still 7/7 |
| 2 | `knox`, `core_loop`, `profession_openings` (fitnessinstructor) unchanged results |
| 3 | guard accepts the 20 ordinary + Fitness ten; guard refuses a roster shaped like the withdrawn 24 (a fixture test, not a live refusal) |
| 4 | a new native check drives the panel GATE; the mystery closes as `completed` |
| 5 | the same check family proves a `carried` ending shows honestly on THREADS, and a `heard` finding reaches the record without ever being searched for |

### The seventh question, answered here

Why 240 characters on an object body (DR-20260925-MYSTERY-BOUNDARIES q7):
the cap moves into `Vocabulary.lua` as a **declared constant per finding
kind**, not a global — an object stays terse because a thing has no
sentences on it, a `heard` finding may run longer because it is reported
speech. The number itself (240) is kept unless the first bespoke mystery's
own prose needs otherwise; it was never derived from a technical limit
(save budget headroom is ~10 KB, screen wrapping is separate), so it is
free to move per kind once it is no longer a single hardcoded ceiling.
