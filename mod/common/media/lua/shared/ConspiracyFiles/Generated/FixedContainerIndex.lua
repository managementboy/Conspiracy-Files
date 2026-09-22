-- Compact, build-specific catalogue of fixed vanilla furniture containers.
--
-- The generated payload deliberately contains no engine object indexes.  An
-- index row is exactly:
--   { buildingId, x, y, z, sprite, containerType, room }
--
-- objectIndex/containerIndex are runtime facts.  FixedContainerRuntime finds
-- them only after the square is loaded and validates the sprite and type before
-- a clue may be written.  Keeping those volatile fields out of the shipped
-- index is what lets a harmless object-list reorder remain a valid map.
local F={SCHEMA=2}
local validated={}

local function integer(n)
    return type(n)=="number" and n==math.floor(n) and math.abs(n)<=1000000
end
local function text(s,max)
    return type(s)=="string" and #s>0 and #s<=max and not s:find("%c")
end
local function rowOK(row)
    if type(row)~="table" then return false end
    for k in pairs(row) do
        if type(k)~="number" or k<1 or k>7 or k~=math.floor(k) then return false end
    end
    if not text(row[1],160) then return false end
    if not integer(row[2]) or not integer(row[3]) or not integer(row[4]) then return false end
    if not text(row[5],300) or not text(row[6],80) then return false end
    if row[7]~=nil and not text(row[7],120) then return false end
    return true
end

local function denseTexts(values,max)
    if type(values)~="table" then return false end
    local count=0
    for i,value in ipairs(values) do
        if not text(value,max) then return false end
        count=i
    end
    local actual=0;for key in pairs(values) do
        if type(key)~="number" or key<1 or key~=math.floor(key) then return false end
        actual=actual+1
    end
    return actual==count
end

local function encodedOK(data)
    if not denseTexts(data.sprites,300) or not denseTexts(data.types,80) or not denseTexts(data.rooms,120)
        or type(data.buildings)~="table" or not integer(data.count) or data.count<0 then return false end
    local count=0
    for buildingId,encoded in pairs(data.buildings) do
        if not text(buildingId,160) or type(encoded)~="table" then return false end
        for key in pairs(encoded) do if type(key)~="number" or key<1 or key>3 or key~=math.floor(key) then return false end end
        if not integer(encoded[1]) or not integer(encoded[2]) or type(encoded[3])~="string" or encoded[3]=="" then return false end
        local _,separators=string.gsub(encoded[3],";","")
        count=count+separators+1
    end
    return count==data.count
end

-- Validate generated data before it influences case generation.  Duplicate
-- physical signatures are refused rather than silently changing their weight.
function F.validate(data)
    if type(data)~="table" or (data.schema~=1 and data.schema~=F.SCHEMA) or not text(data.map,300)
        or not text(data.build,80) then
        return false,"invalid fixed-container index header"
    end
    if validated[data] then return true end
    for k in pairs(data) do
        if k~="schema" and k~="map" and k~="build" and k~="rows" and k~="source"
            and k~="sprites" and k~="types" and k~="rooms" and k~="buildings" and k~="count" then
            return false,"unknown fixed-container index field"
        end
    end
    if data.source~=nil and not text(data.source,300) then return false,"invalid fixed-container index source" end
    if data.schema==F.SCHEMA then
        if data.rows~=nil or not encodedOK(data) then return false,"invalid encoded fixed-container index" end
        validated[data]=true
        return true
    end
    if type(data.rows)~="table" then return false,"invalid fixed-container index rows" end
    local seen={}
    for i,row in ipairs(data.rows) do
        if not rowOK(row) then return false,"invalid fixed-container index row "..tostring(i) end
        local key=table.concat({row[1],row[2],row[3],row[4],row[5],row[6]},"\31")
        if seen[key] then return false,"duplicate fixed-container index row" end
        seen[key]=true
    end
    local n=0;for _ in pairs(data.rows) do n=n+1 end
    if n~=#data.rows then return false,"sparse fixed-container index" end
    validated[data]=true
    return true
end

local function siteId(buildingId)
    if string.sub(buildingId,1,3)=="t3:" then return buildingId end
    return "t3:"..buildingId
end

-- `bundle` is a list so several supported vanilla map/build pairs can ship
-- side-by-side during an update transition.  Exact matching is intentional:
-- an unknown build uses live fallback instead of trusting stale coordinates.
function F.open(bundle,map,build)
    if type(bundle)~="table" then return nil,"invalid fixed-container bundle" end
    local chosen
    for _,data in ipairs(bundle) do
        local ok,why=F.validate(data); if not ok then return nil,why end
        if data.map==map and data.build==build then chosen=data end
    end
    if not chosen then return nil,"unsupported map/build" end
    local byBuilding={}
    if chosen.schema==1 then
        for _,row in ipairs(chosen.rows) do
            local id=siteId(row[1])
            local list=byBuilding[id]; if not list then list={};byBuilding[id]=list end
            list[#list+1]={buildingId=row[1],x=row[2],y=row[3],z=row[4],sprite=row[5],
                containerType=row[6],room=row[7],indexed=true}
        end
    end
    local registry={map=chosen.map,build=chosen.build,byBuilding=byBuilding,
        count=chosen.schema==1 and #chosen.rows or chosen.count}
    function registry.candidates(id)
        if type(id)~="string" then return {} end
        local source=byBuilding[id]
        if not source and chosen.schema==F.SCHEMA then
            source={}
            local raw=string.sub(id or "",1,3)=="t3:" and string.sub(id,4) or id
            local encoded=chosen.buildings[raw]
            if encoded then
                local function base36(value)
                    local sign=1
                    if string.sub(value,1,1)=="-" then sign=-1;value=string.sub(value,2) end
                    if value=="" then return nil end
                    local n=0
                    for i=1,#value do
                        local byte=string.byte(value,i)
                        local digit=byte>=48 and byte<=57 and byte-48 or byte>=97 and byte<=122 and byte-87 or 99
                        if digit>=36 then return nil end
                        n=n*36+digit
                    end
                    return n*sign
                end
                for row in string.gmatch(encoded[3],"[^;]+") do
                    local dx,dy,z,si,ti,ri=string.match(row,"^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)$")
                    dx,dy,z,si,ti,ri=base36(dx or ""),base36(dy or ""),base36(z or ""),
                        base36(si or ""),base36(ti or ""),base36(ri or "")
                    if not dx or not dy or not z or not chosen.sprites[si] or not chosen.types[ti]
                        or not ri or (ri>0 and not chosen.rooms[ri]) then error("invalid encoded fixed-container row") end
                    source[#source+1]={buildingId=raw,x=encoded[1]+dx,y=encoded[2]+dy,z=z,
                        sprite=chosen.sprites[si],containerType=chosen.types[ti],room=ri>0 and chosen.rooms[ri] or nil,indexed=true}
                end
            end
            byBuilding[id]=source
        end
        source=source or {}
        local out={}
        for i,row in ipairs(source) do
            out[i]={buildingId=row.buildingId,x=row.x,y=row.y,z=row.z,sprite=row.sprite,
                containerType=row.containerType,room=row.room,indexed=true}
        end
        return out
    end
    return registry
end

return F
