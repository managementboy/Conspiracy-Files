-- OFFLINE synthetic workload only. This is not a Project Zomboid FPS benchmark.
package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local Stats=require("PerfStats")
local Scheduler=require("ConspiracyFiles/Scheduler")
local stats=Stats.new{maxLabels=5,budgetMs=2}
local clock=0
local scheduler=Scheduler.new(function() clock=clock+0.05; return clock end,function() end)
scheduler.maxSteps=8; scheduler.budgetMs=0.5
local categories={metadata=0.40,identity=2.25,pen_checks=0.15,rendering=0.80,save_validation=1.40}
for name,duration in pairs(categories) do
    local remaining=20
    assert(scheduler.enqueue(name,"offline",function()
        assert(stats.record(name,duration)); remaining=remaining-1; return remaining==0
    end))
end
while scheduler.step()>0 do end
local started=os.clock(); local sink=0
for i=1,200000 do sink=sink+i end
local elapsed=(os.clock()-started)*1000
local report=stats.snapshot()
print("OFFLINE synthetic scheduler report; 2ms is a future native target, not acceptance:")
for _,row in ipairs(report.rows) do
    print(string.format("%s count=%d total=%.2fms peak=%.2fms over_budget=%d",row.name,row.count,row.totalMs,row.peakMs,row.overBudget))
end
print(string.format("OFFLINE os.clock reference loop=%.3fms (sink=%d)",elapsed,sink))
