local Bootstrap = require("ConspiracyFiles/Bootstrap")
local ErrorBudget = require("ConspiracyFiles/ErrorBudget")
local LifecycleAdapter = require("ConspiracyFiles/LifecycleAdapter")
local PersistenceAdapter = require("ConspiracyFiles/PersistenceAdapter")
local Scheduler = require("ConspiracyFiles/Scheduler")
local WorldRuntime = require("ConspiracyFiles/WorldRuntime")

local IntegrationRuntime = {}

function IntegrationRuntime.start(environment)
    assert(type(environment) == "table", "integration environment is required")
    local decision = Bootstrap.decide(environment.isMultiplayer)
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
    local persistence = PersistenceAdapter.new({ storage = environment.storage })
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
    local worldRuntime = WorldRuntime.new({
        persistence = persistence,
        scheduler = scheduler,
        world = assert(environment.world, "world port is required"),
        itemPort = assert(environment.itemPort, "item port is required")
    })
    local phase = "registered"
    local callbacks = {}
    local registeredEvents = {}

    callbacks.OnInitGlobalModData = function(isNewGame)
        phase = "loading-canonical"
        local loaded = errors.call("persistence", function()
            local ok, message = persistence.load(isNewGame)
            if not ok then error(message) end
            phase = "canonical-ready"
        end)
        if not loaded then phase = "canonical-unavailable" end
    end

    callbacks.OnGameStart = function()
        errors.call("lifecycle", function()
            if not persistence.isLoaded() then error("canonical state was not initialized") end
            worldRuntime.start()
            phase = "running"
        end)
    end

    callbacks.LoadGridsquare = function(square)
        errors.call("placement-wakeup", function()
            worldRuntime.onLoadGridSquare(square)
        end)
    end

    local function checkpoint(reason)
        errors.call("lifecycle-checkpoint", function()
            local ok, message = lifecycle.checkpoint(reason)
            if not ok then error(message) end
            if reason == "death" and persistence.isLoaded() then phase = "death-observed" end
        end)
    end

    callbacks.OnSave = function()
        checkpoint("save")
    end

    callbacks.OnPlayerDeath = function()
        checkpoint("death")
    end

    callbacks.OnTick = function()
        errors.call("scheduler", function()
            if phase == "running" then
                worldRuntime.onTick()
                scheduler.drain()
            end
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
