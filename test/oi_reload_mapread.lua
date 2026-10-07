-- NH-D3 / checklist B5: NO PEEK THROUGH A MAP. A crash and reload before or
-- after a map read decides its marked place must give the same place, the
-- same clues and the same leans, whether or not the map is read again: a
-- save-scummer learns nothing new by reloading around a map.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local D3="NH-D3"
local boot=dofile("test/fixtures/oi_runtime_stub.lua")
local mapPath="mod-ofinterest/common/media/lua/client/OIShared/MapMediaRuntime.lua"

local function deepCopy(t)
    if type(t)~="table" then return t end
    local c={}; for k,v in pairs(t) do c[k]=deepCopy(v) end; return c
end

-- Twelve placeholder sets for map-named places, both conspiracies (as in
-- test/oi_area_runtime.lua).
local marked={}
for i=1,12 do
    local lean=i<=6 and "containment" or "agricultural"
    marked[i]={id=string.format("M%02d",i),kind="set",pieces={"Rope","Bleach"},
        where={{place="mapNamed",spot="furniture",lean=lean,rival=lean=="containment" and "agricultural" or "containment"}}}
end

-- Boot a runtime with the map system over a store; returns harness, map runtime.
local function start(store)
    local h=boot(store)
    require("OIShared/Mystery/Manifest").clues=marked
    package.loaded["OIShared/GeneratedRuntime"]=h.R
    local MapRuntime=dofile(mapPath)
    h.fire("OnGameStart")
    h.setPlayerPos(1,1); h.setHours(5)
    return h,MapRuntime
end

-- A design with one mark, on a building no other map or flyer names.
local Sites=require("OIShared/Generated/MapSites")
local design,entry
for _,e in ipairs(Sites.sites) do
    if e.kind=="building" and #e.marks==1 and e.marks[1].design then
        local d=e.marks[1].design
        local count=0
        for _,x in ipairs(Sites.sites) do for _,m in ipairs(x.marks) do if m.design==d then count=count+1 end end end
        if count==1 then design,entry=d,e; break end
    end
end
assert(design,"the catalogue has a one-mark map")

local function world(store) return store["OIShared.Generated.G2"].campaign.canonical end
-- The marked place's clues: id -> lean, and the set of leans.
local function placeOf(store)
    local w=world(store)
    for _,a in ipairs(w.case.areas) do if a.id==entry.areaId then
        local docs,leans={},{}
        for i=a.first,a.first+a.count-1 do
            local d=w.case.documents[i]; docs[d.id]=d.lean; leans[d.lean]=true
        end
        return docs,leans,#w.case.areas
    end end
end
local function same(a,b,label)
    for k,v in pairs(a) do assert(b[k]==v,label..": "..tostring(k)) end
    for k in pairs(b) do assert(a[k]~=nil,label..": extra "..tostring(k)) end
end

-- Golden: read the map, the place is decided.
local store={}
local h,Map=start(store)
local beforeRead=deepCopy(store)
assert(Map.read(design)==true,D3..": the map is read")
for _=1,20 do h.fire("OnTick") end
local gDocs,gLeans,gAreas=placeOf(store)
assert(gDocs and next(gDocs),D3..": the read decided the marked place")
local afterRead=deepCopy(store)

-- Reload after the read, with and without reading again.
for _,again in ipairs({false,true}) do
    local st=deepCopy(afterRead)
    local h2,Map2=start(st)
    if again then Map2.read(design) end
    for _=1,20 do h2.fire("OnTick") end
    local docs,leans,areas=placeOf(st)
    local label=D3..": reload after the read"..(again and ", read again" or "")
    assert(docs,label..": the place is still decided")
    same(gDocs,docs,label.." (clues and their leans)")
    same(gLeans,leans,label.." (leans)")
    assert(areas==gAreas,label..": nothing decided twice")
end

-- Reload before the read, then read: the same place and clues as golden.
local st=deepCopy(beforeRead)
local h3,Map3=start(st)
assert(Map3.read(design)==true)
for _=1,20 do h3.fire("OnTick") end
local docs,leans=placeOf(st)
same(gDocs,docs,D3..": reload before the read, then read (clues and leans)")
same(gLeans,leans,D3..": reload before the read, then read (leans)")

print("nohelp reload mapread: a reload before or after a map read, read again or not, changes nothing ("..D3..")")
