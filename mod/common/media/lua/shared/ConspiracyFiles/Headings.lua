-- THE RECORD SPEAKS IN THE SURVIVOR'S OWN VOICE, AND IT DOUBTS.
--
-- Owner, Windows playtest 2026-09-25: "we still write 'what YOU found'. I want
-- first person perspective with doubt. 'What I think I found' ... we have
-- mysteries. A player can't KNOW."
--
-- Every ALLCAPS block the device puts above a record used to be written by a
-- narrator standing behind the survivor - WHAT YOU FOUND, WHAT IT MIGHT MEAN,
-- MAP NOTE. The survivor is the only person in Knox. The headings are theirs,
-- so they are written as the survivor would write them: first person, and
-- hedged, because reading a card is not the same as knowing what it means.
--
-- Two rules the headings must keep, both older than this change:
--   * never infer identity or ownership (the observation rules);
--   * two readings stay live, and no heading picks a winner (P4-R127: a lead
--     is never proof).
--
-- The set lives here rather than in each emitter so the device, the paper and
-- the tests cannot drift apart. `test/record_voice_is_mine.lua` holds every
-- entry to first person and refuses certainty words.
--
-- Pure: no PZ dependency.
local M={}

-- The generated record, three parts (Story.body, RelayMemo).
M.FOUND="WHAT I THINK I FOUND"
M.MEANING="WHAT I THINK IT MEANS"
M.DATE="WHAT I NOTICE ABOUT THE DATE"

-- The survivor's own map, and a map somebody else drew on.
M.MARKED="WHAT I MARKED ON MY MAP"
M.MAP_READS="WHAT I CAN READ ON THE MAP"

-- A found, unsigned map: the scrawl, where it goes, who might have drawn it,
-- and what the survivor has done about it.
M.SCRAWL="WHAT I THINK SOMEBODY WROTE"
M.POINTS="WHERE I THINK IT POINTS"
M.WRITER="WHO I THINK WROTE IT"
M.ACTED="WHAT I HAVE DONE ABOUT IT"
M.CAME="WHY I CAME HERE"
M.WHOSE="WHOSE PLACE I THINK THIS WAS"

-- A flyer, before and after standing at the address on it.
M.FLYER="WHAT I READ ON THE FLYER"
M.FLYER_WHERE="WHERE I THINK IT IS"
M.KEPT="WHY I KEPT IT"
M.SOUGHT="WHAT I WAS LOOKING FOR"
M.ARRIVED="WHAT I SAW WHEN I GOT THERE"
M.WORTH="WHAT I MAKE OF THAT"

-- Every heading above, so a sweep cannot miss one that was added later.
M.ALL={M.FOUND,M.MEANING,M.DATE,M.MARKED,M.MAP_READS,M.SCRAWL,M.POINTS,
       M.WRITER,M.ACTED,M.CAME,M.WHOSE,M.FLYER,M.FLYER_WHERE,M.KEPT,
       M.SOUGHT,M.ARRIVED,M.WORTH}

-- Headings the mod adds around a document's own text. Everything from the
-- first of these onwards is the survivor writing, not the paper: it must not
-- reach a page an item carries (DocumentPages).
M.OURS={M.MEANING,M.MARKED,M.MAP_READS,"PHYSICAL OBJECT","CONNECTED"}

return M
