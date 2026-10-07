-- Test: StateDump emits only numbers, validates correctly, errors safely, gates properly.
-- Required tests: CANARY LEAK, DRIFT, REAL END-TO-END, GATE OFF (4 modes).
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path

-- Stubs for engine globals before loading StateDump.
OIShared=OIShared or {}
isClient=function() return false end
isServer=function() return false end
getTimeInMillis=function() return 0 end
ModData={getOrCreate=function(tag) return {} end, get=function(tag) return nil end}

local StateDump=dofile("mod-ofinterest/common/media/lua/client/OIShared/StateDump.lua")
local boot=dofile("test/fixtures/oi_runtime_stub.lua")
local Inventory=require("oi_inventory")

-- Serialize a value to check for leak strings
local function serializeToString(val)
    if type(val)=="string" then return val
    elseif type(val)=="number" then return tostring(val)
    elseif type(val)=="boolean" then return tostring(val)
    elseif type(val)=="table" then
        local parts={}
        for k,v in pairs(val) do
            table.insert(parts, serializeToString(k))
            table.insert(parts, serializeToString(v))
        end
        return table.concat(parts, "|")
    else return tostring(val) end
end

-- TEST 1: CANARY LEAK TEST
local function test_canary_leak()
    local root={
        assignments={
            ["CANARY_id_1"]={status="placed", physicalToken="CANARY_token_1", locationId="CANARY_loc_1",
                target={x=12345,y=6789,z=0,containerType="CANARY_container"}},
            ["CANARY_id_2"]={status="deferred", physicalToken="CANARY_token_2", documentId="CANARY_doc_2"},
            ["CANARY_id_3"]={status="dropped", physicalToken="CANARY_token_3", assignmentId="CANARY_assign_3"},
        },
        recognisedHow={["CANARY_id_1"]="search", ["CANARY_id_2"]="look"},
        case={seed=12345,areas={{id="CANARY_area",place="CANARY_place"}},
            documents={{id="CANARY_doc",title="CANARY title",body="CANARY body",locationId="CANARY_loc_1"}},
            locations={{id="CANARY_loc_1",bounds={x1=12345,y1=6789,x2=12355,y2=6799,z=0}}}},
    }

    local metrics={
        steps={placement=5, preparation=3, CANARY_job=3},
        queued={placement=1, CANARY_job=2},
        peakMs=42,
    }
    local bytes=50000

    -- Call build() and serialize ALL keys and values
    local fields=StateDump.build(root, metrics, bytes, true)
    local serialized=serializeToString(fields)

    -- Assert no CANARY, no coordinates (unknown jobs fold into other/queued_other)
    assert(not serialized:find("CANARY"), "build() leaked CANARY string: "..serialized)
    assert(not serialized:find("12345"), "build() leaked x coordinate: "..serialized)
    assert(not serialized:find("6789"), "build() leaked y coordinate: "..serialized)
    assert(fields.other==3, "unknown job CANARY_job should fold into other, got "..tostring(fields.other))
    assert(fields.queued_other==2, "unknown queued job should fold into queued_other, got "..tostring(fields.queued_other))

    -- Also test M.run() with a ModData wrapper (gate is on by default, no getDebug needed)
    local logged_write={}
    local logged_error={}
    local function stub_write(level, event, fields)
        table.insert(logged_write, {level=level, event=event, fields=fields})
    end
    local function stub_error(event, fields)
        table.insert(logged_error, {event=event, fields=fields})
    end

    -- Stand-ins go in BEFORE StateDump loads: it keeps SuccessiveCases in a
    -- local, and the real one rightly refuses a made-up root (it re-derives
    -- every case), which would make this check write nothing.
    package.loaded["OIShared/Generated/SuccessiveCases"]={
        currentCached=function(w, ms) return w end
    }
    package.loaded["OIShared/StateDump"]=nil
    local SD=dofile("mod-ofinterest/common/media/lua/client/OIShared/StateDump.lua")

    local Log=require("OIShared/Log")
    local orig_write=Log.write
    local orig_error=Log.error
    Log.write=stub_write
    Log.error=stub_error

    package.loaded["OIShared/GeneratedRuntime"]={metrics=function() return metrics end}
    package.loaded["OIShared/SaveBudget"]={checkMany=function() return true, bytes end}

    ModData={
        get=function(tag)
            if tag=="OIShared.Generated.G2" then
                return {canonical=root}
            end
            return nil
        end
    }

    SD.run()

    Log.write=orig_write
    Log.error=orig_error

    -- The run must actually write its one line, or the checks below are vacuous.
    local dumps=0
    for _,entry in ipairs(logged_write) do if entry.event=="dump" then dumps=dumps+1 end end
    assert(dumps==1,"M.run() over the canary root wrote "..dumps.." dump lines")

    -- Check write logs
    for _,entry in ipairs(logged_write) do
        local s=serializeToString(entry)
        assert(not s:find("CANARY"), "M.run() write() leaked CANARY: "..s)
        assert(not s:find("12345"), "M.run() write() leaked x coordinate: "..s)
        assert(not s:find("6789"), "M.run() write() leaked y coordinate: "..s)
    end

    -- Check error logs
    for _,entry in ipairs(logged_error) do
        local s=serializeToString(entry)
        assert(not s:find("CANARY"), "M.run() error() leaked CANARY: "..s)
    end
end

-- TEST 2: DRIFT TEST
local function test_drift()
    -- Scan all files under mod-ofinterest/common/media/lua/client/ recursively
    local cmd='find mod-ofinterest/common/media/lua/client -name "*.lua" -type f'
    local popen=io.popen(cmd)
    assert(popen, "find command failed")

    local subsystems={}
    local file_count=0
    for filepath in popen:lines() do
        file_count=file_count+1
        local f=io.open(filepath)
        if f then
            local src=f:read("*a")
            f:close()
            for subsystem in src:gmatch('enqueue%([^,]+,"([^"]+)"') do
                subsystems[subsystem]=true
            end
        end
    end
    popen:close()

    assert(file_count>0, "no files found in client directory")

    -- Validate each subsystem is in StateDump.FIELDS
    local found_count=0
    for subsystem in pairs(subsystems) do
        found_count=found_count+1
        local normalized=subsystem:gsub("-","_")
        local is_valid=StateDump.FIELDS[normalized]~=nil
        assert(is_valid, "subsystem '"..subsystem.."' (normalized: '"..normalized.."') not in FIELDS")
    end

    assert(found_count>=5, "expected at least 5 subsystems, found "..found_count)
end

-- TEST 3: REAL END-TO-END
local function test_real_end_to_end()
    local store={}
    local harness=boot(store)
    require("OIShared/Mystery/Manifest").clues=Inventory.clues
    local R=harness.R

    harness.fire("OnGameStart")

    -- Setup a probe result
    local function site(id,x)
        return {id=id,areaId=id,name="Building",mapId="Muldraugh, KY",buildLine="42",
            bounds={x1=x,y1=1000,x2=x+10,y2=1010,z=0},source={kind="map-research",reference="test"},
            paperStorage="observed",containerTypes={"shelves","postbox"},excluded=false}
    end
    local result={rows={
        {kind="building",id="p1",categoryHint="public-service"},
        {kind="building",id="h1",categoryHint="residential"},
    },catalog={revision="t",locations={site("t3:p1",1000),site("t3:h1",1100)}},
      candidates={["t3:p1"]={{x=1001,y=1001,z=0}},["t3:h1"]={{x=1101,y=1001,z=0}}}}

    assert(R.decideNearby()==true,"scan starts")
    harness.probe.result=result
    for _=1,20 do harness.fire("OnTick") end

    local root=store["OIShared.Generated.G2"].campaign.canonical

    -- Capture Log events
    local logged_write={}
    local logged_error={}
    local function stub_write(level, event, fields)
        table.insert(logged_write, {level=level, event=event, fields=fields})
    end
    local function stub_error(event, fields)
        table.insert(logged_error, {event=event, fields=fields})
    end

    local Log=require("OIShared/Log")
    local orig_write=Log.write
    local orig_error=Log.error
    Log.write=stub_write
    Log.error=stub_error

    package.loaded["OIShared/StateDump"]=nil
    local SD=dofile("mod-ofinterest/common/media/lua/client/OIShared/StateDump.lua")

    package.loaded["OIShared/Generated/SuccessiveCases"]={
        currentCached=function(w, ms) return w end
    }
    package.loaded["OIShared/GeneratedRuntime"]={metrics=function() return R.metrics() end}
    -- DO NOT stub SaveBudget: use the real module which reads ModData

    ModData={
        get=function(tag)
            if tag=="OIShared.Generated.G2" then
                return store[tag]
            end
            return nil
        end
    }

    SD.run()

    Log.write=orig_write
    Log.error=orig_error

    -- Verify exactly one "dump" event was logged
    local dump_count=0
    local dump_fields=nil
    for _,entry in ipairs(logged_write) do
        if entry.event=="dump" then
            dump_count=dump_count+1
            dump_fields=entry.fields
        end
    end
    assert(dump_count==1, "expected 1 dump event, got "..dump_count.." (logged_write size: "..#logged_write..")")
    assert(dump_fields~=nil, "dump event must have fields")

    -- Validate the dump fields pass M.clean
    local valid, badKey=SD.clean(dump_fields)
    assert(valid, "dump fields failed clean: "..tostring(badKey))

    -- Verify bytes was measured by real SaveBudget
    assert(dump_fields.bytes~=nil and type(dump_fields.bytes)=="number" and dump_fields.bytes>0,
        "bytes should be a positive number from real SaveBudget, got "..tostring(dump_fields.bytes))

    -- Compute counts from store and verify they match
    local assignments=root.assignments or {}
    local deferred_count=0
    local pending_count=0
    local placed_count=0
    for _,a in pairs(assignments) do
        if a.status=="deferred" then deferred_count=deferred_count+1
        elseif a.status=="pending" then pending_count=pending_count+1
        elseif a.status=="placed" then placed_count=placed_count+1 end
    end

    -- Verify counts match
    assert((dump_fields.deferred or 0)==deferred_count,
        "deferred count mismatch: dump="..tostring(dump_fields.deferred).." store="..deferred_count)
    assert((dump_fields.pending or 0)==pending_count,
        "pending count mismatch: dump="..tostring(dump_fields.pending).." store="..pending_count)
    assert((dump_fields.placed or 0)==placed_count,
        "placed count mismatch: dump="..tostring(dump_fields.placed).." store="..placed_count)

    -- Verify Pick totals are in the dump and match root.case.totals (C2)
    assert(dump_fields.areasDecided~=nil, "dump must have areasDecided")
    assert(root.case and root.case.totals, "root must have case.totals")
    assert(dump_fields.areasDecided==root.case.totals.areasDecided,
        "areasDecided mismatch: dump="..tostring(dump_fields.areasDecided).." totals="..tostring(root.case.totals.areasDecided))
    assert(dump_fields.cluesContainment~=nil, "dump must have cluesContainment")
    assert(dump_fields.cluesContainment==root.case.totals.clues.containment,
        "cluesContainment mismatch: dump="..tostring(dump_fields.cluesContainment).." totals="..tostring(root.case.totals.clues.containment))
    assert(dump_fields.cluesAgricultural~=nil, "dump must have cluesAgricultural")
    assert(dump_fields.cluesAgricultural==root.case.totals.clues.agricultural,
        "cluesAgricultural mismatch: dump="..tostring(dump_fields.cluesAgricultural).." totals="..tostring(root.case.totals.clues.agricultural))
    assert((dump_fields.short or 0)==root.case.totals.short,"short mismatch with the saved totals")
    assert(dump_fields.areasDecided==root.case.totals.areasDecided,"areasDecided mismatch with the saved totals")
end

-- TEST 4: GATE OFF (4 modes)
-- TEST 4: GATE. The same non-empty root writes exactly one line with the gate
-- open, and nothing in each of the four closed cases, so a closed gate is what
-- stops the line, not an empty record.
local function test_gate()
    package.loaded["OIShared/Generated/SuccessiveCases"]={currentCached=function(w) return w end}
    package.loaded["OIShared/GeneratedRuntime"]={metrics=function() return {steps={placement=1},queued={},peakMs=1} end}
    package.loaded["OIShared/SaveBudget"]={checkMany=function() return true,100 end}
    package.loaded["OIShared/StateDump"]=nil
    local SD=dofile("mod-ofinterest/common/media/lua/client/OIShared/StateDump.lua")
    local Log=require("OIShared/Log")
    local orig_write,orig_error=Log.write,Log.error
    local writes,errors
    Log.write=function(_,event) if event=="dump" then writes=writes+1 end end
    Log.error=function() errors=errors+1 end
    ModData={get=function() return {canonical={assignments={a={status="placed"},b={status="deferred"}},recognisedHow={a="search"}}} end}
    local function runWith(setup)
        writes,errors=0,0
        isClient=function() return false end; isServer=function() return false end
        OIShared.T11Mode=nil; OIShared.T12Mode=nil
        setup()
        SD.run()
        isClient=function() return false end; isServer=function() return false end
        OIShared.T11Mode=nil; OIShared.T12Mode=nil
        return writes,errors
    end
    local w,e=runWith(function() end)
    assert(w==1 and e==0,"gate open: one dump line, got "..w.." lines and "..e.." errors")
    for name,setup in pairs({
        isClient=function() isClient=function() return true end end,
        isServer=function() isServer=function() return true end end,
        T11Mode=function() OIShared.T11Mode=true end,
        T12Mode=function() OIShared.T12Mode=true end}) do
        w,e=runWith(setup)
        assert(w==0 and e==0,"gate closed by "..name..": expected nothing written, got "..w.." lines and "..e.." errors")
    end
    Log.write,Log.error=orig_write,orig_error
end

local tests={
    {"CANARY LEAK", test_canary_leak},
    {"DRIFT", test_drift},
    {"REAL END-TO-END", test_real_end_to_end},
    {"GATE", test_gate},
}

for _, test_pair in ipairs(tests) do
    local name, test=test_pair[1], test_pair[2]
    local ok, err=pcall(test)
    if not ok then
        print("FAIL "..name..": "..tostring(err))
        os.exit(1)
    end
end

print("PASS")
