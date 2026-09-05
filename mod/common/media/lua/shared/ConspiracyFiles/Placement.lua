local Content = require("ConspiracyFiles/Content")
local Validator = require("ConspiracyFiles/Validator")
local Placement = { SCHEMA_VERSION = 2, DEBUG_SEED = 3700714 }
local POOLS = {
    [Content.ids.relay] = {
        { candidateId="relay-shelves-a", x=10614,y=9604,z=0,radius=2,containerOrdinal=1,allowedContainerTypes={"shelves"} },
        { candidateId="relay-shelves-b", x=10614,y=9604,z=0,radius=2,containerOrdinal=2,allowedContainerTypes={"shelves"} },
        { candidateId="relay-shelves-c", x=10614,y=9604,z=0,radius=2,containerOrdinal=3,allowedContainerTypes={"shelves"} }
    },
    [Content.ids.police] = {
        { candidateId="police-property-a", x=10637,y=10410,z=0,radius=2,containerOrdinal=1,allowedContainerTypes={"counter","desk","filingcabinet","locker"} },
        { candidateId="police-property-b", x=10637,y=10410,z=0,radius=2,containerOrdinal=2,allowedContainerTypes={"counter","desk","filingcabinet","locker"} },
        { candidateId="police-property-c", x=10637,y=10410,z=0,radius=2,containerOrdinal=3,allowedContainerTypes={"counter","desk","filingcabinet","locker"} },
        { candidateId="police-property-d", x=10637,y=10410,z=0,radius=2,containerOrdinal=4,allowedContainerTypes={"counter","desk","filingcabinet","locker"} }
    }
}
local MEMBERS = {
    [Content.ids.relay]={Content.ids.d1,Content.ids.d3,Content.ids.d4},
    [Content.ids.police]={Content.ids.d2,Content.ids.d5,Content.ids.d6,Content.ids.key}
}
local function copy(v)
    if type(v)~="table" then return v end
    local out={}; for k,c in pairs(v) do out[k]=copy(c) end; return out
end
local function seedNumber(seed)
    seed=math.floor(tonumber(seed) or 1)%2147483647
    if seed<=0 then seed=seed+2147483646 end; return seed
end
function Placement.seedFromString(text)
    local seed=5381; text=tostring(text or "")
    for i=1,#text do seed=(seed*33+string.byte(text,i))%2147483647 end
    return seedNumber(seed)
end
local function candidate(location,id)
    for _,v in ipairs(POOLS[location] or {}) do if v.candidateId==id then return v end end
end
function Placement.newPlan(seed)
    local plan={schemaVersion=2,seed=seedNumber(seed),assignments={}}
    local random=plan.seed
    for _,location in ipairs(Content.thread.locationIds) do
        random=(random*48271)%2147483647
        local pool=POOLS[location]; local start=(random%#pool)+1
        for i,id in ipairs(MEMBERS[location]) do
            local c=pool[((start+i-2)%#pool)+1]
            plan.assignments[id]={assetId=id,locationId=location,candidateId=c.candidateId,
                physicalToken="cf-dead-air-"..tostring(plan.seed)..":"..id,status="pending",availability="unknown"}
        end
    end
    return plan
end
local function integer(v) return type(v)=="number" and v==math.floor(v) end
function Placement.validate(plan)
    local safe,why=Validator.validateStructure(plan); if not safe then return false,why end
    if type(plan)~="table" or plan.schemaVersion~=2 then return false,"unsupported placement schema" end
    for k in pairs(plan) do if k~="schemaVersion" and k~="seed" and k~="assignments" then return false,"unknown plan field" end end
    if not integer(plan.seed) or plan.seed<1 or plan.seed>=2147483647 then return false,"invalid placement seed" end
    if type(plan.assignments)~="table" then return false,"missing assignments" end
    local count=0
    for id,a in pairs(plan.assignments) do
        count=count+1
        local asset=Content.assets[id]
        if not asset or type(a)~="table" or a.assetId~=id or a.locationId~=asset.placementLocationId then return false,"invalid placement membership" end
        for k in pairs(a) do
            if k~="assetId" and k~="locationId" and k~="candidateId" and k~="physicalToken" and k~="status" and k~="availability" and k~="target" then return false,"unknown assignment field" end
        end
        local c=candidate(a.locationId,a.candidateId)
        if not c or a.physicalToken~="cf-dead-air-"..tostring(plan.seed)..":"..id then return false,"invalid candidate/token" end
        if not ({pending=true,placing=true,placed=true,unavailable=true,conflict=true})[a.status] then return false,"invalid placement status" end
        if not ({available=true,unknown=true,untracked=true,unavailable=true,conflict=true})[a.availability] then return false,"invalid availability" end
        if (a.status=="placing" or a.status=="placed") and not a.target then return false,"missing exact target" end
        if a.status=="conflict" and a.availability~="conflict" then return false,"conflict must be sticky in both fields" end
        if a.target then
            local t=a.target
            if type(t)~="table" then return false,"invalid target" end
            for k in pairs(t) do
                if k~="x" and k~="y" and k~="z" and k~="objectIndex" and k~="containerIndex" and k~="containerType" and k~="sprite" then return false,"unknown target field" end
            end
            if not integer(t.x) or not integer(t.y) or t.z~=c.z or math.abs(t.x-c.x)>c.radius or math.abs(t.y-c.y)>c.radius
                or not integer(t.objectIndex) or t.objectIndex<0 or not integer(t.containerIndex) or t.containerIndex<0
                or type(t.sprite)~="string" or t.sprite=="" then return false,"invalid exact target" end
            local allowed=false; for _,kind in ipairs(c.allowedContainerTypes) do if kind==t.containerType then allowed=true end end
            if not allowed then return false,"invalid target container type" end
        end
    end
    if count~=7 then return false,"expected seven physical assets" end
    return true
end
function Placement.restore(plan)
    local ok,why=Placement.validate(plan); if not ok then return nil,why end; return copy(plan)
end
function Placement.resolveCandidate(a) return a and copy(candidate(a.locationId,a.candidateId)) end
function Placement.pools() return copy(POOLS) end
function Placement.assetsAt(id) return copy(MEMBERS[id] or {}) end
return Placement
