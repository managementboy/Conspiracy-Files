-- The relay memo in generated play (P4-R91, owner 2026-09-14).
--
-- Every generated case is dated inside the same days of early July 1993. The
-- owner ruled that coincidence real, and chose how the player meets it: the
-- Dead Air relay memo - authorised access "EFFECTIVE 30 JUNE THROUGH 08 JULY" -
-- turns up in the first case of a game, and once it has been found the
-- records note which papers are dated inside those nine days. As a maybe:
-- the mod does not know the dates mean anything, so it never says they do.
--
-- The memo's own words are read from Content.lua, not copied, so the one
-- approved text is the only text. A consequence to hold onto: generated cases
-- are rebuilt from their seed and compared byte for byte (Generator.validate),
-- so editing that memo in Content.lua sets aside every first case in play.
-- Below 1.0 that is the standing rule anyway (P4-R77) - a new game.
--
-- WHAT YOU FOUND, WHAT IT MIGHT MEAN and NOTE are new prose, and canonical
-- text needs the owner's approval before it ships (ADR-0002).
local Content=require("ConspiracyFiles/Content")

local M={}
M.ASSET="dead-air:asset:access-memo-7c"
M.KIND="memo"
M.TITLE="Access memo / 7C-41"

local FOUND="WHAT YOU FOUND\n"
    .."A typed memo on company letterhead, folded twice. Nothing else filed with it has anything to do with it."
local MEANING="WHAT IT MIGHT MEAN\n"
    .."It could be routine: a telephone contractor telling the police about maintenance, so that nobody reports a technician working late.\n"
    .."It could be an arrangement: nine days in which the police were told in advance what not to write down.\n"
    .."The memo does not say which, and it names nothing else you have found."

M.NOTE="DATE NOTE\n"
    .."Dated inside the nine days the relay memo covers, 30 June to 8 July 1993. That may be coincidence."

function M.body()
    return FOUND.."\n\n"..Content.assets[M.ASSET].bodyText.."\n\n"..MEANING
end

-- Whether a paper carries a date inside 30 June - 8 July 1993, both ends
-- included. Generated papers write dates as "July 5, 1993".
function M.inWeek(text)
    if type(text)~="string" then return false end
    for day in text:gmatch("July (%d+), 1993") do
        local d=tonumber(day)
        if d and d>=1 and d<=8 then return true end
    end
    for day in text:gmatch("June (%d+), 1993") do
        if tonumber(day)==30 then return true end
    end
    return false
end

return M
