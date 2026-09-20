-- Inventory cases retain their three-source conclusions. Optional evidence
-- is a compatible observation with its own gate, never a fourth route to the
-- ending.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Stories=require("ConspiracyFiles/Generated/InventoryScenarios")
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local families={"identical-inventories","room-not-on-the-plan","lease-outlived-tenant","load-that-got-lighter","fuel-for-a-dead-truck"}
local physical={key=true,photograph=true}
for _,id in ipairs(families) do
    for variant=1,2 do
        local scenario=assert(Stories[id][variant])
        assert(Story.validate(scenario),id.." / "..variant.." remains a valid authored event")
        assert(#scenario.essential==3 and #scenario.optional>=1 and #scenario.optional<=2,
            id.." / "..variant.." keeps its three anchors and bounded optional evidence")
        for _,extra in ipairs(scenario.optional) do
            local kind=assert(Kinds.get(extra.kind))
            assert(extra.role=="person" or extra.role=="records" or extra.role=="listen")
            assert(Kinds.fits(extra.kind,Story.body(extra.observation,extra.source,extra.note)),
                id.." / "..variant.." optional fits its carrier")
            if physical[extra.kind] then
                assert(#extra.source<=90 and not extra.source:find("\n\n",1,true),
                    "a physical carrier keeps only a short visible marking")
            end
            local linked=false
            for _,finding in ipairs(scenario.comparisons) do
                local hasOptional,hasAnchor=false,false
                for _,need in ipairs(finding.requires) do
                    if need==extra.key then hasOptional=true end
                    if need=="claim" or need=="response" or need=="review" then hasAnchor=true end
                end
                if hasOptional then linked=true;assert(hasAnchor,"optional finding remains gated by an anchor") end
            end
            assert(linked,"every optional contribution has an authored comparison")
        end
    end
end
print("PASS inventory optional evidence: ten authored variants keep their anchor conclusions and gate each compatible extra")
