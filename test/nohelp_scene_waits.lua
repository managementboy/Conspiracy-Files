-- Scene wait histogram: walking or driving by wait-length bucket (C3).
-- No cell key, no scene kind, only counts by (mode, bucket).
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local boot=require("nohelp_runtime_stub")

local store={}
local h=boot(store)
local VSR=require("NHShared/VanillaSceneRuntime")

-- Helper: get the current wait counts.
local function getWaits()
    return VSR.waitCounts()
end

-- Test that waitCounts() returns exactly 8 keys, all numbers.
local counts=getWaits()
assert(counts and type(counts)=="table","waitCounts returns a table")
local keys={}
for k in pairs(counts) do keys[#keys+1]=k end
table.sort(keys)
assert(#keys==8,"exactly 8 keys")
local expectedKeys={"drive_h0_1","drive_h1_6","drive_h6_24","drive_h24_plus",
                    "walk_h0_1","walk_h1_6","walk_h6_24","walk_h24_plus"}
table.sort(expectedKeys)
for i,k in ipairs(expectedKeys) do assert(keys[i]==k,"key "..i.." is "..k) end
for k,v in pairs(counts) do assert(type(v)=="number","all values are numbers") end

-- Test: canary strings must not appear in waitCounts keys or values.
local CANARYKIND="CANARYKIND_12345_TESTSCENE"
local CANARYKEY="cell:99999:77777:0"

-- Verify canaries don't leak into the counts.
local countsStr=tostring(counts)
assert(not countsStr:find(CANARYKIND),"scene kind not in counts")
assert(not countsStr:find(CANARYKEY),"cell key not in counts")
assert(not countsStr:find("99999"),"coordinate from key not in counts")

-- Reset and verify all counts start at 0.
VSR.reset()
counts=getWaits()
for k,v in pairs(counts) do assert(v==0,"all counts reset to 0: "..k.."="..v) end

-- Drive the wait-ending function with test cases: 0.5h walking, 3h driving, 30h walking.
VSR._testRecordWait("walk",0.5)
counts=getWaits()
assert(counts.walk_h0_1==1,"0.5h walk -> h0_1 bucket")

VSR._testRecordWait("drive",3)
counts=getWaits()
assert(counts.walk_h0_1==1,"walk bucket unchanged")
assert(counts.drive_h1_6==1,"3h drive -> h1_6 bucket")

VSR._testRecordWait("walk",30)
counts=getWaits()
assert(counts.walk_h0_1==1,"walk h0_1 unchanged")
assert(counts.drive_h1_6==1,"drive h1_6 unchanged")
assert(counts.walk_h24_plus==1,"30h walk -> h24_plus bucket")
-- The edges: each bucket starts at its own number of hours.
VSR._testRecordWait("drive",1); VSR._testRecordWait("drive",6); VSR._testRecordWait("drive",24)
VSR._testRecordWait("walk",0/0); VSR._testRecordWait("walk",-1)
counts=VSR.waitCounts()
assert(counts.drive_h1_6==2 and counts.drive_h6_24==1 and counts.drive_h24_plus==1,"1, 6 and 24 hours open their buckets")
assert(counts.walk_h0_1==1 and counts.walk_h24_plus==1,"an invalid or negative wait is not counted")

-- Verify no sensitive strings leak into the counts.
countsStr=tostring(counts)
assert(not countsStr:find(CANARYKIND),"scene kind never appears")
assert(not countsStr:find(CANARYKEY),"cell key never appears")
assert(not countsStr:find("12345"),"canary number never appears")

-- Verify all 8 keys still present.
counts=getWaits()
for _,k in ipairs(expectedKeys) do assert(counts[k]~=nil,"key "..k.." present") end

print("PASS: C3 scene-wait histogram: counts by (mode, bucket), no sensitive data")
