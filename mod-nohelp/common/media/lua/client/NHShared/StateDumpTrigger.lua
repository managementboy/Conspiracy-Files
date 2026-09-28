-- Trigger for owner to invoke StateDump: context menu entry (C6).
-- Logs mod version and schema versions alongside the dump.
-- Single-player only (same gate as StateDump).
local M = {}

local StateDump = require("NHShared/StateDump")
local CFLog = require("NHShared/Log")

-- Gate: single-player only
local function allowed()
    return not (isClient and isClient()) and not (isServer and isServer())
        and not NHShared.T11Mode and not NHShared.T12Mode
end

-- Invoke dump and log versions (mod version + schema versions as numeric fields)
function M.trigger()
    if not allowed() then return end

    pcall(function()
        -- Get mod version (fallback to hardcoded value if not available at runtime)
        local modVersion = "0.1.0-dev"
        pcall(function()
            modVersion = tostring(getModVersion and getModVersion("ConspiracyFilesNoHelp") or "0.1.0-dev")
        end)

        -- Get schema versions from known data modules as numeric fields
        -- A version word only (digits, letters, dots, dashes); anything else is "?".
        if type(modVersion)~="string" or #modVersion>20 or not modVersion:match("^[%w%.%-]+$") then modVersion="?" end
        local logFields = { modVersion = modVersion }
        local schemaModules = {
            "MapMediaState", "PlaceVisits", "CasePerson", "SaveBudget"
        }
        for _, modName in ipairs(schemaModules) do
            pcall(function()
                local mod = require("NHShared/" .. modName)
                if mod and type(mod.SCHEMA)=="number" then
                    -- Store as field name like "schemaMapMediaState" with numeric value
                    local fieldName = "schema" .. modName
                    logFields[fieldName] = tostring(mod.SCHEMA)
                end
            end)
        end

        -- Log versions with each schema as its own field
        CFLog.write("i", "dump_trigger", logFields)

        -- Call the actual dump
        StateDump.run()
    end)
end

-- Register context menu handler via EngineEvents
-- Handler receives (context, worldObject) and adds options via context:addOption()
local function fillContextMenu(context, worldObject)
    if not allowed() then return end
    context:addOption("Dump State", worldObject, M.trigger)
end

pcall(function()
    local EngineEvents = require("NHShared/Events/EngineEvents")
    if EngineEvents and EngineEvents.on then
        EngineEvents.on("OnFillWorldObjectContextMenu", fillContextMenu)
    end
end)

NHShared = NHShared or {}
NHShared.StateDumpTrigger = M

return M
