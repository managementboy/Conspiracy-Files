-- Of Interest phase 3: NoteForcer offline, with fake items / modData / dependency globals.
-- Opaque ids and counts only; the fake "text" is a marker that must never be stored or logged.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local F=require("OIShared/NoteForcer")
local TEXT="FAKE-NOTE-TEXT-MARKER-0123456789-ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local KNOWN={"Hospital","PoliceStation","Prison","Military","Farm","Church","School","Factory","GasStation","Laboratory","Library","Warehouse","Restaurant"}

local function newItem(ft) local md={}; local it={name="x"}
    function it:getModData() return md end; function it:getFullType() return ft end
    function it:setName(n) self.name=n end; function it:setCustomName(b) self.custom=b end
    return it end
local function copyItem(it) local c=newItem(it:getFullType()); for k,v in pairs(it:getModData()) do c:getModData()[k]=v end; return c end
local function keys(t) if type(t)~="table" then return "-" end local o={}; for k in pairs(t) do o[#o+1]=k end; table.sort(o); return table.concat(o,",") end

local function world(over)
    local W={mods={},logs={},poolNote={},poolSad={},picks=0}
    for i=1,5 do W.poolNote[i]={id=string.format("%04d.txt",i),text=TEXT} end
    for i=1,3 do W.poolSad[i]={id=string.format("%04d.txt",i),text=TEXT,location="Church"} end
    W.registry={items={["Base.Note"]=true,["Base.LetterHandwritten"]=true,["Base.GenericMail"]=true},
        isRegistered=function(ft) return W.registry.items[ft]==true end,
        resolveTextById=function(pool,id) for _,e in ipairs(pool) do if e.id==id then return e.text end end end,
        getOrAssignText=function(item,pool,key)   -- the dependency's pick, reduced to its tracker rule
            local md=item:getModData(); if md.iioitmTextId then return TEXT end
            local u=W.mods["ItIsOfInterestToMe_UsedText"]; u[key]=u[key] or {}
            local free={}; for _,e in ipairs(pool) do if not u[key][e.id] then free[#free+1]=e end end
            local pick=free[(W.picks%#free)+1]; W.picks=W.picks+1; u[key][pick.id]=true; md.iioitmTextId=pick.id; return TEXT end}
    W.mods["ItIsOfInterestToMe_UsedText"]={}
    W.deps={registry=W.registry,categories=KNOWN,version="t",fingerprint="fp1",
        poolFor=function(k) if k=="Note" then return W.poolNote elseif k=="SadLetter" then return W.poolSad end end,
        store=function(n) W.mods[n]=W.mods[n] or {}; return W.mods[n] end,
        getText=function(k) return "NAME:"..k end,
        log=function(l,f) W.logs[#W.logs+1]=l.." "..keys(f)..":"..tostring(f.why)..":"..tostring(f.op) end}
    for k,v in pairs(over or {}) do W.deps[k]=v end
    return W end
local function tracked(W,pool,id) local u=W.mods["ItIsOfInterestToMe_UsedText"][pool]; return u and u[id]==true end

-- 1+2: a Note with a place: exact keys, tracker and record in the same call
local W=world(); local it=newItem("Base.Note")
local ok,why=F.force(it,{noteId="Note/0003",token="t1",place=6,pool="Note"},W.deps)
assert(ok,tostring(why))
assert(keys(it:getModData())=="iioitmLocation,iioitmLocationBaked,iioitmTextId,oiSeal,oiToken","keys: "..keys(it:getModData()))
local md=it:getModData(); assert(md.iioitmTextId=="0003.txt" and md.iioitmLocationBaked==true and md.iioitmLocation=="Church" and md.oiToken=="t1")
assert(md.oiSeal==F.seal("t1","Note/0003","1"),"seal")
assert(tracked(W,"Note","0003.txt"),"tracker same call")
local rec=W.mods[F.RECORD].t1; assert(rec.note=="Note/0003" and rec.place==6 and rec.fp=="fp1" and rec.st=="forced")
assert(keys(W.mods["ItIsOfInterestToMe_UsedText"])=="Note","tracker only gained the pool table")
assert(#W.logs==1 and W.logs[1]:find("^i "))

-- 3: letter, no place: baked set, location stays nil, category + display name
local L=newItem("Base.LetterHandwritten")
assert(F.force(L,{noteId="Letter/SadLetter/0002",token="t2"},W.deps))
assert(keys(L:getModData())=="iioitmLetterCategory,iioitmLocationBaked,iioitmTextId,oiSeal,oiToken","letter keys: "..keys(L:getModData()))
assert(L:getModData().iioitmLocation==nil and L:getModData().iioitmLetterCategory=="SadLetter" and L.name=="NAME:IGUI_SadLetter" and L.custom)
assert(tracked(W,"Letter_SadLetter","0002.txt"))

-- 4: idempotent (same item, same spec) and no growth
local before=keys(md); assert(F.force(it,{noteId="Note/0003",token="t1",place=6},W.deps))
assert(keys(md)==before and md.iioitmTextId=="0003.txt"); local n=0; for _ in pairs(W.mods[F.RECORD]) do n=n+1 end; assert(n==2)

-- 5: refusals leave EVERYTHING untouched, one log line each
local function untouched(name,spec,item,w)
    w=w or world(); item=item or newItem("Base.Note")
    local snapRec,snapTr=keys(w.deps.store(F.RECORD)),keys(w.deps.store("ItIsOfInterestToMe_UsedText"))
    local ok,why=F.force(item,spec,w.deps)
    assert(not ok,name.." should refuse"); assert(next(item:getModData())==nil,name.." touched the item")
    assert(keys(w.deps.store(F.RECORD))==snapRec and keys(w.deps.store("ItIsOfInterestToMe_UsedText"))==snapTr,name.." touched the world")
    assert(#w.logs==1 and w.logs[1]:find("^w "),name.." log lines "..#w.logs)
    return why end
assert(untouched("badid",{noteId="Note/xx",token="a"})=="bad-id")
assert(untouched("notinpool",{noteId="Note/0099",token="a"})=="not-in-pool")
assert(untouched("badplace",{noteId="Note/0001",token="a",place=14})=="bad-place")
assert(untouched("poolmismatch",{noteId="Note/0001",token="a",pool="Letter"})=="pool-mismatch")
assert(untouched("notoken",{noteId="Note/0001"})=="no-token")
local w2=world(); w2.deps.registry.resolveTextById=nil
assert(untouched("registry",{noteId="Note/0001",token="a"},nil,w2)=="no-registry")
local w3=world(); w3.deps.store=function(n) if n=="ItIsOfInterestToMe_UsedText" then return nil end return {} end
assert(untouched("tracker",{noteId="Note/0001",token="a"},nil,w3)=="no-tracker")
local w4=world({catalogue={isActive=function() return true end,get=function() return nil end}})
assert(untouched("catalogue",{noteId="Note/0001",token="a"},nil,w4)=="not-in-catalogue")
assert(untouched("kind",{noteId="Note/0001",token="a"},newItem("Base.LetterHandwritten"))=="item-kind")
assert(untouched("kind2",{noteId="Letter/SadLetter/0001",token="a"},newItem("Base.Note"))=="item-kind")
local w5=world(); w5.mods["ItIsOfInterestToMe_UsedText"].Note={["0002.txt"]=true}
assert(untouched("contested",{noteId="Note/0002",token="a"},nil,w5)=="contested")
local w6=world(); local bk=newItem("Base.Note"); bk:getModData().iioitmTextId="0001.txt"
local sn=keys(bk:getModData()); local ok6=F.force(bk,{noteId="Note/0002",token="a"},w6.deps); assert(not ok6 and keys(bk:getModData())==sn and #w6.logs==1,"already baked")
-- id taken by another token / token reused for another id
assert(not F.force(newItem("Base.Note"),{noteId="Note/0003",token="other"},W.deps))
assert(not F.force(newItem("Base.Note"),{noteId="Note/0004",token="t1"},W.deps))
-- handshake failure when the dependency is absent
assert(F.handshake({noteId="Note/0001",token="a"},nil)==false and not F.force(newItem("Base.Note"),{noteId="Note/0001",token="a"},{}))

-- 6: repair after tampering: every key, the seal, the tracker flag
local function repaired(mutate)
    mutate(md); W.mods["ItIsOfInterestToMe_UsedText"].Note["0003.txt"]=nil
    local s=F.verify(it,W.deps); assert(s=="repaired","expected repaired, got "..s)
    assert(md.iioitmTextId=="0003.txt" and md.oiSeal==F.seal("t1","Note/0003","1") and md.iioitmLocationBaked==true and md.iioitmLocation=="Church")
    assert(tracked(W,"Note","0003.txt"),"tracker restored"); assert(F.verify(it,W.deps)=="ok") end
repaired(function(m) m.iioitmTextId="0001.txt" end)   -- the dependency re-picked
repaired(function(m) m.iioitmTextId=nil end)
repaired(function(m) m.oiSeal="bad" end)
repaired(function(m) m.iioitmLocationBaked=nil; m.iioitmLocation=nil end)
repaired(function(m) m.iioitmLocation="Prison" end)
assert(W.mods[F.RECORD].t1.fix==5 and W.mods[F.RECORD].t1.st=="repaired")
-- tracker cleared alone (dependency's cycle reset): reasserted, item "ok"
W.mods["ItIsOfInterestToMe_UsedText"].Note["0003.txt"]=nil; assert(F.verify(it,W.deps)=="ok" and tracked(W,"Note","0003.txt"))
-- letter category changed
L:getModData().iioitmLetterCategory="Bill"; assert(F.verify(L,W.deps)=="repaired" and L:getModData().iioitmLetterCategory=="SadLetter")

-- 7: a duplicate item carries the keys and verifies; a foreign item and a record-less seal are left alone
local dup=copyItem(it); assert(F.verify(dup,W.deps)=="ok" and dup:getModData().iioitmTextId=="0003.txt")
local plain=newItem("Base.Note"); assert(F.verify(plain,W.deps)=="unknown" and next(plain:getModData())==nil)
local orphan=newItem("Base.Note"); orphan:getModData().oiToken="nobody"; orphan:getModData().iioitmTextId="0005.txt"
assert(F.verify(orphan,W.deps)=="foreign" and orphan:getModData().iioitmTextId=="0005.txt")
-- an id the dependency no longer has is not "repaired" into nothing
W.poolNote[3]=nil; local pn=W.poolNote; W.poolNote={}; for _,e in pairs(pn) do W.poolNote[#W.poolNote+1]=e end
md.iioitmTextId="0001.txt"; assert(F.verify(it,W.deps)=="gone" and md.iioitmTextId=="0001.txt")
W.poolNote[#W.poolNote+1]={id="0003.txt",text=TEXT}; md.iioitmTextId=nil; assert(F.verify(it,W.deps)=="repaired")

-- 8: sweep counts; tracker reset is put back
W.mods["ItIsOfInterestToMe_UsedText"]={}
local c,back,recs=F.sweep(W.deps,{it,L,dup,plain,orphan})
assert(c.ok==3 and c.unknown==1 and c.foreign==1 and c.repaired==0 and back==2 and recs==2,"sweep "..c.ok..c.unknown..c.foreign..back..recs)
assert(tracked(W,"Note","0003.txt") and tracked(W,"Letter_SadLetter","0002.txt"))

-- 9: the dependency's own random picks never hand out the forced id (tracker rule), 3 picks of 5 minus ours
local W2=world(); local f=newItem("Base.Note"); assert(F.force(f,{noteId="Note/0001",token="z"},W2.deps))
for _=1,4 do local d=newItem("Base.Note"); W2.registry.getOrAssignText(d,W2.poolNote,"Note"); assert(d:getModData().iioitmTextId~="0001.txt") end

-- 10: no fake text anywhere, no long string, nothing but the documented writes on their side
local seen={}
local function walk(t,where)
    if seen[t] then return end; seen[t]=true
    for k,v in pairs(t) do for _,x in ipairs({k,v}) do
        if type(x)=="string" then assert(not x:find("FAKE",1,true) and #x<=40,"text stored in "..where) end end
        if type(v)=="table" then walk(v,where) end end end
walk(W.mods,"mods"); walk(it:getModData(),"item"); walk(L:getModData(),"item")
for _,l in ipairs(W.logs) do assert(not l:find("FAKE",1,true)) end
for i=1,5 do assert(W.poolNote[i]==nil or W.poolNote[i].text==TEXT) end
assert(keys(W.mods)=="ItIsOfInterestToMe_UsedText,OIShared.ForcedNotes","only the tracker and our record exist in ModData")
print("oi_note_forcer ok")
