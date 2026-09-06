-- The case cap must stay a measured claim, not a guess. If generated cases grow,
-- this fails and the cap must be re-derived rather than silently overrunning the
-- shared 500 kB canonical budget.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local largest,measured=0,0
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
            local bytes=V.estimateEncodedBytes(root)
            measured=measured+1
            if bytes>largest then largest=bytes end
        end
    end
end
assert(measured>=20,"needed a real sample of generated cases, got "..measured)

-- Room must remain for every other canonical root: identities, key connections,
-- local people, markers, addresses, the discovery ledger and visited buildings.
local RESERVED_FOR_OTHER_ROOTS=120000
local worstCampaign=largest*Cases.MAX_CASES
assert(worstCampaign+RESERVED_FOR_OTHER_ROOTS<=V.MAX_ENCODED_BYTES,
    string.format("MAX_CASES=%d at %d bytes each is %d, which leaves under %d bytes for other roots",
        Cases.MAX_CASES,largest,worstCampaign,RESERVED_FOR_OTHER_ROOTS))

-- The cap is a real limit, not decoration: it must still bound the campaign.
assert(Cases.MAX_CASES>=4,"three cases ended automatic progression far below the budget")
assert(Cases.MAX_CASES*largest<=V.MAX_ENCODED_BYTES,"the cap alone must not exceed the budget")

print(string.format("PASS case budget headroom: %d cases x %d bytes worst case = %d of %d, %d reserved",
    Cases.MAX_CASES,largest,worstCampaign,V.MAX_ENCODED_BYTES,RESERVED_FOR_OTHER_ROOTS))
