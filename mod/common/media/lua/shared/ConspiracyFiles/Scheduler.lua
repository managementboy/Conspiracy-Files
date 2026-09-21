-- One step performs one bounded record/engine operation. Time is supplied by
-- the adapter; Lua-only tests use an injected clock. No engine globals here.
local Scheduler = {}
function Scheduler.new(clock, report)
    local queue, keys, failures, disabled = {}, {}, {}, {}
    -- Steps actually run, per subsystem. Read-only bookkeeping: working out
    -- why a case never arrived meant inferring steps from log frame numbers
    -- twice, and being wrong twice (20260921T105423-second-scan-fixed). A job
    -- that is starving and a job that is merely slow look identical from
    -- outside; this tells them apart.
    local counts = {}
    local api = { maxSteps = 48, budgetMs = 2, maxJobs = 32, peakMs = 0 }
    function api.counts()
        local out = {}
        for subsystem, n in pairs(counts) do out[subsystem] = n end
        return out
    end
    -- What is waiting, so a queue that never drains can be seen.
    function api.queued()
        local out = {}
        for _, job in ipairs(queue) do
            out[job.subsystem] = (out[job.subsystem] or 0) + 1
        end
        return out
    end
    function api.enqueue(key, subsystem, fn)
        if keys[key] or disabled[subsystem] or #queue >= api.maxJobs then return false end
        keys[key] = true
        queue[#queue + 1] = { key = key, subsystem = subsystem, step = fn }
        return true
    end
    function api.failed(subsystem, reason)
        failures[subsystem] = (failures[subsystem] or 0) + 1
        if failures[subsystem] == 1 then report(subsystem, tostring(reason), false) end
        if failures[subsystem] >= 3 and not disabled[subsystem] then
            disabled[subsystem] = true; report(subsystem, "disabled after 3 failures", true)
        end
    end
    function api.isDisabled(subsystem) return disabled[subsystem] == true end
    -- Keep only the queued jobs `keep(job)` accepts, releasing the others' keys.
    -- The runtime reopens its sessions without dropping a case being prepared.
    function api.retain(keep)
        local kept = {}
        for _, job in ipairs(queue) do
            if keep(job) then kept[#kept + 1] = job else keys[job.key] = nil end
        end
        queue = kept
    end
    function api.has(subsystem)
        for _, job in ipairs(queue) do if job.subsystem == subsystem then return true end end
        return false
    end
    -- Clear failure counts and disabled subsystems, as a fresh scheduler would.
    function api.forgive() failures, disabled = {}, {} end
    function api.step()
        local started, steps = clock(), 0
        while #queue > 0 and steps < api.maxSteps and clock() - started < api.budgetMs do
            local job = table.remove(queue, 1)
            if disabled[job.subsystem] then keys[job.key] = nil
            else
                local ok, done = pcall(job.step)
                steps = steps + 1
                counts[job.subsystem] = (counts[job.subsystem] or 0) + 1
                if not ok then
                    keys[job.key] = nil; api.failed(job.subsystem, done)
                elseif done then keys[job.key] = nil
                else queue[#queue + 1] = job end
            end
        end
        api.peakMs = math.max(api.peakMs, clock() - started)
        return steps
    end
    return api
end
return Scheduler
