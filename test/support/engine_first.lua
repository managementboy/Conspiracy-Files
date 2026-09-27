-- LOAD THE ENGINE'S PUBLIC TABLE BEFORE INSTALLING ANY DOUBLE.
--
--     dofile("test/support/engine_first.lua")
--
-- after package.path and any package.preload, after ConspiracyFiles is
-- established, and BEFORE the test sets ConspiracyFiles.GeneratedRuntime or
-- any other double on the shared table.
--
-- WHY. Module split stage 4 (2026-09-26) put module C's reach into A and B
-- behind ConspiracyFiles/EngineAPI.lua. That file requires the REAL
-- GeneratedRuntime, DiscoveryLog, IdentityObserver, EvidenceRows and the rest
-- at its own load, and each of those writes itself onto the shared
-- ConspiracyFiles table as it runs.
--
-- So a test that installs a double and only then reaches a program is
-- silently overwritten the first time anything calls
-- require("ConspiracyFiles/EngineAPI") - which KnoxApps now does inside
-- list(). The double disappears, the program reads the real, empty runtime,
-- and the test sees zero rows. No error anywhere: the exact silent-failure
-- shape this project keeps paying for. Nineteen tests went red on it and the
-- suite stayed red overnight.
--
-- Requiring it here, first, makes that load happen before the doubles exist.
-- require caches, so the later call inside list() returns the same table and
-- touches nothing.
--
-- This stubs NOTHING by itself. Every test using it still runs against the
-- real EngineAPI, the real EvidenceRows and the real programs - which is the
-- point of those tests and is why the fix is ordering rather than a fake.
--
-- THE SECOND HALF OF THE SAME CHANGE: WHERE A DOUBLE GOES NOW.
--
-- Module C used to read its neighbours off the shared ConspiracyFiles table,
-- so a test installed a double there and the code saw it. Module C now reads
-- them off EngineAPI - PlayerVoice, for one, resolves the name log with
-- require("ConspiracyFiles/EngineAPI").PersonNameLog. A double left only on
-- the global is simply not consulted any more, and the test fails against
-- real, correct production behaviour.
--
--     local Engine=dofile("test/support/engine_first.lua")
--     Engine.double("PersonNameLog",{nameFor=function() return "Dana Vale" end})
--
-- installs it in both places: on EngineAPI, where module C looks today, and
-- on the shared table, where anything not yet moved still looks. When the
-- split finishes, the second half can go.
local API=require("ConspiracyFiles/EngineAPI")
local M={api=API}
function M.double(name,value)
    API[name]=value
    ConspiracyFiles=ConspiracyFiles or {}
    ConspiracyFiles[name]=value
    return value
end
return M
