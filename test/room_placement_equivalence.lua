-- Adversarial: across many random room tables, the room-aware path must never
-- fail where the baseline succeeded, and must never place two documents in one
-- container.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local ROOMS={"office","bedroom","bathroom","kitchen","toolstore","garagestorage",
             "livingroom","closet","derelict","kidsbedroom","hall"}
math.randomseed(20260908)
local baselineOK,roomOK,mismatch,dupes=0,0,0,0
for seed=1,300 do
  local case=G.generate(catalog,seed,opts)
  if case then
    local candidates,rooms={},{}
    for _,site in ipairs(case.locations) do
      candidates[site.id]={}; rooms[site.id]={}
      for n=1,8 do
        candidates[site.id][n]={x=site.bounds.x1+n,y=site.bounds.y1,z=site.bounds.z,
          objectIndex=n,containerIndex=0,containerType=site.containerTypes[1],sprite="s"}
        -- Some candidates deliberately get no room at all.
        if math.random(4)>1 then rooms[site.id][n]=ROOMS[math.random(#ROOMS)] end
      end
    end
    local base=Session.createDistributed(case,candidates)
    local aware=Session.createDistributed(case,candidates,rooms)
    if base then baselineOK=baselineOK+1 end
    if aware then roomOK=roomOK+1 end
    if base and not aware then mismatch=mismatch+1 end
    if aware then
      local seen={}
      for id,t in pairs(aware.assignments) do
        local key=t.target.x..":"..t.target.y..":"..t.target.objectIndex..":"..t.target.containerIndex
        if seen[key] then dupes=dupes+1 end; seen[key]=true
      end
    end
  end
end
print(string.format("baseline succeeded: %d   room-aware succeeded: %d",baselineOK,roomOK))
print(string.format("REGRESSIONS (baseline ok but room-aware failed): %d",mismatch))
print(string.format("duplicate containers in room-aware results: %d",dupes))
assert(mismatch==0,"room awareness must never fail where the baseline succeeded")
assert(dupes==0,"two documents must never share a container")
print("PASS: room-aware placement is failure-equivalent and still distinct")
