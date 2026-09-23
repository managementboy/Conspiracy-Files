package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local ids={catalog.locations[1].id,catalog.locations[2].id}
local case=assert(G.generateSelected(catalog,1,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
 allowSynthetic=true,opening=true,self="Ada Whitlock",profession="fitnessinstructor"},ids))
local candidates,rooms={},{}
for _,site in ipairs(case.locations) do
 candidates[site.id]={};rooms[site.id]={}
 for i=1,5 do
 candidates[site.id][i]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,
   objectIndex=i-1,containerIndex=0,containerType=site.containerTypes[1],sprite="desk"..i}
  rooms[site.id][i]="bedroom"
 end
end
local destination=case.documents[5].locationId
local site
for _,s in ipairs(case.locations) do if s.id==destination then site=s end end
local raw={x=site.bounds.x2,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,containerIndex=0,
 containerType="vehicle",sprite="Base.VanAmbulance",vehiclePart="TruckBed"}
candidates[destination][#candidates[destination]+1]=raw;rooms[destination][#rooms[destination]+1]="TruckBed"
local waiting=assert(Session.createDistributed(case,candidates,rooms))
local vehicleId=case.documents[5].id
assert(waiting.assignments[vehicleId].status=="deferred",
 "one raw sighting is not enough to bind essential evidence to a random vehicle")
raw.sceneSignature="emergency-transport:stable-twice"
local confirmed=assert(Session.createDistributed(case,candidates,rooms))
assert(confirmed.assignments[vehicleId].target.sceneSignature==raw.sceneSignature
 and confirmed.assignments[vehicleId].target.vehiclePart=="TruckBed",
 "a twice-confirmed vanilla transport scene becomes the fifth finding")
assert(confirmed.assignments[case.documents[1].id].target.vehiclePart==nil,
 "the opening house key never moves into the vehicle")
print("PASS fitness placement: key stays in the house and only a stable observed vehicle may carry clue five")
