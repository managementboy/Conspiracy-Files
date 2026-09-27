-- Map and flyer clue places for No Help (task 3 plan, step 4). Plain Lua 5.1,
-- offline, deterministic: the same catalogue and address book always give a
-- byte-identical file.
--
--   lua5.1 tools/mapsites/build.lua --out mod-nohelp/common/media/lua/shared/NHShared/Generated/MapSites.lua
--
-- Loaded without arguments (dofile), it returns its functions instead, so
-- test/nohelp_map_sites.lua can rebuild the file in memory and compare.
--
-- Owner decisions (DECISIONS.md, DR-20260927-NOHELP-RULE-PLACEMENT): EVERY
-- mark of every vanilla annotated or stash map is a clue place, and so is every
-- place a vanilla flyer or brochure names. What a mark holds is fixed by the
-- world, never by whether or when the map is read, so the places themselves
-- are fixed here, once, from the game's own data:
--   1. the address-book building the mark's point stands in: area id
--      "t3:"..building id, the same id the nearby scan gives that building,
--      so one building is never decided twice by two paths;
--   2. else, for a design with reviewed rectangles (MapMediaDestinations), a
--      window of at most 44 x 44 tiles inside the rectangle holding the point;
--   3. else a box with a sixteen-tile margin around the point (the margin the
--      reviewed rectangles use).
-- Marks that land on the same building, or inside a place already made from
-- an earlier mark, are ONE place that keeps every mark that named it, in
-- static order (maps in catalogue order, then flyers).
local M={}
M.REVISION="mapsites-1"
M.WINDOW=44
M.MARGIN=16
M.SHARED="mod-nohelp/common/media/lua/shared/"
M.OUT=M.SHARED.."NHShared/Generated/MapSites.lua"

-- Designs and prints left out, each with its reason. Empty today: every
-- design and every print location resolves to one of the three kinds above.
M.EXCLUDED={}

local function loadSources()
    package.path=M.SHARED.."?.lua;"..package.path
    local Catalogue=require("NHShared/MapMediaCatalogue")
    local Book=require("NHShared/Generated/AddressBook")
    return Catalogue,Book
end
M.loadSources=loadSources

-- The book's rows as plain buildings. x2/y2 are exclusive, as in the game.
function M.buildings(Book)
    local out={}
    for _,row in ipairs(Book.rows) do
        local id,x,y,x2,y2=row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|")
        assert(id,"unreadable address-book row "..tostring(row))
        out[#out+1]={id=id,x1=tonumber(x),y1=tonumber(y),x2=tonumber(x2),y2=tonumber(y2)}
    end
    return out
end

-- The smallest building holding the point (ties: lowest id), or nil.
local function buildingAt(buildings,x,y)
    local best
    for _,b in ipairs(buildings) do
        if x>=b.x1 and x<b.x2 and y>=b.y1 and y<b.y2 then
            local area=(b.x2-b.x1)*(b.y2-b.y1)
            if not best or area<best.area or (area==best.area and b.id<best.b.id) then best={b=b,area=area} end
        end
    end
    return best and best.b
end

-- A window of at most WINDOW tiles a side inside reviewed rectangle `a`
-- (inclusive corners, as MapMediaDestinations.contains reads them), centred on
-- the point where the rectangle allows.
local function window(a,x,y)
    local function span(lo,hi,p)
        local width=math.min(M.WINDOW,hi-lo+1)
        local start=math.max(lo,math.min(p-math.floor(width/2),hi+1-width))
        return start,start+width
    end
    local x1,x2=span(a.x1,a.x2,x)
    local y1,y2=span(a.y1,a.y2,y)
    return {x1=x1,y1=y1,x2=x2,y2=y2,z=0}
end

local function inside(bounds,x,y) return x>=bounds.x1 and x<bounds.x2 and y>=bounds.y1 and y<bounds.y2 end

function M.build(Catalogue,Book)
    local buildings=M.buildings(Book)
    local sites,byArea={},{}
    local excluded={}
    for _,e in ipairs(M.EXCLUDED) do excluded[e.id]=e.reason end
    local function add(ref,x,y,areas)
        local b=buildingAt(buildings,x,y)
        local key,site
        if b then
            key="t3:"..b.id
            site=byArea[key]
            if not site then
                site={areaId=key,place="mapNamed",kind="building",buildingId=b.id,
                    bounds={x1=b.x1,y1=b.y1,x2=b.x2,y2=b.y2,z=0},marks={}}
            end
        else
            -- A place made from an earlier mark that already covers this
            -- point takes it, so two marks a few tiles apart are one place.
            for _,s in ipairs(sites) do
                if s.kind~="building" and inside(s.bounds,x,y) then site=s; break end
            end
            if not site then
                local reviewed
                for _,a in ipairs(areas or {}) do
                    if x>=a.x1 and x<=a.x2 and y>=a.y1 and y<=a.y2 then reviewed=a; break end
                end
                key=(ref.design and ("mark:"..ref.design) or ("flyer:"..ref.print))..":"..ref.mark
                if reviewed then
                    site={areaId=key,place="mapNamed",kind="window",bounds=window(reviewed,x,y),marks={}}
                else
                    site={areaId=key,place="mapNamed",kind="point",
                        bounds={x1=x-M.MARGIN,y1=y-M.MARGIN,x2=x+M.MARGIN+1,y2=y+M.MARGIN+1,z=0},marks={}}
                end
            end
        end
        if not byArea[site.areaId] then
            byArea[site.areaId]=site; sites[#sites+1]=site
            site.reference=(ref.design or ref.print).." mark "..ref.mark.." at "..x..","..y
                ..(site.kind=="building" and " in address-book building "..site.buildingId
                   or site.kind=="window" and " inside its reviewed rectangle" or " (no building there)")
        end
        ref.x,ref.y=x,y
        site.marks[#site.marks+1]=ref
    end
    local designs,prints={},{}
    for _,id in ipairs(Catalogue.list) do
        if not excluded[id] then
            local b=Catalogue.get(id)
            designs[#designs+1]=id
            for i,t in ipairs(b.targets or {}) do add({design=id,mark=i},t.x,t.y,b.areas) end
        end
    end
    for _,id in ipairs(Catalogue.printList) do
        if not excluded[id] then
            prints[#prints+1]=id
            for i,t in ipairs(Catalogue.print(id).locations or {}) do add({print=id,mark=i},t.x,t.y,nil) end
        end
    end
    return {sites=sites,designs=designs,prints=prints,book=Book}
end

local function q(s) return string.format("%q",s) end
function M.render(result)
    local out={}
    local function w(s) out[#out+1]=s end
    w("-- DERIVED FILE - do not edit by hand. No Help map and flyer clue places (task 3 plan, step 4).")
    w("--   lua5.1 tools/mapsites/build.lua --out "..M.OUT)
    w("-- from NHShared/MapMediaCatalogue.lua (with MapMediaDestinations.lua) and")
    w("-- NHShared/Generated/AddressBook.lua revision "..result.book.revision..".")
    w("-- One entry per place; `marks` lists every map mark and flyer place that names")
    w("-- it, maps first in catalogue order. kind: building (an address-book building,")
    w("-- area id \"t3:\"..id), window (inside a reviewed rectangle, at most "..M.WINDOW.." tiles")
    w("-- a side) or point (a "..M.MARGIN.."-tile margin around the mark). Bounds: x2/y2 exclusive.")
    w("local M={revision="..q(M.REVISION)..",addressBook="..q(result.book.revision)
        ..",map="..q(result.book.map)..",game="..q(result.book.game).."}")
    w("M.excluded={")
    for _,e in ipairs(M.EXCLUDED) do w("{id="..q(e.id)..",reason="..q(e.reason).."},") end
    w("}")
    w("M.designs={")
    for _,id in ipairs(result.designs) do w(q(id)..",") end
    w("}")
    w("M.prints={")
    for _,id in ipairs(result.prints) do w(q(id)..",") end
    w("}")
    w("M.sites={")
    for _,s in ipairs(result.sites) do
        local marks={}
        for _,m in ipairs(s.marks) do
            marks[#marks+1]="{"..(m.design and ("design="..q(m.design)) or ("print="..q(m.print)))
                ..",mark="..m.mark..",x="..m.x..",y="..m.y.."}"
        end
        local b=s.bounds
        w("{areaId="..q(s.areaId)..",place="..q(s.place)..",kind="..q(s.kind)
            ..(s.buildingId and (",buildingId="..q(s.buildingId)) or "")
            ..",bounds={x1="..b.x1..",y1="..b.y1..",x2="..b.x2..",y2="..b.y2..",z="..b.z.."}"
            ..",marks={"..table.concat(marks,",").."},reference="..q(s.reference).."},")
    end
    w("}")
    w("return M")
    return table.concat(out,"\n").."\n"
end

local args={...}
if #args>0 then
    local out
    for i=1,#args,2 do
        if args[i]=="--out" then out=args[i+1] else io.stderr:write("bad argument: "..tostring(args[i]).."\n"); os.exit(2) end
    end
    if not out then io.stderr:write("usage: lua5.1 tools/mapsites/build.lua --out <MapSites.lua>\n"); os.exit(2) end
    local Catalogue,Book=loadSources()
    local result=M.build(Catalogue,Book)
    local text=M.render(result)
    local f=assert(io.open(out,"wb")); f:write(text); f:close()
    local kinds={}
    for _,s in ipairs(result.sites) do kinds[s.kind]=(kinds[s.kind] or 0)+1 end
    print(string.format("%d designs, %d prints -> %d places (%d building, %d window, %d point); %s (%d bytes)",
        #result.designs,#result.prints,#result.sites,kinds.building or 0,kinds.window or 0,kinds.point or 0,out,#text))
end
return M
