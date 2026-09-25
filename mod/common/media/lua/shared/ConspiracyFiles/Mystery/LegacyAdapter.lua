-- A READ-ONLY TRANSLATION OF SHIPPED CONTENT INTO THE VOCABULARY, FOR AUDIT ONLY.
--
-- Design v3, build plan step 2. This module exists for ONE purpose: to let
-- the already-built DiversityGuard/ShapeCard be calibrated against real
-- shipped content, so the guard's own acceptance test (accept the 20
-- ordinary premises and the Fitness ten; refuse a roster shaped like the
-- withdrawn 24) is measured against what actually ships, not a hand-typed
-- stand-in. It does NOT touch, require, or feed back into the live
-- generator (Story.lua/Generator.lua/Session.lua/GeneratedRuntime.lua):
-- their behaviour is exactly as shipped, unchanged by this module's
-- existence. It requires only EvidenceKinds - a pure catalogue table with
-- no PZ dependency and no generator logic, already required with no
-- session state by Story.lua itself.
--
-- Three ADHD frames (regulator, one-hour, inversion) converged on the same
-- discipline, so this module follows it exactly:
--   * ONE FINDING PER DOCUMENT, always. Never merged (two documents at one
--     location stay two findings), never dropped (a document with no
--     locationId becomes a "heard" finding rather than vanishing) - so a
--     translated finding count always equals the source document count,
--     and the guard cannot be shown a roster shrunk to look more varied.
--   * LINK SHAPE FROM ARITY AND THE LEGACY KIND, never defaulted to
--     "pair": two-requirement comparisons are pair; three or more are
--     threeWay; Story's own "disputes-delivery" kind is a contradiction
--     regardless of arity. Legacy content has no authored red herrings, so
--     this adapter can never emit "redHerring" - an honest absence, and
--     itself a diversity gap the guard should be able to see.
--   * CLOSE FROM THE CASE'S OWN ESSENTIAL LIST, never inferred from prose:
--     `close={kind="all",keys=case.essential}` is not a guess - it is
--     exactly what Session.accounted() already means for a live case, only
--     read rather than reimplemented.
--   * OCCUPATION FROM case.opening.profession ONLY, never string-mined
--     from title or body text.
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local M={}

local function linkShape(comparison)
    if comparison.kind=="disputes-delivery" then return "contradiction" end
    local n=type(comparison.requires)=="table" and #comparison.requires or 2
    return n>=3 and "threeWay" or "pair"
end

-- `case` is an already-built, already-validated legacy case (Generator's
-- own output shape: documents, story.comparisons, story.centralAxis,
-- essential, opening). Returns a Vocabulary-shaped mystery table, or nil
-- plus a reason for a case this adapter cannot honestly represent (never a
-- best-guess approximation - the inversion frame's "boundary-case honesty").
function M.fromCase(case)
    if type(case)~="table" or type(case.documents)~="table" or #case.documents==0 then
        return nil,"no documents to translate"
    end
    if type(case.story)~="table" or type(case.story.centralAxis)~="string" then
        return nil,"no central axis to translate"
    end
    local findings={}
    local profession=case.opening and case.opening.profession
    for _,doc in ipairs(case.documents) do
        local carrier=Kinds.get(doc.kind)
        local hasLocation=type(doc.locationId)=="string" and doc.locationId~=""
        local where,capacity
        if doc.accessIntent=="starting-building" then where,capacity="onMe",carrier and carrier.capacity or "prose"
        elseif doc.placementIntent=="vehicle" then where,capacity="vehicle",carrier and carrier.capacity or "prose"
        elseif hasLocation then where,capacity="site",carrier and carrier.capacity or "prose"
        else
            -- No location this adapter can honestly place. Never dropped -
            -- but never claimed as a spatially found object either: the
            -- adapter does not know WHERE this was found, only what it
            -- said, so it is represented as reported text, capacity
            -- "heard", rather than falsely keeping the catalogue kind's
            -- object/prose capacity for something with no known site.
            where,capacity="heard","heard"
        end
        findings[doc.id]={
            where=where,capacity=capacity,kind=doc.kind,wear=hasLocation and doc.wear or nil,
            -- The legacy body is one rendered string, not three parts; the
            -- adapter puts it all in `note` rather than splitting it and
            -- inventing an observation/source seam the case never had.
            observation="",source="",note=doc.body,
            occupation=profession,
        }
    end
    local links={}
    for i,comparison in ipairs(case.story.comparisons or {}) do
        links[i]={shape=linkShape(comparison),requires=comparison.requires or {comparison.from,comparison.to},
            text=comparison.text}
    end
    local close
    if type(case.essential)=="table" and #case.essential>0 then
        close={kind="all",keys=case.essential}
    end -- else nil: a legacy case with no essential list is honestly carried, never assumed complete
    return {
        id=case.caseId or "legacy-case",
        centralAxis=case.story.centralAxis,
        findings=findings,
        links=links,
        close=close,
    }
end

return M
