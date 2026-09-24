-- THE PDA IS AN IN-WORLD TOOL AND MUST NOT TALK ABOUT SAVES.
--
-- Windows playtest, 2026-09-24. The FILES screen for the opening key showed:
--
--   WHERE  Not checked since you loaded this save.
--
-- Owner: "Why are we talking to the player about saves? The PDA is an
-- immersive tool." The state is real - there has been no sighting since the
-- session began - but the survivor experiences that as not having checked, not
-- as a save being loaded.
--
-- The whereabouts strings must convey what the survivor can know, including
-- honest uncertainty, without naming the machinery underneath.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local Rows=dofile("mod/common/media/lua/client/ConspiracyFiles/EvidenceRows.lua")
    or ConspiracyFiles.EvidenceRows
assert(type(Rows)=="table" and type(Rows.WHEREABOUTS)=="table","no whereabouts copy to check")

-- Words that belong to the machine, not to the survivor's world.
local MACHINE={"save","saved","savegame","load","loaded","reload","session","mod ",
               "debug","respawn","null","nil","modata","moddata","schema","runtime"}
local checked=0
for state,text in pairs(Rows.WHEREABOUTS) do
    assert(type(text)=="string" and text~="",state.." has no text")
    checked=checked+1
    local lower=" "..text:lower().." "
    for _,word in ipairs(MACHINE) do
        assert(not lower:find("%W"..word:gsub("%s+$","").."%W"),
            "the PDA tells the player about '"..word.."' in the "..state.." line: "..text)
    end
end
assert(checked>=5,"only "..checked.." whereabouts lines; the sweep is too thin")

-- The unchecked state must still convey that the whereabouts are uncertain -
-- fixing the wording must not quietly turn "I do not know" into a claim.
local unchecked=Rows.WHEREABOUTS.unchecked
assert(type(unchecked)=="string" and unchecked~="","the unchecked state lost its text")
assert(unchecked:lower():find("not checked",1,true)
    or unchecked:lower():find("have not",1,true),
    "the unchecked line no longer says the survivor has not looked: "..unchecked)
assert(unchecked:lower():find("guess",1,true)
    or unchecked:lower():find("uncertain",1,true)
    or unchecked:lower():find("unconfirmed",1,true),
    "the unchecked line no longer conveys uncertainty: "..unchecked)

-- And it must not have become a claim about where the thing is.
for _,claim in ipairs({"it is in","you left it","it is at","still in your"}) do
    assert(not unchecked:lower():find(claim,1,true),
        "the unchecked line claims a location it cannot know: "..unchecked)
end

print(string.format("PASS pda stays in world: %d whereabouts lines, none naming a save, "
    .."a load or a session, and uncertainty still stated",checked))
