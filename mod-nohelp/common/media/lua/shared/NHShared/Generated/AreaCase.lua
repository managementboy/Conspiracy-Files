-- The No Help world record: every area decided so far, the clues it was given,
-- and the ledger the picker reads (task 3 plan, phase 5).
--
-- One record per world, kind "nohelp-areas", held as an ordinary Session case
-- so placement, search, Look it over, identity and relocation work on it
-- unchanged. It is never retired and it only grows: an area is decided once,
-- from the saved ledger and world seed alone (Pick), and appended in one write
-- with its clues and the ledger it changed. Nothing about an area already
-- decided may change afterwards, so a later clue list never rewrites a world.
--
-- Pure: no engine calls, no Session (Session requires this).
local Pick=require("NHShared/Generated/Pick")
local Manifest=require("NHShared/Mystery/Manifest")
local Kinds=require("NHShared/Generated/EvidenceKinds")
local Outfits=require("NHShared/BodyOutfitObservations")
local Trails=require("NHShared/Generated/Trails")
local Scenes=require("NHShared/Generated/VanillaScenes")
local M={KIND="nohelp-areas",SCHEMA=1,CASE_ID="nohelp:world"}
M.MAX_TITLE=120
M.MAX_BODY=8000

local function set(list) local out={}; for _,v in ipairs(list) do out[v]=true end; return out end
local LEAN,PLACE,SPOT=set(Manifest.LEANS),set(Manifest.PLACES),set(Manifest.SPOTS)

local function copy(v)
    if type(v)~="table" then return v end
    local out={}; for k,x in pairs(v) do out[k]=copy(x) end; return out
end
local function integer(n) return type(n)=="number" and n==math.floor(n) end
local function hours(h) return type(h)=="number" and h==h and h>=0 and h~=math.huge end
local function text(s,max) return type(s)=="string" and s~="" and #s<=max end
local function same(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,v in pairs(a) do if not same(v,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end

function M.isAreaCase(case) return type(case)=="table" and case.kind==M.KIND end

-- One id per placed copy: the area, the clue and which copy of it.
function M.docId(areaId,clueId,copyNumber)
    return "nh:"..tostring(areaId)..":"..tostring(clueId)..":"..tostring(copyNumber)
end

function M.new(seed)
    return {kind=M.KIND,schemaVersion=M.SCHEMA,caseId=M.CASE_ID,seed=seed,
        locations={},areas={},documents={},
        ledger={areas={},world={},placed={}}}
end

-- A set's pieces as the engine's members, repeats folded into a quantity.
local function membersOf(pieces)
    local out,index={},{}
    for _,p in ipairs(pieces) do
        if index[p] then out[index[p]].quantity=out[index[p]].quantity+1
        else out[#out+1]={kind=p,quantity=1}; index[p]=#out end
    end
    return out
end

-- The document one pick becomes. Text comes from the clue list when the clue
-- has it; a placeholder clue gets a neutral placeholder, never invented story.
function M.docFrom(pick,clue,areaId)
    local doc={id=M.docId(areaId,pick.clue,pick.copy),locationId=areaId,clue=pick.clue,copy=pick.copy,
        lean=pick.lean,rival=pick.rival,spot=pick.spot,person=clue.person,outfit=pick.outfit}
    if clue.kind=="set" then
        doc.kind=clue.pieces[1]
        doc.members=membersOf(clue.pieces)
        doc.title=clue.title or "Something out of place"
        doc.body=clue.body or "Placeholder object set "..pick.clue.."."
    else
        doc.kind=clue.pieces[1]
        doc.title=clue.title or (Kinds.get(doc.kind) or {}).label or "Paper"
        doc.body=clue.body or "Placeholder written clue "..pick.clue.."."
    end
    return doc
end

-- The ledger Pick reads. A SCENE'S CLUE IS COUNTED APART (owner, 2026-09-27:
-- a scene and the place it appears in are independent): scene areas' clues
-- go to ledger.scene, present only once a scene holds a clue, so a world's
-- other areas pick exactly what they would have picked without any scene.
local function recount(case)
    local ledger={areas={},world={},placed={}}
    local scene={}
    for _,a in ipairs(case.areas or {}) do if a.place=="scene" then scene[a.id]=true end end
    for _,d in ipairs(case.documents) do
        local kind=d.members and "set" or "written"
        if scene[d.locationId] then
            ledger.scene=ledger.scene or {world={},placed={}}
            local w=ledger.scene.world
            w[d.lean]=(w[d.lean] or 0)+1
            w[kind]=(w[kind] or 0)+1
            ledger.scene.placed[d.clue]=math.max(ledger.scene.placed[d.clue] or 0,d.copy)
        else
            local a=ledger.areas[d.locationId] or {}; ledger.areas[d.locationId]=a
            a[d.lean]=(a[d.lean] or 0)+1
            ledger.world[d.lean]=(ledger.world[d.lean] or 0)+1
            ledger.world[kind]=(ledger.world[kind] or 0)+1
            ledger.placed[d.clue]=math.max(ledger.placed[d.clue] or 0,d.copy)
        end
    end
    return ledger
end
M.recount=recount

-- A PLACE VANILLA MAPS OR FLYERS MARK (task 3 plan, step 4; owner,
-- 2026-09-27). It leans toward the conspiracy of the first map or flyer that
-- marks it, in the static order of Generated/MapSites (never the order they
-- were read). Marked by one: at least 3 clues, one of the other side. Marked
-- by several: no extra minimum, the usual random number (owner: "no minimum
-- or maximum" for shared places), still both sides. The lean is the world's
-- (Trails), so a map read or never read gives the place the same lean.
-- designs: the maps marking the place, in static order. marks (optional): a
-- big marked area's own map marks, the `mark` numbers of the one map marking
-- it (never its annotation notes). EACH MARK ITS OWN MINIMUM (owner,
-- 2026-09-27): a place one map marks with m >= 2 of its own marks gets 3
-- clues per mark, one of the other side per mark, each clue near its own
-- mark (M.assignMarks). A shared place ignores marks. Returns the trail
-- record and Pick's extra arguments, or nil for a place no map marks.
function M.trailFor(seed,designs,areaId,marks)
    if type(designs)~="table" or #designs==0 then return nil end
    local favour=Trails.favour(seed,designs[1])
    -- A place several maps or flyers point to leans at random per world,
    -- never by which map a file lists first (owner, 2026-09-27).
    if #designs>1 then
        favour=Trails.LEANS[1+Pick.hash(Pick.key({seed,tostring(areaId),"shared-lean"}))%2]
    end
    if not favour then return nil end
    local list={}; for i,d in ipairs(designs) do list[i]=d end
    if #designs>1 then return {designs=list,favour=favour},{favour=favour} end
    local own={}
    if type(marks)=="table" then
        local seen={}
        for _,n in ipairs(marks) do
            if integer(n) and n>=1 and not seen[n] then seen[n]=true; own[#own+1]=n end
        end
        table.sort(own)
    end
    if #own>=2 then
        return {designs=list,favour=favour,marks=own},{favour=favour,rivalMin=#own,minCount=3*#own}
    end
    return {designs=list,favour=favour},{favour=favour,rivalMin=1,minCount=3}
end

-- Which of the area's own marks each clue belongs to (owner, 2026-09-27:
-- "each mark its own minimum"). A pure function of the world seed, the area
-- and the clues decided there, never of reading order: the marks and the
-- clues of each side are put in a seeded order, each mark takes one clue of
-- the other side first, then every other clue goes to the mark holding the
-- fewest so far. When the area holds 3 x m clues with m of the other side
-- (the picker's minimum), every mark gets at least 3, one of the other side.
-- Sets doc.mark (a `mark` number from `marks`) on each doc.
function M.assignMarks(seed,areaId,docs,marks,favour)
    local function order(list,salt)
        local keyed={}
        for i,v in ipairs(list) do
            keyed[i]={v=v,h=Pick.hash(Pick.key({seed,tostring(areaId),tostring(salt(v)),"own-mark"}))}
        end
        table.sort(keyed,function(a,b)
            if a.h~=b.h then return a.h<b.h end
            return tostring(salt(a.v))<tostring(salt(b.v))
        end)
        local out={}; for i,k in ipairs(keyed) do out[i]=k.v end
        return out
    end
    local ms=order(marks,function(n) return "mark:"..n end)
    local rivals,rest={},{}
    for _,d in ipairs(docs) do
        if d.lean~=favour then rivals[#rivals+1]=d else rest[#rest+1]=d end
    end
    rivals=order(rivals,function(d) return d.id end)
    rest=order(rest,function(d) return d.id end)
    local held={}
    for i,n in ipairs(ms) do held[n]=0; local d=rivals[i]; if d then d.mark=n; held[n]=1 end end
    for i=#ms+1,#rivals do rest[#rest+1]=rivals[i] end
    for _,d in ipairs(rest) do
        local best
        for _,n in ipairs(ms) do if not best or held[n]<held[best] then best=n end end
        d.mark=best; held[best]=held[best]+1
    end
end

-- Decide one area. args: {case, site (a Catalog row), place, clues, version,
-- hours, source, designs (optional: the maps marking it)}. Returns the new
-- case and the new document ids, or nil and "decided" (never again), "empty"
-- (nothing to give: NOT a decision, so a later clue list can still decide it)
-- or another refusal.
function M.decide(args)
    local case,site=args.case,args.site
    if not M.isAreaCase(case) or type(site)~="table" or type(site.id)~="string" then return nil,"invalid" end
    if not PLACE[args.place] then return nil,"not an interesting place" end
    if args.place=="scene" then return nil,"a scene is decided by decideScene" end
    for _,a in ipairs(case.areas) do if a.id==site.id then return nil,"decided" end end
    local clues=args.clues or Manifest.clues
    local byId={}; for _,c in ipairs(clues) do byId[c.id]=c end
    local trail,lean=M.trailFor(case.seed,args.designs,site.id,args.marks)
    if args.designs~=nil and not trail then return nil,"unknown map design" end
    lean=lean or {}
    local picks,short=Pick.choose{clues=clues,area={id=site.id,place=args.place},
        ledger=case.ledger,seed=case.seed,version=args.version,
        favour=lean.favour,rivalMin=lean.rivalMin,minCount=lean.minCount}
    if #picks==0 then return nil,"empty" end
    local next=copy(case)
    local known=false
    for _,l in ipairs(next.locations) do if l.id==site.id then known=true end end
    if not known then next.locations[#next.locations+1]=copy(site) end
    local first=#next.documents+1
    local ids,docs={},{}
    for _,p in ipairs(picks) do
        local doc=M.docFrom(p,byId[p.clue],site.id)
        next.documents[#next.documents+1]=doc
        docs[#docs+1]=doc
        ids[#ids+1]=doc.id
    end
    if trail and trail.marks then M.assignMarks(case.seed,site.id,docs,trail.marks,trail.favour) end
    next.areas[#next.areas+1]={id=site.id,place=args.place,source=tostring(args.source or "nearby"),
        version=tostring(args.version),decidedHours=args.hours or 0,first=first,count=#picks,short=short,trail=trail}
    next.ledger=recount(next)
    return next,ids
end

-- A CONFIRMED VANILLA SCENE (task 3 plan, step 5; owner, 2026-09-27). Its
-- area gets exactly ONE clue, placed by the kind's anchor (VanillaScenes):
-- the spot is the anchor's, the conspiracy is drawn from the kind's fit pair
-- and the world seed (VanillaScenes.lean), and the clue is one written for
-- scenes (Manifest place "scene") with that spot and lean. Fresh clues
-- first, in the order of a hash of (seed, area, clue, copy, version); a set
-- already placed beside another scene may come again as a new copy only
-- when nothing fresh is left (no maximum); a written clue never repeats.
-- Counted apart from every other area's clues (recount). args: {case,
-- site (its id "scene:<key>"), key, kind, clues, version, hours, host
-- (optional: the decided area the scene lies in, which it joins)}. Returns
-- the new case and the new document ids, or nil and "decided", "empty"
-- (no scene clue for this spot and lean yet: NOT a decision) or a refusal.
function M.decideScene(args)
    local case,site=args.case,args.site
    if not M.isAreaCase(case) or type(site)~="table" or type(site.id)~="string" then return nil,"invalid" end
    if type(args.key)~="string" or site.id~="scene:"..args.key then return nil,"a scene area is named by its scene" end
    if not Scenes.allowed(args.kind) then return nil,"this kind of scene holds no clue" end
    for _,a in ipairs(case.areas) do if a.id==site.id then return nil,"decided" end end
    local spot=Scenes.spotFor(args.kind)
    local lean=Scenes.lean(case.seed,site.id,args.kind)
    local row=Scenes.get(args.kind)
    local placed=(case.ledger.scene or {}).placed or {}
    local best
    for _,c in ipairs(args.clues or Manifest.clues) do
        local copies=placed[c.id] or 0
        if copies==0 or c.kind=="set" then
            for _,w in ipairs(c.where) do
                if w.place=="scene" and w.spot==spot and w.lean==lean then
                    local cand={clue=c,where=w,copy=copies+1,spare=copies>0,
                        order=Pick.hash(Pick.key({case.seed,site.id,c.id,copies+1,tostring(args.version)}))}
                    local better=not best
                    if best and cand.spare~=best.spare then better=not cand.spare
                    elseif best and cand.order~=best.order then better=cand.order<best.order
                    elseif best then better=c.id<best.clue.id end
                    if better then best=cand end
                end
            end
        end
    end
    if not best then return nil,"empty" end
    local next=copy(case)
    next.locations[#next.locations+1]=copy(site)
    local first=#next.documents+1
    local doc=M.docFrom({clue=best.clue.id,copy=best.copy,lean=lean,rival=best.where.rival,
        spot=spot,outfit=best.where.outfit},best.clue,site.id)
    next.documents[#next.documents+1]=doc
    next.areas[#next.areas+1]={id=site.id,place="scene",source="scene",version=tostring(args.version),
        decidedHours=args.hours or 0,first=first,count=1,short=0,
        scene={key=args.key,kind=args.kind,anchor=row.anchor,host=args.host}}
    next.ledger=recount(next)
    return next,{doc.id}
end

-- The whole record's shape, with every derived field recomputed. Today's clue
-- list is never consulted: a content update must not break a save.
function M.validate(case)
    if not M.isAreaCase(case) then return false,"not an area case" end
    if case.schemaVersion~=M.SCHEMA or case.caseId~=M.CASE_ID then return false,"unsupported area case" end
    if not integer(case.seed) or case.seed<1 or case.seed>=2147483647 then return false,"invalid world seed" end
    for k in pairs(case) do
        if not ({kind=1,schemaVersion=1,caseId=1,seed=1,locations=1,areas=1,documents=1,ledger=1})[k] then
            return false,"unknown area case field "..tostring(k)
        end
    end
    if type(case.locations)~="table" or type(case.areas)~="table" or type(case.documents)~="table" then
        return false,"missing area case fields"
    end
    local sites={}
    for _,l in ipairs(case.locations) do
        if type(l)~="table" or type(l.id)~="string" or sites[l.id] or type(l.bounds)~="table" then return false,"invalid area location" end
        sites[l.id]=true
    end
    local docIndex,copies=1,{}
    for i,a in ipairs(case.areas) do
        if type(a)~="table" or not sites[a.id] or not PLACE[a.place] or type(a.source)~="string"
            or type(a.version)~="string" or not hours(a.decidedHours) then return false,"invalid area "..tostring(i) end
        if a.first~=docIndex or not integer(a.count) or a.count<1 or not integer(a.short) or a.short<0 then
            return false,"area "..tostring(a.id).." does not account for its clues"
        end
        for j=a.first,a.first+a.count-1 do
            local d=case.documents[j]
            if type(d)~="table" or d.locationId~=a.id then return false,"area "..tostring(a.id).." does not own its clues" end
        end
        docIndex=docIndex+a.count
        for k in pairs(a) do
            if not ({id=1,place=1,source=1,version=1,decidedHours=1,first=1,count=1,short=1,trail=1,scene=1})[k] then
                return false,"unknown area field "..tostring(k)
            end
        end
        if (a.place=="scene")~=(a.scene~=nil) then return false,"only a scene area names a scene" end
        if a.scene~=nil then
            local sc=a.scene
            if type(sc)~="table" or not text(sc.key,80) or not text(sc.kind,60) or not Scenes.SPOT_OF[sc.anchor]
                or (sc.host~=nil and not text(sc.host,200)) or a.id~="scene:"..sc.key then
                return false,"invalid scene on area "..tostring(a.id)
            end
            for k in pairs(sc) do if k~="key" and k~="kind" and k~="anchor" and k~="host" then return false,"unknown scene field "..tostring(k) end end
            if a.count~=1 or a.short~=0 or a.trail~=nil then return false,"a scene holds exactly one clue" end
            if case.documents[a.first].spot~=Scenes.SPOT_OF[sc.anchor] then return false,"a scene's clue is not at its anchor" end
        end
        if a.trail~=nil then
            local t=a.trail
            if type(t)~="table" or not LEAN[t.favour] or type(t.designs)~="table" or #t.designs<1 or #t.designs>64 then
                return false,"invalid map trail on area "..tostring(a.id)
            end
            for k in pairs(t) do if k~="designs" and k~="favour" and k~="marks" then return false,"unknown map trail field "..tostring(k) end end
            local n=0
            for k,d in pairs(t.designs) do
                n=n+1
                if type(k)~="number" or type(d)~="string" or d=="" or #d>80 then return false,"invalid map trail design" end
            end
            if n~=#t.designs then return false,"invalid map trail design" end
            if t.marks~=nil then
                -- Each mark its own minimum (M.assignMarks): one map, 2+ of
                -- its own marks, every clue belonging to one of them.
                if type(t.marks)~="table" or #t.marks<2 or #t.marks>64 or #t.designs~=1 then return false,"invalid own marks" end
                local own,held,rival,m=0,{},{},0
                for k,v in pairs(t.marks) do
                    m=m+1
                    if type(k)~="number" or not integer(v) or v<1 or held[v] then return false,"invalid own marks" end
                    held[v]=0; rival[v]=0
                end
                if m~=#t.marks then return false,"invalid own marks" end
                for j=a.first,a.first+a.count-1 do
                    local d=case.documents[j]
                    if held[d.mark]==nil then return false,"a clue of area "..tostring(a.id).." belongs to none of its marks" end
                    held[d.mark]=held[d.mark]+1
                    if d.lean~=t.favour then rival[d.mark]=rival[d.mark]+1; own=own+1 end
                end
                -- Whenever the area holds the minimum (3 per mark, one of the
                -- other side per mark), every mark holds its own.
                if a.count>=3*#t.marks and own>=#t.marks then
                    for _,v in ipairs(t.marks) do
                        if held[v]<3 or rival[v]<1 then return false,"mark "..v.." of area "..tostring(a.id).." is below its minimum" end
                    end
                end
            end
        end
        if not (a.trail and a.trail.marks) then
            for j=a.first,a.first+a.count-1 do
                if case.documents[j].mark~=nil then return false,"a clue names a mark its area does not have" end
            end
        end
        for j=1,i-1 do if case.areas[j].id==a.id then return false,"area decided twice" end end
    end
    if docIndex-1~=#case.documents then return false,"clues outside any area" end
    for _,d in ipairs(case.documents) do
        if not integer(d.copy) or d.copy<1 or type(d.clue)~="string" then return false,"invalid clue copy" end
        if d.id~=M.docId(d.locationId,d.clue,d.copy) then return false,"a clue's id does not name its area and copy" end
        local key=d.clue..":"..d.copy
        if copies[key] then return false,"the same copy placed twice" end
        copies[key]=true
        if not LEAN[d.lean] or not LEAN[d.rival] or d.lean==d.rival then return false,"invalid lean" end
        if not SPOT[d.spot] then return false,"invalid spot" end
        if d.person~=nil and (type(d.person)~="string" or #d.person==0 or #d.person>40) then return false,"invalid person" end
        if d.outfit~=nil and (d.spot~="corpse" or not Outfits.isClass(d.outfit)) then return false,"invalid outfit hint" end
        if d.mark~=nil and (not integer(d.mark) or d.mark<1) then return false,"invalid own mark" end
        -- An item type is checked against the game's catalogue when a clue is
        -- chosen, not here: a game update that drops an item must never make
        -- a saved world unreadable, because a record that fails validation
        -- refuses every later write (phase 5 review).
        if type(d.kind)~="string" or d.kind=="" or #d.kind>80 then return false,"invalid clue kind" end
        if not text(d.title,M.MAX_TITLE) or not text(d.body,M.MAX_BODY) then return false,"invalid clue text" end
        if d.members~=nil then
            if type(d.members)~="table" or #d.members<1 then return false,"invalid set" end
            local n=0
            for _,m in ipairs(d.members) do
                if type(m.kind)~="string" or m.kind=="" or not integer(m.quantity) or m.quantity<1 then return false,"invalid set piece" end
                n=n+m.quantity
            end
            if n<2 or n>4 then return false,"a set holds 2-4 pieces" end
            if d.quantity~=nil and d.quantity~=n then return false,"a set's count must match its pieces" end
        else
            if d.copy~=1 then return false,"a written clue is placed once" end
            local k=Kinds.get(d.kind)
            if k and k.capacity=="object" then return false,"a written clue is carried on a written kind" end
            if k and not Kinds.fits(d.kind,d.body) then return false,"a clue's text does not fit its carrier" end
        end
        for k in pairs(d) do
            if not ({id=1,locationId=1,clue=1,copy=1,lean=1,rival=1,spot=1,kind=1,members=1,quantity=1,title=1,body=1,person=1,outfit=1,mark=1})[k] then
                return false,"unknown clue field "..tostring(k)
            end
        end
    end
    if not same(recount(case),case.ledger) then return false,"the ledger does not match the clues" end
    return true
end

-- Every write may only add: areas and clues already there stay exactly as
-- they were, in the same order, and the world seed never changes.
function M.grows(old,new)
    if not M.isAreaCase(old) then return true end
    if not M.isAreaCase(new) then return false,"the world record cannot be replaced" end
    if old.seed~=new.seed or old.caseId~=new.caseId then return false,"the world seed cannot change" end
    if #new.areas<#old.areas or #new.documents<#old.documents then return false,"the world record only grows" end
    for i,a in ipairs(old.areas) do if not same(a,new.areas[i]) then return false,"a decided area cannot change" end end
    for i,d in ipairs(old.documents) do if not same(d,new.documents[i]) then return false,"a placed clue cannot change" end end
    for i,l in ipairs(old.locations) do if not same(l,new.locations[i]) then return false,"a decided place cannot change" end end
    return true
end

-- KEYS THAT LEAD TO CLUE PLACES (owner, 2026-09-27). A key names its building
-- by the building definition's id (KeyObserver: def:getIDString()); an area
-- is that id with "t3:" in front. When the key's building is a decided area,
-- the journal may add what kind of place it is, in plain words - nothing
-- about any clue and no story. Anything else, a home included (a home is
-- never an area), says nothing. Pure: reads the world record only.
local PLACE_WORDS={
    police="a police building",hospital="a hospital or clinic",office="an office building",
    bookstore="a bookstore",transmission="a radio or transmission site",warehouse="a warehouse",
    government="a government building",mapNamed="a place named on the map",farm="a farm",
    checkpoint="a checkpoint",
}
function M.keyPhrase(case,building)
    if not M.isAreaCase(case) or type(building)~="string" or building=="" then return nil end
    local id="t3:"..building
    for _,a in ipairs(case.areas or {}) do
        if a.id==id then return PLACE_WORDS[a.place] end
    end
    return nil
end

-- Rows for the organiser, in the shape the discovery log reads.
function M.project(case)
    local out={}
    for _,d in ipairs(case.documents or {}) do
        out[#out+1]={id=d.id,kind=d.kind,title=d.title,body=d.body,locationId=d.locationId,leads={},connections={}}
    end
    return out
end

return M
