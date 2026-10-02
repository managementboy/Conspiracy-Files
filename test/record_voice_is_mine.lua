-- THE RECORD IS THE SURVIVOR WRITING, NOT A NARRATOR REPORTING.
--
-- Windows playtest, 2026-09-25. A FILES record read:
--
--   WHAT YOU FOUND
--   A confirmed appointment card names me, this address and a farm-connected
--   client.
--
-- Owner: "we still write 'what YOU found'. I want first person perspective
-- with doubt. 'What I think I found' ... we have mysteries. A player can't
-- KNOW." Two faults in three lines - a narrator addressing the player, and a
-- summary vouching for a card the survivor can only read.
--
-- Same family as test/pda_stays_in_world.lua ("Not checked since you loaded
-- this save") and test/bubble_labels_stay_in_world.lua ("Opening clue"): the
-- words reached the screen from outside the survivor's head. This one holds
-- every heading the device shows to first person, and every summary the
-- survivor writes to what they could actually know.
--
-- What it does NOT claim: it checks the phrasings on its lists and nothing
-- else, exactly as test/premise_consistency.lua does. It constrains the
-- wording; it does not judge the tone.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local H=require("ConspiracyFiles/Headings")
local Story=require("ConspiracyFiles/Generated/Story")
local Memo=require("ConspiracyFiles/Generated/RelayMemo")
local Content=require("ConspiracyFiles/MapMediaContent")
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local G=require("ConspiracyFiles/Generated/Generator")

-- Someone else's voice: the narrator talking to the player.
local SECOND={"you","your","yours","yourself"}
-- Words that turn a reading into a fact. The survivor can read a card, hold a
-- key, stand at an address; none of that lets them vouch for what it means.
local CERTAIN={"confirmed","confirms","confirm","proves","proven","proof",
               "certainly","definitely","undeniably","verified","verifies",
               "established","establishes","undoubtedly","beyond doubt",
               "without doubt","conclusively","indisputably"}
-- Doubt, in the survivor's own vocabulary. A heading may skip it only when it
-- reports what the survivor themselves did - kept it, went there, marked it.
local DOUBT={"think","seems","might","maybe","perhaps","could"}
local FIRST={"i","me","my","mine"}

local function escape(text) return (text:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]","%%%1")) end
local function words(text) return " "..text:lower():gsub("[^%a]+"," ").." " end
local function has(text,list)
    for _,w in ipairs(list) do if words(text):find(" "..w.." ",1,true) then return w end end
end

-- ---------------------------------------------------------------------------
-- 1. Every heading the device shows -----------------------------------------
-- ---------------------------------------------------------------------------
assert(type(H.ALL)=="table" and #H.ALL>=15,"the heading set is too thin: "..#(H.ALL or {}))
local seen={}
for _,heading in ipairs(H.ALL) do
    assert(type(heading)=="string" and heading~="","a heading with no text")
    assert(not seen[heading],"the same heading twice: "..heading)
    seen[heading]=true
    -- The device splits a block on an ALLCAPS first line (KnoxApps.split), so a
    -- heading that is not ALLCAPS stops being a heading on the screen.
    assert(heading:match("^%u[%u%s]+$"),"not an ALLCAPS block heading: "..heading)
    local you=has(heading,SECOND)
    assert(not you,"the heading speaks to the player, not as them: '"..heading.."' says '"..tostring(you).."'")
    assert(has(heading,FIRST),"the heading is not in the survivor's own voice: "..heading)
    local sure=has(heading,CERTAIN)
    assert(not sure,"the heading claims certainty: '"..heading.."' says '"..tostring(sure).."'")
end

-- The three that summarise rather than report an action must carry the doubt
-- itself: this is the owner's actual sentence, "What I think I found".
for _,heading in ipairs({H.FOUND,H.MEANING,H.POINTS,H.WRITER,H.SCRAWL,H.WHOSE}) do
    assert(has(heading,DOUBT),"a summarising heading with no doubt in it: "..heading)
end
assert(H.FOUND=="WHAT I THINK I FOUND","the owner's own wording: "..H.FOUND)

-- And the wording that was on the device must be gone from the shipped mod.
local BANNED={"WHAT YOU FOUND","WHAT IT MIGHT MEAN","MAP NOTE","DATE NOTE",
              "WHAT SOMEBODY WROTE","WHERE IT POINTS","WHO WROTE IT",
              "WHAT THE FLYER SAYS","WHERE IT IS","WHOSE PLACE THIS WAS",
              "WHAT IS ACTUALLY HERE","WHAT THAT IS WORTH"}
local function slurp(path)
    local f=assert(io.open(path,"rb"));local s=f:read("*a");f:close();return s
end
local SOURCES={
 "mod/common/media/lua/shared/ConspiracyFiles/Generated/Story.lua",
 "mod/common/media/lua/shared/ConspiracyFiles/Generated/RelayMemo.lua",
 "mod/common/media/lua/shared/ConspiracyFiles/Generated/DocumentPages.lua",
 "mod/common/media/lua/shared/ConspiracyFiles/MapMediaContent.lua",
 "mod/common/media/lua/client/ConspiracyFiles/EvidenceRows.lua",
}
for _,path in ipairs(SOURCES) do
    local text=slurp(path)
    for _,old in ipairs(BANNED) do
        assert(not text:find('"'..old,1,true),
            path..' still writes the narrator heading "'..old..'"')
    end
end

-- ---------------------------------------------------------------------------
-- 2. The summaries the survivor writes --------------------------------------
-- ---------------------------------------------------------------------------
-- `observation` is the sentence under the heading - the one the owner read on
-- the device - and it is the survivor summarising. It may not vouch for
-- anything: the certainty list applies to it in full.
--
-- `note` is what the survivor makes of it, and it routinely REPORTS what a
-- document claims ("the audit confirms there was no trip") while leaving the
-- question open. Banning the word there would rewrite honest writing into
-- worse writing, so a note is held to a shorter, deliberate list: the survivor
-- vouching in their own person. Say so plainly rather than pretend the sweep
-- is total.
--
-- `source` is the document's own printed words and is NOT swept at all: a card
-- really can be stamped CONFIRMED, and the survivor reading that word is the
-- whole point.
local VOUCHING={"i confirmed","i verified","i proved","i am certain","i am sure",
                "i know that","this proves","it proves","proof that",
                "definitely","certainly","undeniably","beyond doubt",
                "without doubt","conclusively","indisputably"}
local function saysAny(text,list)
    local lower=" "..text:lower():gsub("[^%a]+"," ").." "
    for _,phrase in ipairs(list) do if lower:find(" "..phrase.." ",1,true) then return phrase end end
end
local AUTHORED={"AdministrativeScenarios","CorrespondenceScenarios",
                "FitnessOpeningScenarios","InventoryScenarios",
                "OrdinaryScenarios","PersonalScenarios","PersonalContinuation"}
local swept=0
for _,name in ipairs(AUTHORED) do
    local path="mod/common/media/lua/shared/ConspiracyFiles/Generated/"..name..".lua"
    local text=slurp(path)
    for line in text:gmatch('observation="([^"]*)"') do
        swept=swept+1
        local you,sure=has(line,SECOND),has(line,CERTAIN)
        assert(not you,name.." summary addresses the player ('"..tostring(you).."'): "..line)
        assert(not sure,name.." summary asserts certainty ('"..tostring(sure).."'): "..line)
    end
    for line in text:gmatch('note="([^"]*)"') do
        swept=swept+1
        local you,vouch=has(line,SECOND),saysAny(line,VOUCHING)
        assert(not you,name.." reading addresses the player ('"..tostring(you).."'): "..line)
        assert(not vouch,name.." reading vouches for it ('"..tostring(vouch).."'): "..line)
    end
end
assert(swept>=90,"only "..swept.." authored summaries swept; the sweep is too thin")

-- ---------------------------------------------------------------------------
-- 3. Through the real projection, not the literals --------------------------
-- ---------------------------------------------------------------------------
local body=Story.body("An observation.","PRINTED WORDS","A reading.")
assert(body:sub(1,#H.FOUND)==H.FOUND,"a record no longer opens in the survivor's voice: "..body)
assert(body:find("\n\n"..H.MEANING.."\n",1,true),"the reading lost its heading: "..body)
assert(Memo.body():sub(1,#H.FOUND)==H.FOUND,"the relay memo opens in a narrator's voice")
assert(Memo.NOTE:sub(1,#H.DATE)==H.DATE,"the date note opens in a narrator's voice: "..Memo.NOTE)

-- A whole generated case, rendered the way the device renders it.
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local function opts(extra)
    local o={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
    for k,v in pairs(extra or {}) do o[k]=v end
    return o
end
local cases,docs={},0
for seed=101,180 do
    local case=G.generate(catalog,seed,opts{opening=true,self="Ada Whitlock"})
    if case then cases[#cases+1]=case; break end
end
assert(#cases==1,"the opening must generate for the sweep to mean anything")
for seed=201,260 do
    local case=G.generate(catalog,seed,opts())
    if case then cases[#cases+1]=case end
    if #cases>=9 then break end
end
assert(#cases>=6,"only "..#cases.." cases generated; the sweep is too thin")
for _,case in ipairs(cases) do
    for _,d in ipairs(case.documents) do
        docs=docs+1
        for _,old in ipairs(BANNED) do
            assert(not d.body:find(old,1,true),d.title..' carries the narrator heading "'..old..'"')
        end
        -- The survivor's half of a document carrier: everything up to the
        -- printed words, and everything after the reading's heading. The
        -- paper's own text between them is not swept, for the same reason
        -- `source` is not.
        local opens=d.body:sub(1,#H.FOUND)==H.FOUND
        if opens then
            local cut=d.body:find("\n\n",1,true)
            local summary=d.body:sub(#H.FOUND+2,(cut or #d.body+1)-1)
            local you,sure=has(summary,SECOND),has(summary,CERTAIN)
            assert(not you,d.title.." summary addresses the player: "..summary)
            assert(not sure,d.title.." summary asserts certainty ('"..tostring(sure).."'): "..summary)
        end
    end
end
assert(docs>=3,"only "..docs.." documents rendered")

-- And the map-media surfaces, which write their own headings.
local surfaces=0
for _,id in ipairs(Catalogue.list) do
    local b=Catalogue.get(id)
    local made={}
    local function add(surface,quoted) made[#made+1]={surface,quoted or ""} end
    add(Content.lead(b),b.sourceText); add(Content.cameHere(b),b.sourceText)
    add(Content.mapNote(b),b.sourceText); add(Content.whosePlace(b,7))
    for _,printId in ipairs(b.printIds or {}) do
        local pr=Catalogue.print(printId)
        if pr then
            local words=tostring(pr.title or "").."\n"..tostring(pr.text or "")
            add(Content.flyerLead(pr),words); add(Content.flyerPayoff(pr),words)
        end
    end
    for _,pair in ipairs(made) do
        local made,quoted=pair[1],pair[2]
        local detail=type(made)=="table" and made.detail or made
        if type(detail)=="string" then
            surfaces=surfaces+1
            for _,old in ipairs(BANNED) do
                assert(not detail:find(old,1,true),id..' writes the narrator heading "'..old..'"')
            end
            -- Somebody else's words are quoted verbatim and are allowed to say
            -- anything - "if your reading this ..." is another survivor, and
            -- "Your TV on the fritz?" is a 1993 advertisement. Both are removed
            -- before the sweep; what remains is the survivor's own writing.
            local mine=detail
            for line in tostring(quoted):gmatch("[^\n]+") do mine=mine:gsub(escape(line),"") end
            local you=has(mine,SECOND)
            assert(not you,id.." speaks to the player ('"..tostring(you).."'): "..detail)
        end
    end
end
assert(surfaces>=20,"only "..surfaces.." map-media surfaces swept; the sweep is too thin")

-- ---------------------------------------------------------------------------
-- 4. The map line under the record ------------------------------------------
-- ---------------------------------------------------------------------------
-- ClueMarkers needs the client and the engine, so its four sentences are read
-- from the source, as test/bubble_labels_stay_in_world.lua reads PlayerVoice's
-- bubble labels. "Finding location marked on your world map." was the last
-- second person left on a FILES record.
local marker=slurp("mod/common/media/lua/client/ConspiracyFiles/ClueMarkers.lua")
local fn=marker:match("function M%.note%(id%)(.-)\nend")
assert(fn and #fn>0,"ClueMarkers.note moved; this sweep is reading nothing")
local lines=0
for line in fn:gmatch('"([^"]+)"') do
    lines=lines+1
    local you=has(line,SECOND)
    assert(not you,"the map line under a record speaks to the player ('"..tostring(you).."'): "..line)
    assert(has(line,FIRST),"the map line under a record is not the survivor's: "..line)
end
assert(lines>=4,"only "..lines.." map lines; the sweep is too thin")

print("PASS record voice: "..#H.ALL.." headings first person and hedged, "..swept
    .." authored summaries, "..docs.." generated documents, "..surfaces
    .." map surfaces and "..lines.." map lines, none in a narrator's voice")
