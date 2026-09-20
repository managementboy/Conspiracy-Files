-- Immutable authored families, selected once by the trail's persisted seed.
-- No live clock, runtime RNG, definitive explanation or completion narrative.
local M={REVISION=1}
local families={
 {id="fuel",skill="mechanic",question="Fuel for departures or stationary equipment?",
  titles={"Fuel allocation carbon","Driver's expense slip","Drum return docket","Pump tally"},
  text={
   "Dispatch {code}, {day} July: {place}. {amount} gallons issued for passenger runs. Signed {name}. Circulation copy for garages and dispatch desks.",
   "{place}, {day} July. Driver {name} claims two hours waiting with an empty tank. Mileage box: a dash. Garage copy.",
   "Collect empty drums from {place}. Do not exchange against the passenger account without a signature. Counterfoil {code}; collection box unsigned.",
   "Pump account {code}, {day} July. Passenger allocation: zero gallons issued. {amount} gallons charged to stationary equipment at {place}. {other}."},
  readings={"Someone recorded fuel for passenger runs. A carbon could be marked before a vehicle arrives.","Waiting for fuel, or waiting for someone? An expense claim could cover either.","Empty drums might mean fuel was used somewhere. They do not identify a vehicle or a passenger.","The pump tally puts the same allocation into equipment. The account may have changed, or one record may be wrong."},
  observation="Engine hours and road mileage are different measures. The empty mileage box prevents those two hours becoming evidence of a journey."},
 {id="water",skill="plumber",question="Who could still draw clean water?",
  titles={"Water service notice","Sample label copy","Delivery complaint","Valve round sheet"},
  text={
   "Service {code}: {place}. Main isolated at 18:00 on {day} July. No draw-offs permitted. Copies for occupants and maintenance desks. {name}.",
   "Sample, {place}, {day} July. Marked CLEAR by {name}. Laboratory receipt box empty. Delivery label retained at office.",
   "{place}: requested {amount} sealed containers. Driver reports recipients brought their own bottles. Invoice {code}, quantity accepted blank.",
   "{place}, service {code}. 19:00, {day} July: main open, normal draw-off witnessed. {other}. No reopening entry precedes it."},
  readings={"If the notice was followed, people here needed another water supply. A notice is not a valve.","Clear to look at, or cleared for drinking? The label doesn't identify the judgement.","Was water available but containers scarce? The account never records what changed hands.","Open at nineteen and isolated at eighteen could fit a repair. No reopening is recorded."},
  observation="A valve position does not establish water quality. The maintenance round and the sample label answer different questions."},
 {id="telephone",skill="electrician",question="Did calls leave Knox or reach another desk?",
  titles={"Telephone fault ticket","Operator's call slip","Message office carbon","Switchboard register"},
  text={
   "Circuit {code}, {place}: disconnected at 09:00 on {day} July. No outside service. Copies to subscriber and exchange. {name}.",
   "Call from {place}: 'Please tell them we are still here.' {day} July, time blank. Operator initials overwritten. Message office copy.",
   "For {place}: repeat the message at the next desk if no answer. Do not treat a ringing line as acceptance. Routing slip {code}.",
   "Circuit {code}, {place}: outside call connected at 10:00 on {day} July, four minutes. {other}. Line listed as disconnected since 09:00."},
  readings={"The fault ticket says there was no outside line. A repair or a clerical error could leave another story.","Somebody wanted their presence known. There is no addressee or reply.","A message could pass through several people and never leave Knox.","The circuit is logged as disconnected and carrying a call. Was a different line used, or an attempt recorded as a connection?"},
  observation="A connection entry records switching, not who spoke at the far end. The four minutes could include ringing."},
 {id="beds",skill="medical",question="Were places available to people arriving?",
  titles={"Bed reservation carbon","Laundry dispatch slip","Visitor's request","Night occupancy sheet"},
  text={
   "{place}, account {code}, {day} July. {amount} beds reserved and held vacant all day for arrivals. Referral desk copy. {name}.",
   "Send linen to {place}, bundle {code}. Charge as occupied beds even if held in readiness. Laundry counterfoil, {day} July.",
   "Can you put {name} on the list at {place}? We were told a list was enough. No reply attached. Referral office copy.",
   "{place}, {day} July, midnight. Account {code}: all reserved beds occupied since noon; no further places. {other}."},
  readings={"A reservation might be a promise made before anyone checked the rooms.","A linen charge could count preparations as patients. It cannot give me a head count.","There was a list, or someone believed there was. Did anyone on it get admitted?","The night sheet says the reserved beds were occupied. It doesn't identify the occupants."},
  observation="An occupied-bed total can be an accounting category. Admission times and names would be needed to establish an arrival."},
 {id="radio",skill="electrician",question="Radio failure or a change of channel?",
  titles={"Radio service carbon","Reception note","Battery requisition","Transmitter log"},
  text={
   "Set {code}, {place}: transmitter removed from service for all of {day} July. Copies to stores and service desks. {name}.",
   "Heard the same three words twice from the direction of {place}. Frequency was on the envelope; envelope missing. Listener's note, {day} July.",
   "Hold {amount} batteries for {place}. Collection by bearer of {code}; no caller named. Stores carbon.",
   "Set {code}, {place}: test transmission at 14:20 on {day} July, acknowledged at 14:22. {other}."},
  readings={"Out of service might mean awaiting repair or deliberately kept off the air.","A repeated message could be a recording, a relay, or someone trying again. The frequency is missing.","Batteries were reserved for something expected to work. Were they collected?","The same set is logged as silent all day and transmitting that afternoon. The acknowledgement names no listener."},
  observation="An acknowledgement only establishes a return path if that path is identified. This sheet leaves it out."},
 {id="bus",skill="mechanic",question="Passengers carried away or vehicles repositioned?",
  titles={"Passenger run carbon","Seat cover invoice","Driver's pocket note","Depot movement book"},
  text={
   "Run {code}: {place}, {day} July. Departure COMPLETE, {amount} passengers carried. Dispatch and service counter copy. {name}.",
   "Replace seat covers before sending vehicle to {place}. Bill as passenger service, {code}. Workshop copy; vehicle number illegible.",
   "If they ask at {place}, say the bus has been sent. I was not told who would drive it. Unsigned note retained at dispatch.",
   "Run {code}, {day} July: vehicle returned from {place} empty. No passengers carried on either leg. Depot ledger, {other}."},
  readings={"COMPLETE might have been stamped against a plan. Someone nevertheless wrote a precise passenger count.","A vehicle prepared for passengers could still leave empty.","'Sent' might mean an instruction or a bus already moving. The writer avoids saying which.","The depot explicitly records an empty run. That disagrees with the carbon if they describe the same vehicle."},
  observation="A run reference can survive a vehicle substitution. The illegible vehicle number prevents the invoice identifying which bus travelled."},
 {id="mail",skill="police",question="Could messages leave when their senders could not?",
  titles={"Mail collection receipt","Redirect card","Returned envelope note","Collection ledger"},
  text={
   "Bag {code}, {place}: collected at 16:00 on {day} July, seal intact. Local counter copy. {name}.",
   "Redirect correspondence for {place}. New point: 'same as last time'. Card lacks earlier instruction. Counter copy.",
   "{other}: your letter for {place} returned without a postmark. Shall I try another counter? Note kept with undelivered mail.",
   "Bag {code}, {place}, {day} July: retained overnight, never released to collection. Seal intact at closing. {other}."},
  readings={"Someone signed for a sealed bag. What was inside, and where did it go?","The instruction assumes knowledge the surviving card doesn't contain.","No postmark could mean the letter never entered the system. It might also have travelled by hand.","The closing record keeps the bag here after its collection receipt was signed. Perhaps the bag number was duplicated."},
  observation="'Seal intact' appears without a seal number. It doesn't establish that the two writers examined the same bag."},
 {id="keys",skill="police",question="Who could get through locked doors?",
  titles={"Key issue carbon","Locksmith's estimate","Messenger's instruction","Key cabinet register"},
  text={
   "Key {code}, {place}: issued to {name} on {day} July. One original, no spare held. Security office copy.",
   "Replacement cylinder at {place}. Price excludes keys. Customer requested return of old cylinder. Locksmith's estimate; acceptance blank.",
   "Leave message inside {place}. If nobody answers, ask the bearer for access. No bearer named. Outgoing work copy.",
   "Key {code}, {place}: original present at evening count, {day} July. No issue during shift. Cabinet checked by {other}."},
  readings={"An issue record suggests access, but a signature is easier to move than a key.","A lock change could protect supplies, exclude someone, or replace a failed lock. This is only an estimate.","The instruction assumes someone can open the door. It doesn't name them.","The cabinet record says the original never left. The issue sheet, label or count could be wrong."},
  observation="This key number is an inventory label, not a verified lock match. Access requires the actual key and door."},
 {id="food",skill="medical",question="Supplies delivered or waiting behind a signed form?",
  titles={"Ration delivery carbon","Spoilage claim","Kitchen request","Goods-in sheet"},
  text={
   "Delivery {code}: {amount} cases accepted at {place}, {day} July. Receipt signed {name}. Copies to dispatch and stores.",
   "Spoiled goods awaiting collection from {place}. Refrigeration failure time not supplied. Supplier's claim copy, {code}.",
   "To anyone serving meals at {place}: stop counting portions until we know how many are coming. Kitchen office carbon; no reply.",
   "{place}, goods-in {code}, {day} July: shipment refused unopened. Zero cases accepted. {other}."},
  readings={"The delivery copy names a recipient. It doesn't say who ate the food.","The claim needs a time nobody supplied. Food could exist and still be unusable.","Someone expected people and couldn't count them. That could precede arrival or cancellation.","The local sheet refuses the consignment the delivery carbon says was accepted. Neither accounts for where it ended up."},
  observation="Without storage temperature and duration, a spoilage claim cannot establish when food became unsafe."},
 {id="power",skill="electrician",question="Which places stayed lit?",
  titles={"Power isolation carbon","Generator hire slip","Call-out message","Meter inspection sheet"},
  text={
   "Supply {code}, {place}: isolated for all of {day} July. No temporary feed authorised. Maintenance copy. {name}.",
   "Generator reserved for {place}. Hire starts on collection, not reservation. Delivery address crossed out. Customer copy {code}.",
   "{place} called again about lights visible after the cut. Caller could not identify the room. Maintenance message, {day} July.",
   "Supply {code}, {place}, {day} July: mains current measured at 21:00. Temporary feed: none. Inspector {other}."},
  readings={"An isolation order says what should happen, not what a wire carries.","Another supply may have been planned. Collection isn't recorded.","Visible light isn't a test of the mains. A lamp or battery could explain it.","The inspector records mains current during an all-day isolation. A wrong circuit label could matter as much as a wrong signature."},
  observation="The inspection omits meter serial and range. 'Current measured' cannot establish how much power was available."},
 {id="names",skill="police",question="Did someone leave, or did a list change?",
  titles={"Attendance carbon","Replacement badge request","Name correction slip","Reception ledger"},
  text={
   "{place}, list {code}, {day} July: {name} present at 08:00. Payroll circulation copy.",
   "Replacement badge for {name}, {place}. Recover old badge on issue. Recovery box empty. Personnel office copy.",
   "Correct surname on correspondence for {place}. Keep reference {code}. Old and new spellings both blacked out. Office copy.",
   "{place}, list {code}, {day} July: {name} absent all shift, no admission. Reception clerk {other}."},
  readings={"Payroll counted a presence. Someone could have signed ahead, or someone could have been there.","A spare badge might let someone in. It might also be an uncollected replacement.","The reference stayed while the name changed. Neither spelling can be recovered from this copy.","Reception excludes the person payroll places here. The desks might have been counting different things."},
  observation="Attendance and admission are different records. Neither identifies who physically used a badge."},
 {id="road",skill="police",question="Were routes closed to everyone?",
  titles={"Closure order carbon","Pass application","Haulier's complaint","Barrier log"},
  text={
   "Approach to {place}, order {code}: no vehicles after 20:00 on {day} July, without exception. Local office copy. {name}.",
   "Passage application for {place}. Purpose: 'return'. Approval box marked without a name. Applicant copy {code}.",
   "Waiting fee outside {place}. Driver says other traffic passed; no registrations supplied. Haulier's retained complaint.",
   "Barrier {code}, {place}, {day} July: vehicle admitted at 21:15, 'authorised service'. Guard {other}."},
  readings={"A later instruction might have changed this blanket closure without reaching the copy.","'Return' suggests an earlier journey, or a reason someone hoped would work.","The driver may have seen an exception or may be arguing for payment.","A service vehicle passed after an order promising no exceptions. Who counted as a service?"},
  observation="'Authorised' is the guard's description. No pass number connects it to the application."},
 {id="medicine",skill="medical",question="Medical supplies delivered or recalled?",
  titles={"Medical dispatch carbon","Cold-box return form","Prescriber message","Medicine receiving book"},
  text={
   "Consignment {code}: {amount} sealed packs issued to {place}, {day} July. Distribution office copy, {name}.",
   "Return cold box from {place}. Keep contents inside if collection delayed. Supplier copy; product field unreadable.",
   "For {place}: do not repeat previous quantity until patient list checked. Prescriber's message retained by stores; list absent.",
   "{place}, consignment {code}, {day} July: held by supplier, nothing received. {other}."},
  readings={"Issued might mean sent or removed from a stock balance. Arrival isn't recorded.","The box could contain unused supplies or packaging. It doesn't identify a medicine.","The quantity depended on people counted elsewhere. Did that count increase or fall?","The receiving book says nothing arrived. Its author might have been working from a different run."},
  observation="Cold-box instructions don't identify contents. No treatment, infection or diagnosis follows from this packaging."},
 {id="repairs",skill="mechanic",question="Were usable vehicles kept off the road?",
  titles={"Workshop release carbon","Parts reservation","Recovery driver's note","Repair bay sheet"},
  text={
   "Job {code}, vehicle for {place}: roadworthy, released 12:00 on {day} July. Workshop office copy, {name}.",
   "Brake parts held for {place}. Do not fit without old parts for comparison. Supplier carbon {code}.",
   "Recovery from {place}: driver asked us to wait out of sight of entrance. No reason recorded. Recovery office duplicate.",
   "Job {code}, {day} July, 12:00: vehicle in bay, brakes dismantled. Release prohibited. Bay record, {other}."},
  readings={"A released job isn't necessarily a vehicle driven away. Someone might have closed the account early.","A parts comparison could mean a fitting problem, return or unfinished repair.","The request sounds odd, but an entrance can need keeping clear. The note doesn't explain it.","At its release time the bay record leaves the vehicle without brakes. The job number is the same."},
  observation="A roadworthy stamp is no substitute for inspection. Missing part identifiers leave room for a vehicle mix-up."},
 {id="housing",skill="carpenter",question="Empty buildings or buildings counted as empty?",
  titles={"Vacancy survey carbon","Boarding estimate","Temporary address slip","Door inspection book"},
  text={
   "Survey {code}, {place}: vacant on {day} July, no occupants remaining. District office copy, {name}.",
   "Board openings at {place}. Leave one door operable from inside. Estimate only, completion unsigned. Contractor copy.",
   "Send messages for {name} to {place}. Do not forward possessions. Address office retained slip.",
   "{place}, survey {code}, {day} July: occupants answered inside; entry declined. Inspection signed {other}."},
  readings={"Vacant could be a conclusion drawn from a locked door or an outdated survey.","The estimate leaves a way out. Who expected to stay inside, if the work happened?","Someone wanted messages redirected and belongings left alone. How long did they expect to be away?","The inspection records people behind a door when the survey says nobody remained. Neither names them."},
  observation="An operable door on an estimate is an instruction. It doesn't establish whether completed work allowed anyone out."},
 {id="waste",skill="medical",question="What was being cleared away?",
  titles={"Collection carbon","Sealed-bin order","Driver's route card","Yard gate slip"},
  text={
   "Collection {code}, {place}: load accepted at district yard, {day} July. Routine waste. Office copy, {name}.",
   "Sealed bins for {place}, billed separately from ordinary refuse. Supplier copy; contents unspecified.",
   "Driver to {place}: rear entrance; do not leave receipts at house. Route office copy {code}, {day} July.",
   "Load {code}, from {place}, {day} July: refused at gate. Vehicle departed with entire load. Yard clerk {other}."},
  readings={"Routine might be a billing category. The carbon doesn't describe the load.","Sealed bins could hold spoiled food, contaminated material, or ordinary things kept dry.","There could be mundane reasons for a rear entrance. Fewer people might see the collection.","The yard says the load was turned away. If so, its destination remains unrecorded here."},
  observation="A sealed container is not a diagnosis. These forms do not identify hazardous material or establish contamination."},
}
M.families=families
local function mix(seed,salt)
    local n=seed; for i=1,#salt do n=(n*33+salt:byte(i))%2147483647 end; return n
end
local names={"M. Voss","E. Hale","J. Mercer","S. Bell","D. Keene","R. Webb","A. Price","L. Ward"}
local function family(binding,seed) return families[1+mix(seed,binding.id)%#families] end
local function values(binding,seed)
    local n=mix(seed,binding.id)
    return {place=binding.label,code=string.format("K-%03d",100+n%900),day=tostring(1+n%6),
        nextday=tostring(2+n%6),amount=tostring(12+n%37),name=names[1+n%#names],other=names[1+(n+3)%#names]}
end
local function expand(text,v) return (text:gsub("{([%w_]+)}",function(k) return assert(v[k],"unknown content field "..k) end)) end
function M.observation(binding,profession,skills,seed,part)
    skills=skills or {}
    local f=family(binding,seed or 1)
    local observes={fuel=2,water=4,telephone=4,beds=4,radio=4,bus=2,mail=4,keys=1,
        food=2,power=4,names=4,road=4,medicine=2,repairs=4,housing=2,waste=2}
    local desired=binding.id=="LouisvilleStashMap15" and 4 or observes[f.id]
    if part and part~=desired then return nil end
    local skill=binding.id=="LouisvilleStashMap15" and "police" or f.skill
    local jobs={police={policeofficer=true,securityguard=true},medical={doctor=true,nurse=true},
        electrician={electrician=true,engineer=true},mechanic={mechanics=true,mechanic=true},
        carpenter={carpenter=true,constructionworker=true},plumber={plumber=true}}
    local perks={medical="Doctor",electrician="Electricity",mechanic="Mechanics",carpenter="Woodwork"}
    if (jobs[skill] and jobs[skill][profession]) or (perks[skill] and (skills[perks[skill]] or 0)>=3) then return skill end
end
local function gallery(part,v)
    local titles={"Priority removal carbon","Gallery packing request","Warden distribution slip","Annex inventory check"}
    local text={
        "District priority removals, third carbon. {place}, annex inventory G14: all listed items removed at 04:10 on {nextday} July. Destination: Shelter 4. W-114. Copies for warden posts, police offices and post counters.",
        "Packing request {code}, {place}. Leave labels on empty cases; collection staff will need them even if works remain. Stores copy, {day} July. Quantity blank.",
        "Warden posts and district counters: retain instructions for {place}. Do not send members of the public with the priority load. Distribution slip {code}; collection time blank.",
        "{place}, annex G14 inventory check, 05:00 on {nextday} July: every listed item present. No G14 items removed since 23:00 on {day} July. W-114."}
    local readings={
        "Cargo towards a shelter might mean a route was operating. It says nothing about seats for people. A carbon could be marked before a removal happened.",
        "An empty case could be prepared for collection that never came, or left after contents were taken separately.",
        "Somebody distinguished the load from the public. Ordinary transport instructions, or a route unavailable to people trying to leave?",
        "All G14 removed at 04:10 and continuously present at 05:00 cannot both describe the same inventory accurately. W-114 appears on both. Either record could be copied, mistaken or misleading."}
    return titles[part],expand(text[part],v),readings[part]
end
function M.render(binding,seed,part,observation)
    assert(binding and type(seed)=="number" and part>=1 and part<=4 and part%1==0,"invalid content reference")
    local v=values(binding,seed); local f=family(binding,seed)
    local title,text,reading=f.titles[part],expand(f.text[part],v),f.readings[part]
    if binding.id=="LouisvilleStashMap15" then title,text,reading=gallery(part,v) end
    -- A destination found first must not reveal a local fragment the player
    -- has never seen. Comparison is a separate, knowledge-gated projection.
    if part==4 then
        reading=binding.id=="LouisvilleStashMap15"
            and "The inventory check says the works stayed here. Was a route towards the shelter still operating for other loads? This sheet cannot tell me."
            or ("This is the local account. "..f.question)
    end
    if binding.relatedDestination then
        text="Routing heading: "..binding.label..". Attached complaint concerns abusive messages on a map of Ekron; author unidentified.\n\n"..text
    end
    local body="WHAT YOU FOUND\nA "..(part==4 and "locally retained record" or "circulation copy kept with correspondence").." bearing reference "..v.code..".\n\n"..text.."\n\nWHAT IT MIGHT MEAN\n"..reading
    if observation then
        local note=binding.id=="LouisvilleStashMap15"
            and "A warden number is not a verified identity. A clerk could copy the number or another shift could use it."
            or f.observation
        body=body.."\n\n"..note
    end
    local kinds={"dispatch","letter","notepad","receipt"}
    return {title=title.." / "..v.code,body=body,kind=kinds[part],premise=f.id}
end
function M.comparison(binding,seed)
    if binding.id=="LouisvilleStashMap15" then local _,_,reading=gallery(4,values(binding,seed)); return reading end
    return family(binding,seed).readings[4]
end
return M
