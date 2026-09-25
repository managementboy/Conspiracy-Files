-- ONE LIST OF SAVED ROOTS, NOT TWO.
--
-- SaveBudget budgets fourteen ModData roots. tools/autotest/checks/reload.lua
-- kept its own copy of eleven of them, under a comment reading "the same roots
-- SaveBudget.check measures, summed" - missing mapMedia, placeVisits and
-- casePeople. So every save size the campaign gate printed was an undercount,
-- and its `[ "$b" -le 500000 ]` assertion was made against the wrong number.
--
-- Map media is precisely the root the 2026-09-21 save-size retraction turned
-- on: "I measured one root and called it the save". A second, shorter copy of
-- the list is the same mistake with more steps.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local Budget=require("ConspiracyFiles/SaveBudget")

assert(type(Budget.tags)=="table","SaveBudget must publish the roots it budgets")
local n=0
for _ in pairs(Budget.tags) do n=n+1 end
assert(n>=15,"SaveBudget budgets "..n.." roots; expected at least fifteen")
-- UPDATED 2026-09-25, DR-20260925-THREADS: the threads root joined the list
-- when THREADS gained a put-down state. It is named here for the same reason
-- the other four are - a root the budget forgets is a save nobody is measuring.
for _,name in ipairs({"mapMedia","placeVisits","casePeople","generated","discoveries","threads"}) do
    assert(Budget.tags[name],"SaveBudget must budget "..name)
end

local f=assert(io.open("tools/autotest/checks/reload.lua","rb"))
local reload=f:read("*a"); f:close()
assert(reload:find("Budget.tags",1,true),
    "reload.lua must take the root list FROM SaveBudget, not keep its own")
-- No literal root names of its own: a literal is how the copy drifted.
for _,tag in pairs(Budget.tags) do
    assert(not reload:find('"'..tag..'"',1,true),
        "reload.lua names "..tag.." literally; it must ask SaveBudget instead")
end

print("PASS save roots single source: SaveBudget publishes "..n
    .." roots and the save measurement reads all of them")
