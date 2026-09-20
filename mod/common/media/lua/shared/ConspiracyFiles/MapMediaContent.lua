-- Deterministic map stories. Every source stands alone; comparisons require
-- their actual discovered sources. Copies at ordinary sites are recipient
-- correspondence, never evidence that the site is the named business premises.
local Services=require("ConspiracyFiles/MapMediaServiceStories")
local Civic=require("ConspiracyFiles/MapMediaCivicStories")
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local M={REVISION=2}
local order={"fuel","water","telephone","beds","radio","bus","mail","keys",
    "food","power","names","road","medicine","repairs","housing","waste","gallery"}
local families,byId={},{}
for _,id in ipairs(order) do
    local f=assert(Services[id] or Civic[id],"missing map story "..id)
    f.id=id
    assert(type(f.parts)=="table" and #f.parts==4,"map story needs four sources")
    for _,key in ipairs({"organisation","grounding","siteRole","question","event","outcome","professional"}) do
        assert(type(f[key])=="string" and f[key]~="","map story lacks "..key)
    end
    for _,part in ipairs(f.parts) do
        assert(Kinds.get(part.kind),"unknown map carrier")
        for _,key in ipairs({"title","observation","source","note"}) do
            assert(type(part[key])=="string" and part[key]~="","map source lacks "..key)
        end
    end
    assert(#f.findings==3,"map story needs sourced findings")
    families[#families+1]=f;byId[id]=f
end
M.families=families
local function mix(seed,salt)
    local n=seed;for i=1,#salt do n=(n*33+string.byte(salt,i))%2147483647 end;return n
end
local names={"Marion Voss","Ellis Hale","Joanne Mercer","Sylvia Bell",
    "Delia Keene","Roy Webb","Adele Price","Leonard Ward"}
-- Printed business context takes priority over annotation themes. These choose
-- a relevant authored incident, not a claim about that business's real history.
local printFamilies={
    CircuitalHealing={"telephone","radio","power"}, LennysCarRepair={"repairs"},
    Fossoil1={"fuel"}, McCoyLoggingCorp={"bus","road"},
    SunstarMotel={"beds"}, UStoreItMuldraugh={"keys"},
    ScarletOakDistillery={"waste"}, RedOakApartments={"housing"},
    SpiffosHiringLouisville={"food","names"},SpiffosHiringDixie={"food"},SpiffosHiringWestPoint={"food"},
    KnoxPackKitchens={"water"}, MailCarrierAdEkron={"mail"},CrossRoadsMall={"medicine"},
}
local themes={
    {words={"gas","fuel"},families={"fuel"}},
    {words={"radio","signal","tower"},families={"radio","power"}},
    {words={"phone","telephone","call"},families={"telephone"}},
    {words={"water"},families={"water"}},
    {words={"medical","medicine","clinic"},families={"medicine"}},
    {words={"food","eat","hungry"},families={"food"}},
    {words={"car","cars","truck","trucks","cossette","dart"},families={"repairs","bus"}},
    {words={"checkpoint","barrier","barriers","road"},families={"road"}},
    {words={"mail","letter"},families={"mail"}},
    {words={"fortify","home","stay","safe","shelter"},families={"housing","beds","keys"}},
}
local function family(binding,seed)
    if binding.id=="LouisvilleStashMap15" then return byId.gallery end
    local pool,seen={},{}
    local function include(ids)
        for _,id in ipairs(ids or {}) do if not seen[id] then pool[#pool+1]=id;seen[id]=true end end
    end
    -- Explicit future binding reviews may narrow the pool further. Refuse an
    -- invalid context rather than silently falling back to an unrelated story.
    if binding.storyFamilies then
        include(binding.storyFamilies)
    else
        for _,id in ipairs(binding.printIds or {}) do include(printFamilies[id]) end
        if #pool==0 then
            local words={}
            for word in string.lower(binding.sourceText or ""):gmatch("%a+") do words[word]=true end
            for _,theme in ipairs(themes) do
                for _,word in ipairs(theme.words) do
                    if words[word] then include(theme.families);break end
                end
            end
        end
        if #pool==0 then
            -- All these scenarios explicitly place the recipient's file here.
            -- They never turn an unclassified destination into an institution.
            for _,id in ipairs(order) do if id~="gallery" then include({id}) end end
        end
    end
    assert(#pool>0,"map binding has no authored story")
    for _,id in ipairs(pool) do
        assert(byId[id] and byId[id].siteRole=="recipient-copy","incompatible map story context")
    end
    return byId[pool[1+mix(seed,binding.id)%#pool]]
end
local function values(binding,seed)
    local n=mix(seed,binding.id)
    return {place=binding.label,code=string.format("K-%03d",100+n%900),day=tostring(1+n%6),
        nextday=tostring(2+n%6),amount=tostring(12+n%37),name=names[1+n%#names],other=names[1+(n+3)%#names]}
end
local function expand(text,v)
    return (text:gsub("{([%w_]+)}",function(k) return assert(v[k],"unknown map story field "..k) end))
end
function M.scenario(binding,seed) return family(binding,seed) end
function M.observation(binding,profession,skills,seed,part)
    skills=skills or {}
    local f=family(binding,seed or 1)
    if part and part~=f.observationPart then return nil end
    local jobs={police={policeofficer=true,securityguard=true},medical={doctor=true,nurse=true},
        electrician={electrician=true,engineer=true},mechanic={mechanics=true,mechanic=true},
        carpenter={carpenter=true,constructionworker=true},plumber={plumber=true}}
    local perks={medical="Doctor",electrician="Electricity",mechanic="Mechanics",carpenter="Woodwork"}
    local skill=f.skill
    if (jobs[skill] and jobs[skill][profession]) or (perks[skill] and (skills[perks[skill]] or 0)>=3) then return skill end
end
function M.render(binding,seed,part,observation)
    assert(binding and type(seed)=="number" and part>=1 and part<=4 and part%1==0,"invalid map content reference")
    local f=family(binding,seed);local v=values(binding,seed);local p=f.parts[part]
    local note=expand(p.note,v)
    if observation==f.skill and part==f.observationPart then note=note.."\n\n"..expand(f.professional,v) end
    local source=expand(p.source,v)
    return {title=p.title.." / "..v.code,body=Story.body(expand(p.observation,v),source,note),kind=p.kind,
        premise=f.id,question=expand(f.question,v),event=expand(f.event,v),outcome=expand(f.outcome,v),grounding=f.grounding}
end
-- Numerical source dependencies are stable parts, not positions in the order
-- the player happened to find them. Destination-first discovery remains useful
-- but never quotes a circulation copy the survivor has not seen.
local requirements={{1,2},{3,4},{1,2,3,4}}
local at={2,4,4}
function M.findings(binding,seed,part,known)
    local out={};local f=family(binding,seed);local v=values(binding,seed)
    for i,needs in ipairs(requirements) do
        local visible=at[i]==part
        for _,source in ipairs(needs) do if not known or not known[source] then visible=false end end
        if visible then out[#out+1]=expand(f.findings[i],v) end
    end
    return out
end
return M
