-- STANDALONE BATCH PLACER (Of Interest phase 6). PURE: no engine, no globals. After the stories, the notes that
-- belong to no story get scenes too, from the world seed alone:
--   * every PLACE-TAGGED standalone note gets a scene; of the untagged ones, as many as it takes to reach the
--     target total (about 1 in 3), drawn by a hash of (seed, note id) - never by theme;
--   * a note is used once world-wide, a building once (stories included); every skip is counted by REASON;
--   * SPREAD: each town gets a minimum; the town's share follows its count of usable buildings through a
--     damped weight (n^0.75), then is reduced by half the story parts the town already holds (standalone
--     scenes are softly repelled from story-heavy towns); inside a town each pick takes the best of a few
--     hashed candidates (farthest from the scenes already there);
--   * HOSTS: a building first (category match, else an ordinary building of the town: "relaxed"); a tagged
--     note whose category building is gone may instead sit in a VEHICLE of a fitting type or on a BODY in a
--     fitting outfit class (flags in opts.hosts; caps: vehicles <=15%, bodies <=10% of the standalone scenes,
--     at most 2 vehicle and 1 body host per town). A vehicle/body scene is anchored at a building (its site).
-- Ids, codes and counts only; nothing here knows any note text.
local Pick=require("OIShared/Generated/Pick")
local Story=require("OIShared/StoryPlacer")
local Plausible=require("OIShared/Plausibility")
local B={}
B.TARGET=250
B.MIN_TOWN=5
B.FIRST_SCENE=200       -- scene ids ns(200+rank of the note among the standalone ids): stable whatever is placed
B.REPEL=0.5
B.CANDIDATES=6
B.VEHICLE_CAP=0.15
B.BODY_CAP=0.10
B.VEHICLES_PER_TOWN=2
B.BODIES_PER_TOWN=1

local function h(...) return Pick.hash(Pick.key({...})) end
local function sortedKeys(t) local o={}; for k in pairs(t) do o[#o+1]=k end; table.sort(o); return o end
local function sqrt4(e) local s=math.sqrt(e); return s*math.sqrt(s) end   -- e^0.75 from correctly rounded square roots

-- town quotas: standalone scenes per town. towns[t]={elig=,free=}; storyN[t]; returns q[t] integers
function B.quotas(towns,storyN,total,minTown,grand)
    local ids=sortedKeys(towns)
    local wsum=0
    for _,t in ipairs(ids) do towns[t].w=sqrt4(towns[t].elig); wsum=wsum+towns[t].w end
    local raw,lb,ub={}, {}, {}
    local want=0
    for _,t in ipairs(ids) do
        local T=towns[t]; local s=storyN[t] or 0
        raw[t]=math.max(0,(grand or total)*T.w/wsum-B.REPEL*s)
        ub[t]=T.free
        lb[t]=math.min(math.max(0,math.min(minTown,T.elig)-s),ub[t])
    end
    local function sumAt(l)
        local n=0
        for _,t in ipairs(ids) do n=n+math.min(ub[t],math.max(lb[t],raw[t]*l)) end
        return n
    end
    local ubSum=0; for _,t in ipairs(ids) do ubSum=ubSum+ub[t] end
    total=math.min(total,ubSum)
    local lo,hi=0,1e6
    for _=1,80 do local mid=(lo+hi)/2; if sumAt(mid)<total then lo=mid else hi=mid end end
    local q,frac,sum={}, {}, 0
    for _,t in ipairs(ids) do
        local v=math.min(ub[t],math.max(lb[t],raw[t]*hi))
        q[t]=math.floor(v); frac[t]=v-q[t]; sum=sum+q[t]
    end
    local order={}
    for _,t in ipairs(ids) do order[#order+1]=t end
    table.sort(order,function(a,b) if frac[a]~=frac[b] then return frac[a]>frac[b] end return a<b end)
    local i=1
    while sum<total and i<=#order*4 do
        local t=order[(i-1)%#order+1]
        if q[t]<ub[t] then q[t]=q[t]+1; sum=sum+1 end
        i=i+1
    end
    return q
end

-- place(world, catalogue, buildings, recipes, seed, stories [, opts]) -> decisions, report
--   stories: the story placer's decisions (their buildings and per-town counts are known)
--   opts: {target=250, minTown=5, hosts={vehicle=false,body=false}, hostTables=Generated/HostTypes, tick=function}
-- decision: {id,standalone=true,host="building"|"vehicle"|"body",noteId,place,objects,where,bounds,building,area,
--   town,cat,matched (tagged only: the host fits the place; a building of the category, or a fitting vehicle/body),vehicles={script ids} | outfit=class}
-- report: {counts={...},reasons={...},perTown={[t]={elig=,story=,quota=,placed=}},standalone=N}
function B.place(world,catalogue,buildings,recipes,seed,stories,opts)
    opts=opts or {}
    local target=opts.target or B.TARGET
    local minTown=opts.minTown or B.MIN_TOWN
    local hosts=opts.hosts or {}
    local HT=opts.hostTables
    local tick=opts.tick or function() end
    local used={}
    for id in pairs((world or {}).used or {}) do used[id]=true end
    local storyN={}
    for _,d in ipairs(stories or {}) do used[d.building]=true; storyN[d.town]=(storyN[d.town] or 0)+1 end
    local nStory=#(stories or {})
    local R={counts={tagged=0,untagged=0,placed=0,matched=0,relaxed=0,building=0,vehicle=0,body=0},
        reasons={heldBack=0,notDrawn=0,densityBand=0,noFit=0,noRecipe=0,hostCap=0,noCategoryBuilding=0},perTown={}}
    -- standalone notes, ids by rank
    local ids={}
    for id,rec in pairs(catalogue.entries or {}) do
        if not rec.story then ids[#ids+1]=id elseif rec.conf==1 then R.reasons.heldBack=R.reasons.heldBack+1 end
    end
    table.sort(ids)
    local sceneOf={}
    for r,id in ipairs(ids) do sceneOf[id]=string.format("ns%03d",B.FIRST_SCENE+r) end
    R.standalone=#ids
    -- buildings: per town, ordinary and by category, each list in a seeded order
    local towns,perB={}, {}
    local order={}
    for _,b in ipairs(buildings) do
        if Story.eligible(b) then order[#order+1]={b=b,k=h(seed,"bo",b.id)} end
    end
    tick()
    table.sort(order,function(a,c) if a.k~=c.k then return a.k<c.k end return a.b.id<c.b.id end)
    tick()
    for _,e in ipairs(order) do
        local b=e.b
        local T=towns[b.town]; if not T then T={ord={},bycat={},elig=0,free=0,ordPos=1,chosen={}}; towns[b.town]=T end
        T.elig=T.elig+1
        if not used[b.id] then
            T.free=T.free+1
            if b.cat==0 then T.ord[#T.ord+1]=b else
                local l=T.bycat[b.cat]; if not l then l={}; T.bycat[b.cat]=l end
                l[#l+1]=b
            end
        end
    end
    -- the quota
    local total=math.max(0,target-nStory)
    local q=B.quotas(towns,storyN,total,minTown,target)
    local rem={}
    for t,T in pairs(towns) do
        rem[t]=q[t] or 0
        R.perTown[t]={elig=T.elig,story=storyN[t] or 0,quota=q[t] or 0,placed=0}
    end
    local townIds=sortedKeys(towns)
    local quotaSum=0; for _,t in ipairs(townIds) do quotaSum=quotaSum+(q[t] or 0) end
    R.quotaTotal=quotaSum
    -- picking a building: best of the first CANDIDATES free ones of a list (farthest from the town's scenes)
    local function takeFrom(list,T)
        local cand,idx={}, {}
        for i,b in ipairs(list) do
            if not used[b.id] then cand[#cand+1]=b; idx[#idx+1]=i; if #cand>=B.CANDIDATES then break end end
        end
        if #cand==0 then return nil end
        local best,bestD,bestI
        for k,b in ipairs(cand) do
            local d=1e9
            for _,c in ipairs(T.chosen) do
                local dd=math.max(math.abs(b.cx-c.cx),math.abs(b.cy-c.cy))
                if dd<d then d=dd end
            end
            if not best or d>bestD then best,bestD,bestI=b,d,idx[k] end
        end
        table.remove(list,bestI)
        return best
    end
    local function bestTown(candidates,noteId)
        local best,bq,br,bt
        for _,t in ipairs(candidates) do
            if rem[t]>0 then
                local tie=h(seed,"town",noteId,t)
                -- fullest-unfilled first: rem/quota larger wins, compared by cross-multiplication
                if not best or rem[t]*bq>br*q[t] or (rem[t]*bq==br*q[t] and tie<bt) then best,bq,br,bt=t,q[t],rem[t],tie end
            end
        end
        return best
    end
    local out={}
    local vehicleCount,bodyCount,vehPer,bodPer=0,0,{},{}
    local function addScene(id,t,b,host,matched,extra)
        local rec=catalogue.entries[id]
        local recipe=Story.chooseRecipe(seed,id,rec,recipes,{})
        if not recipe then R.reasons.noRecipe=R.reasons.noRecipe+1; return false end
        local objs={}; for i,o in ipairs(recipe) do objs[i]=o end
        local T=towns[t]
        T.chosen[#T.chosen+1]=b
        used[b.id]=true
        rem[t]=rem[t]-1
        local d={id=sceneOf[id],standalone=true,host=host,noteId=id,place=rec.place,objects=objs,where={kind="ground"},
            bounds={x1=b.x,y1=b.y,x2=b.x2,y2=b.y2,z=0},building=b.id,area=b.area,town=t,cat=b.cat,matched=matched}
        if extra then for k,v in pairs(extra) do d[k]=v end end
        out[#out+1]=d
        R.perTown[t].placed=R.perTown[t].placed+1
        R.counts.placed=R.counts.placed+1
        R.counts[host]=R.counts[host]+1
        if rec.place then
            R.counts.tagged=R.counts.tagged+1
            if matched then R.counts.matched=R.counts.matched+1 else R.counts.relaxed=R.counts.relaxed+1 end
        else R.counts.untagged=R.counts.untagged+1 end
        return true
    end
    local tagged,untagged={}, {}
    for _,id in ipairs(ids) do
        if catalogue.entries[id].place then tagged[#tagged+1]=id else untagged[#untagged+1]=id end
    end
    table.sort(tagged,function(a,c) return h(seed,"tag",a)<h(seed,"tag",c) end)
    table.sort(untagged,function(a,c) return h(seed,"draw",a)<h(seed,"draw",c) end)
    tick()
    local vehicleCap=math.floor(B.VEHICLE_CAP*total)
    local bodyCap=math.floor(B.BODY_CAP*total)
    local function hostFor(id,rec,kind)
        if not (hosts[kind] and HT and rec.place) then return nil end
        if kind=="vehicle" then return HT.vehicles[rec.place] end
        return HT.outfit[rec.place]
    end
    -- 1) place-tagged notes: category building, else a vehicle or body host, else an ordinary building
    for n,id in ipairs(tagged) do
        if n%16==0 then tick() end
        local rec=catalogue.entries[id]
        local p=rec.place
        local done=false
        local cands={}
        for _,t in ipairs(townIds) do if towns[t].bycat[p] and #towns[t].bycat[p]>0 then cands[#cands+1]=t end end
        local t=bestTown(cands,id)
        if t then
            local b=takeFrom(towns[t].bycat[p],towns[t])
            if b then done=addScene(id,t,b,"building",true) end
        else
            R.reasons.noCategoryBuilding=R.reasons.noCategoryBuilding+1
            -- a vehicle or a body of a fitting kind, within the caps
            local kinds={"vehicle","body"}
            if h(seed,"kind",id)%2==1 then kinds={"body","vehicle"} end
            for _,kind in ipairs(kinds) do
                if not done and hostFor(id,rec,kind) then
                    local cap=kind=="vehicle" and vehicleCap or bodyCap
                    local per=kind=="vehicle" and vehPer or bodPer
                    local perMax=kind=="vehicle" and B.VEHICLES_PER_TOWN or B.BODIES_PER_TOWN
                    local count=kind=="vehicle" and vehicleCount or bodyCount
                    if count>=cap then R.reasons.hostCap=R.reasons.hostCap+1
                    else
                        local c2={}
                        for _,tt in ipairs(townIds) do if (per[tt] or 0)<perMax and #towns[tt].ord>0 then c2[#c2+1]=tt end end
                        local tt=bestTown(c2,id)
                        if tt then
                            local b=takeFrom(towns[tt].ord,towns[tt])
                            if b then
                                local extra={}
                                if kind=="vehicle" then extra.vehicles=hostFor(id,rec,kind) else extra.outfit=hostFor(id,rec,kind) end
                                if addScene(id,tt,b,kind,true,extra) then
                                    done=true; per[tt]=(per[tt] or 0)+1
                                    if kind=="vehicle" then vehicleCount=vehicleCount+1 else bodyCount=bodyCount+1 end
                                end
                            end
                        else R.reasons.hostCap=R.reasons.hostCap+1 end
                    end
                end
            end
        end
        if not done then
            -- relaxed: an ordinary building of a town that still has room
            local c3={}
            for _,tt in ipairs(townIds) do if #towns[tt].ord>0 then c3[#c3+1]=tt end end
            local tt=bestTown(c3,id)
            if not tt then
                local anyRoom=false
                for _,t2 in ipairs(townIds) do if rem[t2]>0 then anyRoom=true end end
                if anyRoom then R.reasons.noFit=R.reasons.noFit+1 else R.reasons.densityBand=R.reasons.densityBand+1 end
            else
                local b=takeFrom(towns[tt].ord,towns[tt])
                if b then addScene(id,tt,b,"building",false) else R.reasons.noFit=R.reasons.noFit+1 end
            end
        end
    end
    -- 2) untagged notes in drawn order until every quota is filled
    local drawn=0
    for n,id in ipairs(untagged) do
        if n%16==0 then tick() end
        local left=0; for _,t in ipairs(townIds) do left=left+rem[t] end
        if left==0 then R.reasons.notDrawn=R.reasons.notDrawn+1
        else
            local c3={}
            for _,tt in ipairs(townIds) do if #towns[tt].ord>0 then c3[#c3+1]=tt end end
            local tt=bestTown(c3,id)
            if not tt then R.reasons.noFit=R.reasons.noFit+1
            else
                local b=takeFrom(towns[tt].ord,towns[tt])
                if b and addScene(id,tt,b,"building",nil) then drawn=drawn+1 else R.reasons.noFit=R.reasons.noFit+1 end
            end
        end
    end
    table.sort(out,function(a,c) return a.id<c.id end)
    return out,R
end

return B
