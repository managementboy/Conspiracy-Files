-- Deterministic map stories. Every source stands alone; comparisons require
-- their actual discovered sources. Copies at ordinary sites are recipient
-- correspondence, never evidence that the site is the named business premises.
local Services=require("ConspiracyFiles/MapMediaServiceStories")
local Civic=require("ConspiracyFiles/MapMediaCivicStories")
local Places=require("ConspiracyFiles/MapMediaPlaceStories")
local Story=require("ConspiracyFiles/Generated/Story")
local H=require("ConspiracyFiles/Headings")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local M={REVISION=3}
local order={"fuel","water","telephone","beds","radio","bus","mail","keys",
    "food","power","names","road","medicine","repairs","housing","waste","gallery"}
-- SLOTS ARE NOT PART INDICES.
--
-- Saved state keeps fragments in slots 1..3 and the payoff in slot 4
-- (MapMediaState.lua:52,84). A story's parts map onto those slots: the LAST
-- part is always the payoff and always takes slot 4, so a two-part story fills
-- slots 1 and 4 and a four-part story fills 1,2,3,4 exactly as before. Keeping
-- the payoff at a fixed slot is what lets chain length vary with no schema
-- change and no save migration.
-- THE PAYOFF IS DECLARED, NOT INFERRED FROM POSITION.
--
-- An implicit "last element is the payoff" invites exactly the mistake this
-- mapping exists to prevent: reading a two-part story's second source as local
-- fragment 2 when it is the destination payoff at slot 4. State, placement and
-- DiscoveryLog all treat 4 as a distinct role (MapMediaState.lua:79-84,
-- DiscoveryLog.lua:211-214), so the story says which part fills it.
local function payoffIndex(f) return f.payoff end
local function slotsFor(f)
    local out,slot={},0
    for i=1,#f.parts do
        if i==payoffIndex(f) then out[i]=4
        else slot=slot+1; out[i]=slot end
    end
    return out
end
function M.slots(f) return slotsFor(f) end
function M.partForSlot(f,slot)
    if type(f)~="table" or type(f.parts)~="table" then return nil end
    for i,s in ipairs(slotsFor(f)) do if s==slot then return i end end
    return nil
end
-- Default comparison shape for a full four-part story: the two halves, then
-- the synthesis. Declared per story once a story is shorter, because a module
-- constant cannot know which slots a given story fills.
local DEFAULT_REQUIRES={{1,2},{3,4},{1,2,3,4}}
local DEFAULT_AT={2,4,4}
-- A comparison may only require slots its own story fills. While every story
-- had four parts this could not fail; with variable length a comparison
-- reaching for an unused slot would just never become visible, losing an
-- authored line in silence.
function M.checkShape(f)
    if type(f)~="table" or type(f.parts)~="table" then return false,"no parts" end
    if #f.parts<2 or #f.parts>4 then
        return false,"a trail is a payoff plus up to three local records, not "..#f.parts
    end
    local pay=payoffIndex(f)
    if type(pay)~="number" or pay%1~=0 or pay<1 or pay>#f.parts then
        return false,"the story must declare which part is the payoff, not leave it to position"
    end
    if type(f.findings)~="table" then return false,"no findings" end
    local requires=f.requires or DEFAULT_REQUIRES
    local at=f.at or DEFAULT_AT
    if #requires~=#f.findings then
        return false,"story has "..#f.findings.." authored lines for "..#requires.." requirements"
    end
    if #at~=#requires then return false,"every requirement needs a slot to appear at" end
    local fills={}
    for _,slot in ipairs(slotsFor(f)) do fills[slot]=true end
    for i,needs in ipairs(requires) do
        for _,slot in ipairs(needs) do
            if not fills[slot] then
                return false,"comparison "..i.." requires slot "..tostring(slot)
                    .." which this story does not fill"
            end
        end
        if not fills[at[i]] then
            return false,"comparison "..i.." appears at slot "..tostring(at[i])
                .." which this story does not fill"
        end
    end
    return true
end
local families,byId={},{}
for _,id in ipairs(order) do
    local f=assert(Services[id] or Civic[id],"missing map story "..id)
    f.id=id
    local shaped,shapeWhy=M.checkShape(f)
    assert(shaped,"map story "..id..": "..tostring(shapeWhy))
    for _,key in ipairs({"organisation","grounding","siteRole","question","event","outcome","professional"}) do
        assert(type(f[key])=="string" and f[key]~="","map story lacks "..key)
    end
    for _,part in ipairs(f.parts) do
        assert(Kinds.get(part.kind),"unknown map carrier")
        for _,key in ipairs({"title","observation","source","note"}) do
            assert(type(part[key])=="string" and part[key]~="","map source lacks "..key)
        end
    end
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
    if binding.id=="IrvingtonStashMap1" then return Places.speedway end
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
-- WHO IS NAMED AT THE PLACE SOMEBODY MARKED.
--
-- The papers at a marked place already name people; nothing surfaced them as
-- PEOPLE, so following a stranger's handwriting ended at a filing cabinet. The
-- runtime uses this to close the loop the map opened - a name the player can
-- carry, ask after, and meet again through the ordinary identity machinery.
--
-- It deliberately does NOT say this person wrote the map. The marks are
-- unsigned; the mod does not know whose hand they are, and inferring it from
-- co-location is exactly the move the observation rules forbid.
function M.people(binding,seed)
    local v=values(binding,seed)
    return {name=v.name,other=v.other,place=v.place}
end
-- THE THREE TEXTS THAT MAKE A MARKED MAP PULL.
--
-- Pure and here rather than in the client runtime, so they can be tested
-- without a game: the runtime only decides WHEN to show them.
--
--  * lead      - shown from the moment the map is read until the player
--                arrives. The scrawl verbatim, where it points, and the plain
--                fact of not having gone.
--  * camehere  - the first finding, answering the handwriting that brought the
--                player rather than only the file they found.
--  * whoseplace- the payoff, naming who is on the papers at the marked place.
--
-- None of them says who drew the marks. They are unsigned, and reading a name
-- off the papers beside them as the writer's is the inference the observation
-- rules forbid.
function M.lead(binding)
    if type(binding)~="table" then return nil end
    local scrawl=binding.sourceText
    if type(scrawl)~="string" or scrawl=="" then return nil end
    local out={H.SCRAWL,"\""..scrawl.."\"","",H.POINTS}
    out[#out+1]=(type(binding.label)=="string" and binding.label~="")
        and ("A "..binding.label..".") or "A place marked on this map."
    local target=binding.targets and binding.targets[1]
    if target and target.x and target.y then
        out[#out+1]="The mark sits at "..tostring(target.x)..", "..tostring(target.y).."."
    end
    out[#out+1]=""
    out[#out+1]=H.WRITER
    out[#out+1]="Nobody signed it. Whoever marked this knew the place well enough to draw it from memory."
    out[#out+1]=""
    out[#out+1]=H.ACTED
    out[#out+1]="Nothing yet. I have not been there."
    return {title="A marked map I have not followed",detail=table.concat(out,"\n")}
end
function M.cameHere(binding)
    local scrawl=type(binding)=="table" and binding.sourceText
    if type(scrawl)~="string" or scrawl=="" then return nil end
    return H.CAME.."\nSomebody marked this place and wrote:\n"..scrawl
        .."\n\nThis is what was here. Whether it is what they meant, I cannot say."
end
function M.mapNote(binding)
    local scrawl=type(binding)=="table" and binding.sourceText
    if type(scrawl)~="string" or scrawl=="" then return nil end
    return H.MAP_READS.."\nThe handwritten map reads:\n"..scrawl
end
function M.whosePlace(binding,seed)
    if type(binding)~="table" or type(seed)~="number" then return nil end
    local v=values(binding,seed)
    if not v.name then return nil end
    return H.WHOSE.."\n"..v.name.." is named on the papers here"
        ..(v.other and (", and so is "..v.other) or "")
        ..". The map that brought me was unsigned, so I cannot say either of them "
        .."drew it. It is a name to ask after."
end
-- A FLYER MUST GIVE THE PLAYER A REASON TO ACT.
--
-- Owner, 2026-09-24, on opening the Pondview Shopping Center flyer: finding a
-- flyer should give the survivor a purpose; this is a requirement, not optional
-- decoration. Before this, reading a flyer saved a timestamp
-- (MapMediaState.printRead) whose only consumer was a place-identification
-- appendix on an already-active map story - and only for the twelve prints some
-- map happens to name in printIds. The other 121, Pondview among them, did
-- nothing at all.
--
-- Every print in the catalogue carries real coordinates, so every flyer can
-- name a place and point at it. A flyer does not need its own mystery: naming
-- somewhere worth standing, and recording what the survivor confirmed when they
-- got there, is a meaningful action with a payoff.
--
-- Neither text claims the place is intact, stocked or safe. A 1993 advertisement
-- is a claim about 1993.
function M.flyerLead(print)
    if type(print)~="table" then return nil end
    local where=print.locations and print.locations[1]
    if not (where and where.x and where.y) then return nil end
    local out={H.FLYER,"\""..tostring(print.title).."\""}
    local text=type(print.text)=="string" and print.text:match("^[^\n]+") or nil
    if text then out[#out+1]=text end
    out[#out+1]=""
    out[#out+1]=H.FLYER_WHERE
    out[#out+1]="The address on it puts the place at "..tostring(where.x)..", "..tostring(where.y).."."
    out[#out+1]=""
    out[#out+1]=H.KEPT
    out[#out+1]="An advertisement is a claim about what was there in 1993. Whether any "
        .."of it is still standing is worth knowing, and I have not been to look."
    return {title="A place I have only read about: "..tostring(print.title),
        detail=table.concat(out,"\n")}
end
function M.flyerPayoff(print)
    if type(print)~="table" then return nil end
    local where=print.locations and print.locations[1]
    if not (where and where.x and where.y) then return nil end
    return {title="I found the place from the flyer: "..tostring(print.title),
        detail=H.SOUGHT.."\n\""..tostring(print.title).."\", from a flyer I read."
            .."\n\n"..H.ARRIVED.."\nI stood at "..tostring(where.x)..", "..tostring(where.y)
            ..". The place the flyer advertised is where it said it would be."
            .."\n\n"..H.WORTH.."\nOne address on a piece of paper turned out to be true. "
            .."It is somewhere I can find again, and a reason to trust the next one less blindly."}
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
    local f=family(binding,seed);local v=values(binding,seed)
    -- `part` is a saved-state SLOT, not an index into this story's parts.
    local p=f.parts[M.partForSlot(f,part)]
    if not p then return nil end
    local note=expand(p.note,v)
    if observation==f.skill and part==f.observationPart then note=note.."\n\n"..expand(f.professional,v) end
    local source=expand(p.source,v)
    return {title=p.title.." / "..v.code,body=Story.body(expand(p.observation,v),source,note),kind=p.kind,
        premise=f.id,question=expand(f.question,v),event=expand(f.event,v),outcome=expand(f.outcome,v),grounding=f.grounding}
end
-- Numerical source dependencies are stable parts, not positions in the order
-- the player happened to find them. Destination-first discovery remains useful
-- but never quotes a circulation copy the survivor has not seen.
function M.findings(binding,seed,part,known)
    local out={};local f=family(binding,seed);local v=values(binding,seed)
    -- Per story, in SLOTS. A module constant could not know which slots a
    -- shorter story fills, and a requirement naming an unfilled slot would
    -- never become visible - losing an authored line without a word.
    local requirements=f.requires or DEFAULT_REQUIRES
    local at=f.at or DEFAULT_AT
    for i,needs in ipairs(requirements) do
        local visible=at[i]==part
        for _,source in ipairs(needs) do if not known or not known[source] then visible=false end end
        if visible then out[#out+1]=expand(f.findings[i],v) end
    end
    return out
end
-- Both complete files must be known before comparing the restaurant's two
-- independent corrections. Shared geography alone is not a causal finding.
function M.sharedFinding(binding,known,peerKnown)
    if binding.id~="MulStashMap11" or binding.sharedPeer~="MulStashMap16" then return nil end
    for part=1,4 do if not known or not known[part] or not peerKnown or not peerKnown[part] then return nil end end
    return "I've now got both corrected files kept at this Spiffo's: vouchers counted as meals, and a costume assignment counted as another worker. Two inflated returns, each challenged by its recipient. The restaurant's files explain both totals; they give me neither a food delivery nor a second missing person."
end
return M
