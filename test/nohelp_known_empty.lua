-- P.known on a world record with no documents yet (first visible playtest,
-- 2026-09-27). A new No Help world has an empty document list until the first
-- area is decided; P.known read root.case.documents[1].id unguarded and threw
-- three times at every world start (caught, logged "Deferred known"). The
-- shipped function is taken from its source and run against an empty record,
-- a record with a known clue, and a record whose first clue is unknown.
local PATH="mod-nohelp/common/media/lua/client/NHShared/LocalPersonIntegration.lua"
local f=assert(io.open(PATH,"rb")); local src=f:read("*a"); f:close()
local body=src:match("\n(function P%.known%(%).-\nend\n)")
assert(body,"P.known is where it was")
local roots,knownRows,facts={}, {}, {}
local env=setmetatable({
    P={},
    cases=function() return roots end,
    require=function(name)
        assert(name=="NHShared/EngineAPI","P.known asks only the engine API")
        return {GeneratedRuntime={known=function() return knownRows end}}
    end,
    noteFact=function(fact) facts[#facts+1]=fact; return true end,
},{__index=_G})
local chunk=assert(loadstring(body.."return P.known"))
setfenv(chunk,env)
local known=chunk()

-- A new world: no documents, no case table contents at all.
roots={{case={documents={}}}}
knownRows={{id="d1"}}
assert(pcall(known),"an empty world record is not an error")
assert(#facts==0,"and notes nothing")
roots={{case={}}}
assert(pcall(known),"nor is a record with no document list")

-- A world with its first clue known notes the fact, as before.
roots={{case={documents={{id="d1",locationId="t3:b7"}}}}}
assert(pcall(known))
assert(#facts==1 and facts[1].kind=="anonymousClue" and facts[1].id=="d1" and facts[1].buildingId=="b7",
    "the known first clue is noted, with its building")
-- An unknown first clue notes nothing.
facts={}; knownRows={}
assert(pcall(known) and #facts==0,"an unknown first clue notes nothing")
print("nohelp known empty: an empty world record is not an error; a known first clue is still noted")
