local ErrorBudget = {}

local function concise(value)
    local text = tostring(value or "unknown error")
    text = string.gsub(text, "[%c]+", " ")
    if string.len(text) > 180 then text = string.sub(text, 1, 177) .. "..." end
    return text
end

function ErrorBudget.new(options)
    options = options or {}
    local threshold = options.threshold or 3
    local report = options.report or function() end
    assert(type(threshold) == "number" and threshold >= 1 and threshold == math.floor(threshold), "error threshold must be a positive integer")
    local states = {}
    local api = {}

    local function stateFor(subsystem)
        local state = states[subsystem]
        if not state then
            state = { consecutiveFailures = 0, totalFailures = 0, disabled = false, reported = false }
            states[subsystem] = state
        end
        return state
    end

    function api.call(subsystem, callback, ...)
        assert(type(subsystem) == "string" and subsystem ~= "", "subsystem must be non-empty")
        assert(type(callback) == "function", "callback must be a function")
        local state = stateFor(subsystem)
        if state.disabled then return false, "subsystem-disabled" end

        local outcome = { pcall(callback, ...) }
        if outcome[1] then
            state.consecutiveFailures = 0
            return true, unpack(outcome, 2)
        end

        state.consecutiveFailures = state.consecutiveFailures + 1
        state.totalFailures = state.totalFailures + 1
        state.lastError = concise(outcome[2])
        if state.consecutiveFailures >= threshold then state.disabled = true end
        if not state.reported then
            state.reported = true
            pcall(report, "Conspiracy-Files: " .. subsystem .. " failed; repeated failures disable this subsystem ("
                .. state.consecutiveFailures .. "/" .. threshold .. "): " .. state.lastError)
        end
        return false, outcome[2]
    end

    function api.status(subsystem)
        local state = stateFor(subsystem)
        return {
            consecutiveFailures = state.consecutiveFailures,
            totalFailures = state.totalFailures,
            disabled = state.disabled,
            reported = state.reported,
            lastError = state.lastError
        }
    end

    return api
end

return ErrorBudget
