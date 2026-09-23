-- Ten residential first-case starts for the Fitness Instructor.  The
-- profession explains why an instructor could be sent to a house; it never
-- explains immunity or makes the survivor uniquely important.
--
-- Every variant uses the same first five physical questions while changing
-- the ordinary appointment that put this particular survivor at the address.
-- This gives the first campaign one deeply authored evidence grammar before
-- later professions multiply it.
local definitions={
 {label="Home assessment",time="08:00",service="a private home fitness assessment",
  reason="a new client requested a baseline mobility and conditioning check",
  question="Why did I have a key to the house where my home assessment was booked?"},
 {label="Mobility visit",time="08:15",service="a rehabilitation and mobility house call",
  reason="a regular client reported that travel to the club was no longer possible",
  question="Why was I given unsupervised access for a mobility visit?"},
 {label="Equipment induction",time="08:30",service="a home-equipment induction",
  reason="a client asked to be shown how to use newly delivered exercise equipment",
  question="Why did an equipment lesson require a key to the client's house?"},
 {label="Injury follow-up",time="07:45",service="an injury follow-up session",
  reason="a client asked for a reduced home routine after missing two club sessions",
  question="Why did an injury follow-up bring me inside this house before the client arrived?"},
 {label="Loan collection",time="08:40",service="collection of loaned gym equipment",
  reason="the club wanted resistance bands and a training bench returned from a home loan",
  question="Why was I carrying a house key for a routine equipment collection?"},
 {label="Private boxing",time="07:30",service="a private boxing-conditioning lesson",
  reason="a client requested an early session away from the club",
  question="Why was a private lesson arranged inside this house with a key left for me?"},
 {label="Service preparation",time="08:20",service="physical-test preparation for a public-service applicant",
  reason="a client requested one final home assessment before a scheduled fitness test",
  question="Why did a test-preparation visit give me access to an empty house?"},
 {label="Running rendezvous",time="06:30",service="an early running-group rendezvous",
  reason="a farm employee volunteered the house as the small group's meeting point",
  question="Why did a running rendezvous require me to unlock somebody's house?"},
 {label="Insurance assessment",time="08:50",service="an insurance fitness assessment",
  reason="a client requested a witnessed home assessment for a policy application",
  question="Why was I issued a key for an insurance assessment the client did not attend?"},
 {label="Welfare visit",time="09:00",service="a welfare visit to a regular client",
  reason="a farm worker had stopped attending and could not be reached by telephone",
  question="Who expected me to enter this house for a welfare visit, and why?"},
}

local function make(d)
 local lower=string.lower(d.label)
 return {
  question=d.question,
  event="{ORG} recorded "..d.service.." for {SELF} at {A} after "..d.reason..".",
  outcome="The house and a nearby transport trail contain animal material and spent protective equipment, but neither establishes which way the suspicious material travelled.",
  unresolved="Did the infection leave the farm as a sample, or arrive at the farm as a sample?",
  readings={
   "The animal illness came first; the house and vehicle belong to a late attempt to contain it and move samples out.",
   "The transport came first; the appointment and house access helped material move toward a selected farm-connected household."
  },
  -- The order is the player's investigative order.  Unlike ordinary cases,
  -- these two optional-schema sources are not optional in play.
  sourceOrder={"claim","appointment","response","review","vehicle"},
  -- The transport scene is promoted by reality: while no stable scene exists
  -- it may expire as an ordinary gap; once placed, Session.accounted requires
  -- the player to find it like every other live clue.
  essential={"claim","appointment","response","review"},
  anchors={
   claim={kind="Key1",title=d.label.." house key / {CODE}",
    observation="A worn brass house key was in my pocket at the start.",
    source="It is cut for a real building lock, not a label or a decorative prop.",
    note="The door can prove what it opens. Why did I have access to this house?",
    wear="worn",accessIntent="starting-building",interpretation="dual",
    openingVoice="This opens the house. Why did I have access?"},
   response={kind="AnimalFeedBag",title="Feed sack from the residence / {CODE}",
    observation="A damaged animal-feed sack was stored in a residential room.",
    source="The sack is real farm material; its wear and its location are visible.",
    note="It could have come home from sick animals, or concealed something carried toward them.",
    wear="poor",roomIntent="wrong",interpretation="dual"},
   review={kind="Hat_SurgicalMask",title="Spent protective-equipment hoard / {CODE}",
    observation="Used masks, gloves and disinfectant were gathered together in the wrong room.",
    source="Nine spent items form one accumulation, not nine separate clues.",
    note="The household may have improvised containment, or a handling team may have worked here.",
    wear="mixed and spent",roomIntent="wrong",interpretation="dual",
    members={
     {kind="Hat_SurgicalMask",quantity=3,wear="poor"},
     {kind="Gloves_Surgical",quantity=4,wear="used"},
     {kind="Disinfectant",quantity=2,wear="opened"},
    }},
  },
  optional={
   {key="appointment",role="records",at="claim",kind="receipt",
    title=d.label.." appointment / {CODE}",
    observation="A confirmed appointment card names me, this address and a farm-connected client.",
    source="{ORG} — HOME VISIT\nReference {CODE}\nJuly 8, 1993 / "..d.time.."\nInstructor: {SELF}\nAddress: {A}\nService: "..d.service.."\nClient workplace: local livestock farm\nStatus: CONFIRMED\nEntered by {P2}.",
    note="The card explains an ordinary reason to visit. It does not explain the key or who finally confirmed the arrangement.",
    interpretation="dual"},
   {key="vehicle",role="records",kind="Cooler",title="Cooler in a nearby vehicle / {CODE}",
    observation="A scuffed cooler was in a real vehicle near the second address.",
    source="The vehicle, position and contents can be inspected. No mark proves its route.",
    note="It could have carried samples away or material toward the farm.",
    wear="scuffed",placementIntent="vehicle",sceneKind="ambiguous-transport",interpretation="dual"},
  },
  comparisons={
   {requires={"claim","appointment"},from="appointment",to="claim",kind="recontextualises",
    text="The appointment makes the visit plausible. The working house key makes the access itself a separate question."},
   {requires={"appointment","response"},from="response",to="appointment",kind="recontextualises",
    text="The farm-connected appointment and the feed sack join the house to animal work without proving whether the danger began there."},
   {requires={"response","review"},from="review",to="response",kind="corroborates",
    text="The damaged feed sack and the spent protective hoard show that animal material and containment activity occupied the same household."},
   {requires={"claim","appointment","response","review"},from="review",to="claim",kind="recontextualises",
    text="The key and appointment explain how I could enter. The feed and spent protection connect the visit to animal work, but not to a direction of travel."},
   {requires={"response","review","vehicle"},from="vehicle",to="response",kind="recontextualises",
    text="The vehicle proves that relevant material was being moved. Nothing in the scene proves whether it was inbound or outbound."},
   {requires={"claim","appointment","response","review","vehicle"},from="vehicle",to="claim",kind="recontextualises",
    text="The key and appointment explain how I could enter. The feed, spent protection and cooler connect the visit to a transport trail whose direction is still missing."},
  },
  thread={document="review",point="{B}",question="which direction the farm-connected material travelled"},
  organisation="Sure Fitness & Boxing Club",grounding="SureFitnessBoxingClub",
  openingLabel=lower,
 }
end

local scenarios={}
for index,definition in ipairs(definitions) do scenarios[index]=make(definition) end
return scenarios
