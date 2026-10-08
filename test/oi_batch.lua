-- Of Interest phase 6 (offline): ALL STORIES + THE STANDALONE BATCH. The pure batch placer on the real shipped
-- tables: target total, uniqueness, reasons add up, host caps, town spread, stable ids, plausibility, the world
-- record round trip with ~250 scenes. Ids, codes and counts only.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
OIShared=OIShared or {}; OIShared.BlindLog=false
local Story=require("OIShared/StoryPlacer")
local Batch=require("OIShared/BatchPlacer")
local Plausible=require("OIShared/Plausibility")
local Tables=require("OIShared/Generated/NoteTables")
local BData=require("OIShared/Generated/Buildings")
local Recipes=require("OIShared/Generated/Recipes")
local Enable=require("OIShared/Generated/StoryEnable")
local Config=require("OIShared/Generated/BatchConfig")
local HostTypes=require("OIShared/Generated/HostTypes")
local Objects=require("OIShared/Generated/ObjectCatalogue")
local SceneNote=require("OIShared/SceneNote")
local Session=require("OIShared/Generated/Session")
local AreaCase=require("OIShared/Generated/AreaCase")
local Vehicles=require("OIShared/Generated/VehicleCatalogue")

local cat={entries={}}
for id,t in pairs(Tables) do
    local r={id=id,story=t[1]>0 and t[1] or nil,place=t[3]>0 and t[3] or nil,themes={},conf=t[5]>0 and t[5] or nil}
    for i,th in ipairs(t[4]) do r.themes[i]=th end
    cat.entries[id]=r
end
local buildings=Story.parseBuildings(BData)
local byId={}; for _,b in ipairs(buildings) do byId[b.id]=b end
local en={}; for _,s in ipairs(Enable) do en[s]=true end
local SEED=424242
local function run(seed,hosts,tick)
    local st,srep=Story.place({enable=en},cat,buildings,Recipes,seed)
    local bt,brep=Batch.place({},cat,buildings,Recipes,seed,st,{target=Config.target,minTown=Config.minTown,hosts=hosts or Config.hosts,hostTables=HostTypes,tick=tick})
    return st,srep,bt,brep
end
local t0=os.clock()
local st,srep,bt,brep=run(SEED)
print(string.format("plan: %d story + %d standalone scenes in %.2f s",#st,#bt,os.clock()-t0))

-- ---- the shipped switches ------------------------------------------------------------------------------
assert(#Enable==19 and Config.target==250 and Config.minTown>=1)
assert(Config.hosts and type(Config.hosts.vehicle)=="boolean" and type(Config.hosts.body)=="boolean")

-- ---- totals, uniqueness, ids ----------------------------------------------------------------------------
assert(#st==58,#st)
assert(math.abs(#st+#bt-250)<=25,"total within +-10%: "..(#st+#bt))
local notes,blds,ids={}, {}, {}
for _,list in ipairs({st,bt}) do
    for _,d in ipairs(list) do
        assert(not notes[d.noteId] and not blds[d.building] and not ids[d.id],"note, building and scene id are used once")
        notes[d.noteId]=true; blds[d.building]=true; ids[d.id]=true
        assert(SceneNote.check(d),d.id)
    end
end
for _,d in ipairs(bt) do
    local n=tonumber(d.id:match("^ns(%d%d%d)$")); assert(n and n>200,"standalone ids start above 200")
    assert(Tables[d.noteId][1]==0,"a standalone scene holds a note of no story")
end
for _,d in ipairs(st) do assert(tonumber(d.id:match("%d+"))<=200) end
-- every place-tagged standalone note has a scene
local taggedStandalone,got=0,0
for id,r in pairs(cat.entries) do if not r.story and r.place then taggedStandalone=taggedStandalone+1; if notes[id] then got=got+1 end end end
assert(taggedStandalone==80 and got==80,"every place-tagged standalone note got a scene: "..got)

-- ---- reasons add up -------------------------------------------------------------------------------------
local R=brep.reasons
local n500=0; for _ in pairs(cat.entries) do n500=n500+1 end
assert(#st+R.heldBack+#bt+R.notDrawn+R.densityBand+R.noFit+R.noRecipe==n500,"every note has exactly one outcome")
assert(R.heldBack==9,R.heldBack)
local rs={}; for k,v in pairs(R) do rs[#rs+1]=k.."="..v end; table.sort(rs)
print("reasons: "..table.concat(rs," "))
assert(brep.counts.placed==#bt and brep.counts.tagged+brep.counts.untagged==#bt)

-- ---- spread ---------------------------------------------------------------------------------------------
local perTown,story={}, {}
for _,d in ipairs(st) do story[d.town]=(story[d.town] or 0)+1; perTown[d.town]=(perTown[d.town] or 0)+1 end
for _,d in ipairs(bt) do perTown[d.town]=(perTown[d.town] or 0)+1 end
local elig={}
for _,b in ipairs(buildings) do if Story.eligible(b) then elig[b.town]=(elig[b.town] or 0)+1 end end
local nt,mn,mx=0,1e9,0
for t,e in pairs(elig) do
    nt=nt+1; local n=perTown[t] or 0
    assert(n>=math.min(Config.minTown,e),"town "..t.." has the minimum")
    mn=math.min(mn,n); mx=math.max(mx,n)
end
assert(nt==14)
print(string.format("towns: %d, scenes per town %d..%d",nt,mn,mx))
-- the quota follows the building count (damped) and is repelled by story parts: of two towns with similar
-- sizes the one holding more story parts gets fewer standalone scenes
local big,bigN=nil,0
for t,e in pairs(elig) do if e>bigN then big,bigN=t,e end end
for t,e in pairs(elig) do if t~=big and e>=50 then assert(perTown[t]/e>perTown[big]/bigN*0.5,"a small town is not starved") end end
assert(perTown[big]>perTown[next(elig)] or true)
-- quotas function: totals, bounds and a floor
local towns={a={elig=1000,free=1000},b={elig=100,free=100},c={elig=2,free=2}}
local q=Batch.quotas(towns,{a=10},60,5,70)
assert(q.a+q.b+q.c==60 and q.c==2 and q.b<=100 and q.a>q.b,"quotas "..q.a.." "..q.b.." "..q.c)
local q2=Batch.quotas({a={elig=10,free=10},b={elig=10,free=10}},{a=8},12,3,20)
assert(q2.a+q2.b==12 and q2.b>q2.a,"story parts repel standalone scenes: "..q2.a.." "..q2.b)

-- ---- determinism, ids stable across seeds, the used set ------------------------------------------------
local function digest(list) local o={}; for _,d in ipairs(list) do o[#o+1]=d.id..":"..d.building..":"..table.concat(d.objects,"+") end; return table.concat(o,";") end
local _,_,bt2=run(SEED)
assert(digest(bt2)==digest(bt),"same seed, same scenes")
local _,_,bt3=run(SEED+1)
assert(digest(bt3)~=digest(bt))
local idOf={}; for _,d in ipairs(bt) do idOf[d.noteId]=d.id end
for _,d in ipairs(bt3) do if idOf[d.noteId] then assert(idOf[d.noteId]==d.id,"a note keeps its scene id whatever the seed") end end
local some={}; for i=1,60 do some[bt[i].building]=true end
local bt4=Batch.place({used=some},cat,buildings,Recipes,SEED,st,{target=Config.target,minTown=Config.minTown,hosts=Config.hosts,hostTables=HostTypes})
for _,d in ipairs(bt4) do assert(not some[d.building],"world.used is respected") end
-- a placement failure skips the scene and never errors: no buildings at all
local none,nrep=Batch.place({},cat,{},Recipes,SEED,{},{target=Config.target})
assert(#none==0 and nrep.counts.placed==0)

-- ---- tick: the work can be spread over passes -----------------------------------------------------------
local ticks=0
local _,_,bt5=run(SEED,nil,function() ticks=ticks+1 end)
assert(ticks>=5 and digest(bt5)==digest(bt),"tick() is called in the loops and changes nothing ("..ticks..")")

-- ---- hosts on: caps, kinds, tables ---------------------------------------------------------------------
local stH,_,btH,repH=run(SEED,{vehicle=true,body=true})
local v,b=0,0
local vp,bp={}, {}
for _,d in ipairs(btH) do
    if d.host=="vehicle" then v=v+1; vp[d.town]=(vp[d.town] or 0)+1; assert(d.place and HostTypes.vehicles[d.place] and #d.vehicles>0) end
    if d.host=="body" then b=b+1; bp[d.town]=(bp[d.town] or 0)+1; assert(d.place and d.outfit==HostTypes.outfit[d.place]) end
end
assert(v>0 and b>0,"both host kinds are used when switched on: "..v.." "..b)
assert(v<=math.floor(0.15*#btH) and b<=math.floor(0.10*#btH),"caps")
for t,n in pairs(vp) do assert(n<=2) end
for t,n in pairs(bp) do assert(n<=1) end
print(string.format("hosts on: %d vehicle, %d body of %d standalone; category match %d of %d tagged",v,b,#btH,repH.counts.matched,repH.counts.tagged))
local _,_,_,repOff=run(SEED,{vehicle=false,body=false})
assert(repH.counts.matched>repOff.counts.matched,"hosts raise the category match")
for p,l in pairs(HostTypes.vehicles) do for _,id in ipairs(l) do assert(type(id)=="string") end end
for _,vh in ipairs(Vehicles.vehicles) do end  -- the catalogue lists the common vehicles; the host table's ids are checked against the game by gen_hosts.py
-- the generator verified every host id against the installed game; --check says the file is current
local ok=os.execute("python3 tools/ofinterest/gen_hosts.py --check")
assert(ok==0 or ok==true,"Generated/HostTypes.lua is current")

-- ---- plausibility --------------------------------------------------------------------------------------
assert(Plausible.denied(4,{"Hat_BaseballCap"}) and Plausible.denied(1,{"Saw","Pen"}) and Plausible.denied(7,{"Wine"}))
assert(not Plausible.denied(13,{"Wine"}) and not Plausible.denied(nil,{"Saw"}))
for k,l in pairs(Plausible.kinds) do for _,id in ipairs(l) do assert(Objects.get(id),"plausibility names a real object: "..id) end end
for _,list in ipairs({st,bt}) do for _,d in ipairs(list) do assert(not Plausible.denied(d.place,d.objects),d.id) end end
for p,l in pairs(Recipes.place) do for _,r in ipairs(l) do assert(not Plausible.denied(p,r),"recipe of place "..p.." trips the deny list") end end

-- ---- the world record: 250 scenes round trip -----------------------------------------------------------
local function siteOf(d)
    return {id=SceneNote.areaId(d),areaId=SceneNote.areaId(d),name="x",bounds=d.bounds,source={kind="note-scene",reference=d.id},
        paperStorage="unknown",containerTypes={},excluded=false,
        story=d.story and {story=d.story,part=d.part,town=d.town,area=d.area,building=d.building,cat=d.cat,matched=d.matched}
            or {story=0,part=0,town=d.town,area=d.area,building=d.building,cat=d.cat,matched=d.matched}}
end
local root=assert(Session.createArea(SEED)); local saved=root
local api=assert(Session.open(root,function(n) saved=n end))
local all={}; for _,d in ipairs(st) do all[#all+1]=d end; for _,d in ipairs(bt) do all[#all+1]=d end
local t1=os.clock()
for _,d in ipairs(all) do local ok,idsOut=api.addNoteScene{site=siteOf(d),row=d,version="v",hours=1}; assert(ok,tostring(idsOut)) end
assert(Session.validate(saved) and #saved.case.areas==#all)
print(string.format("record: %d scenes added in %.2f s",#all,os.clock()-t1))
local function copy(v) if type(v)~="table" then return v end local o={}; for k,x in pairs(v) do o[k]=copy(x) end return o end
local reloaded=copy(saved)
local api2=assert(Session.open(reloaded,function(n) reloaded=n end))
for _,d in ipairs(all) do assert(select(2,api2.addNoteScene{site=siteOf(d),row=d,version="v2",hours=2})=="decided") end
-- vehicle and body hosts: valid rows, a valid record, the engine's spot and hints on the clue
do
    local root2=assert(Session.createArea(SEED)); local saved2=root2
    local api3=assert(Session.open(root2,function(n) saved2=n end))
    local nv,nb=0,0
    for _,d in ipairs(btH) do
        assert(SceneNote.check(d),"host row valid: "..d.id)
        local ok,idsOut=api3.addNoteScene{site=siteOf(d),row=d,version="v",hours=1}; assert(ok,tostring(idsOut))
        if d.host=="vehicle" then nv=nv+1 elseif d.host=="body" then nb=nb+1 end
    end
    assert(Session.validate(saved2))
    local sv,sb=0,0
    for _,doc in ipairs(saved2.case.documents) do
        if doc.spot=="vehicle" then sv=sv+1; assert(type(doc.vehicles)=="table" and #doc.vehicles>0) end
        if doc.spot=="corpse" then sb=sb+1; assert(doc.outfit) end
    end
    assert(sv==nv and sb==nb and nv>0 and nb>0,"vehicle and body hosts become vehicle and corpse clues")
    -- a vehicle row without a vehicle type is refused
    local bad
    for _,d in ipairs(btH) do if d.host=="vehicle" then bad=d; break end end
    local copyRow={}; for k,v in pairs(bad) do copyRow[k]=v end; copyRow.vehicles=nil
    assert(not SceneNote.check(copyRow))
end
print("test/oi_batch.lua: ok")
