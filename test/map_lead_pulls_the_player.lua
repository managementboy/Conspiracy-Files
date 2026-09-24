-- A MARKED MAP HAS TO PULL THE PLAYER, NOT JUST PAY OUT WHEN THEY ARRIVE.
--
-- Reading an annotated map already started its mystery: R.read activates the
-- trail, seeds it, and moves it to the front of the placement queue. But the
-- chain had no first link the player could see.
--
--   * The organiser said NOTHING on the read. Rows were emitted only for
--     evidence already found, so the handwriting that makes a map worth
--     following was shown as a reward for having already gone.
--   * Reading a PRINT invalidated the organiser's cached list; reading a MAP
--     did not, so even a new row could sit behind a stale list.
--   * The destination answered with a records dispute. The papers there named
--     people, but nothing surfaced them AS people, so a stranger's marked map
--     led to a filing cabinet.
--   * 125 maps share 17 authored incidents, so no story could acknowledge the
--     scrawl that brought the player to it. "Mom was sick. I didn't want her to
--     turn. Please come see me" was answered by a fuel reservation dispute, and
--     the mod never admitted the gap.
--
-- These three texts are the fix, and they are pure so they can be tested
-- without a game. The runtime only decides WHEN to show them.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Content=require("ConspiracyFiles/MapMediaContent")

local maps=Catalogue.list
assert(#maps>=125,"only "..#maps.." annotated maps; the sweep has shrunk")

-- 1. EVERY MAP WITH HANDWRITING OFFERS A LEAD, AND THE LEAD QUOTES IT EXACTLY.
local leads,withScrawl=0,0
for _,id in ipairs(maps) do
    local b=Catalogue.get(id)
    local scrawl=b.sourceText
    if type(scrawl)=="string" and scrawl~="" then
        withScrawl=withScrawl+1
        local lead=Content.lead(b)
        assert(lead and type(lead.detail)=="string","no lead for "..id)
        leads=leads+1
        -- Verbatim. A paraphrase of somebody's last message is a different
        -- message, and the scrawl is the only part of this the player trusts.
        assert(lead.detail:find(scrawl,1,true),
            id..": the lead does not quote the handwriting exactly")
        -- It must say where, and that the player has not gone.
        assert(lead.detail:find("WHERE IT POINTS",1,true),id..": the lead never says where it points")
        assert(lead.detail:find("not been there",1,true),
            id..": the lead does not say the place is unvisited")
        -- And it must not pretend to know who wrote it.
        assert(lead.detail:find("Nobody signed it",1,true),
            id..": the lead must admit the marks are unsigned")
        for _,claim in ipairs({"wrote this","their map","the writer was","drawn by"}) do
            assert(not lead.detail:lower():find(claim,1,true),
                id..": the lead claims authorship of unsigned marks: "..claim)
        end
    end
end
assert(withScrawl>=100,"only "..withScrawl.." maps carry handwriting; the pull rests on it")
assert(leads==withScrawl,"every map with handwriting must offer a lead")

-- 2. THE FIRST FINDING ANSWERS THE HANDWRITING; LATER ONES CARRY THE NOTE.
for _,id in ipairs({maps[1],maps[40],maps[#maps]}) do
    local b=Catalogue.get(id)
    if type(b.sourceText)=="string" and b.sourceText~="" then
        local came=Content.cameHere(b)
        assert(came and came:find("WHY I CAME HERE",1,true),id..": the first finding ignores the scrawl")
        assert(came:find(b.sourceText,1,true),id..": the first finding misquotes the scrawl")
        -- It admits the gap rather than closing it.
        assert(came:find("Whether it is what they meant, I cannot say",1,true),
            id..": the first finding claims the incident is what the writer meant")
        local note=Content.mapNote(b)
        assert(note and note:find("MAP NOTE",1,true),id..": later findings lost the map note")
        assert(came~=note,id..": the first finding must differ from the plain note")
    end
end

-- 3. THE PLACE ANSWERS WITH A PERSON, AND REFUSES TO CALL THEM THE WRITER.
local named=0
for _,id in ipairs(maps) do
    local b=Catalogue.get(id)
    local whose=Content.whosePlace(b,7)
    if whose then
        named=named+1
        assert(whose:find("WHOSE PLACE THIS WAS",1,true),id..": the payoff has no person section")
        assert(whose:find("name to ask after",1,true),
            id..": the payoff does not hand the player a name to carry")
        -- The one inference the observation rules forbid.
        assert(whose:find("cannot say either of them",1,true),
            id..": the payoff must refuse to name the map's author")
        for _,claim in ipairs({"wrote the map","drew the map","their handwriting","signed it"}) do
            assert(not whose:lower():find(claim,1,true),
                id..": the payoff infers authorship from co-location: "..claim)
        end
    end
end
assert(named==#maps,"only "..named.." of "..#maps.." places answer with a person")

-- 4. THE PERSON IS STABLE FOR A SEED AND VARIES ACROSS THEM, or "a name to ask
--    after" would be a different name every time the player looked.
local b=Catalogue.get(maps[1])
assert(Content.whosePlace(b,7)==Content.whosePlace(b,7),"the named person is not stable for a seed")
local distinct={}
for seed=1,40 do
    local people=Content.people(b,seed)
    assert(type(people.name)=="string" and people.name~="","seed "..seed.." names nobody")
    distinct[people.name]=true
end
local n=0; for _ in pairs(distinct) do n=n+1 end
assert(n>=2,"forty seeds named "..n.." person(s); the place always answers the same")

-- 5. THE RUNTIME MUST ACTUALLY USE THESE TEXTS.
--
-- Found by the mutation corpus (mutant 005): disabling the runtime's call to
-- Content.lead left every one of 197 tests green. Sections 1-4 above test the
-- pure builders, so the producer was covered and the consumer was not - the
-- same shape as the Pondview bug these builders were written to fix.
--
-- Read as source rather than executed, because MapMediaRuntime needs a live
-- game. That is weaker than calling it, and it is the difference between
-- noticing this and not.
local function source(path)
    local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s
end
local runtime=source("mod/common/media/lua/client/ConspiracyFiles/MapMediaRuntime.lua")
-- Match the NAME, not "name(": these are invoked both directly and as a
-- reference handed to pcall, and asserting on the open paren reported
-- Content.whosePlace as absent while line 392 was calling it through pcall.
for _,name in ipairs({"Content.lead","Content.cameHere","Content.mapNote",
                      "Content.whosePlace","Content.flyerLead","Content.flyerPayoff"}) do
    assert(runtime:find(name,1,true),
        "MapMediaRuntime no longer uses "..name.." - the text is built and never shown")
end
-- And the lead must reach a row, not be computed and dropped.
assert(runtime:find("map-lead:",1,true),"the lead is never given a row id")
assert(runtime:find("flyer-lead:",1,true) and runtime:find("flyer-found:",1,true),
    "the flyer lead and payoff never reach rows")

print(string.format("PASS map lead: %d maps offer a lead quoting their handwriting, "
    .."the first finding answers it, and %d places answer with a person "
    .."without claiming they signed the marks",leads,named))
