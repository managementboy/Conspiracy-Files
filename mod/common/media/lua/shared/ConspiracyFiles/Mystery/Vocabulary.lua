-- THE FIVE-VERB VOCABULARY, AND THE ONE TRANSITION.
--
-- Owner, 2026-09-25, on twenty-four hand-shaped-alike mysteries: "Repetitions
-- break the illusion of a true mystery. Every mystery has to be different by
-- design. No one can be like the other." Then: "build the new engine and
-- content. Take time to hone into a good design first. Reiterate at least
-- three times." docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md is that
-- work; this module is design v3's vocabulary, node shapes only.
--
-- An author writes a mystery as DATA in this vocabulary, never as logic:
--   PLACE   a finding - a catalogue object or a paper, its state, where it
--           is (a site tag, "on me", a carrier, a vehicle) or that it is
--           HEARD (never placed in the world at all, only spoken).
--   LINK    what a set of known findings says together - a pair, a
--           three-way tie, a contradiction, or a red herring. Not always a
--           pair: iteration 2 found that "LINK is always A+B" is itself a
--           way every mystery reads alike.
--   REVEAL  record text unlocked once a set of findings is known.
--   GATE    a mechanic the survivor must DO - a door tried, a tool used at
--           an object, a skill met, an answer given, a thing heard - which
--           becomes a finding once satisfied.
--   CLOSE   the ending, as data: all-of a set, any-of a set, a gate, or
--           nothing declared at all - which means CARRIED. Carried is never
--           something the survivor reaches; it is what CLOSE reports when
--           the author wrote no completion predicate.
--   MUTATE  an AUTHORED transition on one finding already placed - not a
--           sixth freeform verb (iteration 3 rejected that: it would let a
--           mystery lie about what it already recorded). The only mutations
--           this vocabulary allows are declared alongside the finding they
--           apply to: "tried" -> "confirmed", "sighted" -> "lost" (a
--           carrier gone), and spoilage's own "fresh" -> "worn" -> "faded".
--
-- WHAT NEVER MOVES HERE, because it is not shape (DR-20260925-MYSTERY-
-- BOUNDARIES): honesty is enforced by Linter.lua, never by this module;
-- placement, discovery and the record stay the existing engine's job.
-- This module is pure data description - it can be required with no PZ
-- dependency, exactly like Story.lua and Generator.lua before it.
local M={}

-- Every finding kind an author may use. "object" and "prose"/"short" mirror
-- EvidenceKinds' existing capacities; "heard" is new (iteration 3, the
-- second channel) and carries no container at all.
M.CAPACITY={object=true,prose=true,short=true,heard=true}

-- Where a PLACE may put a finding. "site" needs a site tag the mystery
-- itself declares (as many as needed - DR-20260925-MYSTERY-BOUNDARIES q4);
-- "onMe" starts in the survivor's hand; "carrier" and "vehicle" are the
-- existing mobile placements; "heard" has no location and needs no site.
M.WHERE={site=true,onMe=true,carrier=true,vehicle=true,heard=true}

-- The shapes a LINK may take (iteration 2, cluster F): naming the shape is
-- what stops every mystery's connective tissue reading as one sentence.
M.LINK_SHAPE={pair=true,threeWay=true,contradiction=true,redHerring=true}

-- What a GATE mechanic actually is. "answer" is the survivor giving a
-- reading, same as the existing closing questions; the rest reuse hooks the
-- runtime already has (a key tried on a door, a tool used at an object, a
-- skill threshold met) or the new heard channel (a GATE that fires on
-- overhearing, not on searching).
M.GATE_KIND={door=true,tool=true,skill=true,answer=true,heard=true}

-- The three ending shapes CLOSE may declare per design v3. `predicate` is
-- `nil` for carried; `{"all"|"any"|"gate", keys={...}}` otherwise.
M.CLOSE_KIND={completed=true,carried=true,retracted=true}

-- The declared object-body cap per finding kind (the seventh question,
-- DR-20260925-MYSTERY-BOUNDARIES: "why 240?" - it was never a technical
-- limit, so it is no longer one global ceiling). An object stays terse
-- because a thing has no sentences on it; a heard finding is reported
-- speech and may run longer. A mystery may declare its own per-kind cap no
-- larger than these; the linter refuses one that does not.
M.MAX_CHARS={object=240,short=280,prose=1400,heard=360}

-- One declared MUTATE transition: `from` and `to` must both be states the
-- same finding's kind allows (Vocabulary does not know which states a kind
-- allows - that is the catalogue/EvidenceKinds' job - only that a
-- transition names two states and nothing invented in between).
function M.validTransition(t)
    return type(t)=="table" and type(t.from)=="string" and t.from~=""
        and type(t.to)=="string" and t.to~="" and t.from~=t.to
end

return M
