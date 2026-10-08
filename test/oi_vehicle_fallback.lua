-- Of Interest phase 7 (B), offline: the vehicle-host fallback. A vehicle-hosted note scene whose vehicle is not
-- there when the survivor arrives moves ONCE to the nearest free building within 60 tiles (category preferred,
-- else ordinary), never onto a building another scene holds, keeps its token and note id, is found once and is
-- stable across a save and reload; with no free building it stays pending. Fakes only; ids and counts.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
OIShared=OIShared or {}; OIShared.BlindLog=false
local VF=require("OIShared/VehicleFallback")
local Placer=require("OIShared/StoryPlacer")
local Session=require("OIShared/Generated/Session")
local SceneNote=require("OIShared/SceneNote")
local Scenes=require("OIShared/Generated/Scenes")
local F=require("OIShared/NoteForcer")
local Inventory=require("oi_inventory")

local function bld(id,x,y,cat) return {id=id,x=x,y=y,x2=x+10,y2=y+10,cx=x+5,cy=y+5,area=1,town=1,cat=cat or 0} end
-- ---- choosing: nearest, category first, within 60, never a used one
local list={bld("b1",100,100,0),bld("b2",130,100,0),bld("b3",100,150,5),bld("b4",100,200,0),bld("b5",400,400,5)}
local b,d,m=VF.pick(list,{},100,100,5); assert(b.id=="b3" and m==true,"category building within 60 preferred over a nearer ordinary one: "..tostring(b and b.id))
b,d,m=VF.pick(list,{b3=true},100,100,5); assert(b.id=="b1" and m==false,"else the nearest ordinary one")
b=VF.pick(list,{b1=true,b3=true},100,100,5); assert(b.id=="b2")
local none,why=VF.pick(list,{b1=true,b2=true,b3=true},100,100,5); assert(none==nil and why=="none","none free within 60: stays pending")
assert(VF.pick(list,{},100,100,nil).id=="b1","no wanted category: ordinary")
assert(VF.pick(list,{},1000,1000,5)==nil,"nothing within 60")
assert(VF.pick({{id="tiny",x=0,y=0,x2=2,y2=2,cx=1,cy=1,cat=0}},{},0,0,0)==nil,"a building too small is not a host")
local s1=VF.site({id="note:ns900",bounds={x1=0,y1=0,x2=5,y2=5,z=0},batch={host="vehicle",building="b0"}},list[1],false)
assert(s1.id=="note:ns900:fb" and s1.batch.host=="building" and s1.batch.fallback==1 and s1.batch.building=="b1" and s1.bounds.x1==100)
assert(VF.allowed("Base.Van",{"Van","Pickup"}) and VF.allowed("Van",{"Van"}) and not VF.allowed("Base.Bus",{"Van"}))

-- ---- the world record: two vehicle scenes
local base=Scenes.rows[1]
local function vrow(id,note) return {id=id,noteId=note,place=5,objects=base.objects,where={kind="vehicle"},vehicles={"Van","PickUp"}} end
local rows={vrow("ns900","Note/0010"),vrow("ns901","Note/0011")}
local function vsite(r,b0) return {id=SceneNote.areaId(r),bounds={x1=b0.x,y1=b0.y,x2=b0.x2,y2=b0.y2,z=0},paperStorage="unknown",containerTypes={},
    batch={host="vehicle",building=b0.id,cat=0}} end
local root=assert(Session.createArea(4243)); local saved=root
local api=assert(Session.open(root,function(n) saved=n end))
local anchors={bld("a0",0,0,0),bld("a1",20,0,0)}
local ids={}
for i,r in ipairs(rows) do
    assert(SceneNote.check(r)); local ok,got=api.addNoteScene{site=vsite(r,anchors[i]),row=r,version="v",hours=6}; assert(ok,tostring(got)); ids[i]=got[1]
end
local function docOf(id) for _,x in ipairs(saved.case.documents) do if x.id==id then return x end end end
assert(docOf(ids[1]).spot=="vehicle" and docOf(ids[1]).vehicles[1]=="Van")
-- the runtime's used set: every building a location holds
local function usedSet(root)
    local used={}
    for _,l in ipairs(root.case.locations) do
        if type(l.story)=="table" and l.story.building then used[l.story.building]=l.id end
        if type(l.batch)=="table" and l.batch.building then used[l.batch.building]=l.id end
    end
    return used
end
local buildings={bld("n1",10,10,0),bld("n2",40,10,0),bld("n3",70,10,0)}
local function locOf(id) for _,l in ipairs(saved.case.locations) do if l.id==saved.assignments[id].locationId then return l end end end

-- the first scene moves: nearest free building, not its own anchor, not twice
local used=usedSet(saved); assert(used.a0 and used.a1)
local pick1,_,matched1=VF.pick(buildings,used,2,2,5); assert(pick1.id=="n1")
assert(api.moveWaiting(ids[1],VF.site(locOf(ids[1]),pick1,matched1),10),"first move")
assert(saved.assignments[ids[1]].fallback==1 and saved.assignments[ids[1]].locationId=="note:ns900:fb" and saved.assignments[ids[1]].deferredHours==10)
assert(Session.validate(saved),"the record is valid after the move")
assert(saved.assignments[ids[1]].status=="deferred","still waiting, to be created on arrival at the building")
-- once only
local pick1b=VF.pick(buildings,usedSet(saved),2,2,5); assert(pick1b.id=="n2","the building is now taken")
local okTwice,whyTwice=api.moveWaiting(ids[1],VF.site(locOf(ids[1]),pick1b,false),11); assert(not okTwice and whyTwice=="a scene moves once")
-- only a waiting vehicle note scene moves
assert(not api.moveWaiting("nonsense",VF.site(locOf(ids[1]),pick1b,false),11))
-- the second scene: never the first one's building
local pick2=VF.pick(buildings,usedSet(saved),22,2,5); assert(pick2.id=="n2" and pick2.id~=pick1.id)
assert(api.moveWaiting(ids[2],VF.site(locOf(ids[2]),pick2,false),12))
local u2=usedSet(saved); local n=0; for _ in pairs(u2) do n=n+1 end; assert(n==4,"four buildings, none twice: "..n)
local seenB={}; for _,l in ipairs(saved.case.locations) do local bb=l.batch and l.batch.building; if l.id:find(":fb",1,true) then assert(not seenB[bb],"building twice"); seenB[bb]=true end end
-- all taken: stays pending, nothing changes
local nl=#saved.case.locations
local third=VF.pick(buildings,{n1=true,n2=true,n3=true},50,2,5); assert(third==nil)
assert(#saved.case.locations==nl)

-- the clue goes on the ground at the building; a vehicle target is no longer its spot
local fb=locOf(ids[1]); local bx,by=fb.bounds.x1+2,fb.bounds.y1+2
local ground={x=bx,y=by,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true}
local vehicleT={x=bx,y=by,z=0,objectIndex=0,containerIndex=0,containerType="vehicle",sprite="Van",vehiclePart="TruckBed"}
assert(not api.assign(ids[1],vehicleT,13),"a moved scene is no longer a vehicle clue")
assert(api.assign(ids[1],ground,13) and api.status(ids[1],"placing") and api.status(ids[1],"placed",14))
assert(Session.validate(saved))
-- the unmoved vehicle scene still wants a vehicle
assert(Session.effectiveDoc(docOf(ids[2]),{fallback=nil}).spot=="vehicle" and Session.effectiveDoc(docOf(ids[2]),saved.assignments[ids[2]]).spot=="ground")

-- same token and note id when the pieces are made again (relocation re-creates them)
local KNOWN={"Hospital","PoliceStation","Prison","Military","Farm","Church","School","Factory","GasStation","Laboratory","Library","Warehouse","Restaurant"}
local mods={["ItIsOfInterestToMe_UsedText"]={}}
local pool={}; for i=1,20 do pool[i]={id=string.format("%04d.txt",i),text="x"} end
local deps={registry={isRegistered=function(ft) return ft=="Base.Note" end,getOrAssignText=function() end,resolveTextById=function() end},categories=KNOWN,version="t",fingerprint="fp",
    poolFor=function(k) if k=="Note" then return pool end end,store=function(nm) mods[nm]=mods[nm] or {}; return mods[nm] end,log=function() end}
local function newItem() local md={}; local it={}; function it:getModData() return md end; function it:getFullType() return "Base.Note" end; return it end
local tok=saved.assignments[ids[1]].physicalToken
local member=SceneNote.noteMember(docOf(ids[1]))
local i1=newItem(); assert(SceneNote.forcePiece(i1,member,tok,deps))
local i2=newItem(); assert(SceneNote.forcePiece(i2,member,tok,deps),"the replacement item is forced under the same token")
assert(i1:getModData().iioitmTextId==i2:getModData().iioitmTextId and i2:getModData().oiToken==tok)
local recs=mods[F.RECORD]; local cnt=0; for _ in pairs(recs) do cnt=cnt+1 end
assert(cnt==1 and recs[tok].note==member.noteId and recs[tok].re==1,"one record, same id, one replacement counted")
local other=newItem(); assert(not SceneNote.forcePiece(other,SceneNote.noteMember(docOf(ids[2])) and {noteId=member.noteId} or member,"another-token",deps),"the id is never shared with another token")

-- found once
assert(api.recognise(ids[1],"search") and api.recognise(ids[1],"look"))
local seen=0; for _,x in ipairs(saved.recognised or {}) do if x==ids[1] then seen=seen+1 end end; assert(seen==1,"found once")

-- save and reload: identical, still moved once, still valid
local before=saved
local api2=assert(Session.open(before,function(nn) saved=nn end))
assert(Session.validate(saved) and saved.assignments[ids[1]].fallback==1 and saved.assignments[ids[1]].locationId=="note:ns900:fb")
local againOk=api2.moveWaiting(ids[2],VF.site(locOf(ids[2]),pick1b,false),20); assert(not againOk,"reload does not allow a second move")
assert(saved.assignments[ids[2]].fallback==1 and saved.assignments[ids[2]].locationId=="note:ns901:fb")
print("oi vehicle fallback: choice (category, nearest, 60 tiles, none free), once only, no building twice, same token/id, found once, reload stable pass")
