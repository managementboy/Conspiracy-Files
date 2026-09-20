-- Authored events -> immutable sources -> knowledge-gated survivor notes.
-- Pure Lua. Placement, discovery and world access remain with their adapters.
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local M={REVISION=1}
local ANCHORS={"claim","response","review"}
local RELATIONS={corroborates=true,recontextualises=true,["disputes-delivery"]=true}
local function copy(v)
    if type(v)~="table" then return v end
    local out={}; for k,x in pairs(v) do out[k]=copy(x) end; return out
end
local function text(v) return type(v)=="string" and v:find("%S")~=nil end
local function dense(v,max)
    if type(v)~="table" then return false end
    local n=0
    for k in pairs(v) do
        if type(k)~="number" or k%1~=0 or k<1 then return false end
        n=n+1
    end
    if n>(max or 32) then return false end
    for i=1,n do if v[i]==nil then return false end end
    return true,n
end
local function documentOK(d)
    if type(d)~="table" or not Kinds.get(d.kind) then return false end
    for _,k in ipairs({"title","observation","source","note"}) do
        if not text(d[k]) then return false end
    end
    return true
end
-- A continuation preserves the people/company and documentary time of its
-- source. Reusing a reference while redrawing those facts would change history.
function M.validThread(t,follows)
    if type(t)~="table" then return false end
    local allowed={document=true,reference=true,point=true,question=true,
        person=true,organisation=true,survivor=true,afterDate=true}
    if follows then allowed.fromCase=true end
    for key in pairs(t) do if not allowed[key] then return false end end
    for _,key in ipairs({"document","reference","point","question"}) do
        if not text(t[key]) or #t[key]>120 or t[key]:find("%c") then return false end
    end
    if follows and (not text(t.fromCase) or #t.fromCase>120 or t.fromCase:find("%c")) then return false end
    for _,key in ipairs({"person","organisation","survivor"}) do
        if t[key]~=nil and (not text(t[key]) or #t[key]>80 or t[key]:find("%c")) then return false end
    end
    local day=t.afterDate
    if day~=nil and (type(day)~="number" or day~=day or day%1~=0 or day<1 or day>189) then return false end
    return true
end
function M.validate(s)
    if type(s)~="table" then return false,"missing scenario" end
    for _,k in ipairs({"question","event","outcome","unresolved"}) do
        if not text(s[k]) then return false,"scenario lacks "..k end
    end
    local ok,n=dense(s.readings,2)
    if not ok or n~=2 or not text(s.readings[1]) or not text(s.readings[2]) then
        return false,"scenario needs two interpretations of its remaining uncertainty"
    end
    if type(s.anchors)~="table" then return false,"missing anchor sources" end
    if s.organisation~=nil and (not text(s.organisation) or not text(s.grounding)) then
        return false,"named business lacks a grounding source"
    end
    local sources={}
    for _,key in ipairs(ANCHORS) do
        if not documentOK(s.anchors[key]) then return false,"invalid source "..key end
        sources[key]=true
    end
    ok,n=dense(s.optional or {},4)
    if not ok then return false,"invalid optional sources" end
    for _,d in ipairs(s.optional or {}) do
        if not documentOK(d) or not text(d.key) or sources[d.key] then return false,"invalid optional source" end
        if d.role~="person" and d.role~="records" and d.role~="listen" then return false,"optional source lacks investigative purpose" end
        sources[d.key]=true
    end
    ok,n=dense(s.essential,3)
    if not ok or n<2 then return false,"scenario lacks essential sources" end
    local essential={}
    for _,key in ipairs(s.essential) do
        if not s.anchors[key] or essential[key] then return false,"invalid essential source" end
        essential[key]=true
    end
    ok,n=dense(s.comparisons,16)
    if not ok or n==0 then return false,"scenario lacks sourced findings" end
    local ending=false
    for _,finding in ipairs(s.comparisons) do
        local valid,count=dense(finding.requires,7)
        if not valid or count<2 or not text(finding.text) or not RELATIONS[finding.kind]
            or not sources[finding.from] or not sources[finding.to] or finding.from==finding.to then
            return false,"invalid finding"
        end
        local needs={}
        for _,key in ipairs(finding.requires) do
            if not sources[key] or needs[key] then return false,"finding has invalid source" end
            needs[key]=true
        end
        if not needs[finding.from] or not needs[finding.to] then return false,"finding omits linked source" end
        local complete=true
        for key in pairs(essential) do if not needs[key] then complete=false end end
        if complete then ending=true end
    end
    if not ending then return false,"scenario lacks an essential-source conclusion" end
    if s.thread then
        if not essential[s.thread.document] or not text(s.thread.point) or not text(s.thread.question) then
            return false,"continuation must come from essential evidence"
        end
    end
    return true
end

function M.body(observation,source,note)
    return "WHAT YOU FOUND\n"..observation.."\n\n"..source.."\n\nWHAT IT MIGHT MEAN\n"..note
end

-- `fill` only substitutes saved case inputs. It may not query the live world.
function M.build(s,fill,prefix,a,b,people,org,random,steer)
    local ok,why=M.validate(s); if not ok then return nil,why end
    local docs,ids={},{}
    local function add(key,d,site)
        local id=prefix.."document-"..(#docs+1)
        local observation,source,note=fill(d.observation),fill(d.source),fill(d.note)
        local body=M.body(observation,source,note)
        if not Kinds.fits(d.kind,body) then return false,"scenario exceeds its carrier's capacity" end
        ids[key]=id
        docs[#docs+1]={id=id,kind=d.kind,title=fill(d.title),locationId=site.id,body=body,
            references={people[1].id,people[2].id,org.id,a.id,b.id},links={},leads=key=="claim" and {b.id} or {}}
        return true
    end
    for _,key in ipairs(ANCHORS) do
        ok,why=add(key,s.anchors[key],key=="claim" and a or b)
        if not ok then return nil,why end
    end
    -- Only explicitly authored, compatible contributions enter this pool.
    -- A preferred approach may order those contributions; a preferred theory
    -- never changes the underlying event or manufactures counterevidence.
    local optional=copy(s.optional or {})
    for i=#optional,2,-1 do local j=random(i); optional[i],optional[j]=optional[j],optional[i] end
    if steer and steer.way then
        local preferred,rest={},{}
        for _,d in ipairs(optional) do
            local into=d.role==steer.way and preferred or rest; into[#into+1]=d
        end
        optional={}; for _,list in ipairs({preferred,rest}) do for _,d in ipairs(list) do optional[#optional+1]=d end end
    end
    local count=random(#optional+1)-1
    if steer and steer.way and optional[1] and optional[1].role==steer.way then count=math.max(1,count) end
    for i=1,count do
        ok,why=add(optional[i].key,optional[i],optional[i].at=="claim" and a or b)
        if not ok then return nil,why end
    end
    local story={revision=M.REVISION,question=fill(s.question),event=fill(s.event),grounding=s.grounding,
        outcome=fill(s.outcome),unresolved=fill(s.unresolved),readings={},comparisons={}}
    for i,value in ipairs(s.readings) do story.readings[i]=fill(value) end
    local essential={}; for _,key in ipairs(s.essential) do essential[#essential+1]=ids[key] end
    for _,finding in ipairs(s.comparisons) do
        local needs,available={},true
        for _,key in ipairs(finding.requires) do
            if ids[key] then needs[#needs+1]=ids[key] else available=false end
        end
        if available then
            story.comparisons[#story.comparisons+1]={requires=needs,text=fill(finding.text),
                from=ids[finding.from],to=ids[finding.to],kind=finding.kind}
        end
    end
    local thread
    if s.thread then thread={document=ids[s.thread.document],point=fill(s.thread.point),question=fill(s.thread.question)} end
    return {documents=docs,story=story,essential=essential,thread=thread}
end

function M.project(story,doc,known)
    local body,links=doc.body,{}
    if not story then return body,links end
    for _,finding in ipairs(story.comparisons) do
        local visible=true
        for _,id in ipairs(finding.requires) do if not known[id] then visible=false; break end end
        if visible and finding.from==doc.id then
            body=body.."\n\n"..finding.text
            local duplicate=false
            for _,link in ipairs(links) do if link.target==finding.to and link.kind==finding.kind then duplicate=true end end
            if not duplicate then links[#links+1]={target=finding.to,kind=finding.kind} end
        end
    end
    return body,links
end

-- Finding the earlier source last must reveal the same connection as finding
-- the later one last. Prefer the most complete newly supported finding.
function M.newFinding(story,known,newId)
    if not story or not known[newId] then return nil end
    local best
    for _,finding in ipairs(story.comparisons) do
        local supported,usesNew=true,false
        for _,id in ipairs(finding.requires) do
            if not known[id] then supported=false end
            if id==newId then usesNew=true end
        end
        if supported and usesNew and (not best or #finding.requires>=#best.requires) then best=finding end
    end
    return best
end
return M
