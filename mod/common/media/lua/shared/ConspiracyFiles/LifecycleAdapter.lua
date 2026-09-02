local LifecycleAdapter = {}

function LifecycleAdapter.new(options)
    options = options or {}
    local persistence = assert(options.persistence, "lifecycle persistence adapter is required")
    local checkpointCount = 0
    local lastCheckpointReason = nil
    local api = {}

    function api.checkpoint(reason)
        if reason ~= "save" and reason ~= "death" then
            return false, "unsupported lifecycle checkpoint"
        end
        if not persistence.isLoaded() then
            return true, { reason = reason, skipped = "canonical-not-ready" }
        end

        local ok, detail = persistence.checkpoint()
        if not ok then return false, detail end
        checkpointCount = checkpointCount + 1
        lastCheckpointReason = reason
        return true, {
            reason = reason,
            checkpointCount = checkpointCount,
            estimatedBytes = detail.estimatedBytes
        }
    end

    function api.status()
        return {
            checkpointCount = checkpointCount,
            lastCheckpointReason = lastCheckpointReason
        }
    end

    return api
end

return LifecycleAdapter
