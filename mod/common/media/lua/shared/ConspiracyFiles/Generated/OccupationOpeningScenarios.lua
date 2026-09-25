-- WITHDRAWN FROM ROUTING, 2026-09-25 (DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN).
-- Owner: "repetitions break the illusion of a true mystery. Every mystery has
-- to be different by design. No one can be like the other." These twenty-four
-- families are the Fitness shape parameterised per trade - the same five
-- findings in different coats - so no profession routes to them any more.
-- The errands, companies and trade objects below remain as authored material
-- for starts designed one at a time, each with its own shape, count,
-- mechanics and way of ending. Premises registers none of them.
--
-- (Original header follows.)
-- STARTING MYSTERIES FOR EVERY OCCUPATION.
--
-- Owner, 2026-09-25: "expand the starting mysteries for all occupations."
-- The Fitness Instructor had ten authored starts (FitnessOpeningScenarios);
-- every other survivor drew the generic personal opening. This gives each of
-- the other twenty-four Build 42 occupations its own family, built on the
-- same five-finding grammar the Fitness starts proved in play: a thing in
-- the pocket, an ordinary appointment in the survivor's name at the starting
-- address, a farm- or cordon-related object in the wrong room, a spent hoard
-- of more than one person's kit, and a transport scene that waits for a real
-- vehicle. The occupation explains why this survivor could be sent to a
-- house; it never explains immunity, invents a biography, or names the
-- central question (docs/design/OCCUPATION_MYSTERIES_LINUX_PLAN_2026-09-19.md
-- §1: "why was I heading here, carrying this, or expected at this place?").
--
-- Two grammars, one per hidden central pair. A family pins the pair its
-- objects belong to (Generator honours requiresPair): feed sacks and spent
-- masks are a farm story; sandbags, radios and issued protection are a cordon
-- story. Half the occupations sit on each side so a campaign meets both.
--
-- Every variant of a family shares the family's objects and comparisons and
-- changes the ordinary errand that put this survivor at the address - the
-- label, the hour, the service and its reason, and the open question. The
-- question is the thread's row on the device (Threads.handle), so each one
-- reads apart from its siblings inside thirty characters.
--
-- Pure data. Kinds are checked against the object catalogue by
-- test/occupation_openings.lua; every primary object is one an object rule
-- would allow, as the Fitness starts' are.
local M={}

local FARM={
 pair="farm-zero-vs-delivered-agent",
 outcome="The house and a nearby transport trail contain animal material and spent protective equipment, but neither establishes which way the suspicious material travelled.",
 unresolved="Did the infection leave the farm as a sample, or arrive at the farm as a sample?",
 readings={
  "The animal illness came first; the house and vehicle belong to a late attempt to contain it and move samples out.",
  "The transport came first; the appointment and house access helped material move toward a selected farm-connected household.",
 },
 clientLine="Client workplace: local livestock farm",
 vehicle={kind="Cooler",title="Cooler in a nearby vehicle / {CODE}",
  observation="A scuffed cooler was in a real vehicle near the second address.",
  source="The vehicle, position and contents can be inspected. No mark proves its route.",
  note="It could have carried samples away or material toward the farm.",
  wear="scuffed",placementIntent="vehicle",sceneKind="ambiguous-transport",interpretation="dual"},
 threadQuestion="which direction the farm-connected material travelled",
}
local CORDON={
 pair="failed-cordon-vs-drawn-boundary",
 outcome="The house and a nearby vehicle hold cordon material and issued protection, but nothing says whether the line was held from inside or drawn from outside.",
 unresolved="Was the cordon a containment that was overwhelmed, or a line drawn to hold people inside a zone already written off?",
 readings={
  "The cordon was real and failing; what is in this house was gathered by people trying to hold it and getting out what they could.",
  "The boundary was decided before it was drawn; what is in this house was issued to those inside so the line would hold from within.",
 },
 clientLine="Client note: address inside the July checkpoint ring",
 vehicle={kind="Bag_ProtectiveCase",title="Sealed case in a nearby vehicle / {CODE}",
  observation="A sealed protective case was in a real vehicle near the second address.",
  source="The vehicle, its position and the case can be inspected. Nothing says who packed it.",
  note="It could have been carried out through the line, or brought in to hold it.",
  wear="scuffed",placementIntent="vehicle",sceneKind="ambiguous-transport",interpretation="dual"},
 threadQuestion="which side of the line the issued material was meant for",
}

-- The spent hoards. Members are object kinds; the total is what makes one
-- finding of them (Story: two to eight groups, five to twenty-four items).
local PPE_HOARD={kind="Hat_SurgicalMask",title="Spent protective-equipment hoard / {CODE}",
 observation="Used masks, gloves and disinfectant were gathered together in the wrong room.",
 source="Nine spent items form one accumulation, not nine separate clues.",
 note="The household may have improvised containment, or a handling team may have worked here.",
 wear="mixed and spent",roomIntent="wrong",interpretation="dual",
 members={{kind="Hat_SurgicalMask",quantity=3,wear="poor"},{kind="Gloves_Surgical",quantity=4,wear="used"},{kind="Disinfectant",quantity=2,wear="opened"}}}
local DUST_HOARD={kind="Hat_DustMask",title="Spent dust masks and bandages / {CODE}",
 observation="Used dust masks, dirty bandages and empty bleach were gathered in the wrong room.",
 source="Ten spent items form one accumulation, not ten separate clues.",
 note="More than one person was protected here, and whatever they were protected from left them this.",
 wear="mixed and spent",roomIntent="wrong",interpretation="dual",
 members={{kind="Hat_DustMask",quantity=4,wear="poor"},{kind="BandageDirty",quantity=4,wear="used"},{kind="Bleach",quantity=2,wear="empty"}}}
local ISSUE_HOARD={kind="Battery",title="Issued kit, used up / {CODE}",
 observation="Spent batteries, dust masks and cut wire were heaped together in the wrong room.",
 source="Eleven used items form one accumulation, not eleven clues.",
 note="Kit was issued here in numbers, used and left: to hold a line, or to wait behind one.",
 wear="mixed and spent",roomIntent="wrong",interpretation="dual",
 members={{kind="Battery",quantity=5,wear="spent"},{kind="Hat_DustMask",quantity=4,wear="poor"},{kind="BarbedWire",quantity=2,wear="cut"}}}

-- The comparisons every family shares in shape; the words name the family's
-- own objects. `c` is the family's claim noun, `r` its response noun.
local function comparisons(c,r,grammar)
 local farm=grammar==FARM
 return {
  {requires={"claim","appointment"},from="appointment",to="claim",kind="recontextualises",
   text="The appointment makes the visit plausible. The "..c.." makes the access itself a separate question."},
  {requires={"appointment","response"},from="response",to="appointment",kind="recontextualises",
   text=farm and ("The farm-connected appointment and the "..r.." join the house to animal work without proving whether the danger began there.")
            or ("The appointment inside the ring and the "..r.." join the house to the line without proving which side it served.")},
  {requires={"response","review"},from="review",to="response",kind="corroborates",
   text=farm and ("The "..r.." and the spent hoard show that animal material and containment activity occupied the same household.")
            or ("The "..r.." and the used-up kit show that the line and the people issued for it passed through the same household.")},
  {requires={"claim","appointment","response","review"},from="review",to="claim",kind="recontextualises",
   text=farm and ("The "..c.." and appointment explain how I could enter. The "..r.." and the spent protection connect the visit to animal work, but not to a direction of travel.")
            or ("The "..c.." and appointment explain how I could enter. The "..r.." and the used-up kit connect the visit to the cordon, but not to which side of it.")},
  {requires={"response","review","vehicle"},from="vehicle",to="response",kind="recontextualises",
   text=farm and ("The cooler in the vehicle and the "..r.." in the house are both material that moved. Nothing in the scene shows which way.")
            or ("The sealed case in the vehicle and the "..r.." in the house are both material that crossed something. Nothing in the scene shows which way.")},
  {requires={"claim","appointment","response","review","vehicle"},from="vehicle",to="claim",kind="recontextualises",
   text=farm and ("The "..c.." and appointment explain how I could enter. The "..r..", the spent protection and the cooler connect the visit to a transport trail whose direction is still missing.")
            or ("The "..c.." and appointment explain how I could enter. The "..r..", the used-up kit and the sealed case connect the visit to a line whose purpose is still missing.")},
 }
end

-- A key that opens the starting building: the one object the player can
-- TEST (ObjectRules.testableAccess), delivered to the hand before the case
-- attaches (GeneratedRuntime.primeOpening reads `primedKey` off Premises).
local function houseKey(noun,voice)
 return {kind="Key1",noun=noun,
  observation="I have a worn brass house key in my pocket. I do not remember putting it there.",
  source="It is cut for a real building lock, not a label or a decorative prop.",
  note="The door can prove what it opens. Why did I have access to this house?",
  wear="worn",accessIntent="starting-building",interpretation="dual",openingVoice=voice}
end
-- A tool or token of the trade, in the pocket, worn: a physical trace
-- (ObjectRules.physicalTrace) or a thing that bears a name (bearsName).
local function pocket(kind,noun,observation,source,note,voice,wear)
 return {kind=kind,noun=noun,observation=observation,source=source,note=note,
  wear=wear or "poor",interpretation="dual",openingVoice=voice}
end
local function misplaced(kind,title,observation,source,note,wear)
 return {kind=kind,title=title.." / {CODE}",observation=observation,source=source,note=note,
  wear=wear or "poor",roomIntent="wrong",interpretation="dual"}
end

-- id, org, grounding, grammar, claim, response, review, returnItem, variants
M.families={
 burglar={org="U-Store It (Muldraugh)",grounding="UStoreItMuldraugh",grammar=CORDON,
  claim=pocket("KeyPadlock","unit padlock key","A padlock key is in my pocket, a unit number scratched into it. I do not remember taking it.","It is a real cut key with a unit number that is not mine.","A padlock can prove what it opens. Why did I have a key to somebody's unit?","A unit key. Whose unit, and why do I have it?"),
  response=misplaced("EmptySandbag","Empty sandbags in a bedroom","A bundle of empty sandbags was folded in a bedroom cupboard.","They are real bags, unfilled, with checkpoint dust in the seams.","Somebody was going to build a line here, or had just taken one down."),
  review=ISSUE_HOARD,returnItem="the unit key and the collection slip",
  variants={
   {label="Unit clearance",time="07:30",service="a paid clearance of a defaulted storage unit",reason="the manager listed the unit's contents for removal to this address",question="Why was a defaulted unit's contents booked for delivery to this house?"},
   {label="Lock change",time="08:10",service="a lock change on a private storage unit",reason="the renter asked for the old padlock key to be handed over at home",question="Why did I have the old padlock key before the lock was changed?"},
   {label="Late collection",time="08:45",service="an after-hours collection from a storage unit",reason="the renter could not attend during opening hours",question="Why was an after-hours unit collection routed through this address?"},
  }},
 burgerflipper={org="Spiffo's",grounding="SpiffosHiringWestPoint",grammar=FARM,
  claim=pocket("KitchenTongs","serving tongs","A pair of worn serving tongs is in my pocket. I do not remember taking them.","They are real service tongs, scratched and bent, not a toy.","Tongs leave a counter with the shift that used them. Why did mine come to this house?","Tongs from the line. Why are they in my pocket, here?"),
  response=misplaced("AnimalFeedBag","Feed sack in a pantry","A damaged animal-feed sack was stored in a house pantry.","The sack is real farm material; its wear and its place are visible.","It could have come home from sick animals, or concealed something carried toward them."),
  review=PPE_HOARD,returnItem="the tongs and the shift sheet",
  variants={
   {label="Cover shift",time="06:00",service="a covered breakfast shift at a private address",reason="a manager moved a catering shift from the restaurant to a client's home",question="Why was my shift moved from the restaurant to a private house?"},
   {label="Farm delivery",time="07:00",service="a hot-food delivery to a farm crew",reason="a farm ordered crew meals delivered through a worker's home address",question="Why did a farm crew's meal order route through this house?"},
   {label="Staff meal",time="09:30",service="a staff meal for a client's household",reason="a regular customer asked for a home-cooked service as a favour",question="Why was I cooking a staff meal in a stranger's kitchen?"},
  }},
 carpenter={org="Hobbs & Perkins Hardware (Irvington)",grounding="HobbsandPerkinsHardware",grammar=CORDON,
  claim=pocket("CarpentryChisel","bench chisel","A worn bench chisel is in my pocket, its edge dulled on something harder than wood. I do not remember it.","It is a real chisel, not a display piece; the edge carries fresh wear.","A chisel is carried to a job. Which job was this, and why here?","A chisel, blunted. What was I cutting here?"),
  response=misplaced("EmptySandbag","Empty sandbags under a workbench","A bundle of empty sandbags was pushed under a bench in a bedroom.","They are real bags, unfilled, folded by somebody who meant to fill them.","A line was planned here, or dismantled here."),
  review=ISSUE_HOARD,returnItem="the tools and the job sheet",
  variants={
   {label="Extra panel",time="08:00",service="fitting a cupboard with one panel more than the plan",reason="the customer asked for a false back to be added after the order was placed",question="Why did a cupboard job come with a panel the plan did not show?"},
   {label="Board-up",time="07:15",service="boarding a ground-floor window",reason="the household asked for a window boarded before a scheduled inspection",question="Why was a window boarded before anyone inspected it?"},
   {label="Door hang",time="08:40",service="hanging a reinforced interior door",reason="the customer specified a door heavier than any interior use needs",question="Why did an inside door need to be heavier than the front one?"},
  }},
 chef={org="Havisham Suites",grounding="HavishamSuites",grammar=FARM,
  claim=pocket("MeatCleaver","cleaver","A cleaver is in my bag, cleaned badly, its edge nicked. I do not remember packing it.","It is a real kitchen cleaver, not a prop; the nicks are recent.","A cleaver goes where the meat is. Why was it brought to this house?","A cleaver in my bag. What was it here to cut?"),
  response=misplaced("AnimalFeedBag","Feed sack in a dining room","A damaged animal-feed sack was stood in a dining room corner.","The sack is real farm material, and it has no business in a dining room.","Someone brought farm material to the table, or took it from here to the farm."),
  review=PPE_HOARD,returnItem="the knives and the catering order",
  variants={
   {label="Meals for nobody",time="06:30",service="catering for a private meeting",reason="an organiser booked a meal for guests the schedule did not list",question="Why was I catering a meeting nobody was listed as attending?"},
   {label="Farm supper",time="17:00",service="a supper for a livestock farm's hands",reason="the farm asked for the meal served at a worker's house instead of on site",question="Why was a farm supper served here and not at the farm?"},
   {label="Cold room",time="08:20",service="checking a household cold store",reason="the client asked for their private cold room inspected before a delivery",question="Why did a household need its cold room checked by a chef?"},
  }},
 constructionworker={org="Old CGE Corp Building",grounding="OldCGECorpBuilding",grammar=CORDON,
  claim=pocket("MasonsTrowel","site trowel","A mason's trowel is in my pocket, mortar dried on the blade. I do not remember the job.","It is a real trowel, used, with mortar that is not yet old.","A trowel comes off a wall that was just built. Which wall, and where?","A trowel with mortar on it. What did I build?"),
  response=misplaced("EmptySandbag","Empty sandbags in a hallway","A bundle of empty sandbags was stacked in an upstairs hallway.","They are real bags, unfilled, stacked to be carried.","Someone meant to fill these here, or carried them in from a line already down."),
  review=ISSUE_HOARD,returnItem="the site pass and the tools",
  variants={
   {label="Demolish after inspection",time="07:00",service="demolition of an outbuilding",reason="two orders were issued, one to preserve the structure and one to take it down",question="Why did I hold two orders for the same building, one to keep it?"},
   {label="Wall footing",time="08:00",service="pouring a footing for a garden wall",reason="the household ordered a wall taller than the street allows",question="Why was a garden wall footed to a height the street forbids?"},
   {label="Site pass",time="06:45",service="a site-pass check at a private address",reason="the pass listed a house as a works site",question="Why did a works pass name a private house as the site?"},
  }},
 doctor={org="Golden Sunset Nursing Home",grounding="GoldenSunset",grammar=FARM,
  claim=houseKey("house key","This opens the house. Why did a patient's key come to me?"),
  response=misplaced("AnimalFeedBag","Feed sack in a sickroom","A damaged animal-feed sack was kept in a room set up as a sickroom.","The sack is real farm material; the room has a bed, a basin and no animals.","Sick animals were near this bed, or something for them was kept here."),
  review=PPE_HOARD,returnItem="the key and the visit sheet",
  variants={
   {label="Home visit",time="08:00",service="a home visit to a discharged patient",reason="a patient was discharged to a private address before their file was moved",question="Why was I sent to a patient whose file had already been moved?"},
   {label="Transferred file",time="09:00",service="a consultation on a transferred file",reason="the file was administratively moved to a home address",question="Why did a patient file move to a private house instead of a ward?"},
   {label="Farm call",time="07:30",service="a call to a farm worker's household",reason="the household reported illness the farm would not record",question="Why did a farm worker's illness reach me and not the farm's records?"},
  }},
 electrician={org="Circuital Healing",grounding="CircuitalHealing",grammar=CORDON,
  claim=pocket("Screwdriver","service screwdriver","A worn service screwdriver is in my pocket, its tip scorched. I do not remember the call.","It is a real tool, scorched where it met something live.","A scorched tip means a live circuit. Which one, and in whose house?","A scorched screwdriver. What was live here?"),
  response=misplaced("HamRadio1","Ham radio in a bathroom","A ham radio set was installed in a bathroom, wired to nothing.","It is a real set, heavy, with its aerial lead cut short.","Somebody listened from here, or was meant to be heard from here, and stopped."),
  review=ISSUE_HOARD,returnItem="the tools and the service stub",
  variants={
   {label="Unsigned repair",time="08:00",service="a repair on a returned radio component",reason="a service stub was issued for a component nobody signed for",question="Why was I repairing a component nobody had signed for?"},
   {label="Panel check",time="07:20",service="a check on a household distribution panel",reason="the household reported the power cut before the street lost it",question="Why did this house lose power before the rest of the street?"},
   {label="Aerial run",time="09:10",service="running an aerial lead to an upstairs room",reason="the customer asked for a lead run to a room with no set in it",question="Why was I running an aerial to a room with nothing to receive?"},
  }},
 engineer={org="Lectromax Manufacturing",grounding="LectromaxManufacturingJobAd",grammar=CORDON,
  claim=pocket("Pencil","drafting pencil","A drafting pencil is in my pocket, worn to a stub, a revision number scratched on it. I do not remember it.","The number is scratched, not printed.","A revision number on a pencil is a note to oneself. Which drawing was it about?","Revision zero. Which drawing did I keep?"),
  response=misplaced("RadioBlack","Radio in a linen cupboard","A portable radio was hidden in a linen cupboard, tuned off the dial.","It is a real set, working, tuned to nothing that broadcasts.","Somebody waited here for a signal, or hid the set from one."),
  review=ISSUE_HOARD,returnItem="the drawings and the site pass",
  variants={
   {label="Revision zero",time="08:00",service="a site check against a withdrawn drawing",reason="two drawings disagreed about the building's backup supply",question="Why did I carry the withdrawn revision of a site drawing?"},
   {label="Backup supply",time="07:40",service="an inspection of a household backup supply",reason="a private house was listed as having a supply only a depot should have",question="Why did a private house have a backup supply on the depot list?"},
   {label="Load test",time="09:20",service="a load test on a domestic circuit",reason="the circuit was rated for equipment the house did not own",question="Why was a house wired for equipment it did not have?"},
  }},
 farmer={org="Farming & Rural Supply (Doe Valley)",grounding="FarmingAndRuralSupplyDoeValley",grammar=FARM,
  claim=pocket("HandScythe","hand scythe","A hand scythe is in my bag, its blade dark with something that is not sap. I do not remember packing it.","It is a real hand scythe, used, not a display piece.","A scythe cuts what grows. What grew here that needed cutting?","A hand scythe, dark. What did I cut?"),
  response=misplaced("WheatSeedSack","Seed sack in a bedroom","A sack of wheat seed was stored in a bedroom wardrobe.","It is real seed, sealed, in a room with no earth in it.","Seed was kept from the fields, or kept for fields that are not this one's."),
  review=PPE_HOARD,returnItem="the collection slip and the sack",
  variants={
   {label="Recalled delivery",time="07:00",service="collection of a recalled seed delivery",reason="a routine delivery was recalled after it had been signed for",question="Why was a seed delivery recalled after somebody had signed for it?"},
   {label="Lot check",time="08:00",service="a lot-label check on stored supply",reason="the supplier asked for lot numbers read off sacks kept at a house",question="Why were farm supplies stored at a house and not the farm?"},
   {label="Feed swap",time="06:40",service="a feed exchange between two holdings",reason="one holding asked for its feed swapped through an intermediary address",question="Why did two farms swap feed through a stranger's house?"},
  }},
 fireofficer={org="Rosewood Fire Department",grounding="RosewoodFD",grammar=CORDON,
  claim=houseKey("inspection key","This opens the house. Why was an inspection key issued to me?"),
  response=misplaced("EmptySandbag","Empty sandbags in a bathroom","A bundle of empty sandbags was stacked in a bathtub.","They are real bags, unfilled, stacked where water would fill them.","A line was to be built from this house, or carried in from one."),
  review=DUST_HOARD,returnItem="the key and the follow-up card",
  variants={
   {label="Inspection complete",time="08:00",service="a follow-up to a signed-off inspection",reason="the follow-up card named a building whose inspection was already signed",question="Why was I sent to follow up an inspection already signed complete?"},
   {label="Hydrant check",time="07:30",service="a hydrant check on a private lane",reason="the lane was listed as a checkpoint supply point",question="Why was a private lane listed as a checkpoint's water supply?"},
   {label="Access route",time="09:00",service="marking an emergency access route",reason="the route ran through a house rather than around it",question="Why did an emergency route run through somebody's house?"},
  }},
 fisherman={org="Cabin for Rent (West Point)",grounding="BensCabin",grammar=FARM,
  claim=pocket("Gaffhook","gaff hook","A gaff hook is in my bag, its point bent, not by a fish. I do not remember packing it.","It is a real landing gaff, bent by something heavier than a catch.","A gaff lifts what is too heavy to lift by hand. What was lifted here?","A bent gaff. What did I land?"),
  response=misplaced("CompostBag","Compost bag in a bedroom","A sealed compost bag was kept in a bedroom, heavier than compost.","It is a real bag, sealed, and it does not smell of compost.","Something was bagged as compost that was not, and kept indoors."),
  review=PPE_HOARD,returnItem="the tackle and the landing note",
  variants={
   {label="Landing collection",time="05:30",service="a collection at a private landing",reason="a tackle receipt carried a rendezvous note for this address",question="Why did a tackle receipt tell me to meet somebody at this house?"},
   {label="Catch delivery",time="07:00",service="delivery of a catch to a farm household",reason="a farm ordered fresh fish delivered to a worker's home",question="Why did a farm order fish delivered to a worker's house?"},
   {label="Line check",time="06:15",service="a check on lines set from a private dock",reason="the dock owner reported lines set that were not theirs",question="Why were lines set from a dock by somebody who did not own it?"},
  }},
 lumberjack={org="McCoy Logging Co.",grounding="McCoyLoggingCorp",grammar=CORDON,
  claim=pocket("HandAxe","marking axe","A hand axe is in my belt, its edge blunted on something that was not timber. I do not remember the cut.","It is a real hand axe, used, and the edge is freshly turned.","A marking axe blazes trees for a load. Which load, and why here?","A blunted axe. What did I mark here?"),
  response=misplaced("GrassBag","Grass bags in a bedroom","Bags of cut grass were stacked in a bedroom, drying.","They are real bags, full, in a room with carpet.","Fodder was stored here for animals that are not here, or hidden from a count."),
  review=ISSUE_HOARD,returnItem="the timber ticket and the axe",
  variants={
   {label="Marked load",time="06:30",service="collection of a marked timber load",reason="a timber ticket routed the load to a private address",question="Why did a timber ticket route a load to a private house?"},
   {label="Clearance cut",time="07:30",service="clearing trees along a boundary",reason="the boundary was drawn after the trees were marked",question="Why were trees marked for a boundary that was not yet drawn?"},
   {label="Cordwood",time="08:30",service="delivery of split cordwood",reason="the order was for far more wood than a house could burn",question="Why did one house order more cordwood than a winter needs?"},
  }},
 mechanics={org="Al's Auto Shop",grounding="AlsAutoShop",grammar=FARM,
  claim=pocket("CarKey","car key","A car key is in my pocket with a job-card tag on it. I do not remember the car.","It is a real vehicle key, cut, tagged with a job number.","A key fits one car. Which one, and why was it handed to me here?","A car key, tagged. Whose car?"),
  response=misplaced("AnimalFeedBag","Feed sack in a garage bedroom","A damaged animal-feed sack was kept in a bedroom that opens onto the garage.","The sack is real farm material; the room is for sleeping.","Farm material was staged for a vehicle, or unloaded from one."),
  review=PPE_HOARD,returnItem="the key and the job card",
  variants={
   {label="Released without repair",time="08:00",service="a vehicle release with an open fault",reason="the job card released the vehicle to this address before the fault was fixed",question="Why was a vehicle released to this house with its fault still open?"},
   {label="Farm pickup",time="07:00",service="a pickup of a farm vehicle for service",reason="the farm asked for the vehicle collected from a worker's home",question="Why was a farm vehicle kept at a worker's house for collection?"},
   {label="Cold-start",time="06:30",service="a cold-start callout",reason="the household reported a vehicle that would not start after a long trip",question="Why did a vehicle come back to this house from a long trip and die?"},
  }},
 metalworker={org="AMZ Steel",grounding="AMZSteel",grammar=CORDON,
  claim=pocket("MetalworkingChisel","cold chisel","A cold chisel is in my pocket, its edge mushroomed from work I do not remember.","It is a real chisel, used hard and recently.","A cold chisel opens what was welded shut. What was, and where?","A used cold chisel. What did I open?"),
  response=misplaced("EmptySandbag","Empty sandbags in a bedroom","A bundle of empty sandbags was folded under a bed.","They are real bags, unfilled, kept out of sight.","A line was planned from this house, or the remains of one hidden in it."),
  review=ISSUE_HOARD,returnItem="the collection chit and the tools",
  variants={
   {label="Second seam",time="08:00",service="collection of a fabricated steel box",reason="the box was made with one seam more than the drawing showed",question="Why did a fabricated box have a seam the drawing did not?"},
   {label="Gate fitting",time="07:30",service="fitting a steel gate to a private drive",reason="the gate was ordered heavier than any drive needs",question="Why did a private drive need a gate built like a barrier?"},
   {label="Repair chit",time="09:00",service="a repair on a household steel fitting",reason="the chit named a fitting no house has",question="Why did a repair chit name a fitting a house does not have?"},
  }},
 nurse={org="Your Local Shelter (Brandenburg)",grounding="YourLocalShelterBrandenburg",grammar=FARM,
  claim=houseKey("visit key","This opens the house. Why was a patient's key handed to me?"),
  response=misplaced("AnimalFeedBag","Feed sack beside a sickbed","A damaged animal-feed sack was kept beside a bed made up for a patient.","The sack is real farm material; the bed is made for somebody ill.","Whoever lay here was near sick animals, or something for them was kept close."),
  review=PPE_HOARD,returnItem="the key and the rota fragment",
  variants={
   {label="Handover to nobody",time="07:00",service="a shift handover at a home address",reason="a rota fragment named a handover with nobody to receive it",question="Why was a shift handover set at a house with nobody to take it?"},
   {label="Medication custody",time="08:30",service="a medication custody check",reason="the custody sheet listed a private house as a store",question="Why was a private house listed as a medication store?"},
   {label="Discharge visit",time="09:00",service="a visit to a discharged resident",reason="the resident was discharged to an address the shelter did not know",question="Why was a resident discharged to a house the shelter had no record of?"},
  }},
 parkranger={org="Darkwallow Guest House",grounding="DarkwallowGuestHouse",grammar=CORDON,
  claim=pocket("EntrenchingTool","trail tool","A folding entrenching tool is in my pack, its blade caked with clay that is not from any trail I know. I do not remember it.","It is a real tool, used, and the clay is fresh.","A trail tool digs where a path is made or unmade. Which one?","A trail tool, clay on it. What did I dig?"),
  response=misplaced("EmptySandbag","Empty sandbags in a guest room","A bundle of empty sandbags was stacked in a guest room.","They are real bags, unfilled, in a room made up for a guest.","A line was to be built past this house, or the bags brought in when it was abandoned."),
  review=DUST_HOARD,returnItem="the permit and the tool",
  variants={
   {label="Closed trail",time="06:00",service="a permit check on a closed trail",reason="a permit in my belongings authorised a route that was closed",question="Why did I hold a permit for a trail that was closed to everyone?"},
   {label="Cabin check",time="07:30",service="a check on a cabin let to a private party",reason="the let ran past the closure of the area",question="Why was a cabin let after the area around it was closed?"},
   {label="Boundary walk",time="08:00",service="walking a new boundary line",reason="the line on my map ran through a house",question="Why did the boundary on my map run through a house?"},
  }},
 policeofficer={org="Muldraugh Police",grounding="MuldraughPD",grammar=CORDON,
  claim=pocket("Badge","badge","A badge is in my pocket with a number that is not mine on the back. I do not remember taking it.","It is a real badge, issued, and the number is engraved, not scratched.","A badge with somebody else's number. Whose, and why is it on me?","A badge that is not mine. Whose?","intact"),
  response=misplaced("EmptySandbag","Empty sandbags in a bedroom","A bundle of empty sandbags was folded in a bedroom cupboard.","They are real bags, unfilled, with a checkpoint stencil on one.","Checkpoint stores reached this house, or left it."),
  review=ISSUE_HOARD,returnItem="the badge and the incident sheet",
  variants={
   {label="Two numbers",time="07:00",service="a follow-up on a renumbered incident",reason="the incident carried two reference numbers and this address",question="Why did an incident get two numbers and my name on both?"},
   {label="Property check",time="08:00",service="a property check on a private address",reason="the address was on the checkpoint list as a store",question="Why was a private house on the checkpoint's list of stores?"},
   {label="Escort",time="06:30",service="an escort from a private address to the line",reason="the escort sheet named somebody nobody could find",question="Why was I to escort somebody from this house who was not here?"},
  }},
 rancher={org="Brott Cattle Farm Auction",grounding="BrottAuction",grammar=FARM,
  claim=pocket("SheepShears","shears","A pair of sheep shears is in my bag, sprung and stained. I do not remember packing them.","They are real shears, used, and the stain is not lanolin.","Shears are carried to animals. Which animals, and where?","Shears, stained. What did I shear here?"),
  response=misplaced("AnimalFeedBag","Feed sack in a living room","A damaged animal-feed sack was kept behind a living-room sofa.","The sack is real farm material, hidden rather than stored.","Feed was hidden here from a count, or brought in for animals that never came."),
  review=PPE_HOARD,returnItem="the shears and the consignment ticket",
  variants={
   {label="Sold twice",time="07:00",service="a collection against a consignment ticket",reason="the ticket listed the same animals in two sales",question="Why did one consignment ticket sell the same animals twice?"},
   {label="Tag check",time="08:00",service="a tag check on animals kept at a house",reason="the auction listed a private house as a holding",question="Why was a private house listed as a holding at the auction?"},
   {label="Transport",time="06:30",service="arranging transport for a small consignment",reason="the transport was booked from a house with no stock",question="Why was livestock transport booked from a house with no animals?"},
  }},
 repairman={org="Knox Pack Kitchens",grounding="KnoxPackKitchens",grammar=CORDON,
  claim=houseKey("collection key","This opens the house. Why was a customer's key left for me?"),
  response=misplaced("LightBulb","Light bulbs in a bathroom cabinet","Loose light bulbs were kept in a bathroom cabinet, none of them fitting the house.","They are real bulbs, unused, of a type no fitting here takes.","Bulbs were stocked for somewhere else, or brought here from it."),
  review=ISSUE_HOARD,returnItem="the key and the appliance tag",
  variants={
   {label="No fault found",time="08:00",service="collection of a returned appliance",reason="the tag said no fault was found on an appliance returned twice",question="Why was an appliance returned twice with no fault ever found?"},
   {label="Service panel",time="09:00",service="opening a service panel at a customer's request",reason="the customer asked for a panel opened that had been sealed",question="Why had a service panel been sealed before I was sent to open it?"},
   {label="Warranty visit",time="07:30",service="a warranty visit on a new installation",reason="the installation was registered to an address that had not ordered it",question="Why was an installation registered to a house that never ordered it?"},
  }},
 securityguard={org="Leafhill Heights Offices",grounding="LeafhillHeights",grammar=CORDON,
  claim=houseKey("keyholder key","This opens the house. Why was I the keyholder here?"),
  response=misplaced("HamRadio1","Ham radio in a wardrobe","A ham radio set was hidden in a wardrobe, its aerial lead cut.","It is a real set, heavy, disconnected on purpose.","Somebody kept watch from here, or was kept from calling out."),
  review=ISSUE_HOARD,returnItem="the key and the access slip",
  variants={
   {label="Signed out first",time="06:00",service="a keyholder call to a private address",reason="the visitor log showed a sign-out before the sign-in",question="Why did the register show a visitor leaving before they arrived?"},
   {label="Alarm response",time="07:45",service="an alarm response at a residential address",reason="the alarm was registered to the offices but rang at a house",question="Why did an office alarm ring at a private house?"},
   {label="Patrol point",time="08:30",service="adding a house to a patrol route",reason="the route change was signed by nobody",question="Why was a house added to my patrol with no signature?"},
  }},
 smither={org="Coalfield",grounding="Coalfield",grammar=CORDON,
  claim=pocket("SmithingHammer","smithing hammer","A smithing hammer is in my bag, its face marked by a stamp I did not strike. I do not remember packing it.","It is a real hammer, used, and the stamp mark is fresh.","A hammer that struck a stamp. Which stamp, and where?","A hammer with a stamp mark. What did I strike?"),
  response=misplaced("EmptySandbag","Empty sandbags in a kitchen","A bundle of empty sandbags was stacked by a kitchen stove.","They are real bags, unfilled, stacked to be carried out.","A line was to be built from here, or the bags brought back when it was not."),
  review=ISSUE_HOARD,returnItem="the collection order and the hammer",
  variants={
   {label="Duplicate stamp",time="07:00",service="collection of two uniquely stamped fittings",reason="the order asked for a unique stamp in a quantity of two",question="Why did an order ask for a unique stamp on two fittings?"},
   {label="Hinge job",time="08:00",service="forging hinges for a gate",reason="the gate was described as taller than the wall it hung on",question="Why was a gate ordered taller than its own wall?"},
   {label="Bar stock",time="09:00",service="delivery of bar stock to a private address",reason="the stock was more than a hobby forge could use",question="Why did a house take delivery of a workshop's worth of bar stock?"},
  }},
 tailor={org="FashionaBelle",grounding="FashionaBelle",grammar=FARM,
  claim=pocket("Scissors","shears","A pair of tailor's shears is in my bag, one blade nicked and the tips stained. I do not remember packing them.","They are real shears, used; the stain is not dye.","Shears are carried to cloth. Whose cloth, and why here?","Shears, nicked. What did I cut here?"),
  response=misplaced("WheatSack","Wheat sack in a fitting room","A sack of wheat was kept in a room set up for fittings.","It is real grain, sealed, among pins and mirrors.","Grain came home with a customer, or was kept here for the farm."),
  review=PPE_HOARD,returnItem="the shears and the claim ticket",
  variants={
   {label="Lining order",time="09:00",service="a home fitting for a relined garment",reason="the claim ticket showed the lining replaced twice",question="Why was one garment's lining replaced twice on one ticket?"},
   {label="Farm order",time="08:00",service="fitting workwear for a farm household",reason="the order specified protective linings the pattern did not have",question="Why did farm workwear need a lining the pattern never had?"},
   {label="Collection",time="10:00",service="collection of an altered garment",reason="the garment was to be collected from a house, not the shop",question="Why was an altered garment kept at a house and not the shop?"},
  }},
 unemployed={org="Knox Bank (Rosewood)",grounding="KnoxBankJobAdRosewood",grammar=CORDON,
  claim=pocket("Pen","application pen","A bank's promotional pen is in my pocket, chewed, its clip bent. I do not remember taking it.","It carries the bank's name and is used down to nothing.","A counter pen travels with the form it filled in. Which form, and why here?","A bank pen. What did I sign?","worn"),
  response=misplaced("RadioBlack","Radio in a bathroom","A portable radio was kept in a bathroom, its dial taped in place.","It is a real set, working, taped to one frequency.","Somebody here waited on one channel, or was told to keep to it."),
  review=DUST_HOARD,returnItem="the application slip and the pen",
  variants={
   {label="Appointment that moved",time="09:00",service="an interview at a private address",reason="an application slip moved the interview from the branch to a house",question="Why did a bank interview move from the branch to somebody's house?"},
   {label="Reference check",time="10:00",service="a reference check in person",reason="the referee's address was a house nobody at the branch knew",question="Why did my reference live at a house the bank could not place?"},
   {label="Vacancy filled",time="08:30",service="a follow-up on a filled vacancy",reason="the vacancy was filled before applications opened",question="Why was I called about a vacancy filled before it was posted?"},
  }},
 veteran={org="Ready Prep",grounding="ReadyPrep",grammar=CORDON,
  claim=pocket("Necklace_DogTag","dog tag","A dog tag is in my pocket with a number that is not mine. I do not remember taking it.","It is a real tag, stamped, on a chain that has been cut.","A tag names a person. Whose, and why is it on me?","A tag that is not mine. Whose?","intact"),
  response=misplaced("EmptySandbag","Empty sandbags in a bedroom","A bundle of empty sandbags was stacked in a bedroom, stencilled with a store number.","They are real bags, unfilled, and the stencil is a surplus store's.","Surplus stores reached this house, or were issued from it."),
  review=ISSUE_HOARD,returnItem="the tag and the collection reference",
  variants={
   {label="Decommissioned delivery",time="07:00",service="collection of decommissioned equipment",reason="the reference showed retired equipment still being issued",question="Why was decommissioned equipment still being issued to this house?"},
   {label="Surplus transfer",time="08:00",service="a surplus transfer to a private address",reason="the transfer named a house as a receiving depot",question="Why was a private house named as a receiving depot for surplus?"},
   {label="Issue return",time="09:00",service="a return of issued kit",reason="the kit was issued to a name that was not on the roll",question="Why was kit issued to a name that was on no roll?"},
  }},
}

M.ORDER={"burglar","burgerflipper","carpenter","chef","constructionworker","doctor","electrician","engineer",
 "farmer","fireofficer","fisherman","lumberjack","mechanics","metalworker","nurse","parkranger","policeofficer",
 "rancher","repairman","securityguard","smither","tailor","unemployed","veteran"}

local function make(f,v)
 local g=f.grammar
 local claim={}
 for k,x in pairs(f.claim) do claim[k]=x end
 claim.noun=nil
 claim.title=v.label.." "..f.claim.noun.." / {CODE}"
 local response={}
 for k,x in pairs(f.response) do response[k]=x end
 local review={}
 for k,x in pairs(f.review) do review[k]=x end
 local vehicle={key="vehicle",role="records"}
 for k,x in pairs(g.vehicle) do vehicle[k]=x end
 local rnoun=f.response.title:lower():gsub(" / {code}",""):gsub(" in .*$",""):gsub(" beside .*$",""):gsub(" under .*$",""):gsub(" by .*$","")
 return {
  question=v.question,
  centralAxis=g==FARM and "movement" or "access",
  requiresPair=g.pair,
  event="{ORG} recorded "..v.service.." for {SELF} at {A} after "..v.reason..".",
  outcome=g.outcome,
  unresolved=g.unresolved,
  readings={g.readings[1],g.readings[2]},
  leadSource="appointment",
  sourceOrder={"claim","appointment","response","review","vehicle"},
  essential={"claim","appointment","response","review"},
  anchors={claim=claim,response=response,review=review},
  optional={
   {key="appointment",role="records",at="claim",kind="receipt",
    title=v.label.." appointment / {CODE}",
    observation="An appointment card carries my name, this address and an ordinary reason to be here. Who arranged it, the card does not say.",
    source="{ORG} — HOME VISIT\nReference {CODE}\nJuly 8, 1993 / "..v.time.."\nName: {SELF}\nAddress: {A}\nService: "..v.service.."\n"..g.clientLine.."\nIf nobody answers: return "..f.returnItem.." to {B}\nStatus: CONFIRMED\nEntered by {P2}.",
    note="The card explains an ordinary reason to visit. It does not explain what I was carrying, or who set the appointment up.",
    interpretation="dual"},
   vehicle,
  },
  comparisons=comparisons(f.claim.noun,rnoun,g),
  thread={document="review",point="{B}",question=g.threadQuestion},
  organisation=f.org,grounding=f.grounding,
  openingLabel=string.lower(v.label),
 }
end

-- The built scenarios for one occupation, in variant order.
function M.get(profession)
 local f=M.families[profession]
 if not f then return nil end
 local out={}
 for i,v in ipairs(f.variants) do out[i]=make(f,v) end
 return out
end
function M.variants(profession)
 local f=M.families[profession]
 return f and #f.variants or 0
end
-- Whether the family's pocket object is a key to the starting building.
function M.primedKey(profession)
 local f=M.families[profession]
 return f~=nil and f.claim.kind=="Key1" and f.claim.accessIntent=="starting-building"
end
function M.openingVoice(profession)
 local f=M.families[profession]
 return f and f.claim.openingVoice or nil
end
return M
