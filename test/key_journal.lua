package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local stores, writes, reject, fail = {}, 0, false, false
ModData={
    get=function(tag) return stores[tag] end,
    getOrCreate=function(tag)
        if fail then error("write failed") end
        writes=writes+1
        stores[tag]=stores[tag] or {}
        return stores[tag]
    end,
}
package.loaded["ConspiracyFiles/SaveBudget"]={check=function(kind, staged)
    assert(kind=="keyConnections" and staged.canonical)
    return not reject, "budget"
end}
ConspiracyFiles={GeneratedRuntime={known=function() return {{id="clue",title="An unsigned letter"}} end}}
local J=require("ConspiracyFiles/KeyJournal")
local facts={
    {kind="anonymousClue", id="clue", buildingId="house"},
    {kind="nameDocument", id="card", sourceToken="body", name="Dana"},
    {kind="keySource", id="key", sourceToken="body", keyToken="item", keyId=7},
    {kind="keyDoorMatch", id="door", keyToken="item", keyId=7, doorId="front", buildingId="house"},
}
assert(#J.rows()==0 and writes==0)
reject=true
assert(not J.observe(facts[1]) and writes==0)
reject=false; fail=true
assert(not J.observe(facts[1]) and writes==0)
fail=false
for i=4,1,-1 do
    assert(J.observe(facts[i]))
    assert(#J.rows()==(i==1 and 1 or 0))
end
local rows=J.rows()
assert(rows[1].detailText:find("An unsigned letter",1,true))
local id=rows[1].id
rows[1].title="mutated projection"
assert(J.rows()[1].title~="mutated projection")
local count=writes
for _, fact in ipairs(facts) do assert(J.observe(fact)) end
assert(writes==count and #J.rows()==1)
package.loaded["ConspiracyFiles/KeyJournal"]=nil
J=require("ConspiracyFiles/KeyJournal")
assert(J.rows()[1].id==id and writes==count)
stores["ConspiracyFiles.KeyConnections"].extra=true
assert(not J.observe(facts[1]) and #J.rows()==0 and writes==count)
print("key_journal: ok")
