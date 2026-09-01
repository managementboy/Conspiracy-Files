local PhysicalIdentity = {}

function PhysicalIdentity.new(options)
    options = options or {}
    local persistence = assert(options.persistence, "persistence adapter is required")
    local api = {}

    local function commit(assetId, availability, location)
        local ok, result = persistence.transaction(function(state)
            return state.reconcilePhysical(assetId, availability, location)
        end)
        if not ok then error(result) end
        return result
    end

    function api.observe(assetId, observation)
        observation = observation or {}
        local snapshot = persistence.snapshot()
        local record = snapshot and snapshot.assetMaterialisation[assetId] or nil
        if not record then return false, "materialisation is not prepared" end
        if record.identityConflictObserved then return true, "conflict" end
        if record.physicalItemId == nil then
            commit(assetId, "untracked", nil)
            return true, "untracked"
        end
        local matches = observation.matches or {}
        local distinct, seen = {}, {}
        for _, match in ipairs(matches) do
            local identity = match.item or match
            if not seen[identity] then
                seen[identity] = true
                distinct[#distinct + 1] = match
            end
        end
        if #distinct > 1 then
            commit(assetId, "conflict", nil)
            return true, "conflict"
        end
        if #distinct == 1 then
            if record.state ~= "placed" then return false, "observed identity requires placed materialisation" end
            commit(assetId, "available", distinct[1].location)
            return true, "available"
        end
        if observation.lossConfirmed == true or observation.coverage == "complete" then
            commit(assetId, "unavailable", nil)
            return true, "unavailable"
        end
        commit(assetId, "unknown", nil)
        return true, "unknown"
    end

    return api
end

return PhysicalIdentity
