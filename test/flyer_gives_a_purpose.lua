-- FINDING A FLYER MUST GIVE THE PLAYER A REASON TO ACT.
--
-- Windows playtest, 2026-09-24: the owner opened the Pondview Shopping Center
-- flyer and it produced no mystery and no purposeful lead. Reading a flyer
-- saved a timestamp (MapMediaState.printRead) whose only consumer was a
-- place-identification appendix on an already-active map story, and only for
-- the twelve prints some map names in printIds. Pondview is not one of them.
--
-- Measured at the time of the fix: 133 flyers in the catalogue, 12 named by a
-- map, 121 naming nothing. Every one carries real coordinates.
--
-- The owner's requirement is that a found flyer gives a purpose. A flyer does
-- not need a unique mystery; naming a place worth standing in, and recording
-- what the survivor confirmed on arriving, is a meaningful action with a
-- payoff. This test holds that to the whole catalogue rather than to Pondview
-- alone, because a catalogue entry is exactly what did not satisfy the owner.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Content=require("ConspiracyFiles/MapMediaContent")
local State=require("ConspiracyFiles/MapMediaState")

-- 1. PONDVIEW, THE CONCRETE ACCEPTANCE CASE.
local pondview=Catalogue.print("Pondview")
assert(pondview,"Pondview is not in the catalogue")
local lead=Content.flyerLead(pondview)
assert(lead and type(lead.detail)=="string","reading the Pondview flyer yields no lead")
assert(lead.detail:find("Pondview Shopping Center",1,true),"the lead does not name the place")
assert(lead.detail:find("1907",1,true) and lead.detail:find("6371",1,true),
    "the lead does not say where the place is")
assert(lead.detail:lower():find("have not been",1,true),
    "the lead does not say the survivor has not gone")
local payoff=Content.flyerPayoff(pondview)
assert(payoff and payoff.detail:find("Pondview Shopping Center",1,true),
    "reaching Pondview yields no payoff")
assert(lead.detail~=payoff.detail,"the payoff repeats the lead rather than answering it")

-- 2. NEITHER TEXT CLAIMS THE PLACE SURVIVED. A 1993 advertisement is a claim
--    about 1993, and the mod cannot know what is standing.
for _,text in ipairs({lead.detail,payoff.detail}) do
    for _,claim in ipairs({"still open","still trading","is stocked","you will find",
                           "is intact","undamaged","safe to"}) do
        assert(not text:lower():find(claim,1,true),
            "a flyer record promises the place survived ("..claim.."): "..text)
    end
end

-- 3. EVERY FLYER IN THE CATALOGUE GIVES A PURPOSE, not just the twelve a map
--    names. This is the assertion the playtest would have failed.
local total,withLead,withPayoff,noLocation=0,0,0,{}
for _,id in ipairs(Catalogue.printList) do
    total=total+1
    local record=Catalogue.print(id)
    local l=Content.flyerLead(record)
    local p=Content.flyerPayoff(record)
    if l then withLead=withLead+1 else noLocation[#noLocation+1]=id end
    if p then withPayoff=withPayoff+1 end
    if l then
        assert(l.detail:find(tostring(record.title),1,true),id..": the lead does not name its place")
    end
end
assert(total>=133,"only "..total.." flyers; the catalogue has shrunk")
assert(#noLocation==0,
    #noLocation.." flyers name no place and so can give no purpose: "..table.concat(noLocation,", "))
assert(withLead==total and withPayoff==total,
    "coverage is "..withLead.."/"..total.." leads and "..withPayoff.."/"..total.." payoffs")

-- 4. THE VISIT IS RECORDED ONCE AND SURVIVES, and a place cannot be visited
--    on a flyer that was never read.
local root=State.empty()
local afterRead,readChanged=State.printRead(root,"Pondview",5)
assert(readChanged,"the read was not recorded")
local afterVisit,visitChanged=State.printVisit(afterRead,"Pondview",9)
assert(visitChanged,"the visit was not recorded")
local _,again=State.printVisit(afterVisit,"Pondview",11)
assert(again==false,"standing there twice recorded two visits")
assert(State.validate(afterVisit,Catalogue),"a read-and-visited flyer does not validate")
local forged=State.copy(root); forged.printVisits={Pondview=9}
assert(State.validate(forged,Catalogue)==false,
    "a visit to a place whose flyer was never read must be refused")

print(string.format("PASS flyer purpose: %d flyers, every one names a place, offers a lead "
    .."before the journey and a payoff after it, and none promises the place survived",total))
