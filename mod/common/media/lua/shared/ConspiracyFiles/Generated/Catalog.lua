-- Offline prototype only. No PZ imports, placement, or map scanning.
local V=require("ConspiracyFiles/Validator")
local Catalog={MAX_LOCATIONS=64}
local function text(v) return type(v)=="string" and #v>0 and #v<=300 end
local function integer(v) return type(v)=="number" and v==math.floor(v) and math.abs(v)<1000000 end
local function fields(t,allowed)
    if type(t)~="table" then return false end
    for key in pairs(t) do if not allowed[key] then return false end end; return true
end
local function array(t,maximum)
    if type(t)~="table" then return false end
    local n=0; for key in pairs(t) do if type(key)~="number" or key<1 or key~=math.floor(key) then return false end; n=n+1 end
    if n>maximum then return false end
    for i=1,n do if t[i]==nil then return false end end; return true,n
end
function Catalog.validate(c)
    local ok,why=V.validateStructure(c); if not ok then return false,why end
    if V.estimateEncodedBytes(c)>500000 then return false,"catalog exceeds offline input budget" end
    if not fields(c,{revision=true,locations=true}) or not text(c.revision) then return false,"invalid catalog header" end
    if not array(c.locations,Catalog.MAX_LOCATIONS) then return false,"invalid catalog array" end
    local seen={}
    for _,r in ipairs(c.locations) do
        if not fields(r,{id=true,name=true,areaId=true,mapId=true,buildLine=true,bounds=true,source=true,paperStorage=true,containerTypes=true,excluded=true}) then return false,"unknown location field" end
        for _,key in ipairs({"id","name","areaId","mapId","buildLine"}) do if not text(r[key]) then return false,"missing location "..key end end
        if r.id:sub(1,10)=="generated:" then return false,"location ID uses reserved case namespace" end
        if seen[r.id] then return false,"duplicate location ID" end; seen[r.id]=true
        if type(r.excluded)~="boolean" or not ({observed=true,unknown=true,absent=true})[r.paperStorage] then return false,"missing eligibility facts" end
        if not fields(r.source,{kind=true,reference=true}) or not ({owner=true,['map-research']=true,synthetic=true})[r.source.kind] or not text(r.source.reference) then return false,"missing source provenance" end
        local b=r.bounds
        if not fields(b,{x1=true,y1=true,x2=true,y2=true,z=true}) then return false,"invalid bounds" end
        for _,key in ipairs({"x1","y1","x2","y2","z"}) do if not integer(b[key]) then return false,"invalid coordinate" end end
        if b.x2<=b.x1 or b.y2<=b.y1 then return false,"empty bounds" end
        local valid,n=array(r.containerTypes,8); if not valid then return false,"invalid container constraints" end
        local types={}
        for _,kind in ipairs(r.containerTypes) do
            if not ({desk=true,counter=true,shelves=true,filingcabinet=true,locker=true})[kind] or types[kind] then return false,"unsupported/duplicate container type" end
            types[kind]=true
        end
        if r.paperStorage=="observed" and n==0 then return false,"observed storage lacks constraints" end
    end
    return true
end
function Catalog.distinct(a,b)
    if a.areaId==b.areaId then return false end
    local x,y=a.bounds,b.bounds
    -- Overlapping ground footprints cannot count as two separate story sites,
    -- even when caller-provided area IDs or floor numbers differ.
    return x.x2<=y.x1 or y.x2<=x.x1 or x.y2<=y.y1 or y.y2<=x.y1
end
function Catalog.eligible(c,mapId,buildLine,allowSynthetic)
    local ok,why=Catalog.validate(c); if not ok then return nil,why end
    local found={}
    for _,r in ipairs(c.locations) do
        if not r.excluded and r.paperStorage=="observed" and r.mapId==mapId and r.buildLine==buildLine
            and (r.source.kind~="synthetic" or allowSynthetic==true) then found[#found+1]=r end
    end
    table.sort(found,function(a,b) return a.id<b.id end)
    return found
end
return Catalog
