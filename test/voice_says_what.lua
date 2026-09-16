-- The survivor says WHAT they are noting (P4-R130). Owner, Windows, 2026-09-16:
-- "I should note this before I forget." over a key on the road - "can we
-- describe what we are noting? we have the data to do it". The line names the
-- thing when a plain noun can be read from its record; the coloured tag gives
-- the record's own title. When no plain noun reads well (an object, several
-- keys, nothing known), the line stays as it was.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local says,halos={},{}
local p={Say=function(_,t) says[#says+1]=t end,setHaloNote=function(_,t) halos[#halos+1]=t end}
getPlayer=function() return p end
local clock=0
getTimeInMillis=function() return clock end
ConspiracyFiles={}
local known={
    {id="doc-key",title="Tagged key / AV-197",kind="key"},
    {id="doc-receipt",title="Second goods receipt / HK-318",kind="receipt"},
    {id="doc-card",title="Credit Card: Joanne Voss",kind="dispatch"},
    {id="doc-radios",title="thirteen radio receivers",kind="RadioRed"},
}
ConspiracyFiles.GeneratedRuntime={known=function() return known end}
ConspiracyFiles.IdentityObserver={rows=function() return {{id="identity:7",title="Found Ines Kubiak's ID card"}} end}
ConspiracyFiles.KeyObserver={rows=function() return {{id="keys:a",title="A key on Joanne Voss"},{id="keys:b",title="3 keys on a body"}} end}
ConspiracyFiles.KeyJournal={rows=function() return {{id="connection:1",title="Possible connection: Voss"}} end}
local V=require("ConspiracyFiles/PlayerVoice")
V.HOLD_MS=0

local function noted(kind,ref)
    V.reset(); says,halos={},{}
    clock=clock+100000
    V.onDiscovery(kind,ref)
    return halos[1],says[1]
end

local line,tag=noted("evidence","doc-key")
assert(line:find("tagged key",1,true),"a document names what it is: "..tostring(line))
assert(tag=="Noted: Tagged key / AV-197","the tag gives the record's title: "..tostring(tag))

line=noted("evidence","doc-receipt")
assert(line:find("goods receipt",1,true) and not line:find("second",1,true),"a second copy is still a goods receipt: "..tostring(line))

line=noted("evidence","doc-card")
assert(line:find("credit card",1,true),"a title before its colon: "..tostring(line))

line,tag=noted("identity","identity:7")
assert(line:find("ID card",1,true) and not line:find("Kubiak",1,true),"an identity names the document, not the person: "..tostring(line))
assert(tag=="Noted: Ines Kubiak's ID card",tostring(tag))

line=noted("connection","keys:a")
assert(line:find("key",1,true),"one key is a key: "..tostring(line))

line,tag=noted("connection","connection:1")
assert(line:find("possible connection",1,true),tostring(line))

-- No plain noun: the line is one of the original ten, word for word.
local ORIGINAL={
    ["That's worth writing down."]=true,["Interesting. That's going in the machine."]=true,
    ["I should note this before I forget."]=true,["Hm. That's going in my notes."]=true,
    ["Better write this one down."]=true,["That means something. Noting it."]=true,
    ["I'll want to remember this."]=true,["Worth keeping a record of that."]=true,
    ["Let me key this in while I've got it."]=true,["That's a detail I shouldn't lose."]=true,
}
line,tag=noted("evidence","doc-radios")
assert(ORIGINAL[line],"an object keeps the plain line: "..tostring(line))
assert(tag=="Noted: thirteen radio receivers","but the tag still says what it was: "..tostring(tag))
line=noted("connection","keys:b")
assert(ORIGINAL[line],"several keys keep the plain line: "..tostring(line))
line,tag=noted("evidence","nothing-known")
assert(ORIGINAL[line] and tag=="Noted","nothing known: the line and tag are as before: "..tostring(line).." / "..tostring(tag))

-- Every one of the ten lines has a form that names the thing.
local seen={}
for _=1,10 do
    clock=clock+100000
    halos={}
    V.onDiscovery("evidence","doc-key")
    local l=halos[1]
    assert(l and l:find("tagged key",1,true),"every line names the thing: "..tostring(l))
    seen[l]=true
end
local n=0; for _ in pairs(seen) do n=n+1 end
assert(n==10,"all ten lines are reachable with a name: "..n)

print("PASS voice says what: documents, ID cards, one key and connections are named; objects, several keys and unknown records keep the plain line")
