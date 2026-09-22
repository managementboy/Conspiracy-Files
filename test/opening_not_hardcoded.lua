-- THE OPENING IS A FLAG, NOT AN ID.
--
-- `1478c04` diversified the personal opening - "Opening selection is no longer
-- hardcoded to the same collection notice" - and added two more premises
-- flagged `opening=true`. checks/pair_in_play.sh still demanded the single id
-- that had been the only opening when it was written, so on 2026-09-22 it
-- failed a perfectly correct first case for drawing `name-on-standby-list`.
--
-- Everything else in that run passed: the thread survived on the retired
-- record, pendingThread offered it, and it survived a save and reload. One
-- stale literal turned that into a FAILing gate.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local premises=read("mod/common/media/lua/shared/ConspiracyFiles/Generated/Premises.lua")
local ids={}
for id in premises:gmatch('{id="([%w%-]+)"[^}]-opening=true') do ids[#ids+1]=id end
assert(#ids>=3,
    "expected at least three opening premises after 1478c04, found "..#ids)

local pair=read("tools/autotest/checks/pair_in_play.sh")
-- No executable line may pin one opening id.
for line in pair:gmatch("[^\n]+") do
    if not line:match("^%s*#") then
        for _,id in ipairs(ids) do
            assert(not line:find('= "'..id..'" ]',1,true),
                "pair_in_play pins the opening to "..id..": there are "..#ids
                .." opening premises and the check must accept any of them: "..line)
        end
    end
end
assert(pair:find("e.opening",1,true),
    "the check must ask Premises which ids are openings")
assert(pair:find("is not one of the openings",1,true),
    "the failure must name the whole set, so a reader can see it was a set")

print("PASS opening_not_hardcoded: "..#ids.." opening premises, and the "
    .."in-game check accepts any of them")
