-- Which interesting place a nearby building is treated as (No Help, phase 5).
-- Only what the nearby scan reliably reports is mapped; everything else gets
-- no clues rather than a guess.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local AreaPlace=require("OIShared/Generated/AreaPlace")
local Manifest=require("OIShared/Mystery/Manifest")
local known={}; for _,p in ipairs(Manifest.PLACES) do known[p]=true end

assert(AreaPlace.of("public-service")=="police")
assert(AreaPlace.of("medical")=="hospital")
assert(AreaPlace.of("office")=="office")
assert(AreaPlace.of("communications")=="transmission")
assert(AreaPlace.of("retail",{bookstore=true})=="bookstore","a shop with a bookstore room is a bookstore")
assert(AreaPlace.of("retail",{"grocery","bookstore"})=="bookstore","room names as a list work too")
assert(AreaPlace.of("retail",{grocery=true})==nil,"an ordinary shop gets no clues")
for _,c in ipairs({"home","attic-home","garage","hospitality","other"}) do
    assert(AreaPlace.of(c,{})==nil,c.." gets no clues")
end
for _,c in ipairs({"public-service","medical","office","communications"}) do
    assert(known[AreaPlace.of(c)],"every mapped kind is one of the owner's places")
end
assert(type(Manifest.VERSION)=="string" and Manifest.VERSION~="","the clue list has a version")
print("nohelp area place: nearby categories map to the owner's places, homes to none")
