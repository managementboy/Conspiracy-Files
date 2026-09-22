package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Index=require("ConspiracyFiles/Generated/FixedContainerIndex")

local rows={
    {"building-A",100,200,0,"fixtures_counters_01_16","counter","kitchen"},
    {"building-A",102,203,0,"furniture_storage_01_4","dresser","bedroom"},
    {"building-B",400,500,-1,"fixtures_shelves_01_8","shelves",nil},
}
local data={schema=1,map="Muldraugh, KY",build="42.20.4",source="fixture",rows=rows}
assert(Index.validate(data))
local registry=assert(Index.open({data},"Muldraugh, KY","42.20.4"))
assert(registry.count==3)
local found=registry.candidates("t3:building-A")
assert(#found==2 and found[1].indexed and found[1].room=="kitchen")
assert(found[1].objectIndex==nil and found[1].containerIndex==nil,
    "the shipped index must not persist volatile live object indexes")
found[1].x=999
assert(registry.candidates("t3:building-A")[1].x==100,"candidate exports must not alias the index")
local none,why=Index.open({data},"Muldraugh, KY","42.21")
assert(none==nil and why=="unsupported map/build","an unknown build must fall back rather than trust stale data")
local stack="Brandenburg, KY;Echo Creek, KY;Muldraugh, KY"
local stacked=assert(Index.open({data},stack,"42.20.4"))
assert(stacked.count==#rows,"a complete member of the active map stack activates the vanilla index")
assert(Index.open({data},"Not Muldraugh, KY Extended","42.20.4")==nil,
    "map-stack matching must never accept a substring")
local duplicate={schema=1,map=data.map,build=data.build,rows={rows[1],rows[1]}}
assert(not Index.validate(duplicate),"duplicate physical signatures must be refused")
local extra={schema=1,map=data.map,build=data.build,rows={{"b",1,2,0,"s","counter",nil,"extra"}}}
assert(not Index.validate(extra),"rows are compact and strict")

local packed={schema=2,map="Muldraugh, KY",build="42.20",source="packed fixture",count=3,
    sprites={"fixture_counter","fixture_dresser"},types={"counter","dresser"},rooms={"kitchen","bedroom"},
    buildings={["building-A"]={100,200,"0,0,0,1,1,1;2,3,0,2,2,2"},
        ["building-B"]={400,500,"0,0,-1,1,1,0"}}}
assert(Index.validate(packed))
local packedRegistry=assert(Index.open({packed},"Muldraugh, KY","42.20"))
local packedRows=packedRegistry.candidates("t3:building-A")
assert(packedRegistry.count==3 and #packedRows==2)
assert(packedRows[2].x==102 and packedRows[2].y==203 and packedRows[2].sprite=="fixture_dresser"
    and packedRows[2].containerType=="dresser" and packedRows[2].room=="bedroom")
assert(#packedRegistry.candidates("t3:missing")==0,"an unindexed building has no fabricated targets")
assert(#packedRegistry.candidates(nil)==0,"invalid building IDs are refused without decoding")
local badPacked={schema=2,map="Muldraugh, KY",build="42.20",count=2,
    sprites={"s"},types={"counter"},rooms={},buildings={b={0,0,"0,0,0,1,1,0"}}}
assert(not Index.validate(badPacked),"packed row counts are checked before use")
print("PASS fixed container index: legacy and packed exact-build rows, strict validation and isolated candidates")
