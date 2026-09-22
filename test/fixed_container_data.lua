package.path="mod/common/media/lua/shared/?.lua;"..package.path

local Index=require("ConspiracyFiles/Generated/FixedContainerIndex")
local Data=require("ConspiracyFiles/Generated/FixedContainerIndexData")

assert(#Data==1,"the shipped bundle should contain one exact vanilla map/build census")
local registry=assert(Index.open(Data,"Muldraugh, KY","42.20"))
assert(registry.count==240059,"the checked-in census must not be silently truncated")
local candidates=registry.candidates("t3:9570149208162304")
assert(#candidates==39,"a known building must decode all of its indexed containers")
local known=false
for _,candidate in ipairs(candidates) do
    if candidate.x==98 and candidate.y==8952 and candidate.z==0
        and candidate.sprite=="furniture_storage_02_34"
        and candidate.containerType=="dishescabinet" and candidate.room=="lobby" then
        known=true
    end
end
assert(known,"the generated payload must retain coordinate, sprite, type and room")
assert(Index.open(Data,"Muldraugh, KY","42.20.4")==nil,
    "a patch string not reported by the map API must not accidentally match")

print("PASS shipped fixed container data: 240059 rows and a known building decode exactly")
