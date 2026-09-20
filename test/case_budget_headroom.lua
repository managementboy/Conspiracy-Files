-- The case cap must stay a measured claim, not a guess. If generated cases grow,
-- this fails and the cap must be re-derived rather than silently overrunning the
-- shared 500 kB canonical budget.
--
-- Case retirement (docs/design/CASE_RETIREMENT.md) means not every root in a
-- campaign has to cost a live root's worst case: MAX_ACTIVE of them may be
-- live at once (undiscovered/un-retired), the rest must already be retired.
-- Nothing forces retirement to happen, so MAX_ACTIVE -- not MAX_CASES alone
-- -- is what keeps the worst case bounded; this test re-derives MAX_CASES
-- from both measured sizes plus that cap.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local largestLive,largestRetired,measured=0,0,0
local largestPartial=0
-- A live case carrying a clue on something that moves (P4-R134): a carrier
-- target is the biggest target there is - a kind, a mark at its longest, and
-- the hour the carrier went missing on top of a placed clue's own fields - so
-- the budget is re-derived with one in EVERY live case rather than assumed to
-- be covered by the car target it resembles.
local largestMobile=0
local CARRIER_MARK_MAX=120
-- A returning organisation now selects an event AUTHORED for that business, so
-- an arbitrary string at STEER_ORG_MAX names no business and every seed is
-- refused. The real worst case is the longest organisation the generator can
-- actually carry over, found here rather than hardcoded.
local function longestSteerOrganisation()
    local Premises=require("ConspiracyFiles/Generated/Premises")
    local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
    local longest=""
    for _,id in ipairs(Premises.list()) do
        local meta=Premises.get(id)
        if not meta.opening and not meta.followUp then
            for v=1,2 do
                local c=Ordinary.get(id,v)
                if c and c.organisation and #c.organisation>#longest then longest=c.organisation end
            end
        end
    end
    assert(longest~="","no authored organisation is steerable")
    assert(#longest<=G.STEER_ORG_MAX,"an authored organisation exceeds the steer cap")
    return longest
end
local STEER_ORG=longestSteerOrganisation()
-- A thousand seeds, not sixty: sixty missed the worst "Listen for it" case by
-- more than the whole remaining headroom (2026-09-15).
for seed=1,1000 do
    -- Worst case: a case steered by earlier answers (P4-R113) - the longest
    -- source id and returning organisation allowed, and "Listen for it", which
    -- adds the radio transcript (P4-R123). Really generated, so it validates.
    local case=G.generate(catalog,seed,{mapId=opts.mapId,buildLine=opts.buildLine,allowSynthetic=true,
        steer={fromCase=string.rep("c",Retired.CASE_ID_MAX),reading="one",way="listen",organisation=STEER_ORG}})
    if case then
        local targets={}
        for _,site in ipairs(case.locations) do
            targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
                containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
        end
        local root=Session.create(case,targets)
        if root then
            -- A PARTIAL case (P4-R133): the same case, gone live with only the
            -- clues that fit, the rest waiting as an open order. A waiting
            -- assignment carries no target, no sprite and no coordinates, so it
            -- must be CHEAPER than a placed one - if it ever were not, four
            -- partial cases could overrun a budget derived from four full ones.
            local partial=Session.create(case,{},{[case.documents[1].id]=targets[case.documents[1].locationId]},123.5)
            if partial then
                local waiting=0
                for _,a in pairs(partial.assignments) do if a.status=="deferred" then waiting=waiting+1 end end
                assert(waiting==#case.documents-1,"the partial fixture must really be half-placed")
                local partialBytes=V.estimateEncodedBytes(partial)
                if partialBytes>largestPartial then largestPartial=partialBytes end
            end
            -- The same case with its one mobile clue on a carrier, at every
            -- field's maximum, and its carrier missing (P4-R134). The mobile
            -- clue is the case's last document, which is the one the generator
            -- may put on something that moves.
            local mobileId=Session.mobileDocId(case)
            local mobileDoc
            for _,d in ipairs(case.documents) do if d.id==mobileId then mobileDoc=d end end
            local mobileSite
            for _,s in ipairs(case.locations) do if s.id==mobileDoc.locationId then mobileSite=s end end
            local carrier={x=mobileSite.bounds.x1,y=mobileSite.bounds.y1,z=mobileSite.bounds.z,
                objectIndex=0,containerIndex=0,containerType=Session.CARRIER_CONTAINER,
                sprite="corpse",carrierKind="corpse",carrierMark=string.rep("m",CARRIER_MARK_MAX)}
            assert(Session.target(carrier,mobileSite),"the worst-case carrier target must be a valid one")
            local withCarrier=Session.create(case,targets)
            if withCarrier then
                local a=withCarrier.assignments[mobileId]
                a.target=carrier; a.status="placed"; a.placedHours=123456.75
                a.missingHours=123450.25; a.relocations=Session.RELOCATE_CAP
                local mobileKnown={}
                for i,doc in ipairs(case.documents) do mobileKnown[i]=doc.id end
                withCarrier.known=mobileKnown
                assert(Session.validate(withCarrier),"a live case with a carrier clue must validate")
                local mobileBytes=V.estimateEncodedBytes(withCarrier)
                if mobileBytes>largestMobile then largestMobile=mobileBytes end
            end
            -- Worst case for a still-live root is fully discovered but not
            -- yet retired: every document known, connections all resolved.
            local known={}
            for i,doc in ipairs(case.documents) do known[i]=doc.id end
            root.known=known
            local liveBytes=V.estimateEncodedBytes(root)
            measured=measured+1
            if liveBytes>largestLive then largestLive=liveBytes end
            -- Every retired row carries where its evidence was last seen, at the
            -- longest text allowed (P4-R104): the worst case, not the usual one.
            local lastSeen={}
            for _,doc in ipairs(case.documents) do lastSeen[doc.id]=string.rep("x",Retired.LAST_SEEN_MAX) end
            local retired=assert(Retired.retire(root,lastSeen))
            for _,row in ipairs(retired.rows) do assert(#row.lastSeen==Retired.LAST_SEEN_MAX,"worst case must be measured at max lastSeen") end
            -- And what the survivor was asked and answered ("What do I make of
            -- it?", P4-R113): names at their longest, every answer given and
            -- used by a case with the longest id allowed.
            assert(retired.offered,"a retired case must carry what its questions are about")
            retired.offered.people={string.rep("n",Retired.NAME_MAX),string.rep("m",Retired.NAME_MAX)}
            retired.offered.organisation=string.rep("o",Retired.ORG_MAX)
            retired.answers={reading="unsure",matters="organisation",way="records",
                changedHours=123456.75,usedBy=string.rep("u",Retired.CASE_ID_MAX)}
            assert(Retired.validate(retired),"the worst-case answers must still be a valid retired case")
            local retiredBytes=V.estimateEncodedBytes(retired)
            if retiredBytes>largestRetired then largestRetired=retiredBytes end
        end
    end
end
assert(measured>=20,"needed a real sample of generated cases, got "..measured)

-- Room must remain for every other canonical root: identities, key connections,
-- local people, markers, addresses, the discovery ledger and visited buildings.
local RESERVED_FOR_OTHER_ROOTS=120000
local retiredCount=Cases.MAX_CASES-Cases.MAX_ACTIVE
-- The schedule the campaign keeps beside its cases: one created-hour per case,
-- plus the debt the last refusal left (P4-R133, SuccessiveCases.setDefer).
local schedule={schema=1,createdHours={},defer={code="no-containers",count=1000000,
    sinceHours=123456.75,dueHours=123480.75,rung=Cases.MAX_RUNG}}
for i=1,Cases.MAX_CASES do schedule.createdHours[i]=i*24.5 end
local scheduleBytes=V.estimateEncodedBytes(schedule)
local worstCampaign=Cases.MAX_ACTIVE*largestLive+retiredCount*largestRetired+scheduleBytes
assert(worstCampaign+RESERVED_FOR_OTHER_ROOTS<=V.MAX_ENCODED_BYTES,
    string.format("%d live at %d bytes plus %d full retired at %d is %d, which leaves under %d bytes for other roots",
        Cases.MAX_ACTIVE,largestLive,retiredCount,largestRetired,worstCampaign,RESERVED_FOR_OTHER_ROOTS))

-- The cap is a real limit, not decoration: it must still bound the campaign,
-- and retirement must actually be worth doing.
assert(Cases.MAX_CASES>Cases.MAX_ACTIVE,"MAX_CASES must allow more than the concurrently-active bound")
assert(Cases.MAX_CASES>=4,"three cases ended automatic progression far below the budget")
assert(largestRetired<largestLive,"a retired case must measurably shrink, or retirement buys nothing")
-- Four PARTIAL cases (P4-R133) plus the whole archive must fit as well. They
-- do because a case waiting for containers is smaller than one holding them,
-- which is the claim this asserts rather than assumes.
assert(largestPartial>0,"the partial-case fixture must have been measured")
assert(largestPartial<largestLive,
    string.format("a partial case (%d) must cost less than a fully placed one (%d)",largestPartial,largestLive))
local worstPartial=Cases.MAX_ACTIVE*largestPartial+retiredCount*largestRetired+scheduleBytes
assert(worstPartial+RESERVED_FOR_OTHER_ROOTS<=V.MAX_ENCODED_BYTES,
    string.format("four partial cases plus the archive is %d bytes",worstPartial))
-- And four live cases each carrying a clue on something that moves (P4-R134).
-- The design claimed "a carrier target is about the size of a car target, which
-- the budget already carries"; this measures it instead of believing it.
assert(largestMobile>0,"the carrier-clue fixture must have been measured")
local worstMobile=Cases.MAX_ACTIVE*largestMobile+retiredCount*largestRetired+scheduleBytes
assert(worstMobile+RESERVED_FOR_OTHER_ROOTS<=V.MAX_ENCODED_BYTES,
    string.format("four live cases with a mobile clue each is %d bytes, which leaves under %d for other roots",
        worstMobile,RESERVED_FOR_OTHER_ROOTS))
assert(Cases.MAX_ACTIVE*largestLive<=V.MAX_ENCODED_BYTES,"the active bound alone must not exceed the budget")

print(string.format(
    "PASS case budget headroom: %d live x %d + %d full retired x %d + schedule %d = %d of %d, %d reserved "
    .."(four partial cases instead of live: %d; four with a mobile clue each: %d)",
    Cases.MAX_ACTIVE,largestLive,retiredCount,largestRetired,scheduleBytes,
    worstCampaign,V.MAX_ENCODED_BYTES,RESERVED_FOR_OTHER_ROOTS,worstPartial,worstMobile))
