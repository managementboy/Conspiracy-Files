-- No Help, owner directive 2 (NH-D2): the survivor finds clues through the
-- mod's hint and the game's Search Mode, with "Look it over" as the fallback.
-- So the save keeps HOW each clue was recognised, and a playtest can count
-- clues found by searching against clues looted and looked over, instead of
-- guessing from impressions.
--
-- Uses a real generated session (test/fixtures/generated_session.lua, pointed
-- at mod-nohelp's copy of the engine), because the validator refuses any
-- hand-written case.
local source=assert(io.open("test/fixtures/generated_session.lua","rb")):read("*a")
source=source:gsub("mod/common/media/lua/shared","mod-nohelp/common/media/lua/shared")
             :gsub("ConspiracyFiles/","NHShared/")
local F=assert(loadstring(source,"generated_session (No Help)"))()
local S=require("NHShared/Generated/Session")
assert(S.FOUND_HOW.search and S.FOUND_HOW.look,"NH-D2: searching and looking it over are both ways a clue is found")

local root=F.root(1)
local saved=root
local api=assert(S.open(root,function(next) saved=next end))
local ids={}
for _,d in ipairs(root.case.documents) do ids[#ids+1]=d.id end
assert(#ids>=2,"the fixture case has at least two clues")

assert(api.recognise(ids[1],"search"),"a clue spotted in Search Mode is recognised")
assert(api.recognise(ids[2],"look"),"a clue looked over is recognised")
assert(saved.recognisedHow[ids[1]]=="search","NH-D2: the save remembers it was found by searching")
assert(saved.recognisedHow[ids[2]]=="look","NH-D2: and that the other was looked over")
assert(S.validate(saved),"the save with methods is valid")

-- Recognising again changes nothing: the first way it was found stands.
assert(api.recognise(ids[1],"look"))
assert(saved.recognisedHow[ids[1]]=="search","a clue keeps the way it was first found")

-- The validator refuses a method for a clue never recognised, or an unknown one.
local bad=api.snapshot(); bad.recognisedHow[ids[#ids]]="search"
if #ids>2 then assert(not S.validate(bad),"a method for a clue never recognised is refused") end
bad=api.snapshot(); bad.recognisedHow[ids[1]]="teleport"
assert(not S.validate(bad),"an unknown way of finding is refused")

-- A save from before this existed, with no methods at all, is still valid.
local old=api.snapshot(); old.recognisedHow=nil
assert(S.validate(old),"older saves without methods still load")
print("nohelp found-how: NH-D2 search and look-it-over recorded per clue")
