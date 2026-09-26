-- THE FIRST MYSTERY WRITTEN DIRECTLY IN THE VOCABULARY. NO ADAPTER.
--
-- Owner, 2026-09-25: build plan step 4. From
-- OCCUPATION_MYSTERIES_LINUX_PLAN_2026-09-19.md §2, the electrician's own
-- entry: "The unsigned repair: a service stub links the survivor's
-- interrupted journey to a returned radio component. Who signed for it?
-- ... Recognise the component/reference locally; later examine an
-- isolated panel with tools and sufficient electrical skill to reveal a
-- service identifier."
--
-- Deliberately UNLIKE the legacy shape LegacyAdapter measured (one exact
-- structural tuple across most of the 20 ordinary premises and all of the
-- Fitness ten): two findings, not three-to-seven; one site, not two; a
-- GATE that is a real skill threshold, mechanically nothing like the
-- door-key comparison every legacy case shares; a LINK that is a
-- CONTRADICTION (two service stubs disagree), not the "corroborates/
-- recontextualises" pair every legacy comparison defaults to; and CLOSE
-- reads the GATE's own produced finding, not "every essential known".
--
-- The occupation is in it, per DR-20260925-MYSTERY-BOUNDARIES q1: not a
-- key in the hand or a card with the survivor's name - the electrician's
-- own trade is what makes the panel legible at all. Nothing is in the
-- pocket at the start (q3): both findings are found, not carried.
local M={}

M.id="electrician-unsigned-repair"
M.centralAxis="records"

M.findings={
    component={
        where="site",capacity="object",kind="ElectronicsScrap",wear="poor",
        observation="A returned radio component, its casing cracked, tagged for a repair nobody signed off.",
        source="It is real hardware, not a label - the crack is fresh, the solder is old.",
        note="Someone brought this back. The tag names no one.",
        occupation="electrician",
    },
    stubA={
        where="site",capacity="short",kind="ticket",
        note="Service stub, half of one: a job number and a date, the signature line blank.",
        occupation="electrician",
    },
    stubB={
        where="site",capacity="short",kind="ticket",
        note="A second service stub for the same job number. This one is signed - a name nobody at the depot knows.",
        occupation="electrician",
    },
    panel={
        where="heard",capacity="heard",
        -- Produced by the GATE, not placed: this finding exists only once
        -- the survivor's own trade knowledge reads the panel. `heard` here
        -- is honest in the vocabulary's own sense - the panel does not
        -- give up a document, it gives up what the survivor, reading it as
        -- an electrician, concludes.
        note="Inside the isolated panel, one wire is not factory work. Somebody who knew the trade was in here after the fault was logged.",
    },
}

M.links={
    {shape="contradiction",requires={"stubA","stubB"},
        text="Two stubs for one job number. One says nobody signed. The other says somebody did."},
}

M.gates={
    {kind="skill",produces="panel"},
}

M.reveals={
    {requires={"component"},text="A component, returned and re-tagged. The tag does not say by whom."},
    {requires={"stubA","stubB"},
        text="The job was logged twice, and the two logs cannot both be honest. Someone amended the record, or someone forged an amendment."},
    {requires={"panel"},text="The panel, read as only a trade electrician could read it, shows an amendment: unauthorised, and recent."},
}

-- The ending is the GATE's own finding: reading the panel is what closes
-- this mystery, not accumulating every finding. A survivor who never opens
-- the panel keeps the contradiction as an open question - carried, never
-- pressured into completing by a total the game never shows them.
M.close={kind="gate",keys={"panel"}}

return M
