package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local F=require("FirstClue")
local function site(id,x,options)
    options=options or {}
    return {id=id,name=id,areaId=options.areaId or id,mapId=options.mapId or "M",buildLine=options.buildLine or "42.20",bounds={x1=x,y1=0,x2=x+1,y2=1,z=0},source={kind=options.kind or "owner",reference="test"},paperStorage=options.storage or "observed",containerTypes={"desk"},excluded=options.excluded or false}
end
local catalog={revision="test",locations={site("z",250),site("b",-1),site("a",1),site("unknown",1,{storage="unknown"}),site("excluded",1,{excluded=true}),site("synthetic",2,{kind="synthetic"})}}
local original=catalog.locations[2].bounds.x1
local p=assert(F.select(catalog,{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}))
assert(p.radius==250 and p.introductorySite.id=="a" and p.partnerSite.id=="b", "nearest deterministic pair required")
assert(catalog.locations[2].bounds.x1==original, "selection must not mutate catalog")
local reversed={revision="reverse",locations={site("b",-1),site("a",1)}}
local rp=assert(F.select(reversed,{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}))
assert(rp.introductorySite.id==p.introductorySite.id and rp.partnerSite.id==p.partnerSite.id, "input ordering must not affect selected IDs")
p.introductorySite.bounds.x1=999; assert(catalog.locations[3].bounds.x1==1, "proposal mutation must not alter source")
assert(not F.select({revision="one",locations={site("only",0)}},{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}), "scarcity must defer")
local edge={revision="edge",locations={site("edge",250),site("inside",249)}}
assert(assert(F.select(edge,{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0})).introductorySite.id=="inside", "reach edge is inclusive and ordering remains nearest")
local synthetic={revision="synthetic",locations={site("normal",0),site("synthetic",1,{kind="synthetic"})}}
assert(not F.select(synthetic,{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}), "synthetic sites require explicit opt-in")
assert(assert(F.select(synthetic,{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0,allowSynthetic=true})).partnerSite.id=="synthetic")
for _,bad in ipairs({site("unknown",1,{storage="unknown"}),site("absent",1,{storage="absent"}),site("excluded",1,{excluded=true}),site("wrong-map",1,{mapId="other"}),site("wrong-build",1,{buildLine="42.21"})}) do
    assert(not F.select({revision="invalid-"..bad.id,locations={site("valid",0),bad}},{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}), "one valid plus "..bad.id.." must defer")
end
assert(not F.select({revision="outside",locations={site("inside",0),site("outside",251)}},{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}), "251 tiles must not widen the 250-tile reach")
assert(not F.select({revision="same-area",locations={site("one",0,{areaId="same"}),site("two",2,{areaId="same"})}},{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}), "same-area sites are not distinct")
assert(not F.select({revision="overlap",locations={site("one",0),site("two",0)}},{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=0}), "overlapping sites are not distinct")
assert(not F.select(catalog,{mapId="M",buildLine="42.20",anchor={x=0,y=0},hoursSurvived=-1}), "invalid reach must reject rather than widen")
print("PASS FirstClue: scarcity, reach edge, deterministic ordering, exclusions, and input isolation")
