-- Of Interest phase 5 (offline): STORIES AS SCENES. The pure placer on the real shipped tables (note
-- table, buildings, recipes): determinism, one town per story, distinct buildings, category match and
-- relaxation, object categories, held-back stories, no order claim, world-record round trip, no words.
-- Ids, codes and counts only; the order field is never printed.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
OIShared=OIShared or {}; OIShared.BlindLog=false
local Placer=require("OIShared/StoryPlacer")
local Tables=require("OIShared/Generated/NoteTables")
local BData=require("OIShared/Generated/Buildings")
local Recipes=require("OIShared/Generated/Recipes")
local Enable=require("OIShared/Generated/StoryEnable")
local Objects=require("OIShared/Generated/ObjectCatalogue")
local SceneNote=require("OIShared/SceneNote")
local Session=require("OIShared/Generated/Session")
local AreaCase=require("OIShared/Generated/AreaCase")
local Holders=require("OIShared/SetHolders")
local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end

-- the catalogue instance the placer sees (what NoteCatalogue.build makes), built from the shipped table
local function catalogue(mutate)
    local c={entries={}}
    for id,t in pairs(Tables) do
        local r={id=id,story=t[1]>0 and t[1] or nil,order=t[2]>0 and t[2] or nil,place=t[3]>0 and t[3] or nil,themes={},conf=t[5]>0 and t[5] or nil}
        for i,th in ipairs(t[4]) do r.themes[i]=th end
        c.entries[id]=r
    end
    if mutate then mutate(c) end
    return c
end
local buildings=Placer.parseBuildings(BData)
assert(#buildings==6796)
local byId={}; for _,b in ipairs(buildings) do byId[b.id]=b end
local SEED=123456
local cat=catalogue()
local t0=os.clock()
local dec,rep=Placer.place({},cat,buildings,Recipes,SEED)
print(string.format("placer: %d scenes in %.2f s",#dec,os.clock()-t0))

-- ---- all stories: held back, placed, counts -------------------------------------------------------------
local storyCount,lowCount=0,0
local stories={}
for id,t in pairs(Tables) do
    if t[1]>0 then stories[t[1]]=(stories[t[1]] or 0)+1 end
end
for s,n in pairs(stories) do storyCount=storyCount+1 end
assert(storyCount==23)
local held={}
for _,s in ipairs(rep.held) do held[s]=true end
assert(#rep.held==4 and held[20] and held[21] and held[22] and held[23],"low-confidence stories 20..23 held back")
local placed=0
for s=1,23 do
    local r=rep.stories[s]
    assert(r,"report row for story "..s)
    if held[s] then assert(r.status=="held") else assert(r.status=="placed","story "..s.." "..tostring(r.status)); placed=placed+1 end
end
assert(placed==19 and rep.counts.placed==19 and rep.counts.nofit==0)
for _,d in ipairs(dec) do assert(not held[d.story],"a held-back story was placed") end
local want=0; for s=1,19 do want=want+stories[s] end
assert(#dec==want and rep.counts.scenes==want and #rep.all==want,"every part of every placed story is one scene: "..#dec)
-- with the enable list only the two test stories come out; the rest of the table is the same
local en={}; for _,s in ipairs(Enable) do en[s]=true end
assert(en[1] and en[9] and #Enable==2,"phase 5 enables the 12-part story and one 2-part story")
assert(stories[1]==12 and stories[9]==2)
local decE,repE=Placer.place({enable=en},cat,buildings,Recipes,SEED)
assert(#decE==14,#decE)
local allById={}; for _,d in ipairs(dec) do allById[d.id]=d end
for _,d in ipairs(decE) do
    local a=allById[d.id]; assert(a and a.building==d.building and a.noteId==d.noteId,"enabling cannot move a scene")
end
assert(#repE.all==#dec)

-- ---- per scene: shape, one town per story, distinct buildings -------------------------------------------
local usedB,sceneIds,noteIds={}, {}, {}
local perStory={}
for _,d in ipairs(dec) do
    assert(SceneNote.check(d),"a decision is a valid scene row: "..d.id)
    assert(not sceneIds[d.id] and not noteIds[d.noteId] and not usedB[d.building],"unique scene, note, building")
    sceneIds[d.id]=true; noteIds[d.noteId]=true; usedB[d.building]=d.id
    local b=assert(byId[d.building]); assert(b.town==d.town and b.area==d.area and b.x==d.bounds.x1 and b.y2==d.bounds.y2 and d.bounds.z==0)
    assert(Tables[d.noteId] and Tables[d.noteId][1]==d.story,"the note belongs to the story")
    assert(d.id:match("^ns%d%d%d$") and d.id~="ns001")
    local l=perStory[d.story] or {}; perStory[d.story]=l; l[#l+1]=d
end
local towns={}
for s,l in pairs(perStory) do
    assert(#l==stories[s])
    local t=l[1].town
    local seenB={}
    for _,d in ipairs(l) do assert(d.town==t,"story "..s.." in more than one town"); assert(not seenB[d.building]); seenB[d.building]=true end
    assert(rep.stories[s].town==t)
    towns[t]=(towns[t] or 0)+1
end
local ts={}; for t,n in pairs(towns) do ts[#ts+1]=t..":"..n end; table.sort(ts)
print("stories per town (town:stories): "..table.concat(ts," "))

-- ---- category match and relaxation ----------------------------------------------------------------------
local tagged,matched,relaxed=0,0,0
local catOf={}
for _,d in ipairs(dec) do
    if d.place then
        tagged=tagged+1
        assert(d.matched~=nil)
        if d.matched then
            matched=matched+1; assert(d.cat==d.place,"a matched part sits in a building of its category")
        else
            relaxed=relaxed+1
            assert(d.cat==0,"a relaxed part sits in an ordinary building")
            -- relaxed only when the town had no free building of that category left
            for _,b in ipairs(buildings) do
                if b.town==d.town and b.cat==d.place and b.x2-b.x>=Placer.MIN_SIDE and b.y2-b.y>=Placer.MIN_SIDE
                    and (b.x2-b.x)*(b.y2-b.y)>=Placer.MIN_AREA and (b.x2-b.x)*(b.y2-b.y)<=Placer.MAX_AREA then
                    assert(usedB[b.id],"part "..d.id.." relaxed although a free category building was left in its town")
                end
            end
        end
    else
        assert(d.matched==nil and d.cat==0,"an untagged part sits in an ordinary building")
    end
end
assert(tagged==rep.counts.tagged and matched==rep.counts.matched and relaxed==rep.counts.relaxed)
print(string.format("category match over 19 stories: tagged parts %d, matched %d, relaxed %d (%.0f%% matched)",tagged,matched,relaxed,tagged>0 and 100*matched/tagged or 0))
assert(matched>=1)
-- the two test stories
for _,s in ipairs({1,9}) do
    local r=rep.stories[s]
    print(string.format("story %d: parts %d, town %d, tagged %d, matched %d, relaxed %d, tier %s",s,r.n,r.town,r.tagged,r.matched,r.relaxed,tostring(r.tier)))
end

-- ---- objects: real items, differ across the parts of a story -------------------------------------------
local scripts do local p=io.popen('cat "'..(os.getenv("PZ_HOME") or os.getenv("HOME").."/.steam/debian-installation/steamapps/common/ProjectZomboid/projectzomboid")..'"/media/scripts/generated/items/*.txt 2>/dev/null'); scripts=p:read("*a"); p:close() end
local function checkRecipe(label,r)
    assert(#r>=2 and #r<=3,label.." has 2-3 objects")
    local seen,total={}, 0
    for _,o in ipairs(r) do
        local item=assert(Objects.get(o),label..": not in the catalogue: "..o)
        assert(not seen[o]); seen[o]=true; total=total+item.weight
        if #scripts>0 then assert(scripts:find("\n    item "..o.."\n",1,true),label..": not in the installed game: "..o) end
    end
    assert(total<=4,label.." total weight "..total)
    local pcs={}; for i,o in ipairs(r) do local it=Objects.get(o); pcs[i]={weight=it.weight,fullType=it.fullType} end
    pcs[#pcs+1]={weight=0.1,fullType="Base.Note"}
    assert(#Holders.fitting(pcs)>0,label.." fits some holder with the note")
end
local nrec=0
for pl,l in pairs(Recipes.place) do assert(pl>=1 and pl<=13); for i,r in ipairs(l) do checkRecipe("place"..pl.."/"..i,r); nrec=nrec+1 end end
for th,l in pairs(Recipes.theme) do assert(th>=1 and th<=30); for i,r in ipairs(l) do checkRecipe("theme"..th.."/"..i,r); nrec=nrec+1 end end
for i,r in ipairs(Recipes.general) do checkRecipe("general"..i,r); nrec=nrec+1 end
for pl=1,13 do assert(Recipes.place[pl] and #Recipes.place[pl]>=3,"place "..pl.." has recipes") end
if #scripts>0 then print("recipes: "..nrec.." recipes, every object exists in the installed game scripts") end
local kinds={}
for s,l in pairs(perStory) do
    local cats,seen={}, 0
    for _,d in ipairs(l) do
        local c=Objects.get(d.objects[1]).category
        assert(not cats[c],"story "..s.." repeats an object category")
        cats[c]=true; seen=seen+1
        kinds[c]=true
    end
end
local nk=0; for _ in pairs(kinds) do nk=nk+1 end
print("object categories used across all stories: "..nk)

-- ---- determinism ----------------------------------------------------------------------------------------
local function digest(list) local o={}; for _,d in ipairs(list) do o[#o+1]=d.id..":"..d.building..":"..table.concat(d.objects,"+") end; return table.concat(o,";") end
local dec2=Placer.place({},catalogue(),buildings,Recipes,SEED)
assert(digest(dec2)==digest(dec),"same seed, same scenes")
local dec3=Placer.place({},cat,buildings,Recipes,SEED+1)
assert(digest(dec3)~=digest(dec),"another seed, other scenes")
local same=0; for i,d in ipairs(dec) do if dec3[i].building==d.building then same=same+1 end end
assert(same<#dec/4,"another seed moves most scenes ("..same..")")
local seeds,differentTown=0,0
for k=1,6 do
    local dk,rk=Placer.place({},cat,buildings,Recipes,SEED*3+k)
    local u={}; for _,d in ipairs(dk) do assert(not u[d.building]); u[d.building]=true end
    assert(rk.counts.placed==19 and rk.counts.nofit==0)
    seeds=seeds+1
    if rk.stories[1].town~=rep.stories[1].town then differentTown=differentTown+1 end
end
print("six more seeds: all 19 stories placed, no building twice; the 12-part story chose another town in "..differentTown.." of 6")
-- the used set of a record keeps its buildings out of the plan
local some={}; for i=1,40 do some[dec[i].building]=true end
local dec4=Placer.place({used=some},cat,buildings,Recipes,SEED)
for _,d in ipairs(dec4) do assert(not some[d.building],"world.used is respected") end

-- ---- no claim about order -------------------------------------------------------------------------------
local shuffled=catalogue(function(c) local n=0; for id,r in pairs(c.entries) do n=n+1; if r.order then r.order=(n*7)%13+1 end end end)
local noOrder=catalogue(function(c) for id,r in pairs(c.entries) do r.order=nil end end)
assert(digest((Placer.place({},shuffled,buildings,Recipes,SEED)))==digest(dec) and digest((Placer.place({},noOrder,buildings,Recipes,SEED)))==digest(dec),
    "scrambling or dropping the order field changes nothing")
local src=read("mod-ofinterest/common/media/lua/shared/OIShared/StoryPlacer.lua")
assert(not src:find("%.order") and not src:find("byStoryIdx"),"the placer never reads an order")
for _,d in ipairs(dec) do for k in pairs(d) do assert(k~="order" and k~="next" and k~="before") end end

-- ---- the 12-part story: which towns can host it ---------------------------------------------------------
local cap={}
for _,b in ipairs(buildings) do
    local w,h=b.x2-b.x,b.y2-b.y
    if b.cat==0 and w>=Placer.MIN_SIDE and h>=Placer.MIN_SIDE and w*h>=Placer.MIN_AREA and w*h<=Placer.MAX_AREA then cap[b.town]=(cap[b.town] or 0)+1 end
end
local hosts,nohost={}, {}
for t,n in pairs(cap) do if n>=12 then hosts[#hosts+1]=t else nohost[#nohost+1]=t end end
table.sort(hosts); table.sort(nohost)
print("towns that can host the 12-part story (>=12 ordinary buildings): "..table.concat(hosts,",").."; too small: "..table.concat(nohost,","))
assert(#hosts>=5 and rep.stories[1].n==12)
-- a story that fits no town is reported, not invented
local tiny={}; for _,b in ipairs(buildings) do if b.town==7 then tiny[#tiny+1]=b end end
local _,repTiny=Placer.place({},cat,tiny,Recipes,SEED)
assert(repTiny.stories[1].status=="nofit" and repTiny.counts.nofit>=1)

-- ---- the saved world record: round trip -----------------------------------------------------------------
local function siteOf(d)
    return {id=SceneNote.areaId(d),areaId=SceneNote.areaId(d),name="x",bounds=d.bounds,source={kind="note-scene",reference=d.id},
        paperStorage="unknown",containerTypes={},excluded=false,
        story={story=d.story,part=d.part,town=d.town,area=d.area,building=d.building,cat=d.cat,matched=d.matched}}
end
local root=assert(Session.createArea(SEED)); local saved=root
local api=assert(Session.open(root,function(n) saved=n end))
for _,d in ipairs(decE) do local ok,ids=api.addNoteScene{site=siteOf(d),row=d,version="v",hours=1}; assert(ok,tostring(ids)) end
assert(Session.validate(saved),"the world record with 14 story scenes is valid")
assert(#saved.case.areas==14 and #saved.case.locations==14)
-- reload: serialise by copy, reopen, decide again: everything is "decided", nothing changes
local function copy(v) if type(v)~="table" then return v end local o={}; for k,x in pairs(v) do o[k]=copy(x) end return o end
local reloaded=copy(saved)
local api2=assert(Session.open(reloaded,function(n) reloaded=n end))
for _,d in ipairs(decE) do assert(select(2,api2.addNoteScene{site=siteOf(d),row=d,version="v2",hours=2})=="decided") end
local d5=Placer.place({enable=en},catalogue(),buildings,Recipes,SEED)
assert(digest(d5)==digest(decE),"after a reload the plan is the same as the record")
local fromRecord={}
for _,l in ipairs(reloaded.case.locations) do fromRecord[l.id]=l.story.building end
for _,d in ipairs(d5) do assert(fromRecord[SceneNote.areaId(d)]==d.building,"record and plan agree on the building") end
-- the saved site names only numbers and ids
for _,l in ipairs(reloaded.case.locations) do
    for k,v in pairs(l.story) do assert(type(v)=="number" or type(v)=="boolean" or (k=="building" and v:match("^%d+$")),"story field "..k) end
end
-- every scene row is a set whose first piece is the forced note
local rows=AreaCase.project(reloaded.case)
assert(#rows==14)

-- ---- no words in the shipped tables ---------------------------------------------------------------------
local dir="mod-ofinterest/common/media/lua/shared/OIShared/Generated/"
local bsrc=read(dir.."Buildings.lua")
local stripped=bsrc:gsub("%-%-[^\n]*",""):gsub('"[%d|]+"',"")
assert(not stripped:gsub("local B={}","",1):gsub("B%.towns=","",1):gsub("B%.rows=","",1):gsub("return B","",1):find("%a"),"a word in Buildings.lua")
local rsrc=read(dir.."Recipes.lua"):gsub("%-%-[^\n]*","")
for w in rsrc:gmatch("%a[%w_]*") do
    if not (w=="local" or w=="M" or w=="place" or w=="theme" or w=="general" or w=="return") then assert(Objects.get(w),"recipes name something that is not an object id: "..w) end
end
print("test/oi_story_placer.lua: ok")
