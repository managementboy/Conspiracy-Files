-- Run from repository root with an existing output directory argument.
package.path="./mod/common/media/lua/shared/?.lua;./dev/?.lua;"..package.path
local G=require("generated-investigation/Generator")
local c=dofile("test/fixtures/synthetic_locations.lua")
local out=assert(arg[1],"supply an existing output directory")
local options={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local log=assert(io.open(out.."/seed-sample.txt","wb"))
log:write("OFFLINE SYNTHETIC DATA ONLY; no real map placement or live evidence.\n")
local outlines,pairsSeen={},{}
for seed=1,100 do
    local case=assert(G.generate(c,seed,options))
    local pair=case.locations[1].id.."/"..case.locations[2].id
    local unordered=case.locations[1].id<case.locations[2].id and pair or case.locations[2].id.."/"..case.locations[1].id
    pairsSeen[unordered]=true; outlines[case.outline]=(outlines[case.outline] or 0)+1
    log:write("seed="..seed.." outline="..case.outline.." sites="..pair.." code="..case.facts.code.." connection="..case.documents[2].links[1].kind.."\n")
    if seed<=2 then
        local f=assert(io.open(out.."/example-seed-"..seed..".md","wb"))
        f:write("# Generated draft example — seed "..seed.."\n\nSynthetic locations; development prose is unapproved. No game items were placed.\n\nOutline: "..case.outline.."\n\n")
        for i,doc in ipairs(case.documents) do f:write("## "..doc.title.."\n\nLocation: "..doc.locationId.."\n\n```text\n"..doc.body.."\n```\n"..(i<#case.documents and "\n" or "")) end
        f:close()
    end
end
local count=0; for _ in pairs(pairsSeen) do count=count+1 end
local summary="100 seeds; "..count.." distinct unordered site pairs; corroboration="..(outlines.corroboration or 0).."; conflicting-account="..(outlines['conflicting-account'] or 0)
log:write(summary.."\n"); log:close(); print(summary)
