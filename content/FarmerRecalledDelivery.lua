-- THE SECOND MYSTERY. DELIBERATELY UNLIKE THE FIRST ON EVERY SHAPECARD AXIS.
--
-- Owner's active goal: three ADHD frames per phase, then build. Phase E's
-- three frames (remove-load-bearing-assumption, game designer, attacker)
-- converged on this shape:
--   * countBucket "1-2" (two findings), not the electrician's "3-4";
--   * a "heard" finding used as a PRIMARY node, not only GATE-produced;
--   * a REDHERRING link - the one LINK shape LegacyAdapter's own
--     calibration proved the legacy engine can never structurally produce
--     (test/mystery_legacy_adapter.lua), so this mystery is not just
--     differently worded, it uses a connective shape the old engine has no
--     analogue for;
--   * an "answer" GATE, gated on its own precondition (the heard finding
--     must already be known) - closing the attacker frame's real finding
--     that an answer given about evidence that was never heard "certifies
--     a UI/state change rather than a real mystery";
--   * close=nil: permanently carried, proving that ending shape natively
--     for the first time (the electrician mystery proved "gate";
--     mystery_ledger.lua proved "carried" and "retracted" only offline).
--
-- The occupation is in it per DR-20260925-MYSTERY-BOUNDARIES q1: the
-- recall notice means nothing to a survivor who has never run a delivery
-- route: it is the farmer's own knowledge of how a consignment is logged
-- that makes the date on the slip suspicious at all.
local M={}

M.id="farmer-recalled-delivery"
M.centralAxis="supply"

M.findings={
    slip={
        where="site",capacity="prose",kind="receipt",
        observation="A recall slip for a feed consignment, the collection date left blank.",
        source="The stock number matches a delivery the farmer signed for herself, the same week.",
        note="Whoever printed this never came back to finish it.",
        occupation="farmer",
    },
    rumour={
        where="heard",capacity="heard",
        -- A PRIMARY heard finding, not GATE-produced - it is placed the
        -- moment the survivor overhears it near the depot, the same
        -- "second channel" iteration 3 named for the vocabulary, used here
        -- as a first-class node rather than only a GATE's own output.
        note="Someone at the depot says the recalled batch never left the yard at all.",
        occupation="farmer",
    },
    reading={
        where="heard",capacity="heard",
        -- Produced only by the GATE, and only once the rumour is already
        -- known - the survivor is giving a reading of what she has
        -- already heard, not inventing testimony from nothing.
        note="For what it is worth, to a farmer who has filled out this same slip herself: the blank date reads like paperwork nobody meant to finish, not paperwork somebody hid.",
    },
}

M.links={
    {shape="redHerring",requires={"slip","rumour"},
        text="The slip and the yard rumour share the same week. That is the whole of what connects them."},
}

M.gates={
    -- `requires` and `reserve` are extra fields the Vocabulary and Linter
    -- do not need to validate (a GATE's kind and its produced finding are
    -- the whole contract); the runtime reads `requires` to gate "answer"
    -- on the survivor already having heard the rumour, per the attacker
    -- frame's finding that an answer about evidence never heard certifies
    -- nothing real.
    {kind="answer",requires="rumour",produces="reading"},
}

M.reveals={
    {requires={"slip"},text="A recall slip, one date never filled in."},
    {requires={"slip","rumour"},
        text="Two things happened the same week. Whether they are the same story is not for the paperwork to say."},
    {requires={"reading"},text="Her own reading of it, offered for what it is worth: unfinished, not hidden."},
}

-- No completion predicate at all: this mystery is carried by design, never
-- pressured into an ending the survivor's own farm knowledge cannot supply.
M.close=nil

return M
