-- Blind logging Round 2: free-text scrubbing.
-- Sensitive fields (area, case, kind, place, doc, etc.) print as "-".
-- Free-text messages are scrubbed of IDs (cf-g2:..., nh:..., t3:..., scene:...)
-- and coordinates (x,y or x,y,z). Place/person modules replace whole msg with "-".
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
NHShared=NHShared or {}
local Log=require("NHShared/Log")

local printed={}
local realPrint=print
local function capture() print=function(s) printed[#printed+1]=tostring(s) end end
local function release() print=realPrint end

-- Test 1: Structured fields blinded
capture()
NHShared.BlindLog=true
Log.write("i","scan",{area="12345,678",kind="CANARYKIND",case="CANARYCASE",
    hours=2,mode="walking"})
local line=printed[#printed]
assert(not line:find("CANARYKIND",1,true),"kind blinded")
assert(line:find("hours=2",1,true),"hours not blinded")

-- Test 2: Log.message with IDs and coordinates
printed={}
capture()
NHShared.BlindLog=true
Log.message("case","note","cf-g2:nh:t3:CANARY1:1 at 10600,9750,0")
line=printed[#printed]
assert(line~=nil,"message printed")
assert(not line:find("CANARY1",1,true),"ID scrubbed")
assert(not line:find("10600",1,true),"coordinate scrubbed")

-- Test 3: Log.message with place module (whole msg replaced)
printed={}
capture()
NHShared.BlindLog=true
Log.message("places","note","CANARYPLACE visited")
line=printed[#printed]
assert(line~=nil,"places message printed")
assert(not line:find("CANARYPLACE",1,true),"place name redacted")
assert(line:find("msg=-",1,true),"msg is -")

-- Test 4: why field in skip events scrubbed (use info level to ensure it prints)
printed={}
capture()
NHShared.BlindLog=true
Log.write("i","skip",{doc="d1",why="t3:building-12345"})
line=printed[#printed]
assert(line~=nil,"skip logged")
assert(not line:find("building-12345",1,true),"why field scrubbed")

-- Test 5: BlindLog=false shows full values
printed={}
capture()
NHShared.BlindLog=false
Log.message("case","note","cf-g2:nh:t3:CANARY2:2 at 20600,19750,0")
line=printed[#printed]
assert(line:find("CANARY2",1,true),"ID shown")
assert(line:find("20600",1,true),"coordinate shown")

-- Test 6: scene-wait lines blinded
printed={}
capture()
NHShared.BlindLog=true
Log.write("i","scan",{why="scene-wait-end",area="10005,10205",kind="RVSPlonkies",
    hours="0.50",distance=0,mode="walking"})
line=printed[#printed]
assert(not line:find("10005",1,true),"area blinded")
assert(not line:find("RVSPlonkies",1,true),"kind blinded")
assert(line:find("hours=0.50",1,true),"hours shown")

-- Test 7: BlindLog=false shows all values
printed={}
capture()
NHShared.BlindLog=false
Log.write("i","scan",{why="scene-wait-end",area="10005,10205",kind="RVSPlonkies",
    hours="0.50",distance=0,mode="walking"})
line=printed[#printed]
assert(line:find("10005",1,true),"area shown")
assert(line:find("RVSPlonkies",1,true),"kind shown")

-- Test 8: R.devLocations over a real world record (runtime stub, one area
-- decided): blind, a count line and no id or coordinate; not blind, the list.
NHShared={}
local boot=dofile("test/fixtures/nohelp_runtime_stub.lua")
local function site(id,x)
    return {id=id,areaId=id,name="Building",mapId="Muldraugh, KY",buildLine="42",
        bounds={x1=x,y1=1000,x2=x+10,y2=1010,z=0},source={kind="map-research",reference="test"},
        paperStorage="observed",containerTypes={"shelves","postbox"},excluded=false}
end
local store={}
local harness=boot(store)
harness.fire("OnGameStart")
assert(harness.R.decideNearby()==true,"the scan starts")
harness.probe.result={rows={{kind="building",id="p1",categoryHint="public-service"}},
    catalog={revision="t",locations={site("t3:p1",1000)}},candidates={["t3:p1"]={{x=1001,y=1001,z=0}}}}
for _=1,20 do harness.fire("OnTick") end
assert(#store["NHShared.Generated.G2"].campaign.canonical.case.areas==1,"an area was decided")
local Log2=require("NHShared/Log")
NHShared.BlindLog=true
local blind=tostring(harness.R.devLocations())
assert(blind:find("clues placed",1,true),"blind: the count line, got "..blind)
assert(not blind:find("t3:",1,true) and not blind:find("nh:",1,true) and not blind:find("cf-g2",1,true)
    and not blind:find("%d+,%d+"),"blind: no id or coordinate")
NHShared.BlindLog=false
local full=tostring(harness.R.devLocations())
assert(full~=blind and not full:find("clues placed; set",1,true),"not blind: the per-clue list")
NHShared.BlindLog=true

release(); print("nohelp_blind_log: ok")
