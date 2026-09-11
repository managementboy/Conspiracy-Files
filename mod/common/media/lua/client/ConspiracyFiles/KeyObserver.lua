-- Records keys found on a body or in a bag taken from one, and names the
-- building each is cut for. See ConspiracyFiles/KeyObservations for what may
-- and may not be said about a key.
--
-- Called by IdentityObserver for every row of a corpse or bag pane it already
-- walks, so this adds no scan of its own over containers.
local CFLog=require("ConspiracyFiles/Log")
local Model=require("ConspiracyFiles/KeyObservations")
ConspiracyFiles=ConspiracyFiles or {}
local O=ConspiracyFiles.KeyObserver or {}
ConspiracyFiles.KeyObserver=O
local TAG="ConspiracyFiles.KeyObservations"
local function log(message) CFLog.message("key","key",message) end

-- Engine calls in colon form, inside a closure. Never pcall(obj.method,obj,...):
-- Kahlua treats an extracted method differently and pcall hides the refusal.
local function read(o,k,...)
    if not o or not o[k] then return nil end
    local ok,v=pcall(function(...) return o[k](o,...) end,...)
    if ok then return v end
    return nil
end

local function root()
    local store=ModData.get and ModData.get(TAG)
    local r=store and store.canonical
    if r and Model.validate(r) then return r end
    return Model.empty()
end
O.root=function() local ok,v=pcall(root); return ok and v or Model.empty() end

-- keyId -> building def id, looked up once per lock number and remembered for
-- the session. The world has around ten thousand buildings; a key is found a
-- handful of times an hour, so a direct scan on first sight is cheap enough and
-- needs no index of its own.
local byKey={}
local function buildingFor(keyId)
    if byKey[keyId]~=nil then return byKey[keyId] or nil end
    local found=false
    pcall(function()
        local grid=getWorld():getMetaGrid()
        local buildings=grid:getBuildings()
        for i=0,buildings:size()-1 do
            local def=buildings:get(i)
            if def and def:getKeyId()==keyId then found=tostring(def:getIDString()); break end
        end
    end)
    byKey[keyId]=found
    return found or nil
end

local function isKey(item)
    local id=read(item,"getKeyId")
    return type(id)=="number" and id==id and id%1==0 and id>=0 and id or nil
end

-- Record one key. `token` is the provenance of the body it came off, if known.
function O.see(item,carrierLabel,token)
    local keyId=isKey(item)
    if not keyId then return false end
    local itemId=read(item,"getID")
    if itemId==nil then return false end
    local building=buildingFor(keyId)
    local label
    if building then
        local map=ConspiracyFiles.AddressMap
        if map and map.labelForBuilding then
            local ok,l=pcall(map.labelForBuilding,building)
            if ok and type(l)=="string" and l~="" then label=l end
        end
    end
    local square=read(item,"getSquare") or (read(item,"getWorldItem") and read(read(item,"getWorldItem"),"getSquare"))
    local player=getPlayer and getPlayer()
    local x=square and read(square,"getX") or (player and read(player,"getX")) or 0
    local y=square and read(square,"getY") or (player and read(player,"getY")) or 0
    local z=square and read(square,"getZ") or (player and read(player,"getZ")) or 0
    local hours=getGameTime and read(getGameTime(),"getWorldAgeHours") or 0
    local record={id=tostring(itemId),keyId=keyId,token=token,carrier=carrierLabel,
        building=building,label=label,x=math.floor(x),y=math.floor(y),z=math.floor(z),observedAt=hours}
    local staged,changed,why=Model.observe(root(),record)
    if not staged then log("key not recorded: "..tostring(why)); return false end
    if not changed then return false end
    local ok,err=pcall(function() ModData.getOrCreate(TAG).canonical=staged end)
    if not ok then log("key not recorded: "..tostring(err)); return false end
    -- One ledger entry per body, matching the one journal row per body.
    local group="keys:"..(token or ("loose:"..record.id))
    local ledger=ConspiracyFiles.DiscoveryLog
    if ledger and ledger.record then pcall(ledger.record,"identity",group) end
    log("key recorded: lock "..tostring(keyId).." cut for "..tostring(label or building or "an unmatched lock"))
    return true
end

-- A building that holds part of an open case, as a phrase for the journal.
local function caseFor(building)
    local ok,phrase=pcall(function()
        local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
        local wrapper=Cases.current(ModData.get("ConspiracyFiles.Generated.G2"))
        for _,r in ipairs(wrapper and Cases.sessions(wrapper) or {}) do
            local case=r.case
            if case and case.locations then
                for _,site in ipairs(case.locations) do
                    if site.id=="t3:"..building then
                        return "an address in the file marked "..tostring(case.facts and case.facts.code or "?")
                    end
                end
            end
        end
    end)
    return ok and phrase or nil
end

function O.rows()
    local ok,rows=pcall(function()
        local names=ConspiracyFiles.PersonNameLog
        local nameFor=names and names.nameFor
        return Model.rows(root(),nameFor,caseFor)
    end)
    return ok and rows or {}
end

return O
