-- OWNER REVIEW REQUIRED: offline drafts, never loaded by the mod.
local V=require("ConspiracyFiles/Validator")
local D={REVISION="next-phase-draft-1"}
local function copy(v) if type(v)~="table" then return v end local o={} for k,c in pairs(v) do o[k]=copy(c) end return o end
local function same(a,b) if type(a)~=type(b) then return false end if type(a)~="table" then return a==b end for k,v in pairs(a) do if not same(v,b[k]) then return false end end for k in pairs(b) do if a[k]==nil then return false end end return true end
local function text(v,limit) return type(v)=="string" and v~="" and #v<=limit end
local function integer(v) return type(v)=="number" and v==math.floor(v) and v>=1 and v<=366 end
local function fields(t,allowed) if type(t)~="table" then return false end for k in pairs(t) do if not allowed[k] then return false end end return true end
local function dense(t,limit) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>limit then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
local function seedOK(seed) return type(seed)=="number" and seed==math.floor(seed) and seed>=1 and seed<2147483647 end
local function inputOK(seed,facts,sites)
    local safe=V.validateStructure({facts=facts,sites=sites}); if not safe then return false,"unsafe draft input" end
    if not seedOK(seed) or not fields(facts,{sender=true,recipient=true,organisation=true,code=true,firstDay=true,secondDay=true,reviewDay=true}) then return false,"invalid facts" end
    for _,key in ipairs({"sender","recipient","organisation","code"}) do if not text(facts[key],120) then return false,"invalid fact "..key end end
    if not integer(facts.firstDay) or not integer(facts.secondDay) or not integer(facts.reviewDay) or not (facts.firstDay<facts.secondDay and facts.secondDay<=facts.reviewDay) then return false,"invalid chronology" end
    local ok,n=dense(sites,2); if not ok or n~=2 then return false,"exactly two sites required" end
    for i=1,2 do if not fields(sites[i],{id=true,name=true}) or not text(sites[i].id,120) or not text(sites[i].name,120) then return false,"invalid site" end end
    if sites[1].id==sites[2].id then return false,"duplicate site ID" end return true
end
local function outline(seed) return ((seed*48271)%2147483647)%2==0 and "stock-discrepancy" or "maintenance-readings" end
local function construct(seed,facts,sites)
    local kind=outline(seed); local p="draft:"..seed..":"; local a,b=sites[1],sites[2]; local docs
    if kind=="stock-discrepancy" then docs={{id=p.."document-1",locationId=a.id,title="Stock tally / "..facts.code,body="Day "..facts.firstDay..": "..facts.sender.." counted a shortage in "..facts.organisation.." stock. Record "..facts.code.." names "..b.name.." as the last ledger location.",references={a.id,b.id,p.."person-1",p.."organisation"},links={},leads={b.id}},{id=p.."document-2",locationId=b.id,title="Shelf ledger / "..facts.code,body="Day "..facts.secondDay..": "..facts.recipient.." recorded the same stock code "..facts.code..", but the quantity differs from the tally. No cause is entered.",references={a.id,b.id,p.."person-2",p.."organisation"},links={{target=p.."document-1",kind="compares"}},leads={}},{id=p.."document-3",locationId=b.id,title="Count note / "..facts.code,body="Day "..facts.reviewDay..": "..facts.organisation.." retained both readings for "..facts.code..". The missing units and the differing count remain attributed to their records.",references={b.id,p.."organisation"},links={{target=p.."document-2",kind="recontextualises"}},leads={}}}
    else docs={{id=p.."document-1",locationId=a.id,title="Meter reading / "..facts.code,body="Day "..facts.firstDay..": "..facts.sender.." logged an irregular maintenance reading for "..facts.organisation.." equipment. Record "..facts.code.." requests a comparison at "..b.name..".",references={a.id,b.id,p.."person-1",p.."organisation"},links={},leads={b.id}},{id=p.."document-2",locationId=b.id,title="Service sheet / "..facts.code,body="Day "..facts.secondDay..": "..facts.recipient.." logged a normal reading under "..facts.code..". The sheet does not explain the earlier measurement.",references={a.id,b.id,p.."person-2",p.."organisation"},links={{target=p.."document-1",kind="contrasts"}},leads={}},{id=p.."document-3",locationId=b.id,title="Maintenance review / "..facts.code,body="Day "..facts.reviewDay..": "..facts.organisation.." preserved the inconsistent readings for "..facts.code.." without resolving which record is correct.",references={b.id,p.."organisation"},links={{target=p.."document-2",kind="recontextualises"}},leads={}}} end
    return {revision=D.REVISION,contentStatus="owner-review-required",outline=kind,seed=seed,facts=copy(facts),sites=copy(sites),identities={{id=p.."person-1",name=facts.sender},{id=p.."person-2",name=facts.recipient}},organisation={id=p.."organisation",name=facts.organisation},documents=docs}
end
function D.build(seed,facts,sites) local ok,why=inputOK(seed,facts,sites); if not ok then return nil,why end return copy(construct(seed,facts,sites)) end
function D.validate(case)
    local safe=V.validateStructure(case); if not safe then return false,"unsafe draft case" end
    if not fields(case,{revision=true,contentStatus=true,outline=true,seed=true,facts=true,sites=true,identities=true,organisation=true,documents=true}) or case.revision~=D.REVISION or case.contentStatus~="owner-review-required" or not seedOK(case.seed) then return false,"invalid draft header" end
    local ok,why=inputOK(case.seed,case.facts,case.sites); if not ok then return false,why end
    if not fields(case.organisation,{id=true,name=true}) or not text(case.organisation.id,160) or case.organisation.name~=case.facts.organisation then return false,"invalid organisation" end
    local array,n=dense(case.identities,2); if not array or n~=2 then return false,"invalid identities" end for _,person in ipairs(case.identities) do if not fields(person,{id=true,name=true}) or not text(person.id,160) or not text(person.name,120) then return false,"invalid identity" end end
    local docs,count=dense(case.documents,3); if not docs or count~=3 then return false,"invalid documents" end
    for _,doc in ipairs(case.documents) do if not fields(doc,{id=true,locationId=true,title=true,body=true,references=true,links=true,leads=true}) or not text(doc.id,160) or not text(doc.locationId,120) or not text(doc.title,300) or not text(doc.body,2000) then return false,"invalid document fields" end local refs=dense(doc.references,4); local links,ln=dense(doc.links,1); local leads,en=dense(doc.leads,1); if not refs or not links or not leads then return false,"invalid references" end for i=1,ln do if not fields(doc.links[i],{target=true,kind=true}) or not text(doc.links[i].target,160) or not text(doc.links[i].kind,80) then return false,"invalid link" end end for i=1,en do if not text(doc.leads[i],120) then return false,"invalid lead" end end end
    return same(case,construct(case.seed,case.facts,case.sites)) or false,"draft facts, chronology, text, references, or organisation do not match deterministic construction"
end
function D.project(case,known)
    local ok,why=D.validate(case); if not ok then return nil,why end local safe=V.validateStructure(known); if not safe then return nil,"unsafe discovery order" end
    local array,n=dense(known,3); if not array then return nil,"invalid discovery order" end local byId,seen={},{}; for _,doc in ipairs(case.documents) do byId[doc.id]=doc end
    for i=1,n do if not text(known[i],160) or not byId[known[i]] or seen[known[i]] then return nil,"unknown or duplicate discovery" end seen[known[i]]=true end
    local rows={}; for i=1,n do local doc=byId[known[i]]; local links={} for _,link in ipairs(doc.links) do if seen[link.target] then links[#links+1]=copy(link) end end rows[i]={id=doc.id,title=doc.title,body=doc.body,locationId=doc.locationId,links=links} end return rows
end
return D
