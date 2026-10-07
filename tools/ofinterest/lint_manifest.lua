-- MANIFEST LINTER (Of Interest phase 6). Plain Lua 5.1; run from the repo root:
--     lua5.1 tools/ofinterest/lint_manifest.lua [--seeds N] [--quiet]
-- Runs the pure placers (stories, then the standalone batch) on the SHIPPED tables over N world seeds (default 8),
-- once with the shipped host switches and once with vehicle and body hosts forced on, and enforces:
--   resolvable rows (note id in the note table and catalogue, building in Buildings, recipe objects real, row
--   valid for SceneNote); no note twice; no building twice; place agrees with the note's table code and the
--   objects come from the recipe lists of that place / the note's themes / the general list; per-story counts;
--   per-town minimum; total within target +-10%; per-town density inside the band; host caps; determinism
--   (same seed -> byte-identical output); every note accounted for by exactly one outcome or rejection reason;
--   object plausibility per place (OIShared/Plausibility); shipped tables hold only numbers and ids.
-- Warns (never fails) on dead zones. Prints one stats line per configuration. Ids, codes and counts only: no
-- note text is read or printed anywhere.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;"..package.path
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

local L={}
L.BAND_LOW=0.4        -- a town's scenes per usable building, as a share of the world's mean
L.BAND_HIGH=3.0
L.BAND_MIN_BUILDINGS=50   -- smaller towns are exempt from the band (a floor or a few stories dominate them)
L.TOLERANCE=0.10
L.DEAD_ZONE=150       -- tiles to the nearest other scene

local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end

local function catalogue()
    local c={entries={}}
    for id,t in pairs(Tables) do
        local r={id=id,story=t[1]>0 and t[1] or nil,order=t[2]>0 and t[2] or nil,place=t[3]>0 and t[3] or nil,themes={},conf=t[5]>0 and t[5] or nil}
        for i,th in ipairs(t[4]) do r.themes[i]=th end
        c.entries[id]=r
    end
    return c
end

-- the whole generated placement for one seed and one host configuration: stories then batch
local function generate(seed,hosts,buildings,cat)
    local en={}; for _,s in ipairs(Enable) do en[s]=true end
    local st,srep=Story.place({enable=en},cat,buildings,Recipes,seed)
    local bt,brep=Batch.place({},cat,buildings,Recipes,seed,st,{target=Config.target,minTown=Config.minTown,hosts=hosts,hostTables=HostTypes})
    return st,srep,bt,brep
end
local function digest(st,bt)
    local o={}
    for _,list in ipairs({st,bt}) do
        for _,d in ipairs(list) do
            o[#o+1]=table.concat({d.id,d.noteId,tostring(d.host),d.building,table.concat(d.objects,"+"),tostring(d.matched),
                table.concat(d.vehicles or {},","),tostring(d.outfit)},":")
        end
    end
    return table.concat(o,";")
end

-- shipped tables carry no words: every string is a known id
local function checkShipped(fails)
    local dir="mod-ofinterest/common/media/lua/shared/OIShared/Generated/"
    local function strip(s) return (s:gsub("%-%-[^\n]*","")) end
    local vehicles={}
    for _,l in pairs(HostTypes.vehicles) do for _,v in ipairs(l) do vehicles[v]=true end end
    local names={}
    for _,l in pairs(HostTypes.outfits) do for _,v in ipairs(l) do names[v]=true end end
    for _,v in pairs(HostTypes.outfit) do names[v]=true end
    for _,f in ipairs({"Recipes.lua","HostTypes.lua","BatchConfig.lua","StoryEnable.lua"}) do
        local src=strip(read(dir..f))
        for w in src:gmatch('"([^"]*)"') do
            if not (Objects.get(w) or vehicles[w] or names[w]) then fails[#fails+1]="shipped "..f.." holds a string that is not an id: "..w end
        end
    end
    local src=strip(read(dir.."Buildings.lua")):gsub('"[%d|]+"','')
    if src:gsub("local B={}",""):gsub("B%.towns=",""):gsub("B%.rows=",""):gsub("return B",""):find("%a") then fails[#fails+1]="a word in Buildings.lua" end
    src=strip(read(dir.."NoteTables.lua"))
    for w in src:gmatch('"([^"]*)"') do
        if not w:match("^%a+/[%w/]*%d+$") then fails[#fails+1]="NoteTables holds a string that is not a note id: "..w end
    end
    src=strip(read(dir.."NoteTables.lua")):gsub('%["[%w/]+"%]',''):gsub("[%d,{}=%s]",""):gsub("local%s*",""):gsub("return","")
    if src:find("%a") then fails[#fails+1]="NoteTables holds a word" end
end

local function median(l)
    if #l==0 then return 0 end
    table.sort(l)
    return l[math.floor((#l+1)/2)]
end

-- lint one generated placement; returns stats
local function lint(label,seed,st,srep,bt,brep,buildings,byId,cat,fails,hostsOn)
    local function fail(m) fails[#fails+1]=label.." seed "..seed..": "..m end
    local all={}
    for _,d in ipairs(st) do all[#all+1]=d end
    for _,d in ipairs(bt) do all[#all+1]=d end
    local notes,blds,ids={}, {}, {}
    local perStory,perTown,host={}, {}, {building=0,vehicle=0,body=0}
    local tagged,matched=0,0
    local eligTown={}
    for _,b in ipairs(buildings) do if Story.eligible(b) then eligTown[b.town]=(eligTown[b.town] or 0)+1 end end
    for _,d in ipairs(all) do
        -- resolvable
        local t=Tables[d.noteId]
        if not t then fail("note not in the note table: "..tostring(d.noteId)) end
        if not cat.entries[d.noteId] then fail("note not in the catalogue: "..tostring(d.noteId)) end
        local b=byId[d.building]
        if not b then fail("building not in Buildings: "..tostring(d.building)) end
        local okRow,why=SceneNote.check(d)
        if not okRow then fail("row not valid for SceneNote ("..tostring(why).."): "..tostring(d.id)) end
        for _,o in ipairs(d.objects) do if not Objects.get(o) then fail("object type does not exist: "..tostring(o)) end end
        -- unique
        if notes[d.noteId] then fail("note used twice: "..d.noteId) end; notes[d.noteId]=true
        if blds[d.building] then fail("building used twice: "..d.building) end; blds[d.building]=true
        if ids[d.id] then fail("scene id twice: "..d.id) end; ids[d.id]=true
        -- agree
        if t then
            local want=t[3]>0 and t[3] or nil
            if d.place~=want then fail("place disagrees with the note table: "..d.id) end
            if d.story and d.story~=t[1] then fail("story disagrees with the note table: "..d.id) end
            local fromList=false
            local function inList(list) for _,r in ipairs(list or {}) do
                local same=#r==#d.objects
                if same then for i,o in ipairs(r) do if d.objects[i]~=o then same=false end end end
                if same then return true end
            end return false end
            if want and inList(Recipes.place[want]) then fromList=true end
            if not fromList then for _,th in ipairs(t[4]) do if inList(Recipes.theme[th]) then fromList=true end end end
            if not fromList and inList(Recipes.general) then fromList=true end
            if not fromList then fail("objects are from no recipe of the note's place, themes or the general list: "..d.id) end
            -- plausibility, by the note's place and (if matched in a category building) the building's place
            local bad,item,kind=Plausible.denied(want,d.objects)
            if bad then fail("implausible object "..item.." ("..kind..") for place "..tostring(want)..": "..d.id) end
            if b and b.cat>0 and d.host=="building" then
                local bad2,item2,kind2=Plausible.denied(b.cat,d.objects)
                if bad2 then fail("implausible object "..item2.." ("..kind2..") for building category "..b.cat..": "..d.id) end
            end
        end
        if b and (b.town~=d.town or b.area~=d.area) then fail("town/area disagree with the building: "..d.id) end
        -- counts
        if d.story then perStory[d.story]=(perStory[d.story] or 0)+1 end
        perTown[d.town]=(perTown[d.town] or 0)+1
        local hk=d.host or "building"
        host[hk]=(host[hk] or 0)+1
        if hk~="building" then
            if hk=="vehicle" and not (d.vehicles and #d.vehicles>0 and HostTypes.vehicles[d.place]) then fail("vehicle host without a vehicle type: "..d.id) end
            if hk=="body" and not (d.outfit and HostTypes.outfit[d.place]==d.outfit) then fail("body host without its outfit class: "..d.id) end
            if not d.place then fail("a vehicle/body host needs a place-tagged note: "..d.id) end
        end
        if d.standalone and d.place then
            tagged=tagged+1
            if d.matched then matched=matched+1; if d.host=="building" and (not b or b.cat~=d.place) then fail("matched but not in a building of the category: "..d.id) end end
        end
    end
    -- stories: every part of every placed story, none from a held-back one
    local want={}
    for id,r in pairs(cat.entries) do if r.story then want[r.story]=(want[r.story] or {n=0,low=false}); want[r.story].n=want[r.story].n+1; if r.conf==1 then want[r.story].low=true end end end
    for s,w in pairs(want) do
        local got=perStory[s] or 0
        local enabled=false; for _,e in ipairs(Enable) do if e==s then enabled=true end end
        if w.low or not enabled then if got~=0 then fail("story "..s.." is held back but has "..got.." scenes") end
        elseif got~=w.n then fail("story "..s.." has "..got.." scenes, expected "..w.n) end
    end
    -- totals
    local total=#all
    if math.abs(total-Config.target)>Config.target*L.TOLERANCE then fail("total "..total.." outside "..Config.target.." +-10%") end
    local mean=total/(function() local n=0; for _,e in pairs(eligTown) do n=n+e end return n end)()
    local tmin,tmax=1e9,0
    for t,e in pairs(eligTown) do
        local n=perTown[t] or 0
        if n<math.min(Config.minTown,e) then fail("town "..t.." has "..n.." scenes, minimum "..math.min(Config.minTown,e)) end
        if n<tmin then tmin=n end; if n>tmax then tmax=n end
        if e>=L.BAND_MIN_BUILDINGS then
            local dens=n/e/mean
            if dens<L.BAND_LOW or dens>L.BAND_HIGH then fail(string.format("town %d density %.2f x the mean is outside the band [%.1f,%.1f]",t,dens,L.BAND_LOW,L.BAND_HIGH)) end
        end
    end
    -- host caps
    local standalone=#bt
    if host.vehicle>math.floor(Batch.VEHICLE_CAP*(Config.target-#st)) then fail("vehicle hosts "..host.vehicle.." over the cap") end
    if host.body>math.floor(Batch.BODY_CAP*(Config.target-#st)) then fail("body hosts "..host.body.." over the cap") end
    local vp,bp={}, {}
    for _,d in ipairs(bt) do
        if d.host=="vehicle" then vp[d.town]=(vp[d.town] or 0)+1; if vp[d.town]>Batch.VEHICLES_PER_TOWN then fail("town "..d.town.." has too many vehicle hosts") end end
        if d.host=="body" then bp[d.town]=(bp[d.town] or 0)+1; if bp[d.town]>Batch.BODIES_PER_TOWN then fail("town "..d.town.." has too many body hosts") end end
    end
    if not hostsOn and (host.vehicle>0 or host.body>0) then fail("a host kind that is switched off was used") end
    -- rejection accounting: every note has exactly one outcome
    local R=brep.reasons
    for k,v in pairs(R) do if type(v)~="number" or v<0 then fail("reason "..k.." is not a count") end end
    local accounted=#st+R.heldBack+#bt+R.notDrawn+R.densityBand+R.noFit+R.noRecipe
    local notes500=0; for _ in pairs(cat.entries) do notes500=notes500+1 end
    if accounted~=notes500 then fail("notes accounted "..accounted.." of "..notes500) end
    if R.heldBack~=(function() local n=0; for id,r in pairs(cat.entries) do if r.story and r.conf==1 then n=n+1 end end return n end)() then fail("held-back count wrong") end
    -- dead zones (warn only)
    local nn={}
    local dead={}
    for i,a in ipairs(all) do
        local ba=byId[a.building]
        local best=1e9
        for j,c in ipairs(all) do
            if i~=j then
                local bc=byId[c.building]
                local d=math.max(math.abs(ba.cx-bc.cx),math.abs(ba.cy-bc.cy))
                if d<best then best=d end
            end
        end
        nn[#nn+1]=best
        if best>L.DEAD_ZONE then dead[a.town]=true end
    end
    local deadTowns=0; for _ in pairs(dead) do deadTowns=deadTowns+1 end
    return {total=total,stories=#st,standalone=standalone,host=host,tagged=tagged,matched=matched,tmin=tmin,tmax=tmax,
        median=median(nn),deadTowns=deadTowns,reasons=R,perTown=perTown}
end

function L.run(args)
    args=args or {}
    local N=args.seeds or 8
    local fails,warns={}, {}
    local buildings=Story.parseBuildings(BData)
    local byId={}; for _,b in ipairs(buildings) do byId[b.id]=b end
    local cat=catalogue()
    checkShipped(fails)
    local stats
    for _,cfg in ipairs({{"shipped",Config.hosts,(Config.hosts.vehicle or Config.hosts.body) and true or false},{"hosts-on",{vehicle=true,body=true},true}}) do
        local agg={totalMin=1e9,totalMax=0,veh=0,bod=0,standalone=0,tagged=0,matched=0,tmin=1e9,tmax=0,medMin=1e9,medMax=0,dead=0,reasons={}}
        for k=1,N do
            local seed=1000003*k+17
            local st,srep,bt,brep=generate(seed,cfg[2],buildings,cat)
            local d1=digest(st,bt)
            local st2,_,bt2=generate(seed,cfg[2],buildings,cat)
            if digest(st2,bt2)~=d1 then fails[#fails+1]=cfg[1].." seed "..seed..": not deterministic" end
            local s=lint(cfg[1],seed,st,srep,bt,brep,buildings,byId,cat,fails,cfg[3])
            agg.totalMin=math.min(agg.totalMin,s.total); agg.totalMax=math.max(agg.totalMax,s.total)
            agg.veh=agg.veh+s.host.vehicle; agg.bod=agg.bod+s.host.body; agg.standalone=agg.standalone+s.standalone
            agg.tagged=agg.tagged+s.tagged; agg.matched=agg.matched+s.matched
            agg.tmin=math.min(agg.tmin,s.tmin); agg.tmax=math.max(agg.tmax,s.tmax)
            agg.medMin=math.min(agg.medMin,s.median); agg.medMax=math.max(agg.medMax,s.median)
            agg.dead=agg.dead+s.deadTowns
            for r,v in pairs(s.reasons) do agg.reasons[r]=(agg.reasons[r] or 0)+v end
        end
        local rs={}
        for _,r in ipairs({"heldBack","notDrawn","noCategoryBuilding","densityBand","noFit","noRecipe","hostCap"}) do rs[#rs+1]=r.."="..(agg.reasons[r] or 0) end
        local line=string.format("manifest[%s] %d seeds: scenes %d..%d; standalone vehicle %.1f%% body %.1f%%; category match %.0f%% of %d tagged; per-town %d..%d; nearest-scene median %d..%d tiles, towns with dead zones (>%d) %d (warn only); reasons(sum) %s",
            cfg[1],N,agg.totalMin,agg.totalMax,100*agg.veh/agg.standalone,100*agg.bod/agg.standalone,agg.tagged>0 and 100*agg.matched/agg.tagged or 0,agg.tagged,
            agg.tmin,agg.tmax,agg.medMin,agg.medMax,L.DEAD_ZONE,agg.dead,table.concat(rs," "))
        if not args.quiet then print(line) end
        stats=stats or line
        if agg.dead>0 then warns[#warns+1]=cfg[1]..": "..agg.dead.." town-seeds with a scene farther than "..L.DEAD_ZONE.." tiles from any other" end
    end
    return fails,warns
end

if arg and arg[0] and arg[0]:find("lint_manifest") then
    local n=8
    for i,a in ipairs(arg) do if a=="--seeds" then n=tonumber(arg[i+1]) or 8 end end
    local t0=os.clock()
    local fails,warns=L.run({seeds=n})
    for _,w in ipairs(warns) do print("warn: "..w) end
    for i,f in ipairs(fails) do if i<=30 then print("FAIL: "..f) end end
    if #fails>30 then print("... and "..(#fails-30).." more") end
    print(string.format("lint_manifest: %s (%d failures, %.1f s)",#fails==0 and "ok" or "FAILED",#fails,os.clock()-t0))
    os.exit(#fails==0 and 0 or 1)
end
return L
