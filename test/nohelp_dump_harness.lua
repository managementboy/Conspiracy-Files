-- Test: StateDump harness comparison logic for save/reload validation (C4).
-- Unit tests for the dump line comparison function.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path

-- Load the harness
local CFNHDump = dofile("tools/autotest/checks/nohelp_dump_harness.lua")

-- TEST 1: Equal dumps (identical counts) return true
local function test_equal_dumps()
    local line = "conflict=0 pending=5 placing=3 placed=10 unknown=0 deferred=2 dropped=1 indexed=0 statusOther=0 lost=1 areasDecided=8 cluesContainment=4 cluesAgricultural=2"
    local result = CFNHDump.sameAcrossReload(line, line)
    assert(result == "true", "identical dumps should return 'true', got '" .. result .. "'")
end

-- TEST 2: Different conflict counts return false
local function test_different_conflict()
    local line1 = "conflict=0 pending=5"
    local line2 = "conflict=1 pending=5"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "false", "different conflict should return 'false', got '" .. result .. "'")
end

-- TEST 3: Different statusOther counts return false
local function test_different_statusother()
    local line1 = "statusOther=0 pending=5"
    local line2 = "statusOther=1 pending=5"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "false", "different statusOther should return 'false', got '" .. result .. "'")
end

-- TEST 4: Different pending counts return false
local function test_different_pending()
    local line1 = "pending=5 placing=3 placed=10 unknown=0 deferred=2 dropped=1 areasDecided=8 cluesContainment=4 cluesAgricultural=2"
    local line2 = "pending=6 placing=3 placed=10 unknown=0 deferred=2 dropped=1 areasDecided=8 cluesContainment=4 cluesAgricultural=2"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "false", "different pending should return 'false', got '" .. result .. "'")
end

-- TEST 5: Ignore non-placement fields (e.g. peakMs, bytes, step counts)
local function test_ignore_non_placement()
    local line1 = "pending=5 placing=3 peakMs=42 bytes=50000 placement=100 foundBySearch=2"
    local line2 = "pending=5 placing=3 peakMs=100 bytes=60000 placement=999 foundBySearch=10"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "true", "different non-placement fields should be ignored, got '"..result.."'")
end

-- TEST 6: Empty/nil lines return false
local function test_empty_lines()
    local result1 = CFNHDump.sameAcrossReload("", "pending=5")
    assert(result1 == "false", "empty line should return 'false', got '"..result1.."'")

    local result2 = CFNHDump.sameAcrossReload(nil, "pending=5")
    assert(result2 == "false", "nil line should return 'false', got '"..result2.."'")

    local result3 = CFNHDump.sameAcrossReload("pending=5", nil)
    assert(result3 == "false", "nil line should return 'false', got '"..result3.."'")
end

-- TEST 7: Order independence (parsed from key=value pairs)
local function test_order_independence()
    local line1 = "pending=5 placing=3 placed=10 unknown=0"
    local line2 = "placed=10 unknown=0 pending=5 placing=3"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "true", "same counts in different order should return 'true', got '"..result.."'")
end

-- TEST 8: Shell-produced string format (sorted keys, space-separated)
local function test_shell_produced_format()
    -- Simulating the exact format the shell produces via the harness
    local line1 = "areasDecided=8 cluesAgricultural=2 cluesContainment=4 conflict=0 deferred=2 dropped=1 indexed=0 lost=1 pending=5 placed=10 placing=3 short=0 statusOther=0 unknown=0"
    local line2 = "areasDecided=8 cluesAgricultural=2 cluesContainment=4 conflict=0 deferred=2 dropped=1 indexed=0 lost=1 pending=5 placed=10 placing=3 short=0 statusOther=0 unknown=0"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "true", "identical shell-produced strings should return 'true', got '"..result.."'")
end

-- TEST 9: Shell-produced strings with one field different
local function test_shell_produced_different()
    local line1 = "areasDecided=8 cluesAgricultural=2 cluesContainment=4 conflict=0 deferred=2 dropped=1 indexed=0 lost=1 pending=5 placed=10 placing=3 short=0 statusOther=0 unknown=0"
    local line2 = "areasDecided=8 cluesAgricultural=2 cluesContainment=4 conflict=0 deferred=2 dropped=1 indexed=0 lost=1 pending=6 placed=10 placing=3 short=0 statusOther=0 unknown=0"
    local result = CFNHDump.sameAcrossReload(line1, line2)
    assert(result == "false", "shell-produced strings with different pending should return 'false', got '"..result.."'")
end

-- TEST 10: ready() refuses the too-early dump that caused the 2026-09-29 false FAIL
local function test_ready()
    local early = "areasDecided=0 bytes=3515 cluesAgricultural=0 cluesContainment=0 foundByLook=0 foundBySearch=0 lost=0 peakMs=0 scenes=4"
    local later = "areasDecided=4 cluesAgricultural=8 cluesContainment=12 deferred=24 lost=0"
    assert(CFNHDump.ready(early) == "false", "pre-placement dump must not be ready")
    assert(CFNHDump.ready("areasDecided=4 lost=0") == "false", "decided but nothing assigned is not ready")
    assert(CFNHDump.ready(later) == "true", "decided and assigned is ready")
    assert(CFNHDump.ready("") == "false" and CFNHDump.ready(nil) == "false")
    -- and the comparison does fail between the two, so the check can fail for real
    assert(CFNHDump.sameAcrossReload(early, later) == "false")
end

local tests = {
    { "READY GATE", test_ready },
    { "EQUAL DUMPS", test_equal_dumps },
    { "DIFFERENT CONFLICT", test_different_conflict },
    { "DIFFERENT STATUSOTHER", test_different_statusother },
    { "DIFFERENT PENDING", test_different_pending },
    { "IGNORE NON-PLACEMENT FIELDS", test_ignore_non_placement },
    { "EMPTY/NIL LINES", test_empty_lines },
    { "ORDER INDEPENDENCE", test_order_independence },
    { "SHELL PRODUCED FORMAT (equal)", test_shell_produced_format },
    { "SHELL PRODUCED FORMAT (different)", test_shell_produced_different },
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
