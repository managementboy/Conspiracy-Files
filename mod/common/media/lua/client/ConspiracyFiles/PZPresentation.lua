require "ISUI/ISInventoryPaneContextMenu"

local PresentationRuntime = require("ConspiracyFiles/PresentationRuntime")
local PZWindows = require("ConspiracyFiles/PZWindows")

local PZPresentation = {}

local function translated(key, fallback)
    local ok, value = pcall(getText, key)
    if ok and type(value) == "string" and value ~= "" and value ~= key then return value end
    return fallback
end

local function isInventoryItem(value)
    if value == nil or type(instanceof) ~= "function" then return false end
    local ok, result = pcall(instanceof, value, "InventoryItem")
    return ok and result == true
end

function PZPresentation.new(options)
    options = options or {}
    local namespace = assert(options.namespace, "ConspiracyFiles namespace is required")
    local windowLabels = {
        journalEmptyTitle = translated("UI_CF_NotebookEmptyJournalTitle", "No entries yet"),
        journalEmptyBody = translated("UI_CF_NotebookEmptyJournalBody", "The pages are blank. Survival has been noisy enough without invented answers."),
        chronologyHeading = translated("UI_CF_NotebookChronology", "Chronology"),
        evidenceHeading = translated("UI_CF_NotebookEvidence", "Evidence"),
        evidenceEmptyBody = translated("UI_CF_NotebookEmptyEvidenceBody", "Nothing recorded yet. Suspicion is not evidence until I choose to keep it."),
        majorMarker = translated("UI_CF_NotebookMajorMarker", "[!] "),
        markedMarker = translated("UI_CF_NotebookMarkedMarker", "[marked] "),
        journalTab = translated("UI_CF_NotebookJournalTab", "Journal"),
        evidenceTab = translated("UI_CF_NotebookEvidenceTab", "Evidence"),
        helpTab = translated("UI_CF_NotebookHelpTab", "Help"),
        notebookSuffix = translated("UI_CF_NotebookTitleSuffix", "survivor notebook")
    }
    local windows = namespace._presentationWindows or PZWindows.new({ labels = windowLabels })
    namespace._presentationWindows = windows
    namespace._presentationCallbacks = namespace._presentationCallbacks or {}

    local function eventFor(name)
        local event = Events and Events[name]
        if not event or type(event.Add) ~= "function" or type(event.Remove) ~= "function" then
            error("PZ presentation event unavailable: " .. tostring(name))
        end
        return event
    end

    local port = {}

    port.isInventoryItem = isInventoryItem

    function port.isOwned(subject, playerNum)
        local player = getSpecificPlayer(playerNum)
        if not player or not subject or not subject.item then return false end
        local ok, outer = pcall(function() return subject.item:getOutermostContainer() end)
        return ok and outer ~= nil and outer == player:getInventory()
    end

    function port.captureContext(_, playerNum, owned)
        local player = getSpecificPlayer(playerNum)
        if not player then return nil end
        if owned then return "Inspected while carried in the survivor's inventory." end
        return "Inspected from the Ground/loot inventory pane at the time of inspection."
    end

    function port.addOption(context, label, callback, playerNum, item)
        return context:addOption(label, nil, callback, playerNum, item)
    end

    function port.tooltip(message)
        local ok, tooltip = pcall(ISInventoryPaneContextMenu.addToolTip)
        if not ok or not tooltip then return nil end
        tooltip.description = message
        return tooltip
    end

    function port.openReader(projection) windows.openReader(projection) end
    function port.openNotebook(projection) windows.openNotebook(projection) end

    function port.configuredKey(bindingName)
        return getCore():getKey(bindingName)
    end

    function port.ensureKeyBinding(bindingName)
        if type(keyBinding) ~= "table" then error("PZ keyBinding table is unavailable") end
        local headerName = "[Conspiracy-Files]"
        local found, header = nil, nil
        for index = #keyBinding, 1, -1 do
            local binding = keyBinding[index]
            if binding and binding.value == bindingName then
                if found then table.remove(keyBinding, index) else found = binding end
            elseif binding and binding.value == headerName then
                if header then table.remove(keyBinding, index) else header = binding end
            end
        end
        if not header then
            local foundIndex = nil
            if found then
                for index, binding in ipairs(keyBinding) do if binding == found then foundIndex = index; break end end
            end
            if foundIndex then table.insert(keyBinding, foundIndex, { value = headerName })
            else table.insert(keyBinding, { value = headerName }) end
        end
        if not found then
            table.insert(keyBinding, { value = bindingName, key = Keyboard.KEY_N })
        end
    end

    function port.replaceEvent(name, callback)
        local event = eventFor(name)
        local previous = namespace._presentationCallbacks[name]
        if previous then event.Remove(previous) end
        namespace._presentationCallbacks[name] = callback
        event.Add(callback)
    end

    function port.removeEvent(name, callback)
        local event = eventFor(name)
        if namespace._presentationCallbacks[name] == callback then
            event.Remove(callback)
            namespace._presentationCallbacks[name] = nil
        end
    end

    local function persistenceProvider()
        local runtime = namespace.runtime
        if not runtime or runtime.enabled ~= true then return nil end
        return runtime.persistence
    end

    local function callBoundary(subsystem, callback)
        local runtime = namespace.runtime
        if runtime and runtime.errorBudget then return runtime.errorBudget.call(subsystem, callback) end
        return pcall(callback)
    end

    return PresentationRuntime.new({
        port = port,
        persistenceProvider = persistenceProvider,
        callBoundary = callBoundary,
        labels = {
            inspect = translated("UI_CF_Inspect", "Inspect"),
            markInteresting = translated("UI_CF_MarkInteresting", "Mark Interesting"),
            ambiguous = translated("UI_CF_InspectAmbiguous", "Inspect Conspiracy-Files item"),
            selectOne = translated("UI_CF_SelectOne", "Select one Conspiracy-Files item at a time."),
            takeBeforeMarking = translated("UI_CF_TakeBeforeMarking", "Take this item before marking it interesting."),
            alreadyMarked = translated("UI_CF_AlreadyMarked", "Already marked interesting.")
        }
    })
end

return PZPresentation
