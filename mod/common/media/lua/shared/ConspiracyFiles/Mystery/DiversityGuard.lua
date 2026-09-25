-- THE ROSTER MUST NOT REPEAT ITSELF.
--
-- Design v3, iteration 2's converged answer to "repetitions break the
-- illusion of a true mystery": a single mystery cannot be judged alone -
-- sameness is a property of the SET. This guard walks a roster of shape
-- cards (ShapeCard.lua) and refuses it, naming the collision, if:
--   * two mysteries share the exact tuple key (site pattern, count bucket,
--     dominant mechanic, LINK shapes, close kind);
--   * two mysteries' voice profiles are too similar (fuzzy, cosine);
--   * one mechanic or one close kind is over-represented past a quota;
--   * an occupation named anywhere in the roster's own coverage list has no
--     authored reading in any mystery.
--
-- This module's own test proves both directions: it must accept the 20
-- ordinary premises and the Fitness ten (already varied by hand), and it
-- must refuse a roster shaped like the twenty-four withdrawn occupation
-- families (DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN) - that refusal is
-- the guard's own acceptance test, not a hypothetical.
local ShapeCard=require("ConspiracyFiles/Mystery/ShapeCard")
local M={}

M.VOICE_SIMILARITY_THRESHOLD=0.999
M.MECHANIC_QUOTA_FRACTION=0.5
M.CLOSE_QUOTA_FRACTION=0.7

-- `mysteries` is a list of mystery tables (Vocabulary shape); `coverage` is
-- an optional list of occupation ids the roster is expected to reach (nil
-- skips that check, for a roster that is not occupation-scoped). Returns
-- true, or false plus a message naming the exact collision.
function M.check(mysteries,coverage)
    if type(mysteries)~="table" or #mysteries==0 then return false,"empty roster" end
    local cards={}
    for i,mystery in ipairs(mysteries) do cards[i]=ShapeCard.compute(mystery) end

    -- Exact collision.
    local byTuple={}
    for _,card in ipairs(cards) do
        local key=ShapeCard.tupleKey(card)
        if byTuple[key] then
            return false,card.id.." and "..byTuple[key]..
                " share the exact shape (site/count/mechanic/link/ending): "..key
        end
        byTuple[key]=card.id
    end

    -- Fuzzy voice collision.
    for i=1,#cards do
        for j=i+1,#cards do
            local sim=ShapeCard.voiceSimilarity(cards[i].voice,cards[j].voice)
            if sim>=M.VOICE_SIMILARITY_THRESHOLD then
                return false,cards[i].id.." reads too much like "..cards[j].id..
                    " (voice similarity "..string.format("%.3f",sim)..")"
            end
        end
    end

    -- Mechanic and ending quotas.
    local mechanicCount,closeCount={},{}
    for _,card in ipairs(cards) do
        mechanicCount[card.dominantGate]=(mechanicCount[card.dominantGate] or 0)+1
        closeCount[card.closeKind]=(closeCount[card.closeKind] or 0)+1
    end
    local n=#cards
    for mechanic,count in pairs(mechanicCount) do
        if mechanic~="none" and count/n>M.MECHANIC_QUOTA_FRACTION then
            return false,"too many mysteries ("..count.."/"..n..") lean on the '"..mechanic.."' mechanic"
        end
    end
    for kind,count in pairs(closeCount) do
        if count/n>M.CLOSE_QUOTA_FRACTION then
            return false,"too many mysteries ("..count.."/"..n..") end as '"..kind.."'"
        end
    end

    -- Occupation coverage.
    if coverage then
        local reached={}
        for _,card in ipairs(cards) do
            for _,o in ipairs(card.occupations) do reached[o]=true end
        end
        for _,o in ipairs(coverage) do
            if not reached[o] then return false,"no mystery in this roster has an authored reading for "..o end
        end
    end

    return true
end

return M
