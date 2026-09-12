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
for seed=1,60 do
    local case=G.generate(catalog,seed,opts)
    if case then
        local targets={}
        for _,site in ipairs(case.locations) do
            targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
                containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
        end
        local root=Session.create(case,targets)
        if root then
            -- Worst case for a still-live root is fully discovered but not
            -- yet retired: every document known, connections all resolved.
            local known={}
            for i,doc in ipairs(case.documents) do known[i]=doc.id end
            root.known=known
            local liveBytes=V.estimateEncodedBytes(root)
            measured=measured+1
            if liveBytes>largestLive then largestLive=liveBytes end
            local retired=assert(Retired.retire(root))
            local retiredBytes=V.estimateEncodedBytes(retired)
            if retiredBytes>largestRetired then largestRetired=retiredBytes end
        end
    end
end
assert(measured>=20,"needed a real sample of generated cases, got "..measured)

-- Room must remain for every other canonical root: identities, key connections,
-- local people, markers, addresses, the discovery ledger and visited buildings.
local RESERVED_FOR_OTHER_ROOTS=120000
local worstCampaign=Cases.MAX_ACTIVE*largestLive+(Cases.MAX_CASES-Cases.MAX_ACTIVE)*largestRetired
assert(worstCampaign+RESERVED_FOR_OTHER_ROOTS<=V.MAX_ENCODED_BYTES,
    string.format("MAX_ACTIVE=%d live at %d bytes plus %d retired at %d bytes is %d, which leaves under %d bytes for other roots",
        Cases.MAX_ACTIVE,largestLive,Cases.MAX_CASES-Cases.MAX_ACTIVE,largestRetired,worstCampaign,RESERVED_FOR_OTHER_ROOTS))

-- The cap is a real limit, not decoration: it must still bound the campaign,
-- and retirement must actually be worth doing.
assert(Cases.MAX_CASES>Cases.MAX_ACTIVE,"MAX_CASES must allow more than the concurrently-active bound")
assert(Cases.MAX_CASES>=4,"three cases ended automatic progression far below the budget")
assert(largestRetired<largestLive,"a retired case must measurably shrink, or retirement buys nothing")
assert(Cases.MAX_ACTIVE*largestLive<=V.MAX_ENCODED_BYTES,"the active bound alone must not exceed the budget")

print(string.format(
    "PASS case budget headroom: %d active x %d bytes + %d retired x %d bytes = %d of %d, %d reserved",
    Cases.MAX_ACTIVE,largestLive,Cases.MAX_CASES-Cases.MAX_ACTIVE,largestRetired,worstCampaign,V.MAX_ENCODED_BYTES,RESERVED_FOR_OTHER_ROOTS))
