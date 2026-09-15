-- Pure precommit readiness reducer. It neither persists nor repairs physical placement.
local R={}
local function copy(v) if type(v)~="table" then return v end local o={} for k,c in pairs(v) do o[k]=copy(c) end return o end
local function validSites(sites)
    if type(sites)~="table" or getmetatable(sites) then return false end
    local count=0
    for key,value in pairs(sites) do
        if type(key)~="number" or key~=math.floor(key) or key<1 or key>2 or type(value)~="string" or value=="" or #value>300 then return false end
        count=count+1
    end
    return count==2 and sites[1]~=nil and sites[2]~=nil and sites[1]~=sites[2]
end
local function integer(n) return type(n)=="number" and n==math.floor(n) and n>=1 and n<1000000 end
function R.new(sites)
    if not validSites(sites) then return nil,"exactly two distinct site IDs required" end
    local root={committed=false,sites={}}
    for _,id in ipairs(sites) do root.sites[id]={loaded=false,epoch=0,status="waiting"} end
    local api={}
    local function only(event,allowed)
        for key in pairs(event) do if not allowed[key] then return false end end
        return true
    end
    local function validEvent(e)
        if type(e)~="table" or type(e.kind)~="string" or not root.sites[e.siteId] then return false end
        if e.kind=="metadata" then return only(e,{kind=true,siteId=true,storage=true}) and (e.storage=="observed" or e.storage=="unknown" or e.storage=="absent") end
        if e.kind=="loaded" then return only(e,{kind=true,siteId=true,epoch=true}) and integer(e.epoch) and e.epoch>root.sites[e.siteId].epoch end
        if e.kind=="unloaded" then return only(e,{kind=true,siteId=true}) end
        if e.kind=="verification" then return only(e,{kind=true,siteId=true,epoch=true,result=true}) and integer(e.epoch) and (e.result=="positive" or e.result=="negative") end
        return false
    end
    function api:observe(event)
        if root.committed then return false,"committed readiness is frozen" end
        if not validEvent(event) then return false,"invalid readiness event" end
        local next=copy(root); local site=next.sites[event.siteId]
        if event.kind=="metadata" then
            site.metadata=event.storage -- advisory only; it never verifies a loaded container.
        elseif event.kind=="loaded" then
            site.loaded=true; site.epoch=event.epoch; site.status="waiting"; site.verifiedEpoch=nil
        elseif event.kind=="unloaded" then
            site.loaded=false; site.status="waiting"; site.verifiedEpoch=nil
        elseif not site.loaded or event.epoch~=site.epoch then
            return false,"stale or unloaded verification"
        else
            site.verifiedEpoch=event.epoch; site.status=event.result=="positive" and "ready" or "unsuitable"
        end
        root=next; return true
    end
    function api:authorized()
        if root.committed then return false end
        for _,site in pairs(root.sites) do if not site.loaded or site.status~="ready" or site.verifiedEpoch~=site.epoch then return false end end
        return true
    end
    function api:commit()
        if not api:authorized() then return false,"both current sites require positive verification" end
        root.committed=true; return true
    end
    function api:snapshot() return copy(root) end
    return api
end
return R
