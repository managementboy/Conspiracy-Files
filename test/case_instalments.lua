-- A CASE MAY ARRIVE IN INSTALMENTS (P4-R133, docs/design/CASE_PACING.md).
--
-- A case used to be thrown away whole unless the loaded area could supply a
-- distinct container for every clue (P4-R67). Standing still exhausts the
-- loaded area, so a player who bases in one house stopped getting cases at
-- all: one campaign run refused seventeen times and never delivered a second
-- case. Now the case goes live with the clues that fit and the rest wait as an
-- open order, place themselves as the survivor moves about, and are dropped
-- after three in-game days if nowhere ever takes them.
--
-- What this test holds to account:
--   * a half-placed case validates, and validates again at every intermediate
--     state as the clues arrive one at a time;
--   * no two clues ever share one container, before or after an instalment;
--   * "nothing left to find" cannot fire while a clue is unwritten, and can
--     once an expired clue is dropped;
--   * a clue that was never placed can never be found, recognised, or
--     reconciled as placed by a scan;
--   * the filler is wired the way the design says: one job per session, one
--     clue per attempt, its own site, the uniqueness check, and the guard that
--     keeps a clue from appearing under the survivor's feet.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
-- A case with more than one clue at its first site, so a shortage there really
-- does leave something waiting.
local case
for seed=1,300 do
    local candidate=G.generate(catalog(),seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true})
    if candidate then
        local atFirst=0
        for _,d in ipairs(candidate.documents) do
            if d.locationId==candidate.locations[1].id then atFirst=atFirst+1 end
        end
        if atFirst>=2 and #candidate.documents>=4 then case=candidate; break end
    end
end
assert(case,"no seed in 1..300 gave a four-clue case with two clues at the first site")
local siteA,siteB=case.locations[1],case.locations[2]
local function targetAt(site,slot)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=slot,
        containerIndex=0,containerType=site.containerTypes[1],sprite="fixture"}
end

-- 1. One container at each site: the case goes live, the rest wait -----------
local candidates={[siteA.id]={targetAt(siteA,0)},[siteB.id]={targetAt(siteB,0)}}
local root,waiting=S.createDistributed(case,candidates,nil,nil,100)
assert(root,"a case must not be thrown away for want of containers")
assert(#waiting==#case.documents-2,
    "two clues fit and "..(#case.documents-2).." must wait, got "..#waiting)
assert(S.validate(root),"a half-placed case must validate")
local function keysOf(r)
    local keys,n={},0
    for _,a in pairs(r.assignments) do
        if a.target then
            local key=S.physicalKey(a.target)
            assert(not keys[key],"two clues must never share one container: "..key)
            keys[key]=true; n=n+1
        end
    end
    return keys,n
end
local _,placedNow=keysOf(root)
assert(placedNow==2,"exactly the two clues that fit are placed, got "..placedNow)
for _,id in ipairs(waiting) do
    local a=root.assignments[id]
    assert(a.status=="deferred","a clue that did not fit waits: "..tostring(a.status))
    assert(a.target==nil,"a waiting clue must carry no container, no sprite, no coordinates")
    assert(a.locationId,"a waiting clue must name the site it is meant for")
    assert(a.deferredHours==100,"and the hour its wait started")
end

-- 2. It validates at every intermediate state, and never repeats a container -
local staged={}
local api=assert(S.open(root,function(next) staged[#staged+1]=next end))
local slot=1
for index,id in ipairs(S.deferredIds(api.snapshot())) do
    local site=(api.assignment(id).locationId==siteA.id) and siteA or siteB
    -- The wrong site is refused: a waiting clue is not a licence to put it
    -- anywhere.
    local other=(site==siteA) and siteB or siteA
    assert(not api.assign(id,targetAt(other,50+index)),"a clue may only be placed at its own site")
    slot=slot+1
    assert(api.assign(id,targetAt(site,slot),100+index),"an instalment must be accepted")
    local now=api.snapshot()
    assert(S.validate(now),"the case must validate after instalment "..index)
    keysOf(now)
    assert(now.assignments[id].status=="pending","an instalment becomes an ordinary pending placement")
    assert(now.assignments[id].deferredHours==nil,"and stops waiting")
    assert(not api.assign(id,targetAt(site,90),1),"a clue that already has a container is not deferred any more")
end
assert(#staged==#waiting,"every instalment is one validated swap, got "..#staged)
assert(#S.deferredIds(api.snapshot())==0,"nothing is waiting once every instalment has arrived")

-- 3. Completion waits for the open order ------------------------------------
local half=assert(S.createDistributed(case,candidates,nil,nil,100))
local halfApi=assert(S.open(half,function() end))
local placed={}
for _,doc in ipairs(case.documents) do
    if halfApi.assignment(doc.id).status~="deferred" then placed[#placed+1]=doc.id end
end
for _,id in ipairs(placed) do
    assert(halfApi.status(id,"placed",101))
    assert(halfApi.inspect(id))
end
assert(not S.accounted(halfApi.snapshot()),
    "a case with a clue still waiting is NOT accounted for, so nothing may say there is nothing left to find")
assert(not Retired.retire(halfApi.snapshot()),"and it cannot retire")
-- A clue that was never placed can never be found or recognised.
local stillWaiting=S.deferredIds(halfApi.snapshot())
assert(#stillWaiting>0)
assert(not halfApi.inspect(stillWaiting[1]),"a waiting clue cannot be noted")
assert(not halfApi.status(stillWaiting[1],"placed",102),"nor claimed placed by a scan")
assert(not halfApi.recognise(stillWaiting[1]),"nor recognised: it is not in the world")

-- 4. Three in-game days, then dropped, and the case closes on what it got ----
assert(#S.expiredIds(halfApi.snapshot(),100+S.DEFER_EXPIRE_HOURS-0.1)==0,
    "a clue has three in-game days before it is dropped")
local expired=S.expiredIds(halfApi.snapshot(),100+S.DEFER_EXPIRE_HOURS)
assert(#expired==#stillWaiting,"at three days every waiting clue is up for dropping")
for _,id in ipairs(expired) do assert(halfApi.drop(id)) end
assert(#S.deferredIds(halfApi.snapshot())==0)
assert(S.accounted(halfApi.snapshot()),"a dropped clue is accounted for: the case closes on the clues it got")
local closed=assert(Retired.retire(halfApi.snapshot(),nil,200),
    "a case must be able to finish on the clues it got - a four-clue case is still a case")
assert(#closed.rows==#placed,"the record keeps a row for each clue actually found, got "..#closed.rows)
for _,row in ipairs(closed.rows) do
    for _,id in ipairs(expired) do assert(row.id~=id,"a dropped clue leaves no row") end
end
assert(Retired.validate(closed),"and the finished case validates")
-- Dropping is only ever for a clue that is waiting.
assert(not halfApi.drop(placed[1]),"a placed clue is not dropped")

-- 5. The filler is wired as the design says ---------------------------------
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")
local filler=assert(runtime:match("local function filler%(api%)(.-)\nend\n"),"the filler must exist")
assert(runtime:find('scheduler.enqueue("fill:"..i,"filler",filler(api))',1,true),
    "one filler job per session, on the existing tick dispatch beside relocation")
assert(filler:find("id=waiting[1]",1,true),"one waiting clue per attempt")
assert(filler:find("boundsScan(site,function(t) target=t end,",1,true),
    "the filler reuses boundsScan over the clue's own site")
assert(filler:find("usedPhysicalKeys()",1,true) and filler:find("Session.physicalKey(candidate)",1,true),
    "and skips a container any other clue already holds")
assert(filler:find("StaleClue.tooClose(",1,true),"nothing materialises under the survivor's feet")
assert(filler:find("Session.expiredIds(root,hours)",1,true),"the filler is also what drops an expired clue")
assert(filler:find('scheduler.enqueue("place:"..id,"placement",placement(api,id))',1,true),
    "an instalment is written by the same placement job as any other clue")
assert(runtime:find("if Session.accounted(done) then",1,true),
    "completion asks whether every clue is accounted for, not merely how many were found")
-- The player is told nothing on the refusal or the waiting path.
local refuse=assert(runtime:match("local function refuse%(code,wait,dueAt%)(.-)\nend\n"),"refuse must exist")
for _,forbidden in ipairs({"PlayerVoice","setHaloNote","ClueHints","ClueMarkers","onCase"}) do
    assert(not refuse:find(forbidden,1,true),"a refusal must say nothing to the player: "..forbidden)
    assert(not filler:find(forbidden,1,true),"nor must a clue arriving late: "..forbidden)
end
-- Nor does any surface get a total: only the log ever counts an open order.
assert(not runtime:find(" of \"..#waiting",1,true) and not runtime:find("#waiting..\" of",1,true),
    "no surface may reveal a total (no \"3 of 5\")")

print(string.format(
    "PASS instalments: %d of %d clues placed now, %d waiting, each arrival validated, expiry at %d in-game hours closes the case on %d rows",
    placedNow,#case.documents,#waiting,S.DEFER_EXPIRE_HOURS,#closed.rows))
