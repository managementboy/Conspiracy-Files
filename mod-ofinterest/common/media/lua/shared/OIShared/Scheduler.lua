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
    -- maxJobs is a cap PER JOB CLASS (subsystem), not for the whole queue.
    -- One shared cap let a class with one job per document fill every slot
    -- at 32 documents, and every other class queued after it in the same
    -- tick was refused (first visible playtest, 2026-09-27): no area was
    -- decided and nothing was filled. Per class, no class can starve another
    -- at any document count; every class is keyed, so the queue stays small.
    local api = { maxSteps = 48, budgetMs = 2, maxJobs = 32, peakMs = 0 }
    local held = {}
    local function hold(subsystem, n) held[subsystem] = (held[subsystem] or 0) + n end
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
        if keys[key] or disabled[subsystem] or (held[subsystem] or 0) >= api.maxJobs then return false end
        keys[key] = true; hold(subsystem, 1)
        queue[#queue + 1] = { key = key, subsystem = subsystem, step = fn }
        return true
    end
    -- True when this job class holds all the jobs it may.
    function api.full(subsystem) return (held[subsystem] or 0) >= api.maxJobs end
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
            if keep(job) then kept[#kept + 1] = job else keys[job.key] = nil; hold(job.subsystem, -1) end
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
            if disabled[job.subsystem] then keys[job.key] = nil; hold(job.subsystem, -1)
            else
                local ok, done = pcall(job.step)
                steps = steps + 1
                counts[job.subsystem] = (counts[job.subsystem] or 0) + 1
                if not ok then
                    keys[job.key] = nil; hold(job.subsystem, -1); api.failed(job.subsystem, done)
                elseif done then keys[job.key] = nil; hold(job.subsystem, -1)
                else queue[#queue + 1] = job end
            end
        end
        api.peakMs = math.max(api.peakMs, clock() - started)
        return steps
    end
    return api
end
return Scheduler
