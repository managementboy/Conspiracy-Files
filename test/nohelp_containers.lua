-- E2 (DR-20260929-NOHELP-GAP-PLAN, owner 2026-09-29): a clue may name the
-- exact container kind it is found in plus up to five fallbacks, in order;
-- if none is at the site it takes any container there, then a body nearby,
-- then the floor - never lost. PLACEHOLDERS ONLY.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local Kinds=require("NHShared/Generated/ContainerKinds")
local Manifest=require("NHShared/Mystery/Manifest")
local S=require("NHShared/Generated/Session")
local SC=require("NHShared/Generated/StorageChoices")

-- The list is the census's own.
local D=require("NHShared/Generated/FixedContainerIndexData")
D=D[1] or D
assert(#Kinds.list==#D.types,"the kinds are the census's container types")
for i,k in ipairs(D.types) do assert(Kinds.list[i]==k,"same list: "..k) end
assert(Kinds.valid({"fridge"}) and Kinds.valid({"fridge","freezer","counter","shelves","crate","bin"}),"1 to 6 known kinds")
assert(not Kinds.valid({}) and not Kinds.valid({"fridge","freezer","counter","shelves","crate","bin","desk"}),"not 0, not 7")
assert(not Kinds.valid({"fridge","fridge"}) and not Kinds.valid({"spaceship"}) and not Kinds.valid("fridge"),"no repeats, no unknown kinds")

-- The clue list: containers only on a furniture spot, and only known kinds.
local function clue(where)
    return {id="zz-c1",kind="set",pieces={"Twine","Tarp"},title="Placeholder title",body="Placeholder body.",
        where={where}}
end
local function w(extra)
    local x={place="farm",spot="furniture",lean="containment",rival="agricultural"}
    for k,v in pairs(extra or {}) do x[k]=v end
    return x
end
assert(Manifest.validClue(clue(w{containers={"fridge","freezer"}})),"a furniture clue names its containers")
local ok,_,code=Manifest.validClue(clue(w{containers={"spaceship"}}))
assert(not ok and code=="BAD_CONTAINER","an unknown kind is refused")
ok,_,code=Manifest.validClue(clue(w{spot="ground",containers={"fridge"}}))
assert(not ok and code=="SCHEMA","only a furniture spot names containers")
local Convert=dofile("tools/nohelp_content/convert.lua")
assert(Convert.WHERE_FIELDS.containers,"the converter lets containers through")

-- Picked and saved: the document carries them, and the save validates.
local Inventory=require("nohelp_inventory")
local clues={}
for i,c in ipairs(Inventory.clues) do
    local copy={}; for k,v in pairs(c) do copy[k]=v end
    copy.where={}
    for j,x in ipairs(c.where) do
        local y={}; for k,v in pairs(x) do y[k]=v end
        if y.spot=="furniture" then y.containers={"fridge","counter"} end
        copy.where[j]=y
    end
    clues[i]=copy
end
local root=assert(S.createArea(4242))
local saved=root
local api=assert(S.open(root,function(n) saved=n end))
local site={id="t3:b1",bounds={x1=100,y1=0,x2=110,y2=10,z=0},containerTypes={"shelves","postbox","vehicle"}}
assert(api.addArea{site=site,place="farm",clues=clues,version="v1",hours=10})
local named=0
for _,d in ipairs(saved.case.documents) do
    if d.spot=="furniture" then
        assert(d.containers and d.containers[1]=="fridge" and d.containers[2]=="counter","the document keeps them in order")
        named=named+1
    else assert(d.containers==nil,"only furniture clues carry containers") end
end
assert(named>=1,"the area has a furniture clue")
assert(S.validate(saved),"a save with containers is valid")

-- What counts as its spot: a furniture or mailbox clue takes any container,
-- a body or the floor; ground and body clues stay strict.
local b=site.bounds
local T={
    furniture={x=b.x1,y=b.y1,z=0,objectIndex=0,containerIndex=0,containerType="fridge",sprite="s"},
    mailbox={x=b.x1,y=b.y1,z=0,objectIndex=1,containerIndex=0,containerType="postbox",sprite="p"},
    ground={x=b.x1+1,y=b.y1+1,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true},
    corpse={x=b.x1+2,y=b.y1,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",carrierKind="corpse",carrierMark="m1"},
    vehicle={x=b.x1,y=b.y1,z=0,objectIndex=0,containerIndex=0,containerType="vehicle",sprite="car",vehiclePart="GloveBox"},
}
for _,spot in ipairs({"furniture","mailbox"}) do
    for _,t in ipairs({"furniture","mailbox","ground","corpse"}) do assert(S.intentMatches({spot=spot},T[t]),spot.." clue may end in a "..t) end
    assert(not S.intentMatches({spot=spot},T.vehicle),spot.." clue never in a car")
end
assert(not S.intentMatches({spot="ground"},T.furniture) and not S.intentMatches({spot="corpse"},T.ground),"ground and body clues stay strict")

-- Per world, the six kinds are tried in a drawn order (owner, 2026-09-29):
-- the same clue lands in different kinds of container from world to world.
do
    local six={"fridge","freezer","counter","crate","desk","bin"}
    local o=S.containerOrder(six,7,"doc-a")
    local same=S.containerOrder(six,7,"doc-a")
    assert(#o==6 and table.concat(o,",")==table.concat(same,","),"the same world, the same order")
    local seen={}; for _,k in ipairs(o) do seen[k]=true end
    for _,k in ipairs(six) do assert(seen[k],"every kind kept") end
    local firsts={}
    for seed=1,60 do firsts[S.containerOrder(six,seed,"doc-a")[1]]=true end
    local n=0; for _ in pairs(firsts) do n=n+1 end
    assert(n>=5,"across worlds, most of the six come first: "..n)
end

-- A named kind is never crowded out of the candidate pool.
local pool=SC.new({"fridge"})
for i=1,SC.MAX_KINDS do SC.offer(pool,{x=i,y=0,z=0,objectIndex=0,containerIndex=0,containerType="k"..i,sprite="s"}) end
assert(SC.offer(pool,{x=99,y=0,z=0,objectIndex=0,containerIndex=0,containerType="fridge",sprite="s"}),"the named kind is kept beyond the kind limit")
assert(not SC.offer(pool,{x=98,y=0,z=0,objectIndex=0,containerIndex=0,containerType="other",sprite="s"}),"an unnamed ninth kind is not")

-- The runtime's container scan: the first named kind present wins, then the
-- next, then any container.
local handlers={}
Events=setmetatable({},{__index=function(t,name)
    local ev={Add=function(fn) handlers[name]=handlers[name] or {}; table.insert(handlers[name],fn) end,Remove=function() end}
    rawset(t,name,ev); return ev
end})
local store={}
ModData={getOrCreate=function(tag) store[tag]=store[tag] or {}; return store[tag] end,get=function(tag) return store[tag] end}
getDebug=function() return false end
isClient=function() return false end
isServer=function() return false end
getTimeInMillis=function() return 0 end
ZombRand=function() return 1 end
getGameTime=function() return {getWorldAgeHours=function() return 1 end} end
getPlayer=function() return {getX=function() return 5000 end,getY=function() return 5000 end,getZ=function() return 0 end,getPlayerNum=function() return 0 end} end
getWorld=function() return nil end
package.loaded["NHShared/InteractionAPI"]={}
package.loaded["NHShared/T3Nearby"]={start=function() return true end}
package.loaded["NHShared/ReachabilityAdapter"]={basementSites=function() return {} end}
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local furniture={}   -- "x,y" -> container type
local function object(kind)
    local c={}; function c:getType() return kind end
    local o={}
    function o:getContainerCount() return 1 end
    function o:getContainerByIndex(i) return i==0 and c or nil end
    function o:getSprite() return {getName=function() return "sprite_"..kind end} end
    return o
end
local objects={}
getCell=function() return {getGridSquare=function(_,x,y,z)
    local k=x..","..y
    if not furniture[k] then return {getObjects=function() return list({}) end} end
    objects[k]=objects[k] or object(furniture[k])
    return {getObjects=function() return list({objects[k]}) end}
end,getZombieList=function() return list({}) end} end
local R=dofile("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
local area={id="t3:c",bounds={x1=200,y1=200,x2=206,y2=206,z=0},containerTypes={},paperStorage="unknown"}
local function scan(prefer)
    local got
    local s=R.boundsScan(area,function(t) got=t end,nil,"doc1",true,prefer)
    local n=0; while not s() do n=n+1; assert(n<10000,"the scan ends") end
    return got and got.containerType
end
furniture={["201,201"]="counter",["203,203"]="freezer",["204,202"]="wardrobe"}; objects={}
assert(scan({"fridge","freezer","counter"})=="freezer","the first named kind present wins")
furniture["202,204"]="fridge"; objects={}
assert(scan({"fridge","freezer","counter"})=="fridge","the exact kind first when it is there")
furniture={["201,201"]="wardrobe"}; objects={}
assert(scan({"fridge","freezer"})=="wardrobe","none named: any container there")
furniture={}; objects={}
assert(scan({"fridge"})==nil,"no container at all: the scan finds nothing, and the filler goes on")

-- E3 (owner, 2026-09-29): an outdoor map place searches 12 tiles beyond its
-- box; a building's place does not (a neighbour's yard is not its furniture).
local function row(id) return {id=id,bounds={x1=300,y1=300,x2=310,y2=310,z=0},paperStorage="unknown",containerTypes={}} end
local out={x=305,y=318,z=0,objectIndex=0,containerIndex=0,containerType="dumpster",sprite="s"}
assert(S.outdoorSite(row("mark:X:1")) and S.outdoorSite(row("flyer:Y")) and not S.outdoorSite(row("t3:123")),"outdoor places are marks and flyers")
assert(S.target(out,row("mark:X:1")) and S.target(out,row("flyer:Y")),"a bin 8 tiles outside an outdoor place is a spot")
assert(not S.target(out,row("t3:123")),"not outside a building's place")
assert(not S.target({x=305,y=323,z=0,objectIndex=0,containerIndex=0,containerType="dumpster",sprite="s"},row("mark:X:1")),"12 tiles, no further")
local outdoor={id="mark:Z:1",bounds={x1=200,y1=200,x2=206,y2=206,z=0},containerTypes={},paperStorage="unknown"}
local function scanAt(site)
    local got
    local s=R.boundsScan(site,function(t) got=t end,nil,"doc2",true,nil)
    local n=0; while not s() do n=n+1; assert(n<100000,"the scan ends") end
    return got and got.containerType
end
furniture={["210,203"]="bin"}; objects={}
assert(scanAt(outdoor)=="bin","the scan finds the bin beyond an outdoor place's box")
assert(scanAt({id="t3:9",bounds=outdoor.bounds,containerTypes={},paperStorage="unknown"})==nil,"but not beyond a building's")

-- The filler: no container -> a body (not held to the one-mobile cap) ->
-- the floor; only then does it decline.
local f=assert(io.open("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua","rb"))
local src=f:read("*a"); f:close()
local filler=src:match("local function filler%(api,onlyArea%).-\nend\n")
assert(filler:find('local fallback=doc and (doc.spot=="furniture" or doc.spot=="mailbox")',1,true),"furniture and mailbox clues fall back")
assert(filler:find('if not (doc and (doc.spot=="corpse" or fallback)) and not Session.mobileAllowed',1,true),"a fallback body is not held to the mobile cap")
assert(filler:find("if not carrier and fallback then",1,true) and filler:find("floorTried=true",1,true)
    and filler:find("scan=groundScan(site,",1,true),"no body: the floor")
assert(filler:find("if fallback and floorTried then",1,true),"declined only after the floor too")
assert(filler:find("end,id,areaClue,prefer or nil)",1,true),"the named kinds reach the container scan")
assert(filler:find("Session.containerOrder(doc.containers,R.worldSeed(),id)",1,true),"in this world's order")

print("nohelp containers: a clue names its container and five fallbacks; then any container, a body, the floor")
