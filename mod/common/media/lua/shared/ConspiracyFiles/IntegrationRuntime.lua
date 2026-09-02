local Bootstrap = require("ConspiracyFiles/Bootstrap")
local ErrorBudget = require("ConspiracyFiles/ErrorBudget")
local LifecycleAdapter = require("ConspiracyFiles/LifecycleAdapter")
local PersistenceAdapter = require("ConspiracyFiles/PersistenceAdapter")
local Scheduler = require("ConspiracyFiles/Scheduler")
local WorldRuntime = require("ConspiracyFiles/WorldRuntime")

local IntegrationRuntime = {}

function IntegrationRuntime.start(environment)
    assert(type(environment) == "table", "integration environment is required")
    local decision = Bootstrap.decide(environment.isMultiplayer, environment.runtimeVersion)
    if not decision.enabled then
        if environment.report then environment.report("Conspiracy-Files disabled: " .. decision.reason) end
        return {
            enabled = false,
            reason = decision.reason,
            decision = decision,
            registeredEvents = {}
        }
    end

    local errors = ErrorBudget.new({ threshold = 3, report = environment.report })
    local persistence = PersistenceAdapter.new({ storage = environment.storage, report = environment.report })
    local lifecycle = LifecycleAdapter.new({ persistence = persistence })
    local scheduler = Scheduler.new({
        clock = environment.clock,
        maxWorkPerDrain = 24,
        maxQueued = 256,
        maxMillis = 1,
        execute = function(subsystem, work)
            errors.call(subsystem, work)
        end
    })
    local worldRuntime = nil
    if environment.world and environment.itemPort then
        worldRuntime = WorldRuntime.new({ persistence = persistence, scheduler = scheduler, world = environment.world, itemPort = environment.itemPort })
    end
    local phase = "registered"
    local callbacks = {}
    local registeredEvents = {}

    callbacks.OnInitGlobalModData = function(isNewGame)
        errors.call("persistence", function()
            local ok = persistence.load(isNewGame)
            if not ok then
                phase = "disabled-incompatible-state"
                return
            end
            phase = "canonical-ready"
        end)
    end

    callbacks.OnGameStart = function()
        errors.call("lifecycle", function()
            if phase == "disabled-incompatible-state" then return end
            if not persistence.isLoaded() then error("canonical state was not initialized") end
            if worldRuntime then worldRuntime.start() end
            phase = "running"
        end)
    end

    callbacks.LoadGridsquare = function(square)
        if worldRuntime then errors.call("placement-wakeup", function() worldRuntime.onLoadGridSquare(square) end) end
    end

    local function checkpoint(reason)
        errors.call("lifecycle-checkpoint", function()
            local ok, message = lifecycle.checkpoint(reason)
            if not ok then error(message) end
        end)
    end

    callbacks.OnSave = function() checkpoint("save") end
    callbacks.OnPlayerDeath = function() checkpoint("death") end

    callbacks.OnTick = function()
        if phase ~= "running" then return end
        errors.call("scheduler", function()
            if worldRuntime then worldRuntime.onTick() end
            scheduler.drain()
        end)
    end

    local function registerAll()
        for _, eventName in ipairs({ "OnInitGlobalModData", "OnGameStart", "LoadGridsquare", "OnSave", "OnPlayerDeath", "OnTick" }) do
            environment.addEvent(eventName, callbacks[eventName])
            registeredEvents[#registeredEvents + 1] = eventName
        end
    end

    local registered, registrationError = errors.call("lifecycle-registration", registerAll)
    if not registered then
        return {
            enabled = false,
            reason = "event-registration-failed",
            errorBudget = errors,
            registeredEvents = registeredEvents,
            diagnostic = tostring(registrationError)
        }
    end

    return {
        enabled = true,
        reason = decision.reason,
        callbacks = callbacks,
        errorBudget = errors,
        persistence = persistence,
        lifecycle = lifecycle,
        scheduler = scheduler,
        worldRuntime = worldRuntime,
        registeredEvents = registeredEvents,
        phase = function() return phase end
    }
end

return IntegrationRuntime
