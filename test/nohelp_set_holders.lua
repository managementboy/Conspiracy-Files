-- No Help object-set HOLDERS (docs/design/SET_HOLDERS.md): fit rule, determinism,
-- counting, the whole-set move rule, old-save sets, and the runtime wiring.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local H=require("NHShared/SetHolders")
local D=require("NHShared/Generated/HolderData")
local O=require("NHShared/Generated/ObjectCatalogue")
local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end

-- Data: generated, unique, build recorded, every id real in the installed game.
assert(#D.holders>=200 and D.BUILD~="" and D.GAME=="Build 42.21","holder data carries the build")
local seen={}
for _,h in ipairs(D.holders) do
    assert(not seen[h.id],"duplicate holder "..h.id); seen[h.id]=true
    assert(h.fullType=="Base."..h.id and h.capacity>0)
end
local home=os.getenv("PZ_HOME") or os.getenv("HOME").."/.steam/debian-installation/steamapps/common/ProjectZomboid/projectzomboid"
local f=io.open(home.."/media/scripts/generated/items/container.txt","rb")
if f then
    local game=f:read("*a"); f:close()
    for _,h in ipairs(D.holders) do
        assert(game:find("item "..h.id.."\n",1,true),"holder id not in the game: "..h.id)
    end
    local n=0; for _ in game:gmatch("ItemType = base:container") do n=n+1 end
    assert(n==#D.holders+41,"every container is a holder or one of the 41 that accept only certain items: "..n)
    print("holder data: all "..#D.holders.." ids exist in the installed container.txt")
else print("holder data: game not installed here, ids not re-checked") end

local function set(kinds) local m={} for i,k in ipairs(kinds) do m[i]={kind=k,quantity=1} end return {members=m} end
local function total(pieces) local t=0 for _,p in ipairs(pieces) do t=t+p.weight end return t end

-- Fit rule: never a too-small holder, over many ids and sets.
local sets={{"Briefcase","Screwdriver"},{"FirstAidKit","Bandage"},{"Notebook","WaterBottle"},{"Crowbar","Briefcase"},
    {"Map","Postcard","Rope"},{"Bucket","Notebook"}}
local picked,distinct={},0
for _,kinds in ipairs(sets) do
    local pieces=H.pieces(set(kinds))
    assert(#pieces==#kinds and pieces[1].weight,"pieces carry script weights")
    for n=1,300 do
        local h=H.pick(12345+n,"c"..n,pieces)
        assert(h,"a holder is found for "..table.concat(kinds,"+"))
        assert(h.capacity>=total(pieces),"holder "..h.id.." too small for "..table.concat(kinds,"+"))
        if h.maxItemSize then for _,p in ipairs(pieces) do assert(p.weight<=h.maxItemSize,"piece too big for "..h.id) end end
        for _,p in ipairs(pieces) do assert(p.fullType~=h.fullType,"holder is a piece") end
        if not picked[h.id] then picked[h.id]=true; distinct=distinct+1 end
    end
end
assert(distinct>=40,"the pick is spread over many holders, not a shortlist: "..distinct)
-- A heavy set only gets big holders; one heavier than any holder gets none.
local heavy={{weight=9,fullType="x"},{weight=9,fullType="y"}}
for n=1,50 do local h=H.pick(n,"heavy"..n,heavy); assert(h and h.capacity>=18,"heavy set in a small holder") end
assert(H.pick(1,"too",{{weight=30,fullType="x"},{weight=30,fullType="y"}})==nil,"nothing fits: no holder, pieces stay loose")
assert(H.pick(1,"one",{{weight=0.1,fullType="x"}})==nil,"a single piece gets no holder")
assert(#H.fitting({{weight=0.5,fullType="a"},{weight=0.5,fullType="b"}})<#D.holders,"capacity 1 holders still fit 1.0; capacity <1 would not")
assert(#H.fitting({{weight=1.5,fullType="a"},{weight=1.5,fullType="b"}})<#H.fitting({{weight=0.5,fullType="a"},{weight=0.5,fullType="b"}}),"heavier set, fewer holders")
-- The pick is a function of seed + id alone: identical again (reload/relocation).
local pcs=H.pieces(set(sets[1]))
for n=1,100 do assert(H.pick(777,"t0005-01#"..n,pcs).id==H.pick(777,"t0005-01#"..n,H.pieces(set(sets[1]))).id,"same pick twice") end
local differs=false
for n=1,60 do if H.pick(1,"x"..n,pcs).id~=H.pick(2,"x"..n,pcs).id then differs=true end end
assert(differs,"another world seed picks differently")
print("set holders: fit rule, spread and determinism hold")

-- Fakes: items with mod data, containers with item lists.
local function mk(md,inner)
    local it={md=md}
    function it:getModData() return self.md end
    if inner then it.inner=inner; function it:getInventory() return self.inner end end
    return it
end
local function box(list)
    local c={list=list}
    function c:getItems() return {size=function() return #list end,get=function(_,i) return list[i+1] end} end
    return c
end
local T="tok"
local function piece(n) return mk({cfGeneratedId="s",cfPhysicalToken=T,cfPiece=n}) end
local function holder(pieces) return mk({cfGeneratedId="s",cfPhysicalToken=T,cfHolder=true},box(pieces)) end

-- Moves whole: holder with every piece inside; not with a piece loose or missing.
local full=H.shape(box({holder({piece(1),piece(2)})}),T)
assert(full.holder and full.inside==2 and full.loose==0 and H.movesWhole(full,2),"holder with both pieces moves")
local lost=H.shape(box({holder({piece(1)})}),T)
assert(not H.movesWhole(lost,2),"a piece taken out of the holder: stays")
local splitShape=H.shape(box({holder({piece(1)}),piece(2)}),T)
assert(not H.movesWhole(splitShape,2),"a piece lying loose beside the holder: stays")
assert(not H.movesWhole(H.shape(box({holder({piece(1),piece(2)}),holder({})}),T),2),"two holders: ambiguous, stays")
assert(not H.movesWhole(H.shape(box({holder({})}),T),2),"an empty holder: stays")
-- Old save: pieces loose, no holder; the plain rule.
local old=H.shape(box({piece(1),piece(2)}),T)
assert(old.holder==nil and H.movesWhole(old,2),"an old-save set (no holder) still moves whole")
assert(not H.movesWhole(H.shape(box({piece(1)}),T),2),"an old-save set missing a piece stays")
-- Other tokens are not ours.
assert(H.shape(box({mk({cfPhysicalToken="other"})}),T).loose==0)

-- Counting: pieces only, unless the caller asks whether ANYTHING is there.
function instanceof(it,cls) return cls=="InventoryContainer" and it.inner~=nil end
local World=require("NHShared/WorldAccess")
local function count(c,limit,with)
    local n; local scan=World.count(c,T,function(v) n=v end,limit,with)
    for _=1,200 do if scan() then break end end
    return n
end
local setBox=box({holder({piece(1),piece(2),piece(3)})})
assert(count(setBox,3)==3,"a holder set counts as its pieces, not pieces+1")
assert(count(box({piece(1),piece(2),piece(3)}),3)==3,"a loose (old) set counts the same")
assert(count(box({holder({})}),1)==0,"an empty holder is no piece")
assert(count(box({holder({})}),1,true)==1,"but the hint and carry checks do see a holder")
assert(count(box({holder({piece(1)})}),1,true)==1 or count(box({holder({piece(1)})}),2,true)==2,"holder plus piece with holders counted")
-- Identity scan: same.
local function scanOf(c)
    local out
    local player={getInventory=function() return c end,getX=function() return 0 end,getY=function() return 0 end,getZ=function() return 0 end,getVehicle=function() return nil end}
    getCell=function() return {getGridSquare=function() return nil end} end
    local s=World.identityScan(player,{s={physicalToken=T}},function(r) out=r end,{s=3})
    for _=1,2000 do if s() then break end end
    return out.s
end
assert(#scanOf(box({holder({piece(1),piece(2),piece(3)})}))==3,"the identity scan finds 3 pieces in a holder set, no conflict")
assert(#scanOf(box({piece(1),piece(2),piece(3)}))==3,"and in a loose old set")
print("set holders: counting and whole-set rules hold")

-- Wrap: build the holder with pieces inside, or leave them loose.
local runtime=read("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
local wrapSrc=runtime:match("local function wrapInHolder.-\nend\n")
assert(wrapSrc,"wrapInHolder found")
local made
local function fakeItem()
    local it={md={}}
    function it:getModData() return self.md end
    return it
end
local function load(code,env)
    if setfenv then local fn=assert(loadstring(code)); setfenv(fn,env); return fn() end
    return assert(load(code,nil,"t",env))()
end
local function env(refuse)
    return setmetatable({Holders=H,pcall=pcall,ipairs=ipairs,type=type,instanceItem=function(t)
        if t=="none" then return nil end
        local h=fakeItem(); h.type=t; local list={}
        local inv={list=list}
        function inv:AddItem(p) if refuse and #self.list>=refuse then return nil end self.list[#self.list+1]=p return p end
        function inv:Remove(p) for i,v in ipairs(self.list) do if v==p then table.remove(self.list,i) break end end end
        function h:getInventory() return inv end
        made=h; return h
    end},{__index=_G})
end
local wrap=load(wrapSrc.."\nreturn wrapInHolder",env())
local ps={fakeItem(),fakeItem()}
local out=wrap(ps,"s",T,"Base.Bag_Schoolbag")
assert(#out==1 and out[1]==made and #made:getInventory().list==2,"pieces are inside the holder, only the holder is placed")
local m=out[1].md; assert(m.cfHolder==true and m.cfGeneratedId=="s" and m.cfPhysicalToken==T,"holder carries the clue identity")
assert(wrap(ps,"s",T,"none")==ps,"no holder made: pieces stay loose")
assert(wrap(ps,"s",T,nil)==ps,"no holder chosen: pieces stay loose")
assert(wrap({fakeItem()},"s",T,"Base.Bag_Schoolbag")~=nil and #wrap({fakeItem()},"s",T,"Base.Bag_Schoolbag")==1)
local w1={fakeItem()}; assert(wrap(w1,"s",T,"Base.Bag_Schoolbag")==w1,"a single piece gets no holder")
local wrapRefuse=load(wrapSrc.."\nreturn wrapInHolder",env(1))
local ps2={fakeItem(),fakeItem()}
assert(wrapRefuse(ps2,"s",T,"Base.Bag_Schoolbag")==ps2 and #made:getInventory().list==0,"a holder that refuses a piece is abandoned whole")

-- Wiring in the runtime, in order.
local function has(needle,msg) assert(runtime:find(needle,1,true),msg or needle) end
has("Holders.pick(R.worldSeed(),id,pieces,Holders.targetFits(current))","placement picks the holder from world seed and clue id")
assert(not runtime:find('CFLog.write("i","holder"',1,true),"CFLog.write only takes events the log knows; an unknown one throws mid-placement (seen in the first real run)")
has('log("holder "..tostring(pick.id)',"the holder is noted in the case log")
has("md.cfPiece=#createdItems+1","pieces are numbered on placement")
has("md.cfPiece=#newItem+1","and on relocation")
local mover=runtime:match("local id,site,scan,target,oldContainer.-\nend\n")
has("Holders.movesWhole(shape,expectedCount(api,id))")
assert(mover:find("Holders.movesWhole",1,true)<mover:find("oldContainer:Remove",1,true),"the whole-set check comes before anything moves")
assert(mover:find("World.count(p:getInventory(),a.physicalToken,function(n) carryCount=n; carryDone=true end,1,true)",1,true),"a carried holder blocks a move")
has("getFullType","relocation keeps the same kind of holder")
local cue=read("mod-nohelp/common/media/lua/client/NHShared/ClueCue.lua")
assert(cue:find("clue.token,function(n) found=n end,1,true)",1,true),"the hint also sees a holder")
-- Caption once per set.
assert(H.shouldSpeak("holder",true) and H.shouldSpeak("plain",true) and H.shouldSpeak("inside",false),"holder and loose piece speak")
assert(not H.shouldSpeak("inside",true),"a piece inside its holder is silent once the set has spoken")
local inPiece=mk({cfGeneratedId="s",cfPhysicalToken=T}); function inPiece:getContainer() return {getContainingItem=function() return holder({}) end} end
assert(H.roleOf(inPiece)=="inside" and H.roleOf(holder({}))=="holder" and H.roleOf(piece(1))=="plain")
has("Holders.shouldSpeak(Holders.roleOf(item),captioned[doc.id]==true)")
print("set holders: placement, relocation, hint and caption wiring hold")

-- TARGET fit, owner algorithm: draw; if too big for the target, redraw from strictly smaller ones.
local pcs2=H.pieces(set({"Notebook","WaterBottle"}))
local function target(cap,used) return {getCapacity=function() return cap end,getContentsWeight=function() return used end} end
local room,cap=H.roomOf(target(5,1))
assert(room==4 and cap==5 and H.roomOf({ground=true})==nil,"room is capacity less contents; ground is unlimited")
assert(H.targetFits({ground=true})==nil,"ground has no test: the first draw stands")
-- Ground / roomy target: first draw always, attempt 0, identical to the unlimited pick.
for n=1,200 do
    local h,att=H.pick(3,"gr"..n,pcs2,nil)
    assert(att==0,"ground accepts the first draw")
    local h2,att2=H.pick(3,"gr"..n,pcs2,H.targetFits(target(500,0)))
    assert(h2.id==h.id and att2==0,"a roomy target accepts the first draw too")
end
-- Small target (glovebox 5, empty): never a holder too big for it; retries strictly smaller.
local fitsGlove=H.targetFits(target(5,0))
local retried,distinct=0,{}
for n=1,600 do
    local first=H.pick(5,"g"..n,pcs2,nil)
    local seen={}
    local h,att=H.pick(5,"g"..n,pcs2,function(c,total) seen[#seen+1]=c; return fitsGlove(c,total) end)
    assert(h,"a small holder exists for the glovebox")
    assert(h.capacity<=5 and h.weight+1.0<=5,"too-big never placed into a small target: "..h.id)
    for k=2,#seen do
        local a,b=seen[k-1],seen[k]
        assert(b.capacity<a.capacity or (b.capacity==a.capacity and b.weight<=a.weight),"every retry is smaller")
        assert(b.id~=a.id,"and a different holder")
    end
    assert(#seen==att+1,"one test per draw")
    if att>0 then retried=retried+1 end
    distinct[h.id]=true
    local again=H.pick(5,"g"..n,pcs2,fitsGlove)
    assert(again.id==h.id,"same result again (reload)")
    assert(first.capacity>=h.capacity,"the result is never bigger than the first draw")
end
assert(retried>50,"big first draws really are redrawn: "..retried)
-- Terminates when nothing fits: pieces loose.
local calls=0
assert(H.pick(1,"none",pcs2,function() calls=calls+1; return false end)==nil,"if even the smallest does not fit: loose")
assert(calls<=#H.fitting(pcs2),"the loop ends: every redraw is from a smaller pool")
assert(H.pick(1,"tiny",pcs2,H.targetFits(target(1,0.9)))==nil,"a nearly full target takes nothing")
local c=0 for _ in pairs(distinct) do c=c+1 end
assert(c>=5,"small target still draws variety: "..c)
local roomy={}
for n=1,300 do roomy[H.pick(9,"r"..n,pcs2,nil).id]=true end
c=0 for _ in pairs(roomy) do c=c+1 end
assert(c>=40,"a roomy target still allows many holders: "..c)
print("set holders: target fit holds")
