package.path="dev/next-phase/?.lua;"..package.path
local Stats=require("PerfStats")

local s=Stats.new{maxLabels=2,nameLimit=8,budgetMs=2}
for _,options in ipairs({{maxLabels=0},{maxLabels=65},{maxLabels=math.huge},{nameLimit=0},{nameLimit=129},{nameLimit=math.huge}}) do
    assert(not pcall(function() Stats.new(options) end), "constructor bounds must reject impractical capacity")
end
assert(s.record("metadata",0.25))
assert(s.record("metadata",2)) -- equal to budget is not over budget
assert(s.record("metadata",2.01))
assert(s.record("identity",4,3))
local snapshot=s.snapshot()
assert(snapshot.labelCount==2 and #snapshot.rows==2)
assert(snapshot.rows[2].name=="metadata" and snapshot.rows[2].count==3)
assert(snapshot.rows[2].totalMs==4.26 and snapshot.rows[2].peakMs==2.01 and snapshot.rows[2].overBudget==1)
assert(snapshot.rows[1].name=="identity" and snapshot.rows[1].overBudget==1)
snapshot.rows[2].count=999; snapshot.rows[2].name="changed"
local isolated=s.snapshot(); assert(isolated.rows[2].name=="metadata" and isolated.rows[2].count==3, "snapshots must not expose mutable internal rows")
assert(not s.record("rendering",0.1), "fixed label cap must reject a new subsystem")
assert(not s.record("",0.1) and not s.record("toolonggg",0.1))
assert(not s.record("metadata",-1) and not s.record("metadata",0/0) and not s.record("metadata",0.1,-1))
s.reset(); snapshot=s.snapshot(); assert(snapshot.labelCount==0 and #snapshot.rows==0)
print("PASS PerfStats: aggregates, thresholds, invalid input, reset, and bounded labels")
