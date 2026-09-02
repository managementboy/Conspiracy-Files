local PhysicalIdentity = {}

function PhysicalIdentity.new(options)
    options = options or {}
    local persistence = assert(options.persistence, "persistence adapter is required")
    local api = {}

    local function commit(assetId, availability)
        local ok, result = persistence.transaction(function(state)
            return state.reconcilePhysical(assetId, availability)
        end)
        if not ok then error(result) end
        return result
    end

    function api.observe(assetId, observation)
        observation = observation or {}
        local snapshot = persistence.snapshot()
        local placement = snapshot and snapshot.assetMaterialisation[assetId] or nil
        if not placement then return false, "materialisation is not prepared" end
        if placement == "conflict" then return true, "conflict" end
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
            if placement ~= "placed" then return false, "observed identity requires placed materialisation" end
            commit(assetId, "available")
            return true, "available"
        end
        if observation.lossConfirmed == true or observation.coverage == "complete" then
            commit(assetId, "unavailable")
            return true, "unavailable"
        end
        commit(assetId, "unknown")
        return true, "unknown"
    end

    return api
end

return PhysicalIdentity
