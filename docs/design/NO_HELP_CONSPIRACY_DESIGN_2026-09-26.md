# CF: No Help — the conspiracy model

Owner, 2026-09-26, defining "Conspiracy Files: No Help"'s actual content
design, replacing the original mod's model entirely: *"Two or more main
hidden conspiracies explaining the knox even will be created at game
start. We will stop having short misteries... evidence will
corroborat[e] or discredit... 2+n amount of main contradictory
conspiracyies... occupation does not play into anything... Evidence
will not be generated procedurally. At least 50% of evidence will be
objects... No maximum text length."*

Produced via `/adhd`, five isolated frames (game design, biology,
markets, regulator, ant colony). The regulator frame's own findings turn
out to be the load-bearing ones — not because the others were weaker,
but because hand-authoring N simultaneously-live, mutually-contradictory
narratives is fundamentally a **content-integrity problem** before it is
a gameplay one, and every other frame's best ideas only work if that
integrity actually holds.

## 1. The model, stated precisely

**Revised, 2026-09-26, second pass.** The owner dropped "2+N" to exactly
**two** conspiracies: *"You are right about the +n. Let's dropp that. We
will have only two conflicting theories."* Everything below that
originally said "N conspiracies" means these two, specifically — the
general N-way discipline in section 2 still holds (it's easier with two
than with more, not different in kind), but there is no third theory to
design for.

At game start, both conspiracies are created — hand-authored, not
procedurally generated, each a complete, internally-consistent
explanation for the Knox event, and **all of their content exists
before the game ever runs**: nothing is assembled or generated at
runtime, per the owner's own instruction. They are mutually
contradictory: at most one can be "true" in this fiction, but the mod
never says which, per the existing project's own non-negotiable rule
(`docs/management/PM_HANDOFF.md`): *"a lead is never proof... never
announces a solution... two disagreeing leads are a feature, not a
bug."*

There are no more short, self-contained cases. Every piece of evidence
in the whole game — object or document — belongs to this one system: it
corroborates or discredits one or both theories. Player occupation plays
no role. Vanilla PZ's own annotated maps and environmental storytelling
(car crashes, staged scenes) are absorbed into the same system rather
than left as unrelated flavor.

## 1a. The worked example is retired; the replacement pair is chosen

**2026-09-27.** Every mention of "bioweapon-leak vs. natural zoonotic
spillover" earlier in this document and in later working sessions was a
placeholder pair used to illustrate the mechanisms (container-function
affinity, redundancy, placement, map/event integration) — never a
committed premise. That specific pairing is retired and must not be
reused, in this document or in generated content. **None of the
mechanisms above depend on which two premises are picked** —
container-affinity, redundancy, placement, blind-review discipline, and
the map/event integration work all transfer unchanged to the replacement
pair below.

**Owner's choice, 2026-09-27: #1 vs. #17 from the candidate list.**

- **Theory A — Containment Cover-up (#1):** officials/military
  mismanaged the evacuation or containment response and covered up the
  failure.
- **Theory B — Agricultural Program Malfunction (#17):** an experimental
  pesticide/agricultural program malfunctioned.

These two candidates answer different questions by default — A is about
the *response* (was the handling of the outbreak itself incompetent and
concealed), B is about the *origin* (what actually started it). That is
not a defect: the two theories can disagree about which question is even
the right one to ask, which is itself a legitimate axis of contradiction
for this design ("the real story isn't what started it, it's how badly
they botched containing it" vs. "the real story is what started it, and
the cover-up is secondary"). Evidence authoring should lean into this —
Theory A's evidence should mostly be about response/containment
paperwork and actions, Theory B's mostly about the agricultural
program's own operations — rather than forcing both into a symmetric
origin-vs-origin shape.

The other eighteen candidates remain stored below for reference, not
because they are still under consideration for this mod's own two
conspiracies, but as raw material for later reuse (a future mod, a third
mod, or if this pair needs replacing after playtesting):

1. Officials/military mismanaged the evacuation or containment response
   and covered up the failure.
2. An ordinary, nobody's-fault natural outbreak that was always going to
   happen.
3. A local chemical/industrial plant leak, covered up by the company or
   military.
4. A natural wildlife disease outbreak.
5. A secret non-biological military test (explosion, experimental
   device) went wrong at a local site.
6. An unexplained natural/atmospheric event.
7. Negligent contamination of the local water supply.
8. A naturally occurring mold/toxin bloom in food or water.
9. A nearby prison or asylum's population escaped and officials hid it.
10. Pure social panic/psychological contagion, with no physical cause at
    all.
11. A secret government space program had a covered-up accident.
12. A natural meteor/cosmic-dust event.
13. A local cult orchestrated something.
14. A mundane technical failure (power plant, dam, comms tower) cascaded
    into chaos.
15. A downplayed hostile foreign act.
16. An ordinary domestic industrial accident.
17. An experimental pesticide/agricultural program malfunctioned.
18. A naturally occurring crop blight or animal parasite outbreak.
19. Corrupt local officials hid a mining disaster.
20. A genuine unexplained geological/environmental event.

## 2. Authoring integrity — the actual hard problem

Every other design decision below depends on this holding. The regulator
frame named the real failure modes precisely:

**Freeze each conspiracy's axiom set before writing a single piece of
evidence.** A short, fixed list of non-negotiable facts *this*
conspiracy's version of events requires. Every draft item gets checked
against that frozen list, not against the author's memory of it — the
list is the gate, not a guideline.

**No corroborating item ships without its own rival counter-reading
drafted alongside it.** For every piece of evidence written for
conspiracy X, the author also writes — even if only for their own
reference, never shown to the player as such — what a believer in a
rival conspiracy would say about the same object or document. This is
not busywork: it is the mechanical way to guarantee the evidence reads
as genuinely ambiguous rather than accidentally one-sided, which is the
whole point.

**Stable ID + one frozen one-line gloss per evidence item, and
cross-conspiracy references go through the gloss, never the full
notes.** An author writing conspiracy 3's evidence should be able to
reference "the torn manifest stub" by its gloss without reading
conspiracy 1's full internal reasoning about it — otherwise the
author's own god's-eye knowledge of all N conspiracies leaks into
writing that a player will only ever read in isolation, and the
ambiguity becomes fake (consistent to the author, transparent to a
careful player).

**Vanilla content being absorbed is a cited prior claim, ratified or
overturned with a stated reason — never silently reinterpreted.** A
car crash vanilla already placed, a paper map vanilla already
annotates, has its own implicit story. Folding it into a conspiracy
means writing down, explicitly, whether the new evidence agrees with
what the crash already implies or deliberately contradicts it, and why.
Silent reinterpretation is how "integrated into the conspiracies" quietly
turns into "overwrote what vanilla already established" without anyone
deciding that on purpose.

**Blind-play protection.** The owner has chosen to remain unspoiled. The content writer owns vanilla-scene research, selection, and verification. Never ask the owner to discover or confirm a scene, and do not reveal scene names, coordinates, sprites, or evidence details in progress updates. Use a separate test setup for any in-game verification; never use the owner's playthrough.

**Fingerprint the vanilla content version being cited.** PZ patches
change spawn tables and map annotations over time. Recording which
game version's placement a piece of hand-authored evidence assumed means
a future update that changes vanilla's own behavior shows up as a
detected mismatch, not a silent drift nobody notices until a player
reports content that no longer makes sense.

**A blind re-read test, not author's memory, is the actual quality
gate.** Weeks later, or with a second reader: hide which conspiracy an
item targets, guess whether it corroborates or discredits, kill the item
on a wrong guess. This tests whether the evidence reads the same cold as
the author remembers writing it — the only test that catches drift.

## 3. How evidence should mean something

Three frames converged independently on the same shape, from different
angles — markets' evidence pairs that only "short" a rival conspiracy in
*combination*; biology's evidence genuinely double-booked between two
contradictory readings with the game never disclosing which one "really"
counted; ant colony's evidence placed with no textual link at all,
relying purely on the player's own inference from what sits near what.

**Converged principle: most evidence should be ambiguous alone, and
sharpen only through context — what else is nearby, what else is in the
player's hand, not the raw order things were found in.** This is a
direct extension of section 2's "mandatory counter-reading" discipline
into the actual player-facing design: an item's *written* meaning stays
genuinely dual-readable; what makes a player lean toward one conspiracy
is what it sits beside, not a hidden tag resolved the moment it's
picked up.

**Deliberately avoid order-dependent interpretation as the *primary*
mechanism.** The game-design frame named the real trap here directly:
*"the same physical clue reads as corroborating or discrediting a given
conspiracy depending on which other clue you found first... makes
clue-order a hidden state machine, inviting save-scumming to reroll
interpretation."* Context (co-location, combination) is a stable
property of the world; discovery order is a property of the player's
specific playthrough and invites exactly the reload-to-reinterpret
exploit named above. Author for context, not sequence.

### 3a. Place as the mechanism, not just the escape hatch

The owner confirmed this directly with a concrete example: *"A note in a
car crash of an ambulance can explain quiet well why the... bio weapon is
right. And the next clue in a farmhouse disagrees by pointing to animal
sickness. Time not as important as place and opportunity to place
evidence."* A third `/adhd` round (game design, biology, logistics, ant
colony, regulator), run specifically against that example, converged on
two concrete mechanisms — not just the abstract "context over order"
principle above, but an actual answer to *how* place carries meaning:

**Container-function affinity, not building theme.** The obvious, banned
answer is tagging whole buildings by conspiracy ("military base = bioweapon,
farm = zoonotic"). The converged answer instead assigns evidence affinity
to the *container/prop type*, which PZ already scatters across dozens of
unrelated building types for free: gloveboxes (every vehicle) skew toward
transport/chain-of-custody evidence — matching the owner's own
ambulance-note example — first-aid kits and safes skew the same way;
freezers, tool chests, and animal-control lockers skew toward
organic-specimen/zoonotic evidence; filing cabinets and safes deliberately
draw from both pools at a fixed ratio so bureaucratic furniture doesn't
just become a third silo. The car-crash/farmhouse contradiction the owner
described falls out of this almost for free, since a car's glovebox and a
farmhouse's freezer already point opposite ways without any per-building
authoring. **Real risk**: once a player notices "every freezer holds
animal evidence," the container itself becomes a legible lookup table —
the same obvious-tagging failure, just moved one layer down from building
to container. Mitigate by keeping some containers (filing cabinets,
safes) genuinely mixed, and by letting one building host two
oppositely-affined containers so no single roof pattern-matches to one
theory.

**Recurring physical props as the redundancy mechanism.** Section 4a's
"repeat load-bearing facts across 2-3 differently-placed documents" rule
gets a concrete implementation here: the *same* crate ID, manifest
number, or near-verbatim note is planted 3-4 times across physically
dispersed, unrelated location categories, with each instance's *wear
state* (sealed/pristine vs. torn/scavenged) locally reframing it for
whichever site it's found at. A player who finds only one instance gets
a complete, self-contained beat — nothing feels missing, satisfying
section 3's cold-read rule. A player who finds several gets the actual
payoff: recognizing it's one pattern, not four coincidences — a
recognition that depends only on *how many* instances were found, never
on *which order*. **Real risk**: this is fixed, non-procedural content
(section 1), so a single datamine or wiki post spoils the whole pattern
permanently, and near-verbatim repetition risks reading as a bug rather
than a deliberate clue if two instances are found close together. A
non-sequential ID scheme (so one leaked instance doesn't hand over the
whole set) and a deliberate "near-miss" instance — same object, one
altered detail, planted at a site favoring the *opposite* theory — are
both worth using deliberately.

**This needs its own authoring-integrity gate, mirroring section 2 but
for place instead of text.** A frozen location-eligibility ledger — one
row per eligible site, columns for isolation / official-status / function
/ era-of-use, an eligibility value (conspiracy 1-only, 2-only, or both)
derived from a fixed tag rule and never assigned by theme feel — written
*before* evidence is authored, the same way section 2 freezes each
conspiracy's axiom set before writing evidence text. A **blind-location
test** (strip a site's name and theme, describe only its physical facts,
guess which conspiracy it's compatible with) is section 2's blind
re-read test applied to place: it catches a whole region silently
becoming "the bioweapon zone" through accumulated placement choices, even
while every individual item still passes its own text-level check —
recreating order-dependence by geography instead of by discovery order,
which section 3 above already warns against for time.

**Marked-site visit deadline: none (owner clarification, 2026-09-27).** Reading an annotated map does not start a timer. Waiting never makes its marked-site evidence decay, change meaning, relocate, or expire. A player may investigate whenever they choose; do not add deadline-driven urgency to map-linked evidence.

## 4. Belief has no meter, no ledger, no object — only the player's memory

**Corrected, 2026-09-26, second pass.** This section originally proposed
a physical corkboard/chalkboard/ledger object as the front-end for
tracking belief. The owner has since ruled that out explicitly and
absolutely: *"there is no where to store the evidence but in the mind of
the player."* Not "belief is shown less often" — there is no in-fiction
object, screen, or save-file record of standing between the two
conspiracies at all, anywhere, ever. The corkboard idea is withdrawn,
not softened. Any future front-end work must not reintroduce a belief
tracker of any kind, in-fiction or diegetic-looking, since that would
just be Knox.OS with a different skin.

This is a much harder, much more interesting constraint than "no live
meter" was. It means:

- **The mod has zero authority over what the player currently believes.**
  It cannot ask, cannot check, cannot react. There is no hook to build a
  reactive system on — no "if player leans toward conspiracy 1" branch is
  possible anywhere in the design, which retroactively rules out several
  ideas that looked viable under the old section 4 (e.g. any NPC or event
  that "always props up the underdog," already flagged as a trap in
  section 7 for a different reason — this is a second, independent reason
  it can't exist).
- **Every piece of evidence must be authored to work if it's the only
  thing the player has ever seen, and also to work if it's the fortieth.**
  There is no queryable state to write against, so there is no "if
  the player already found X" conditioning possible. Section 3's
  cold-read principle (ambiguous alone, sharpens through context) stops
  being a nice property and becomes the *only* possible authoring mode,
  because it's the only one compatible with the mod having no memory of
  its own.
- **The player's own recall is the single point of failure, and it is a
  real one.** See section 4a below.

### 4a. What "the mind of the player" actually demands of authoring

Converged from a second `/adhd` round (game design, biology, regulator,
3am-on-call, remove-the-load-bearing-assumption), run specifically against
the owner's own question: *"The order of and time of appearing content is
irrelevant?"*

**The honest answer is no — split into two different claims, only one of
which the design can actually deliver.**

- **Content-meaning order-independence: achievable, and now mandatory,
  not just recommended.** Section 3's cold-read rule — every item stands
  alone as if it's the first and only thing found; every corroborating
  pair works with either half found first — was already the right call
  for the reasons in section 3. With no memory anywhere but the player's
  head, it is no longer just good practice, it is the *only* way the
  content can work at all, since nothing else can compensate for
  a player encountering things in an unpredictable sequence.
- **Timing-independence: not achievable, and authoring should plan around
  that rather than pretend otherwise.** Human memory decays. A PZ
  playthrough runs over real days or weeks, with permanent character
  death. The entire mechanic depends on a player holding two specific,
  contradictory facts in mind at once long enough to feel the
  contradiction — and if those two facts are found real-world weeks
  apart, or the character who found the first one died before finding the
  second, that felt contradiction may simply never fire. This is a real
  risk to the core loop working at all, not a minor pacing concern.

**The real operational risks this constraint creates** (3am-on-call
frame, the useful list to actually check against before authoring):

- **Permadeath world-state mismatch.** A new character inherits whatever
  the world already looks like — evidence a previous, now-dead character
  already found, moved, or destroyed. Nothing tracks this. A new
  character can walk into a scene that's already been half-consumed by
  their own predecessor with no in-fiction explanation.
- **Multiplayer griefing with no visible trace.** One player's
  belief-driven action (destroying what they've decided is "discredited"
  evidence) is invisible to every other player on the server — no log,
  no marker, nothing. On a shared server this is a real way for one
  player's private conclusion to silently erase content another player
  hasn't seen yet.
- **Static content is guaranteed to get datamined.** "All content
  generated in advance, not procedurally" is the owner's explicit
  requirement (section 1) and it has a real, likely-permanent cost: fixed
  content is spoilable by simply reading the mod's files, with no
  in-fiction countermeasure available (no procedural variation to fall
  back on). Worth the owner knowing this trade was made on purpose, not
  discovering it later as a surprise.
- **Ordinary world attrition silently destroys evidence with nothing to
  detect it.** Fire, hordes, loot respawn, zombie wandering — vanilla PZ's
  own systems can move or destroy a hand-placed item with no signal to
  anyone that it happened, since (per this section) nothing tracks
  evidence state at all.
- **Real-world session gaps are a direct threat to the core loop**, not
  just a UX nicety — see the timing-independence point above.

**The one converged positive technique, and it's a strong one** (biology
+ game design, independently): **pin load-bearing evidence to permanent,
walkable, revisitable locations, and repeat each load-bearing fact across
2-3 differently-worded, differently-placed documents.** Spatial/landmark
memory ("I remember that farmhouse") is far more durable across real
memory decay than recalling a specific sentence read once. Redundancy
across a few placements is the actual defense against both natural
forgetting and the world-attrition risk above — if fire destroys one copy,
two more still exist elsewhere. Authoring should also favor the
**generation effect**: never state a fact's significance directly in the
text; let the act of the player's own inference be what gets remembered,
since self-generated conclusions are recalled better than facts merely
read.

## 5. Vanilla integration, made cheap and safe

Two frames converged on the same practical answer to "how do we afford
to integrate all of vanilla's environmental storytelling and annotated
maps without hand-tuning a whole weighting system": **piggyback on
vanilla's own existing rarity/spawn tables as a belief-weight proxy**
(ant colony) rather than authoring a new one. A conspiracy's "strength"
signal can ride on tiers the base game already runs (common finds lean
toward the mundane conspiracy, vanilla-rare finds toward the fringe one)
instead of requiring bespoke weights per item. Combine this with section
2's citation discipline (ratify-or-overturn, version-fingerprinted) and
vanilla integration becomes a real, boundable authoring task rather than
an open-ended one.

## 6. The 50/50 split, no length cap

Direct requirements, restated as authoring targets rather than
mechanics: at least half of all evidence across all N conspiracies is
physical objects; the rest is text (receipts, photos, notes — the
existing project's own established document families, per
`docs/management/PM_HANDOFF.md`'s own note on `EvidenceKinds.
OBJECT_MAX_CHARS`). No maximum length on any text document — the
original mod's 240-character object-body cap is explicitly not carried
over here. Object evidence, having no body text to lean on for
ambiguity, will need to do its context-dependent work (section 3)
through *placement* — what it's found beside — more than objects in the
original mod did.

## 7. Named traps

- **Undisclosed early-bias imprinting** (biology's "original antigenic
  sin" — the first strong evidence found silently biasing how all later
  similar-surfaced evidence reads). Interesting, but risks reading as a
  bug rather than a feature if the player is never given any way to
  notice it's happening. Use sparingly and deliberately if at all, never
  as the default interpretation mechanism.
- **A dynamic "always props up the underdog" NPC system** (markets).
  Contradicts "evidence will not be generated procedurally" the moment
  it's implemented as a live rule reacting to current standing rather
  than hand-written lines. If used, it should be 2-3 hand-authored
  rumor lines from one hand-placed NPC, not a system that computes which
  conspiracy currently has the least evidence.
- **Order-dependent interpretation as the primary mechanic** — see
  section 3. A real save-scum exploit, not a hypothetical one.

## 8. What this means for the existing engine

> **Correction, 2026-09-27.** "`Generated/*` is not load-bearing" below is
> wrong. The generated runtime (`GeneratedRuntime.lua` → `Generated/*`) is one
> of two live, mutually exclusive, debug-gated placement paths, and the only
> caller of `StaleClue.lua`; it also carries the whole-map address book and
> live container checks. Its runtime *case generator* is what conflicts with
> authored content. Placement itself is meant to be rule-based
> (DR-20260927-NOHELP-RULE-PLACEMENT), so `Generated/*` is a candidate host
> for it rather than ballast. Question 3 of section 9 is reopened on that
> basis.

`mod-nohelp/` already carries forward both of module B's
content-generation systems: the legacy **procedural** engine
(`Generated/*`, ~40 files — roles, carriers, evidence-kind tables) and
the newer **hand-authored** engine (`Mystery/*` — `Ledger.lua`,
`Interpreter.lua`, `Vocabulary.lua`, `ShapeCard.lua`, three example
authored mysteries). "Evidence will not be generated procedurally"
confirms this design builds on the hand-authored `Mystery/*` engine, not
`Generated/*`. `Generated/*` is not load-bearing for this design and is
currently dead weight in the extracted package — worth a deliberate
decision (keep as unused ballast, or drop it from `mod-nohelp/`
entirely) once this design is confirmed, not urgent on its own.

The `Mystery/*` engine's existing shape (one `Ledger`, hand-authored
`Content/*` mysteries, `Interpreter.close()` reading it) was built for
**one** mystery's worth of state, and per section 4's correction it
should not grow into anything that *tracks belief* either — with two
conspiracies and zero tracked player state, the actual engineering need
is narrower than originally scoped: enough shared vocabulary/stable-ID
plumbing (section 2) to keep both conspiracies' evidence internally
consistent at authoring time, and nothing that persists a belief value
anywhere at runtime. That's real, scoped, follow-on engineering work,
separate from this document's own job of settling the content design
first.

## 9. Open for the owner

1. ~~How many conspiracies~~ — settled: exactly two (section 1).
2. ~~What replaces Knox.OS as a belief-tracking front-end~~ — settled:
   nothing does, there is no belief-tracking front-end of any kind
   (section 4). What front-end (if any) the mod needs for things other
   than belief-tracking — inventory of physical evidence objects, reading
   documents, moving around the map — is still open, but it's a much
   smaller question now than "what replaces the PDA."
3. ~~Should `Generated/*` be dropped from `mod-nohelp/`?~~ — **settled
   2026-09-27, no:** it is the chosen placement engine
   (DR-20260927-NOHELP-RULE-PLACEMENT). Its runtime case generator is what
   gets replaced by authored content.
4. **Permadeath half settled 2026-09-27, DR-20260927-WORLD-KEEPS-EVERYTHING:**
   accept it as a known, unaddressed cost. The world keeps everything a dead
   character took; consumed evidence never returns and nothing marks a
   resolved site. A world is therefore finite, and authoring volume is the
   only mitigation. The one authoring constraint that follows: never put every
   copy of a load-bearing fact where a single death-and-respawn cycle can
   reach them all — which is round 1's redundancy rule already, applied.
   The multiplayer half stays out of scope (P4-R18). Original question, for
   the record: how much should authoring actually plan
   around permadeath world-state mismatch and multiplayer griefing —
   accept them as known, unaddressed costs of "no tracked state," or is
   some minimal mitigation (e.g. evidence categories that are cheap to
   re-place, or simply avoiding placing load-bearing evidence somewhere a
   single death-and-respawn cycle could destroy it) worth building in from
   the start?
5. **New**: the static-content spoiler risk (section 4a) is a direct,
   accepted consequence of "no procedural generation" — worth confirming
   the owner is fine with that trade before a large amount of fixed
   content gets written and published.
6. **Before any content gets authored**: the owner asked for the two
   conspiracies' actual content to be written ("that should be easy for
   an AI like you") — but no core premise for either theory has been
   proposed or confirmed yet. Confirming both conspiracies' central claims
   first avoids a large rewrite if a generated premise turns out to be the
   wrong direction.
