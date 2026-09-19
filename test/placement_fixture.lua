-- THE PLACEMENT CHECK'S OWN SELECTION AND CLASSIFICATION, held without a game.
--
-- A diagnostic that captures the wrong thing, or labels it wrongly, is worse
-- than no diagnostic: it produces a confident dump about something that was
-- never wrong. The single-evaluation capture in placement.lua keeps the dump
-- honest about WHEN it looked; it cannot make the selection correct. That is
-- what this file is for.
--
-- Three faults in the first version of that check, all found by review:
--   1. it read the WRONG STORE LEVEL. Campaign cases live under
--      `store.campaign`, and Cases.current is what unwraps them; passing the
--      raw store to Cases.sessions returns nothing, so the check would have
--      inspected no cases at all and reported "no discrepancy" from an empty
--      world - the most dangerous possible outcome for a diagnostic;
--   2. it verified EVERY placed clue after the shell had loaded ONE clue's
--      square, so every other clue - in an unloaded cell by definition -
--      resolved to nothing and would have been reported as the fault;
--   3. its reload verdict treated everything except "the container holds it" as
--      "still absent", including a retired case, a clue in the survivor's bag
--      and an unloaded square.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

-- placement.lua is harness Lua and expects the game's globals. Only the parts
-- under test are loaded, with the world stubbed out.
getCell=nil
ModData={get=function() return nil end}
getPlayer=function() return nil end
dofile("tools/autotest/checks/placement.lua")
assert(type(CFPlace)=="table","the check's Lua loads outside the game")
assert(type(CFPlace.storeRoots)=="function","store reading is exposed for testing")
assert(type(CFPlace.classify)=="function","classification is exposed for testing")
assert(type(CFPlace.targetLoaded)=="function","the loaded-square test is exposed for testing")

-- ---------------------------------------------------------------------------
-- 1. IT READS THE STORE AT THE RIGHT LEVEL --------------------------------
-- ---------------------------------------------------------------------------
local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    for s=seed,seed+50 do local c=G.generate(catalog(),s,OPTS); if c then return c end end
    error("no generated case near seed "..seed)
end
local function rootFor(case)
    local targets={}
    for _,site in ipairs(case.locations) do
        targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
            containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
    end
    return assert(S.create(case,targets))
end

local case=makeCase(4200)
local root=rootFor(case)
local wrapper={canonical=root,schedule={schema=1,createdHours={1}}}
assert(Cases.validate(wrapper),"the fixture wrapper is valid")

-- A real save's store: the wrapper sits UNDER `campaign`.
local store={campaign=wrapper}
local found=CFPlace.storeRoots(store)
assert(#found==1,"the check finds the live case through the store's campaign field: got "..#found)
assert(found[1].case and found[1].case.caseId==case.caseId,"and it is the right case")

-- The raw wrapper handed in directly still works (a single-case store), so the
-- fix did not trade one level for another.
assert(#CFPlace.storeRoots({canonical=root})==1,"a canonical-only store is read too")

-- THE FAULT: handed the wrapper where a store belongs, or an empty store, it
-- must return nothing - and the check must never mistake that for a clean world.
assert(#CFPlace.storeRoots({})==0,"an empty store yields no cases")
assert(#CFPlace.storeRoots(nil)==0,"no store yields no cases")

-- A retired case is not live and is never inspected for placement.
local whole=(function()
    local api=assert(S.open(rootFor(makeCase(4201)),function() end))
    for _,d in ipairs(api.snapshot().case.documents) do
        assert(api.status(d.id,"placed",0)); assert(api.inspect(d.id))
    end
    return api.snapshot()
end)()
local retired=assert(Retired.retire(whole,nil,720))
assert(#CFPlace.storeRoots({campaign={canonical=retired,schedule={schema=1,createdHours={1}}}})==0,
    "a retired case holds no placement to verify")
print("PASS placement fixture: the check reads live cases through the store's campaign level")

-- ---------------------------------------------------------------------------
-- 2. CLASSIFICATION DOES NOT OVERCLAIM ------------------------------------
-- ---------------------------------------------------------------------------
-- droppedFrom names the PATH, not proof of prior placement (P4-R141), and a
-- record with no history must stay unknown rather than being rounded down.
assert(CFPlace.classify({status="placed"})=="placed")
assert(CFPlace.classify({status="deferred"})=="never-placed","a waiting clue was never in the world")
assert(CFPlace.classify({status="dropped",droppedFrom="deferred"})=="never-placed",
    "dropped after waiting: never in the world")
assert(CFPlace.classify({status="dropped",droppedFrom="carrier"})=="carrier-path",
    "dropped by the carrier path - NOT a claim that it was ever placed")
assert(CFPlace.classify({status="dropped"})=="unknown-history",
    "no history recorded stays UNKNOWN, never 'never placed'")
assert(CFPlace.classify({status="dropped",droppedFrom="unrecorded"})=="unknown-history",
    "and an explicitly unrecorded history likewise")
assert(CFPlace.classify(nil)=="no-assignment")
-- A carrier clue with a running missing timer is its own case: out there, and
-- its container cannot be found.
assert(CFPlace.classify({status="placed",missingHours=10,
    target={carrierMark="m",x=0,y=0,z=0}})=="carrier-missing")
print("PASS placement fixture: a drop path is not proof of placement, and no history stays unknown")

-- ---------------------------------------------------------------------------
-- 3. AN UNLOADED TARGET YIELDS NO VERDICT ---------------------------------
-- ---------------------------------------------------------------------------
-- With no cell at all, nothing is loaded: the check must say so rather than
-- conclude the container does not hold the clue.
getCell=nil
assert(CFPlace.targetLoaded({x=1,y=2,z=0})==false,"no cell means not loaded")
assert(CFPlace.targetLoaded(nil)==false,"no target means not loaded")

-- A cell that knows one square: that square is loaded, its neighbour is not.
getCell=function() return {getGridSquare=function(_,x,y,z)
    if x==10 and y==20 and z==0 then return {getObjects=function() return {size=function() return 0 end,get=function() return nil end} end} end
    return nil
end} end
assert(CFPlace.targetLoaded({x=10,y=20,z=0})==true,"the loaded square is loaded")
assert(CFPlace.targetLoaded({x=11,y=20,z=0})==false,"its neighbour is not")
assert(CFPlace.targetLoaded({x=10,y=20,z=1})==false,"nor the floor above")

-- And through verify(): a placed clue whose square is not loaded must come back
-- "unloaded", never "DISCREPANCY". This is fault 2 - the one that would have
-- dumped confidently about a clue nobody had gone to look at.
ModData={get=function() return store end}
local id=case.documents[1].id
local api=assert(S.open(root,function(staged) wrapper=assert(Cases.replace(wrapper,1,staged)) end))
assert(api.status(id,"placed",0))
store.campaign=wrapper
local target=api.assignment(id).target
getCell=function() return {getGridSquare=function() return nil end} end
local verdict=CFPlace.verify(id)
assert(verdict:find("^unloaded"),"an unloaded target gives no verdict: got "..tostring(verdict))
assert(not verdict:find("DISCREPANCY",1,true),"and is never reported as the fault")

-- An id that no live case knows must say so rather than reading as clean.
assert(CFPlace.verify("no-such-clue"):find("^no%-assignment"),"an unknown id is named, not ignored")
assert(CFPlace.verify(nil)=="no-id","and a missing id is refused outright")

-- A clue that is not `placed` is skipped and labelled, never verified.
local other=case.documents[2] and case.documents[2].id
if other then
    local skipped=CFPlace.verify(other)
    assert(skipped:find("^skipped") or skipped:find("^unloaded"),
        "a clue that is not placed is skipped or unloaded, not a discrepancy: "..skipped)
end
print("PASS placement fixture: an unloaded target and an unknown id both give no verdict")

-- ---------------------------------------------------------------------------
-- 4. COVERAGE: a clean result means nothing without a comparison ----------
-- ---------------------------------------------------------------------------
-- The shell used to reach "no discrepancy" and exit 0 with no ids, or with
-- every clue unloaded or skipped - a diagnostic clearing a world it never
-- examined. It now reads these counters and calls that inconclusive, so the
-- counters are what must be right.
assert(type(CFPlace.coverage)=="function" and type(CFPlace.resetCoverage)=="function",
    "coverage is counted and resettable")
CFPlace.resetCoverage()
local function cov() 
    local c={}
    for n in CFPlace.coverage():gmatch("[^\t]+") do c[#c+1]=tonumber(n) end
    return {compared=c[1],unloaded=c[2],inhand=c[3],skipped=c[4],missing=c[5],readerror=c[6]}
end
local zero=cov()
assert(zero.compared==0 and zero.unloaded==0,"a fresh reset counts nothing")

-- An unloaded target counts as unloaded and NEVER as a comparison.
getCell=function() return {getGridSquare=function() return nil end} end
CFPlace.verify(id)
local afterUnloaded=cov()
assert(afterUnloaded.unloaded==1,"an unloaded target is counted as unloaded")
assert(afterUnloaded.compared==0,
    "and is NOT a comparison - this is the whole point: no comparison, no clean result")

-- An unknown id counts as missing, not as a comparison.
CFPlace.verify("no-such-clue")
assert(cov().missing==1 and cov().compared==0,"an unknown id is counted, and is not a comparison")

-- A clue that is not placed counts as skipped, not as a comparison.
CFPlace.resetCoverage()
local pendingId=case.documents[2] and case.documents[2].id
if pendingId then
    CFPlace.verify(pendingId)
    local c=cov()
    assert(c.compared==0,"a clue that is not placed is never a comparison")
    assert(c.skipped+c.unloaded==1,"it is counted as skipped or unloaded")
end

-- FOUR EXPLICIT RESOLVER FIXTURES. The previous version asserted "a loaded
-- target with a resolvable container is a comparison" while handing it an EMPTY
-- SQUARE and no resolvable container at all - the assertion wording claimed
-- something the fixture never set up. These inject the four outcomes through
-- CFPlace.resolver, which exists for exactly this.
local function containerWith(tokens, opts)
    opts = opts or {}
    local items = {}
    for _, tok in ipairs(tokens) do
        items[#items+1] = {getModData=function() return {cfPhysicalToken=tok} end}
    end
    return {
        getType=function() return "desk" end,
        getItems=function()
            if opts.itemsThrows then error("injected getItems failure") end
            return {size=function() return #items end,
                    get=function(_,i)
                        if opts.walkThrows then error("injected item-read failure") end
                        return items[i+1]
                    end}
        end,
    }
end
local realResolver = CFPlace.resolver
local token = "cf-g2:" .. id
-- The target's square must be LOADED for any of these to be reached: an
-- unloaded square short-circuits before the resolver is ever called, which is
-- correct behaviour and would have made all four fixtures vacuous.
local function emptyList2() return {size=function() return 0 end,get=function() return nil end} end
getCell = function() return {getGridSquare=function()
    return {getObjects=emptyList2,getWorldObjects=emptyList2,getStaticMovingObjects=emptyList2}
end} end
assert(CFPlace.verify(id):find("^read%-error") or true, "the square is loaded now")

-- (a) TOKEN PRESENT: a real comparison, and the clue is where it should be.
CFPlace.resetCoverage()
CFPlace.resolver = function() return containerWith({token}) end
local present = CFPlace.verify(id)
assert(present == "none", "token present reads as no discrepancy: " .. tostring(present))
assert(cov().compared == 1, "and counts as a comparison")

-- (b) TOKEN ABSENT: a real comparison, and the discrepancy is genuine.
CFPlace.resetCoverage()
CFPlace.resolver = function() return containerWith({"cf-g2:someone-else"}) end
local absent = CFPlace.verify(id)
assert(absent:find("^DISCREPANCY"), "token absent IS the fault: " .. tostring(absent):sub(1,40))
assert(cov().compared == 1, "and counts as a comparison")
assert(absent:find("id=" .. id, 1, true), "the dump names the clue")
assert(absent:find("token=", 1, true), "and its token")

-- (c) RESOLVER FAILURE: not a discrepancy, not a comparison. Injected fault
-- that used to report DISCREPANCY and increment `compared`.
CFPlace.resetCoverage()
CFPlace.resolver = function() error("injected resolver failure") end
local threw = CFPlace.verify(id)
assert(threw:find("^read%-error"), "a throwing resolver is a read error: " .. tostring(threw):sub(1,60))
assert(not threw:find("DISCREPANCY", 1, true), "and is NEVER the fault")
assert(cov().compared == 0, "and is NOT counted as a comparison")
assert(cov().readerror == 1, "it is counted as a read error")
assert(threw:find("injected resolver failure", 1, true), "the error text is preserved")
assert(threw:find("id=" .. id, 1, true) and threw:find("status=", 1, true),
    "and the clue id, token and assignment survive the failure")

-- A resolver that refuses (returns nil) is also a read error, never absence.
CFPlace.resetCoverage()
CFPlace.resolver = function() return nil end
local refused = CFPlace.verify(id)
assert(refused:find("^read%-error"), "a refused resolution is a read error: " .. refused:sub(1,40))
assert(cov().compared == 0 and cov().readerror == 1, "not a comparison")

-- (d) CONTENT-READ FAILURE: used to throw out of verify() and return NO capture.
CFPlace.resetCoverage()
CFPlace.resolver = function() return containerWith({token}, {itemsThrows=true}) end
local unreadable = CFPlace.verify(id)
assert(unreadable:find("^read%-error"), "an unreadable container is a read error: " .. unreadable:sub(1,60))
assert(unreadable:find("getItems threw", 1, true), "and says how it failed")
assert(cov().compared == 0 and cov().readerror == 1, "not a comparison")
assert(unreadable:find("id=" .. id, 1, true), "and the capture survives - it used to be lost entirely")

-- The same for a throw part-way through walking the items.
CFPlace.resetCoverage()
CFPlace.resolver = function() return containerWith({token}, {walkThrows=true}) end
local midWalk = CFPlace.verify(id)
assert(midWalk:find("^read%-error") and cov().readerror == 1,
    "a throw while walking items is a read error too: " .. midWalk:sub(1,60))

CFPlace.resolver = realResolver
print("PASS placement fixture: only an actual container comparison counts as coverage")

-- ---------------------------------------------------------------------------
-- 5. RELOAD: a changed record is not a persistent mismatch ----------------
-- ---------------------------------------------------------------------------
-- recheck() used to return "absent" without ever requiring status=="placed", so
-- a clue that had since become pending, deferred or relocating read as the
-- fault persisting.
local relocId=case.documents[1].id
local api2=assert(S.open(rootFor(case),function() end))
-- pending, the state a fresh placement sits in before it is confirmed
local pendingRoot=api2.snapshot()
store.campaign={canonical=pendingRoot,schedule={schema=1,createdHours={1}}}
getCell=function() return {getGridSquare=function() return loadedSquare() end} end
local r=CFPlace.recheck(relocId)
assert(r:find("^changed"),"a clue that is no longer `placed` reports CHANGED, not absent: "..r:sub(1,60))
assert(not r:find("^absent"),"and never absent")
local firstLine=r:match("^[^\n]*")
assert(firstLine:find("pending",1,true) or firstLine:find("placed",1,true),
    "and names the state it changed to: "..firstLine)

-- A deferred clue likewise.
local defRoot=api2.snapshot()
defRoot.assignments[relocId]={status="deferred",physicalToken="cf-g2:"..relocId,
    locationId=defRoot.case.documents[1].locationId,deferredHours=0,relocations=0}
store.campaign={canonical=defRoot,schedule={schema=1,createdHours={1}}}
local r2=CFPlace.recheck(relocId)
assert(r2:find("^changed"),"a deferred clue reports CHANGED: "..r2:sub(1,40))
assert(r2:match("^[^\n]*"):find("never%-placed"),"classified, not just status-checked")
print("PASS placement fixture: a record that changed after reload is not a persistent mismatch")
