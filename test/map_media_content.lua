-- Map records are authored four-source local events. A destination can be
-- found first, but it cannot quote unseen correspondence or comparisons.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local C=require("ConspiracyFiles/MapMediaCatalogue")
local Content=require("ConspiracyFiles/MapMediaContent")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local State=require("ConspiracyFiles/MapMediaState")
local expected={"fuel","water","telephone","beds","radio","bus","mail","keys","food","power",
    "names","road","medicine","repairs","housing","waste","gallery"}
local function mix(seed,salt)
    local n=seed;for i=1,#salt do n=(n*33+string.byte(salt,i))%2147483647 end;return n
end
local names={"Marion Voss","Ellis Hale","Joanne Mercer","Sylvia Bell","Delia Keene","Roy Webb","Adele Price","Leonard Ward"}
local function values(binding,seed)
    local n=mix(seed,binding.id)
    return {place=binding.label,code=string.format("K-%03d",100+n%900),day=tostring(1+n%6),nextday=tostring(2+n%6),
        amount=tostring(12+n%37),name=names[1+n%#names],other=names[1+(n+3)%#names]}
end
local function expand(text,v) return (text:gsub("{([%w_]+)}",function(k) return assert(v[k],"unknown map story field "..k) end)) end
local function same(a,b) return a.title==b.title and a.body==b.body and a.kind==b.kind and a.premise==b.premise end
local expectedSet={};for _,id in ipairs(expected) do expectedSet[id]=true end
assert(Content.REVISION==2 and State.SCHEMA==2,"map content/state revisions must advance together")
assert(#C.list==125 and #C.printList==133 and #Content.families==17)
for _,family in ipairs(Content.families) do
    assert(expectedSet[family.id],"unexpected map family "..family.id)
    for _,key in ipairs({"organisation","grounding","siteRole","question","event","outcome","professional"}) do
        assert(type(family[key])=="string" and family[key]~="","incomplete family metadata: "..family.id.." / "..key)
    end
end

local professions={police="policeofficer",medical="doctor",electrician="electrician",mechanic="mechanic",carpenter="carpenter",plumber="plumber"}
local seen,galleryActual={},0
local bindings={}
for _,id in ipairs(C.list) do bindings[#bindings+1]=assert(C.get(id)) end
-- Explicit synthetic contexts exercise every family independently of how many
-- real maps happen to select it at seed 17. They do not claim destination coverage.
for _,id in ipairs(expected) do
    if id~="gallery" then bindings[#bindings+1]={id="fixture-"..id,label="recipient address",storyFamilies={id}} end
end
for _,binding in ipairs(bindings) do
    local seed=17
    local family=assert(Content.scenario(binding,seed))
    if binding.storyFamilies then assert(contains(binding.storyFamilies,family.id),"explicit context restricts the authored family") end
    if binding.id=="LouisvilleStashMap15" then
        assert(family.id=="gallery","the actual gallery map uses the gallery event")
        galleryActual=galleryActual+1
    end
    seen[family.id]=true
    local v=values(binding,seed)
    local records={}
    for part=1,4 do
        local a=assert(Content.render(binding,seed,part));local b=assert(Content.render(binding,seed,part))
        assert(same(a,b),"same binding seed must render immutable content")
        assert(not a.title:match("{%w+}") and not a.body:match("{%w+}"),"unresolved content placeholder")
        assert(a.question~="" and a.event~="" and a.outcome~="" and a.grounding==family.grounding,"complete event metadata")
        assert(Pages.text(a.body)==expand(family.parts[part].source,v),"native page must contain exactly the authored source")
        records[part]=a
    end
    -- A specialist reading is earned from the same part's source. It appends a
    -- survivor note only; the native page itself remains the unaltered source.
    local job=assert(professions[family.skill],"unknown professional skill")
    local observation=Content.observation(binding,job,{},seed,family.observationPart)
    assert(observation==family.skill and Content.observation(binding,"unemployed",{},seed,family.observationPart)==nil)
    assert(Content.observation(binding,job,{},seed,(family.observationPart%4)+1)==nil,"observation belongs to its source part")
    local observed=assert(Content.render(binding,seed,family.observationPart,observation))
    assert(Pages.text(observed.body)==Pages.text(records[family.observationPart].body),"professional note cannot alter native source text")

    -- Every discovery subset: finding 1 requires parts 1+2 and appears on 2;
    -- finding 2 requires 3+4 and appears on 4; finding 3 requires all four
    -- and also appears on 4. Use the full-known rendering as the authored,
    -- seed-expanded reference rather than copying prose into this test.
    local full=Content.findings(binding,seed,4,{[1]=true,[2]=true,[3]=true,[4]=true})
    assert(#full==2,"the destination row carries the two destination findings")
    local one=Content.findings(binding,seed,2,{[1]=true,[2]=true})[1]
    assert(type(one)=="string" and one~="","part-two finding must have an authored expansion")
    for mask=0,15 do
        local known={};for part=1,4 do if math.floor(mask/2^(part-1))%2==1 then known[part]=true end end
        for part=1,4 do
            local actual=Content.findings(binding,seed,part,known)
            local want={}
            if part==2 and known[1] and known[2] then want[#want+1]=one end
            if part==4 and known[3] and known[4] then want[#want+1]=full[1] end
            if part==4 and known[1] and known[2] and known[3] and known[4] then want[#want+1]=full[2] end
            assert(#actual==#want,"finding count differs for subset "..mask.." part "..part)
            for i,text in ipairs(want) do assert(actual[i]==text,"finding differs for subset "..mask.." part "..part) end
        end
    end
    assert(#Content.findings(binding,seed,4,{[4]=true})==0,"destination-first discovery has no unseen comparisons")
    for _,printId in ipairs(binding.printIds or {}) do assert(C.print(printId),"invalid optional print association") end
end
for _,id in ipairs(expected) do assert(seen[id],"unreachable map story family "..id) end
assert(galleryActual==1,"one binding identifies LouisvilleStashMap15 as the actual gallery catalogue")
-- Theme words are whole words.  "scared" must select exactly as an unthemed
-- annotation, rather than accidentally matching the vehicle word "car".
for seed=1,16 do
    local blank=Content.scenario({id="word-boundary",label="Edge",sourceText=""},seed)
    local scared=Content.scenario({id="word-boundary",label="Edge",sourceText="scared"},seed)
    assert(scared.id==blank.id,"theme matching must not use a substring of 'scared'")
end
print("PASS map content: 125 real bindings and all 17 authored families render; findings use actual source subsets")
