local Scheduler = {}

local function positiveNumber(value, fallback)
    if type(value) == "number" and value > 0 then return value end
    return fallback
end

function Scheduler.new(options)
    options = options or {}
    local clock = assert(options.clock, "scheduler clock is required")
    local execute = options.execute or function(_, work) return work() end
    local maxWorkPerDrain = math.floor(positiveNumber(options.maxWorkPerDrain, 24))
    local maxQueued = math.floor(positiveNumber(options.maxQueued, 256))
    local maxMillis = positiveNumber(options.maxMillis, 1)
    local queue, pending = {}, {}
    local head, tail = 1, 0
    local api = {}

    local function size()
        if tail < head then return 0 end
        return tail - head + 1
    end

    local function resetIfEmpty()
        if head > tail then
            queue = {}
            head, tail = 1, 0
        end
    end

    function api.enqueue(key, subsystem, work)
        if type(key) ~= "string" or key == "" then return false, "work key must be non-empty" end
        if type(subsystem) ~= "string" or subsystem == "" then return false, "subsystem must be non-empty" end
        if type(work) ~= "function" then return false, "work must be a function" end
        if pending[key] then return false, "duplicate" end
        if size() >= maxQueued then return false, "queue-full" end
        tail = tail + 1
        queue[tail] = { key = key, subsystem = subsystem, work = work }
        pending[key] = true
        return true
    end

    function api.drain()
        local started = clock()
        local processed = 0
        while head <= tail and processed < maxWorkPerDrain do
            if processed > 0 and (clock() - started) >= maxMillis then break end
            local task = queue[head]
            queue[head] = nil
            head = head + 1
            pending[task.key] = nil
            execute(task.subsystem, task.work, task.key)
            processed = processed + 1
        end
        resetIfEmpty()
        return {
            processed = processed,
            remaining = size(),
            elapsedMillis = clock() - started
        }
    end

    function api.size()
        return size()
    end

    function api.contains(key)
        return pending[key] == true
    end

    function api.limits()
        return { maxWorkPerDrain = maxWorkPerDrain, maxQueued = maxQueued, maxMillis = maxMillis }
    end

    return api
end

return Scheduler
