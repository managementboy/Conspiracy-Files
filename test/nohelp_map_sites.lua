-- NH-D6 annotated maps included (task 3 plan, step 4): every mark of every
-- vanilla annotated or stash map, and every place a vanilla flyer or brochure
-- names, is a No Help clue place (owner, 2026-09-27: "every mark on a map gets
-- clues"; "places named on vanilla flyers and brochures become clue places
-- too, now"). The places are a derived file, Generated/MapSites.lua, built
-- offline by tools/mapsites/build.lua from the map catalogue and the address
-- book. This holds the file to that.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local D6="NH-D6"
local Catalogue=require("NHShared/MapMediaCatalogue")
local Book=require("NHShared/Generated/AddressBook")
local Sites=require("NHShared/Generated/MapSites")
local Catalog=require("NHShared/Generated/Catalog")
local Builder=dofile("tools/mapsites/build.lua")

-- The shipped file is exactly what the tool builds today.
local f=assert(io.open(Builder.OUT,"rb")); local shipped=f:read("*a"); f:close()
local rebuilt=Builder.render(Builder.build(Catalogue,Book))
assert(shipped==rebuilt,D6..": MapSites.lua is not a fresh rebuild; run lua5.1 tools/mapsites/build.lua --out "..Builder.OUT)
assert(shipped:find("^%-%- DERIVED FILE"),D6..": the file says it is derived")
assert(Sites.addressBook==Book.revision,D6..": built from the shipped address book")

-- Every design and every print is accounted for: a place for each mark, or an
-- exclusion with a reason.
local excluded={}
for _,e in ipairs(Sites.excluded) do
    assert(type(e.id)=="string" and type(e.reason)=="string" and #e.reason>10,D6..": an exclusion names its reason")
    excluded[e.id]=true
end
local marked={}
for _,s in ipairs(Sites.sites) do
    for _,m in ipairs(s.marks) do
        local key=(m.design and "d:"..m.design or "p:"..m.print)..":"..m.mark
        assert(not marked[key],D6..": "..key.." belongs to two places")
        marked[key]=s
    end
end
local designs,prints,marks=0,0,0
for _,id in ipairs(Catalogue.list) do
    if not excluded[id] then
        designs=designs+1
        local b=Catalogue.get(id)
        assert(#(b.targets or {})>=1,D6..": "..id.." has no mark and no exclusion")
        for i,t in ipairs(b.targets) do
            local s=marked["d:"..id..":"..i]
            assert(s,D6..": mark "..i.." of "..id.." has no clue place")
            marks=marks+1
            assert(t.x>=s.bounds.x1 and t.x<s.bounds.x2 and t.y>=s.bounds.y1 and t.y<s.bounds.y2,
                D6..": mark "..i.." of "..id.." lies inside its place")
        end
    end
end
for _,id in ipairs(Catalogue.printList) do
    if not excluded[id] then
        prints=prints+1
        for i,t in ipairs(Catalogue.print(id).locations or {}) do
            local s=marked["p:"..id..":"..i]
            assert(s,D6..": place "..i.." of flyer "..id.." has no clue place")
            assert(t.x>=s.bounds.x1 and t.x<s.bounds.x2 and t.y>=s.bounds.y1 and t.y<s.bounds.y2,
                D6..": flyer "..id.." place "..i.." lies inside its place")
        end
    end
end
assert(designs+#Sites.excluded>=#Catalogue.list and designs>=120,D6..": about 125 map designs are clue sources ("..designs..")")
assert(#Sites.designs==designs and #Sites.prints==prints,D6..": the file lists every design and print it covers")

-- Every place: one area id, mapNamed, a bounded non-empty footprint, and a
-- building place is exactly an address-book building under the nearby scan's id.
local rows={}
for _,row in ipairs(Book.rows) do
    local id,x,y,x2,y2=row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|")
    rows[id]={x1=tonumber(x),y1=tonumber(y),x2=tonumber(x2),y2=tonumber(y2)}
end
local ids,kinds={}, {}
for _,s in ipairs(Sites.sites) do
    assert(not ids[s.areaId],D6..": "..s.areaId.." appears twice")
    ids[s.areaId]=true
    kinds[s.kind]=(kinds[s.kind] or 0)+1
    assert(s.place=="mapNamed",D6..": a map or flyer place is a map-named place")
    assert(#s.marks>=1,D6..": a place keeps the marks that name it")
    local b=s.bounds
    for _,k in ipairs({"x1","y1","x2","y2","z"}) do assert(type(b[k])=="number" and b[k]==math.floor(b[k]),D6..": whole-tile bounds") end
    assert(b.x2>b.x1 and b.y2>b.y1 and b.z==0,D6..": "..s.areaId.." has a non-empty footprint")
    if s.kind=="building" then
        local r=rows[s.buildingId]
        assert(s.areaId=="t3:"..s.buildingId,D6..": a building place uses the nearby scan's id")
        assert(r and r.x1==b.x1 and r.y1==b.y1 and r.x2==b.x2 and r.y2==b.y2,D6..": "..s.areaId.." matches its address-book row")
    elseif s.kind=="window" then
        assert(b.x2-b.x1<=Builder.WINDOW and b.y2-b.y1<=Builder.WINDOW,D6..": a window stays within 44 tiles")
        assert(not s.areaId:find("^t3:"),D6..": only a building uses a building id")
    else
        assert(s.kind=="point",D6..": unknown place kind "..tostring(s.kind))
        assert(b.x2-b.x1==2*Builder.MARGIN+1 and b.y2-b.y1==2*Builder.MARGIN+1,D6..": a point place is its mark and a margin")
        assert(not s.areaId:find("^t3:"),D6..": only a building uses a building id")
    end
    assert(type(s.reference)=="string" and #s.reference>0 and #s.reference<=300,D6..": a place cites where it came from")
    -- The row the runtime builds from it is a valid Catalog row.
    local ok,why=Catalog.validate({revision="map-sites",locations={{id=s.areaId,areaId=s.areaId,name="Place",
        mapId=Sites.map,buildLine=Sites.game,bounds={x1=b.x1,y1=b.y1,x2=b.x2,y2=b.y2,z=b.z},
        source={kind="map-research",reference=s.reference},paperStorage="unknown",containerTypes={},excluded=false}}})
    assert(ok,D6..": "..s.areaId.." is a valid catalog row: "..tostring(why))
end
assert((kinds.building or 0)>100 and (kinds.window or 0)>=1 and (kinds.point or 0)>=1,D6..": all three kinds of place occur")

-- Two maps marking one restaurant (MulStashMap11 and 16) are one place that
-- keeps both, first in catalogue order.
local both=marked["d:MulStashMap11:1"]
assert(both and both==marked["d:MulStashMap16:1"],D6..": one place for two maps marking one building")
assert(both.marks[1].design=="MulStashMap11" and both.marks[2].design=="MulStashMap16",D6..": marks keep static order")
print(string.format("nohelp map sites: %d designs (%d marks) and %d prints -> %d places (%d building, %d window, %d point)",
    designs,marks,prints,#Sites.sites,kinds.building or 0,kinds.window or 0,kinds.point or 0))
