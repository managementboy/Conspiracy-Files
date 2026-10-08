-- Owner code review F-02 (2026-09-28): the storage scan's vehicle pass is
-- optional, but a failure is never silent. With the vehicle lookup failing,
-- the scan still finishes with its other spots, logs the failure, and tells
-- its caller (done's sixth value); when it works, it says so too.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
getCell=function() return {getGridSquare=function() return nil end} end  -- nothing loaded: no furniture
local Log=require("NHShared/Log")
local logged={}
local realWrite=Log.write
Log.write=function(level,event,fields) logged[#logged+1]={level=level,event=event,fields=fields} end
local W=require("NHShared/WorldAccess")
local Storage=require("NHShared/Generated/Storage")

-- A raw nearby-scan result (NearbyCatalog.fromResult's format): one building
-- with one room rectangle.
local function result()
    return {version="T3-nearby-2",map="Muldraugh, KY",gameVersion="42.20.4",buildings=1,rows={
        {kind="building",id="p1",x=1000,y=1000,x2=1010,y2=1010,minLevel=0},
        {kind="room",building="p1",ordinal=1,name="kitchen"},
        {kind="rect",building="p1",x=1000,y=1000,z=0,w=10,h=10}}}
end
local function run()
    local out
    local step=assert(Storage.scan(result(),function(...) out={...} end))
    for _=1,100000 do if out then break end; step() end
    assert(out,"the scan finished")
    return out
end

local realNear=W.vehiclesNear
W.vehiclesNear=function() error("engine refused the vehicle list") end
logged={}
local out=run()
assert(out[1] and out[1].locations,"a failed vehicle pass still gives the catalogue")
assert(out[6]==true,"the caller is told the vehicle pass failed")
local seen=false
for _,l in ipairs(logged) do
    if l.level=="e" and l.fields and tostring(l.fields.why):find("vehicle scan failed",1,true) then seen=true end
end
assert(seen,"the failure is logged")

W.vehiclesNear=function() return {} end
logged={}
out=run()
assert(out[6]==false,"a working vehicle pass says so")
for _,l in ipairs(logged) do assert(l.level~="e","no error when the vehicle pass works") end
W.vehiclesNear=realNear
Log.write=realWrite
print("nohelp storage vehicles: a failed vehicle pass is logged and reported; the scan still finishes")
