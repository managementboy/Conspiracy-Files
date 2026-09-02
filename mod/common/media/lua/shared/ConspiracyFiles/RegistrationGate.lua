local RegistrationGate = {}

function RegistrationGate.new(options)
    options = options or {}
    local isCurrent = options.isCurrent or function() return true end
    local valid = true
    local committed = false
    local api = {}

    function api.isActive()
        return valid and committed and isCurrent() == true
    end

    function api.wrap(callback)
        assert(type(callback) == "function", "registration callback is required")
        return function(...)
            if not api.isActive() then return end
            return callback(...)
        end
    end

    function api.commit()
        if not valid then return false end
        committed = true
        return true
    end

    function api.invalidate()
        valid = false
        committed = false
    end

    function api.status()
        return { valid = valid, committed = committed, active = api.isActive() }
    end

    return api
end

return RegistrationGate
