-- Of Interest phase 7: the version-drift gate, offline. A fake dependency (globals, registry, world ModData) is
-- mutated in many ways; each is "booted" through the real adapter and the gate must give the right level and
-- counts, never raise, write one ev=drift line per boot, force no wrong note, force nothing at level 3, and
-- leave the world record alone. Then the round trip: record with the baseline, load mutated, load baseline again.
-- Ids and counts only; the fake "text" is a marker that must never be stored or logged.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local Cat=require("OIShared/NoteCatalogue")
local Tables=require("OIShared/Generated/NoteTables")
local Contract=require("OIShared/Generated/Contract")
local Baseline=require("OIShared/Generated/Baseline")
local Adapter=require("OIShared/DependencyAdapter")
local Gate=require("OIShared/DriftGate")
local F=require("OIShared/NoteForcer")
local SceneNote=require("OIShared/SceneNote")
local LOG={}; local realPrint=print
print=function(...) LOG[#LOG+1]=table.concat({...}," ") end
local TEXT="FAKE-NOTE-TEXT-MARKER-0123456789"
local KNOWN={"Hospital","PoliceStation","Prison","Military","Farm","Church","School","Factory","GasStation","Laboratory","Library","Warehouse","Restaurant"}
local held={}; for _,id in ipairs(Baseline.held) do held[id]=true end

local MD={}                       -- the world's ModData, kept across boots
ModData={getOrCreate=function(n) MD[n]=MD[n] or {}; return MD[n] end}
local function ser(v,seen)
    if type(v)~="table" then return tostring(v) end
    local k={}; for key in pairs(v) do if key~="re" then k[#k+1]=key end end -- "re" counts replacement items: expected to grow
     table.sort(k,function(a,b) return tostring(a)<tostring(b) end)
    local o={}; for _,key in ipairs(k) do o[#o+1]=tostring(key).."="..ser(v[key]) end
    return "{"..table.concat(o,",").."}"
end

local function liveIds() local o={}; for id in pairs(Tables) do if not held[id] then o[#o+1]=id end end; table.sort(o); return o end
local function newItem(ft) local md={}; local it={}
    function it:getModData() return md end; function it:getFullType() return ft end
    function it:setName() end; function it:setCustomName() end
    return it end

-- the fake dependency
local function dep(ids,opt)
    opt=opt or {}
    local d={pools={},en={},letters={},lettersEN={},cats={},opt=opt}
    for i,c in ipairs(opt.cats or KNOWN) do d.cats[i]=c end
    d.note={}; d.noteEN={}
    for _,c in ipairs(Contract.pools) do if c~="Note" then d.letters[c]={}; d.lettersEN[c]={} end end
    for _,c in ipairs(opt.dropPools or {}) do d.letters[c]=nil; d.lettersEN[c]=nil end
    for _,c in ipairs(opt.addPools or {}) do d.letters[c]={}; d.lettersEN[c]={} end
    local pre=opt.idPrefix or ""
    local function file(num) return pre..num..".txt" end
    for _,id in ipairs(ids) do
        local n=id:match("^Note/(%d+)$"); local cat,m=id:match("^Letter/(%w+)/(%d+)$")
        local t=Tables[id]; local loc=t and t[3]>0 and KNOWN[t[3]] or nil
        if opt.rename and opt.rename[id] then m=opt.rename[id]; n=opt.rename[id] end
        if n and id:match("^Note/") then d.noteEN[file(n)]=TEXT; d.note[#d.note+1]={id=file(n),text=TEXT,location=loc}
        elseif d.letters[cat] then d.lettersEN[cat][file(m)]=TEXT; local a=d.letters[cat]; a[#a+1]={id=file(m),text=TEXT,location=loc} end
    end
    for _,e in ipairs(opt.extra or {}) do -- extra ids: {pool,num}
        if e[1]=="Note" then d.noteEN[e[2]..".txt"]=TEXT; d.note[#d.note+1]={id=e[2]..".txt",text=TEXT}
        else d.lettersEN[e[1]][e[2]..".txt"]=TEXT; local a=d.letters[e[1]]; a[#a+1]={id=e[2]..".txt",text=TEXT} end
    end
    local R={}
    R.isRegistered=function(ft) return ft=="Base.Note" or ft=="Base.LetterHandwritten" end
    R.open=function() end
    R.resolveTextById=function(pool,id) for _,e in ipairs(pool) do if e.id==id then return e.text end end end
    R.getOrAssignText=function(item,pool,key)
        local md=item:getModData(); local u=ModData.getOrCreate(opt.trackerName or Contract.tracker.name)
        local pick=pool[1]
        if opt.flatTracker then u[key]=true else u[key]=u[key] or {}; u[key][pick.id]=true end
        md[opt.key or "iioitmTextId"]=pick.id; return pick.text
    end
    for _,fn in ipairs(opt.noFn or {}) do R[fn]=nil end
    d.registry=not opt.absent and R or nil
    d.lang=opt.language
    return d
end
local function install(d)
    ReadableItemRegistry=d.registry
    if d.opt.absent then NoteContentPool,NoteContentPoolEN,LetterContentPools,LetterContentPoolsEN,LocationCategory=nil,nil,nil,nil,nil
    else NoteContentPool,NoteContentPoolEN,LetterContentPools,LetterContentPoolsEN=d.note,d.noteEN,d.letters,d.lettersEN
        LocationCategory={KNOWN_CATEGORIES=d.cats} end
    ContentLoader={LANGUAGE=d.lang or "EN"}
end

local function boot(d)
    install(d)
    Adapter.reset()
    require("OIShared/Log").resetRepeats()
    local n0=#LOG
    local ok,err=pcall(Adapter.snapshot)
    local out={}; for i=n0+1,#LOG do out[#out+1]=LOG[i] end
    assert(ok,"boot raised: "..tostring(err))
    local drift,cat={}, {}
    for _,l in ipairs(out) do
        if l:find("ev=drift",1,true) then drift[#drift+1]=l end
        if l:find("ev=catalogue",1,true) then cat[#cat+1]=l end
        assert(not l:find(TEXT,1,true),"text in the log")
    end
    assert(#drift==1,"one drift line per boot, got "..#drift)
    return Gate.current(),drift[1],out
end
local function force(noteId,token,place)
    local ft=noteId:match("^Note/") and "Base.Note" or "Base.LetterHandwritten"
    local item=newItem(ft)
    local deps=Adapter.forceDeps()
    local ok,why=SceneNote.forcePiece(item,{noteId=noteId,place=place,fallback="x"},token,deps)
    return ok,why,item
end

local ids=liveIds()
local noteIds,letterIds={}, {}
for _,id in ipairs(ids) do if id:match("^Note/") then noteIds[#noteIds+1]=id else letterIds[#letterIds+1]=id end end
local function firstOf(list,n,from) local o={}; for i=(from or 1),(from or 1)+n-1 do o[#o+1]=list[i] end return o end
local function without(list,drop) local s={}; for _,x in ipairs(drop) do s[x]=true end; local o={}; for _,x in ipairs(list) do if not s[x] then o[#o+1]=x end end return o end

-- ---------------------------------------------------------------- 0: baseline
local R0,line0=boot(dep(ids))
assert(R0.level==0,"baseline level "..R0.level.." ["..table.concat(R0.why,",").."]")
assert(R0.counts.missing==0 and R0.counts.added==0 and R0.counts.entries==493,"baseline counts")
assert(line0:find("level=0",1,true) and not line0:find("FAKE",1,true))
assert(Cat.current().staticFp==Baseline.static and Cat.current().dynamicFp==Baseline.dynamic,"fingerprints equal the shipped baseline")
assert(Gate.forcingOn())

-- the scene notes and the world record made with the baseline
local scenes={noteIds[1],noteIds[2],noteIds[3],letterIds[1],letterIds[2],noteIds[10]}
local items={}
for i,id in ipairs(scenes) do
    local ok,why,item=force(id,"tk"..i,Tables[id][3]>0 and Tables[id][3] or nil); assert(ok,why); items[i]=item
end
local recordBase=ser(MD[F.RECORD]); local trackerBase=ser(MD[Contract.tracker.name])
assert(not recordBase:find(TEXT,1,true))
-- idempotent boot
local R0b=boot(dep(ids)); assert(R0b.level==0)

-- ---------------------------------------------------------------- the mutation matrix
local gone5=firstOf(noteIds,5,4)                                   -- not among the scenes
local function ren(list) local m={}; for i,id in ipairs(list) do m[id]="9"..string.format("%03d",i) end return m end
local renamed=firstOf(noteIds,3,20); local renMap=ren(renamed)
local swapped={}; for i,c in ipairs(KNOWN) do swapped[i]=c end; swapped[1],swapped[2]=swapped[2],swapped[1]
local extended={}; for i,c in ipairs(KNOWN) do extended[i]=c end; extended[#extended+1]="NewPlace"
local shortened={}; for i=1,12 do shortened[i]=KNOWN[i] end
local appendedSwap={}; for i,c in ipairs(KNOWN) do appendedSwap[i]=c end; appendedSwap[14]="B"; appendedSwap[15]="A"
local noteOnly={}; for _,id in ipairs(ids) do if id:match("^Note/") then noteOnly[#noteOnly+1]=id end end
local heldAgain=ids; local withHeld={}; for _,id in ipairs(ids) do withHeld[#withHeld+1]=id end; withHeld[#withHeld+1]=Baseline.held[1]
local sadIds={}; for _,id in ipairs(ids) do if id:match("^Letter/SadLetter/") then sadIds[#sadIds+1]=id end end

local M={
 -- name, ids, options, level, extra checks(counts)
 {"ids removed",without(ids,gone5),nil,2,function(c) assert(c.missing==5 and c.added==0) end},
 {"ids renamed (no fuzzy match)",ids,{rename=renMap},2,function(c) assert(c.missing==3 and c.added==3,c.missing.."/"..c.added) end},
 {"ids added",ids,{extra={{"Note","8001"},{"Note","8002"},{"SadLetter","8003"},{"Bill","8004"},{"Letter","8005"}}},1,function(c) assert(c.added==5 and c.missing==0) end},
 {"pool count down",without(ids,firstOf(noteIds,12,30)),nil,2,function(c) assert(c.missing==12) end},
 {"pool count up and down",without(ids,gone5),{extra={{"Note","8001"},{"Note","8002"}}},2,function(c) assert(c.missing==5 and c.added==2) end},
 {"modData key renamed (live)",ids,{key="iioitmTxtId"},3},
 {"tracker name renamed",ids,{trackerName="Other_UsedText"},3},
 {"tracker structure changed",ids,{flatTracker=true},3},
 {"place list reordered",ids,{cats=swapped},3},
 {"place list extended",ids,{cats=extended},1,function(c) assert(c.placesExtra==1) end},
 {"place list appended and reordered at the tail",ids,{cats=appendedSwap},1},
 {"place list shortened",ids,{cats=shortened},3},
 {"registry function missing (resolve)",ids,{noFn={"resolveTextById"}},3},
 {"registry function missing (open)",ids,{noFn={"open"}},3},
 {"registry function missing (assign)",ids,{noFn={"getOrAssignText"}},3},
 {"language folder missing (EN ids kept)",ids,{language="FR"},0,function(c) assert(c.nonEN==1) end},
 {"letter category added",ids,{addPools={"NewLetter"}},1,function(c) assert(c.poolsExtra==1) end},
 {"letter category removed",without(ids,sadIds),{dropPools={"SadLetter"}},3},
 {"whole dependency absent",ids,{absent=true},3},
 {"pool empty",without(ids,noteOnly),nil,2,function(c) assert(c.missing==#noteOnly) end},
 {"every pool empty",{},nil,3},
 {"id pattern changed",ids,{idPrefix="a"},3},
 {"held-back id reappears",withHeld,nil,1,function(c) assert(c.restored==1) end},
}
local levelsSeen={}
for _,m in ipairs(M) do
    local name,mids,opt,want,check=m[1],m[2],m[3],m[4],m[5]
    local d=dep(mids,opt)
    -- the world as the previous (baseline) session left it
    local res,line=boot(d)
    assert(res.level==want,name..": level "..res.level.." want "..want.." ["..table.concat(res.why,",").."]")
    levelsSeen[res.level]=(levelsSeen[res.level] or 0)+1
    assert(line:find("level="..want,1,true),name..": audit line")
    if check then check(res.counts) end
    assert(res.off==(want>=3) and Gate.forcingOn()==(want<3),name..": forcing flag")
    -- an existing record is never touched by a boot
    assert(ser(MD[F.RECORD])==recordBase and ser(MD[Contract.tracker.name])==trackerBase,name..": the boot changed the world record")
    -- forcing: never an id that is not in the live pool, nothing at level 3, never a renamed id by fuzz
    local present={}; for _,id in ipairs(mids) do present[id]=true end
    local probes={noteIds[1],noteIds[2],gone5[1],renamed[1],letterIds[1]}
    for k,id in ipairs(probes) do
        local rec0=ser(MD[F.RECORD]); local tr0=ser(MD[Contract.tracker.name])
        local ok,why,item=force(id,"probe"..k)
        local inPool=present[id] and not (opt and opt.rename and opt.rename[id]) and not (opt and opt.idPrefix)
        local itemMd=item:getModData()
        if want>=3 then
            assert(not ok and why=="drift-off",name..": level 3 forced "..id.." ("..tostring(why)..")")
        elseif not inPool or (id==gone5[1] and not present[id]) then
            assert(not ok,name..": forced an id that is not in the live pool: "..id)
        end
        if not ok then
            assert(next(itemMd)==nil,name..": a refused item was written to")
            assert(ser(MD[F.RECORD])==rec0 and ser(MD[Contract.tracker.name])==tr0,name..": a refusal touched the world")
        else
            assert(itemMd.iioitmTextId==id:match("(%d+)$")..".txt",name..": wrong note forced onto "..id)
            -- undo so the baseline record stays the reference
            MD[F.RECORD]["probe"..k]=nil
            local file=id:match("(%d+)$")..".txt"
            local pk=id:match("^Note/") and "Note" or "Letter_"..id:match("^Letter/(%w+)/")
            if not (items and trackerBase:find(file,1,true)) then MD[Contract.tracker.name][pk][file]=nil end
        end
    end
    -- the carried scene items: sweep leaves gone ids alone and repairs nothing toward them
    local deps=Adapter.forceDeps()
    local before=ser(MD[F.RECORD])
    local c=F.sweep(deps,items)
    assert(ser(MD[F.RECORD])==recordBase and before==recordBase,name..": the sweep changed the record")
    if want>=3 then assert(c.ok==0 and c.repaired==0,name..": sweep acted at level 3") end
    for i,it in ipairs(items) do
        assert(it:getModData().iioitmTextId==scenes[i]:match("(%d+)$")..".txt",name..": a scene item changed")
    end
    -- tracker restored by the probe cleanup
    assert(MD[Contract.tracker.name].OIProbe==nil,name..": the probe left a trace")
    -- back to the baseline: everything recovers, nothing was lost
    local back=boot(dep(ids)); assert(back.level==0,name..": no recovery, level "..back.level)
    assert(ser(MD[F.RECORD])==recordBase,name..": record differs after recovery")
    for i,id in ipairs(scenes) do
        local ok,why=force(id,"tk"..i,Tables[id][3]>0 and Tables[id][3] or nil)
        assert(ok,name..": scene "..i.." did not recover: "..tostring(why))
    end
    assert(ser(MD[F.RECORD])==recordBase,name..": re-forcing changed the record")
end
assert(levelsSeen[0] and levelsSeen[1] and levelsSeen[2] and levelsSeen[3],"all four levels exercised")

-- ---------------------------------------------------------------- objects-only fallback and recovery
do
    local lostScene=scenes[3]
    local d=dep(without(ids,{lostScene}))
    local res=boot(d); assert(res.level==2 and res.counts.missing==1)
    local row={id="ns101",noteId=lostScene,place=nil,objects={"Pen"},where={kind="ground"}}
    local members=SceneNote.members(row)
    local item=newItem("Base.Note")
    local ok,why=SceneNote.forcePiece(item,members[1],"newtok",Adapter.forceDeps())
    assert(not ok and (why=="not-in-pool" or why=="not-in-catalogue"),"degrade: "..tostring(why))
    assert(next(item:getModData())==nil and MD[F.RECORD].newtok==nil,"degrade leaves item and record alone")
    assert(SceneNote.standIn(members[1])=="Pen" or SceneNote.standIn(members[1])==nil)
    -- a record that names a vanished id: verify leaves it, counts it, repairs nothing
    local gone=items[3]; gone:getModData().iioitmTextId=nil -- as if the item lost its key
    local c=F.sweep(Adapter.forceDeps(),{gone}); assert(c.gone==1 and c.repaired==0,"gone item left alone")
    assert(gone:getModData().iioitmTextId==nil,"nothing repaired toward a missing id")
    boot(dep(ids))
    local c2=F.sweep(Adapter.forceDeps(),{gone}); assert(c2.repaired==1,"recovered when the id is back")
    assert(gone:getModData().iioitmTextId==lostScene:match("(%d+)$")..".txt")
    local function plain(x) return (x:gsub("fix=%d",""):gsub("st=%a+","")) end
    assert(plain(ser(MD[F.RECORD]))==plain(recordBase),"record intact apart from the repair counter")
end

-- the contract itself renamed (mutated copy): level 3 without touching the live data
do
    MD[F.RECORD]=nil
    local d0=dep(ids)
    local g={registry=d0.registry,NoteContentPool=d0.note,NoteContentPoolEN=d0.noteEN,LetterContentPools=d0.letters,
        LetterContentPoolsEN=d0.lettersEN,KNOWN_CATEGORIES=KNOWN}
    local c=Cat.build(g,Tables)
    local live=Gate.snapshot(g,{ran=true,keys={"iioitmTextId"},tracker="ok",resolve=true},Contract)
    assert(Gate.classify(Contract,live,c,Tables,Baseline).level==0)
    local mut={}; for k,v in pairs(Contract) do mut[k]=v end; mut.probedKeys={"iioitmTextIdX"}
    assert(Gate.classify(mut,live,c,Tables,Baseline).level==3,"contract key renamed")
    local mut2={}; for k,v in pairs(Contract) do mut2[k]=v end; mut2.pools={"Note","Brand"}
    assert(Gate.classify(mut2,live,c,Tables,Baseline).level==3,"contract pool names changed")
    assert(Gate.classify(nil,live,c,Tables,Baseline).level==3 and Gate.classify(Contract,nil,c,Tables,Baseline).level==3,"no input is a breach, not an error")
end
-- the restricted catalogue: a new id is never reachable from the placers
do
    boot(dep(ids,{extra={{"Note","8001"}}}))
    assert(Cat.get("Note/8001")==nil and Cat.counts().unknown==1 and #Cat.standalone()>0)
    for _,id in ipairs(Cat.current().ids) do assert(Tables[id],"unknown id reachable: "..id) end
end
-- the shipped files are names and numbers only
for _,name in ipairs({"Contract","Baseline"}) do
    local f=assert(io.open("mod-ofinterest/common/media/lua/shared/OIShared/Generated/"..name..".lua","rb")); local s=f:read("*a"); f:close()
    assert(not s:find(TEXT,1,true))
end
Adapter.reset()
for _,l in ipairs(LOG) do assert(not l:find(TEXT,1,true),"text in a log line") end
print=realPrint
print(string.format("oi drift: %d mutations (levels seen: 0 x%d, 1 x%d, 2 x%d, 3 x%d), round trip, degrade and recovery pass",
    #M,levelsSeen[0],levelsSeen[1],levelsSeen[2],levelsSeen[3]))
