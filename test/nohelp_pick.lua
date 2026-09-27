-- The No Help clue picker and the clue list's rules (task 3 plan, step 3),
-- held against the owner's directives on the placeholder inventory.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local Pick=require("NHShared/Generated/Pick")
local Manifest=require("NHShared/Mystery/Manifest")
local Inventory=require("nohelp_inventory")
local clues=Inventory.clues

-- The clue list's own rules.
assert(Manifest.lint(clues),"NH-D1 NH-D5: the placeholder list passes the clue-list rules")
assert(Manifest.lint({}),"an empty list (no real clues written yet) is not an error")
local function copyList(list)
    local out={}
    for i,c in ipairs(list) do
        local w={}; for j,x in ipairs(c.where) do w[j]={place=x.place,spot=x.spot,lean=x.lean,rival=x.rival} end
        local p={}; for j,x in ipairs(c.pieces) do p[j]=x end
        out[i]={id=c.id,kind=c.kind,pieces=p,where=w}
    end
    return out
end
local broken=copyList(clues)
for _,c in ipairs(broken) do if c.kind=="set" then c.kind="written"; c.pieces={"letter"} end end
assert(not Manifest.lint(broken),"NH-D5: a list with fewer than half object sets is refused")
broken=copyList(clues)
for _,c in ipairs(broken) do for _,w in ipairs(c.where) do if w.place=="farm" then w.lean="agricultural"; w.rival="containment" end end end
assert(not Manifest.lint(broken),"NH-D1: a place that can host only one conspiracy is refused")
broken=copyList(clues)
for i=#broken,1,-1 do if broken[i].id=="S25" then table.remove(broken,i) end end
assert(not Manifest.lint(broken),"NH-D1: a place and conspiracy with no object set is refused")
broken=copyList(clues); broken[1].where[1].rival=broken[1].where[1].lean
assert(not Manifest.lint(broken),"NH-D1: a clue must name the other theory it cuts against")
broken=copyList(clues); broken[1].pieces={"Note","Note"}
assert(broken[1].kind=="set","the first placeholder clue is a set")
assert(not Manifest.lint(broken),"a set made of notes is a written clue in disguise")
broken=copyList(clues); broken[2].pieces={"NotARealItem"}
assert(broken[2].kind=="set","the second placeholder clue is a set")
local w; for _,c in ipairs(copyList(clues)) do if c.kind=="written" then w=c break end end
w.pieces={"Twine"}; assert(not Manifest.lint({w}),"a written clue is carried on a written kind, not a loose object")
assert(not Manifest.lint(broken),"NH-D5: every piece is a real vanilla item")

-- A small world: every kind of place several times over.
local function fresh() return {areas={},world={},placed={}} end
local function record(ledger,areaId,picks)
    ledger.areas[areaId]=ledger.areas[areaId] or {}
    for _,p in ipairs(picks) do
        ledger.areas[areaId][p.lean]=(ledger.areas[areaId][p.lean] or 0)+1
        ledger.world[p.lean]=(ledger.world[p.lean] or 0)+1
        ledger.world[p.kind]=(ledger.world[p.kind] or 0)+1
        ledger.placed[p.clue]=(ledger.placed[p.clue] or 0)+1
    end
end

-- NH-D3: the same world gives the same answer; reading a map is not an input.
local area={id="a1",place="farm"}
local a=Pick.choose{clues=clues,area=area,ledger=fresh(),seed=7,version="v1"}
local b=Pick.choose{clues=clues,area=area,ledger=fresh(),seed=7,version="v1",mapRead=true,playerRead={"S01"}}
assert(#a==#b,"NH-D3: same world, same number of clues")
for i=1,#a do assert(a[i].clue==b[i].clue and a[i].spot==b[i].spot,"NH-D3: same world, same clues, whatever the player read") end

-- The order is spread by the world, not by how clues happen to be named:
-- across seeds, the first clue picked at a place is not always the same one.
local firsts={}
for seed=1,40 do
    local p=Pick.choose{clues=clues,area={id="spread",place="farm"},ledger=fresh(),seed=seed,version="v1"}
    firsts[p[1].clue]=true
end
local distinct=0; for _ in pairs(firsts) do distinct=distinct+1 end
-- Every clue that could open this place does, on some world: the first pick at
-- an empty world is a containment set here (one of each conspiracy, sets
-- first), so every such set should come first somewhere.
local possible=0
for _,c in ipairs(clues) do
    for _,w in ipairs(c.where) do
        if w.place=="farm" and w.lean=="containment" and c.kind=="set" then possible=possible+1 end
    end
end
assert(possible>=2 and distinct==possible,
    "NH-D3: which clue comes first varies with the world ("..distinct.." of "..possible.." possible)")
-- A large seed is written as digits, the same in any runtime.
assert(Pick.key({1e15,"a"})=="16:1000000000000000|1:a","numbers in a choice are whole-number digits")
-- An area the list cannot fill says by how much.
local tiny={clues[1],clues[2]}
local _,short=Pick.choose{clues={},area={id="empty",place="farm"},ledger=fresh(),seed=1,version="v1"}
assert(short>=2,"an area with nothing to give reports its shortfall")

-- The count per area is the world's, between 2 and 10.
for i=1,200 do
    local n=Pick.targetCount(i,"area-"..i,"v1")
    assert(n>=2 and n<=Pick.FIRST_DEVELOPMENT_CAP*2,"an area gets 2 to 10 clues, got "..n)
end

-- Walk a world of 60 areas.
local ledger=fresh()
local total=0
for i=1,60 do
    local place=Inventory.places[((i-1)%#Inventory.places)+1]
    local id="area-"..i
    local picks,short=Pick.choose{clues=clues,area={id=id,place=place},ledger=ledger,seed=3,version="v1"}
    -- NH-D4: an area is short only by what the clue list cannot give it: a
    -- place never takes the same clue twice, so it can hold at most the
    -- number of different clues written for it, per conspiracy and cap.
    local distinctFor={containment=0,agricultural=0}
    for _,c in ipairs(clues) do for _,w in ipairs(c.where) do
        -- a written clue placed anywhere already is gone for good
        if w.place==place and not (c.kind=="written" and (ledger.placed[c.id] or 0)>0) then
            distinctFor[w.lean]=distinctFor[w.lean]+1 end end end
    local reachable=math.min(distinctFor.containment,Pick.FIRST_DEVELOPMENT_CAP)+math.min(distinctFor.agricultural,Pick.FIRST_DEVELOPMENT_CAP)
    local target=Pick.targetCount(3,id,"v1")
    assert(#picks==math.min(target,reachable),
        "NH-D4: "..id.." holds "..#picks.." of its "..target.." (the list allows "..reachable..")")
    assert(short==target-#picks,"the shortfall is reported exactly")
    local leans={}
    for _,p in ipairs(picks) do leans[p.lean]=(leans[p.lean] or 0)+1 end
    -- NH-D1: both conspiracies in every area.
    assert((leans.containment or 0)>=1 and (leans.agricultural or 0)>=1,
        "NH-D1: "..id.." ("..place..") holds both conspiracies")
    -- NH-D4: never above the first-development cap.
    assert((leans.containment or 0)<=Pick.FIRST_DEVELOPMENT_CAP and (leans.agricultural or 0)<=Pick.FIRST_DEVELOPMENT_CAP,
        "NH-D4: "..id.." stays within the cap")
    for _,p in ipairs(picks) do assert(p.rival~=p.lean,"every placed clue names the theory it cuts against") end
    record(ledger,id,picks); total=total+#picks
end
-- NH-D4: no real maximum. There are 24 clues; far more than 24 were placed,
-- because once the written clues ran out, sets came back as new copies.
assert(total>#clues,"NH-D4: placing does not stop when the list runs out ("..total.." placed from "..#clues..")")
-- NH-D5: at least half of what was placed are object sets.
assert((ledger.world.set or 0)*2>=total,"NH-D5: at least half of placed clues are sets ("..tostring(ledger.world.set).." of "..total..")")
-- NH-D1: neither conspiracy dominates the world.
local c,g=ledger.world.containment or 0,ledger.world.agricultural or 0
assert(math.abs(c-g)<=total*0.2,"NH-D1: the world stays balanced between the two ("..c.." vs "..g..")")
-- Written clues are placed once each, never copied.
for _,cl in ipairs(clues) do
    if cl.kind=="written" then assert((ledger.placed[cl.id] or 0)<=1,cl.id.." (written) was placed more than once") end
end
-- An area already holding clues is only topped up to its number, never past it.
local again=Pick.choose{clues=clues,area={id="area-1",place=Inventory.places[1]},ledger=ledger,seed=3,version="v1"}
assert(#again==0,"an area that already has its clues gets no more")

-- NH-D4: the cap lives in Pick.lua and nowhere else in No Help.
local function read(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local hits=0
for path in io.popen("grep -rl FIRST_DEVELOPMENT_CAP mod-nohelp"):lines() do
    hits=hits+1
    assert(path:find("Generated/Pick.lua",1,true),"NH-D4: the cap is also named in "..path)
end
assert(hits==1,"NH-D4: the cap is defined once")
assert(read("mod-nohelp/common/media/lua/shared/NHShared/Generated/Pick.lua"):find("P.FIRST_DEVELOPMENT_CAP=5",1,true),
    "NH-D4: the owner's cap is 5 per conspiracy per area")
print("nohelp pick: "..total.." clues over 60 areas, "..tostring(ledger.world.set).." sets; both conspiracies everywhere")
