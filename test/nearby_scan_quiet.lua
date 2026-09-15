-- The nearby scan that prepares a case keeps its detail out of the console
-- (campaign check, 2026-09-15). It wrote one info line for every building, room
-- and rectangle it read - thousands per case, one after another - which filled
-- console.txt and stretched the time before a new case could start to minutes.
-- The rows are debug detail: written only when debug logging is on, and not
-- walked at all otherwise. The summary and any error stay at info.
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local src=read("mod/common/media/lua/client/ConspiracyFiles/T3Nearby.lua")

assert(src:find("local function emit(row, level)",1,true),"emit must take a level")
assert(src:find('CFLog.message("nearby","scan","" .. table.concat(parts, " "), level)',1,true),
    "emit must pass its level to the log")
assert(src:find('emit(j.rows[j.index], "d")',1,true),"each scanned row is debug detail")
assert(src:find('if not CFLog.enabled("d") then j.index = #j.rows + 1 end',1,true),
    "with debug logging off the rows are not walked one per step")
-- The summary and errors are still said at the default level.
assert(src:find('emit({kind="complete"',1,true) and src:find('emit({kind="error"',1,true),
    "the completion and error lines stay")
assert(not src:find('emit({kind="complete".-, "d")'),"the completion line is not demoted")
print("PASS the nearby scan logs its rows only as debug detail; the summary and errors stay")
