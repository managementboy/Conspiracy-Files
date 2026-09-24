-- EVERY ANNOTATED MAP TRIGGERS A MYSTERY, AND THAT MYSTERY REACHES THE
-- CAMPAIGN'S CENTRAL QUESTION.
--
-- A vanilla annotated stash map is the strongest evidence surface this mod
-- has: somebody's own handwriting, marking a real place, shipped by the base
-- game. "mom's trailer / remember: one bite = death" is not mod prose.
--
-- Two separate claims, and before 2026-09-24 only the first was true:
--
--   1. Every map produces a story. It already did - 125 maps select from 17
--      authored incidents by family, derived from the map's own scrawl.
--   2. That story reaches the central conspiracy. It did NOT. All 17 stories
--      were unbound, so a player could follow a stranger's marked map to a
--      real place, find a real incident, and have it connect to nothing.
--
-- Both are now checked, for every map and across seeds, because the story is
-- seed-selected and a binding that holds only at seed 1 is not a binding.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Content=require("ConspiracyFiles/MapMediaContent")
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Pair=require("ConspiracyFiles/Generated/ConspiracyPair")

local maps=Catalogue.list

-- 0. THE CATALOGUE IS COMPLETE AGAINST THE GAME, not merely self-consistent.
--
-- "All the annotated maps" is only meaningful if the mod knows all of them.
-- The research catalogue (docs/research/vanilla-print-2026-09-19) classifies
-- every piece of vanilla printed media by `kind`, and exactly 125 records are
-- "annotated map" - 111 are flyers and 22 are brochures. WestMapleCountryClub
-- matched an earlier substring search for "Map" and is a brochure; there is no
-- 126th map.
--
-- This check exists so that stays true rather than being assumed. If a Project
-- Zomboid update ships another annotated map, the research catalogue is
-- refreshed and this fails immediately, instead of the suite quietly reporting
-- full coverage of a set that has grown.
local function researchMapIds()
    local f=io.open("docs/research/vanilla-print-2026-09-19/catalogue.json","rb")
    if not f then return nil end
    local raw=f:read("*a"); f:close()
    local ids,id={},nil
    -- Walk id/kind pairs in document order; each record states both.
    for key,value in raw:gmatch('"(%a+)"%s*:%s*"([^"]*)"') do
        if key=="id" then id=value
        elseif key=="kind" and value=="annotated map" and id then ids[id]=true; id=nil end
    end
    return ids
end

-- The INSTALLED GAME is the better authority, when it is present. Project
-- Zomboid declares every stash in media/lua/shared/StashDescriptions via
-- StashUtil.newStash(id, "Map", item, "Stash_AnnotedMap"). Counting those on
-- 42.20.4 gives 125, all of them type "Map" and kind "Stash_AnnotedMap", and
-- that set matches the mod's bindings exactly. Reading the game rather than an
-- archived snapshot means a future update that adds a map fails this test on
-- the machine that has the update, without waiting for a research refresh.
local function installedMapIds()
    local home=os.getenv("HOME")
    if not home then return nil end
    local dir=home.."/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid"
        .."/media/lua/shared/StashDescriptions"
    local listing=io.popen('ls "'..dir..'" 2>/dev/null')
    if not listing then return nil end
    local ids,found={},false
    for name in listing:lines() do
        if name:find("%.lua$") then
            local f=io.open(dir.."/"..name,"rb")
            if f then
                local raw=f:read("*a"); f:close()
                for id,kind in raw:gmatch('StashUtil%.newStash%("([^"]+)"%s*,%s*"([^"]+)"') do
                    if kind=="Map" then ids[id]=true; found=true end
                end
            end
        end
    end
    listing:close()
    if not found then return nil end
    return ids
end

local research=installedMapIds() or researchMapIds()
if research then
    local shipped={} for _,id in ipairs(maps) do shipped[id]=true end
    local missing,extra={},{}
    for id in pairs(research) do if not shipped[id] then missing[#missing+1]=id end end
    for id in pairs(shipped) do if not research[id] then extra[#extra+1]=id end end
    table.sort(missing); table.sort(extra)
    assert(#missing==0,#missing.." annotated map(s) in the game are not in the mod's "
        .."catalogue, so they trigger nothing: "..table.concat(missing,", "))
    assert(#extra==0,#extra.." binding(s) are not annotated maps in the research "
        .."catalogue: "..table.concat(extra,", "))
    local n=0 for _ in pairs(research) do n=n+1 end
    assert(#maps==n,"the mod carries "..#maps.." maps and the game has "..n)
end
assert(#maps>=125,"only "..#maps.." annotated maps in the catalogue; the sweep has shrunk")

-- 1. EVERY MAP, EVERY SEED, PRODUCES A STORY WITH A VALID AXIS.
local SEEDS=40
local checked,stories,noStory,unbound=0,{},{},{}
for seed=1,SEEDS do
    for _,id in ipairs(maps) do
        checked=checked+1
        local ok,story=pcall(Content.scenario,Catalogue.get(id),seed)
        if not ok or type(story)~="table" then
            noStory[#noStory+1]=id.."@"..seed.." ("..tostring(story)..")"
        else
            stories[tostring(story.id)]=true
            if not Pair.isAxis(story.centralAxis) then
                unbound[#unbound+1]=id.."@"..seed.." -> "..tostring(story.id)
            end
        end
    end
end
if #noStory>0 then
    error(#noStory.." map/seed combinations produce no story, e.g. "..noStory[1])
end
if #unbound>0 then
    error(#unbound.." map/seed combinations trigger a story that reaches no central "
        .."conspiracy, e.g. "..unbound[1])
end

-- 2. EVERY PAIR CAN SPEAK TO EVERY AXIS THE MAPS ACTUALLY USE. A story bound
--    to an axis its campaign cannot answer would fail in play, not here.
local usedAxes={}
for _,id in ipairs(maps) do
    local story=Content.scenario(Catalogue.get(id),1)
    usedAxes[story.centralAxis]=true
end
local axisCount=0
for axis in pairs(usedAxes) do
    axisCount=axisCount+1
    for _,pairId in ipairs(Pair.list()) do
        local line=Pair.axisLine(pairId,axis)
        assert(type(line)=="string" and #line>0,
            pairId.." has no line for '"..axis.."', which the maps use")
        -- The bridge must not settle anything: the maps are evidence, not a
        -- verdict, and both readings stay live.
        for _,banned in ipairs({"proves","confirms","establishes","therefore"}) do
            assert(not line:lower():find(banned,1,true),
                pairId.."/"..axis.." draws a conclusion: "..line)
        end
    end
end
assert(axisCount>=3,"the maps only reach "..axisCount.." axis/axes; the binding is too narrow "
    .."to be meaningful across 125 places")

local storyCount=0
for _ in pairs(stories) do storyCount=storyCount+1 end
assert(storyCount>=15,"only "..storyCount.." distinct stories reached across "..SEEDS
    .." seeds; the map pool has collapsed")

print(string.format("PASS map mysteries: %d maps x %d seeds = %d checks, %d distinct stories, "
    .."%d axes, every one reaching both central conspiracies",
    #maps,SEEDS,checked,storyCount,axisCount))
