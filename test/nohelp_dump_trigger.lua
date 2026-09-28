-- Test: StateDumpTrigger gates correctly, logs versions, and invokes dump (C6).
-- Plain-Lua tests with stubbed EngineEvents system.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path

-- Stubs for engine globals
NHShared = NHShared or {}
isClient = function() return false end
isServer = function() return false end
getTimeInMillis = function() return 0 end
ModData = { getOrCreate = function(tag) return {} end, get = function(tag) return nil end }

-- Stub EngineEvents for event registration
local EventHandlers = {}
local EngineEvents = {
    on = function(eventName, handler)
        EventHandlers[eventName] = EventHandlers[eventName] or {}
        table.insert(EventHandlers[eventName], handler)
    end,
    emit = function(eventName, ...)
        local handlers = EventHandlers[eventName] or {}
        for _, handler in ipairs(handlers) do
            handler(...)
        end
    end
}

-- Set up module path
package.loaded["NHShared/Events/EngineEvents"] = EngineEvents

-- Load StateDump
local StateDump = require("NHShared/StateDump")
local dumpCallCount = 0
local orig_run = StateDump.run
StateDump.run = function()
    dumpCallCount = dumpCallCount + 1
    return orig_run()
end

-- Load Trigger
package.loaded["NHShared/StateDumpTrigger"] = nil
local Trigger = require("NHShared/StateDumpTrigger")

-- Capture logs
local logged = { write = {}, error = {} }
local CFLog = require("NHShared/Log")
local orig_write = CFLog.write
CFLog.write = function(level, event, fields)
    table.insert(logged.write, { level = level, event = event, fields = fields })
    return orig_write(level, event, fields)
end

-- TEST 1: Gate off in multiplayer/modes
local function test_gate_off()
    logged.write = {}

    isClient = function() return true end
    Trigger.trigger()
    local writes_client = #logged.write
    isClient = function() return false end

    assert(writes_client == 0, "isClient() true should gate trigger, got "..writes_client.." writes")
end

-- TEST 2: Gate open in single-player, logs versions and calls dump
local function test_gate_open()
    logged.write = {}
    isClient = function() return false end
    isServer = function() return false end
    NHShared.T11Mode = nil
    NHShared.T12Mode = nil

    local prev_dump_count = dumpCallCount
    Trigger.trigger()

    -- Should write exactly one dump_trigger event
    local trigger_logs = 0
    for _, entry in ipairs(logged.write) do
        if entry.event == "dump_trigger" then
            trigger_logs = trigger_logs + 1
            assert(entry.fields.modVersion ~= nil, "must have modVersion")
        end
    end

    assert(trigger_logs == 1, "should write 1 dump_trigger, got "..trigger_logs)
    assert(dumpCallCount > prev_dump_count, "must call StateDump.run()")
end

-- TEST 3: Schema fields logged as numeric (schemaMapMediaState, etc)
local function test_schema_fields_numeric()
    logged.write = {}

    isClient = function() return false end
    Trigger.trigger()

    local found_dump_trigger = false
    for _, entry in ipairs(logged.write) do
        if entry.event == "dump_trigger" then
            found_dump_trigger = true
            -- Check for schema fields
            for key, value in pairs(entry.fields) do
                if key:match("^schema") then
                    assert(type(value) == "string" or type(value) == "number",
                        "schema field "..key.." must be numeric, got type "..type(value))
                    -- Value should be numeric digits only
                    assert(tostring(value):match("^%d+$"),
                        "schema value must be numeric digits, got '"..tostring(value).."'")
                end
            end
        end
    end
    assert(found_dump_trigger, "dump_trigger event must be written")
end

-- TEST 4: Context menu handler integration
local function test_context_menu_handler()
    -- Get the handler registered via EngineEvents
    local handlers = EventHandlers["OnFillWorldObjectContextMenu"] or {}
    assert(#handlers > 0, "context menu handler should be registered")

    -- Create a fake context object to test
    local fakeOptions = {}
    local fakeContext = {
        addOption = function(self, text, obj, callback)
            table.insert(fakeOptions, { text = text, obj = obj, callback = callback })
        end
    }

    -- Call the handler (gate is open)
    isClient = function() return false end
    NHShared.T11Mode = nil
    NHShared.T12Mode = nil
    for _, handler in ipairs(handlers) do
        handler(fakeContext, nil)
    end

    -- Should have added exactly one option
    assert(#fakeOptions == 1, "handler should add one option, got "..#fakeOptions)
    assert(fakeOptions[1].text == "Dump State", "option text should be 'Dump State', got '"..fakeOptions[1].text.."'")

    -- Calling the option callback should trigger the dump
    logged.write = {}
    local prev_dump_count = dumpCallCount
    fakeOptions[1].callback()

    -- Check that dump_trigger was written
    local dump_trigger_written = false
    for _, entry in ipairs(logged.write) do
        if entry.event == "dump_trigger" then
            dump_trigger_written = true
            break
        end
    end
    assert(dump_trigger_written, "choosing menu option should write dump_trigger")
    assert(dumpCallCount > prev_dump_count, "choosing menu option should call StateDump.run()")
end

local tests = {
    { "GATE OFF in multiplayer/modes", test_gate_off },
    { "GATE OPEN in single-player", test_gate_open },
    { "SCHEMA FIELDS NUMERIC", test_schema_fields_numeric },
    { "CONTEXT MENU HANDLER", test_context_menu_handler },
}

for _, test_pair in ipairs(tests) do
    local name, test = test_pair[1], test_pair[2]
    local ok, err = pcall(test)
    if not ok then
        print("FAIL " .. name .. ": " .. tostring(err))
        os.exit(1)
    end
end

print("PASS")
