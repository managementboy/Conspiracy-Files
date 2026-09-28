-- Content-blind state dump for playtests and bug reports.
-- One log line when called (debug console: NHShared.StateDump.run(); a key or
-- menu trigger is checklist C6), carrying only numbers.
-- No clue text, ids, place/site/person/scene names, coordinates, or reversible ids.
local M={}

local CFLog=require("NHShared/Log")
local Cases=require("NHShared/Generated/SuccessiveCases")

-- Gate: single-player only (matches ClueMarkers.allowed).
local function allowed()
    return not (isClient and isClient()) and not (isServer and isServer())
        and not NHShared.T11Mode and not NHShared.T12Mode
end

-- Fixed set of field names that may appear in the output. All values are numbers.
-- Exported so tests can scan for drift against actual enqueue calls.
M.FIELDS={
    -- Status counts (8 known + 1 other)
    pending=true, placing=true, placed=true, unknown=true,
    conflict=true, deferred=true, indexed=true, dropped=true, statusOther=true, lost=true,
    -- How found
    foundBySearch=true, foundByLook=true, foundOther=true,
    -- Steps per subsystem (cumulative since load)
    placement=true, preparation=true, identity=true, relocation=true,
    filler=true, carrier=true, tracking=true, map_areas=true, map_metadata=true,
    other=true,
    -- Queued per subsystem (cumulative since load)
    queued_placement=true, queued_preparation=true, queued_identity=true,
    queued_relocation=true, queued_filler=true, queued_carrier=true,
    queued_tracking=true, queued_map_areas=true, queued_map_metadata=true, queued_other=true,
    -- Metrics
    peakMs=true,  -- peak frame time (ms) as R.metrics reports it
    bytes=true,   -- record size in bytes
    saveInvalid=true,  -- 1 if SaveBudget.checkMany returned false (validation failed)
}

-- Pure function: builds a flat table of fields from root, metrics, and bytes.
-- saveValid: optional, true/false from SaveBudget.checkMany's first return value.
function M.build(root, metrics, bytes, saveValid)
    if not root or type(root)~="table" then return {} end
    if saveValid==nil then saveValid=true end  -- default: assume valid

    local fields={}

    -- Assignment status counts: 8 known statuses + statusOther for any unknown.
    local statuses={pending=0, placing=0, placed=0, unknown=0,
                    conflict=0, deferred=0, indexed=0, dropped=0, statusOther=0}
    local knownStatus={pending=true, placing=true, placed=true, unknown=true,
                       conflict=true, deferred=true, indexed=true, dropped=true}
    local assignments=root.assignments or {}
    for _,a in pairs(assignments) do
        if a and a.status then
            if knownStatus[a.status] then statuses[a.status]=statuses[a.status]+1
            else statuses.statusOther=statuses.statusOther+1 end
        end
    end
    for status,count in pairs(statuses) do if count>0 then fields[status]=count end end

    -- lost = dropped + unknown
    fields.lost=(statuses.dropped or 0)+(statuses.unknown or 0)

    -- How clues were found: count from recognisedHow.
    local foundBySearch, foundByLook, foundOther=0, 0, 0
    local recognisedHow=root.recognisedHow or {}
    for _, how in pairs(recognisedHow) do
        if how=="search" then foundBySearch=foundBySearch+1
        elseif how=="look" then foundByLook=foundByLook+1
        else foundOther=foundOther+1 end
    end
    fields.foundBySearch=foundBySearch
    fields.foundByLook=foundByLook
    if foundOther>0 then fields.foundOther=foundOther end

    -- Scheduler: steps and queued per job class, plus peakMs.
    -- Both are cumulative since the scheduler started (load).
    if metrics then
        if metrics.steps and type(metrics.steps)=="table" then
            for subsystem,count in pairs(metrics.steps) do
                if type(subsystem)=="string" then
                    local key=subsystem:gsub("-","_")
                    if M.FIELDS[key] then fields[key]=(fields[key] or 0)+count
                    else fields.other=(fields.other or 0)+count end
                end
            end
        end
        if metrics.queued and type(metrics.queued)=="table" then
            for subsystem,count in pairs(metrics.queued) do
                if type(subsystem)=="string" then
                    local subKey=subsystem:gsub("-","_")
                    local key="queued_"..subKey
                    if M.FIELDS[key] then fields[key]=(fields[key] or 0)+count
                    else fields.queued_other=(fields.queued_other or 0)+count end
                end
            end
        end
        if metrics.peakMs and type(metrics.peakMs)=="number" then fields.peakMs=metrics.peakMs end
    end

    -- Record bytes only when it's a number (SaveBudget.checkMany returned true).
    if bytes and type(bytes)=="number" then fields.bytes=bytes end

    -- Mark if SaveBudget returned false (validation failed, not size limit).
    if saveValid==false then fields.saveInvalid=1 end

    return fields
end

-- Validate: returns false plus the bad key if any key is invalid or any value is not a number.
function M.clean(fields)
    if type(fields)~="table" then return false, "not a table" end
    for key, value in pairs(fields) do
        -- Key must be in FIELDS.
        if not M.FIELDS[key] then return false, key end
        -- Value must be a number only (build() never emits strings).
        if type(value)~="number" then return false, key end
    end
    return true
end

-- Gather live inputs, call build, check clean, and write log line.
-- Wrapped in pcall so malformed metrics can never crash the caller.
function M.run()
    if not allowed() then return end

    local ok, err=pcall(function()
        -- Get the session root via Cases.currentCached (like ClueMarkers.lua L24-26).
        local w=ModData.get("NHShared.Generated.G2")
        if not w then return end
        w=Cases.currentCached(w, getTimeInMillis and getTimeInMillis())
        if not w then return end
        local root=w.canonical
        if not root then return end

        -- Get metrics from GeneratedRuntime.
        local metrics=nil
        local R=require("NHShared/GeneratedRuntime")
        if R and R.metrics then metrics=R.metrics() end

        -- Get bytes from SaveBudget.
        local bytes=nil
        local saveValid=nil
        local SaveBudget=require("NHShared/SaveBudget")
        if SaveBudget then
            saveValid, bytes=SaveBudget.checkMany({})
        end

        -- Build the dump.
        local fields=M.build(root, metrics, bytes, saveValid)
        if not fields or next(fields)==nil then return end

        -- Validate it.
        local valid, badKey=M.clean(fields)
        if not valid then
            CFLog.error("dump",{why="failed"})
            return
        end

        -- Write the log line.
        CFLog.write("i","dump",fields)
    end)

    if not ok then
        -- Error during dump: log only {why="failed"}, never the raw error.
        CFLog.error("dump",{why="failed"})
    end
end

-- Make it callable from the debug console.
NHShared=NHShared or {}
NHShared.StateDump=M

return M
