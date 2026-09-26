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

At game start, 2+N conspiracies are created — hand-authored, not
procedurally generated, each a complete, internally-consistent
explanation for the Knox event. They are mutually contradictory: at most
one can be "true" in this fiction, but the mod never says which, per the
existing project's own non-negotiable rule (`docs/management/
PM_HANDOFF.md`): *"a lead is never proof... never announces a
solution... two disagreeing leads are a feature, not a bug."* This mod
extends that rule from "one case, ambiguous clues" to "N narratives,
ambiguous evidence" — same philosophy, wider scope.

There are no more short, self-contained cases. Every piece of evidence
in the whole game — object or document — belongs to this one system:
it corroborates or discredits one or more of the N conspiracies. Player
occupation plays no role. Vanilla PZ's own annotated maps and
environmental storytelling (car crashes, staged scenes) are absorbed
into the same system rather than left as unrelated flavor.

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

## 4. Belief has no live meter

Markets' strongest idea, echoed by game design's evidence-destruction
idea: *"belief is never shown live; it only updates when the player
physically visits a specific ledger, chalkboard, or exchange-like object
in the world, on a fixed interval."* This is not just a UI choice — it
is the same "never announce a solution" philosophy applied to *standing*
between conspiracies, not just to any single fact.

**This is also a real candidate for the still-open "what replaces
Knox.OS" question** (`docs/management/NO_HELP_MOD_HANDOFF_2026-09-26.md`'s
own "next planned work" item 1). A single physical, in-fiction object —
a corkboard, a chalked wall, a specific found ledger — that the survivor
returns to and pins/marks things on, rather than a pocket device with a
screen, would give this mod's actual front-end mechanic a reason to
exist that's native to the new content model, not a headless copy of
the old PDA's shape. Worth raising with the owner directly before
committing to any specific front-end technology.

Game design's evidence-destruction idea deserves to travel with this:
*"destroying a piece of evidence... permanently erases it from world
state rather than just your own memory"* — converting "discredit" from
a private belief update into a real, irreversible act with weight,
matching the same stakes-raising the belief-checkpoint idea already
sets up.

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
**one** mystery's worth of state. Supporting **N simultaneous,
cross-referencing** conspiracies is a real extension to that engine, not
a drop-in fit — the stable-ID-and-gloss discipline in section 2 and the
context-based corroboration in section 3 both need to become real data
shapes in `Ledger.lua`/`Vocabulary.lua`, not just an authoring
convention layered on top. That extension is real, scoped, follow-on
engineering work, separate from this document's own job of settling the
content design first.

## 9. Open for the owner

1. How many conspiracies, concretely, for a first cut — "2+n" is the
   design's ceiling, not its starting number.
2. Is the belief-checkpoint object (section 4) the actual answer to
   "what replaces Knox.OS," or a separate mechanic alongside a different
   front-end?
3. Should `Generated/*` be dropped from `mod-nohelp/` now that this
   design confirms it's unused, or kept as inert ballast for now?
