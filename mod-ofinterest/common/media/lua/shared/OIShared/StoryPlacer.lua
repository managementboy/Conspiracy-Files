-- STORY PLACER (Of Interest phase 5). PURE: no engine, no globals. Turns the note catalogue's stories into
-- scene decisions at world start: every part of a story becomes one note scene (SceneNote rows), each in a
-- DIFFERENT building, all in ONE town, chosen from the world seed and the story id alone.
--   * host matching: a part whose note has a place code goes to a building of that category when the town
--     has an unused one, otherwise (counted as "relaxed") to an ordinary building of the same town;
--   * no building is used twice across all stories (and not twice with world.used, the saved record's set);
--   * NO claim about reading order: the order field of the catalogue is never read; parts are labelled by
--     their rank in the sorted note ids, and scene ids by (story, that rank);
--   * the whole table is always computed for every story, whatever is enabled, so enabling more stories
--     later can never move a scene already decided; world.enable only filters what is returned;
--   * stories of low confidence (1) are held back and listed.
-- Ids, codes and counts only; nothing here knows any note text.
local Pick=require("OIShared/Generated/Pick")
local Objects=require("OIShared/Generated/ObjectCatalogue")
local P={}
P.MIN_AREA=36        -- footprint limits of a building a scene may use (tiles)
P.MAX_AREA=1600
P.MIN_SIDE=5
P.FIRST_SCENE=101    -- scene ids ns101..: ns001 stays the phase-4 test row
P.WINDOW=4           -- an ordinary part chooses among the nearest WINDOW x (parts left) buildings

local function h(...) return Pick.hash(Pick.key({...})) end

-- Generated/Buildings rows -> {id,x,y,x2,y2,area,cat,town,cx,cy}
function P.parseBuildings(data)
    local out={}
    for _,r in ipairs(data.rows) do
        local id,x,y,x2,y2,a,c=r:match("^(%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%d+)|(%d+)$")
        if id then
            x,y,x2,y2,a,c=tonumber(x),tonumber(y),tonumber(x2),tonumber(y2),tonumber(a),tonumber(c)
            out[#out+1]={id=id,x=x,y=y,x2=x2,y2=y2,area=a,cat=c,town=data.towns[a] or 0,cx=(x+x2)/2,cy=(y+y2)/2}
        end
    end
    return out
end

local function eligible(b)
    local w,hh=b.x2-b.x,b.y2-b.y
    return w>=P.MIN_SIDE and hh>=P.MIN_SIDE and w*hh>=P.MIN_AREA and w*hh<=P.MAX_AREA
end

local function catOf(recipe)
    local o=Objects.get(recipe[1])
    return o and o.category or "?"
end

-- The recipe of one part: place recipes first, then its themes' recipes, then the general list; within a
-- stage only recipes whose lead object category the story has not used yet, if there are any.
local function chooseRecipe(seed,noteId,rec,recipes,usedCats)
    local stages={}
    if rec.place and recipes.place[rec.place] then stages[#stages+1]=recipes.place[rec.place] end
    local th={}
    for _,t in ipairs(rec.themes or {}) do for _,r in ipairs(recipes.theme[t] or {}) do th[#th+1]=r end end
    stages[#stages+1]=th
    stages[#stages+1]=recipes.general
    for s,list in ipairs(stages) do
        local ok={}
        for _,r in ipairs(list) do if not usedCats[catOf(r)] then ok[#ok+1]=r end end
        if #ok>0 then return ok[1+h(seed,"recipe",noteId,s)%#ok] end
    end
    local all=recipes.general
    return all[1+h(seed,"recipe",noteId,0)%#all]
end

local function sortedKeys(t) local o={}; for k in pairs(t) do o[#o+1]=k end; table.sort(o); return o end

-- place(world, catalogue, buildings, recipes, seed [, opts]) -> decisions, report
--   world      {used={[buildingId]=true}, enable={[story]=true}|nil}  (nil/empty = all stories)
--   catalogue  an instance with .entries[id]={story,place,themes,conf}
--   buildings  P.parseBuildings(...)
--   recipes    Generated/Recipes
-- decisions: the enabled stories' scenes, sorted by scene id: {id,story,part,noteId,place,objects,where,
--   bounds,building,area,town,cat,matched}  (matched: true/false for a part with a place code, nil without)
-- report: {stories={[n]={status="placed"|"held"|"nofit",town,n,tagged,matched,relaxed}},held={..},
--   all=every decision (enabled or not), counts={...}}
function P.place(world,catalogue,buildings,recipes,seed,opts)
    world=world or {}
    local used={}
    for id in pairs(world.used or {}) do used[id]=true end
    local report={stories={},held={},all={},counts={placed=0,held=0,nofit=0,scenes=0,tagged=0,matched=0,relaxed=0}}
    -- stories and their parts (sorted by note id: a label, never an order)
    local groups={}
    for id,rec in pairs(catalogue.entries or {}) do
        if rec.story then local l=groups[rec.story]; if not l then l={}; groups[rec.story]=l end; l[#l+1]=id end
    end
    local numbers=sortedKeys(groups)
    local sceneOf,counter={}, P.FIRST_SCENE-1
    for _,s in ipairs(numbers) do
        table.sort(groups[s])
        for part,id in ipairs(groups[s]) do counter=counter+1; sceneOf[id]=string.format("ns%03d",counter) end
    end
    -- towns
    local towns={}
    for _,b in ipairs(buildings) do
        if eligible(b) then
            local t=towns[b.town]; if not t then t={ord={},bycat={}}; towns[b.town]=t end
            if b.cat==0 then t.ord[#t.ord+1]=b else
                local l=t.bycat[b.cat]; if not l then l={}; t.bycat[b.cat]=l end
                l[#l+1]=b
            end
        end
    end
    local townIds=sortedKeys(towns)
    local function free(list) local n=0; for _,b in ipairs(list) do if not used[b.id] then n=n+1 end end; return n end
    -- biggest stories first, then by number: a deterministic order the enable list does not touch
    local order={}
    for _,s in ipairs(numbers) do order[#order+1]=s end
    table.sort(order,function(a,b) if #groups[a]~=#groups[b] then return #groups[a]>#groups[b] end return a<b end)
    local byStory={}
    for _,s in ipairs(order) do
        local ids=groups[s]; local n=#ids
        local low=false
        for _,id in ipairs(ids) do if catalogue.entries[id].conf==1 then low=true end end
        local rep={status="placed",n=n,tagged=0,matched=0,relaxed=0}
        report.stories[s]=rep
        if low then
            rep.status="held"; report.held[#report.held+1]=s; report.counts.held=report.counts.held+1
        else
            local req,tagged={},0
            for _,id in ipairs(ids) do
                local pl=catalogue.entries[id].place
                if pl then req[pl]=(req[pl] or 0)+1; tagged=tagged+1 end
            end
            -- the town: fits the story (enough free ordinary buildings for the parts that will not match),
            -- most category matches, then a seeded draw among the equals
            local best,bestScore,tier
            for pass=1,2 do
                for _,t in ipairs(townIds) do
                    local T=towns[t]; local matched=0
                    for c,k in pairs(req) do matched=matched+math.min(k,T.bycat[c] and free(T.bycat[c]) or 0) end
                    local ord=free(T.ord); local total=ord
                    for _,l in pairs(T.bycat) do total=total+free(l) end
                    local fits
                    if pass==1 then fits=ord>=n-matched else fits=total>=n end
                    if fits then
                        local tie=h(seed,"town",s,t)
                        if not best or matched>bestScore.m or (matched==bestScore.m and tie<bestScore.tie) then
                            best=t; bestScore={m=matched,tie=tie}
                        end
                    end
                end
                if best then tier=pass; break end
            end
            if not best then
                rep.status="nofit"; report.counts.nofit=report.counts.nofit+1
            else
                local T=towns[best]
                rep.town=best; rep.tier=tier; rep.tagged=tagged
                local pick={}   -- note id -> building
                local anchor
                local function takeFrom(list,noteId,salt)
                    local pickB,pickH
                    for _,b in ipairs(list) do
                        if not used[b.id] then
                            local x=h(seed,salt,s,noteId,b.id)
                            if not pickB or x<pickH then pickB,pickH=b,x end
                        end
                    end
                    return pickB
                end
                local matchedNote={}
                for _,id in ipairs(ids) do
                    local pl=catalogue.entries[id].place
                    if pl and T.bycat[pl] then
                        local b=takeFrom(T.bycat[pl],id,"cat")
                        if b then used[b.id]=true; pick[id]=b; matchedNote[id]=true; anchor=anchor or b end
                    end
                end
                local rest={}
                for _,id in ipairs(ids) do if not pick[id] then rest[#rest+1]=id end end
                if #rest>0 then
                    local pool={}
                    for _,b in ipairs(T.ord) do if not used[b.id] then pool[#pool+1]=b end end
                    if #pool<#rest then   -- tier 2: any free building of the town
                        for _,l in pairs(T.bycat) do for _,b in ipairs(l) do if not used[b.id] then pool[#pool+1]=b end end end
                    end
                    if not anchor then
                        local a
                        for _,b in ipairs(pool) do
                            local x=h(seed,"anchor",s,b.id)
                            if not a or x<a.x then a={b=b,x=x} end
                        end
                        anchor=a.b
                    end
                    local function dist(b) return math.max(math.abs(b.cx-anchor.cx),math.abs(b.cy-anchor.cy)) end
                    local keyed={}
                    for _,b in ipairs(pool) do keyed[#keyed+1]={b=b,d=dist(b),t=h(seed,"near",s,b.id)} end
                    table.sort(keyed,function(a,b) if a.d~=b.d then return a.d<b.d end return a.t<b.t end)
                    local window={}
                    for i=1,math.min(#keyed,P.WINDOW*#rest) do window[#window+1]=keyed[i].b end
                    for _,id in ipairs(rest) do
                        local b=takeFrom(window,id,"ord")
                        used[b.id]=true; pick[id]=b
                    end
                end
                -- the objects, one recipe per part, different categories across the story where possible
                local usedCats={}
                for part,id in ipairs(ids) do
                    local rec=catalogue.entries[id]
                    local recipe=chooseRecipe(seed,id,rec,recipes,usedCats)
                    usedCats[catOf(recipe)]=true
                    local objs={}; for i,o in ipairs(recipe) do objs[i]=o end
                    local b=pick[id]
                    local d={id=sceneOf[id],story=s,part=part,noteId=id,place=rec.place,objects=objs,where={kind="ground"},
                        bounds={x1=b.x,y1=b.y,x2=b.x2,y2=b.y2,z=0},building=b.id,area=b.area,town=b.town,cat=b.cat}
                    if rec.place then
                        d.matched=matchedNote[id]==true
                        report.counts.tagged=report.counts.tagged+1
                        if d.matched then rep.matched=rep.matched+1; report.counts.matched=report.counts.matched+1
                        else rep.relaxed=rep.relaxed+1; report.counts.relaxed=report.counts.relaxed+1 end
                    end
                    byStory[#byStory+1]=d
                end
                report.counts.placed=report.counts.placed+1
                report.counts.scenes=report.counts.scenes+#ids
            end
        end
    end
    table.sort(byStory,function(a,b) return a.id<b.id end)
    report.all=byStory
    local out={}
    local enable=world.enable
    local any=false; if enable then for _ in pairs(enable) do any=true end end
    for _,d in ipairs(byStory) do if not any or enable[d.story] then out[#out+1]=d end end
    return out,report
end

return P
