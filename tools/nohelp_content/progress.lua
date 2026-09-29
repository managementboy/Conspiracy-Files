-- THE NO HELP CONTENT PROGRESS LINE. Plain Lua 5.1, offline, run from the
-- repository root.
--
--   lua5.1 tools/nohelp_content/progress.lua            one line
--   lua5.1 tools/nohelp_content/progress.lua --detail   plus per place x lean x kind counts
--   lua5.1 tools/nohelp_content/progress.lua --state    also write the line into STATE.md
--
-- Prints exactly one line: "NOT DONE: <failing gates>" or "DONE-CANDIDATE",
-- then " @<short sha>" when git knows HEAD. COUNTS ONLY: the owner plays blind
-- and this line reaches CI summaries and notifications, so it never names a
-- map, flyer, scene, place instance, person or clue.
--
-- Gates (targets and thresholds: content/nohelp/targets.lua):
--   stage0 unsigned   approved/SIGNOFF does not hold the sha256 of approved/axioms.json
--   maps x/y          designs whose every mark and note has an accepted anchored clue
--   places x/y        map and flyer places the game's own decision gives their full
--                     number and both sides in each of targets.checkWorlds worlds (E7)
--   scene sides x/y   scene kinds with a clue for each side
--   floor p%          clues whose every spot is the ground, above targets.groundMax
--   flyers x/y        prints with an accepted anchored clue
--   scenes x/y        scene kinds with an accepted anchored clue ("unshipped" until
--                     Generated/VanillaScenes.lua exists)
--   persons x/y       person ids with exactly one card and at least one mention
--   sets a/b          object sets among accepted clues, below targets.setShare
--   balance p%        by the blind read (owner, 2026-09-29): clues read A only vs B only,
--                     the larger one's share above targets.leanMax
--   tickets x/y       first-release tickets accepted in the registry
--   returns n         non-empty rejected/ files not acknowledged in STATE.md OPEN RETURNS
--   stale n           deferred tickets or quarantined serials older than targets.staleDays
--   orphans n         incoming/ files whose serial is not in the registry (ORPHAN_TICKET)
--   adhd n            accepted tickets since STATE.md LAST ADHD, above targets.adhdEvery
--                     (retired by the owner 2026-09-29: targets.adhdEvery is nil)
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;tools/cluegates/?.lua;"..package.path
local J=require("json")
local Convert=dofile("tools/nohelp_content/convert.lua")
local Manifest=require("NHShared/Mystery/Manifest")
local M={}
M.ROOT="content/nohelp"
M.TARGETS="content/nohelp/targets.lua"

local function readFile(path)
    local f=io.open(path,"rb"); if not f then return nil end
    local s=f:read("*a"); f:close(); return s
end

-- STATE.md sections: {NAME = {line,...}} (blank lines dropped).
function M.readState(path)
    local out,cur={},nil
    for line in (readFile(path) or ""):gmatch("[^\r\n]+") do
        local h=line:match("^##%s+(.-)%s*$")
        if h then cur=h:upper(); out[cur]={}
        elseif cur and line:find("%S") then local t=out[cur]; t[#t+1]=line end
    end
    return out
end

local function day(s)
    local y,m,d=tostring(s or ""):match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
    if not y then return nil end
    return os.time{year=tonumber(y),month=tonumber(m),day=tonumber(d),hour=12}
end

function M.shortSha()
    local p=io.popen("git rev-parse --short HEAD 2>/dev/null")
    if not p then return nil end
    local s=p:read("*l"); p:close()
    return s and s:match("^%x+$") and s or nil
end

-- opts: root, targets (table), registry (table) or registryPath, statePath,
-- today ("YYYY-MM-DD"), sha (string, or false for none). Returns the line
-- and the detail line.
function M.measure(opts)
    opts=opts or {}
    local root=opts.root or M.ROOT
    local T=opts.targets or dofile(opts.targetsPath or M.TARGETS)
    local reg=opts.registry or Convert.loadRegistry(opts.registryPath)
    local state=M.readState(opts.statePath or (root.."/STATE.md"))
    local today=day(opts.today or os.date("%Y-%m-%d"))
    local accepted=Convert.loadAccepted(root)
    local fails={}
    local function fail(s) fails[#fails+1]=s end

    -- Stage 0.
    local axioms=readFile(root.."/approved/axioms.json")
    local signoff=readFile(root.."/approved/SIGNOFF")
    if not (axioms and signoff and signoff:find(require("sha256")(axioms),1,true)) then fail("stage0 unsigned") end

    -- Accepted clues, by anchor key.
    local rows={}
    local names={}
    for name in pairs(accepted) do names[#names+1]=name end
    table.sort(names)
    for _,name in ipairs(names) do for _,c in ipairs(accepted[name]) do rows[#rows+1]=c end end
    local anchored={}
    for _,c in ipairs(rows) do
        local k=Manifest.anchorKey(c.anchor)
        if k then anchored[k]=true end
    end

    -- Maps, flyers, scenes.
    local maps=0
    for _,d in ipairs(T.designOrder) do
        local keys,ok=T.designs[d],true
        for _,k in ipairs(keys) do if not anchored[k] then ok=false; break end end
        if ok and #keys>0 then maps=maps+1 end
    end
    if maps<#T.designOrder then fail("maps "..maps.."/"..#T.designOrder) end
    -- PLAYABLE COVERAGE (E7, DR-20260929-NOHELP-GAP-PLAN): every map and
    -- flyer place run through the game's own decision (AreaCase.decide, with
    -- MapSiteArgs as the runtime passes it) in T.checkWorlds worlds; a place
    -- is ready when every world gives it its full number and both sides.
    if T.checkWorlds and T.checkWorlds>0 then
        local Sites=require("NHShared/Generated/MapSites")
        local AreaCase=require("NHShared/Generated/AreaCase")
        local Args=require("NHShared/Generated/MapSiteArgs")
        local ready,all=0,0
        for _,e in ipairs(Sites.sites) do
            all=all+1
            local designs=Args.designsOf(e)
            local ok=true
            for seed=1,T.checkWorlds do
                local next=AreaCase.decide{case=AreaCase.new(seed),site={id=e.areaId,bounds=e.bounds},place=e.place,
                    designs=#designs>0 and designs or nil,marks=Args.ownMarksOf(e,designs),anchors=Args.anchorsOf(e),
                    clues=rows,version=Manifest.VERSION,hours=0}
                local area=next and next.areas[#next.areas]
                if not area or (area.short or 0)>0 then ok=false; break end
                local sides={}
                for i=area.first,area.first+area.count-1 do sides[next.documents[i].lean]=true end
                if not (sides.containment and sides.agricultural) then ok=false; break end
            end
            if ok then ready=ready+1 end
        end
        if ready<all then fail("places "..ready.."/"..all) end
        -- Every scene kind has a clue for each side (the world draws one).
        local Scenes=require("NHShared/Generated/VanillaScenes")
        local both,kinds=0,0
        for _,kind in ipairs(Scenes.allowedKinds()) do
            kinds=kinds+1
            local spot,side=Scenes.spotFor(kind),{}
            for _,c in ipairs(rows) do
                if type(c.anchor)=="table" and c.anchor.scene==kind then
                    for _,w in ipairs(c.where or {}) do if w.spot==spot then side[w.lean]=true end end
                end
            end
            -- A kind whose fit pair rules a side out needs only the other.
            local r=Scenes.get(kind)
            if (side.containment or r.c==0) and (side.agricultural or r.a==0) then both=both+1 end
        end
        if both<kinds then fail("scene sides "..both.."/"..kinds) end
    end
    local flyers=0
    for _,p in ipairs(T.prints) do if anchored["print:"..p] then flyers=flyers+1 end end
    if flyers<#T.prints then fail("flyers "..flyers.."/"..#T.prints) end
    if not T.scenesShipped then fail("scenes unshipped")
    else
        local n=0
        for _,k in ipairs(T.scenes) do if anchored["scene:"..k] then n=n+1 end end
        if n<#T.scenes then fail("scenes "..n.."/"..#T.scenes) end
    end

    -- Persons: exactly one card, at least one mention.
    local persons={}
    for _,c in ipairs(rows) do
        if type(c.person)=="string" then
            local p=persons[c.person] or {cards=0,mentions=0}
            persons[c.person]=p
            if c.kind=="written" and Manifest.CARD_KINDS[c.pieces and c.pieces[1]] then p.cards=p.cards+1
            else p.mentions=p.mentions+1 end
        end
    end
    local pAll,pDone=0,0
    for _,p in pairs(persons) do
        pAll=pAll+1
        if p.cards==1 and p.mentions>=1 then pDone=pDone+1 end
    end
    if pDone<pAll then fail("persons "..pDone.."/"..pAll) end

    -- Set share and lean balance; the detail counts.
    local sets=0
    local lean={}
    local detail={}
    for _,c in ipairs(rows) do
        if c.kind=="set" then sets=sets+1 end
        for _,w in ipairs(c.where or {}) do
            lean[w.lean]=(lean[w.lean] or 0)+1
            local key=tostring(w.place).."/"..tostring(w.lean).."/"..tostring(c.kind)
            detail[key]=(detail[key] or 0)+1
        end
    end
    if #rows==0 or sets<T.setShare*#rows then fail("sets "..sets.."/"..#rows) end
    -- The floor (owner, 2026-09-29): under T.groundMax of all clues lie loose.
    if T.groundMax then
        local ground=0
        for _,c in ipairs(rows) do
            local only=true
            for _,w in ipairs(c.where or {}) do if w.spot~="ground" then only=false end end
            if only and #(c.where or {})>0 then ground=ground+1 end
        end
        if #rows>0 and ground>T.groundMax*#rows then fail("floor "..math.floor(100*ground/#rows+0.5).."%") end
    end
    -- Balance by what a reader sees (DR-20260929-NOHELP-BALANCE-BY-READ):
    -- each accepted clue's blind-read receipt, A only against B only.
    local reads={A=0,B=0}
    local rdir=opts.receiptsDir or "tools/cluegates/receipts"
    for _,c in ipairs(rows) do
        local r=J.decode(readFile(rdir.."/"..tostring(c.id)..".json") or "null")
        local v=type(r)=="table" and r.votes or {}
        if (v.A or 0)>0 then reads.A=reads.A+1 elseif (v.B or 0)>0 then reads.B=reads.B+1 end
    end
    local one=reads.A+reads.B
    local top=math.max(reads.A,reads.B)
    if one>0 and top>T.leanMax*one then fail("balance "..math.floor(100*top/one+0.5).."%") end

    -- First-release tickets.
    local want,got=0,0
    for _,t in ipairs(T.typeOrder) do
        local need=T.firstRelease[t] or 0
        local n=0
        for _,r in pairs(reg) do if r.type==t and r.status=="accepted" then n=n+1 end end
        want,got=want+need,got+math.min(n,need)
    end
    if got<want then fail("tickets "..got.."/"..want) end

    -- Open returns.
    local acked={}
    for _,line in ipairs(state["OPEN RETURNS"] or {}) do
        local s=line:match("(T%d+)%s+ACK")
        if s then acked[s]=true end
    end
    local returns=0
    for _,name in ipairs(Convert.listJson(root.."/rejected")) do
        local data=J.decode(readFile(root.."/rejected/"..name..".json") or "")
        if type(data)=="table" and #data>0 and not acked[name] then returns=returns+1 end
    end
    if returns>0 then fail("returns "..returns) end

    -- Stale deferrals and quarantine.
    local stale=0
    local limit=T.staleDays*86400
    for _,r in pairs(reg) do
        if r.status=="deferred" then
            local since=day(r.closed~="" and r.closed or r.opened)
            if since and today-since>limit then stale=stale+1 end
        end
    end
    for _,line in ipairs(state["QUARANTINE"] or {}) do
        local s,d=line:match("(T%d+)%s+since%s+(%d%d%d%d%-%d%d%-%d%d)")
        if s and today-day(d)>limit then stale=stale+1 end
    end
    if stale>0 then fail("stale "..stale) end

    -- Orphans.
    local orphans=0
    for _,name in ipairs(Convert.listJson(root.."/incoming")) do
        if not reg[name] then orphans=orphans+1 end
    end
    if orphans>0 then fail("orphans "..orphans) end

    -- ADHD cadence.
    local last=((state["LAST ADHD"] or {})[1] or ""):match("(T%d+)")
    local since=0
    for s,r in pairs(reg) do
        if r.status=="accepted" and r.type~="STAGE0" and (not last or s>last) then since=since+1 end
    end
    if T.adhdEvery and since>T.adhdEvery then fail("adhd "..since) end

    local line=#fails==0 and "DONE-CANDIDATE" or ("NOT DONE: "..table.concat(fails,", "))
    local sha=opts.sha
    if sha==nil then sha=M.shortSha() end
    if sha then line=line.." @"..sha end

    local parts={}
    for _,place in ipairs(Manifest.PLACES) do
        local cells={}
        for _,l in ipairs(Manifest.LEANS) do
            cells[#cells+1]=l:sub(1,1)..":s"..(detail[place.."/"..l.."/set"] or 0).."w"..(detail[place.."/"..l.."/written"] or 0)
        end
        parts[#parts+1]=place.." "..table.concat(cells," ")
    end
    return line,"detail: "..table.concat(parts,"; ")
end

-- Rewrite STATE.md's PROGRESS section with the line.
function M.writeState(path,line)
    local text=readFile(path) or ""
    local head=text:match("^(.-\n##%s+PROGRESS%s*\n)")
    if not head then head=text..(text:find("\n$") and "" or "\n").."\n## PROGRESS\n" end
    local f=assert(io.open(path,"wb")); f:write(head..line.."\n"); f:close()
end

if arg and arg[0] and arg[0]:find("nohelp_content[/\\]progress%.lua$") then
    local detail,state=false,false
    for _,a in ipairs(arg) do
        if a=="--detail" then detail=true elseif a=="--state" then state=true end
    end
    local line,det=M.measure{}
    print(line)
    if detail then print(det) end
    if state then M.writeState(M.ROOT.."/STATE.md",line) end
end
return M
