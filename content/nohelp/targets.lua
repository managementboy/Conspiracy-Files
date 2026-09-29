-- THE NO HELP CONTENT TARGETS (Claude-owned; the writer does not edit this).
-- The denominators and thresholds tools/nohelp_content/progress.lua measures
-- accepted content against. Denominators are computed from the shipped data,
-- never hardcoded, so a regenerated MapSites or scene table moves them.
--   require path: run from the repository root.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local Manifest=require("NHShared/Mystery/Manifest")
local Sites=require("NHShared/Generated/MapSites")
local T={}

-- MAPS: every design's mark and note keys (Manifest.markKey). A design is
-- covered when each of its keys has at least one accepted clue anchored to it.
T.designs={}      -- design -> {key,...}
T.designOrder={}
do
    for _,d in ipairs(Sites.designs or {}) do T.designs[d]={}; T.designOrder[#T.designOrder+1]=d end
    local seen={}
    for _,e in ipairs(Sites.sites or {}) do
        for _,m in ipairs(e.marks or {}) do
            local k=Manifest.markKey(m)
            if k and m.design and T.designs[m.design] and not seen[k] then
                seen[k]=true
                local keys=T.designs[m.design]; keys[#keys+1]=k
            end
        end
    end
end

-- FLYERS: every print. Covered with one accepted clue anchored {print=...}.
T.prints={}
for _,p in ipairs(Sites.prints or {}) do T.prints[#T.prints+1]=p end

-- SCENES: the shipped scene table's kinds that hold a clue (Generated/
-- VanillaScenes.lua, step 5: its refused kinds are not counted). A kind is
-- covered with one accepted clue anchored {scene=<kind>} (or a version of it).
-- Without the table the list is not shipped and the gate never passes.
T.scenesShipped=false
T.scenes={}
do
    local ok,S=pcall(require,"NHShared/Generated/VanillaScenes")
    if ok and type(S)=="table" then
        T.scenesShipped=true
        local kinds=S.kinds or {}
        local names={}
        for k in pairs(kinds) do names[#names+1]=k end
        table.sort(names)
        for _,k in ipairs(names) do
            local row=kinds[k]
            if type(row)=="table" and (row.spot or Manifest.SCENE_SPOTS[row.anchor]) then T.scenes[#T.scenes+1]=k end
        end
    end
end

-- PERSONS come from accepted rows: every person id needs exactly one card and
-- at least one mention (progress.lua counts them).

-- THRESHOLDS.
T.setShare=0.5          -- object sets among all accepted clues, at least
T.leanMax=0.52          -- clues read A only vs B only: neither above this share (owner, 2026-09-29: match them)
T.staleDays=14          -- a deferral or quarantine older than this is stale
T.adhdEvery=nil         -- retired (owner, 2026-09-29): the one blind read replaced the ADHD cadence

-- FIRST RELEASE: tickets per type (handoff section 5), accepted in the
-- registry. SCENE and UNIQUE are open now the scene table ships.
T.firstRelease={STAGE0=1,PLACE=9,PERSON=3,MAP=3,SCENE=2,UNIQUE=1}
T.typeOrder={"STAGE0","PLACE","PERSON","MAP","SCENE","UNIQUE"}

return T
