package.path=TEST_ROOT.."/dev/?.lua;"..package.path
local G=require("generated-investigation/Generator")
local Catalog=require("generated-investigation/Catalog")
local Kinds=require("generated-investigation/EvidenceKinds")
local function catalog() return dofile(TEST_ROOT.."/test/fixtures/synthetic_locations.lua") end
local options={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function generated(seed,c) return assert(G.generate(c or catalog(),seed or 17,options)) end

test("generated case repeats across catalog order and does not alias input",function()
    local c=catalog(); local before=generated(17,c)
    local reversed=catalog(); reversed.locations={}; for i=#c.locations,1,-1 do reversed.locations[#reversed.locations+1]=c.locations[i] end
    assertDeepEqual(before,generated(17,reversed))
    c.locations[1].name="Changed after generation"; assertTrue(G.validate(before))
    local restored=assert(G.restore(before)); restored.facts.sender="Changed snapshot"; assertFalse(G.validate(restored)); assertTrue(G.validate(before))
end)

test("generated 100-seed sample varies sites outlines text, carriers and bounded role counts",function()
    local outlines,locationPairs,bodies,kinds,counts,carrierSets={},{},{},{},{},{}
    for seed=1,100 do
        local c=generated(seed); assertTrue(G.validate(c)); assertTrue(#c.documents>=G.MIN_EVIDENCE and #c.documents<=G.MAX_EVIDENCE)
        assertTrue(c.identities[1].name~=c.identities[2].name)
        assertTrue(c.facts.dispatchDay<c.facts.receiptDay and c.facts.receiptDay<c.facts.reviewDay)
        outlines[c.outline]=true; locationPairs[c.locations[1].id.."/"..c.locations[2].id]=true
        bodies[c.documents[2].body]=true; kinds[c.documents[2].links[1].kind]=true
        counts[#c.documents]=true
        local carriers={}; for _,doc in ipairs(c.documents) do carriers[#carriers+1]=doc.kind end
        carrierSets[table.concat(carriers,",")]=true
        local required=assert(G.requiredContainers(c)); local total=0
        for _,n in pairs(required) do total=total+n end
        assertEqual(#c.documents,total,"required distinct containers follows selected evidence")
        -- Every READABLE document carries the case reference, which is how a
        -- player ties three pieces of paper into one file. Object evidence
        -- (2026-09-09) carries none, and cannot: nothing is written on a
        -- hammer. It belongs to the case by having been kept with the papers
        -- and by the connection the notebook records - never by a reference we
        -- would have had to pretend was engraved on it.
        for _,doc in ipairs(c.documents) do
            local carrier=assert(Kinds.get(doc.kind))
            if carrier.capacity=="object" then
                assertTrue(doc.body:find(c.facts.code,1,true)==nil,
                    "an object must not carry a written case reference")
                assertTrue(doc.wear~=nil,"object evidence must say what state it was found in")
            else
                assertTrue(doc.body:find(c.facts.code,1,true)~=nil)
            end
        end
    end
    local n=0; for _ in pairs(locationPairs) do n=n+1 end
    assertTrue(n>=2); assertTrue(outlines.corroboration); assertTrue(outlines['conflicting-account'])
    n=0; for _ in pairs(bodies) do n=n+1 end; assertTrue(n>=2)
    assertTrue(kinds.corroborates); assertTrue(kinds['disputes-delivery'])
    n=0; for _ in pairs(counts) do n=n+1 end; assertTrue(n>=2,"role count must vary across seeds")
    n=0; for _ in pairs(carrierSets) do n=n+1 end; assertTrue(n>=2,"carrier selection must vary across seeds")
end)

test("generated eligibility rejects unknown excluded incompatible and synthetic defaults",function()
    assertEqual(nil,G.generate(catalog(),17,{mapId=options.mapId,buildLine=options.buildLine}))
    local c=catalog()
    for i=3,12 do c.locations[i].excluded=true end
    c.locations[1].paperStorage="unknown"; assertEqual(nil,G.generate(c,17,options))
    c.locations[1].paperStorage="observed"; c.locations[1].mapId="OTHER"; assertEqual(nil,G.generate(c,17,options))
    c.locations[1].mapId=options.mapId; c.locations[1].buildLine="OTHER"; assertEqual(nil,G.generate(c,17,options))
    c.locations[1].buildLine=options.buildLine; assertTrue(G.generate(c,17,options)~=nil)
end)

test("generated locations cannot use aliases or overlapping floors as distinct sites",function()
    local c=catalog(); for i=3,12 do c.locations[i].excluded=true end
    c.locations[2].areaId=c.locations[1].areaId; assertEqual(nil,G.generate(c,17,options))
    c.locations[2].areaId="different-alias"
    c.locations[2].bounds={x1=100,y1=0,x2=108,y2=8,z=1}
    assertEqual(nil,G.generate(c,17,options))
end)

test("generated malformed catalogs and seeds fail without producing a partial case",function()
    local c=catalog(); c.locations[2].id=c.locations[1].id; assertFalse(Catalog.validate(c)); assertEqual(nil,G.generate(c,17,options))
    c=catalog(); c.locations[1].source=nil; assertFalse(Catalog.validate(c))
    c=catalog(); c.locations[1].bounds.x1=0/0; assertFalse(Catalog.validate(c))
    c=catalog(); c.locations[1].containerTypes={"invented-container"}; assertFalse(Catalog.validate(c))
    c=catalog(); c.locations[1].source.loop=c; assertFalse(Catalog.validate(c))
    assertEqual(nil,G.generate(catalog(),0,options)); assertEqual(nil,G.generate(catalog(),1.5,options))
    assertEqual(nil,G.generate(catalog(),17,true)); assertEqual(nil,G.generate(catalog(),17,{mapId=options.mapId,buildLine=options.buildLine,typo=true}))
end)

test("generated restoration rejects altered facts text references and unsupported revisions",function()
    local c=generated(); c.documents[1].body="Unrelated content"; assertEqual(nil,G.restore(c))
    c=generated(); c.documents[2].links[1].target="missing"; assertEqual(nil,G.restore(c))
    c=generated(); c.generatorRevision="future"; assertEqual(nil,G.restore(c))
    c=generated(); c.extra=true; assertEqual(nil,G.restore(c))
    c=generated(); c.documents[1].body=string.rep("x",500001); assertEqual(nil,G.restore(c))
    c=generated(); local currentCatalog=catalog(); currentCatalog.revision="changed"; currentCatalog.locations={}
    assertEqual(nil,G.generate(currentCatalog,17,options)); assertDeepEqual(c,assert(G.restore(c)))
end)

test("generated projections preserve discovery order and hide undiscovered connections",function()
    local c=generated(); assertEqual(0,#assert(G.project(c,{})))
    local d1,d2,d3=c.documents[1],c.documents[2],c.documents[3]
    local partial=assert(G.project(c,{d3.id})); assertEqual(1,#partial); assertEqual(0,#partial[1].connections)
    assertEqual(nil,partial[1].facts); assertEqual(nil,partial[1].outline)
    local rows=assert(G.project(c,{d3.id,d2.id})); assertEqual(d3.id,rows[1].id); assertEqual(1,#rows[1].connections); assertEqual(0,#rows[2].connections)
    rows=assert(G.project(c,{d3.id,d2.id,d1.id})); assertEqual(1,#rows[2].connections)
    rows[1].body="Mutated projection"; assertTrue(G.validate(c))
    assertEqual(nil,G.project(c,{d1.id,d1.id})); assertEqual(nil,G.project(c,{"unknown"})); assertEqual(nil,G.project(c,{[2]=d1.id}))
end)


test("nearby catalog preserves unknown storage and blocks premature generation",function()
    local N=require("generated-investigation/NearbyCatalog")
    local r={version="T3-nearby-2",map="test-map",gameVersion="42.20",buildings=2,rows={
        {kind="building",id="a",x=1,y=1,x2=5,y2=5,minLevel=0},
        {kind="building",id="building-b",x=20,y=20,x2=25,y2=25,minLevel=0}}}
    local c=assert(N.fromResult(r))
    assertEqual("unknown",c.locations[1].paperStorage)
    assertEqual(0,#assert(Catalog.eligible(c,"test-map","42.20")))
    assertEqual(nil,G.generate(c,1,{mapId="test-map",buildLine="42.20"}))
    r.rows[1].x=100
    assertEqual(1,c.locations[1].bounds.x1)
    assertEqual(nil,N.fromResult(r))
end)


test("new-case reach follows survival boundaries and never widens for scarcity",function()
    local R=require("ConspiracyFiles/Reach")
    for _,v in ipairs({{0,250},{95.999,250},{96,500},{263.999,500},{264,1000},{503.999,1000},{504,1500},{10000,1500}}) do
        assertEqual(v[2],R.radius(v[1]))
    end
    for _,v in ipairs({-1,math.huge,-math.huge,0/0,"96"}) do assertEqual(nil,R.radius(v)) end
    local c=catalog()
    c.locations={c.locations[1],c.locations[2]}
    c.locations[1].bounds={x1=0,y1=0,x2=5,y2=5,z=0}
    c.locations[2].bounds={x1=500,y1=0,x2=505,y2=5,z=0}
    local ctx={hoursSurvived=0,anchor={x=0,y=0}}
    assertEqual(nil,G.generateNew(c,1,options,ctx))
    ctx.hoursSurvived=96
    local result=assert(G.generateNew(c,1,options,ctx))
    ctx.hoursSurvived=504
    assertDeepEqual(result,assert(G.restore(result)))
    c.locations[2].bounds.x1=501
    ctx.hoursSurvived=96
    assertEqual(nil,G.generateNew(c,1,options,ctx))
    assertEqual(nil,G.generateNew(c,1,options,{hoursSurvived=96,anchor={x=0/0,y=0}}))
end)


test("generated session stages writes, preserves discoveries and refuses corrupt targets",function()
    local S=require("ConspiracyFiles/Generated/Session")
    local c=generated(); local targets={}
    for _,site in ipairs(c.locations) do
        local b=site.bounds
        targets[site.id]={x=b.x1,y=b.y1,z=b.z,objectIndex=0,containerIndex=0,containerType=site.containerTypes[1],sprite="fixture"}
    end
    local root=assert(S.create(c,targets)); local saved; local writes=0
    local session=assert(S.open(root,function(v) saved=v;writes=writes+1 end))
    local id=c.documents[1].id
    assertFalse(session.inspect(id)); assertTrue(session.status(id,"placing"))
    assertFalse(session.status(id,"pending")); assertTrue(session.status(id,"placed")); assertTrue(session.inspect(id))
    assertEqual(1,#session.project()); assertTrue(session.inspect(id)); assertEqual(1,#session.project())
    local beforeWrites=writes;local sameRoot=saved
    for i=1,120 do assertTrue(session.status(id,"placed"));assertTrue(session.inspect(id)) end
    assertEqual(beforeWrites,writes);assertTrue(saved==sameRoot)
    local restored=assert(S.open(saved,function() error("simulated persistence failure") end))
    local before=restored.snapshot(); assertFalse(restored.status(id,"conflict")); assertDeepEqual(before,restored.snapshot())
    assertTrue(session.status(id,"conflict")); assertFalse(session.status(id,"placed")); assertEqual(1,#session.project())
    root.assignments[id].target.x=999999
    assertFalse(S.validate(root))
    saved.extra=true; assertFalse(S.validate(saved))
end)


test("place descriptions remove debug coordinates without changing saved facts",function()
    local P=require("ConspiracyFiles/Generated/PlaceNames")
    local a={id="a",name="Building at 10964, 9696",mapId="Muldraugh, KY",buildLine="42.20",bounds={x1=10964,y1=9696,x2=10968,y2=9709,z=0}}
    local b={id="b",name="Building at 10994, 9696",mapId="Muldraugh, KY",buildLine="42.20",bounds={x1=10994,y1=9696,x2=11001,y2=9709,z=0}}
    local case={locations={a,b}}
    assertEqual("3rd St",P.street(a)); assertEqual("3rd St",P.street(b))
    local body="Route: "..a.name.." to "..b.name..". Record R-736."
    local rendered=P.render(body,case)
    assertFalse(rendered:find("10964",1,true)~=nil); assertFalse(rendered:find("10994",1,true)~=nil)
    assertTrue(rendered:find("receiving building near 3rd St",1,true)~=nil)
    assertTrue(rendered:find("30 paces east",1,true)~=nil)
    assertTrue(rendered:find("R-736",1,true)~=nil)
    assertEqual("Building at 10964, 9696",a.name)
    assertFalse(P.render("Review at "..b.name,case):find("dispatch building",1,true)~=nil)
    a.buildLine="unverified"; assertEqual(nil,P.street(a))
    a.name="Verified Shop"; b.name="Verified Home"
    assertEqual("Verified Shop to Verified Home",P.render("Verified Shop to Verified Home",case))
end)
