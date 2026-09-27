-- No job class starves another, at any document count (first visible
-- playtest, 2026-09-27). The runtime queued one placement job per document
-- every 120 ticks into a scheduler with one shared 32-job cap; at 32
-- documents the placement jobs held every slot and every job queued after
-- them in the same tick (identity, relocation, filler, carrier, tracking, map
-- areas) was refused. In play: no new areas, placement only on arrival.
--
-- Driven here: No Help's own Scheduler, and the runtime's own enqueue() taken
-- from its source, with the tick's job classes queued in the tick's order,
-- for 0, 31, 32, 200 and 2000 documents that all still wait to be written.
-- Every class must run in every 120-tick cycle, and every waiting document
-- must get its placement turn.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local RUNTIME="mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua"
local src=read(RUNTIME)
local Scheduler=dofile("mod-nohelp/common/media/lua/shared/NHShared/Scheduler.lua")
-- The original mod's copy is not changed by this fix.
assert(not read("mod/common/media/lua/shared/ConspiracyFiles/Scheduler.lua"):find("held",1,true),
    "the original mod's scheduler is untouched")

-- The runtime's enqueue, exactly as shipped.
local body=src:match("\n(local PLACING=.-\nlocal function enqueue%(%).-\nend\n)")
assert(body,"the runtime's enqueue is where it was")
local chunk=assert(loadstring(body.."return enqueue"))
-- And the tick still queues it before the fixed classes.
local tick=src:match('on%("OnTick", function%(%).-\nend%)')
assert(tick and tick:find("enqueue(); for i,api in ipairs(sessions) do scheduler.enqueue(\"identity:\"",1,true),
    "the tick queues placement, then identity")
for _,class in ipairs({"relocation","filler","carrier","tracking","map-areas"}) do
    assert(tick:find('"'..class..'"',1,true),"the tick queues "..class)
end

local function run(n)
    local clock=0
    local s=Scheduler.new(function() return clock end,function() end)
    s.maxSteps=24; s.budgetMs=1  -- the runtime's settings
    -- One session, n documents, every one still pending: the worst case,
    -- where every document keeps asking for a job.
    local docs,assignments={},{}
    for i=1,n do docs[i]={id="d"..i}; assignments["d"..i]={status="pending"} end
    local api={snapshot=function() return {case={documents=docs},assignments=assignments} end}
    local turns={}
    -- A placement job that waits three steps, then ends with the document
    -- still pending (as for a square the game has not loaded).
    local function placement(_,id)
        local left=3
        return function() left=left-1; if left>0 then return false end turns[id]=(turns[id] or 0)+1; return true end
    end
    local env=setmetatable({sessions={api},scheduler=s,saveRefused=function() return false end,placement=placement},
        {__index=_G})
    setfenv(chunk,env)
    local enqueue=chunk()
    -- The fixed classes: long-running jobs, as the identity scan is.
    local function long() local left=50; return function() left=left-1; return left<=0 end end
    local cycles=math.max(3,math.ceil(n/s.maxJobs)+2)
    for cycle=1,cycles do
        local before=s.counts()
        for t=1,120 do
            if t==120 then
                enqueue()
                s.enqueue("identity:1","identity",long())
                s.enqueue("relocate:1","relocation",long())
                s.enqueue("fill:1","filler",long())
                s.enqueue("carrier:1","carrier",long())
                s.enqueue("visited-building","tracking",long())
                s.enqueue("map-areas","map-areas",long())
                s.enqueue("area-decide","preparation",long())
                -- Arrivals queue filler jobs too, one per area.
                for a=1,40 do s.enqueue("arrive:"..a,"filler",long()) end
            end
            s.step()
        end
        local after=s.counts()
        if cycle>=2 then
            for _,class in ipairs({"identity","relocation","filler","carrier","tracking","map-areas","preparation"}) do
                assert((after[class] or 0)>(before[class] or 0),
                    n.." documents: "..class.." ran no step in cycle "..cycle)
            end
            if n>0 then
                assert((after.placement or 0)>(before.placement or 0),n.." documents: placement ran in cycle "..cycle)
            end
        end
    end
    -- Every waiting document had its turn: the walk resumes where it stopped.
    for i=1,n do assert(turns["d"..i],n.." documents: document "..i.." never got a placement turn") end
    -- A placed document asks for no job at all.
    for i=1,n do assignments["d"..i].status="placed" end
    while s.has("placement") do s.step() end
    enqueue()
    assert(not s.has("placement"),n.." documents: nothing queued for placed documents")
end
for _,n in ipairs({0,31,32,200,2000}) do run(n) end

-- The scheduler's cap is per job class: a full class refuses only its own.
local s=Scheduler.new(function() return 0 end,function() end)
for i=1,s.maxJobs do assert(s.enqueue("p"..i,"placement",function() return true end)) end
assert(s.full("placement") and not s.enqueue("p-extra","placement",function() return true end),"a full class refuses more")
assert(s.enqueue("identity:1","identity",function() return true end),"another class is still accepted")
s.retain(function(job) return job.subsystem~="placement" end)
assert(not s.full("placement") and s.enqueue("p-again","placement",function() return true end),"retain frees the class")
print("nohelp scheduler share: every job class runs each cycle at 0, 31, 32, 200 and 2000 documents; every document gets its turn")
