-- Which objects an investigation may use, expressed as RULES over the derived
-- catalogue rather than as a list of item names.
--
-- Owner, 2026-09-09, on the fifty curated objects - and before that on the two
-- hundred curated landmarks: "50 just as 200 was an example not a requirement.
-- selection rules over the derived catalogue."
--
-- The argument is the same one that killed the landmark atlas as a shipping
-- mechanism. A hand-picked list is a bottleneck the moment it ships: every
-- case draws from a pool one person wrote in an afternoon, and everything that
-- person did not happen to type is unreachable forever. A rule asks the
-- catalogue a question - something that can be found damaged, in a room like
-- this, that would be out of place there - and gets back whatever the game
-- actually has. The curated fifty in docs/design/MYSTERY_OBJECTS.md is now a
-- worked example of what these rules should produce, not the pool itself.
--
-- Pure domain: zero PZ runtime dependencies, plain Lua 5.1.
local Catalogue=require("ConspiracyFiles/Generated/ObjectCatalogue")
local M={}

-- Categories no investigation may draw from, with the reason. A denial needs a
-- reason or the next person cannot tell a judgement from an accident.
local DENY={
    -- Placing evidence must never become a loot faucet. A pipe bomb found in a
    -- drawer is a pipe bomb the player now owns, and the mod would be paying
    -- them to read the notebook.
    Explosives="a working explosive is loot, not evidence",
    -- Craftable and salvage families are enormous, near-identical, and read as
    -- inventory rather than as anything having happened.
    WeaponCrafted="hundreds of near-identical crafted variants read as inventory",
    Material="raw materials say nothing about a person or an event",
    MaterialWeapon="as Material",
    VehicleMaintenance="a spare part is only a story with a vehicle attached, which we do not yet model",
    ProtectiveGear="armour is equipment; it says what someone wore, which the outfit lead already covers",
}

-- id -> rule. `requires` are properties every candidate must carry;
-- `anyCategory`, when present, restricts to those DisplayCategories.
-- `wear` is how the object should be found: "poor" places it near the end of
-- its condition track, which is both what the story usually implies and what
-- keeps evidence from being better loot than the loot.
local rules={
    -- Something happened and the object was there. Weapons and tools only,
    -- because condition and blood are the two properties that record history.
    physicalTrace={requires={"condition","blood"},refuse={"firearm"},wear="poor",
        text="found in a state that does not match where it was found"},
    -- An object the engine itself stamps with a person's name. No prose at
    -- all: the object names someone, and the notebook records only that.
    bearsName={requires={"name"},wear="intact",
        text="carries a name the survivor did not write"},
    -- A key is the one object a player can TEST. It opens a door or it does
    -- not, and either answer is theirs rather than ours.
    testableAccess={requires={"keyed"},wear="intact",
        text="can be tried against a real lock"},
    -- The wrongness is the whole clue: a household or trade object in a room
    -- with no reason for it. Deliberately excludes weapons, whose presence
    -- reads as violence rather than as misplacement.
    -- Quantity as evidence. Owner, 2026-09-09: "one of something is no
    -- misery but a house full of bleach is a mystery."
    --
    -- Nothing about the object carries this - a bottle of bleach is a bottle
    -- of bleach - so the rule selects for the opposite of the other three: an
    -- item with no condition track, whose duplicates are identical, where the
    -- only variable left is how many there are.
    --
    -- The allowed categories are deliberately the LOW-VALUE ones. A cupboard
    -- of bandages or ammunition is not a mystery, it is a windfall, and
    -- evidence must never be better loot than the loot. Weight is capped
    -- because the pile has to fit in one container the player can open.
    accumulation={requires={"countable"},wear="intact",maxWeight=1.5,
        quantity={6,16},
        anyCategory={"Household","Cooking","WaterContainer","Camping","Gardening","Junk"},
        text="ordinary in itself, in a quantity that is not"},
    outOfPlace={requires={"condition"},wear="worn",
        anyCategory={"Tool","Household","Cooking","Gardening","Electronics",
                     "Communications","Container","Security","Junk","Memento"},
        text="belongs somewhere other than where it was found"},
}
local ORDER={"physicalTrace","bearsName","testableAccess","outOfPlace","accumulation"}

-- Individual refusals, where a category is the wrong instrument.
local DENY_ITEM={
    BareHands="not an object; the engine's stand-in for no weapon at all",
}

local function allowed(item,rule)
    if DENY[item.category] then return false end
    if DENY_ITEM[item.id] then return false end
    -- A working firearm is loot however poor its condition. The bloodied
    -- kitchen knife is the point of this rule; the free shotgun is not.
    if rule.refuse then
        for _,property in ipairs(rule.refuse) do
            if Catalogue.has(item,property) then return false end
        end
    end
    return true
end

-- Eligible sets are computed once, in catalogue order, so selection is
-- deterministic across Lua implementations - the same requirement
-- EvidenceRoles.choose and Premises.choose carry, and for the same reason: a
-- case must rebuild identically after a reload or it fails validation.
local eligible={}
for _,ruleId in ipairs(ORDER) do
    local rule=rules[ruleId]
    local list={}
    for _,item in ipairs(Catalogue.items) do
        if allowed(item,rule) then
            local fits=true
            for _,property in ipairs(rule.requires) do
                if not Catalogue.has(item,property) then fits=false end
            end
            if fits and rule.maxWeight then
                fits=type(item.weight)=="number" and item.weight>0 and item.weight<=rule.maxWeight
            end
            if fits and rule.anyCategory then
                local matched=false
                for _,category in ipairs(rule.anyCategory) do
                    if item.category==category then matched=true end
                end
                fits=matched
            end
            if fits then list[#list+1]=item.id end
        end
    end
    assert(#list>0,"object rule "..ruleId.." matches nothing in the catalogue")
    eligible[ruleId]=list
end

function M.list()
    local out={}
    for i,id in ipairs(ORDER) do out[i]=id end
    return out
end

function M.describe(ruleId)
    local rule=rules[ruleId]
    if not rule then return nil,"unknown object rule" end
    return {id=ruleId,wear=rule.wear,text=rule.text,candidates=#eligible[ruleId],
            quantity=rule.quantity}
end

-- Every item a rule can produce, in catalogue order. Callers that want one
-- should use M.choose; this exists so tests can prove a rule reaches a real
-- range of objects rather than the same three every time.
function M.candidates(ruleId)
    local list=eligible[ruleId]
    if not list then return nil,"unknown object rule" end
    local out={}
    for i,id in ipairs(list) do out[i]=id end
    return out
end

-- Deterministic selection, exactly as EvidenceRoles.choose: `random` must be
-- the caller's seeded PRNG, and this makes one draw and no other calls.
function M.choose(random,ruleId)
    local list=eligible[ruleId]
    if not list then return nil,"unknown object rule" end
    if type(random)~="function" then return nil,"random generator required" end
    return Catalogue.get(list[random(#list)])
end

-- How many of the thing there are. One for every rule but accumulation, where
-- the count IS the evidence. Deterministic, one draw, same contract as choose.
function M.quantity(random,ruleId)
    local rule=rules[ruleId]
    if not rule then return nil,"unknown object rule" end
    if type(random)~="function" then return nil,"random generator required" end
    if not rule.quantity then return 1 end
    local low,high=rule.quantity[1],rule.quantity[2]
    return low+random(high-low+1)-1
end

-- Why a category is refused, for anyone who wonders where an item went.
function M.denialReason(category) return DENY[category] end

return M
