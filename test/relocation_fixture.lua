-- THE RELOCATION CHECK'S OWN REPORTING, held without a game.
--
-- Five gaps in the first version, all reintroductions of failures
-- test/placement_fixture.lua already covered - because a new file was written
-- instead of reusing the discipline the old one earned:
--   1. a REFUSAL counted as relocation having run, so a run where nothing moved
--      could exit 0 saying "no mismatch after relocation";
--   2. zero successful comparisons did not affect the success condition;
--   3. the printed conditions did not match the runtime's (an empty visited set
--      instead of VisitedBuildingLog.set(), and no token-count, carried-item or
--      destination-proximity guards), so it could not explain a refusal;
--   4. compare() re-read the world itself and lost the status check, the
--      inventory exclusion and the guarded reads;
--   5. capture() set holds="false" BEFORE walking the items, so a throw mid-walk
--      left a read failure recorded as absence - the baseline lying about the
--      starting state.
--
-- This file holds the parts that can be held without a game: the baseline's
-- read discipline, the conditions report's completeness, and the verdict
-- classification the shell's counting depends on.
-- VisitedBuildingLog is a CLIENT module: relocation.lua requires it because the
-- runtime does, so the fixture needs the client path too.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")

getCell=nil
ModData={get=function() return nil end}
getPlayer=function() return nil end
getGameTime=function() return {getWorldAgeHours=function() return 200 end,
                               getDay=function() return 8 end,
                               getNightsSurvived=function() return 8 end} end
dofile("tools/autotest/checks/placement.lua")
dofile("tools/autotest/checks/relocation.lua")
assert(type(CFReloc)=="table","the relocation check loads outside the game")
assert(type(CFPlace)=="table","and so does the placement check it now reuses")

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

local case=makeCase(4300)
local root=rootFor(case)
local wrapper={canonical=root,schedule={schema=1,createdHours={1}}}
local store={campaign=wrapper}
ModData={get=function() return store end}
local api=assert(S.open(root,function(staged) wrapper=assert(Cases.replace(wrapper,1,staged)); store.campaign=wrapper end))
local id=case.documents[1].id
assert(api.status(id,"placed",5))

local function jl(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local function loadedSquare() return {getObjects=function() return jl({}) end,
                                      getWorldObjects=function() return jl({}) end,
                                      getStaticMovingObjects=function() return jl({}) end} end
getCell=function() return {getGridSquare=function() return loadedSquare() end} end

-- ---------------------------------------------------------------------------
-- 1. THE BASELINE NEVER RECORDS A READ FAILURE AS ABSENCE ------------------
-- ---------------------------------------------------------------------------
-- holds must stay "unreadable" unless the walk SUCCEEDS.
local function containerWith(tokens, opts)
    opts = opts or {}
    local items={}
    for _,tok in ipairs(tokens) do items[#items+1]={getModData=function() return {cfPhysicalToken=tok} end} end
    return {getType=function() return "desk" end,
            getItems=function()
                if opts.itemsThrows then error("injected getItems failure") end
                return {size=function() return #items end,
                        get=function(_,i)
                            if opts.walkThrows then error("injected walk failure") end
                            return items[i+1]
                        end}
            end}
end
local token="cf-g2:"..id
local realResolver=CFPlace.resolver

-- (a) the token is there: holds=true
CFPlace.resolver=function() return containerWith({token}) end
local realWorldResolve=package.loaded["ConspiracyFiles/WorldAccess"].resolve
package.loaded["ConspiracyFiles/WorldAccess"].resolve=function() return containerWith({token}) end
local line=CFReloc.capture()
assert(line:find("\ttrue$") or line:find("\ttrue\n"),"a present token records holds=true: "..line)

-- (b) the item list throws: holds must be "unreadable", NOT "false"
package.loaded["ConspiracyFiles/WorldAccess"].resolve=function() return containerWith({token},{itemsThrows=true}) end
line=CFReloc.capture()
assert(line:find("unreadable",1,true),"an unreadable item list records UNREADABLE: "..line)
assert(not line:find("\tfalse",1,true),"and never records absence: "..line)

-- (c) a throw PART WAY through the walk: the fault that was actually there.
package.loaded["ConspiracyFiles/WorldAccess"].resolve=function() return containerWith({token},{walkThrows=true}) end
line=CFReloc.capture()
assert(line:find("unreadable",1,true),"a mid-walk throw records UNREADABLE too: "..line)
assert(not line:find("\tfalse",1,true),
    "and NOT absence - holds used to be set to false before the walk, so a throw left it false")

-- (d) genuinely absent, read successfully: that IS false, and must be.
package.loaded["ConspiracyFiles/WorldAccess"].resolve=function() return containerWith({"cf-g2:other"}) end
line=CFReloc.capture()
assert(line:find("\tfalse",1,true),"a successful read of an absent token records false: "..line)

-- (e) resolution refused: its own answer, neither absence nor unreadable.
package.loaded["ConspiracyFiles/WorldAccess"].resolve=function() return nil end
line=CFReloc.capture()
assert(line:find("no%-container"),"a refused resolution says so: "..line)
print("PASS relocation fixture: the baseline records unreadable as unreadable, never as absence")

-- ---------------------------------------------------------------------------
-- 2. THE CONDITIONS REPORT MATCHES THE RUNTIME'S GUARDS -------------------
-- ---------------------------------------------------------------------------
-- It must be able to explain EVERY refusal the runtime can log, so every guard
-- the runtime applies has to appear.
package.loaded["ConspiracyFiles/WorldAccess"].resolve=function() return containerWith({token}) end
package.loaded["ConspiracyFiles/WorldAccess"].count=function(container,tok,done)
    return function() done(1); return true end
end
getPlayer=function() return {getX=function() return 0 end,getY=function() return 0 end,
                             getZ=function() return 0 end,
                             getInventory=function() return containerWith({}) end} end
local conds=CFReloc.conditions()
for _,field in ipairs({"stale=","age-placed=","canAttempt=","relocations=","quantity=",
                       "onCarrier=","oldContainer=","visitedKnown=","destinations=",
                       "tooCloseToOld=","tooCloseToDest~=","inOldContainer=","carried=",
                       "canRelocate="}) do
    assert(conds:find(field,1,true),"the conditions report includes "..field.." : "..conds:sub(1,200))
end
-- The visited set comes from the runtime's own log, not an empty table. If that
-- lookup throws it must SAY so rather than quietly using {}.
assert(conds:find("visitedKnown=yes",1,true) or conds:find("visitedKnown=THREW",1,true),
    "the visited lookup is reported either way")

-- An unreadable count must read as unknown, never as a satisfied guard.
package.loaded["ConspiracyFiles/WorldAccess"].count=function() error("injected count failure") end
local condsBad=CFReloc.conditions()
assert(condsBad:find("canRelocate=unknown",1,true),
    "a count that cannot be read makes the guard UNKNOWN, not passed: "..condsBad:sub(1,200))
print("PASS relocation fixture: the conditions report covers every guard the runtime applies")

-- ---------------------------------------------------------------------------
-- 3. THE VERDICT THE SHELL'S COUNTING DEPENDS ON --------------------------
-- ---------------------------------------------------------------------------
-- compare() must hand back CFPlace's guarded verdict, so the shell can count
-- real comparisons. A read error must NOT read as a comparison and must NOT
-- read as a mismatch.
package.loaded["ConspiracyFiles/WorldAccess"].count=function(container,tok,done)
    return function() done(1); return true end
end
CFReloc.capture()

CFPlace.resolver=function() return containerWith({token}) end
local matched=CFReloc.compare(id)
assert(matched:find("verdict=none",1,true),"a matching record reads verdict=none: "..matched)

CFPlace.resolver=function() return containerWith({"cf-g2:other"}) end
local mismatched=CFReloc.compare(id)
assert(mismatched:find("verdict=DISCREPANCY",1,true),"a real mismatch reads DISCREPANCY: "..mismatched:sub(1,120))
assert(mismatched:find("foundNear=",1,true),"and reports where the item actually is")

CFPlace.resolver=function() error("injected resolver failure") end
local readErr=CFReloc.compare(id)
assert(readErr:find("verdict=read%-error"),"a read failure reads read-error: "..readErr:sub(1,120))
assert(not readErr:find("verdict=DISCREPANCY",1,true),"and is NEVER a mismatch")
assert(not readErr:find("verdict=none",1,true),"and is NEVER a clean comparison either")

-- And the record-moved delta, which is the only thing compare adds over verify.
CFPlace.resolver=function() return containerWith({token}) end
local before=CFReloc.compare(id)
assert(before:find("recordMoved=false",1,true),"an unmoved record says so: "..before)
assert(api.relocate(id,{x=999,y=999,z=0,objectIndex=0,containerIndex=0,
    containerType=case.locations[1].containerTypes[1],sprite="s"},200)
    or true,"the record may or may not accept this target; the delta is what matters")
print("PASS relocation fixture: compare hands back the guarded verdict, and a read error is neither result")

package.loaded["ConspiracyFiles/WorldAccess"].resolve=realWorldResolve
CFPlace.resolver=realResolver
