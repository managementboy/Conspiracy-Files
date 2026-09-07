-- G1: offline generation and save-shaped restoration. Never loaded by the mod.
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local V=require("ConspiracyFiles/Validator")
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local Roles=require("ConspiracyFiles/Generated/EvidenceRoles")
-- Schema two deliberately refuses the earlier fixed-seven case shape.  Before
-- 1.0 callers must use a fresh save rather than reinterpret an existing case.
local G={REVISION="g2-variable-evidence-2",SCHEMA=2,MIN_EVIDENCE=3,MAX_EVIDENCE=7}
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
    local function document(n,title,location,body,refs,links,leads,kind)
        documents[n]={id=prefix.."document-"..n,kind=kind or "dispatch",title=title,locationId=location.id,body=body,
            references=refs,links=links or {},leads=leads or {}}
    end
    local routeKind=outline=="corroboration" and "letter" or "dispatch"
    local routeTitle=routeKind=="letter" and "Cover letter / "..facts.code or "Dispatch copy / "..facts.code
    document(1,routeTitle,a,
        facts.organisation.."\nJuly "..facts.dispatchDay..", 1993\nFrom: unsigned office copy\nRecord: "..facts.code..
        "\nRoute copy: "..a.name.." to "..b.name..".\nSealed equipment case; contents not entered. "..facts.recipient..
        " keeps the receiving copy at "..b.name..". Authorization to follow under separate cover.",
        {people[1].id,people[2].id,org.id,a.id,b.id},{},{b.id},routeKind)
    local receipt=outline=="corroboration" and "One sealed case received. Seal unbroken; contents not checked."
        or "No case received. Only the dispatch copy arrived. Please stop counting paper as equipment."
    document(2,"Receiving copy / "..facts.code,b,
        "July "..facts.receiptDay..", 1993\n"..facts.recipient.." / "..b.name.."\nRecord: "..facts.code.."\n"..receipt..
        "\nFiled against "..facts.sender.."'s dispatch copy from "..a.name..".",
        {people[1].id,people[2].id,a.id,b.id},{{target=documents[1].id,kind=outline=="corroboration" and "corroborates" or "disputes-delivery"}},nil,"receipt")
    local review=outline=="corroboration" and "The receiving copy confirms a sealed case. The authorization cover is still missing. A signature confirms receipt, not permission."
        or "The receiving copy denies delivery. Someone has nevertheless marked the dispatch file complete. Keep both copies; do not correct one from the other."
    document(3,"File review / "..facts.code,b,
        facts.organisation.."\nJuly "..facts.reviewDay..", 1993\nRecord: "..facts.code.."\n"..review.."\nNo explanation is attached.",
        {org.id,b.id},{{target=documents[2].id,kind="recontextualises"}},nil,"notepad")
    documents[1].body="WHAT YOU FOUND\nA creased carbon copy, its lower edge stained by a wet cup. The sender pressed hard enough to leave grooves through the paper. A neat office stamp sits over a hurried handwritten correction.\n\n"..documents[1].body..
        "\n\nIn the margin: 'Driver asked whether the contents were on the manifest. Told him to use the reference number. Keep our copy until the separate authority arrives.' The signature box has been filled; the space for the authorising officer is blank.\n\nWHAT IT MIGHT MEAN\nSomeone recorded a transfer without recording what was inside. That could conceal an unauthorised shipment, or simply be paperwork completed before its attachments arrived. The receiving address is a concrete place to compare accounts; the missing authorisation alone proves neither explanation."
    documents[2].body="WHAT YOU FOUND\nA thin receipt folded into quarters. The same reference appears in blue ink at the top and in a darker hand beside the signature. There is no inventory attached.\n\n"..documents[2].body..
        "\n\nBelow the formal entry, "..facts.recipient.." has written: 'I am signing for what reached this desk, not for what someone says left theirs. Please retain this wording when making the office copy.' A second signature line is empty.\n\nWHAT IT MIGHT MEAN\nThe writer took care to limit responsibility. That caution could reflect an ordinary dispute between offices, or fear of being blamed for something more serious. Compare the exact claim here with other records rather than treating a signature as proof of the contents."
    documents[3].body="WHAT YOU FOUND\nAn internal review sheet with two staple holes and a torn corner. A pencil tick beside 'complete' has been crossed out rather than erased.\n\n"..documents[3].body..
        "\n\nThe reviewer adds: 'Do not replace the originals with a clean summary. If a supervisor requests a correction, retain the earlier version and record who requested it.' No supervisor's name follows. The bottom of the page has been left open for a reply.\n\nWHAT IT MIGHT MEAN\nSomeone wanted the disagreement preserved. This might be careful record keeping after a clerical error, or an attempt to leave a trail before the records were altered. The sheet raises a question about authority; it does not answer who exercised it."
    -- Optional roles pick their carrier through EvidenceRoles instead of a
    -- literal kind string. `key`/`diary`/`notebook`/`clipping` each still
    -- resolve to their one prose-capable carrier (a role's carrier list of
    -- one is a genuine, if narrow, selection -- not a hardcoded string in
    -- Generator itself); `affiliationLead`/`itineraryLead` genuinely choose
    -- between two card/ticket carriers whose short capacity fits a named
    -- identifier, which is what makes idcard/creditcard/businesscard/ticket
    -- reachable at all. See docs/design/EVIDENCE_ROLE_SCHEMA.md.
    local function carrierFor(roleId,body)
        local kind=assert(Roles.choose(random,roleId))
        assert(Roles.fits(roleId,kind,body))
        return kind
    end
    local accessBody="WHAT YOU FOUND\nA small worn key on a wire loop, with a card tag tied through its bow. The tag carries "..facts.code.." and the initials "..facts.sender..". There is no address or lock number. The metal is polished around the grip but dull between the teeth.\n\nON THE TAG\n'Return separately. Do not leave with the driver.' On the reverse, in smaller writing: 'Ask before making another copy.' A crossed-out word is too smeared to read reliably.\n\nWHAT IT MIGHT MEAN\nThe matching reference links this key to the paperwork, but does not identify what it opens. It could belong to an ordinary cupboard, equipment box or unrelated office lock. Keeping it separate suggests someone controlled access; it is not proof that this key secured the shipment. You have no confirmed matching lock."
    document(4,"Tagged key / "..facts.code,a,accessBody,
        {people[1].id,a.id},{{target=documents[1].id,kind="recontextualises"}},nil,carrierFor("access",accessBody))
    local diaryBody="WHAT YOU FOUND\nA small diary with a soft cover and a broken elastic band. Most entries concern shopping, shifts and missed sleep. One page has been folded down beside a reference you recognise: "..facts.code..".\n\nJULY 5, 1993\n'"..facts.sender.." called again. Wanted to know whether I had signed. I asked why the signature mattered more than the answer. There was a long silence, then something about everyone being tired and the office needing to close the file. I told them my copy would say only what I could stand behind.'\n\n'Perhaps I made too much of it. People have been short with each other all week. Still, I kept the carbon instead of putting it with the rubbish.'\n\nWHAT IT MIGHT MEAN\nThis is a private account of pressure to sign, not an independent record of the call. It adds a human reason for the careful wording, while leaving room for exhaustion, misunderstanding or deliberate pressure. Nothing here establishes what was in the case."
    document(5,"Private diary / "..facts.code,b,diaryBody,
        {people[1].id,people[2].id,b.id},{{target=documents[2].id,kind="recontextualises"}},nil,carrierFor("diaryContext",diaryBody))
    local notebookBody="WHAT YOU FOUND\nA ruled pocket notebook with oil-darkened page edges. Routine meter readings share space with tea orders and a sketch of a loading bay. A short entry uses the same reference, "..facts.code..".\n\nJULY "..facts.dispatchDay..", 1993\n'Late collection. No normal stores entry. Office supplied the reference and said the description would follow. Asked twice. Leave space below.'\n\nThe next three ruled lines are empty. Beneath them: 'If anyone asks, send them to "..facts.organisation..". I can account for the time on this page, not for what was packed before my shift.' No name identifies the driver.\n\nWHAT IT MIGHT MEAN\nThe writer separated what they witnessed from what they were told. The blank lines could be a forgotten update or a deliberately avoided description. This supports asking how the transfer was recorded; it cannot establish the shipment's contents or destination by itself."
    document(6,"Shift notebook / "..facts.code,a,notebookBody,
        {org.id,a.id},{{target=documents[1].id,kind="recontextualises"}},nil,carrierFor("notebookContext",notebookBody))
    local clippingBody="WHAT YOU FOUND\nA newspaper folded around a narrow cut-out from its local news column. Someone has underlined the words 'routine maintenance' and pencilled "..facts.code.." in the margin. The article itself does not use that reference.\n\nLOCAL SERVICES NOTICE - JULY 2, 1993\nResidents were advised that service vehicles might visit local facilities outside ordinary hours while scheduled maintenance was completed. A spokesperson described the work as routine and asked that access routes be kept clear. The notice supplied no list of deliveries and no explanation of what equipment would be moved.\n\nWHAT IT MIGHT MEAN\nSomeone associated this public notice with the private reference, but the pencil annotation is their interpretation. Routine maintenance could explain an unusual collection time. It could also offer a convenient explanation for unrelated activity. The clipping cannot tell you which, and its unnamed annotator may have been guessing too."
    document(7,"Press clipping / "..facts.code,b,clippingBody,
        {b.id},{{target=documents[1].id,kind="recontextualises"}},nil,carrierFor("clippingContext",clippingBody))
    -- Two new short-text roles genuinely choose between the four card/ticket
    -- carriers added 2026-09-06 (EvidenceKinds). Their bodies are a named
    -- identifier and a line or two of context -- never the "WHAT YOU FOUND"
    -- essay above -- because a card cannot hold that (T7).
    local affiliationBody="Ref "..facts.code.."\n"..facts.sender.."\n"..facts.organisation
    local affiliationKind=carrierFor("affiliationLead",affiliationBody)
    document(8,K.get(affiliationKind).short.." / "..facts.code,a,affiliationBody,
        {people[1].id,org.id,a.id},{{target=documents[1].id,kind="recontextualises"}},nil,affiliationKind)
    local itineraryBody="Ref "..facts.code.."\n"..facts.recipient.." - "..b.name.."\nJuly "..facts.receiptDay..", 1993"
    local itineraryKind=carrierFor("itineraryLead",itineraryBody)
    document(9,K.get(itineraryKind).short.." / "..facts.code,b,itineraryBody,
        {people[2].id,b.id},{{target=documents[2].id,kind="recontextualises"}},nil,itineraryKind)
    -- The first three roles are the coherent minimum: a route lead,
    -- an independently attributable response, and a review of that response.
    -- Optional roles are shuffled and bounded, so neither their count nor their
    -- carrier checklist is fixed, while every selected fact still resolves.
    -- The pool now spans six roles/carriers (up from four) so the two new
    -- short-text roles -- and therefore all four card/ticket carriers -- are
    -- genuinely reachable, while MIN/MAX_EVIDENCE and their selection range
    -- (0..4 optional slots on top of the 3 mandatory roles) stay unchanged.
    local optional={documents[4],documents[5],documents[6],documents[7],documents[8],documents[9]}
    local optionalCapacity=G.MAX_EVIDENCE-3
    local optionalCount=random(optionalCapacity+1)-1
    for i=#optional,2,-1 do local j=random(i); optional[i],optional[j]=optional[j],optional[i] end
    while #documents>3 do documents[#documents]=nil end
    for i=1,optionalCount do
        local d=optional[i]
        d.id=prefix.."document-"..(#documents+1)
        documents[#documents+1]=d
    end
    return {schemaVersion=G.SCHEMA,generatorRevision=G.REVISION,catalogRevision=revision,seed=seed,
        caseId=prefix.."case",outline=outline,contentStatus="development-draft-unapproved",
        locations=copy(sites),facts=facts,identities=people,organisation=org,documents=documents}
end
-- Number of actual containers a generated case needs at each selected site.
-- Session.createDistributed remains the final authority on target uniqueness.
function G.requiredContainers(case)
    local valid,why=G.validate(case); if not valid then return nil,why end
    local counts={}
    for _,doc in ipairs(case.documents) do counts[doc.locationId]=(counts[doc.locationId] or 0)+1 end
    return counts
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
-- Offline flow helper: preserves caller-selected introductory ordering without seed retries.
function G.generateSelected(catalog,seed,options,orderedSiteIds)
    local safe=V.validateStructure({options=options,orderedSiteIds=orderedSiteIds})
    if not safe or type(options)~="table" or type(orderedSiteIds)~="table" then return nil,"invalid selected-generation input" end
    for key in pairs(options) do
        if key~="mapId" and key~="buildLine" and key~="allowSynthetic" then return nil,"unknown generator option" end
    end
    for key in pairs(orderedSiteIds) do if key~=1 and key~=2 then return nil,"exactly two ordered site IDs required" end end
    for i=1,2 do if type(orderedSiteIds[i])~="string" or #orderedSiteIds[i]==0 or #orderedSiteIds[i]>300 then return nil,"invalid ordered site ID" end end
    if orderedSiteIds[1]==orderedSiteIds[2] then return nil,"two distinct site IDs required" end
    if not seedOK(seed) or type(options.mapId)~="string" or type(options.buildLine)~="string"
        or (options.allowSynthetic~=nil and type(options.allowSynthetic)~="boolean") then return nil,"invalid selected-generation input" end
    local eligible,why=Catalog.eligible(catalog,options.mapId,options.buildLine,options.allowSynthetic); if not eligible then return nil,why end
    local byId={}; for _,site in ipairs(eligible) do byId[site.id]=site end
    local a,b=byId[orderedSiteIds[1]],byId[orderedSiteIds[2]]
    if not a or not b or not Catalog.distinct(a,b) then return nil,"selected sites are not eligible and distinct" end
    local result=build(seed,catalog.revision,{a,b}); local valid,err=G.validate(result); if not valid then return nil,err end
    return copy(result)
end
-- Gameplay-facing creation entry point. Legacy generate remains an offline fixture API.
-- Caller supplies the generation anchor; restoration does not reapply this filter.
function G.generateNew(catalog,seed,options,context)
    local Reach=require("ConspiracyFiles/Reach")
    if type(context)~="table" or not Reach.validAnchor(context.anchor) then return nil,"generation anchor required" end
    local radius,why=Reach.radius(context.hoursSurvived)
    if not radius then return nil,why end
    local valid,err=Catalog.validate(catalog)
    if not valid then return nil,err end
    local filtered={revision=catalog.revision,locations={}}
    for _,site in ipairs(catalog.locations) do
        if Reach.contains(site.bounds,context.anchor,radius) then filtered.locations[#filtered.locations+1]=site end
    end
    return G.generate(filtered,seed,options)
end
function G.validate(case)
    local safe,why=V.validateStructure(case); if not safe then return false,why end
    if type(case)~="table" or case.schemaVersion~=G.SCHEMA or case.generatorRevision~=G.REVISION then return false,"unsupported generated case revision" end
    if not seedOK(case.seed) or V.estimateEncodedBytes(case)>500000 then return false,"invalid seed/size" end
    local valid,err=Catalog.validate({revision=case.catalogRevision,locations=case.locations})
    if not valid then return false,err end
    if #case.locations~=2 then return false,"expected two locations" end
    if #case.documents<G.MIN_EVIDENCE or #case.documents>G.MAX_EVIDENCE then return false,"invalid evidence role count" end
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
    if count>#case.documents then return nil,"too many discoveries" end
    local known={}
    for i=1,count do local id=discovered[i]; if not byId[id] or known[id] then return nil,"unknown/duplicate discovery" end; known[id]=true end
    local rows={}
    for i,id in ipairs(discovered) do
        local doc=byId[id]; local links={}
        for _,link in ipairs(doc.links) do if known[link.target] then links[#links+1]=copy(link) end end
        rows[i]={id=id,kind=doc.kind,title=doc.title,body=doc.body,locationId=doc.locationId,leads=copy(doc.leads),connections=links}
    end
    return rows
end
return G
