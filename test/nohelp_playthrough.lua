-- NH-step7: the offline playthrough check (task 3 plan, step 7).
--
-- Plain Lua 5.1. Loads the real pure modules (Pick, AreaCase, AreaPlace,
-- Trails, MapSites, MarkedArea, Session, StaleClue, VanillaScenes,
-- SceneMatch, Manifest) with a SYNTHETIC clue list - placeholder rows only,
-- no clue text, nothing that may be shipped or quoted - and walks seeded
-- routes over the shipped map and flyer places: dense town and rural, on foot
-- and driving, with map and flyer reads, nearby buildings, vanilla scenes
-- confirmed on the way, clues created on arrival, spotted or looked over,
-- and time passing so unfound clues move. Routes run with the
-- first-development cap on (as shipped, 12 world seeds) and lifted (8 more
-- seeds), one route per seed: 20 distinct seeds, every route kind in both
-- modes. The save is written out and read back at the end of every
-- route.
--
-- SPEED: every Session write copies and revalidates the whole record, so a
-- route costs about half a second (cap on) to a second (lifted) in plain Lua.
-- The seed counts are sized so the whole check stays well under 30 seconds;
-- every loop is bounded and a runaway one stops with a loud error.
--
-- WRITER/ENGINEER TEST: scene kinds and map places are drawn from the shipped
-- tables by index, never named here; the printed summary is counts only.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local STEP="NH-step7"
local D1,D4,D5,D6,D7="NH-D1","NH-D4","NH-D5","NH-D6","NH-D7"
local Pick=require("NHShared/Generated/Pick")
local AreaCase=require("NHShared/Generated/AreaCase")
local AreaPlace=require("NHShared/Generated/AreaPlace")
local Trails=require("NHShared/Generated/Trails")
local Sites=require("NHShared/Generated/MapSites")
local MarkedArea=require("NHShared/MarkedArea")
local S=require("NHShared/Generated/Session")
local StaleClue=require("NHShared/StaleClue")
local Scenes=require("NHShared/Generated/VanillaScenes")
local SceneMatch=require("NHShared/Generated/SceneMatch")
local Manifest=require("NHShared/Mystery/Manifest")

local SHIPPED_CAP=Pick.FIRST_DEVELOPMENT_CAP
assert(SHIPPED_CAP==5,STEP..": the shipped first-development cap is 5")
local LIFTED_CAP=1000
local CAP_ON_SEEDS,CAP_ON_ROUTES=12,1
local LIFTED_SEEDS,LIFTED_ROUTES=8,1
local SEEDS=CAP_ON_SEEDS+LIFTED_SEEDS
local TIME_LIMIT=30   -- seconds of CPU for the whole check: a hard failure
local T_START=os.clock()
-- A hard bound on a loop: counts one pass and errors loudly past the limit.
local function guard(counter,name,limit)
    counter.n=(counter.n or 0)+1
    if counter.n>limit then error(STEP..": runaway loop in "..name.." (over "..limit.." passes)",2) end
end
local function h(...) return Pick.hash(Pick.key({...})) end
local function other(l) return l=="containment" and "agricultural" or "containment" end
local LEANS=Manifest.LEANS

-- ---------------------------------------------------------------------------
-- THE SYNTHETIC CLUE LIST. Placeholder ids; real vanilla item types for set
-- pieces, the engine's written kinds for written clues.
-- ---------------------------------------------------------------------------
local SET_PIECES={{"Twine","Tarp"},{"Bleach","Gloves_Surgical","Paperclip"},{"Rope","Wire","Fertilizer","Notebook"},
    {"Tarp","Rope"},{"Wire","Paperclip"},{"Bleach","Bleach"},{"Fertilizer","Tarp","Twine"}}
local WRITTEN={"dispatch","receipt","letter","notepad","memo","photograph"}
local SPOTS=Manifest.SPOTS
local clues={}
local n=0
local function add(c) n=n+1; clues[#clues+1]=c; return c end
local function row(place,spot,lean) return {place=place,spot=spot,lean=lean,rival=other(lean)} end
-- Every kind of place, each lean: 4 sets and 3 written, spots rotating so
-- every spot hosts both leans. 7 different clues per place and lean, so a
-- lifted cap can go past 5 per lean.
for pi,place in ipairs(Manifest.PLACES) do
    for li,lean in ipairs(LEANS) do
        for k=1,7 do
            local isSet=k<=4
            local spot=SPOTS[((pi+li+k)%#SPOTS)+1]
            add({id=string.format("P%02d%s%d",pi,lean:sub(1,1),k),kind=isSet and "set" or "written",
                pieces=isSet and SET_PIECES[((pi+k)%#SET_PIECES)+1] or {WRITTEN[((pi+li+k)%#WRITTEN)+1]},
                where={row(place,spot,lean)}})
        end
    end
end
-- Anchored clues for a sample of map and flyer places: every 16th place in
-- the shipped list, anchored to its first mark; 4 sets and 2 written a lean.
local anchoredKeys={}
local sampleSites=0
for i,e in ipairs(Sites.sites) do
    if i%16==1 then
        local m=e.marks[1]
        local anchor=m.print and {print=m.print} or (m.mark and {map=m.design,mark=m.mark} or {map=m.design,note=m.note})
        local key=Manifest.anchorKey(anchor)
        if not anchoredKeys[key] then
            anchoredKeys[key]=true; sampleSites=sampleSites+1
            for li,lean in ipairs(LEANS) do
                for k=1,6 do
                    local isSet=k<=4
                    add({id=string.format("A%03d%s%d",i,lean:sub(1,1),k),kind=isSet and "set" or "written",
                        pieces=isSet and SET_PIECES[((i+k)%#SET_PIECES)+1] or {WRITTEN[((i+k)%#WRITTEN)+1]},
                        anchor={map=anchor.map,mark=anchor.mark,note=anchor.note,print=anchor.print},
                        where={row(e.place,SPOTS[((i+li+k)%#SPOTS)+1],lean)}})
                end
            end
        end
    end
end
-- Scene clues for a sample of scene kinds: every 9th kind that holds a clue,
-- plus one of each spot. A set for each lean and one written.
local allowed=Scenes.allowedKinds()
local sceneKinds,haveSpot={}, {}
for i,k in ipairs(allowed) do
    local spot=Scenes.spotFor(k)
    if i%9==1 or not haveSpot[spot] then sceneKinds[#sceneKinds+1]=k; haveSpot[spot]=true end
end
for si,kind in ipairs(sceneKinds) do
    local spot=Scenes.spotFor(kind)
    for _,lean in ipairs(LEANS) do
        add({id=string.format("C%02d%s",si,lean:sub(1,1)),kind="set",pieces=SET_PIECES[(si%#SET_PIECES)+1],
            anchor={scene=kind},where={row("farm",spot,lean)}})
    end
    add({id=string.format("C%02dw",si),kind="written",pieces={WRITTEN[(si%#WRITTEN)+1]},anchor={scene=kind},
        where={row("farm",spot,LEANS[(si%2)+1])}})
end
local refusedKind
for _,r in ipairs(Scenes.rows) do if r.refused and not refusedKind then refusedKind=r.id end end

for _,c in ipairs(clues) do
    local ok,why=Manifest.validClue(c); assert(ok,STEP..": synthetic clue refused: "..tostring(why))
end
assert(Manifest.lint(clues),STEP..": the synthetic list passes the clue-list rules")
local byId,listSets={},0
for _,c in ipairs(clues) do byId[c.id]=c; if c.kind=="set" then listSets=listSets+1 end end
assert(listSets*2>=#clues,STEP..": at least half the synthetic list is sets")

-- ---------------------------------------------------------------------------
-- The shipped map and flyer places, indexed the way the runtime reads them.
-- ---------------------------------------------------------------------------
local byDesign={}
local function designsOf(e)
    local out,seen={},{}
    for _,m in ipairs(e.marks or {}) do
        local d=m.design or (m.print and "print:"..m.print)
        if d and not seen[d] then seen[d]=true; out[#out+1]=d end
    end
    return out
end
local function ownMarksOf(e,designs)
    if e.kind~="area" or #designs~=1 then return nil end
    local out,seen={},{}
    for _,m in ipairs(e.marks or {}) do
        if m.design==designs[1] and m.mark and not seen[m.mark] then seen[m.mark]=true; out[#out+1]=m.mark end
    end
    return #out>=2 and out or nil
end
local function anchorsOf(e)
    local out,seen={},{}
    for _,m in ipairs(e.marks or {}) do
        local k=Manifest.markKey(m)
        if k and not seen[k] then seen[k]=true; out[#out+1]=k end
    end
    return out
end
local siteRow,siteInfo={},{}
for _,e in ipairs(Sites.sites) do
    local designs=designsOf(e)
    for _,d in ipairs(designs) do byDesign[d]=byDesign[d] or {}; table.insert(byDesign[d],e) end
    local b=e.bounds
    siteRow[e.areaId]={id=e.areaId,areaId=e.areaId,name="map place",bounds={x1=b.x1,y1=b.y1,x2=b.x2,y2=b.y2,z=b.z},
        paperStorage="unknown",containerTypes={},excluded=false}
    siteInfo[e.areaId]={entry=e,designs=designs,marks=ownMarksOf(e,designs),anchors=anchorsOf(e),
        points=MarkedArea.points(e.marks)}
end
local allDesigns={}
for d in pairs(byDesign) do allDesigns[#allDesigns+1]=d end
table.sort(allDesigns)

-- Chebyshev distance from a point to a rectangle (x2/y2 exclusive).
local function distRect(x,y,b)
    local dx=(x<b.x1 and b.x1-x) or (x>=b.x2 and x-b.x2+1) or 0
    local dy=(y<b.y1 and b.y1-y) or (y>=b.y2 and y-b.y2+1) or 0
    return math.max(dx,dy)
end

-- ---------------------------------------------------------------------------
-- A plain Lua serialiser for the save round-trip: sorted keys, integers as
-- digits, every string quoted. The engine's own ModData writer is a different
-- program; this only proves the record is plain data that reads back equal
-- and valid.
-- ---------------------------------------------------------------------------
local function ser(v,out)
    local t=type(v)
    if t=="string" then out[#out+1]=string.format("%q",v)
    elseif t=="number" then out[#out+1]=(v==math.floor(v) and math.abs(v)<2^53) and string.format("%d",v) or string.format("%.17g",v)
    elseif t=="boolean" then out[#out+1]=tostring(v)
    elseif t=="table" then
        local keys={}
        for k in pairs(v) do keys[#keys+1]=k end
        table.sort(keys,function(a,b)
            if type(a)~=type(b) then return type(a)<type(b) end
            return a<b
        end)
        out[#out+1]="{"
        for _,k in ipairs(keys) do out[#out+1]="["; ser(k,out); out[#out+1]="]="; ser(v[k],out); out[#out+1]="," end
        out[#out+1]="}"
    else error("unsaveable value of type "..t) end
end
local function serialise(v) local out={"return "}; ser(v,out); return table.concat(out) end
local function same(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,x in pairs(a) do if not same(x,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end

-- ---------------------------------------------------------------------------
-- Routes. A route is a list of stops (map places), walked or driven.
-- ---------------------------------------------------------------------------
local function centre(e) local b=e.bounds; return math.floor((b.x1+b.x2)/2),math.floor((b.y1+b.y2)/2) end
local function tour(seed,label,pool,stops,maxHop)
    local start=pool[1+h(seed,label,"start")%#pool]
    local out,used={start},{[start.areaId]=true}
    local cx,cy=centre(start)
    local g={}
    while #out<stops do
        guard(g,"tour",64)
        local best,bd
        for _,e in ipairs(pool) do
            if not used[e.areaId] then
                local x,y=centre(e)
                local d=math.max(math.abs(x-cx),math.abs(y-cy))+(h(seed,label,e.areaId)%40)
                if d<=maxHop and (not bd or d<bd) then best,bd=e,d end
            end
        end
        if not best then
            if #out>1 then break end
            maxHop=maxHop*2   -- an isolated start: look further for a second stop
        else
        out[#out+1]=best; used[best.areaId]=true; cx,cy=centre(best)
        end
    end
    return out
end
local townPool,ruralPool={},{}
for _,e in ipairs(Sites.sites) do
    if e.kind=="building" then townPool[#townPool+1]=e else ruralPool[#ruralPool+1]=e end
end
local ROUTES={
    {name="town-walk",pool=townPool,stops=4,speed=8,perHour=300,town=true},
    {name="town-drive",pool=townPool,stops=5,speed=40,perHour=1800,town=true},
    {name="rural-walk",pool=ruralPool,stops=3,speed=10,perHour=300,town=false},
    {name="rural-drive",pool=ruralPool,stops=3,speed=40,perHour=1800,town=false},
}
-- Nearby buildings the scan would offer: T3 categories through AreaPlace in
-- town, address-book kinds (farm, warehouse, government, checkpoint) in the
-- country. Homes and shops map to nothing and get no clues.
local TOWN_CATS={{"public-service"},{"medical"},{"office"},{"communications"},{"retail",{bookstore=true}},
    {"residential"},{"residential"},{"residential"},{"residential"},{"retail",{grocery=true}},{"restaurant"},{"residential"}}
local RURAL_PLACES={"farm","warehouse","government","checkpoint",false,false,false,false,false,false,false,false}

-- The worst single Pick call and the worst single write, in plain Lua on
-- this machine (not the game's Kahlua): a measure, never a pass mark.
local worst={pick=0,write=0}
do
    local choose=Pick.choose
    Pick.choose=function(args)
        local t=os.clock(); local a,b=choose(args)
        worst.pick=math.max(worst.pick,os.clock()-t); return a,b
    end
end
local function runRoute(seed,route,capOn)
    Pick.FIRST_DEVELOPMENT_CAP=capOn and SHIPPED_CAP or LIFTED_CAP
    local root=assert(S.createArea(seed))
    local saved=root
    local api=assert(S.open(root,function(nx) saved=nx end))
    do
        local add=api.addArea
        api.addArea=function(args)
            local t=os.clock(); local a,b=add(args)
            if a then worst.write=math.max(worst.write,os.clock()-t) end
            return a,b
        end
    end
    local st={moves=0,search=0,look=0,refusedMoves=0,refusedCross=0,refusedShown=0,refusedSpent=0,reads=0,scenesSeen=0,nearby=0,
        spotted=0,spottedSets=0,raisedMax=0,raisedMoves=0}
    local hours=7
    local px,py=centre(route.stopsList[1])
    local held,spentTargets,rolled,spotOf,siteOf={}, {}, {}, {}, {}
    local synthSites={}
    local lastScan={x=px,y=py,hours=hours}
    local lastMoveSlot=math.floor(hours/6)
    local sceneWait={}
    local moveCursor=0
    local steps=0

    local function docById(id)
        for _,d in ipairs(saved.case.documents) do if d.id==id then return d end end
    end
    local function rowOf(id) return siteRow[id] or synthSites[id] end
    local function decideMap(e,source)
        local info=siteInfo[e.areaId]
        local ok,ids=api.addArea{site=siteRow[e.areaId],place=e.place,designs=#info.designs>0 and info.designs or nil,
            marks=info.marks,anchors=info.anchors,clues=clues,version=Manifest.VERSION,hours=hours,source=source}
        if not ok then assert(ids=="decided",STEP..": a map place was not decided: "..tostring(ids)) end
    end
    local function scan()
        local k=0
        for i=1,1 do
            k=h(seed,route.name,steps,i,"nearby")
            local id="t3:syn:"..route.name..":"..steps..":"..i
            local ox,oy=15+k%30,-20+(math.floor(k/30))%40
            local b={x1=px+ox,y1=py+oy,x2=px+ox+12,y2=py+oy+10,z=0}
            local place
            if route.town then
                local cat=TOWN_CATS[1+k%#TOWN_CATS]
                place=AreaPlace.of(cat[1],cat[2])
            else
                place=RURAL_PLACES[1+k%#RURAL_PLACES] or nil
            end
            if place then
                local site={id=id,bounds=b,containerTypes={"shelves","postbox","vehicle"},paperStorage="observed"}
                synthSites[id]=site
                local ok,why=api.addArea{site=site,place=place,clues=clues,version=Manifest.VERSION,hours=hours,source="nearby"}
                assert(ok,STEP..": a nearby place was not decided: "..tostring(why))
                st.nearby=st.nearby+1
            end
        end
    end
    local function noteScene()
        local key=SceneMatch.keyAt(px,py,0)
        if saved.scenes and saved.scenes[key] and saved.scenes[key].kind then return end
        local refused=(h(seed,route.name,key,"refused")%12)==0
        local kind=refused and refusedKind or sceneKinds[1+h(seed,route.name,key,"kind")%#sceneKinds]
        -- First only a trace (pending), then the second trace confirms it.
        assert(api.noteScene(key,{pending={"room:trace"},x=px,y=py,z=0,hours=hours}))
        assert(api.noteScene(key,{kind=kind,x=px,y=py,z=0,hours=hours,source="seen"}))
        sceneWait[key]=true
        st.scenesSeen=st.scenesSeen+1
    end
    local function decideScenes()
        local rows={}
        for key,rec in pairs(saved.scenes or {}) do
            if rec.kind and sceneWait[key] and math.max(math.abs(rec.x-px),math.abs(rec.y-py))<=Scenes.NEAR_TILES then
                rows[#rows+1]={key=key,rec=rec,d=math.max(math.abs(rec.x-px),math.abs(rec.y-py))}
            end
        end
        table.sort(rows,function(a,b) if a.d~=b.d then return a.d<b.d end return a.key<b.key end)
        local r=rows[1]; if not r then return end
        sceneWait[r.key]=nil
        local site={id="scene:"..r.key,bounds={x1=r.rec.x,y1=r.rec.y,x2=r.rec.x+1,y2=r.rec.y+1,z=0},
            paperStorage="unknown",containerTypes={}}
        local ok,why=api.addSceneArea{site=site,key=r.key,kind=r.rec.kind,clues=clues,version=Manifest.VERSION,hours=hours}
        if r.rec.kind==refusedKind then
            assert(not ok and why=="this kind of scene holds no clue",STEP..": "..D7..": a refused scene holds no clue")
        else
            assert(ok,STEP..": "..D7..": a confirmed scene was not decided: "..tostring(why))
            synthSites[site.id]=site
        end
    end
    -- A spot of the clue's own kind at its own place; try candidates until
    -- one is neither held by another clue nor spent.
    local function targetFor(doc,site,salt)
        local b=site.bounds
        for try=1,30 do
            local k=h(seed,doc.id,salt,try)
            local spot=doc.spot
            -- Furniture inside the footprint; the rest may lie in the
            -- driveway band the Session allows (12 tiles), here up to 10.
            local m=spot=="furniture" and 0 or 10
            local w,hh=b.x2-b.x1+2*m,b.y2-b.y1+2*m
            local x,y=b.x1-m+k%w,b.y1-m+(math.floor(k/7))%hh
            -- Open ground in a big marked area: the runtime's own squares,
            -- ringing the map's marks (MarkedArea).
            local info=siteInfo[site.id]
            if spot=="ground" and info and info.entry.kind=="area" then
                x,y=MarkedArea.groundSquare(seed,site.id,doc.id,h(salt)%1000,try,b,info.points)
            end
            local t
            if spot=="furniture" then
                t={x=x,y=y,z=b.z,objectIndex=k%5,containerIndex=math.floor(k/5)%3,containerType="shelves",sprite="s"}
            elseif spot=="mailbox" then
                t={x=x,y=y,z=b.z,objectIndex=k%3,containerIndex=0,containerType="postbox",sprite="p"}
            elseif spot=="ground" then
                t={x=x,y=y,z=b.z,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true}
            elseif spot=="vehicle" then
                t={x=x,y=y,z=b.z,objectIndex=0,containerIndex=0,containerType="vehicle",sprite="car",
                    vehiclePart="GloveBox",vehicleMark="car-"..k}
            else
                t={x=x,y=y,z=b.z,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",
                    carrierKind="corpse",carrierMark="body-"..k}
            end
            local key=S.physicalKey(t)
            if not held[key] and not (saved.spent and saved.spent[key]) then return t,key end
        end
    end
    local function fill()
        for _,a in ipairs(saved.case.areas) do
            local site=rowOf(a.id)
            -- The 40-tile arrival ring; a big marked area's is measured from
            -- its nearest mark (MarkedArea.distance), as in the runtime.
            local info=siteInfo[a.id]
            local d=(info and info.entry.kind=="area") and MarkedArea.distance(info.points,px,py) or distRect(px,py,site.bounds)
            if d<=40 then
                for j=a.first,a.first+a.count-1 do
                    local d=saved.case.documents[j]
                    local as=saved.assignments[d.id]
                    if as.status=="deferred" then
                        local t,key=targetFor(d,site,"place")
                        assert(t,STEP..": no spot at all for a clue")
                        assert(api.assign(d.id,t,hours),STEP..": the Session refused a spot of the clue's own kind")
                        assert(api.status(d.id,"placed",hours))
                        held[key]=d.id; spotOf[d.id]=t; siteOf[d.id]=a.id
                    end
                end
            end
        end
    end
    local function spot()
        for id,t in pairs(spotOf) do
            if not rolled[id] and t.z==0 and math.max(math.abs(t.x-px),math.abs(t.y-py))<=16 then
                rolled[id]=true
                local r=h(seed,id,"find")%100
                if r<60 then
                    st.spotted=st.spotted+1
                    if docById(id).members then st.spottedSets=st.spottedSets+1 end
                end
                if r<45 then
                    assert(api.show(id)); assert(api.recognise(id,"search")); st.search=st.search+1
                    spentTargets[#spentTargets+1]={target=t,id=id}
                elseif r<60 then
                    assert(api.recognise(id,"look")); st.look=st.look+1; rolled[id]="carried"
                    spentTargets[#spentTargets+1]={target=t,id=id}
                end
            end
        end
    end
    -- One move per attempt, as the runtime does, never near the survivor.
    local function tryMove()
        local ids=StaleClue.staleIds(saved,hours)
        if #ids==0 then return end
        for k=1,#ids do
            local id=ids[((moveCursor+k-1)%#ids)+1]
            local a=saved.assignments[id]
            local doc=docById(id)
            local cur=spotOf[id]
            local carried=rolled[id]=="carried" and S.pieceCount(doc) or 0
            if StaleClue.canAttempt(a) and StaleClue.canRelocate(carried>0 and 0 or S.pieceCount(doc),carried,S.pieceCount(doc))
                and not StaleClue.tooClose(px,py,0,cur) then
                local dests=StaleClue.destinations(saved,{},id)
                assert(#dests==1 and dests[1].id==doc.locationId,STEP..": a clue's only destination is its own place")
                local t,key=targetFor(doc,rowOf(doc.locationId),"move"..a.relocations..":"..hours)
                if t then
                    local wasShown=saved.shown and saved.shown[id]
                    local wasSpent=saved.spent and saved.spent[key]
                    local ok=api.relocate(id,t,hours)
                    if ok then
                        assert(not wasShown,STEP..": a clue Search Mode showed was moved")
                        assert(not wasSpent,STEP..": a clue moved to a spot that gave up a clue")
                        local na=saved.assignments[id]
                        assert((na.locationId or doc.locationId)==doc.locationId,STEP..": a moved clue left its place")
                        assert(S.intentMatches(doc,na.target),STEP..": a moved clue changed its kind of spot")
                        held[S.physicalKey(cur)]=nil; held[key]=id; spotOf[id]=t
                        st.moves=st.moves+1
                        moveCursor=moveCursor+k
                        return
                    end
                end
            end
        end
    end
    local function tick(dt,moving)
        hours=hours+dt; steps=steps+1
        if os.clock()-T_START>TIME_LIMIT then error(STEP..": over "..TIME_LIMIT.." seconds; the check is too slow") end
        if moving then
            local dx,dy=px-lastScan.x,py-lastScan.y
            if dx*dx+dy*dy>=50*50 or hours>=lastScan.hours+0.5 then scan(); lastScan={x=px,y=py,hours=hours} end
            for _,e in ipairs(Sites.sites) do
                if distRect(px,py,e.bounds)<=100 then decideMap(e,"near") end
            end
            if h(seed,route.name,steps,"scene")%(route.town and 40 or 20)==0 then noteScene() end
        end
        decideScenes()
        fill()
        spot()
        local slot=math.floor(hours/6)
        if slot~=lastMoveSlot then lastMoveSlot=slot; tryMove() end
    end

    local walk={}
    for si,stop in ipairs(route.stopsList) do
        local tx,ty=centre(stop)
        while px~=tx or py~=ty do
            guard(walk,"the walk between stops",20000)
            local dx,dy=tx-px,ty-py
            local len=math.max(math.abs(dx),math.abs(dy))
            local stepLen=math.min(route.speed,len)
            px=px+math.floor(dx*stepLen/len+0.5); py=py+math.floor(dy*stepLen/len+0.5)
            if len<=route.speed then px,py=tx,ty end
            tick(stepLen/route.perHour,true)
        end
        tick(0.05,true)   -- arrived: the nearby checks run at the stop too
        -- At a stop: sometimes read a map or flyer from the pile found there
        -- (which decides WHEN its places are chosen, never what they hold).
        if h(seed,route.name,si,"read")%2==0 then
            local d=allDesigns[1+h(seed,route.name,si,"design")%#allDesigns]
            for _,e in ipairs(byDesign[d]) do decideMap(e,"read") end
            st.reads=st.reads+1
        end
        noteScene()
        -- Dwell: loot, sleep; 6-30 hours in 3-hour steps.
        local dwell=6+h(seed,route.name,si,"dwell")%25
        for _=1,math.floor(dwell/3) do tick(3,false) end
    end
    -- Then stay put for four days: unfound clues elsewhere move.
    for _=1,32 do tick(3,false) end

    -- Refusals the Session must keep, whatever a caller asks.
    local shownId
    for id in pairs(saved.shown or {}) do if not shownId or id<shownId then shownId=id end end
    if shownId then
        local d=docById(shownId)
        local t=targetFor(d,rowOf(d.locationId),"refusal")
        local ok,why=api.relocate(shownId,t,hours)
        assert(not ok and why=="a clue Search Mode has shown never moves",STEP..": a clue Search Mode showed never moves")
        st.refusedMoves=st.refusedMoves+1; st.refusedShown=1
    end
    for _,sp in ipairs(spentTargets) do
        local d=docById(sp.id)
        for _,o in ipairs(saved.case.documents) do
            local oa=saved.assignments[o.id]
            if o.id~=sp.id and o.locationId==d.locationId and o.spot==d.spot and oa.status=="placed"
                and not (saved.shown and saved.shown[o.id]) and oa.relocations<S.RELOCATE_CAP then
                local ok,why=api.relocate(o.id,sp.target,hours)
                assert(not ok and why=="a spot that gave up a clue is never reused",STEP..": a spot that gave up a clue is never reused")
                st.refusedMoves=st.refusedMoves+1; st.refusedSpent=1
                break
            end
        end
    end
    -- A fresh spot of the right kind at a place well away from the clue's own
    -- is still refused: a clue never leaves its place.
    local movable
    for _,d in ipairs(saved.case.documents) do
        local a=saved.assignments[d.id]
        if not movable and a.status=="placed" and not (saved.shown and saved.shown[d.id]) and a.relocations<S.RELOCATE_CAP then movable=d end
    end
    if movable then
        local own=rowOf(movable.locationId).bounds
        for _,a in ipairs(saved.case.areas) do
            local b=rowOf(a.id).bounds
            if a.id~=movable.locationId and math.max(distRect(b.x1,b.y1,own),distRect(b.x2,b.y2,own))>60
                and distRect(own.x1,own.y1,b)>60 then
                local t=targetFor(movable,rowOf(a.id),"cross")
                local ok,why=api.relocate(movable.id,t,hours)
                assert(not ok and why=="a clue stays in its own area",STEP..": a clue never moves to another place")
                st.refusedMoves=st.refusedMoves+1; st.refusedCross=1
                break
            end
        end
    end

    -- THE SAVE ROUND-TRIP: no size ceiling (owner), structure and rules kept.
    local text=serialise(saved)
    local back=assert(loadstring(text))()
    assert(same(back,saved),STEP..": the save reads back equal")
    local okv,whyv=S.validate(back)
    assert(okv,STEP..": the save read back is valid: "..tostring(whyv))
    assert(S.open(back,function() end),STEP..": the save read back opens")
    st.bytes=#text
    -- RAISE THE CAP ON A SAVED WORLD: the save written with the shipped cap,
    -- read back and played on with the cap lifted. New places take more than
    -- the old cap allowed, and moving still works.
    if capOn then
        Pick.FIRST_DEVELOPMENT_CAP=LIFTED_CAP
        local after=back
        local api2=assert(S.open(back,function(nx) after=nx end))
        for i,place in ipairs({"farm","police","warehouse"}) do
            local site={id="t3:syn:raised:"..i,bounds={x1=px+300+i*40,y1=py+300,x2=px+312+i*40,y2=py+310,z=0},
                containerTypes={"shelves","postbox","vehicle"},paperStorage="observed"}
            local ok,ids=api2.addArea{site=site,place=place,clues=clues,version=Manifest.VERSION,hours=hours,source="nearby"}
            assert(ok,STEP..": "..D4..": a place decided after the cap was raised: "..tostring(ids))
            st.raisedMax=math.max(st.raisedMax,#ids)
        end
        for _,id in ipairs(StaleClue.staleIds(after,hours+200)) do
            local d
            for _,x in ipairs(after.case.documents) do if x.id==id then d=x end end
            local a=after.assignments[id]
            if rolled[id]~="carried" and a.relocations<S.RELOCATE_CAP then
                local t=targetFor(d,rowOf(d.locationId),"raised")
                if t and api2.relocate(id,t,hours+200) then st.raisedMoves=1; break end
            end
        end
    end
    Pick.FIRST_DEVELOPMENT_CAP=SHIPPED_CAP
    return saved,st
end

-- ---------------------------------------------------------------------------
-- Checks on one finished route.
-- ---------------------------------------------------------------------------
local function check(saved,capOn,tally)
    local case=saved.case
    local cap=capOn and SHIPPED_CAP or LIFTED_CAP
    local writtenSeen={}
    local sets,total=0,0
    local placeSets,placeTotal=0,0
    local sceneArea={}
    for _,a in ipairs(case.areas) do if a.place=="scene" then sceneArea[a.id]=true end end
    for _,d in ipairs(case.documents) do
        total=total+1
        if not sceneArea[d.locationId] then
            placeTotal=placeTotal+1
            if d.members then placeSets=placeSets+1 end
        end
        if d.members then sets=sets+1 else
            assert(not writtenSeen[d.clue],STEP..": a written clue was placed twice")
            writtenSeen[d.clue]=true
        end
        tally.lean[d.lean]=(tally.lean[d.lean] or 0)+1
    end
    -- Per route on the places' own clues (a scene's clue is counted apart
    -- by the picker, owner 2026-09-27); overall on everything, below.
    assert(placeSets*2>=placeTotal,STEP..": "..D5..": fewer than half of a route's place clues are sets ("..placeSets.."/"..placeTotal..")")
    tally.sets=tally.sets+sets; tally.clues=tally.clues+total
    tally.minRouteSetShare=math.min(tally.minRouteSetShare,placeTotal>0 and placeSets/placeTotal or 1)
    for _,a in ipairs(case.areas) do
        local here,ids={}, {}
        for j=a.first,a.first+a.count-1 do
            local d=case.documents[j]
            here[d.lean]=(here[d.lean] or 0)+1; ids[d.clue]=true
        end
        if a.place=="scene" then
            tally.sceneAreas=tally.sceneAreas+1
            assert(a.count==1,STEP..": "..D7..": a confirmed scene holds exactly one clue")
            local d=case.documents[a.first]
            assert(d.anchor and d.anchor.scene==a.scene.kind,STEP..": "..D7..": a scene's clue is written for it")
        else
            tally.areas=tally.areas+1
            tally.bySource[a.source]=(tally.bySource[a.source] or 0)+1
            if a.count>=2 then
                assert((here.containment or 0)>=1 and (here.agricultural or 0)>=1,STEP..": "..D1..": an area of 2+ clues lacks a lean")
            end
            assert(a.count>=2,STEP..": an area holds fewer than 2 clues")
            if capOn then assert(a.count<=10,STEP..": "..D4..": an area holds more than 10 clues with the cap on") end
            tally.maxArea=math.max(tally.maxArea,a.count)
            for _,l in ipairs(LEANS) do assert((here[l] or 0)<=cap,STEP..": "..D4..": a lean above the cap") end
            -- Anchors: a place an anchored clue names takes only those.
            local info=siteInfo[a.id]
            local keys={}
            for _,k in ipairs(info and info.anchors or {}) do keys[k]=true end
            local anchoredHere=false
            for k in pairs(keys) do if anchoredKeys[k] then anchoredHere=true end end
            for j=a.first,a.first+a.count-1 do
                local d=case.documents[j]
                if anchoredHere then
                    assert(d.anchor and keys[Manifest.anchorKey(d.anchor)],STEP..": an anchored place took a clue not anchored to it")
                else
                    assert(d.anchor==nil,STEP..": an anchored clue landed at a place its mark does not name")
                end
            end
            if anchoredHere then tally.anchoredAreas=tally.anchoredAreas+1 end
            -- Placement stops only at the cap, or when every different set
            -- for this kind of place and lean is already here.
            if a.short>0 then
                tally.short=tally.short+1
                local pool=AreaCase.anchorPool(clues,info and info.anchors)
                for _,l in ipairs(LEANS) do
                    if (here[l] or 0)<cap then
                        for _,c in ipairs(pool) do
                            if c.kind=="set" then
                                for _,w in ipairs(c.where) do
                                    if w.place==a.place and w.lean==l then
                                        assert(ids[c.id],STEP..": "..D4..": an area stopped short with a different set still unused")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    -- Every confirmed scene with a clue written for it got exactly one.
    for key,rec in pairs(saved.scenes or {}) do
        if rec.kind and rec.kind~=refusedKind then
            local n=0
            for _,a in ipairs(case.areas) do if a.id=="scene:"..key then n=n+1 end end
            assert(n==1,STEP..": "..D7..": a confirmed scene did not get exactly one clue")
        end
    end
    -- No two placed clues share one spot.
    local keys={}
    for id,a in pairs(saved.assignments) do
        if a.status=="placed" then
            local k=S.physicalKey(a.target)
            assert(not keys[k],STEP..": two clues in one spot"); keys[k]=true
        end
    end
end

-- ---------------------------------------------------------------------------
-- Run.
-- ---------------------------------------------------------------------------
local unreliableMin,unreliableMax=100,0
local shareMin,shareMax=100,0
for i=1,SEEDS do
    local seed=1000+i*7919
    local nAll=#Trails.ALL
    local u=0
    for _,d in ipairs(Trails.ALL) do if Trails.unreliable(seed,d) then u=u+1 end end
    local pct=100*u/nAll
    local share=Trails.share(seed)
    assert(share>=1 and share<=20,STEP..": "..D6..": a world's unreliable share outside 1-20%")
    -- The count is the share of all designs rounded to a whole map, so a 20%
    -- world can show a fraction over 20.
    assert(u==Trails.unreliableCount(seed,nAll),STEP..": "..D6..": unreliable maps match the world's share")
    shareMin=math.min(shareMin,share); shareMax=math.max(shareMax,share)
    assert(u>=1 and pct>=1,STEP..": "..D6..": fewer than 1% of maps unreliable")
    assert(u<=math.floor(nAll*20/100+0.5),STEP..": "..D6..": more than 20% of maps unreliable")
    unreliableMin=math.min(unreliableMin,pct); unreliableMax=math.max(unreliableMax,pct)
end

local MODES={{capOn=true,first=1,seeds=CAP_ON_SEEDS,routes=CAP_ON_ROUTES},
    {capOn=false,first=CAP_ON_SEEDS+1,seeds=LIFTED_SEEDS,routes=LIFTED_ROUTES}}
for _,mode in ipairs(MODES) do
    local capOn=mode.capOn
    local tally={lean={},sets=0,clues=0,areas=0,sceneAreas=0,anchoredAreas=0,short=0,moves=0,search=0,look=0,
        refused=0,spotted=0,spottedSets=0,raisedMax=0,raisedMoves=0,cross=0,shownR=0,spentR=0,reads=0,scenes=0,maxArea=0,maxBytes=0,routes=0,bySource={},minRouteSetShare=1}
    local t0=os.clock()
    local kinds={}
    for i=mode.first,mode.first+mode.seeds-1 do
        local seed=1000+i*7919
        for j=1,mode.routes do
            -- Rotate the route kinds over the seeds so each kind is walked
            -- several times in each mode.
            local r=ROUTES[((i+2*(j-1)-1)%#ROUTES)+1]
            kinds[r.name]=true
            local route={name=r.name,speed=r.speed,perHour=r.perHour,town=r.town,
                stopsList=tour(seed,r.name,r.pool,r.stops,r.town and 400 or 1200)}
            local saved,st=runRoute(seed,route,capOn)
            check(saved,capOn,tally)
            tally.routes=tally.routes+1
            tally.moves=tally.moves+st.moves; tally.search=tally.search+st.search; tally.look=tally.look+st.look
            tally.refused=tally.refused+st.refusedMoves
            tally.cross=tally.cross+st.refusedCross; tally.shownR=tally.shownR+st.refusedShown; tally.spentR=tally.spentR+st.refusedSpent
            tally.reads=tally.reads+st.reads; tally.scenes=tally.scenes+st.scenesSeen
            tally.spotted=tally.spotted+st.spotted; tally.spottedSets=tally.spottedSets+st.spottedSets
            tally.raisedMax=math.max(tally.raisedMax,st.raisedMax); tally.raisedMoves=tally.raisedMoves+st.raisedMoves
            tally.maxBytes=math.max(tally.maxBytes,st.bytes)
        end
    end
    local c,a=tally.lean.containment or 0,tally.lean.agricultural or 0
    local total=c+a
    assert(tally.sets*2>=tally.clues,STEP..": "..D5..": fewer than half of all placed clues are sets")
    assert(c<=0.6*total and a<=0.6*total,STEP..": "..D1..": one lean above 60% of all placed clues")
    assert(tally.moves>0,STEP..": no clue ever moved")
    assert(tally.spottedSets*2>=tally.spotted,STEP..": "..D5..": fewer than half of the clues spotted are sets")
    if capOn then
        assert(tally.raisedMax>2*SHIPPED_CAP and tally.raisedMoves>0,STEP..": "..D4..": after raising the cap, new places take more and moves still work")
    end
    assert(tally.cross>0 and tally.shownR>0 and tally.spentR>0,STEP..": every kind of forbidden move was tried and refused")
    assert(tally.sceneAreas>0 and tally.anchoredAreas>0,STEP..": the routes reached scenes and anchored places")
    local src={}
    for k,v in pairs(tally.bySource) do src[#src+1]=k.." "..v end
    table.sort(src)
    for _,r in ipairs(ROUTES) do assert(kinds[r.name],STEP..": every kind of route was walked in each mode") end
    print(string.format("nohelp playthrough, cap %s: %d routes over %d worlds, %.1fs",
        capOn and "on" or "lifted",tally.routes,mode.seeds,os.clock()-t0))
    print(string.format("  areas %d (%s); scene areas %d; anchored places %d; largest area %d; "
        .."%d stopped below their number with every different set for their kind of place already there",
        tally.areas,table.concat(src,", "),tally.sceneAreas,tally.anchoredAreas,tally.maxArea,tally.short))
    print(string.format("  clues %d; sets %.1f%% (lowest route %.1f%% of place clues); lean %.1f%% / %.1f%%",
        tally.clues,100*tally.sets/tally.clues,100*tally.minRouteSetShare,100*c/total,100*a/total))
    print(string.format("  forbidden moves tried and refused: to another place on %d routes, a shown clue on %d, onto a spent spot on %d",
        tally.cross,tally.shownR,tally.spentR))
    print(string.format("  spotted or looked over %d, sets %.1f%% of them",tally.spotted,100*tally.spottedSets/math.max(1,tally.spotted)))
    if capOn then
        print(string.format("  saved at the shipped cap, reopened with it lifted: new places took up to %d clues; a move worked on %d of %d routes",
            tally.raisedMax,tally.raisedMoves,tally.routes))
    end
    print(string.format("  moves %d; forbidden moves refused %d; found by search %d, looked over %d; map reads %d; scenes seen %d",
        tally.moves,tally.refused,tally.search,tally.look,tally.reads,tally.scenes))
    print(string.format("  largest save %d KB (no ceiling); worst Pick call %.1f ms, worst area write %.1f ms (plain Lua)",
        math.floor(tally.maxBytes/1024),worst.pick*1000,worst.write*1000))
    worst.pick,worst.write=0,0
end
assert(os.clock()-T_START<TIME_LIMIT,STEP..": the check took over "..TIME_LIMIT.." seconds")
print(string.format("nohelp playthrough: unreliable share per world %d%%-%d%% (%.1f%%-%.1f%% of maps after rounding to whole maps) over %d worlds; %.1fs in all",
    shareMin,shareMax,unreliableMin,unreliableMax,SEEDS,os.clock()-T_START))
print("nohelp playthrough: "..STEP.." "..D1.." "..D4.." "..D5.." "..D6.." "..D7.." passed")
