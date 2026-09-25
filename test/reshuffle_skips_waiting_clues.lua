-- A RESHUFFLE MUST NOT TRIP OVER A CLUE THAT WAS NEVER WRITTEN.
--
-- Native suite 20260924T212659 (reshuffle): three exceptions per waiting clue,
-- "attempted index: x of non-table: null" inside World.resolve. R.reshuffle
-- asked World.resolve about every assignment's target to strip the mod's marks
-- off what is in the world; a deferred or indexed clue has no target (P4-R133),
-- and World.resolve indexed it anyway. pcall kept the game alive and the
-- console full.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
getCell=function() error("World.resolve must not touch the cell for a missing target") end
local World=require("ConspiracyFiles/WorldAccess")
local c,why=World.resolve(nil)
assert(c==nil and why=="no target","resolving no target must answer 'no target', got "..tostring(why))
c,why=World.resolve("generated:1:document-3")
assert(c==nil and why=="no target","a non-table target is no target either")

-- And the reshuffle asks only about clues that were written somewhere.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","rb"))
local s=f:read("*a"); f:close()
local body=assert(s:match("function R%.reshuffle%(mode%)(.-)\nend\n"),"R.reshuffle must exist")
assert(body:find("if assignment.target then",1,true),
    "the reshuffle must skip an assignment with no target instead of resolving nothing")
print("PASS reshuffle: a waiting clue has no target, and neither World.resolve nor the reshuffle indexes it")
