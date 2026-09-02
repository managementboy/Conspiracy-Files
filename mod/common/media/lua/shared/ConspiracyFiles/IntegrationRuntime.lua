local Bootstrap = require("ConspiracyFiles/Bootstrap")
local ErrorBudget = require("ConspiracyFiles/ErrorBudget")
local LifecycleAdapter = require("ConspiracyFiles/LifecycleAdapter")
local PersistenceAdapter = require("ConspiracyFiles/PersistenceAdapter")
local RegistrationGate = require("ConspiracyFiles/RegistrationGate")
local Scheduler = require("ConspiracyFiles/Scheduler")
local WorldRuntime = require("ConspiracyFiles/WorldRuntime")

local IntegrationRuntime = {}

IntegrationRuntime.READY_DIAGNOSTIC = "Conspiracy-Files: canonical runtime ready; phase=running"

local REQUIRED_EVENTS = {
    "OnInitGlobalModData", "OnGameStart", "LoadGridsquare",
    "OnSave", "OnPlayerDeath", "OnTick"
}
local generationSequence = 0
local currentRegistration = nil

local function cleanupRegistration(registration)
    registration.gate.invalidate()
    local removeEvent = registration.environment.removeEvent
    if type(removeEvent) ~= "function" then return end
    for index = #registration.attempted, 1, -1 do
        local entry = registration.attempted[index]
        local ok = pcall(removeEvent, entry.name, entry.callback)
        if ok then registration.removedEvents[#registration.removedEvents + 1] = entry.name end
    end
end

local function retireCurrentRegistration()
    local registration = currentRegistration
    if not registration then return end
    currentRegistration = nil
    cleanupRegistration(registration)
end

local function disabledResult(reason, decision, detail)
    return {
        enabled = false,
        reason = reason,
        decision = decision,
        registeredEvents = {},
        diagnostic = detail and tostring(detail) or nil
    }
end

function IntegrationRuntime.start(environment)
    assert(type(environment) == "table", "integration environment is required")
    local decision = Bootstrap.decide(environment.isMultiplayer, environment.runtimeVersion)
    if not decision.enabled then
        if environment.report then environment.report("Conspiracy-Files disabled: " .. decision.reason) end
        return disabledResult(decision.reason, decision)
    end

    retireCurrentRegistration()

    local errors, persistence, lifecycle, scheduler, worldRuntime
    local constructed, constructionError = pcall(function()
        errors = ErrorBudget.new({ threshold = 3, report = environment.report })
        persistence = PersistenceAdapter.new({ storage = environment.storage, report = environment.report })
        lifecycle = LifecycleAdapter.new({ persistence = persistence })
        scheduler = Scheduler.new({
            clock = environment.clock,
            maxWorkPerDrain = 24,
            maxQueued = 256,
            maxMillis = 1,
            execute = function(subsystem, work)
                errors.call(subsystem, work)
            end
        })
        if environment.world and environment.itemPort then
            worldRuntime = WorldRuntime.new({
                persistence = persistence,
                scheduler = scheduler,
                world = environment.world,
                itemPort = environment.itemPort
            })
        end
    end)
    if not constructed then
        if environment.report then pcall(environment.report, "Conspiracy-Files disabled: runtime-construction-failed") end
        return disabledResult("runtime-construction-failed", decision, constructionError)
    end
    generationSequence = generationSequence + 1
    local registration = {
        id = generationSequence,
        environment = environment,
        attempted = {},
        removedEvents = {},
        errors = errors
    }
    registration.gate = RegistrationGate.new({
        isCurrent = function() return currentRegistration == registration end
    })
    currentRegistration = registration

    local phase = "registration-pending"
    local readyDiagnosticEmitted = false
    local callbacks = {}
    local registeredEvents = {}

    local function disable(reason)
        phase = reason
        registration.gate.invalidate()
    end

    callbacks.OnInitGlobalModData = registration.gate.wrap(function(isNewGame)
        if phase ~= "registered" then return end
        local boundaryOk, loaded = errors.call("persistence", function()
            return persistence.load(isNewGame)
        end)
        if not boundaryOk then
            disable("disabled-persistence-failed")
        elseif not loaded then
            disable("disabled-incompatible-state")
        else
            phase = "canonical-ready"
        end
    end)

    callbacks.OnGameStart = registration.gate.wrap(function()
        if phase ~= "canonical-ready" then return end
        local boundaryOk = errors.call("lifecycle", function()
            if not persistence.isLoaded() then error("canonical state was not initialized") end
            if worldRuntime then worldRuntime.start() end
            phase = "running"
            if environment.report and not readyDiagnosticEmitted then
                readyDiagnosticEmitted = true
                pcall(environment.report, IntegrationRuntime.READY_DIAGNOSTIC)
            end
        end)
        if not boundaryOk then disable("disabled-startup-failed") end
    end)

    callbacks.LoadGridsquare = registration.gate.wrap(function(square)
        if phase ~= "running" then return end
        if worldRuntime then errors.call("placement-wakeup", function() worldRuntime.onLoadGridSquare(square) end) end
    end)

    local function checkpoint(reason)
        if phase ~= "running" then return end
        errors.call("lifecycle-checkpoint", function()
            local ok, message = lifecycle.checkpoint(reason)
            if not ok then error(message) end
        end)
    end

    callbacks.OnSave = registration.gate.wrap(function() checkpoint("save") end)
    callbacks.OnPlayerDeath = registration.gate.wrap(function() checkpoint("death") end)

    callbacks.OnTick = registration.gate.wrap(function()
        if phase ~= "running" then return end
        errors.call("scheduler", function()
            if worldRuntime then worldRuntime.onTick() end
            scheduler.drain()
        end)
    end)

    local function registerAll()
        for _, eventName in ipairs(REQUIRED_EVENTS) do
            registration.attempted[#registration.attempted + 1] = {
                name = eventName,
                callback = callbacks[eventName]
            }
            environment.addEvent(eventName, callbacks[eventName])
            registeredEvents[#registeredEvents + 1] = eventName
        end
    end

    local registered, registrationError = errors.call("lifecycle-registration", registerAll)
    if not registered then
        if currentRegistration == registration then currentRegistration = nil end
        cleanupRegistration(registration)
        phase = "disabled-registration-failed"
        return {
            enabled = false,
            reason = "event-registration-failed",
            decision = decision,
            callbacks = callbacks,
            errorBudget = errors,
            registeredEvents = registeredEvents,
            removedEvents = registration.removedEvents,
            registrationGeneration = registration.id,
            phase = function() return phase end,
            diagnostic = tostring(registrationError)
        }
    end
    phase = "registered"
    assert(registration.gate.commit(), "registration generation could not commit")

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
        removedEvents = registration.removedEvents,
        registrationGeneration = registration.id,
        registrationStatus = registration.gate.status,
        phase = function() return phase end
    }
end

return IntegrationRuntime
