-- A soak test: grow ONE world, measure work and time per SINGLE write.
-- Work = pairs/ipairs iterations during one timed addArea. Seven consecutive
-- writes on ONE session opened from the grown record, so anything a session
-- keeps between writes (A3's index sets) counts as it would in play. Opening
-- the session is outside the timed window. Loops that do not go through the
-- global pairs/ipairs are not counted, so A7 gates on visits AND KB allocated.
-- The sink is a no-op, but commit still copies the record for it (Session.lua).
-- REPORT-ONLY: does not fail on ratio.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local S=require("NHShared/Generated/Session")
local AreaCase=require("NHShared/Generated/AreaCase")
local V=require("NHShared/Validator")
local Pick=require("NHShared/Generated/Pick")
local Inventory=require("nohelp_inventory")

local clues=Inventory.clues
local T_START=os.clock()
local MAX_TIME=55

local function site(i)
    return {id="t3:b"..i,bounds={x1=i*100,y1=0,x2=i*100+10,y2=10,z=0},containerTypes={"shelves","postbox"}}
end

-- Seven consecutive single writes on one session opened from snapshot.
local function measure_single_write(snapshot,siteBase,place)
    local stats={work={},time={},kb={}}
    local api=assert(S.open(snapshot,function() end))
    for n=1,7 do
        local site_=site(siteBase+n)
        local visits=0
        local rawPairs,rawIpairs=pairs,ipairs
        
        -- Prepare instrumented pairs/ipairs (not yet active)
        local function counting_pairs(t)
            local f,s,c=rawPairs(t)
            return function(st,k)
                local nk,nv=f(st,k)
                if nk~=nil then visits=visits+1 end
                return nk,nv
            end,s,c
        end
        local function counting_ipairs(t)
            local f,s,c=rawIpairs(t)
            return function(st,i)
                local ni,nv=f(st,i)
                if ni~=nil then visits=visits+1 end
                return ni,nv
            end,s,c
        end
        
        collectgarbage("stop")
        local kbBefore=collectgarbage("count")
        local t0=os.clock()
        
        -- Instrument and time the write
        pairs,ipairs=counting_pairs,counting_ipairs
        local ok,why=pcall(function()
            local added,refused=api.addArea{site=site_,place=place,clues=clues,version="v1",hours=1}
            if not added then error("the timed write was refused: "..tostring(refused)) end
        end)
        pairs,ipairs=rawPairs,rawIpairs  -- restore immediately
        
        local elapsed=os.clock()-t0
        local kbAfter=collectgarbage("count")
        collectgarbage("restart")
        
        assert(ok,tostring(why))
        
        stats.work[n]=visits
        stats.time[n]=elapsed
        stats.kb[n]=math.max(0,kbAfter-kbBefore)
    end
    table.sort(stats.work)
    table.sort(stats.time)
    table.sort(stats.kb)
    return stats.work[4],stats.time[4],stats.work[1],stats.work[7],
           stats.time[1],stats.time[7],stats.kb[4]
end

-- Create and grow the live session
local root=assert(S.createArea(4242),"a new world record")
local saved=root
local api=assert(S.open(root,function(n) saved=n end))

local initial_areas=0
for i=1,50 do
    local place=Inventory.places[((i-1)%#Inventory.places)+1]
    if api.addArea{site=site(i),place=place,clues=clues,version="v1",hours=i} then
        initial_areas=initial_areas+1
    end
end
assert(initial_areas>0,"initial areas added")

-- Grow at each checkpoint: use lifted cap for all
local checkpoints={}
local caps={1,2,5,10}
local originalCap=Pick.FIRST_DEVELOPMENT_CAP
local ok_run=pcall(function()
    Pick.FIRST_DEVELOPMENT_CAP=1000  -- lifted cap for all checkpoints
    
    for cap_idx,cap_mult in ipairs(caps) do
        local target_areas=initial_areas*cap_mult
        while #saved.case.areas<target_areas and os.clock()-T_START<MAX_TIME do
            local i=#saved.case.areas+1
            local place=Inventory.places[((i-1)%#Inventory.places)+1]
            if not api.addArea{site=site(50+i),place=place,clues=clues,version="v1",hours=i} then break end
        end
        
        -- Assert we reached target
        assert(#saved.case.areas==target_areas,
            string.format("cap %dx: expected %d areas, got %d",cap_mult,target_areas,#saved.case.areas))
        
        -- Measure one write with med/min/max on fresh session copies
        local med_work,med_time,min_work,max_work,min_time,max_time,med_kb=
            measure_single_write(saved,1000+cap_idx*10,"farm")
        
        -- Record size is reported, never limited: No Help has no save ceiling
        -- (owner, 2026-09-27: "No limit at all"; SaveBudget.lua).
        local bytes=V.estimateEncodedBytes(saved) or 0
        
        checkpoints[#checkpoints+1]={
            cap=cap_mult,
            areas=#saved.case.areas,
            docs=#saved.case.documents,
            work_med=med_work,
            work_min=min_work,
            work_max=max_work,
            time_med=med_time,
            time_min=min_time,
            time_max=max_time,
            kb_med=med_kb,
            bytes=bytes,
        }
    end
end)

-- Restore Pick cap via pcall guarantee
Pick.FIRST_DEVELOPMENT_CAP=originalCap

assert(ok_run,"soak test completed")

-- Report
for _,cp in ipairs(checkpoints) do
    print(string.format("cap=%dx areas=%d docs=%d: visits=%d(min=%d,max=%d) ms=%.1f(min=%.1f,max=%.1f) kb=%d bytes=%d",
        cp.cap,cp.areas,cp.docs,cp.work_med,cp.work_min,cp.work_max,
        cp.time_med*1000,cp.time_min*1000,cp.time_max*1000,cp.kb_med,cp.bytes))
end

if checkpoints[1].work_med>0 and checkpoints[#checkpoints].work_med>0 then
    local work_ratio=checkpoints[#checkpoints].work_med/checkpoints[1].work_med
    local time_ratio=checkpoints[#checkpoints].time_med/checkpoints[1].time_med
    local kb_ratio=checkpoints[#checkpoints].kb_med/math.max(1,checkpoints[1].kb_med)
    print(string.format("REPORT-ONLY (gate at A7): work_ratio=%.2f time_ratio=%.2f kb_ratio=%.2f",
        work_ratio,time_ratio,kb_ratio))
else
    print("REPORT-ONLY (gate at A7): work at 1x must be > 0")
end

assert(os.clock()-T_START<60,"soak test took over 60 seconds")
print("nohelp soak: passed")
