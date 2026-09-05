local Runtime=require("ConspiracyFiles/Runtime")
ConspiracyFiles=ConspiracyFiles or {}
local Harness={}
local function allowed() return isDebugEnabled and isDebugEnabled() and not Runtime.disabled end
function Harness.snapshot()
    if not allowed() then return nil end
    return {version=Runtime.VERSION,domain=Runtime.state.snapshot(),placement=Runtime.placementSummary(),metrics=Runtime.metrics()}
end
function Harness.fault(point)
    if not allowed() then return false end
    local supported={['before-intent']=true,['after-intent']=true,['before-add']=true,['after-add']=true,
        ['before-placed-commit']=true,['before-canonical-swap']=true,['inspect-domain']=true,['arrival-domain']=true}
    if not supported[point] then return false end
    Runtime.faultPoint=point
    print('[CF-DEAD-AIR]|FAULT_ARMED|'..point)
    return true
end
-- Diagnostics never teleport, inspect, mark, save, or claim GUI completion.
ConspiracyFiles.DebugHarness=Harness
return Harness
