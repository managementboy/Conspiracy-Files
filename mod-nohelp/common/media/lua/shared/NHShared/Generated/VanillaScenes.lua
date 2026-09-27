-- Every vanilla scene kind and where its one No Help clue goes (task 3 plan,
-- step 5). DATA, plus pure accessors; no engine calls.
--
-- Source: DECISIONS.md, DR-20260927-NOHELP-RULE-PLACEMENT, bullets "Vanilla
-- scenes" and "Which vanilla scenes hold clues" (owner, 2026-09-27). The 140
-- kinds are the classes under zombie.randomizedWorld.* in projectzomboid.jar,
-- build 42.20 (read with javap, 2026-09-27); a draft of anchors and fits came
-- from an /adhd run and the owner's final decisions were applied to it:
--   * suicide, self-harm and killer scenes hold clues (draft anchors kept);
--   * party, meal and comedy scenes hold clues just as much as any other: a
--     container in the scene room (building and dead-survivor scenes), the
--     ground near the centre (zone scenes), the vehicle the story builds
--     (RVSPlonkies, RVSRichJerk); fit 1:1;
--   * Kate and Baldspot and Sir Twiggy are left alone entirely;
--   * refused otherwise only where there is nothing to put a clue in:
--     animals with no vehicle, a named zombie alone, the never-built base
--     class, generic house dressing;
--   * a clue never goes on a vanilla named character's body or ID.
--
-- A row: id (the class name), family (RB building, RDS dead survivor, RVS
-- road vehicle, RZS/RZ zone), anchor (room-container | vehicle | body |
-- ground | carried, or "none" when refused), c/a the fit to Containment
-- Cover-up and Agricultural Program Malfunction (neither zero, neither more
-- than twice the other: the scene's clue leans c:a, drawn from the world
-- seed), refused (why, only on a refused row), note (placement only; never
-- story text).
local Pick=require("NHShared/Generated/Pick")
local M={BUILD="42.20",SOURCE="DR-20260927-NOHELP-RULE-PLACEMENT"}

M.ANCHORS={"room-container","vehicle","body","ground","carried"}
-- The engine spot each anchor becomes (Manifest.SPOTS). A carried bag has
-- no target of its own in the engine: vanilla drops the evacuee's bags on
-- the road (RVSDeadEnd: addItemOnGround), so the clue lies on the ground
-- beside them.
M.SPOT_OF={["room-container"]="furniture",vehicle="vehicle",body="corpse",ground="ground",carried="ground"}
M.REFUSALS={["never-built"]=true,dressing=true,["animals-only"]=true,["named-zombie-only"]=true,["owner-leave-alone"]=true}

M.rows={
    {id="RBBar",family="RB",anchor="room-container",c=1,a=1,note="bar back-room container"},
    {id="RBBarn",family="RB",anchor="room-container",c=1,a=2,note="barn container; farm setting"},
    {id="RBBasic",family="RB",anchor="none",refused="dressing",note="generic house dressing, not a scene"},
    {id="RBBurnt",family="RB",anchor="room-container",c=2,a=1,note="surviving container; burnt ones may be gone"},
    {id="RBBurntCorpse",family="RB",anchor="body",c=2,a=1,note="burnt body pockets"},
    {id="RBBurntFireman",family="RB",anchor="body",c=2,a=1,note="firefighter body pockets"},
    {id="RBCafe",family="RB",anchor="room-container",c=1,a=1,note="cafe counter or back-room container"},
    {id="RBClinic",family="RB",anchor="room-container",c=2,a=2,note="clinic desk or cabinet"},
    {id="RBDorm",family="RB",anchor="room-container",c=1,a=1,note="dorm room container"},
    {id="RBGunstoreSiege",family="RB",anchor="room-container",c=2,a=1,note="store back-room container"},
    {id="RBHairSalon",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBHeatBreakAfternoon",family="RB",anchor="vehicle",c=2,a=1,note="SWAT van cab; not robbers' money bags"},
    {id="RBJackieJaye",family="RB",anchor="room-container",c=2,a=2,note="studio container; never her body or press ID"},
    {id="RBJoanHartford",family="RB",anchor="room-container",c=1,a=1,note="room container; never Joan's body"},
    {id="RBJudge",family="RB",anchor="room-container",c=2,a=1,note="office container; never the judge's body"},
    {id="RBKateAndBaldspot",family="RB",anchor="none",refused="owner-leave-alone",note="owner: leave them alone"},
    {id="RBLooted",family="RB",anchor="room-container",c=1,a=1,note="leftover container in looted house"},
    {id="RBMayorWestPoint",family="RB",anchor="room-container",c=2,a=1,note="office container; never the mayor's body"},
    {id="RBNolans",family="RB",anchor="room-container",c=1,a=1,note="dealership office container; never Nolan bodies"},
    {id="RBOffice",family="RB",anchor="room-container",c=2,a=1,note="desk or filing cabinet"},
    {id="RBOther",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBPileOCrepe",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBPizzaWhirled",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBPoliceSiege",family="RB",anchor="room-container",c=2,a=1,note="station desk or locker"},
    {id="RBReverend",family="RB",anchor="room-container",c=1,a=1,note="church office container"},
    {id="RBSafehouse",family="RB",anchor="room-container",c=2,a=1,note="safehouse storage container"},
    {id="RBSchool",family="RB",anchor="room-container",c=2,a=1,note="classroom or office container"},
    {id="RBShopLooted",family="RB",anchor="room-container",c=1,a=1,note="leftover shop container"},
    {id="RBSpiffo",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBStripclub",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBSWATStation",family="RB",anchor="room-container",c=2,a=1,note="locker or desk"},
    {id="RBTableStoryBase",family="RB",anchor="none",refused="never-built",note="abstract base class, never built"},
    {id="RBTrashed",family="RB",anchor="room-container",c=1,a=1,note="surviving container in trashed house"},
    {id="RBTSBreakfast",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBTSButcher",family="RB",anchor="room-container",c=1,a=2,note="kitchen container near butcher table"},
    {id="RBTSDinner",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBTSDrink",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBTSElectronics",family="RB",anchor="room-container",c=2,a=1,note="container near radio workbench"},
    {id="RBTSFoodPreparation",family="RB",anchor="room-container",c=1,a=2,note="kitchen container near prep table"},
    {id="RBTSSandwich",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBTSSewing",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBTSSoup",family="RB",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RBTwiggy",family="RB",anchor="room-container",c=1,a=1,note="bar container; never Twiggy's body"},
    {id="RBWoodcraft",family="RB",anchor="room-container",c=1,a=2,note="workshop container"},
    {id="RDSBanditRaid",family="RDS",anchor="body",c=2,a=1,note="raider or victim body pockets"},
    {id="RDSBandPractice",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSBathroomZed",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSBedroomZed",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSBleach",family="RDS",anchor="body",c=1,a=1,note="sensitive: self-harm"},
    {id="RDSCorpsePsycho",family="RDS",anchor="body",c=1,a=1,note="sensitive: killer's victims"},
    {id="RDSDeadDrunk",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSDevouredByRats",family="RDS",anchor="body",c=1,a=2,note="body pockets; rat outbreak"},
    {id="RDSFootballNight",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSGrouchos",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSGunmanInBathroom",family="RDS",anchor="body",c=1,a=1,note="sensitive: implied self-harm"},
    {id="RDSGunslinger",family="RDS",anchor="body",c=2,a=1,note="armed body pockets"},
    {id="RDSHenDo",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSHockeyPsycho",family="RDS",anchor="body",c=1,a=1,note="sensitive: killer scene"},
    {id="RDSHouseParty",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSPokerNight",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSPoliceAtHouse",family="RDS",anchor="body",c=2,a=1,note="officer body pockets"},
    {id="RDSPrisonEscape",family="RDS",anchor="body",c=2,a=1,note="escapee body pockets"},
    {id="RDSPrisonEscapeWithPolice",family="RDS",anchor="body",c=2,a=1,note="officer or escapee pockets"},
    {id="RDSRatInfested",family="RDS",anchor="room-container",c=1,a=2,note="kitchen or bedroom container"},
    {id="RDSRatKing",family="RDS",anchor="room-container",c=1,a=2,note="room container"},
    {id="RDSRatWar",family="RDS",anchor="room-container",c=1,a=2,note="kitchen or bedroom container"},
    {id="RDSResourceGarage",family="RDS",anchor="room-container",c=1,a=2,note="garage stockpile container"},
    {id="RDSRPGNight",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSSkeletonPsycho",family="RDS",anchor="body",c=1,a=1,note="sensitive: killer scene"},
    {id="RDSSpecificProfession",family="RDS",anchor="body",c=1,a=1,note="professional's body pockets"},
    {id="RDSStagDo",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSStudentNight",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSSuicidePact",family="RDS",anchor="body",c=1,a=1,note="sensitive: suicide"},
    {id="RDSTinFoilHat",family="RDS",anchor="room-container",c=2,a=2,note="room container; builds zombies, not bodies"},
    {id="RDSZombieLockedBathroom",family="RDS",anchor="room-container",c=1,a=1,note="a container in the scene room"},
    {id="RDSZombiesEating",family="RDS",anchor="body",c=1,a=1,note="victim body pockets"},
    {id="RVSAmbulanceCrash",family="RVS",anchor="vehicle",c=2,a=1,note="ambulance cab or rear"},
    {id="RVSAnimalOnRoad",family="RVS",anchor="none",refused="animals-only",note="animals only, no vehicle"},
    {id="RVSAnimalTrailerOnRoad",family="RVS",anchor="vehicle",c=1,a=2,note="truck cab or trailer cargo"},
    {id="RVSBanditRoad",family="RVS",anchor="vehicle",c=2,a=1,note="vehicle glovebox or trunk"},
    {id="RVSBurntCar",family="RVS",anchor="ground",c=1,a=1,note="burnt car lacks containers; ground beside"},
    {id="RVSCarCrash",family="RVS",anchor="vehicle",c=1,a=1,note="glovebox or trunk"},
    {id="RVSCarCrashCorpse",family="RVS",anchor="vehicle",c=1,a=1,note="glovebox or trunk"},
    {id="RVSCarCrashDeer",family="RVS",anchor="vehicle",c=1,a=2,note="glovebox or trunk"},
    {id="RVSChangingTire",family="RVS",anchor="vehicle",c=1,a=1,note="glovebox or trunk"},
    {id="RVSConstructionSite",family="RVS",anchor="vehicle",c=1,a=1,note="work vehicle cab"},
    {id="RVSCrashHorde",family="RVS",anchor="vehicle",c=2,a=1,note="glovebox or trunk"},
    {id="RVSDeadEnd",family="RVS",anchor="carried",c=2,a=1,note="evacuee's grabbed bag"},
    {id="RVSFlippedCrash",family="RVS",anchor="vehicle",c=1,a=1,note="glovebox or trunk"},
    {id="RVSHerdOnRoad",family="RVS",anchor="none",refused="animals-only",note="animals only, no vehicle"},
    {id="RVSPlonkies",family="RVS",anchor="vehicle",c=1,a=1,note="the mascot step van: glovebox or trunk"},
    {id="RVSPoliceBlockade",family="RVS",anchor="vehicle",c=2,a=1,note="police car trunk"},
    {id="RVSPoliceBlockadeShooting",family="RVS",anchor="vehicle",c=2,a=1,note="police car trunk"},
    {id="RVSRegionalProfessionVehicle",family="RVS",anchor="vehicle",c=1,a=2,note="work vehicle cab or cargo"},
    {id="RVSRichJerk",family="RVS",anchor="vehicle",c=1,a=1,note="the luxury car: glovebox or trunk"},
    {id="RVSRoadKill",family="RVS",anchor="vehicle",c=1,a=2,note="vehicle that hit livestock"},
    {id="RVSRoadKillSmall",family="RVS",anchor="none",refused="animals-only",note="small animal corpse only, no vehicle"},
    {id="RVSTrailerCrash",family="RVS",anchor="vehicle",c=1,a=2,note="trailer cargo"},
    {id="RVSUtilityVehicle",family="RVS",anchor="vehicle",c=2,a=1,note="utility vehicle cab"},
    {id="RZJackieJaye",family="RZ",anchor="none",refused="named-zombie-only",note="only her named zombie; nothing else"},
    {id="RZSAttachedAnimal",family="RZS",anchor="none",refused="animals-only",note="animal only, no truck"},
    {id="RZSBaseball",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSBBQParty",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSBeachParty",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSBurntWreck",family="RZS",anchor="ground",c=1,a=1,note="ground beside burnt wreck"},
    {id="RZSBuryingCamp",family="RZS",anchor="ground",c=2,a=1,note="ground near graves or shovel"},
    {id="RZSCampsite",family="RZS",anchor="ground",c=1,a=1,note="tent or ground near centre"},
    {id="RZSCharcoalBurner",family="RZS",anchor="ground",c=1,a=2,note="ground near kiln"},
    {id="RZSDean",family="RZS",anchor="ground",c=1,a=1,note="ground near porch; never Dean's body"},
    {id="RZSDuke",family="RZS",anchor="none",refused="named-zombie-only",note="only named zombie"},
    {id="RZSEscapedAnimal",family="RZS",anchor="none",refused="animals-only",note="animal only, no truck"},
    {id="RZSEscapedHerd",family="RZS",anchor="none",refused="animals-only",note="animals only, no truck"},
    {id="RZSFishingTrip",family="RZS",anchor="ground",c=1,a=1,note="ground near centre"},
    {id="RZSForestCamp",family="RZS",anchor="ground",c=1,a=1,note="tent or ground near centre"},
    {id="RZSForestCampEaten",family="RZS",anchor="ground",c=1,a=1,note="tent or ground near centre"},
    {id="RZSFrankHemingway",family="RZS",anchor="none",refused="named-zombie-only",note="only named zombie"},
    {id="RZSHermitCamp",family="RZS",anchor="ground",c=1,a=2,note="ground near centre"},
    {id="RZSHillbillyHoedown",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSHogWild",family="RZS",anchor="none",refused="animals-only",note="animals only, no truck"},
    {id="RZSHunterCamp",family="RZS",anchor="ground",c=1,a=2,note="tent or ground near centre"},
    {id="RZSKirstyKormick",family="RZS",anchor="none",refused="named-zombie-only",note="only named zombie with press ID"},
    {id="RZSMurderScene",family="RZS",anchor="body",c=2,a=1,note="sensitive: murder"},
    {id="RZSMusicFest",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSMusicFestStage",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSNastyMattress",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSOccultActivity",family="RZS",anchor="ground",c=1,a=1,note="sensitive: occult, knives"},
    {id="RZSOldFirepit",family="RZS",anchor="ground",c=1,a=1,note="ground near firepit"},
    {id="RZSOldShelter",family="RZS",anchor="ground",c=1,a=1,note="ground inside shelter"},
    {id="RZSOrphanedFawn",family="RZS",anchor="none",refused="animals-only",note="animal only, no truck"},
    {id="RZSRangerSmith",family="RZS",anchor="ground",c=2,a=1,note="ground near centre; never Smith's body"},
    {id="RZSRockerParty",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSSadCamp",family="RZS",anchor="ground",c=2,a=1,note="tent or ground; car also present"},
    {id="RZSSexyTime",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSSirTwiggy",family="RZS",anchor="none",refused="owner-leave-alone",note="owner: leave them alone"},
    {id="RZSSurvivalistCamp",family="RZS",anchor="ground",c=2,a=1,note="tent or ground near centre"},
    {id="RZSTragicPicnic",family="RZS",anchor="ground",c=1,a=1,note="ground near the scene centre"},
    {id="RZSTrapperCamp",family="RZS",anchor="ground",c=1,a=2,note="tent or ground near centre"},
    {id="RZSVanCamp",family="RZS",anchor="vehicle",c=1,a=1,note="van interior"},
    {id="RZSWasteDump",family="RZS",anchor="ground",c=2,a=2,note="ground among drums; military and industry tiles"},
    {id="RZSWaterPump",family="RZS",anchor="ground",c=1,a=2,note="ground near pump"},
}

-- The outfits vanilla gives its named characters (the string passed to
-- addZombies / addZombiesOnSquare in each class, javap 42.20). A body in one
-- of these never carries a clue; their ID cards are refused by Carriers
-- already (a body holding a named ID).
M.NAMED_OUTFITS={Jackie_Jaye=true,Joan=true,Judge_Matt_Hass=true,Mayor_West_point=true,Nolan=true,
    Rev_Peter_Watts=true,Sir_Twiggy=true,Woodcut=true,Kate=true,Bob=true,Dean=true,Duke=true,
    FrankHemingway=true,KirstyKormick=true}
function M.namedOutfit(outfit) return type(outfit)=="string" and M.NAMED_OUTFITS[outfit]==true end

-- HAND-CHECKED CITATION (task 3 plan, step 5: "start with exactly one").
-- Jackie Jaye's news studio. RBJackieJaye calls setAlwaysDo(true), so every
-- world builds it (javap 42.20). What it leaves (same read): the windows'
-- curtains closed, office clutter (RBBasic.doOfficeStuff), a zombie in the
-- outfit Jackie_Jaye carrying a Base.PressID at death, Microphone, Notepad
-- and Pen dropped together on one free square of room "jackiejayestudio"
-- (RoomDef.getFreeSquare + addItemOnGround), and a sleeping bag
-- (addSleepingBagWestEast). Building 4222330809090050 (AddressBook row
-- 12480,3908 - 12484,3921); the studio's fixed containers, decoded from
-- Generated/FixedContainerIndexData (Muldraugh, KY, 42.20): desks at
-- 12481,3915 / 12481,3918 / 12481,3920 and filing cabinets at 12483,3917 /
-- 12483,3920, all z 0. Owner: lean random per world (fit 2:2), one clue
-- version per conspiracy, in a studio desk or cabinet other than the one
-- vanilla uses; never her body or press ID.
M.CITATIONS={
    {key="cite:RBJackieJaye",kind="RBJackieJaye",buildingId="4222330809090050",room="jackiejayestudio",
        bounds={x1=12481,y1=3915,x2=12484,y2=3921,z=0},
        containers={
            {x=12481,y=3915,z=0,containerType="desk",sprite="location_business_office_generic_01_47"},
            {x=12481,y=3918,z=0,containerType="desk",sprite="location_business_office_generic_01_47"},
            {x=12481,y=3920,z=0,containerType="desk",sprite="location_business_office_generic_01_45"},
            {x=12483,y=3917,z=0,containerType="filingcabinet",sprite="location_business_office_generic_01_25"},
            {x=12483,y=3920,z=0,containerType="filingcabinet",sprite="location_business_office_generic_01_25"},
        },
        props={"Base.Microphone","Base.Notepad","Base.Pen"},sleepingBag=true,
        named={outfit="Jackie_Jaye",item="Base.PressID"}},
}

local byId={}
for _,r in ipairs(M.rows) do byId[r.id]=r end
local citeByKind={}
for _,c in ipairs(M.CITATIONS) do citeByKind[c.kind]=c end

function M.get(id) return byId[id] end
function M.allowed(id) local r=byId[id]; return r~=nil and r.refused==nil end
-- The engine spot a kind's clue takes, or nil for a refused or unknown kind.
function M.spotFor(id)
    local r=byId[id]
    if not r or r.refused then return nil end
    return M.SPOT_OF[r.anchor]
end
function M.citation(kind) return citeByKind[kind] end

-- Pick.hash of Pick.key hashed once more: Pick.hash alone barely moves with
-- the seed for a small modulus (MarkedArea, step 4 review).
local function mix(parts) return Pick.hash(Pick.key({Pick.hash(Pick.key(parts))})) end
-- The conspiracy one scene's clue leans to in one world: c:a from the row,
-- drawn from the world seed and the scene's area. Nil for a refused kind.
function M.lean(seed,areaId,id)
    local r=byId[id]
    if not r or r.refused then return nil end
    local h=mix({seed,tostring(areaId),id,"scene-lean"})%(r.c+r.a)
    return h<r.c and "containment" or "agricultural"
end

return M
