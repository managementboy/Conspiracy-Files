local Presentation = require("ConspiracyFiles/Presentation")
local RegistrationGate = require("ConspiracyFiles/RegistrationGate")

local PresentationRuntime = {}

PresentationRuntime.BINDING_NAME = "Conspiracy-Files: Open notebook"

local OPTION_OWNER = {}
local INSPECT_ACTION = {}
local MARK_ACTION = {}

function PresentationRuntime.new(options)
    options = options or {}
    local port = assert(options.port, "presentation port is required")
    local persistenceProvider = assert(options.persistenceProvider, "persistence provider is required")
    local identityProvider = assert(options.identityProvider, "canonical identity gateway provider is required")
    local boundary = options.callBoundary or function(_, callback) return pcall(callback) end
    local labels = options.labels or {}
    local inspectLabel = labels.inspect or "Inspect"
    local markLabel = labels.markInteresting or "Mark Interesting"
    local ambiguousLabel = labels.ambiguous or "Inspect Conspiracy-Files item"
    local api = {}
    local started = false
    local registration = nil

    local function persistence()
        local value = persistenceProvider()
        if not value or type(value.isLoaded) ~= "function" or not value.isLoaded() then return nil end
        return value
    end

    local function safely(name, callback)
        return boundary("presentation-" .. name, callback)
    end

    local function optionByAction(context, action)
        if not context or type(context.options) ~= "table" then return nil end
        for index = 1, #context.options do
            local option = context.options[index]
            if option and option.cfOwner == OPTION_OWNER and option.cfAction == action then return option end
        end
        return nil
    end

    local function addOption(context, action, label, handler, playerNum, item)
        local existing = optionByAction(context, action)
        if existing then return existing, false end
        local option = port.addOption(context, label, handler, playerNum, item)
        if option then
            option.cfOwner = OPTION_OWNER
            option.cfAction = action
        end
        return option, option ~= nil
    end

    local function disable(option, message)
        if not option then return end
        option.notAvailable = true
        option.onSelect = nil
        option.toolTip = port.tooltip and port.tooltip(message) or nil
    end

    local function normalize(items)
        local result, seen = {}, {}
        for _, value in ipairs(items or {}) do
            if port.isInventoryItem(value) then
                if not seen[value] then result[#result + 1], seen[value] = value, true end
            elseif type(value) == "table" and type(value.items) == "table" then
                for index = 2, #value.items do
                    local item = value.items[index]
                    if port.isInventoryItem(item) and not seen[item] then result[#result + 1], seen[item] = item, true end
                end
            end
        end
        return result
    end

    local function marked(domain, assetId)
        for _, evidence in ipairs(domain.snapshot().evidence) do
            if evidence.kind == "marked-object" and evidence.assetId == assetId then return true end
        end
        return false
    end

    local function contextFor(subject, playerNum, owned)
        if port.captureContext then
            local value = port.captureContext(subject, playerNum, owned)
            if type(value) == "string" and value ~= "" and string.len(value) <= 500 then return value end
        end
        if owned then return "Inspected in the survivor's inventory." end
        return "Inspected in the Ground/loot inventory pane."
    end

    local function resolve(item)
        local identityGateway = identityProvider()
        if not identityGateway or type(identityGateway.resolvePresentation) ~= "function" then return nil end
        return identityGateway.resolvePresentation(item, port.isInventoryItem)
    end

    local function authorize(subject, action, playerNum)
        return {
            item = subject.item,
            assetId = subject.assetId,
            physicalToken = subject.physicalToken,
            carrierHasLegacy = subject.carrierHasLegacy == true,
            action = action,
            owned = port.isOwned(subject, playerNum) == true
        }
    end

    local function revalidate(authorization, expectedAction, playerNum, item)
        if type(authorization) ~= "table" or authorization.action ~= expectedAction
            or authorization.item ~= item then return nil end
        local identityGateway = identityProvider()
        if not identityGateway or type(identityGateway.revalidatePresentation) ~= "function" then return nil end
        local subject = identityGateway.revalidatePresentation(item, port.isInventoryItem, authorization)
        if not subject then return nil end
        if (port.isOwned(subject, playerNum) == true) ~= authorization.owned then return nil end
        return subject
    end

    local function activateInspect(_, playerNum, item, authorization)
        safely("inspect-activation", function()
            local adapter = persistence()
            if not adapter then return end
            local subject = revalidate(authorization, INSPECT_ACTION, playerNum, item)
            if not subject then return end
            local owned = port.isOwned(subject, playerNum)
            if subject.assetKind == "document" then
                local ok, detail = adapter.transaction(function(domain)
                    local accepted, result, changed = domain.discover(subject.assetId,
                        contextFor(subject, playerNum, owned), nil)
                    if not accepted then error(result) end
                    return changed, result
                end)
                if not ok then error(detail) end
            end
            local projection, message = Presentation.reader(subject)
            if not projection then error(message) end
            port.openReader(projection)
        end)
    end

    local function activateMark(_, playerNum, item, authorization)
        safely("mark-activation", function()
            local adapter = persistence()
            if not adapter then return end
            local subject = revalidate(authorization, MARK_ACTION, playerNum, item)
            if not subject or subject.assetKind ~= "ordinary-object" then return end
            if not port.isOwned(subject, playerNum) then return end
            if marked(adapter.domain(), subject.assetId) then return end
            local intentId = "item:" .. subject.physicalToken
            local ok, detail = adapter.transaction(function(domain)
                local accepted, result, changed = domain.markInteresting(intentId, {
                    assetId = subject.assetId,
                    contextText = contextFor(subject, playerNum, true)
                })
                if not accepted then error(result) end
                return changed, result
            end)
            if not ok then error(detail) end
        end)
    end

    function api.fillInventoryContextMenu(playerNum, context, items)
        safely("inventory-menu", function()
            local adapter = persistence()
            if not adapter then return end
            local valid = {}
            for _, item in ipairs(normalize(items)) do
                local subject = resolve(item)
                if subject then valid[#valid + 1] = subject end
            end
            if #valid == 0 then return end
            if #valid > 1 then
                local option = addOption(context, INSPECT_ACTION, ambiguousLabel, nil, playerNum, nil)
                disable(option, labels.selectOne or "Select one Conspiracy-Files item at a time.")
                return
            end
            local subject = valid[1]
            local inspectAuthorization = authorize(subject, INSPECT_ACTION, playerNum)
            addOption(context, INSPECT_ACTION, inspectLabel, function(_, selectedPlayer, selectedItem)
                return activateInspect(nil, selectedPlayer, selectedItem, inspectAuthorization)
            end, playerNum, subject.item)
            if subject.assetKind == "ordinary-object" then
                local markAuthorization = authorize(subject, MARK_ACTION, playerNum)
                local option = addOption(context, MARK_ACTION, markLabel, function(_, selectedPlayer, selectedItem)
                    return activateMark(nil, selectedPlayer, selectedItem, markAuthorization)
                end, playerNum, subject.item)
                if not port.isOwned(subject, playerNum) then
                    disable(option, labels.takeBeforeMarking or "Take this item before marking it interesting.")
                elseif marked(adapter.domain(), subject.assetId) then
                    disable(option, labels.alreadyMarked or "Already marked interesting.")
                end
            end
        end)
    end

    function api.openNotebook()
        safely("notebook-open", function()
            local adapter = persistence()
            if not adapter then return end
            port.openNotebook(Presentation.notebook(adapter.domain()))
        end)
    end

    function api.keyPressed(key)
        safely("notebook-key", function()
            local configured = port.configuredKey(PresentationRuntime.BINDING_NAME)
            if configured and configured ~= 0 and key == configured then api.openNotebook() end
        end)
    end

    function api.start()
        if started then return false end
        local gate = RegistrationGate.new()
        local candidate = {
            gate = gate,
            events = {
                { name = "OnFillInventoryObjectContextMenu", callback = gate.wrap(api.fillInventoryContextMenu) },
                { name = "OnKeyPressed", callback = gate.wrap(api.keyPressed) }
            }
        }
        local ok, message = pcall(function()
            port.ensureKeyBinding(PresentationRuntime.BINDING_NAME)
            for _, entry in ipairs(candidate.events) do port.replaceEvent(entry.name, entry.callback) end
        end)
        if not ok then
            gate.invalidate()
            for index = #candidate.events, 1, -1 do
                local entry = candidate.events[index]
                pcall(port.removeEvent, entry.name, entry.callback)
            end
            error(message)
        end
        assert(gate.commit(), "presentation registration generation could not commit")
        registration = candidate
        started = true
        return true
    end

    function api.stop()
        if not started then return false end
        local active = registration
        active.gate.invalidate()
        local firstError = nil
        for index = #active.events, 1, -1 do
            local entry = active.events[index]
            local ok, message = pcall(port.removeEvent, entry.name, entry.callback)
            if not ok and not firstError then firstError = message end
        end
        registration = nil
        started = false
        if firstError then error(firstError) end
        return true
    end

    function api.isStarted() return started end
    function api.normalizeInventorySubjects(items) return normalize(items) end
    function api.optionIsOwned(option) return option and option.cfOwner == OPTION_OWNER end

    return api
end

return PresentationRuntime
