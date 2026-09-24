-- DATA WITH NO READER IS A BUG THAT LOOKS LIKE CONTENT.
--
-- Playtest 2026-09-24: the Pondview flyer produced no mystery and no lead. The
-- catalogue entry was correct, its coordinates were correct, and 133 flyers
-- were inventoried - and nothing consumed any of it except a place-identification
-- appendix for the twelve a map happened to name. The data was right and unread.
--
-- Nothing in the suite could fail, because every test asked whether the
-- catalogue was well-formed. None asked whether anybody reads it.
--
-- So: for each catalogued set, name the function that consumes it and assert
-- the consumer actually answers for every entry. A producer with no consumer
-- is the shape of that bug, and this is the cheapest way to see it.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Content=require("ConspiracyFiles/MapMediaContent")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Objects=require("ConspiracyFiles/Generated/ObjectCatalogue")

local checked={}

-- 1. FLYERS -> a lead before the journey and a payoff after it.
local flyers,leads,payoffs=0,0,0
for _,id in ipairs(Catalogue.printList) do
    flyers=flyers+1
    local record=Catalogue.print(id)
    if Content.flyerLead(record) then leads=leads+1 end
    if Content.flyerPayoff(record) then payoffs=payoffs+1 end
end
assert(flyers>0,"no flyers at all")
assert(leads==flyers,"only "..leads.." of "..flyers.." flyers give the player a reason to act")
assert(payoffs==flyers,"only "..payoffs.." of "..flyers.." flyers pay off on arrival")
checked[#checked+1]=flyers.." flyers"

-- 2. ANNOTATED MAPS -> a story, and a lead for any that carries handwriting.
local maps,stories,mapLeads,withScrawl=0,0,0,0
for _,id in ipairs(Catalogue.list) do
    maps=maps+1
    local binding=Catalogue.get(id)
    local story=Content.scenario(binding,7)
    if story and story.id then stories=stories+1 end
    if type(binding.sourceText)=="string" and binding.sourceText~="" then
        withScrawl=withScrawl+1
        if Content.lead(binding) then mapLeads=mapLeads+1 end
    end
end
assert(stories==maps,"only "..stories.." of "..maps.." maps reach a story")
assert(mapLeads==withScrawl,
    "only "..mapLeads.." of "..withScrawl.." maps with handwriting offer a lead")
checked[#checked+1]=maps.." maps"

-- 3. MAP STORIES -> every declared part renders, at every slot it claims.
local rendered=0
for _,family in ipairs(Content.families) do
    for _,slot in ipairs(Content.slots(family)) do
        assert(Content.partForSlot(family,slot),
            family.id..": slot "..slot.." resolves to no part")
        rendered=rendered+1
    end
end
assert(rendered>=#Content.families*2,"map story parts are not all reachable")
checked[#checked+1]=#Content.families.." stories"

-- 4. EVERY EVIDENCE KIND A SCENARIO NAMES -> resolves to a real carrier.
--    A kind nothing can build is content that cannot be placed.
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local function get(id,v) return Personal.get(id,v) or Ordinary.get(id,v) end
local kinds,resolved={},0
for _,id in ipairs(Premises.list()) do
    for variant=1,12 do
        local s=get(id,variant)
        if s then
            for _,anchor in pairs(s.anchors or {}) do
                if anchor.kind and not kinds[anchor.kind] then
                    kinds[anchor.kind]=true
                    assert(Kinds.get(anchor.kind),
                        id..": evidence kind '"..anchor.kind.."' resolves to no carrier")
                    resolved=resolved+1
                end
            end
        end
    end
end
assert(resolved>0,"no evidence kinds were checked")
checked[#checked+1]=resolved.." evidence kinds"

-- 5. THE OBJECT CATALOGUE IS READ, not merely present. A scenario object must
--    resolve through the same path the runtime uses to build it.
local objectKinds=0
for kind in pairs(kinds) do
    local carrier=Kinds.get(kind)
    if carrier and carrier.capacity=="object" then
        assert(Objects.get(kind),kind.." is used as an object but is not in the catalogue")
        objectKinds=objectKinds+1
    end
end
checked[#checked+1]=objectKinds.." object kinds"

print("PASS catalogued data has a consumer: "..table.concat(checked,", ")
    .." - each reaches the function that reads it")
