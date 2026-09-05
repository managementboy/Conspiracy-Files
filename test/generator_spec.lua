package.path=TEST_ROOT.."/dev/?.lua;"..package.path
local G=require("generated-investigation/Generator")
local Catalog=require("generated-investigation/Catalog")
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

test("generated 100-seed sample varies sites outlines text and connection meaning",function()
    local outlines,locationPairs,bodies,kinds={},{},{},{}
    for seed=1,100 do
        local c=generated(seed); assertTrue(G.validate(c)); assertEqual(3,#c.documents)
        assertTrue(c.identities[1].name~=c.identities[2].name)
        assertTrue(c.facts.dispatchDay<c.facts.receiptDay and c.facts.receiptDay<c.facts.reviewDay)
        outlines[c.outline]=true; locationPairs[c.locations[1].id.."/"..c.locations[2].id]=true
        bodies[c.documents[2].body]=true; kinds[c.documents[2].links[1].kind]=true
        for _,doc in ipairs(c.documents) do assertTrue(doc.body:find(c.facts.code,1,true)~=nil) end
    end
    local n=0; for _ in pairs(locationPairs) do n=n+1 end
    assertTrue(n>=2); assertTrue(outlines.corroboration); assertTrue(outlines['conflicting-account'])
    n=0; for _ in pairs(bodies) do n=n+1 end; assertTrue(n>=2)
    assertTrue(kinds.corroborates); assertTrue(kinds['disputes-delivery'])
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
