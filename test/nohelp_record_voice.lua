-- NO HELP: THE RECORD IS THE SURVIVOR WRITING, AND IT DOUBTS.
--
-- Owner, Windows playtest 2026-09-25: "we still write 'what YOU found'. I want
-- first person perspective with doubt. 'What I think I found' ... A player
-- can't KNOW." test/record_voice_is_mine.lua holds the older mod to that;
-- this holds the No Help mod (NHShared) to the same rule, and the words that
-- sit in the writing around a record: the links between findings and where a
-- file is now. Each assertion can fail: change one word to "YOU", "confirmed",
-- "proves", "definitely" or "certain" and it names the line.
--
-- It checks the phrasings on its lists and nothing else; it does not judge
-- tone, and it never reads a clue's own words (those are the paper's, not the
-- survivor's).
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path
local H=require("NHShared/Headings")

local SECOND={"you","your","yours","yourself"}
local CERTAIN={"confirmed","confirms","confirm","proves","proven","proof","certain",
               "certainly","definitely","undeniably","verified","verifies",
               "established","establishes","undoubtedly","conclusively","indisputably"}
local DOUBT={"think","seems","might","maybe","perhaps","could","not sure"}
local FIRST={"i","me","my","mine"}

local function words(text) return " "..text:lower():gsub("[^%a]+"," ").." " end
local function has(text,list)
    local w=words(text)
    for _,x in ipairs(list) do if w:find(" "..x.." ",1,true) then return x end end
end
local function slurp(path)
    local f=assert(io.open(path,"rb"));local s=f:read("*a");f:close();return s
end
-- One line, one rule set. `needDoubt` for lines that say what a thing means.
local function voice(line,needDoubt)
    assert(type(line)=="string" and line~="","a line with no text")
    local you=has(line,SECOND)
    assert(not you,"speaks to the player, not as them: '"..line.."' says '"..tostring(you).."'")
    assert(has(line,FIRST),"not in the survivor's own voice: "..line)
    local sure=has(line,CERTAIN)
    assert(not sure,"claims certainty: '"..line.."' says '"..tostring(sure).."'")
    if needDoubt then assert(has(line,DOUBT),"no doubt in it: "..line) end
end

-- 1. Every heading ----------------------------------------------------------
assert(#H.ALL>=15,"heading set too thin: "..#H.ALL)
local seen={}
for _,h in ipairs(H.ALL) do
    assert(not seen[h],"the same heading twice: "..h); seen[h]=true
    assert(h:match("^%u[%u%s]+$"),"not an ALLCAPS block heading: "..h)
    voice(h)
end
for _,h in ipairs({H.FOUND,H.MEANING,H.POINTS,H.WRITER,H.SCRAWL,H.WHOSE}) do voice(h,true) end
assert(H.FOUND=="WHAT I THINK I FOUND","the owner's own wording: "..H.FOUND)


-- 2. The old narrator wording stays out -------------------------------------
local BANNED={"WHAT YOU FOUND","WHAT IT MIGHT MEAN","MAP NOTE","DATE NOTE",
              "WHAT SOMEBODY WROTE","WHERE IT POINTS","WHO WROTE IT",
              "WHAT THE FLYER SAYS","WHERE IT IS","WHOSE PLACE THIS WAS",
              "WHAT IS ACTUALLY HERE","WHAT THAT IS WORTH"}
local SOURCES={"mod-nohelp/common/media/lua/shared/NHShared/MapMediaContent.lua",
 "mod-nohelp/common/media/lua/shared/NHShared/Generated/DocumentPages.lua",
 "mod-nohelp/common/media/lua/client/NHShared/EvidenceRows.lua",
 "mod-nohelp/common/media/lua/client/NHShared/ClueMarkers.lua"}
for _,path in ipairs(SOURCES) do
    local text=slurp(path)
    for _,old in ipairs(BANNED) do
        assert(not text:find('"'..old,1,true),path..' still writes the narrator heading "'..old..'"')
    end
end

-- 3. Links between findings -------------------------------------------------
local nlinks=0
for kind,line in pairs(H.LINKS) do nlinks=nlinks+1; voice(line,true) end
voice(H.LINK_OTHER,true)
assert(nlinks>=3,"only "..nlinks.." link wordings")

-- 4. Where a file is now (EvidenceRows.WHEREABOUTS, read from source: the
-- module needs the engine) --------------------------------------------------
local rows=slurp("mod-nohelp/common/media/lua/client/NHShared/EvidenceRows.lua")
local block=assert(rows:match("Rows%.WHEREABOUTS=(%b{})"),"WHEREABOUTS moved; this sweep reads nothing")
local nwhere=0
for line in block:gmatch('=%s*"([^"]+)"') do nwhere=nwhere+1; voice(line) end
assert(nwhere>=5,"only "..nwhere.." whereabouts sentences")
assert(rows:find("meanings=Headings.LINKS",1,true),"the device no longer takes its link wording from Headings")

-- 5. The map line under a record --------------------------------------------
local marker=slurp("mod-nohelp/common/media/lua/client/NHShared/ClueMarkers.lua")
local fn=assert(marker:match("function M%.note%(id%)(.-)\nend"),"ClueMarkers.note moved")
local nmap=0
for line in fn:gmatch('"([^"]+)"') do nmap=nmap+1; voice(line) end
assert(nmap>=4,"only "..nmap.." map lines")

-- 6. Through the real projection --------------------------------------------
local Content=require("NHShared/MapMediaContent")
local Catalogue=require("NHShared/MapMediaCatalogue")
local surfaces=0
for _,id in ipairs(Catalogue.list) do
    local b=Catalogue.get(id)
    for _,made in ipairs({Content.lead(b),Content.cameHere(b),Content.mapNote(b),Content.whosePlace(b,7)}) do
        local detail=type(made)=="table" and made.detail or made
        if type(detail)=="string" then
            surfaces=surfaces+1
            for _,old in ipairs(BANNED) do
                assert(not detail:find(old,1,true),id..' writes the narrator heading "'..old..'"')
            end
        end
    end
end
assert(surfaces>=20,"only "..surfaces.." map-media surfaces swept")

print("PASS nohelp record voice: "..#H.ALL.." headings, "..nlinks+1 .." link wordings, "..nwhere
    .." whereabouts lines, "..nmap.." map lines and "..surfaces.." map surfaces, all first person with no certainty words")
