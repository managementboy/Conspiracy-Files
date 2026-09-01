local Copy = require("ConspiracyFiles.Copy")
local ThreadState = require("ConspiracyFiles.ThreadState")
local Validator = require("ConspiracyFiles.Validator")

local PersistenceAdapter = {}
PersistenceAdapter.DEFAULT_TAG = "ConspiracyFiles.v0_1"

function PersistenceAdapter.new(options)
    options = options or {}
    local storage = assert(options.storage, "persistence storage is required")
    assert(type(storage.get) == "function", "persistence storage.get is required")
    assert(type(storage.replace) == "function", "persistence storage.replace is required")
    local tag = options.tag or PersistenceAdapter.DEFAULT_TAG
    local domain, lastKnownGood = nil, nil
    local api = {}

    local function validateAndCopy(candidate)
        local ok, message, estimated = Validator.validate(candidate)
        if not ok then return nil, message end
        local staged = Copy.deep(candidate)
        ok, message, estimated = Validator.validate(staged)
        if not ok then return nil, message end
        return staged, nil, estimated
    end

    local function reconstruct(candidate)
        local rebuilt, message = ThreadState.new(candidate)
        if not rebuilt then return nil, message end
        -- Force representative derived projections to resolve while the staged
        -- root is still private. These are rebuilt, never persisted.
        rebuilt.renderJournal()
        rebuilt.leads()
        return rebuilt
    end

    function api.load(isNewGame)
        -- A Lua process may outlive one world/session. Never let a failed new
        -- load fall back to the previous session's otherwise-valid domain.
        domain = nil
        lastKnownGood = nil
        local persisted = storage.get(tag)
        local candidate = persisted
        if candidate == nil then
            local fresh, message = ThreadState.new()
            if not fresh then return false, message end
            candidate = fresh.snapshot()
        end

        local staged, message, estimated = validateAndCopy(candidate)
        if not staged then return false, message end
        local rebuilt
        rebuilt, message = reconstruct(staged)
        if not rebuilt then return false, message end

        if persisted == nil then storage.replace(tag, staged) end
        domain = rebuilt
        lastKnownGood = Copy.deep(staged)
        return true, { isNewGame = isNewGame == true, created = persisted == nil, estimatedBytes = estimated }
    end

    function api.commit(candidate)
        if not domain or not lastKnownGood then return false, "persistence adapter is not loaded" end
        local staged, message, estimated = validateAndCopy(candidate)
        if not staged then return false, message end

        local monotonic, monotonicMessage = ThreadState.new(lastKnownGood)
        if not monotonic then return false, monotonicMessage end
        local ok
        ok, message = monotonic.replace(staged)
        if not ok then return false, message end

        local rebuilt
        rebuilt, message = reconstruct(staged)
        if not rebuilt then return false, message end
        storage.replace(tag, staged)
        domain = rebuilt
        lastKnownGood = Copy.deep(staged)
        return true, { estimatedBytes = estimated }
    end

    -- Lifecycle hooks never publish a live domain object or a caller-owned
    -- snapshot. Re-stage the adapter's private last-known-good root so a save
    -- or death boundary can only expose a complete P4-R32-valid replacement.
    function api.checkpoint()
        if not domain or not lastKnownGood then return false, "persistence adapter is not loaded" end
        local staged, message, estimated = validateAndCopy(lastKnownGood)
        if not staged then return false, message end

        storage.replace(tag, staged)
        lastKnownGood = Copy.deep(staged)
        return true, { estimatedBytes = estimated }
    end

    function api.transaction(mutator)
        if type(mutator) ~= "function" then return false, "mutator must be a function" end
        if not lastKnownGood then return false, "persistence adapter is not loaded" end
        local candidate, message = ThreadState.new(lastKnownGood)
        if not candidate then return false, message end
        local changed, result = mutator(candidate)
        if changed == false then return true, result, false end
        local ok, detail = api.commit(candidate.snapshot())
        if not ok then return false, detail, false end
        return true, result, true
    end

    function api.snapshot()
        if not lastKnownGood then return nil end
        return Copy.deep(lastKnownGood)
    end

    function api.domain()
        return domain
    end

    function api.isLoaded()
        return domain ~= nil
    end

    function api.tag()
        return tag
    end

    return api
end

return PersistenceAdapter
