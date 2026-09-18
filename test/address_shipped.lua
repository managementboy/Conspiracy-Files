-- AD-10 (P4-R129): whole-map house numbers ship with the mod. A new save reads
-- them at once - no scan, nothing written to the save - and a save that already
-- froze a Muldraugh book keeps it (P4-R120).
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
getPlayer=function() return nil end
local callbacks={}
Events={OnTick={Add=function(f) callbacks.tick=f end,Remove=function(f) if callbacks.tick==f then callbacks.tick=nil end end},
        OnGameStart={Add=function(f) callbacks.start=f end}}
getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
getGameVersion=function() return "42.20" end
getTimeInMillis=function() return 0 end
local saves,writes={},0
ModData={get=function(k) return saves[k] end,getOrCreate=function(k) writes=writes+1; saves[k]=saves[k] or {}; return saves[k] end}
local scanned=0
local mapName="Muldraugh, KY"
getWorld=function() return {getMap=function() return mapName end,
    getMetaGrid=function() scanned=scanned+1; return {getBuildings=function() return {size=function() return 0 end} end} end} end
ISWorldMap={render=function() end}
package.preload["ISUI/Maps/ISWorldMap"]=function() return {} end

-- A tiny shipped book: the same "101 Main St" in two towns, and a rural house.
local fake={revision="whole-map-1",game="42.20",map="Muldraugh, KY",
    areas={{name="Irvington",town=1},{name="Riverside",town=1},{name="",town=0,near="Riverside"},
           {name="WestPoint",town=1}},
    streets={"Main St","N Carl St"},
    rows={"9007319513825330|1900|14370|1910|14380|1|2|201","12103458358296576|6500|5400|6510|5410|2|1|101",
          "12103458358296577|1920|14370|1930|14380|1|1|101","12103458358296580|4000|4000|4006|4006|3|1|3",
          "12103458358296581|8000|8000|8010|8010|4|1|102"}}
package.preload["ConspiracyFiles/Generated/AddressBook"]=function() return fake end
local M=require("ConspiracyFiles/AddressMap")

-- Game start with no saved book: the shipped numbers, at once, no scan.
assert(callbacks.start,"the address book hooks game start")
callbacks.start()
assert(M.ready(),"a new save has addresses at game start, before any case")
assert(scanned==0 and callbacks.tick==nil,"nothing is scanned")
assert(writes==0 and next(saves)==nil,"nothing is written to the save")
assert(M.labelForBuilding("9007319513825330")=="201 N Carl St","a sixteen-digit id beyond 2^53 still resolves")
assert(M.townForBuilding("9007319513825330")=="Irvington")
assert(M.labelForBuilding("12103458358296576")=="101 Main St" and M.labelForBuilding("12103458358296577")=="101 Main St",
    "the same address in two towns is allowed")
assert(M.townForBuilding("12103458358296576")=="Riverside" and M.townForBuilding("12103458358296577")=="Irvington")
assert(M.townForBuilding("12103458358296580")==nil and M.labelForBuilding("12103458358296580")=="3 Main St",
    "a rural house is numbered but never given an invented town")
local label,distance=M.nearest(1905,14385,10)
assert(label=="201 N Carl St" and distance==6,"nearest reads the shipped book: "..tostring(label).." "..tostring(distance))
local case={locations={{id="t3:9007319513825330",mapId="Muldraugh, KY",name="Building at 1900, 14370",
    bounds={x1=1900,y1=14370,x2=1910,y2=14380}}}}
assert(M.describe("Go to Building at 1900, 14370",case)=="Go to 201 N Carl St","case text reads the shipped book")
assert(M.start(),"starting again when a case asks is harmless")
assert(writes==0,"a case starting still writes nothing")
print("PASS address shipped: ready at game start, nothing scanned or saved, per-town labels, rural houses unnamed, case text")

-- AD-10's last "Still open": a place outside the survivor's town is named with
-- its town. Inside their own town the address reads as it always did.
local standing=nil
getPlayer=function() return standing end
local clock=0
getTimeInMillis=function() return clock end
local asked=0
-- Walking takes time, so each move here also moves the clock past the cache:
-- the town is re-measured at most every TOWN_EVERY_MS, never per row.
local function stand(x,y)
    standing={getX=function() asked=asked+1; return x end,getY=function() return y end}
    clock=clock+M.TOWN_EVERY_MS
end
local IRVINGTON,RIVERSIDE,RURAL="9007319513825330","12103458358296576","12103458358296580"
-- "101 Main St" exists in both towns; this is the Irvington one.
local IRVINGTON_MAIN="12103458358296577"
-- Beside the two Irvington houses.
stand(1905,14385)
assert(M.currentTown()=="Irvington","the survivor's town is the town of the nearest numbered building")
assert(M.labelForBuilding(IRVINGTON)=="201 N Carl St","an address in the survivor's own town is unchanged")
assert(M.labelForBuilding(RIVERSIDE)=="101 Main St, Riverside","a place outside their town is named with its town")
assert(M.labelForBuilding(RURAL)=="3 Main St","a house in no named town is never given an invented one")
assert(M.nearest(6505,5395,10)=="101 Main St, Riverside","the nearest building to a far-off point carries its town")
assert(M.nearest(1905,14385,10)=="201 N Carl St","the nearest building at home does not")
local farCase={locations={{id="t3:12103458358296576",mapId="Muldraugh, KY",name="Building at 6500, 5400",
    bounds={x1=6500,y1=5400,x2=6510,y2=5410}}}}
assert(M.describe("Go to Building at 6500, 5400",farCase)=="Go to 101 Main St, Riverside",
    "case text names another town's place with the town")
-- In Riverside now, so it is the Irvington address that needs saying.
stand(6505,5415)
assert(M.currentTown()=="Riverside","moving to another town changes which addresses need a town")
assert(M.labelForBuilding(RIVERSIDE)=="101 Main St" and M.labelForBuilding(IRVINGTON_MAIN)=="101 Main St, Irvington",
    "the same label in two towns is told apart by the town of the one that is away")
-- Out in the woods with nothing numbered nearby: the survivor is still of the
-- town they came from, so nothing changes under them.
stand(40000,40000)
assert(M.currentTown()=="Riverside","the town is sticky: open country does not make a stranger of the survivor")
assert(M.labelForBuilding(RIVERSIDE)=="101 Main St")
-- Out of the hot paths: a reading surface rebuilds its rows constantly, so
-- standing still and asking for a hundred labels must not re-measure a
-- hundred times. The town is worked out again only after the survivor has
-- moved or TOWN_EVERY_MS has passed.
clock=clock+1
asked=0
for _=1,100 do assert(M.labelForBuilding(RIVERSIDE)=="101 Main St") end
assert(asked<=1,"a label must not re-measure the survivor's town: asked "..asked.." times")
clock=clock+M.TOWN_EVERY_MS
assert(M.currentTown()=="Riverside","the town is re-measured once the cache is stale, and comes back the same")
-- A town the regions file spells as an id is written the way it is said.
assert(M.labelForBuilding("12103458358296581")=="102 Main St, West Point",
    "WestPoint is written West Point")
assert(M.townForBuilding("12103458358296581")=="West Point")
print("PASS address shipped: a place outside the survivor's town is named with its town, their own town is not")

-- A CALLER THAT REMEMBERS AN ADDRESS (AD-10, fault found in a real game
-- 2026-09-18). The qualified form depends on where the survivor is standing, so
-- anything that caches labelForBuilding's OUTPUT freezes the town for the
-- session: standing in West Point, 0 of 16 records about Muldraugh named
-- Muldraugh (campaign 20260918T005315). labelParts hands back the two halves
-- unqualified, and qualify finishes them at read time.
stand(1905,14385)
local rawLabel,rawTown=M.labelParts(RIVERSIDE)
assert(rawLabel=="101 Main St" and rawTown=="Riverside","labelParts is the label and its town, unqualified")
assert(M.labelParts(RURAL)=="3 Main St" and select(2,M.labelParts(RURAL))==nil,
    "a rural house has a label and no town")
assert(M.labelParts("no-such-building")==nil and M.labelParts(nil)==nil and M.labelParts("")==nil,
    "an unknown building has no parts")
-- The two halves, remembered ONCE here, must read correctly from both towns.
assert(M.qualify(rawLabel,rawTown)=="101 Main St, Riverside","from Irvington the town is said")
stand(6505,5415)
assert(M.qualify(rawLabel,rawTown)=="101 Main St","and in Riverside the same two halves read plainly")
-- The frozen form is the fault: what a caching caller used to keep.
local frozenOnce=M.labelForBuilding(IRVINGTON_MAIN)
stand(1905,14385)
assert(frozenOnce=="101 Main St, Irvington" and M.labelForBuilding(IRVINGTON_MAIN)=="101 Main St",
    "a remembered finished address would have been wrong here, which is why nothing may remember one")
-- Qualifying is not a hot path either: it reads the town through the same
-- throttle, so a hundred remembered labels re-measure at most once.
clock=clock+1
asked=0
for _=1,100 do assert(M.qualify(rawLabel,rawTown)=="101 Main St, Riverside") end
assert(asked<=1,"qualifying must not re-measure the survivor's town: asked "..asked.." times")
print("PASS address shipped: labelParts and qualify let a caller cache an address without freezing its town")

-- And the one caller that does cache: every address in the case record goes
-- through GeneratedRuntime.addressFor, which held the finished label.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","r"))
local runtime=f:read("*a"); f:close()
local addressFor=assert(runtime:match("local function addressFor%(id%)(.-)\nend\n"),"addressFor must exist")
assert(addressFor:find("map.labelParts",1,true) and addressFor:find("map.qualify",1,true),
    "addressFor must cache the raw parts and qualify at read time")
assert(not addressFor:find("labelForBuilding",1,true),
    "caching what labelForBuilding returned is the AD-10 fault")
assert(addressFor:find("remembered={label=label,town=town}",1,true),
    "what is remembered is the two halves, not the sentence")
local _,copies=runtime:gsub("addressCache%[","")
assert(copies<=3,"one address cache in the file, not a second copy beside it: "..copies.." uses")
assert(runtime:find("local addressOf=addressFor",1,true),
    "the dev diagnostic reads the same lookup rather than keeping its own frozen copy")
-- The other cache of a finished address: the identity rows' place, rebuilt on
-- every refresh and keyed on the square alone, which froze the same way.
local g=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua","r"))
local observer=g:read("*a"); g:close()
assert(observer:find("local here=map.currentTown and map.currentTown() or \"\"",1,true)
    and observer:find('local key=tostring(here)..":"',1,true),
    "a cache of a FINISHED address must carry the survivor's town in its key (AD-10)")
print("PASS address shipped: the case record's address lookup qualifies the town on the way out")
standing=nil

-- A save that already froze a Muldraugh book keeps it (P4-R120).
package.loaded["ConspiracyFiles/AddressMap"]=nil
callbacks={}
local frozen={revision=require("ConspiracyFiles/Generated/AddressIndex").REVISION,map="Muldraugh, KY",build="42.20",coverage=3,
    records={{id="9007319513825330",x=1900,y=14370,x2=1910,y2=14380,label="109 Walker Road"}}}
saves={["ConspiracyFiles.AddressBook.Muldraugh"]={canonical=frozen}}
M=require("ConspiracyFiles/AddressMap")
callbacks.start()
assert(M.labelForBuilding("9007319513825330")=="109 Walker Road","an old save keeps the number it already quoted")
assert(saves["ConspiracyFiles.AddressBook.Muldraugh"].canonical==frozen,"and its book is untouched")
print("PASS address shipped: an existing save keeps its frozen book")

-- Another map: no numbers, and still no scan.
package.loaded["ConspiracyFiles/AddressMap"]=nil
callbacks={}; saves={}; writes=0; scanned=0; mapName="Some Other Map"
M=require("ConspiracyFiles/AddressMap")
callbacks.start()
assert(not M.ready() and scanned==0 and writes==0,"a map the book is not for gets no numbers and no scan")
print("PASS address shipped: another map gets no numbers")

-- The real shipped file: loads in plain Lua, every row parses, labels unique per town.
package.loaded["ConspiracyFiles/Generated/AddressBook"]=nil
package.preload["ConspiracyFiles/Generated/AddressBook"]=nil
local real=assert(loadfile("mod/common/media/lua/shared/ConspiracyFiles/Generated/AddressBook.lua"))()
assert(real.revision=="whole-map-1" and real.map=="Muldraugh, KY" and #real.rows>5000,"the real book loads: "..tostring(#real.rows))
local seen,ids={},{}
for _,row in ipairs(real.rows) do
    local id,_,_,_,_,area,street,number=row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%d+)|(%d+)|(%d+)$")
    assert(id and real.areas[tonumber(area)] and real.streets[tonumber(street)],"row parses: "..row)
    assert(not ids[id],"one row per building: "..id); ids[id]=true
    local key=area.."|"..number.." "..real.streets[tonumber(street)]
    assert(not seen[key],"labels are unique within a town: "..key); seen[key]=true
end
print("PASS address shipped: the real book has "..#real.rows.." houses, every row parses, labels unique per town")
