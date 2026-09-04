local Runtime = require("ConspiracyFiles/Runtime")

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.DebugHarness = ConspiracyFiles.DebugHarness or {}
local Harness = ConspiracyFiles.DebugHarness

local IDS = {
    d1 = "dead-air:asset:service-ticket-93-0714",
    d2 = "dead-air:asset:property-record-4471",
    d3 = "dead-air:asset:invoice-9327",
    d4 = "dead-air:asset:rourke-notebook-0703",
    d5 = "dead-air:asset:access-memo-7c",
    d6 = "dead-air:asset:pike-shift-note-0705",
    key = "dead-air:asset:key-b37",
}

local active = false
local stage = 0
local ticks = 0
local waits = 0

local function log(message)
    print("[CF-DEAD-AIR]|EVENT|kind=HARNESS|" .. message)
end

local function hasEvidence(assetId)
    if not Runtime.state then return false end
    for _, evidence in ipairs(Runtime.state.snapshot().evidence) do
        if evidence.assetId == assetId then return true end
    end
    return false
end

local function placement(assetId)
    local plan = Runtime.placementSummary()
    return plan and plan.assignments[assetId] or nil
end

local function isPlaced(assetId)
    local assignment = placement(assetId)
    return assignment and assignment.status == "placed"
end

local function logPhysical(label, assetId)
    local assignment = placement(assetId)
    log("step=physical-" .. label .. "|result=" .. (assignment and assignment.status or "missing")
        .. "|candidate=" .. tostring(assignment and assignment.candidateId or "<nil>"))
end

local function inspect(assetId, locationId)
    if not hasEvidence(assetId) then
        local ok, message = Runtime.state.discover(assetId, "Automated harness inspection", locationId)
        if not ok then error("harness inspection failed:" .. tostring(message)) end
        Runtime.persist()
    end
end

local function awaitPlacements(assetIds, step)
    local ready = true
    for _, assetId in ipairs(assetIds) do if not isPlaced(assetId) then ready = false end end
    if ready then
        waits = 0
        return true
    end
    waits = waits + 1
    Runtime.requestAllPlacements()
    if waits >= 20 then
        active = false
        log("step=failed|at=" .. step .. "|reason=placement-timeout")
    end
    return false
end

function Harness.run()
    if active then return false end
    local plan = Runtime.placementSummary()
    if not Runtime.state or not plan then log("step=blocked|reason=runtime-not-ready"); return false end
    active, stage, ticks, waits = true, 1, 0, 0
    Harness.cancelled = false
    Runtime.lastLocation = nil
    Runtime.requestAllPlacements()
    getPlayer():teleportTo(10615, 9603, 0)
    log("step=start|target=relay|placementSeed=" .. tostring(plan.seed))
    return true
end

function Harness.stop()
    Harness.cancelled = true
    active = false
    log("step=stopped")
end

local function onTick()
    if not active or Harness.cancelled then return end
    ticks = ticks + 1
    if ticks < 30 then return end
    ticks = 0
    if stage == 1 then
        if not awaitPlacements({ IDS.d1, IDS.d3 }, "relay") then return end
        logPhysical("d1", IDS.d1)
        inspect(IDS.d1, "dead-air:location:relay-office")
        log("step=inspect-d1|result=recorded")
        Runtime.lastLocation = nil
        getPlayer():teleportTo(10638, 10411, 0)
        stage = 2
        log("step=travel|target=police")
    elseif stage == 2 then
        if not awaitPlacements({ IDS.d2, IDS.d5, IDS.d6, IDS.key }, "police") then return end
        logPhysical("d2", IDS.d2)
        logPhysical("key", IDS.key)
        inspect(IDS.d2, "dead-air:location:police-property")
        log("step=inspect-d2|result=recorded")
        Runtime.lastLocation = nil
        getPlayer():teleportTo(10615, 9603, 0)
        stage = 3
        log("step=travel|target=relay-d3")
    elseif stage == 3 then
        logPhysical("d3", IDS.d3)
        inspect(IDS.d3, "dead-air:location:relay-office")
        log("step=inspect-d3|result=recorded")
        Runtime.lastLocation = nil
        getPlayer():teleportTo(10649, 9827, 0)
        stage = 4
        log("step=travel|target=motel-d4")
    elseif stage == 4 then
        if not awaitPlacements({ IDS.d4 }, "motel") then return end
        logPhysical("d4", IDS.d4)
        inspect(IDS.d4, "dead-air:location:rourke-motel")
        log("step=inspect-d4|result=recorded")
        Runtime.lastLocation = nil
        getPlayer():teleportTo(10638, 10411, 0)
        stage = 5
        log("step=travel|target=police-d5")
    elseif stage == 5 then
        logPhysical("d5", IDS.d5)
        inspect(IDS.d5, "dead-air:location:police-property")
        log("step=inspect-d5|result=recorded")
        stage = 6
    elseif stage == 6 then
        logPhysical("d6", IDS.d6)
        inspect(IDS.d6, "dead-air:location:police-property")
        log("step=inspect-d6|result=recorded")
        log("step=complete")
        active = false
    end
end

Events.OnTick.Add(onTick)
log("step=loaded|debugSeed=" .. tostring(3700714))

return Harness
