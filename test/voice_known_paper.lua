-- Inspecting evidence that is already in the notebook says nothing new
-- (audit follow-up, 2026-09-15).
--
-- PlayerVoice's once-per-thing memory lives only while the game runs, and
-- Session.inspect quietly returns true for evidence already known. So after a
-- reload, inspecting evidence noted in an earlier session again reached the
-- connection and pile lines with an empty memory, and the survivor announced
-- "Two records disagree" about something they had known for days. R.inspect now
-- remembers whether the evidence was known before this inspection and stays quiet
-- if it was.
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")
local inspect=assert(runtime:match("function R%.inspect%(item[^)]*%)(.-)\nfunction "),"R.inspect must exist")

local already=inspect:find("local already=",1,true)
local recorded=inspect:find("api.inspect(md.cfGeneratedId)",1,true)
assert(already and recorded and already<recorded,"R.inspect must decide whether the evidence was already known BEFORE recording it")
assert(inspect:find("if voice and voice.onConnection and not already then",1,true),
    "the connection and pile lines must stay quiet for evidence already known")
print("PASS inspecting evidence already in the notebook announces nothing, even after a reload")
