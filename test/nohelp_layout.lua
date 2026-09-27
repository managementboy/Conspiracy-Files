-- No Help, task 3 plan step 4 part 2: THE LETDOWN IN THE LAYOUT (owner,
-- 2026-09-27, "How a read map changes the game"). At a place a map or flyer
-- marks, clues that fit the map's promise sit nearest the way in, the other
-- side's deepest inside; a multi-mark map's last mark is an exact tie.
-- The rank only orders; it never refuses and never makes a clue wait, apart
-- from the bounded, logged hold for a fuller scan.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local Layout=require("NHShared/Generated/Layout")
local Choices=require("NHShared/Generated/StorageChoices")
local Pick=require("NHShared/Generated/Pick")
local AreaCase=require("NHShared/Generated/AreaCase")
local Sites=require("NHShared/Generated/MapSites")
local Trails=require("NHShared/Generated/Trails")

-- DEPTH. A building: inset from its bounds (x2/y2 exclusive), 0 at the edge;
-- the outdoor band is shallowest.
local b={x1=100,y1=200,x2=120,y2=220,z=0}
assert(Layout.inset(100,210,b)==0 and Layout.inset(119,210,b)==0,"the edge is depth 0")
assert(Layout.inset(110,210,b)==9,"the middle is deepest")
assert(Layout.inset(90,210,b)==0,"outside is clamped to 0")
local function spot(x,y,kind) return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType=kind or "counter",sprite="s"} end
assert(Layout.depth(spot(110,210,"postbox"),b)==0,"a mailbox is the outdoor band")
assert(Layout.depth({x=110,y=210,z=0,ground=true,containerType="floor"},b)==0,"open ground is the outdoor band")
assert(Layout.depth({x=110,y=210,z=0,vehiclePart="GloveBox",containerType="vehicle"},b)==0,"a vehicle is the outdoor band")
assert(Layout.depth(spot(110,210),b)==9,"furniture in the middle is deep")
-- A place that is not a building (a point or window around a mark): nearer
-- the mark is deeper, and the outdoor band is not special there.
local marks={{x=105,y=205},{x=118,y=218}}
assert(Layout.depth(spot(105,205),b,marks,true)>Layout.depth(spot(110,210),b,marks,true),"on the X is deeper")
assert(Layout.depth(spot(117,217),b,marks,true)==Layout.depth(spot(106,206),b,marks,true),"the nearest mark counts")
assert(Layout.depth({x=105,y=205,z=0,ground=true,containerType="floor"},b,marks,true)
    ==Layout.depth(spot(105,205),b,marks,true),"ground on the X is as deep as anything there")

-- RANK ORDERS: favoured shallow, the other side deepest.
local list={spot(100,205),spot(110,210),spot(104,204),spot(101,219,"postbox")}
local site={id="t3:x",bounds=b}
local trail={designs={"D"},favour="containment"}
local fav={lean="containment"}
local other={lean="agricultural"}
local function choose(doc,entry)
    local rank=Layout.ranker(doc,site,trail,entry)
    return Choices.choose(list,"salt",function() return true end,function(i) return rank(list[i]) end)
end
local shallow=Layout.depth(list[choose(fav)],b)
local deep=Layout.depth(list[choose(other)],b)
assert(shallow==0,"the favoured clue takes a shallow spot")
assert(deep==9 and list[choose(other)]==list[2],"the other side's clue takes the deepest spot")
-- At a mark point place, nearness to the mark decides.
local entry={kind="point",marks={{design="D",mark=1,x=104,y=204}}}
assert(list[choose(other,entry)]==list[3],"the other side's clue lies nearest the X")
assert(list[choose(fav,entry)]~=list[3],"the favoured clue lies away from it")
-- No lean, no rank: nothing changes where no map leans the place.
assert(Layout.ranker(fav,site,nil,nil)==nil and Layout.ranker(fav,site,{designs={"D"}},nil)==nil,"no favour, no rank")
-- NEVER REFUSES: a rank over a single usable spot still returns it, and the
-- rank never makes an unusable spot usable.
local one={spot(110,210)}
local rank=Layout.ranker(fav,site,trail,nil)
assert(Choices.choose(one,"s",function() return true end,function(i) return rank(one[i]) end)==1,"the only spot is still taken")
assert(Choices.choose(one,"s",function() return false end,function(i) return rank(one[i]) end)==nil,"and an unusable one never is")
-- Without a rank, choose is exactly what it was.
local plain=Choices.choose(list,"salt",function() return true end)
assert(Choices.choose(list,"salt",function() return true end,nil)==plain,"no rank, the same choice")

-- THE HOLD: the other side's clue waits for a fuller scan, bounded.
assert(not Layout.hold(fav,"containment",1,1),"the favoured clue never waits")
assert(Layout.hold(other,"containment",1,1),"the other side's clue waits while the scan saw few spots")
assert(not Layout.hold(other,"containment",Layout.HOLD_MIN_CANDIDATES,1),"not once the scan saw enough")
assert(not Layout.hold(other,"containment",1,Layout.HOLD_MAX_ATTEMPTS),"and never past the attempt limit")
assert(not Layout.hold(other,nil,1,1),"no lean, no hold")

-- The runtime uses it: the filler hands the rank to the scans and holds.
local function read(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local src=read("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
local filler=src:match("local function filler%(api%).-\nend\n")
assert(filler:find("local rank=layoutRank(root,doc,site)",1,true),"the filler ranks at a map place")
assert(filler:find("end,id,rank)",1,true),"the container scan is given the rank")
assert(filler:find("Layout.hold(doc,favour,seen,waited+1)",1,true) and filler:find('why="layout-hold"',1,true),
    "the hold is bounded and logged")
assert(src:find("StorageChoices.choose(list,salt or site.id,usable,",1,true),"boundsScan passes the rank to choose")

-- TIE MODE AT A MAP'S LAST MARK.
-- Which places are a last mark: only the highest-numbered mark of a map with
-- several marks.
local lastOf,count={}, {}
for _,e in ipairs(Sites.sites) do
    for _,m in ipairs(e.marks) do
        local d=m.design or ("print:"..m.print)
        count[d]=(count[d] or 0)+1
        if not lastOf[d] or m.mark>lastOf[d].mark then lastOf[d]={mark=m.mark,areaId=e.areaId} end
    end
end
local design
for d,n in pairs(count) do if n>1 and (not design or d<design) then design=d end end
assert(design,"the static list has a map with several marks")
local tiePlace,otherPlace
for _,e in ipairs(Sites.sites) do
    for _,m in ipairs(e.marks) do
        if (m.design or ("print:"..m.print))==design then
            if e.areaId==lastOf[design].areaId then tiePlace=e else otherPlace=otherPlace or e end
        end
    end
end
assert(tiePlace and otherPlace,"its last mark and another mark are different places")
local function designsOf(e)
    local out,seen={},{}
    for _,m in ipairs(e.marks) do
        local d=m.design or ("print:"..m.print)
        if not seen[d] then seen[d]=true; out[#out+1]=d end
    end
    return out
end
local seed=4242
local _,tieArgs=AreaCase.trailFor(seed,designsOf(tiePlace),tiePlace.areaId)
local _,otherArgs=AreaCase.trailFor(seed,designsOf(otherPlace),otherPlace.areaId)
assert(tieArgs.mode=="tie","the last mark's place is a tie")
assert(otherArgs.mode==nil,"the other marks are unchanged")
assert(AreaCase.trailFor(seed,designsOf(otherPlace),nil) and select(2,AreaCase.trailFor(seed,designsOf(otherPlace))).mode==nil,
    "without a place id, never a tie")

-- Pick in tie mode: an even number, both sides equal, over many areas.
local clues={}
for i=1,20 do
    local lean=i<=10 and "containment" or "agricultural"
    clues[i]={id=string.format("L%02d",i),kind="set",pieces={"Rope","Bleach"},
        where={{place="mapNamed",spot="furniture",lean=lean,rival=lean=="containment" and "agricultural" or "containment"}}}
end
local function leans(picks)
    local n={containment=0,agricultural=0}
    for _,p in ipairs(picks) do n[p.lean]=n[p.lean]+1 end
    return n
end
for k=1,60 do
    local area={id="tie:"..k,place="mapNamed"}
    for _,fv in ipairs({"containment","agricultural"}) do
        local picks=Pick.choose{clues=clues,area=area,seed=k,version="v",favour=fv,mode="tie",minCount=3}
        local n=leans(picks)
        assert(#picks%2==0 and #picks>=4,"a tie is even and at least the minimum, rounded up")
        assert(n.containment==n.agricultural,"a tie is exactly level")
        assert(#picks<=2*Pick.FIRST_DEVELOPMENT_CAP,"within the cap")
        assert(picks[1].lean==fv,"the map's side opens")
    end
end
-- One side runs out: the other stops level with it.
local short={clues[1],clues[2],clues[3],clues[11]}
local picks=Pick.choose{clues=short,area={id="tie:short",place="mapNamed"},seed=1,version="v",favour="containment",mode="tie",minCount=6}
local n=leans(picks)
assert(#picks==2 and n.containment==1 and n.agricultural==1,"a tie with one clue of a side is one each")
-- Without the new argument Pick is exactly what it was.
for k=1,30 do
    local a={clues=clues,area={id="same:"..k,place="mapNamed"},seed=k,version="v",favour="agricultural",rivalMin=2,minCount=4}
    local b2={clues=clues,area={id="same:"..k,place="mapNamed"},seed=k,version="v",favour="agricultural",rivalMin=2,minCount=4,mode=nil}
    local x,y=Pick.choose(a),Pick.choose(b2)
    assert(#x==#y,"no mode, the same picks")
    for i=1,#x do assert(x[i].clue==y[i].clue and x[i].lean==y[i].lean and x[i].copy==y[i].copy,"no mode, the same picks") end
end

-- Through AreaCase.decide, the last mark's place holds a tie; the other does not
-- have to.
local case=AreaCase.new(seed)
local function row(e)
    return {id=e.areaId,bounds=e.bounds}
end
local decided,ids=AreaCase.decide{case=case,site=row(tiePlace),place="mapNamed",designs=designsOf(tiePlace),clues=clues,version="v"}
assert(decided,"the last mark's place is decided: "..tostring(ids))
local nn={containment=0,agricultural=0}
for _,d in ipairs(decided.documents) do nn[d.lean]=nn[d.lean]+1 end
assert(nn.containment==nn.agricultural and #decided.documents%2==0,"decided as an exact tie")
assert(decided.areas[1].trail.favour==Trails.favour(seed,designsOf(tiePlace)[1]),"its lean is still the world's")
local valid,whyNot=AreaCase.validate(decided)
assert(valid,"and the record stays valid: "..tostring(whyNot))

print("nohelp layout: favoured shallow, other side deepest, never refused; bounded hold; last mark an exact tie")
