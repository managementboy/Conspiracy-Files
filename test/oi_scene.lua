-- Of Interest phase 4 (offline): ONE SCENE = a forced note + ordinary objects, one clue.
-- Fakes only; opaque ids and counts. The fake "text" marker must never be stored, logged or spoken.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
OIShared=OIShared or {}; OIShared.BlindLog=false
local TEXT="FAKE-NOTE-TEXT-MARKER-0123456789-ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local KNOWN={"Hospital","PoliceStation","Prison","Military","Farm","Church","School","Factory","GasStation","Laboratory","Library","Warehouse","Restaurant"}
local F=require("OIShared/NoteForcer")
local SceneNote=require("OIShared/SceneNote")
local Scenes=require("OIShared/Generated/Scenes")
local AreaCase=require("OIShared/Generated/AreaCase")
local Session=require("OIShared/Generated/Session")
local Holders=require("OIShared/SetHolders")
local Objects=require("OIShared/Generated/ObjectCatalogue")
local World=require("OIShared/WorldAccess")
local Tables=require("OIShared/Generated/NoteTables")
local Lines=require("OIShared/SceneNudgeLines")
local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end
local function keys(t) if type(t)~="table" then return "-" end local o={}; for k in pairs(t) do o[#o+1]=k end; table.sort(o); return table.concat(o,",") end

-- ---- the data row ------------------------------------------------------------------------------------
assert(#Scenes.rows==1,"ONE test scene")
local row=Scenes.rows[1]
assert(SceneNote.check(row))
local t=Tables[row.noteId]; assert(t and t[1]==0 and t[3]==5 and row.place==5,"a standalone farm-tagged catalogue id")
assert(#row.objects>=2 and #row.objects<=3 and row.where.kind=="ground")
local game=(os.getenv("PZ_HOME") or os.getenv("HOME").."/.steam/debian-installation/steamapps/common/ProjectZomboid/projectzomboid").."/media/scripts"
local p=io.popen('cat "'..game..'"/generated/items/*.txt 2>/dev/null'); local scripts=p:read("*a"); p:close()
if #scripts>0 then
    for _,o in ipairs(row.objects) do assert(scripts:find("\n    item "..o.."\n",1,true),"object type exists in the installed game: "..o) end
    assert(scripts:find("\n    item Note\n",1,true) and scripts:find("\n    item LetterHandwritten\n",1,true))
    print("scene data: objects exist in the installed game scripts")
end
-- bad rows are refused
local function bad(over) local r={}; for k,v in pairs(row) do r[k]=v end; for k,v in pairs(over) do r[k]=v end; return not SceneNote.check(r) end
assert(bad({id="x"}) and bad({noteId="Note/xx"}) and bad({objects={}}) and bad({objects={"A","B","C","D"}}) and bad({objects={"NoSuchThing"}})
    and bad({where={kind="roof"}}) and bad({place=0}) and bad({objects={"Bucket","Bucket"}}))

-- ---- the set: note first, then ordinary objects --------------------------------------------------------
local members=SceneNote.members(row)
assert(#members==#row.objects+1 and members[1].kind=="Note" and members[1].noteId==row.noteId and members[1].place==5)
assert(members[1].fallback==row.objects[1])
local letterRow={id="ns002",noteId="Letter/SadLetter/0002",objects={"Pencil"},where={kind="furniture"}}
assert(SceneNote.check(letterRow) and SceneNote.members(letterRow)[1].kind=="LetterHandwritten","a letter id rides on a letter item")
for i,o in ipairs(row.objects) do assert(members[i+1].kind==o and members[i+1].noteId==nil) end

-- ---- the world record ------------------------------------------------------------------------------------
local function site() return {id=SceneNote.areaId(row),bounds={x1=100,y1=100,x2=120,y2=120,z=0},paperStorage="unknown",containerTypes={}} end
local plainSite={id="t3:b1",bounds={x1=0,y1=0,x2=10,y2=10,z=0},containerTypes={"shelves","postbox"}}
local Inventory=require("oi_inventory")
local root=assert(Session.createArea(4242)); local saved=root
local api=assert(Session.open(root,function(n) saved=n end))
local okP,idsP=api.addArea{site=plainSite,place="farm",clues=Inventory.clues,version="v",hours=5}
assert(okP)
local ledgerBefore=keys(saved.case.ledger.world)..":"..saved.case.totals.areasDecided..":"..#idsP
local ok,ids=api.addNoteScene{site=site(),row=row,version="v",hours=6}
assert(ok and #ids==1,tostring(ids))
local doc; for _,d in ipairs(saved.case.documents) do if d.id==ids[1] then doc=d end end
assert(Session.isArea(saved) and Session.validate(saved),"valid world")
assert(SceneNote.isScene(doc) and doc.members[1].noteId==row.noteId and doc.spot=="ground" and doc.kind=="Note","the note is piece 1")
assert(Session.pieceCount(doc)==#row.objects+1,"pieces = note + objects")
assert(saved.assignments[doc.id].status=="deferred" and saved.assignments[doc.id].physicalToken=="cf-g2:"..doc.id,"one waiting placement target")
assert(saved.case.areas[#saved.case.areas].place=="note")
-- ONE record: one project row, counted apart from every place, one scene in the ledger
local rows=AreaCase.project(saved.case); local n=0; for _,r in ipairs(rows) do if r.id==doc.id then n=n+1 end end
assert(n==1,"one record for the scene, not one per piece")
assert(keys(saved.case.ledger.world)..":"..saved.case.totals.areasDecided..":"..#idsP==ledgerBefore,"places' counts did not move")
assert(saved.case.ledger.scene.world.set==1 and saved.case.ledger.scene.placed[row.id]==1,"the scene counted once")
assert(select(2,api.addNoteScene{site=site(),row=row,version="v2",hours=7})=="decided","decided once")
assert(not api.addNoteScene{site={id="note:ns009",bounds=site().bounds},row=row,version="v",hours=7},"site must be the scene's own")
-- old sets without notes are untouched: no note member, plain placement code path
for _,id in ipairs(idsP) do
    for _,d in ipairs(saved.case.documents) do if d.id==id then assert(not SceneNote.isScene(d)) end end
end
-- the find is recorded exactly once
local tgt={x=105,y=105,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true}
assert(api.assign(doc.id,tgt,7)); assert(api.status(doc.id,"placing")); assert(api.status(doc.id,"placed",8))
assert(api.recognise(doc.id,"search") and api.recognise(doc.id,"look"))
local seen=0; for _,x in ipairs(saved.recognised or {}) do if x==doc.id then seen=seen+1 end end
assert(seen==1,"exactly-once find on any piece")
-- tampered scene records are refused
local c2=AreaCase.extend(saved.case); c2.documents[#c2.documents]=nil
-- (a note area needs its document: validate catches the mismatch)
assert(not AreaCase.validate(c2))
local c3=AreaCase.new(7); local n3=assert(AreaCase.decideNote{case=c3,site=site(),row=row,version="v",hours=1})
n3.documents[1]=setmetatable({members={{kind="Bucket",quantity=1},{kind="Rope",quantity=1}}},{__index=n3.documents[1]})
assert(not AreaCase.validate(n3),"a note area whose first piece is not a note is refused")

-- ---- counting: pieces, once --------------------------------------------------------------------------
local function mk(md,inner)
    local it={md=md}
    function it:getModData() return self.md end
    if inner then it.inner=inner; function it:getInventory() return self.inner end end
    return it
end
local function box(list) local c={list=list}; function c:getItems() return {size=function() return #list end,get=function(_,i) return list[i+1] end} end return c end
local TOK="cf-g2:"..doc.id
local function piece(n) return mk({oiGeneratedId=doc.id,oiPhysicalToken=TOK,oiPiece=n}) end
function instanceof(it,cls) return cls=="InventoryContainer" and it.inner~=nil end
local pcs={}; for i=1,Session.pieceCount(doc) do pcs[i]=piece(i) end
local holder=mk({oiGeneratedId=doc.id,oiPhysicalToken=TOK,oiHolder=true},box(pcs))
local countN; local scan=World.count(box({holder}),TOK,function(v) countN=v end,Session.pieceCount(doc))
for _=1,200 do if scan() then break end end
assert(countN==Session.pieceCount(doc),"a scene in its holder counts as its pieces, matching the expected count")
local sh=Holders.shape(box({holder}),TOK); assert(sh.holder and Holders.movesWhole(sh,Session.pieceCount(doc)))

-- ---- holders: the fit rule counts the note's weight --------------------------------------------------
local pieces=Holders.pieces(doc)
assert(#pieces==#members and pieces[1].fullType=="Base.Note" and pieces[1].weight==0.1,"the note is a weighed piece")
local total=0; for _,x in ipairs(pieces) do total=total+x.weight end
for n=1,200 do
    local h=Holders.pick(777+n,"cid"..n,pieces)
    assert(h and h.capacity>=total,"holder fits note + objects")
    for _,x in ipairs(pieces) do assert(x.fullType~=h.fullType) end
end
local heavyNote={{weight=900,fullType="a"},{weight=0.1,fullType="Base.Note"}}
assert(Holders.pick(1,"x",heavyNote)==nil,"nothing fits: loose, as sets are")
-- exactly the note's weight matters: a set that fits only without it
local big=Holders.fitting({{weight=9,fullType="a"},{weight=9,fullType="b"}})
local bigN=Holders.fitting({{weight=9,fullType="a"},{weight=9,fullType="b"},{weight=0.1,fullType="Base.Note"}})
assert(#bigN<=#big)

-- ---- forcing, degrade, relocation, sweep, nudge ------------------------------------------------------
local function newItem(ft) local md={}; local it={name="x"}
    function it:getModData() return md end; function it:getFullType() return ft end
    function it:setName(n) self.name=n end; function it:setCustomName(b) self.custom=b end
    return it end
local function world(over)
    local W={mods={},logs={}}
    W.poolNote={{id="0159.txt",text=TEXT},{id="0001.txt",text=TEXT}}
    W.registry={items={["Base.Note"]=true,["Base.LetterHandwritten"]=true},
        isRegistered=function(ft) return W.registry.items[ft]==true end,
        resolveTextById=function(pool,id) for _,e in ipairs(pool) do if e.id==id then return e.text end end end,
        getOrAssignText=function() return TEXT end}
    W.mods["ItIsOfInterestToMe_UsedText"]={}
    W.deps={registry=W.registry,categories=KNOWN,version="t",fingerprint="fp1",
        poolFor=function(k) if k=="Note" then return W.poolNote end end,
        store=function(n) W.mods[n]=W.mods[n] or {}; return W.mods[n] end,
        getText=function() return "x" end,
        log=function(l,f) W.logs[#W.logs+1]=l.." "..keys(f)..":"..tostring(f.why)..":"..tostring(f.op) end}
    for k,v in pairs(over or {}) do W.deps[k]=v end
    return W end
local function loadFn(name,env)
    local src=read("mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua"):match("local function "..name..".-\nend\n")
    assert(src,name.." found in the runtime")
    local fn=assert(loadstring(src.."\nreturn "..name)); setfenv(fn,env); return fn()
end
local function runtimeEnv(W)
    local created={}
    local env=setmetatable({OIShared={NoteForcerGame={forceFor=function(item,member,token)
        return SceneNote.forcePiece(item,member,token,W.deps)==true end}},
        SceneNote=SceneNote,Objects=Objects,pcall=pcall,
        instanceItem=function(ft) local it=newItem(ft); created[#created+1]=ft; return it end},{__index=_G})
    return env,created
end
local W=world()
local env,created=runtimeEnv(W)
local sceneNoteItem=loadFn("sceneNoteItem",env)
local fresh=newItem("Base.Note")
local item,isNote=sceneNoteItem(members[1],fresh,TOK)
assert(isNote and item==fresh)
local md=item:getModData()
assert(keys(md)=="iioitmLocation,iioitmLocationBaked,iioitmTextId,oiSeal,oiToken" and md.iioitmTextId=="0159.txt" and md.iioitmLocation=="Farm" and md.oiToken==TOK,"forced keys")
assert(W.mods["ItIsOfInterestToMe_UsedText"].Note["0159.txt"]==true and W.mods[F.RECORD][TOK].note==row.noteId)
-- (a) DEGRADE: handshake failure -> an ordinary stand-in object, one log line, no partial keys, nothing written
for _,why in ipairs({"registry","tracker","catalogue","notinpool"}) do
    local W2=world()
    if why=="registry" then W2.deps.registry=nil
    elseif why=="tracker" then W2.deps.store=function(n) if n=="ItIsOfInterestToMe_UsedText" then return nil end return {} end
    elseif why=="catalogue" then W2.deps.catalogue={isActive=function() return false end,get=function() return nil end}
    else W2.poolNote={} end
    local e2,c2=runtimeEnv(W2); local fn=loadFn("sceneNoteItem",e2)
    local it2=newItem("Base.Note")
    local got,note=fn(members[1],it2,TOK)
    assert(not note and got and got~=it2 and got:getFullType()=="Base."..row.objects[1],"stand-in object, not a note ("..why..")")
    assert(next(it2:getModData())==nil and next(got:getModData())==nil,"no note keys anywhere")
    assert(keys(W2.mods)=="ItIsOfInterestToMe_UsedText" or next(W2.mods)==nil or not W2.mods[F.RECORD] or next(W2.mods[F.RECORD])==nil,"no record written")
    local lines=0; for _,l in ipairs(W2.logs) do lines=lines+1 end
    assert(lines==1,"exactly one log line on degrade ("..why.."): "..lines)
end
-- no forcer at all (dependency absent / file not loaded): same quiet degrade
do local e3={OIShared={},SceneNote=SceneNote,Objects=Objects,pcall=pcall,instanceItem=newItem}
   setmetatable(e3,{__index=_G}); local fn=loadFn("sceneNoteItem",e3)
   local got,note=fn(members[1],newItem("Base.Note"),TOK); assert(not note and got:getFullType()=="Base."..row.objects[1]) end
-- (b) RELOCATION re-creates the pieces: the same token + id on the replacement
local fresh2=newItem("Base.Note")
local item2,isNote2=sceneNoteItem(members[1],fresh2,TOK)
assert(isNote2 and item2~=item and item2:getModData().iioitmTextId=="0159.txt" and item2:getModData().oiToken==TOK)
assert(item2:getModData().oiSeal==md.oiSeal,"same seal")
local rec=W.mods[F.RECORD][TOK]
assert(rec.note==row.noteId and rec.re==1 and (rec.fix or 0)==0 and rec.st=="forced","record kept, replacement counted")
assert(W.mods["ItIsOfInterestToMe_UsedText"].Note["0159.txt"]==true,"tracker flag kept")
local n=0; for _ in pairs(W.mods[F.RECORD]) do n=n+1 end; assert(n==1,"no second record")
-- re-forcing the SAME item adds nothing; a different token for the same id stays refused; so does a different id for the token
assert(F.force(item2,{noteId=row.noteId,token=TOK,place=5},W.deps) and W.mods[F.RECORD][TOK].re==1)
assert(not F.force(newItem("Base.Note"),{noteId=row.noteId,token="other"},W.deps),"different token, same id: refused")
assert(not F.force(newItem("Base.Note"),{noteId="Note/0001",token=TOK},W.deps),"same token, different id: refused")
-- the runtime is wired the same way in BOTH item-creation loops (placement and relocation)
local rt=read("mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua")
local calls=0; for _ in rt:gmatch("sceneNoteItem%(member,") do calls=calls+1 end
assert(calls==3,"the definition and both item-creation loops (placement, relocation): "..calls)
assert(rt:find("if not isNote then writePages(item,doc",1,true) and rt:find("if not isNote then writePages(piece,doc",1,true),"the note's pages are never overwritten")
-- (c) SWEEP restores a cleared tracker flag (the dependency's pool reset), cheaply
W.mods["ItIsOfInterestToMe_UsedText"]={}
local back,recs=F.reassertTracker(W.deps)
assert(back==1 and recs==1 and W.mods["ItIsOfInterestToMe_UsedText"].Note["0159.txt"]==true)
assert(F.reassertTracker(W.deps)==0)
-- the in-game hourly hook does exactly that (NoteForcerGame.hourly) and listens to EveryHours
local ng=read("mod-ofinterest/common/media/lua/client/OIShared/NoteForcerGame.lua")
assert(ng:find('on("EveryHours"',1,true) and ng:find("function G.hourly",1,true) and ng:find("F.reassertTracker",1,true))

-- (d) NUDGE: once per scene, a pool line, never the note's text
do
    local clock=0; getTimeInMillis=function() return clock end
    local says={}
    local player={}
    function player:Say(t) says[#says+1]=t end
    function player:setHaloNote() error("the nudge uses the bubble only") end
    getPlayer=function() return player end
    Events=setmetatable({},{__index=function(t,k) local e={Add=function() end,Remove=function() end}; rawset(t,k,e); return e end})
    local V=require("OIShared/PlayerVoice")
    V.reset()
    assert(#Lines==24)
    local set={}; for _,l in ipairs(Lines) do assert(#l<=60 and not l:find("%d") and not set[l] and not l:find("FAKE")); set[l]=true end
    assert(V.sayNudge(doc.id)==true and #says==1 and set[says[1]],"one pool line, spoken")
    assert(V.sayNudge(doc.id)==false and #says==1,"once per scene")
    assert(SceneNote.nudgeLine(Lines,doc.id)==says[1],"the line depends on the scene id alone")
    clock=clock+100000; V.drain(); assert(#says==1,"nothing else queued")
    assert(V.sayNudge("nh:note:ns002:ns002:1")==true,"another scene speaks its own")
    for _,s in ipairs(says) do assert(not s:find("FAKE",1,true)) end
    -- the runtime calls it on a NEW find of a scene document only
    assert(rt:find("voice.sayNudge",1,true) and rt:find("SceneNote.isScene(d)",1,true))
end

-- ---- no note text anywhere ---------------------------------------------------------------------------
for _,l in ipairs(W.logs) do assert(not l:find("FAKE",1,true)) end
local seen2={}
local function walk(tb) if seen2[tb] then return end; seen2[tb]=true
    for k,v in pairs(tb) do for _,x in ipairs({k,v}) do if type(x)=="string" then assert(not x:find("FAKE",1,true)) end end
        if type(v)=="table" then walk(v) end end end
walk(W.mods); walk(saved.case)
assert(#SceneNote.CAPTION<=60 and not SceneNote.CAPTION:find("%d"))
print("oi_scene ok")
