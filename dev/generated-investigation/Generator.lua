-- G1: offline generation and save-shaped restoration. Never loaded by the mod.
local Catalog=require("generated-investigation/Catalog")
local V=require("ConspiracyFiles/Validator")
local G={REVISION="g1-draft-1",SCHEMA=1}
local function copy(v) if type(v)~="table" then return v end; local out={}; for k,c in pairs(v) do out[k]=copy(c) end; return out end
local function same(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,v in pairs(a) do if not same(v,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end; return true
end
local function seedOK(n) return type(n)=="number" and n==math.floor(n) and n>=1 and n<2147483647 end
local function rng(seed)
    return function(n) seed=(seed*48271)%2147483647; return seed%n+1 end
end
local function build(seed,revision,sites)
    local random=rng(seed); local outline=random(2)==1 and "corroboration" or "conflicting-account"
    local names={"M. Ellis","D. Mercer","R. Hale","J. Voss"}
    local first=random(#names); local second=(first+random(#names-1)-1)%#names+1
    local prefix="generated:"..seed..":"
    local facts={sender=names[first],recipient=names[second],organisation=({"County Equipment Service","Regional Supply Office","District Maintenance Service"})[random(3)],
        code="R-"..(100+random(899)),dispatchDay=1+random(3),receiptDay=5,reviewDay=6}
    local a,b=sites[1],sites[2]
    local people={{id=prefix.."person-1",name=facts.sender},{id=prefix.."person-2",name=facts.recipient}}
    local org={id=prefix.."organisation",name=facts.organisation}
    local documents={}
    local function document(n,title,location,body,refs,links,leads)
        documents[n]={id=prefix.."document-"..n,title=title,locationId=location.id,body=body,
            references=refs,links=links or {},leads=leads or {}}
    end
    document(1,"Dispatch copy / "..facts.code,a,
        facts.organisation.."\nJuly "..facts.dispatchDay..", 1993\nFrom: "..facts.sender.."\nRecord: "..facts.code..
        "\nRoute copy: "..a.name.." to "..b.name..".\nSealed equipment case; contents not entered. "..facts.recipient..
        " keeps the receiving copy at "..b.name..". Authorization to follow under separate cover.",
        {people[1].id,people[2].id,org.id,a.id,b.id},{},{b.id})
    local receipt=outline=="corroboration" and "One sealed case received. Seal unbroken; contents not checked."
        or "No case received. Only the dispatch copy arrived. Please stop counting paper as equipment."
    document(2,"Receiving copy / "..facts.code,b,
        "July "..facts.receiptDay..", 1993\n"..facts.recipient.." / "..b.name.."\nRecord: "..facts.code.."\n"..receipt..
        "\nFiled against "..facts.sender.."'s dispatch copy from "..a.name..".",
        {people[1].id,people[2].id,a.id,b.id},{{target=documents[1].id,kind=outline=="corroboration" and "corroborates" or "disputes-delivery"}})
    local review=outline=="corroboration" and "The receiving copy confirms a sealed case. The authorization cover is still missing. A signature confirms receipt, not permission."
        or "The receiving copy denies delivery. Someone has nevertheless marked the dispatch file complete. Keep both copies; do not correct one from the other."
    document(3,"File review / "..facts.code,b,
        facts.organisation.."\nJuly "..facts.reviewDay..", 1993\nRecord: "..facts.code.."\n"..review.."\nNo explanation is attached.",
        {org.id,b.id},{{target=documents[2].id,kind="recontextualises"}})
    return {schemaVersion=G.SCHEMA,generatorRevision=G.REVISION,catalogRevision=revision,seed=seed,
        caseId=prefix.."case",outline=outline,contentStatus="development-draft-unapproved",
        locations=copy(sites),facts=facts,identities=people,organisation=org,documents=documents}
end
function G.generate(catalog,seed,options)
    if not seedOK(seed) then return nil,"seed must be an integer from 1 through 2147483646" end
    options=options or {}
    if type(options)~="table" then return nil,"invalid generator options" end
    for key in pairs(options) do if key~="mapId" and key~="buildLine" and key~="allowSynthetic" then return nil,"unknown generator option" end end
    if type(options.mapId)~="string" or type(options.buildLine)~="string" then return nil,"map and build are required" end
    local eligible,why=Catalog.eligible(catalog,options.mapId,options.buildLine,options.allowSynthetic)
    if not eligible then return nil,why end
    local pairs={}
    for i=1,#eligible do for j=i+1,#eligible do
        if Catalog.distinct(eligible[i],eligible[j]) then pairs[#pairs+1]={eligible[i],eligible[j]} end
    end end
    if #pairs==0 then return nil,"no compatible distinct location pair; no case generated" end
    local random=rng((seed+4099)%2147483646+1)
    local selected=pairs[random(#pairs)]
    if random(2)==1 then selected={selected[2],selected[1]} end
    local result=build(seed,catalog.revision,selected)
    local valid,err=G.validate(result); if not valid then return nil,err end
    return copy(result)
end
function G.validate(case)
    local safe,why=V.validateStructure(case); if not safe then return false,why end
    if type(case)~="table" or case.schemaVersion~=G.SCHEMA or case.generatorRevision~=G.REVISION then return false,"unsupported generated case revision" end
    if not seedOK(case.seed) or V.estimateEncodedBytes(case)>500000 then return false,"invalid seed/size" end
    local valid,err=Catalog.validate({revision=case.catalogRevision,locations=case.locations})
    if not valid then return false,err end
    if #case.locations~=2 then return false,"expected two locations" end
    local a,b=case.locations[1],case.locations[2]
    if not Catalog.distinct(a,b) or a.mapId~=b.mapId or a.buildLine~=b.buildLine then return false,"incompatible saved locations" end
    for _,site in ipairs(case.locations) do if site.excluded or site.paperStorage~="observed" then return false,"ineligible saved location" end end
    -- Revision-pinned reconstruction verifies every fact, text and reference.
    -- It uses saved sites, never today's external catalog. Future revisions
    -- must retain a reader or refuse; they may not silently rewrite evidence.
    if not same(case,build(case.seed,case.catalogRevision,case.locations)) then return false,"case facts, text or structure do not match recorded revision" end
    return true
end
function G.restore(saved)
    local valid,why=G.validate(saved); if not valid then return nil,why end
    return copy(saved)
end
function G.project(case,discovered)
    local valid,why=G.validate(case); if not valid then return nil,why end
    local safe=V.validateStructure(discovered); if not safe or type(discovered)~="table" then return nil,"invalid discovery list" end
    local byId={}; for _,doc in ipairs(case.documents) do byId[doc.id]=doc end
    local count=0; for k in pairs(discovered) do if type(k)~="number" or k<1 or k~=math.floor(k) then return nil,"invalid discovery order" end; count=count+1 end
    if count>3 then return nil,"too many discoveries" end
    local known={}
    for i=1,count do local id=discovered[i]; if not byId[id] or known[id] then return nil,"unknown/duplicate discovery" end; known[id]=true end
    local rows={}
    for i,id in ipairs(discovered) do
        local doc=byId[id]; local links={}
        for _,link in ipairs(doc.links) do if known[link.target] then links[#links+1]=copy(link) end end
        rows[i]={id=id,title=doc.title,body=doc.body,locationId=doc.locationId,leads=copy(doc.leads),connections=links}
    end
    return rows
end
return G
