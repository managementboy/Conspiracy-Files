package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local A=require("ConspiracyFiles/ObservedKeyAdapter")

-- observedKeyId reads the item's own live keyId, never a cached/stale value,
-- and treats PZ's "no key id" sentinel (-1) and a missing method as absent.
assert(A.observedKeyId({getKeyId=function() return 7 end})==7)
assert(A.observedKeyId({getKeyId=function() return -1 end})==nil)
assert(A.observedKeyId({getKeyId=function() return 1.5 end})==nil)
assert(A.observedKeyId({})==nil)
assert(A.observedKeyId({getKeyId=function() error("native failure") end})==nil)

-- candidates() resolves every catalogued site's live building keyId. Squares
-- and buildings mirror the codebase's plain-table PZ mocks (see
-- test/house_key_adapter.lua); every method below is invoked through the
-- adapter's own receiver-preserving `call`, exactly as it will be against a
-- real Java object.
local squares={}
local function square(x,y,z,keyId)
    local key=x..":"..y..":"..z
    squares[key]={getBuilding=function(self)
        if keyId==nil then return nil end
        return {getDef=function() return {getKeyId=function() return keyId end} end}
    end}
    return squares[key]
end
getCell=function()
    return {getGridSquare=function(self,x,y,z) return squares[x..":"..y..":"..z] end}
end

local function session(locations)
    return {snapshot=function() return {case={locations=locations}} end}
end

square(0,0,0,7)
square(10,10,0,9)
local sessions={
    session({{id="t3:house-a",bounds={x1=0,y1=0,x2=4,y2=4,z=0}},
             {id="t3:house-b",bounds={x1=10,y1=10,x2=14,y2=14,z=0}}}),
}
local candidates=A.candidates(sessions)
assert(#candidates==2)
local byId={}
for _,c in ipairs(candidates) do byId[c.id]=c.keyId end
assert(byId["t3:house-a"]==7 and byId["t3:house-b"]==9)

-- A site whose square is not loaded, or whose square has no building, is
-- skipped rather than guessed at.
square(20,20,0,nil)
local partial=A.candidates({session({
    {id="t3:house-a",bounds={x1=0,y1=0,x2=4,y2=4,z=0}},
    {id="t3:house-missing",bounds={x1=99,y1=99,x2=100,y2=100,z=0}}, -- square never registered
    {id="t3:house-nobuilding",bounds={x1=20,y1=20,x2=21,y2=21,z=0}},
})})
assert(#partial==1 and partial[1].id=="t3:house-a")

-- A malformed/absent session contributes nothing; never errors, never scans
-- past the two locations a case is guaranteed to carry.
assert(#A.candidates(nil)==0)
assert(#A.candidates({{snapshot=nil}})==0)
assert(#A.candidates({{snapshot=function() return {} end}})==0)
local threeSites=session({
    {id="t3:x",bounds={x1=0,y1=0,x2=1,y2=1,z=0}},
    {id="t3:y",bounds={x1=0,y1=0,x2=1,y2=1,z=0}},
    {id="t3:z",bounds={x1=0,y1=0,x2=1,y2=1,z=0}},
})
assert(#A.candidates({threeSites})<=A.MAX_SITES_PER_CASE)

-- Duplicate building ids across sessions fold to their first sighting.
local duplicateSessions={
    session({{id="t3:house-a",bounds={x1=0,y1=0,x2=4,y2=4,z=0}}}),
    session({{id="t3:house-a",bounds={x1=0,y1=0,x2=4,y2=4,z=0}}}),
}
assert(#A.candidates(duplicateSessions)==1)

-- resolve() ties the pieces together and stays a lead, never proof: the
-- caller gets a matched building id/keyId or a plain refusal reason.
local key={getKeyId=function() return 7 end}
local matched,status=assert(A.resolve(key,sessions))
assert(status=="matched" and matched.id=="t3:house-a" and matched.keyId==7)

local noKey={getKeyId=function() return -1 end}
local nothing,why=A.resolve(noKey,sessions)
assert(nothing==nil and why=="not-a-locking-key")

local unmatched={getKeyId=function() return 42 end}
local none,noneWhy=A.resolve(unmatched,sessions)
assert(none==nil and noneWhy=="no-match")

square(30,30,0,7)
local ambiguousSessions={session({
    {id="t3:house-a",bounds={x1=0,y1=0,x2=4,y2=4,z=0}},
    {id="t3:house-c",bounds={x1=30,y1=30,x2=34,y2=34,z=0}},
})}
local refused,ambigWhy=A.resolve(key,ambiguousSessions)
assert(refused==nil and ambigWhy=="ambiguous")

print("observed_key_adapter: ok")
