-- Plain-Lua transaction boundary. The engine adapter owns only the final sink.
local Content = require("ConspiracyFiles/Content")
local State = require("ConspiracyFiles/ThreadState")
local Placement = require("ConspiracyFiles/Placement")
local Validator = require("ConspiracyFiles/Validator")
local Session = {}
local function copy(value)
    if type(value) ~= "table" then return value end
    local out = {}; for key, child in pairs(value) do out[key] = copy(child) end; return out
end
function Session.validate(root)
    local ok, why = Validator.validateStructure(root)
    if not ok then return false, why end
    if type(root) ~= "table" or root.schemaVersion ~= 2 then return false, "unsupported session schema; use a fresh disposable save" end
    for key in pairs(root) do
        if key ~= "schemaVersion" and key ~= "domain" and key ~= "placement" then return false, "unknown session field" end
    end
    ok, why = Validator.validate(root.domain); if not ok then return false, why end
    ok, why = Placement.validate(root.placement); if not ok then return false, why end
    for id, assignment in pairs(root.placement.assignments) do
        if assignment.status == "placed" and root.domain.assetMaterialisation[id] ~= "materialised" then
            return false, "placed item lacks domain materialisation"
        end
    end
    local bytes = Validator.estimateEncodedBytes(root)
    if bytes > Validator.MAX_ENCODED_BYTES then return false, "combined canonical budget exceeded" end
    return true, bytes
end
function Session.new(initial, seed, sink)
    local fresh = initial == nil
    local candidate = initial or { schemaVersion = 2, domain = assert(State.new()).snapshot(), placement = Placement.newPlan(seed) }
    local ok, why = Session.validate(candidate); if not ok then return nil, why end
    local root = copy(candidate)
    local state = assert(State.new(root.domain))
    local api = {}
    local function commit(mutator)
        local staged = copy(root)
        local domain = assert(State.new(staged.domain))
        local changed, result = mutator(staged, domain)
        if not changed then return true, result, false end
        staged.domain = domain.snapshot()
        local valid, message = Session.validate(staged)
        if not valid then return false, message, false end
        -- The sink must perform one wrapper.canonical assignment, with no work
        -- after the swap that could fail. Never expose staged/root to callers.
        local persisted, err = pcall(sink, copy(staged))
        if not persisted then return false, tostring(err), false end
        root, state = staged, domain
        return true, result, true
    end
    function api.snapshot() return copy(root) end
    function api.assignment(id) return copy(root.placement.assignments[id]) end
    api.view = {
        snapshot = function() return state.snapshot() end,
        renderJournal = function() return state.renderJournal() end,
        resolveEvidence = function(id) return state.resolveEvidence(id) end,
        organisationLabel = function(id) return state.organisationLabel(id) end,
        locationLabel = function(id) return state.locationLabel(id) end,
        leads = function() return state.leads() end
    }
    function api.command(name, ...)
        if name ~= "discover" and name ~= "markInteresting" and name ~= "confirmLocation" then return false, "unsupported command" end
        local args = { ... }
        return commit(function(staged, domain)
            local success, result, changed = domain[name](args[1], args[2], args[3])
            if not success then error(result) end
            if name == "discover" and (args[1] == Content.ids.d1 or args[1] == Content.ids.d2)
                and staged.domain.entryOpportunityUsed == nil then
                local selected, _, selectedChanged = domain.useEntryOpportunity(args[1] == Content.ids.d1 and "anchor" or "fallback")
                assert(selected); changed = changed or selectedChanged
            end
            return changed, result
        end)
    end
    function api.bind(id, target)
        return commit(function(staged)
            local a = assert(staged.placement.assignments[id])
            if a.target or a.status ~= "pending" then return false end
            a.target = copy(target); return true
        end)
    end
    function api.intent(id)
        return commit(function(staged)
            local a = assert(staged.placement.assignments[id])
            if a.status ~= "pending" then return false end
            assert(a.target, "placement requires an exact stored target")
            a.status = "placing"; return true
        end)
    end
    function api.placed(id, count)
        if count ~= 1 then return false, "placed requires observed count one" end
        return commit(function(staged, domain)
            local a = assert(staged.placement.assignments[id])
            if a.status == "conflict" or a.status == "unavailable" then return false end
            if a.status == "placed" then return false end
            a.status, a.availability = "placed", "available"
            assert(domain.materialise(id)); return true
        end)
    end
    function api.observe(id, count, completeDestruction)
        return commit(function(staged, domain)
            local a = assert(staged.placement.assignments[id])
            if a.availability == "conflict" then return false end
            local available = count > 1 and "conflict" or count == 1 and "available"
                or completeDestruction == true and "unavailable" or "unknown"
            if a.availability == available then return false end
            a.availability = available
            if count > 1 then a.status = "conflict" end
            if available == "unavailable" then
                if a.status ~= "placed" then a.status = "unavailable" end
                local known = false
                for _, e in ipairs(staged.domain.evidence) do if e.assetId == id then known = true end end
                if id == Content.ids.d1 and not known and staged.domain.entryOpportunityUsed == nil then
                    assert(domain.useEntryOpportunity("fallback"))
                end
            end
            return true
        end)
    end
    if fresh then
        local persisted, err = pcall(sink, copy(root))
        if not persisted then return nil, tostring(err) end
    end
    return api
end
return Session
