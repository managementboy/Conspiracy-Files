-- Convert plain T3 observations to G1 catalog candidates. Never infer storage.
local C=require("ConspiracyFiles/Generated/Catalog")
local V=require("ConspiracyFiles/Validator")
local N={}
function N.fromResult(result)
    local ok,why=V.validateStructure(result)
    if not ok then return nil,why end
    if type(result)~="table" or result.version~="T3-nearby-2" or type(result.rows)~="table"
        or V.estimateEncodedBytes(result)>2000000 then return nil,"invalid nearby result" end
    local catalog={revision="t3-nearby-2",locations={}}
    -- A detached garage/shed is an engine BuildingDef, but not an independent
    -- narrative address. Property inheritance needs explicit parcel knowledge;
    -- until then, utility-only buildings are safer excluded than invented as
    -- separate destinations.
    local ignoredRoom={garage=true,garagestorage=true,shed=true,[""]=true}
    local sawRoom,substantive={},{}
    for _,row in ipairs(result.rows) do
        if row.kind=="room" and type(row.building)=="string" then
            sawRoom[row.building]=true
            local name=type(row.name)=="string" and string.lower(row.name) or ""
            if not ignoredRoom[name] then substantive[row.building]=true end
        end
    end
    for _,row in ipairs(result.rows) do
        if row.kind=="building" then
            local id="t3:"..tostring(row.id)
            catalog.locations[#catalog.locations+1]={id=id,areaId=id,
                name="Building at "..tostring(row.x)..", "..tostring(row.y),
                mapId=result.map,buildLine=result.gameVersion,
                -- Session.target forces every clue in a site onto bounds.z, so a
                -- raw building minimum alone would send every clue in a basemented
                -- building underground on a guess. Generated/Storage.scan gates any
                -- candidate below bounds.z==0 on a proven ConspiracyFiles/Connectivity
                -- search (see docs/research/B42_RUNTIME_PASSABILITY.md); an unreachable
                -- basement never becomes a site's target, so the raw minimum is safe
                -- to report here.
                bounds={x1=row.x,y1=row.y,x2=row.x2,y2=row.y2,z=row.minLevel},
                source={kind="map-research",reference="T3-nearby-2 runtime metadata; room labels advisory"},
                paperStorage="unknown",containerTypes={},
                excluded=sawRoom[tostring(row.id)]==true and substantive[tostring(row.id)]~=true}
        end
    end
    if #catalog.locations~=result.buildings or #catalog.locations>12 then return nil,"incomplete nearby result" end
    local valid,err=C.validate(catalog)
    if not valid then return nil,err end
    return catalog
end
return N
