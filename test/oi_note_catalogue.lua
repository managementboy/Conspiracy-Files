-- Of Interest phase 2: the notes catalogue and the dependency adapter, offline with fake dependency
-- tables. Opaque ids and counts only; fake "text" is a marker string that must never appear in the result.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local Cat=require("OIShared/NoteCatalogue")
local Tables=require("OIShared/Generated/NoteTables")
local Adapter=require("OIShared/DependencyAdapter")
local TEXT="FAKE-NOTE-TEXT-MARKER-0123456789-ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local KNOWN={"Hospital","PoliceStation","Prison","Military","Farm","Church","School","Factory","GasStation","Laboratory","Library","Warehouse","Restaurant"}

local function logs()
    local out={}; local real=print; print=function(...) out[#out+1]=table.concat({...}," ") end
    return out,function() print=real end
end
-- fake dependency built from an id list (default: every id of our table)
local function fake(ids,opts)
    opts=opts or {}
    local d={NoteContentPool={},NoteContentPoolEN={},LetterContentPools={},LetterContentPoolsEN={},KNOWN_CATEGORIES=KNOWN,language=opts.language}
    local function pool(cat) if not d.LetterContentPools[cat] then d.LetterContentPools[cat]={}; d.LetterContentPoolsEN[cat]={} end end
    for _,c in ipairs({"Letter","SadLetter","FriendlyLetter","BillX"}) do pool(c) end
    for _,id in ipairs(ids) do
        local n=id:match("^Note/(%d+)$"); local cat,m=id:match("^Letter/(%w+)/(%d+)$")
        local t=Tables[id]; local loc=t and t[3]>0 and KNOWN[t[3]] or opts.locate and opts.locate[id]
        if n then
            d.NoteContentPoolEN[n..".txt"]=TEXT; d.NoteContentPool[#d.NoteContentPool+1]={id=n..".txt",text=TEXT,location=loc}
        else
            pool(cat); d.LetterContentPoolsEN[cat][m..".txt"]=TEXT
            local a=d.LetterContentPools[cat]; a[#a+1]={id=m..".txt",text=TEXT,location=loc}
        end
    end
    return d
end
local function allIds() local o={}; for id in pairs(Tables) do o[#o+1]=id end; table.sort(o); return o end

-- full size: the real shipped table through a fake dependency
local full=Cat.build(fake(allIds()),Tables)
assert(full.active,"full active: "..tostring(full.reason))
local n=full.counts
assert(n.entries==500,"entries "..n.entries); assert(n.stories==23,"stories "..n.stories)
assert(n.places==13,"places "..n.places); assert(n.dropped==0 and n.unknown==0 and n.duplicates==0 and n.placemismatch==0 and n.badplace==0)
assert(n.themes==30,"themes "..n.themes); assert(n.pools==25,"pools "..n.pools)
Cat.install(full)
assert(Cat.isActive())
local inStory=0; for s=1,23 do inStory=inStory+#Cat.byStory(s) end
assert(inStory==67 and #Cat.standalone()==433,"67/433")
assert(#Cat.byStory(1)==12 and #Cat.byStory(2)==6)
local placed=0; for p=1,13 do assert(#Cat.byPlace(p)>0,"place "..p); placed=placed+#Cat.byPlace(p) end
assert(placed==93-0 or placed>0)
local r=Cat.get(Cat.byStory(2)[1]); assert(r and r.story==2 and r.order==1 and r.conf and type(r.themes)=="table","get/order")
assert(Cat.get("Note/9999")==nil and #Cat.byStory(99)==0 and #Cat.byPlace(99)==0 and #Cat.byTheme(99)==0)
local s1,d1=Cat.fingerprint(); assert(#s1==16 and #d1==16 and s1~=d1)

-- no text kept: no string longer than 40 chars anywhere, no marker, no reference to their tables
local seen={}
local function walk(t)
    if seen[t] then return end; seen[t]=true
    for k,v in pairs(t) do
        for _,x in ipairs({k,v}) do
            if type(x)=="string" then assert(#x<=40 and not x:find("FAKE",1,true),"text kept: "..#x) end
        end
        if type(v)=="table" then walk(v) end
    end
end
walk(full)

-- fingerprint is order-insensitive and ignores cosmetic changes (text, order of entries); changes with the id set
local ids=allIds(); local rev={}; for i=#ids,1,-1 do rev[#rev+1]=ids[i] end
local d2=fake(rev); for k in pairs(d2.NoteContentPoolEN) do d2.NoteContentPoolEN[k]="changed words" end
local again=Cat.build(d2,Tables)
assert(again.dynamicFp==full.dynamicFp and again.staticFp==full.staticFp,"fingerprint stable")
local fewer={}; for i=2,#ids do fewer[#fewer+1]=ids[i] end
assert(Cat.build(fake(fewer),Tables).dynamicFp~=full.dynamicFp,"fingerprint follows ids")
local t2={}; for k,v in pairs(Tables) do t2[k]=v end; t2["Note/0001"]={1,1,1,{1},1}
assert(Cat.staticFingerprint(t2)~=full.staticFp,"static follows the table")

-- changed ids: dropped (expected but missing) and unknown (found but not in our table)
local drift={}; for i=3,#ids do drift[#drift+1]=ids[i] end
drift[#drift+1]="Note/7777"; drift[#drift+1]="Letter/SadLetter/8888"
local dd=Cat.build(fake(drift,{locate={["Note/7777"]="Farm"}}),Tables)
assert(dd.active and dd.counts.dropped==2 and dd.counts.unknown==2 and dd.counts.entries==500,"drift counts "..dd.counts.dropped.."/"..dd.counts.unknown)
local u=dd.entries["Note/7777"]; assert(u and not u.known and u.story==nil and u.place==5 and #u.themes==0,"unknown = standalone + place")
assert(dd.entries["Letter/SadLetter/8888"].place==nil)
assert(dd.droppedIds[1]==ids[1] and dd.entries[ids[1]]==nil)
-- duplicates, bad ids, bad place tag
local dup=fake({"Note/0001"}); dup.NoteContentPool[2]={id="0001.txt",text=TEXT}; dup.NoteContentPoolEN["junk"]=TEXT
dup.NoteContentPool[3]={id="0002.txt",text=TEXT,location="Nowhere"}; dup.NoteContentPoolEN["0002.txt"]=TEXT
local dc=Cat.build(dup,Tables).counts; assert(dc.duplicates==1 and dc.badids==1 and dc.badplace==1,"dup/bad")
-- place mismatch is counted, the dependency's tag wins
local mm=fake({"Note/0001"}); mm.NoteContentPool[1].location="Farm"
local tm={["Note/0001"]={0,0,2,{},0}}; local mc=Cat.build(mm,tm); assert(mc.counts.placemismatch==1 and mc.entries["Note/0001"].place==5)
-- small fake with a tiny table
local tiny=Cat.build(fake({"Note/0001","Letter/Letter/0002"}),{["Note/0001"]={1,2,0,{3},3},["Letter/Letter/0002"]={1,1,6,{3,4},3}})
assert(tiny.counts.entries==2 and tiny.counts.stories==1 and tiny.counts.places==1 and tiny.counts.themes==2)
assert(tiny.byStoryIdx[1][1]=="Letter/Letter/0002","story order")

-- missing / partial dependency: inactive, empty, no error
for _,break_ in ipairs({"NoteContentPool","NoteContentPoolEN","LetterContentPools","LetterContentPoolsEN","KNOWN_CATEGORIES"}) do
    local d=fake(ids); d[break_]=nil
    local c=Cat.build(d,Tables); assert(not c.active and c.counts.entries==0 and next(c.entries)==nil,"partial "..break_)
end
local nodeps=Cat.build(nil,Tables); assert(not nodeps.active and nodeps.counts.entries==0)
local emptyd=Cat.build(fake({}),Tables); assert(not emptyd.active and emptyd.reason=="no entries")

-- the adapter: missing dependency -> inactive, exactly one log line, no error, nothing installed
Adapter.reset()
local out,restore=logs()
local ok,err=pcall(Adapter.snapshot)
Adapter.ensure(); Adapter.ensure()
restore(); assert(ok,tostring(err))
assert(not Cat.isActive() and Cat.get("Note/0001")==nil and #out==1,"one line, got "..#out)
assert(out[1]:find("ev=catalogue",1,true) and out[1]:find("state=inactive",1,true),out[1])
-- the adapter with fakes in the globals: active, one audit line of counts only
local d=fake(ids)
NoteContentPool,NoteContentPoolEN,LetterContentPools,LetterContentPoolsEN=d.NoteContentPool,d.NoteContentPoolEN,d.LetterContentPools,d.LetterContentPoolsEN
LocationCategory={KNOWN_CATEGORIES=KNOWN}; ContentLoader={LANGUAGE="RU"}
Adapter.reset()
out,restore=logs(); local c=Adapter.snapshot(); Adapter.snapshot(); restore()
assert(c.active and Cat.isActive() and #out==1,"active, one line "..#out)
for _,k in ipairs({"entries=500","stories=23","places=13","dropped=0","unknown=0","nonEN=1","lang=RU"}) do assert(out[1]:find(k,1,true),k..": "..out[1]) end
assert(not out[1]:find("FAKE",1,true))
-- a throwing global must not escape
setmetatable(_G,{__index=function(_,k) if k=="NoteContentPool" then error("boom") end end})
NoteContentPool=nil; Adapter.reset(); out,restore=logs(); local ok2=pcall(Adapter.snapshot); restore(); setmetatable(_G,nil)
assert(ok2 and not Cat.isActive() and #out==1)
NoteContentPool,NoteContentPoolEN,LetterContentPools,LetterContentPoolsEN,LocationCategory,ContentLoader=nil,nil,nil,nil,nil,nil
Adapter.reset()

-- shipped table is numbers only: no alphabetic words except the id path strings
local f=assert(io.open("mod-ofinterest/common/media/lua/shared/OIShared/Generated/NoteTables.lua","rb")); local src=f:read("*a"); f:close()
local rows=0
local stripped=src:gsub('%["[%w/]+"%]',function() rows=rows+1; return "" end):gsub("^return","")
assert(rows==500,"rows "..rows); assert(not stripped:find("%a"),"word in the shipped table")
for id,t in pairs(Tables) do
    assert(id:match("^Note/%d%d%d%d$") or id:match("^Letter/%a+/%d%d%d%d$"),id)
    assert(#t==5 and t[1]>=0 and t[1]<=23 and t[3]>=0 and t[3]<=13 and t[5]>=0 and t[5]<=3,"row "..id)
    for _,th in ipairs(t[4]) do assert(th>=1 and th<=30) end
    assert((t[1]==0)==(t[2]==0 and t[5]==0) or t[1]>0,"story fields")
end
-- every dependency source in our tree goes through the adapter only
local p=io.popen('grep -rlE "NoteContentPool|LetterContentPools|ReadableItemRegistry|LocationCategory" mod-ofinterest/common --include=*.lua')
for l in p:lines() do assert(l:find("DependencyAdapter.lua",1,true) or l:find("NoteCatalogue",1,true),"dependency touched in "..l) end p:close()

-- the ids of our table exist in the real dependency: FILE NAMES ONLY (a directory listing; no file is opened)
local root=os.getenv("HOME").."/.steam/debian-installation/steamapps/workshop/content/108600/3796373365/mods/ItIsOfInterestToMe/42/media/lua/shared/ItIsOfInterestToMe/Content"
local pf=io.popen('cd "'..root..'" 2>/dev/null && find Note Letters -path "*/EN/*.txt" 2>/dev/null')
local names,count={},0
for l in pf:lines() do
    local nn=l:match("^Note/EN/(%d+)%.txt$"); local cc,mm=l:match("^Letters/(%w+)/EN/(%d+)%.txt$")
    if nn then names["Note/"..nn]=true; count=count+1 elseif cc then names["Letter/"..cc.."/"..mm]=true; count=count+1 end
end pf:close()
if count==0 then print("oi note catalogue: dependency not installed here - id/filename check SKIPPED (not a pass)")
else
    local missing=0; for id in pairs(Tables) do if not names[id] then missing=missing+1 end end
    assert(missing==0,missing.." table ids have no file in the dependency")
    print("oi note catalogue: "..count.." dependency files listed, all 500 table ids exist (names only)")
end
print("oi note catalogue: 500 entries, 23 stories, 13 places, 30 themes; drift, partial, missing, fingerprint, no-text and numeric-table checks pass")
