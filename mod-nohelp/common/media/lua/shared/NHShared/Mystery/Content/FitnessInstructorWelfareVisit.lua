-- THE THIRD MYSTERY. THE FITNESS TEN, REDESIGNED - NOT RETIRED.
--
-- docs/design/EVERY_MYSTERY_ITS_OWN_2026-09-25.md §5 step 6, and the
-- owner's own answer to DR-20260925-MYSTERY-BOUNDARIES q6: "Include them
-- all in the redesign." FitnessOpeningScenarios.lua shipped TEN starts for
-- the fitness instructor that were, by the plan's own words, "the recipe
-- ten times": one shared claim/response/review grammar (a house key, a
-- damaged feed sack, a gathered hoard of spent protective equipment), the
-- same "essential" ending, differing only in the label and the wording of
-- the appointment. This mystery keeps everything that carried real
-- campaign weight - the fitness-instructor occupation, the
-- farm-zero-vs-delivered-agent pair, the movement axis, both of the
-- original's dueling readings of which way the material travelled - and
-- discards the repetition: one authored mystery, not ten variants of one
-- shape, with its own GATE mechanic (a real door, actually tried) that
-- none of the ten ever had.
--
-- Phase F's three ADHD frames converged on redesigning the shared shape
-- itself rather than picking one of the ten labels and calling it done:
-- a "remove load-bearing assumption" frame named the repeated grammar as
-- the load-bearing assumption to remove; a "game designer" frame argued
-- the key/door relationship was the one piece of the original ten that
-- was never actually played (the key was carried, never tried); an
-- "auditor" frame checked that nothing already reserved by the campaign's
-- own pair and axis quietly changes meaning in the rewrite. All three
-- point the same way: keep the content, replace the recipe, and give the
-- key something real to do.
--
-- Deliberately unlike both earlier mysteries on the ShapeCard: four
-- distinct `where`s (onMe, site, vehicle, heard), six findings (bucket
-- "5-6", neither mystery's "3-4"), a "door" GATE (neither "skill" nor
-- "answer"), link shapes {pair,threeWay} (neither "contradiction" nor
-- "redHerring"), and CLOSE kind "all" (neither "gate" nor carried).
local M={}

M.id="fitness-instructor-welfare-visit"
M.centralAxis="movement"

M.findings={
    claim={
        where="onMe",capacity="object",kind="Key1",wear="worn",
        observation="A worn brass house key is in my pocket. I do not remember putting it there.",
        source="It is cut for a real lock, not a label or a decorative prop.",
        note="The door can prove what it opens. Why did I have access to this house?",
        occupation="fitness-instructor",
    },
    appointment={
        where="site",capacity="prose",kind="receipt",
        observation="An appointment card names me, this address, and a client who works a farm.",
        source="The card is a real appointment record, not a note I wrote myself.",
        note="It gives an ordinary reason to visit. It does not explain who arranged the visit, or the key.",
        occupation="fitness-instructor",
    },
    response={
        where="site",capacity="object",kind="AnimalFeedBag",wear="poor",
        observation="A damaged animal-feed sack sits in a room where feed has no reason to be kept.",
        source="The sack is real farm material, its wear and its place both visible.",
        note="It could have come home from sick animals, or been carried here toward them.",
    },
    review={
        where="site",capacity="object",kind="Hat_SurgicalMask",wear="mixed and spent",
        observation="Spent masks and gloves are gathered together in a room where they do not belong.",
        source="The gathering is real, not staged - the items are used, not new.",
        note="A household improvising care could leave this. So could a team that worked here on purpose.",
    },
    vehicle={
        where="vehicle",capacity="object",kind="Cooler",wear="scuffed",
        observation="A scuffed cooler sits in a vehicle parked near the house.",
        source="The cooler is real and inspectable. Nothing marked on it says where it has been.",
        note="It could have carried something away from here, or brought something toward it.",
    },
    doorConfirmed={
        where="heard",capacity="heard",
        -- GATE-produced only, never independently placed: the survivor's
        -- own act of trying the key on the house door, the one mechanic
        -- none of the original ten Fitness starts ever gave the key to do.
        note="The key turns in this door. Whatever question that raises, it is not whether the key belongs to me.",
    },
}

M.links={
    {shape="threeWay",requires={"claim","appointment","response"},
        text="A key I do not remember taking, a visit I did not arrange, and feed with no place in this house - together they ask one question none of them answers alone."},
    {shape="pair",requires={"response","review"},
        text="The feed sack and the gathered protective items sat in the same house. Neither one says which of them arrived first."},
}

M.gates={
    -- A real door, actually tried - not a threshold read off a stat. The
    -- runtime tags one real door near the placed key as this gate's own
    -- target and reports the gate satisfied once that door is genuinely
    -- unlocked, the same discipline place() already holds for a found item.
    {kind="door",produces="doorConfirmed"},
}

M.reveals={
    {requires={"claim"},text="A key, and no memory of taking it."},
    {requires={"claim","appointment","response"},
        text="A key, a visit, and feed with nowhere to be. One of them may be the reason for the other two, or none of them is."},
    {requires={"response","review"},
        text="Feed and spent protective gear, kept in the same house. Something was done here, more than once."},
    {requires={"vehicle"},text="A cooler, in a vehicle, near the house. It could travel either way."},
    {requires={"doorConfirmed"},text="The key opens this door. That much, at least, is no longer a question."},
    {requires={"claim","appointment","response","review","vehicle","doorConfirmed"},
        text="Two readings stay open: the trouble started at the farm and this house held an attempt to move it away, or it started with something carried toward the farm and this house was only ever a stop on the way. Nothing here says which."},
}

-- "All" the way the original's own essential set was: claim, appointment,
-- response and review were never optional in play, and this redesign adds
-- the vehicle and the GATE's own door finding to that same list rather
-- than letting either float free of the ending.
M.close={kind="all",keys={"claim","appointment","response","review","vehicle","doorConfirmed"}}

return M
