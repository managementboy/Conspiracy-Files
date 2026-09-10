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
    MaterialWeapon="a crafted-material weapon reads as inventory, not as an event",
    VehicleMaintenance="a spare part is only a story with a vehicle attached, which we do not yet model",
    ProtectiveGear="armour is equipment; it says what someone wore, which the outfit lead already covers",
    Furniture="a moveable is placed in the world, not stacked inside a drawer",
}

-- Categories whose value a budget cannot measure, so a pile of them would be a
-- windfall however small we made it. Weight and calories bound the rest.
local WINDFALL={
    Ammo="a pile of ammunition is a windfall, not a question",
    FirstAid="the same, and worse: medicine is the scarcest thing a survivor owns",
    Bandage="as FirstAid",
    SkillBook="a pile of books is levels, not evidence",
    Bag="containers are capacity, which is the one thing hoarding actually gives",
}

-- What a pile may be worth. A hundred eggs is a mystery in prose and a week of
-- food in practice, so the count is cut to fit the budget rather than the
-- category being banned outright. Both numbers are deliberately modest: the
-- pile has to fit in one container the player can open, and must never be the
-- reason they open it.
local WEIGHT_BUDGET=6.0
local CALORIE_BUDGET=1200.0
-- Below this a count stops being remarkable, so an item the budget would cut
-- this far is not eligible at all rather than being placed in a quantity
-- nobody would look at twice.
local MEANINGFUL_PILE=5

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
    -- The RIGHT place, the wrong amount. Owner's example: a hundred eggs in
    -- the fridge. The object belongs exactly where it was found; only the
    -- count is impossible. Room preference follows the item's own category
    -- (RoomAffinity), so the eggs really are in the kitchen.
    accumulation={requires={"countable"},wear="intact",maxWeight=1.5,
        quantity={6,16},budgeted=true,room="natural",
        denyCategory=WINDFALL,
        text="ordinary in itself, in a quantity that is not"},
    -- Owner, 2026-09-09: "what are 50 mannequin doing in a truck."
    --
    -- Moveables are barred from drawers above - nobody stacks a mannequin in a
    -- cupboard - and a truck bed is precisely the exception. This rule exists
    -- so that ban holds where it is true and stops where it is not: it draws
    -- bulk cargo, prefers a bed or a boot through RoomAffinity, and is the
    -- only rule permitted to reach Furniture at all.
    vehicleBulk={requires={"countable"},wear="intact",maxWeight=3.0,
        quantity={6,16},budgeted=true,room="wrong",
        allowDenied={Furniture=true,Material=true},
        denyCategory=WINDFALL,
        anyCategory={"Furniture","Material","Container","Gardening","Junk",
                     "Camping","Household","Electronics"},
        text="cargo, in a vehicle with no reason to be carrying it"},
    -- Owner, 2026-09-09, mid-build: "let's not forget that any place with
    -- loads of medical equipment and PPA is suspicious."
    --
    -- Correct, and it contradicted the rule above, which banned medicine and
    -- protective gear outright on the grounds that a cupboard of bandages is a
    -- windfall rather than a mystery. Both things are true, and the game
    -- itself resolves them: it ships the SPENT versions - BandageDirty,
    -- Bandage_Chest_Blood - and gives protective gear a condition track, so a
    -- hoard can be exactly the sight the owner means and worth nothing at all
    -- to a survivor. What is stockpiled here has already been used.
    medicalHoard={requires={},wear="poor",maxWeight=2.0,
        quantity={5,14},budgeted=true,room="wrong",spent=true,
        allowDenied={ProtectiveGear=true},
        -- Build 42's ProtectiveGear category holds crafted armour as well as
        -- protective equipment. A pile of bone greaves is a different story
        -- from a pile of respirators, and not the one the owner meant.
        denyWords={"Bone","Chainmail","Cuirass","Greave","Gorget","Codpiece",
                   "Magazine","Scrap","Plates","Spiked"},
        anyCategory={"FirstAid","Bandage","ProtectiveGear"},
        text="used, and there is far too much of it to be one person's"},
    -- The WRONG place, whatever the amount. Owner's example: fifty bricks in
    -- the bedroom. Here the object is unremarkable in its own setting -
    -- bricks on a building site are bricks - and the room is the whole
    -- anomaly, so the rule asks RoomAffinity for a room the item has no
    -- business being in.
    misplacedBulk={requires={"countable"},wear="intact",maxWeight=1.5,
        quantity={4,12},budgeted=true,room="wrong",
        denyCategory=WINDFALL,
        anyCategory={"Material","Gardening","Camping","Junk","Electronics",
                     "Cooking","WaterContainer","Household"},
        text="unremarkable where it belongs, and this is not where it belongs"},
    outOfPlace={requires={"condition"},wear="worn",
        anyCategory={"Tool","Household","Cooking","Gardening","Electronics",
                     "Communications","Container","Security","Junk","Memento"},
        text="belongs somewhere other than where it was found"},
}
local ORDER={"physicalTrace","bearsName","testableAccess","outOfPlace","accumulation","misplacedBulk","medicalHoard","vehicleBulk"}


-- Individual refusals, where a category is the wrong instrument.
local DENY_ITEM={
    BareHands="not an object; the engine's stand-in for no weapon at all",
}

-- A catalogue id becomes the words the survivor writes, so it has to read like
-- something a person would say. "Mushroom_Generic4" and
-- "Bag_ProtectiveCaseSmall_Survivalist" are real items and unusable prose; the
-- same judgement the outfit lead makes about "Generic03" applies here.
--
-- A TRAILING digit is fine and is dropped when the id becomes words: Diary1 is
-- a diary, and refusing it would throw away one of the few objects the engine
-- stamps with a person's name. A digit anywhere else marks an internal variant.
-- "Generic" is refused outright for the same reason the outfit lead refuses
-- Generic03: it is the game telling us this one has no identity.
local function legible(id)
    local last=#id
    while last>0 do
        local ch=string.sub(id,last,last)
        if ch>="0" and ch<="9" then last=last-1 else break end
    end
    for i=1,last do
        local ch=string.sub(id,i,i)
        if ch>="0" and ch<="9" then return false end
    end
    if string.find(id,"Generic",1,true) then return false end
    -- Three of the same letter in a row is a joke item name, not a thing a
    -- survivor writes down: "seven painting aaaaahs" reached the notebook.
    for i=1,#id-2 do
        local c=string.sub(id,i,i)
        if c==string.sub(id,i+1,i+1) and c==string.sub(id,i+2,i+2) then return false end
    end
    id=string.sub(id,1,last)
    local words,inWord=0,false
    for i=1,#id do
        local ch=string.sub(id,i,i)
        local boundary=(ch=="_") or (ch>="A" and ch<="Z")
        if boundary then inWord=false end
        if not inWord and ch~="_" then words=words+1; inWord=true end
    end
    return words<=3
end

-- Already used, and therefore no use to anybody. The game marks its own spent
-- variants; a piece of protective gear counts because the rule places it at
-- the end of its condition track.
local function spent(item)
    if string.find(item.id,"Dirty",1,true) then return true end
    if string.find(item.id,"_Blood",1,true) then return true end
    if string.find(item.id,"Used",1,true) then return true end
    for _,p in ipairs(item.properties) do if p=="condition" then return true end end
    return false
end

local function allowed(item,rule)
    if DENY[item.category] and not (rule.allowDenied and rule.allowDenied[item.category]) then return false end
    if rule.spent and not spent(item) then return false end
    if rule.denyWords then
        for _,word in ipairs(rule.denyWords) do
            if string.find(item.id,word,1,true) then return false end
        end
    end
    if DENY_ITEM[item.id] then return false end
    if rule.denyCategory and rule.denyCategory[item.category] then return false end
    if not legible(item.id) then return false end
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
            -- A budgeted rule must refuse an item whose budget would cut the
            -- pile below the point where a count is remarkable at all. Two
            -- loaves of bread dough is not a mystery, and clamping to two
            -- would have produced exactly that sentence.
            if fits and rule.budgeted then
                local affordable=math.floor(WEIGHT_BUDGET/math.max(item.weight or 0,0.001))
                if type(item.calories)=="number" and item.calories>0 then
                    local byCalories=math.floor(CALORIE_BUDGET/item.calories)
                    if byCalories<affordable then affordable=byCalories end
                end
                fits=affordable>=MEANINGFUL_PILE
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

-- How many of the thing there are. One for everything except the two rules
-- where the count IS the evidence. Deterministic, one draw, same contract as
-- choose - and then cut to the budget, which is not a draw and so cannot
-- disturb the sequence.
--
-- `item` is optional and only matters for a budgeted rule: without it the
-- unbudgeted count is returned, which is what a caller wants when it is asking
-- what the rule COULD produce rather than what this object may.
function M.quantity(random,ruleId,item)
    local rule=rules[ruleId]
    if not rule then return nil,"unknown object rule" end
    if type(random)~="function" then return nil,"random generator required" end
    if not rule.quantity then return 1 end
    local low,high=rule.quantity[1],rule.quantity[2]
    local count=low+random(high-low+1)-1
    if rule.budgeted and type(item)=="table" then
        if type(item.weight)=="number" and item.weight>0 then
            local affordable=math.floor(WEIGHT_BUDGET/item.weight)
            if affordable<count then count=affordable end
        end
        if type(item.calories)=="number" and item.calories>0 then
            local affordable=math.floor(CALORIE_BUDGET/item.calories)
            if affordable<count then count=affordable end
        end
        -- Two of a thing is still more than one of it. Below that the count
        -- stops being evidence, so the rule should not have chosen this item.
        if count<MEANINGFUL_PILE then count=MEANINGFUL_PILE end
    end
    return count
end

-- Which room this rule wants: "natural" for the room the item belongs in,
-- "wrong" for one it does not, nil where the room is not part of the point.
function M.roomIntent(ruleId)
    local rule=rules[ruleId]
    return rule and rule.room
end

M.WEIGHT_BUDGET=WEIGHT_BUDGET
M.CALORIE_BUDGET=CALORIE_BUDGET

return M
