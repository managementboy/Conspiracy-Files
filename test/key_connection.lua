package.path="mod/common/media/lua/shared/?.lua;"..package.path
local K=require("ConspiracyFiles.KeyConnection");local function add(s,f)local n,e=K.observe(s,f);assert(n,e);return n end
local F={{kind="anonymousClue",id="a|b",buildingId="B"},{kind="nameDocument",id="doc",sourceToken="S",name="Dana"},{kind="keySource",id="key",sourceToken="S",keyToken="physical-1",keyId=7},{kind="keyDoorMatch",id="match",keyToken="physical-1",keyId=7,doorId="D",buildingId="B"}}
local s=K.new();for _,f in ipairs(F)do s=add(s,f)end;local r,why=K.connections(s);assert(why=="complete"and #r==1 and r[1].statement:find("possible connection"));local q=K.new();for i=#F,1,-1 do q=add(q,F[i])end;assert(assert(K.connections(q))[1].id==r[1].id);local d,e=K.observe(s,F[1]);assert(e=="duplicate"and #assert(K.connections(d))==1);assert(K.observe(s,{kind="keySource",id="key",sourceToken="S",keyToken="x",keyId=7})==nil);assert(K.observe(s,{kind="keySource",id="wrong",sourceToken="S",keyToken="physical-2",keyId=7})and #assert(K.connections(s))==1)
assert(K.observe(s,{kind="anonymousClue",id="bad",buildingId="B",occupation="secret"})==nil);assert(K.observe(setmetatable({},{}),F[1])==nil);assert(K.connections({schema=1,anonymousClue={x=false},nameDocument={},keySource={},keyDoorMatch={}})==nil);F[1].buildingId="changed";assert(#assert(K.connections(s))==1);r[1].name="changed";assert(assert(K.connections(s))[1].name=="Dana")
local cap=K.new();for i=1,64 do cap=add(cap,{kind="anonymousClue",id="c"..i,buildingId="B"})end;assert(K.observe(cap,{kind="anonymousClue",id="overflow",buildingId="B"})==nil)

-- Each link is necessary; equal lock IDs alone cannot identify a physical key.
F[1].buildingId = "B"
local function build(skip, index, field, value)
    local state = K.new()
    for i, original in ipairs(F) do
        if i ~= skip then
            local fact = {}
            for key, v in pairs(original) do fact[key] = v end
            if i == index then fact[field] = value end
            state = add(state, fact)
        end
    end
    return state
end
for i = 1, 4 do assert(#assert(K.connections(build(i))) == 0) end
for _, change in ipairs({
    {4, "keyToken", "another-physical-key"},
    {3, "sourceToken", "another-corpse"},
    {4, "buildingId", "another-building"},
    {4, "keyId", 8},
}) do
    assert(#assert(K.connections(build(nil, unpack(change)))) == 0)
end
local original = build()
local copied = assert(K.observe(original, F[1]))
copied.nameDocument.doc.name = "Changed"
assert(original.nameDocument.doc.name == "Dana")
for i = 2, 4 do cap = add(cap, F[i]) end
cap = add(cap, {kind="nameDocument", id="other-document", sourceToken="S", name="Other"})
local limited, status = K.connections(cap)
assert(#limited == 64 and status == "capped")
assert(K.observe(original, setmetatable(F[1], {})) == nil)
setmetatable(F[1], nil)
print("key_connection: ok")
