-- Structural evidence roles, split from the physical carrier that expresses
-- them. Per docs/design/EVIDENCE_ROLE_SCHEMA.md: a role is what a generated
-- document DOES in the case (recontextualises the route lead, introduces a
-- person, dates an event, ...); a carrier (EvidenceKinds) is the physical
-- object kind that carries its text. Generator.build asks this module which
-- carriers suit a role and lets the case seed choose among them, instead of
-- writing one carrier kind straight into the role. Pure domain: zero PZ
-- runtime dependencies, plain Lua 5.1.
--
-- Each role declares an explicit, ordered carrier whitelist rather than
-- deriving it from EvidenceKinds by capacity alone: capacity says a carrier
-- COULD hold the role's text, not that it fits the role's story (a diary
-- role should never surface as a credit card just because both are generic
-- "prose"/"short"). The load below cross-checks every declared carrier
-- against EvidenceKinds.capacity so a mismatched entry fails fast at require
-- time instead of silently emitting a role's prose onto a card.
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local ObjectRules=require("ConspiracyFiles/Generated/ObjectRules")
local M={}

-- id -> {capacity="prose"|"short", carriers={kind,...}}
-- Carrier lists are literal arrays (never built from pairs()) so role
-- selection stays deterministic across Lua implementations.
local roles={
    access={capacity="prose",carriers={"key"}},
    diaryContext={capacity="prose",carriers={"diary"}},
    notebookContext={capacity="prose",carriers={"notebook"}},
    clippingContext={capacity="prose",carriers={"clipping"}},
    -- Introduces a person/organisation as a short named identifier only --
    -- a card, never a page of prose. Reachable carriers: idcard, businesscard.
    affiliationLead={capacity="short",carriers={"idcard","businesscard"}},
    -- Places someone somewhere / dates an event as a short transactional
    -- identifier. Reachable carriers: creditcard, ticket.
    itineraryLead={capacity="short",carriers={"creditcard","ticket"}},
    -- Phase 3 (docs/design/USING_GAME_ASSETS.md). Roles are the variety
    -- multiplier: MAX_EVIDENCE caps a case at seven documents whatever the
    -- pool size, so a wider pool costs nothing in save budget and changes what
    -- a case can be about.
    --
    -- These three exist to DISAGREE. Until now every optional document
    -- connected to the route lead with "recontextualises" - it added context
    -- and nothing more - so only the mandatory receiving copy could ever
    -- contradict anything. A case whose every optional document merely agrees
    -- is not an investigation.
    --
    -- A payment recorded against the shipment. Its date is the interesting
    -- part, not its amount.
    paymentRecord={capacity="prose",carriers={"receipt","notepad"}},
    -- Someone was demonstrably somewhere on a day that does not fit.
    timingDispute={capacity="short",carriers={"ticket","creditcard"}},
    -- A routine log that happens to place a person somewhere. Supports rather
    -- than disputes: a case where everything disagrees is as flat as one where
    -- nothing does.
    presenceNote={capacity="prose",carriers={"notebook","notepad"}},
    -- Object roles (2026-09-09). Every role above names its carriers
    -- explicitly, which is right when there are one or two of them and
    -- impossible when there are two hundred. These name a RULE instead, and
    -- ObjectRules answers it from the catalogue derived from the game's own
    -- item scripts - so an object role reaches whatever the game ships rather
    -- than whatever a person remembered to type.
    --
    -- They carry no readable text. A bloodied hammer in a bedside drawer says
    -- what it says by being there; the notebook records that it was found,
    -- and nothing interprets it.
    physicalTrace={capacity="object",rule="physicalTrace"},
    bearsName={capacity="object",rule="bearsName"},
    outOfPlace={capacity="object",rule="outOfPlace"},
}
local ORDER={"access","diaryContext","notebookContext","clippingContext","affiliationLead","itineraryLead",
             "paymentRecord","timingDispute","presenceNote",
             "physicalTrace","bearsName","outOfPlace"}

for _,roleId in ipairs(ORDER) do
    local role=roles[roleId]
    if role.rule then
        assert(role.capacity=="object","only object roles may select by rule: "..roleId)
        assert(ObjectRules.describe(role.rule),"evidence role "..roleId.." names an unknown object rule")
        assert(role.carriers==nil,"an object role selects by rule, never from a carrier list: "..roleId)
    else
        assert(type(role.carriers)=="table" and #role.carriers>0,"evidence role "..roleId.." needs at least one carrier")
        for _,kind in ipairs(role.carriers) do
            local v=assert(K.get(kind),"evidence role "..roleId.." references unknown carrier "..tostring(kind))
            assert(v.capacity==role.capacity,"evidence role "..roleId.." capacity mismatch for carrier "..kind)
        end
    end
end

-- Ordered role ids. Callers must not rely on Lua table iteration order.
function M.list()
    local out={}
    for i,id in ipairs(ORDER) do out[i]=id end
    return out
end

function M.capacityOf(roleId)
    local role=roles[roleId]
    return role and role.capacity
end

-- The object rule a role selects by, or nil for a role with a carrier list.
function M.ruleOf(roleId)
    local role=roles[roleId]
    return role and role.rule
end

function M.carriersOf(roleId)
    local role=roles[roleId]
    if not role or role.rule then return nil end
    local out={}
    for i,kind in ipairs(role.carriers) do out[i]=kind end
    return out
end

-- Deterministic carrier choice for a role. `random` must be the caller's
-- seeded PRNG (see Generator.lua's `rng`) so the same seed always chooses
-- the same carrier: this function makes no calls of its own beyond the one
-- draw, and never falls back to os.time/math.random.
function M.choose(random,roleId)
    local role=roles[roleId]
    if not role then return nil,"unknown evidence role" end
    if type(random)~="function" then return nil,"random generator required" end
    if role.rule then
        local item=ObjectRules.choose(random,role.rule)
        if not item then return nil,"object rule produced nothing" end
        return item.id
    end
    local carriers=role.carriers
    return carriers[random(#carriers)]
end

-- Hard constraint: a role may only be assigned a carrier able to express its
-- text. `body` is the exact text intended for the item copy currently under
-- construction, so a role that accidentally emitted a page of prose onto a
-- short carrier is caught here rather than at spawn time.
function M.fits(roleId,kind,body)
    local role=roles[roleId]
    if not role then return false,"unknown evidence role" end
    local allowed=false
    if role.rule then
        for _,candidate in ipairs(ObjectRules.candidates(role.rule)) do if candidate==kind then allowed=true end end
    else
        for _,candidate in ipairs(role.carriers) do if candidate==kind then allowed=true end end
    end
    if not allowed then return false,"carrier "..tostring(kind).." does not suit role "..roleId end
    if not K.fits(kind,body) then return false,"text exceeds carrier "..tostring(kind).."'s capacity" end
    return true
end

return M
