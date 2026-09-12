-- Pure domain: durable association between a corpse's provenance token
-- (LocalPersonIntegration's entry.token / cfObservedSource -- the SAME token
-- PersonNameObservations keys on, never a second scheme) and the outfit
-- name the game already reports for that body via IsoDeadBody:getOutfitName().
-- This is an observation, not an interpretation: a body wears whatever the
-- game decided, and once a token is associated with an outfit, a later
-- disagreeing reading is refused outright, never silently rewritten -- same
-- discipline as PersonNameObservations.observe.
-- Never invents an outfit -- callers only ever pass what getOutfitName()
-- returned. Zero PZ dependencies; the client store lives in
-- ConspiracyFiles/BodyOutfitLog.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=32}
local FACT_FIELDS={token=true,outfit=true}

local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function text(v,n) return type(v)=="string" and #v>0 and #v<=(n or 160) and v:find("%S") and not v:find("[%c]") end

local function copyFact(f)
    local o={}
    for k in pairs(FACT_FIELDS) do o[k]=f[k] end
    return o
end

local function validFact(f)
    if not plain(f) then return false end
    for k in pairs(f) do if not FACT_FIELDS[k] then return false end end
    return text(f.token,160) and text(f.outfit,120)
end

function M.empty() return {schema=M.SCHEMA,outfits={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA or not plain(root.outfits) then return false,"invalid body outfit state" end
    for k in pairs(root) do if k~="schema" and k~="outfits" then return false,"unknown body outfit field" end end
    local n=0
    for k,f in pairs(root.outfits) do
        n=n+1
        if n>M.MAX then return false,"outfit capacity exceeded" end
        if type(k)~="string" or not validFact(f) or f.token~=k then return false,"invalid outfit fact" end
    end
    return V.validateStructure(root)
end

-- Append one token->outfit association. A body already carrying this exact
-- outfit is a no-op. A body reporting a DIFFERENT outfit than previously
-- observed is refused rather than overwritten -- same discipline as
-- PersonNameObservations.observe and ObservedKeyLead.observe. (In practice a
-- corpse's outfit does not change, so a contradiction here would mean two
-- distinct bodies were mistaken for one token -- refuse rather than guess.)
function M.observe(root,token,outfit)
    local ok,why=M.validate(root); if not ok then return nil,false,why end
    local fact={token=token,outfit=outfit}
    if not validFact(fact) then return nil,false,"invalid body outfit observation" end
    local staged=M.empty()
    for k,f in pairs(root.outfits) do staged.outfits[k]=copyFact(f) end
    local existing=staged.outfits[token]
    if existing then
        if existing.outfit~=outfit then return nil,false,"contradictory body outfit" end
        return staged,false
    end
    local n=0; for _ in pairs(staged.outfits) do n=n+1 end
    if n>=M.MAX then return staged,false,"outfit capacity exceeded" end
    staged.outfits[token]=copyFact(fact)
    ok,why=M.validate(staged); if not ok then return nil,false,why end
    return staged,true
end

-- getOutfitName returns the outfit's internal id: "ConstructionWorker",
-- "Bathrobe", "Generic03". The raw id is stored, because it is the game's own
-- fact, but it is not what the notebook can say to a player.
--
-- Two rules, both conservative. An outfit that identifies nobody is not a
-- lead: "Generic03" says only that the game dressed a zombie, so it is
-- suppressed and the sentence is omitted entirely rather than padded with
-- noise. Anything else becomes ordinary words - "ConstructionWorker" reads
-- "construction worker" - because a lead the player cannot read is no better
-- than one they never got.
local UNINFORMATIVE={["generic"]=true,["default"]=true,["naked"]=true,["nude"]=true,["bullet"]=true}
local NOT_CLOTHING={["young"]=true}
function M.readable(name)
    if type(name)~="string" then return nil end
    local trimmed=name:gsub("^%s+",""):gsub("%s+$","")
    if trimmed=="" then return nil end
    -- Debug and test wardrobes are not observations about anybody.
    if trimmed:lower():find("test") then return nil end
    -- Judge the LEADING WORD, not the whole string and not a substring. The
    -- game ships Generic01..Generic05, Generic_Skirt, Naked and NakedVeil, all
    -- of which identify nobody - and Cook_Generic, which identifies a cook.
    -- Stripping trailing digits caught Generic03 and missed Generic_Skirt,
    -- which reached a player on 2026-09-09 as "generic skirt".
    local head=trimmed:match("^%u%l+") or trimmed:match("^%a+") or trimmed
    if UNINFORMATIVE[head:lower()] then return nil end
    -- Whole ids that describe the person, not the clothes. "Young" reached the
    -- notebook as "The body itself wore: young." (Linux wallet check,
    -- 2026-09-11). Exact match only: "YoungCowpoke" still describes an outfit.
    if NOT_CLOTHING[trimmed:lower()] then return nil end
    -- CamelCase and underscores into words, without disturbing an id that is
    -- already one plain word.
    local spaced=trimmed:gsub("_"," "):gsub("(%l)(%u)","%1 %2"):gsub("(%u)(%u%l)","%1 %2")
    spaced=spaced:gsub("%s+"," "):gsub("^%s+",""):gsub("%s+$","")
    if spaced=="" then return nil end
    return spaced:lower()
end

-- WP3. What the survivor actually says about what a body was wearing.
--
-- `readable` above turns an id into words, which was enough for
-- "ConstructionWorker" and not nearly enough for "Goth": the notebook printed
-- "The body itself wore: goth", which is a game id wearing a lower-case hat.
-- Nobody looking at a corpse thinks the word "goth". They think: a lot of
-- black, chains, boots.
--
-- THIS TABLE IS CLOSED, AND THAT IS THE POINT. An id that is not in it
-- produces nothing at all, and the sentence is omitted entirely. The game
-- ships around 250 outfit ids and a future update can add more; none of them
-- may put a word in the survivor's mouth that nobody wrote. Silence about one
-- body costs a lead. An id leaking into prose costs the register the whole
-- notebook is built on, and it has happened three times already - Generic03,
-- Generic_Skirt, Young.
--
-- Adding an entry is therefore a deliberate act of writing, never a mapping.
-- Describe what someone would SEE, and never what it implies about the
-- person: these notes record observations, not conclusions.
local DESCRIBED={
    -- The six the handoff names.
    Goth="a lot of black, chains, boots",
    Classy="dressed for a funeral, or a party",
    Punk="cut-up denim, studs, hair that took effort",
    Redneck="a work shirt, jeans, a cap gone soft with wear",
    Biker="heavy leather, boots, patches on the back",
    Hunter="camouflage and blaze orange, dressed to be seen by the right people only",
    -- Uniforms. The ones most likely to be on a body in Muldraugh, and the
    -- ones a player most wants named.
    Police="a police uniform",
    PoliceRiot="police riot gear, helmet and all",
    Police_SWAT="tactical gear, a SWAT loadout",
    PoliceState="a state trooper's uniform",
    Sheriff_Deputy="a deputy's uniform",
    PrisonGuard="a prison officer's uniform",
    Security="a security guard's uniform",
    MallSecurity="a mall security uniform",
    AirportSecurityTarmac="airport security clothing, high-visibility",
    Fireman="firefighter's turnout gear",
    FiremanFullSuit="a full firefighter's suit, breathing apparatus and all",
    AmbulanceDriver="an ambulance crew uniform",
    Doctor="hospital scrubs and a white coat",
    Nurse="nurse's scrubs",
    Pharmacist="a pharmacist's coat",
    HospitalPatient="a hospital gown",
    HospitalPatientBathrobe="a hospital gown under a bathrobe",
    ArmyServiceUniform="an army service uniform",
    ArmyCamoGreen="green army camouflage",
    ArmyCamoDesert="desert army camouflage",
    ArmyInstructor="army fatigues, an instructor's",
    Veteran="old service clothing, kept",
    PrivateMilitia="mismatched military surplus, nothing issued together",
    Ranger="a park ranger's uniform",
    Postal="a postal worker's uniform",
    Sanitation="a sanitation worker's overalls",
    -- Trades and work.
    ConstructionWorker="work clothes, a hard hat, high-visibility",
    Foreman="work clothes and a foreman's hard hat",
    MetalWorker="a welder's clothing, scorched",
    Mechanic="mechanic's overalls, worked into black",
    Trucker="a trucker's clothes, comfortable for sitting",
    Farmer="farm clothes, boots caked hard",
    Woodcut="logging clothes, heavy plaid",
    Fisherman="fishing clothes and waders",
    Chef="chef's whites and checked trousers",
    Cook_Generic="a cook's uniform",
    Waiter_Classy="waiting staff blacks from somewhere expensive",
    Waiter_Diner="a diner uniform",
    OfficeWorker="office clothes, a shirt and slacks",
    OfficeWorkerSkirt="office clothes, a blouse and skirt",
    Teacher="teaching clothes, neat and unfussy",
    Student="student clothes, whatever was nearest",
    HonorStudent="school clothes, pressed",
    Varsity="a letterman jacket and school colours",
    IT="a company polo shirt and lanyard",
    Detective="a detective's suit, worn daily",
    Judge_Matt_Hass="courtroom clothes",
    Priest="clerical black and a collar",
    Mayor_West_point="a politician's suit",
    Jockey01="racing silks",
    Golfer="golf clothes, colours that clash on purpose",
    Bowling="a bowling shirt with a name on it",
    -- Ordinary people, dressed for something.
    Bathrobe="a bathrobe, as if they never got dressed",
    Bedroom="nightclothes",
    Swimmer="swimwear",
    Ski="ski clothing, out of season",
    Camper="camping clothes, dressed for weather",
    Backpacker="hiking clothes and a pack's wear marks",
    Cyclist="cycling gear, tight and bright",
    FitnessInstructor="gym clothes, worn for work rather than exercise",
    ShellSuit_Black="a shell suit",
    Tourist="holiday clothes, badly suited to here",
    Retiree="comfortable clothes, chosen for warmth",
    Party="party clothes, the night still on them",
    ClubGoer="clothes for a night out",
    Gaudy="clothes chosen to be looked at",
    Jewelry="good clothes and too much jewellery",
    WeddingDress="a wedding dress",
    Groom="a groom's suit",
    Santa="a Santa suit",
    Stripper="stage clothes",
    Rocker="band shirt, denim, long hair",
    Grunge="flannel and boots, deliberately unkempt",
    GuitarGuy="a musician's clothes and calloused hands",
    Hobbo="layered clothes, all of them worn through",
    Evacuee="whatever they left the house in",
    Survivalist="survival gear, assembled rather than bought",
    Ghillie="a ghillie suit",
    TinFoilHat="ordinary clothes and a hat made of foil",
    Inmate="prison orange",
    InmateEscaped="prison orange, torn and part-changed",
    InmateKhaki="prison khaki",
    Thug="street clothes and a concealed way of carrying",
    Mob="an expensive suit worn like armour",
    HazardSuit="a sealed hazard suit",
    ExterminatorSuited="an exterminator's protective suit",
    Spiffo="a Spiffo the Raccoon costume",
    Scarecrow="scarecrow clothing, straw still in the seams",
}

-- The written line for an outfit id, or nil. Fail closed: an id that is not
-- described says nothing, and the caller omits the sentence.
function M.describe(name)
    if type(name)~="string" then return nil end
    local trimmed=name:gsub("^%s+",""):gsub("%s+$","")
    return DESCRIBED[trimmed]
end

-- Every id that has been written for. Exposed so a test can sweep the whole
-- table for prose faults rather than spot-checking a handful, and so the
-- table's size can be asserted without freezing its exact contents.
function M.describedIds()
    local out={}; for id in pairs(DESCRIBED) do out[#out+1]=id end; table.sort(out); return out
end
function M.describedCount() return #M.describedIds() end

function M.outfitFor(root,token)
    local ok=M.validate(root); if not ok then return nil end
    if type(token)~="string" then return nil end
    local f=root.outfits[token]
    return f and f.outfit or nil
end

return M
