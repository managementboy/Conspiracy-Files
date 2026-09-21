-- Authored fiction grounded in the activities of verified vanilla businesses.
-- A/B are retained-copy addresses, never newly invented business locations.
-- All dates describe the same event chain; no optional unrelated objects.
local businesses={
 ["U-Store It"]="UStoreItMuldraugh", ["Sunstar Motel"]="SunstarMotel",
 ["McCoy Logging Co."]="McCoyLoggingCorp", Fossoil="Fossoil1",
}
local function document(kind,title,observation,source,note)
 return {kind=kind,title=title,observation=observation,source=source,note=note}
end
-- One optional source is a concrete extra observation, never a replacement
-- ending.  Keys and photographs show only their visible marking or image; the
-- surrounding source chain still establishes what happened.
local optionalByQuestion={
 ["Were the same belongings stored in two units?"]={key="unit-tag",role="records",kind="key",title="Unit 6 tag / {CODE}",observation="A brass key with a paper tag: 6 / TRANSFER.",source="Tag: UNIT 6 / TRANSFER {CODE} / {DATE2}.",note="The tag identifies unit 6 and a transfer date. Somebody kept a key with the transfer reference; I would keep the two together.",requires={"response","unit-tag"},text="The transfer-tagged key fits the tenant's account of moving out of unit 6."},
 ["Why does a second stock list repeat the first one's mistakes?"]={key="counter-copy",role="records",kind="receipt",title="Counter audit copy / {CODE}",observation="A counter copy marked COUNT PENDING.",source="{DATE2} / {CODE}\nUnit 14: recount requested before any contents entry is confirmed.",note="This copy asks for a count before confirming any contents. Sensible enough to need writing down, apparently.",requires={"claim","counter-copy"},text="The counter copy shows that unit 14 still needed a count when its copied contents had already produced a charge."},
 ["Why is a linen cupboard on the motel's occupancy return?"]={key="linen-photo",role="records",kind="photograph",title="Store 14 photograph / {CODE}",observation="A motel photograph of shelves of folded linen beneath a painted 14.",source="Photo label: STORE 14 / {DATE2} / no bed visible.",note="The photograph shows linen shelves under a painted 14. Even the sheets have been assigned a number.",requires={"response","linen-photo"},text="The photograph independently shows that the numbered space in the stock book was linen storage."},
 ["Where did the paid work on room 14 actually happen?"]={key="call-in",role="listen",kind="transcript",title="Kitchen call-in / {CODE}",observation="A typed radio call-in naming the diner extractor.",source="{DATE2}, 09:10 / {CODE}\nKitchen to maintenance: extractor belt fitted; fan running again.",note="The call-in puts the completed work in the kitchen. The room number never made it onto the air.",requires={"response","call-in"},text="The maintenance call-in places the completed belt work at the diner extractor."},
 ["Why was an empty storage unit still earning rent?"]={key="drop-box-photo",role="records",kind="photograph",title="Return-box photograph / {CODE}",observation="A flash photograph of a tagged key envelope in the return box.",source="Photo label: {DATE2} / {CODE} / envelope marked UNIT RETURN.",note="The dated photograph shows a tagged return envelope inside the box. Someone wanted a record of posting it. A photograph is an awkward thing to have to ask a return box for.",requires={"response","drop-box-photo"},text="The dated photograph supports the tenant's account of using the return box for the tagged key."},
 ["Who was using the unit after the tenant left?"]={key="flyer-sample",role="records",kind="photograph",title="Promotional leaflet sample / {CODE}",observation="A photograph of a three-for-two leaflet beside a carton label.",source="Photo label: {DATE2} / U-Store It promotion stock / unit carton.",note="The label calls this U-Store It promotion stock. The leaflet offers three for two; I would keep the photograph if somebody later wanted all three paid for.",requires={"response","flyer-sample"},text="The photographed leaflet matches the promotional stock identified in the vacated unit."},
 ["What disappeared between the two truck weights?"]={key="yard-call",role="listen",kind="transcript",title="Yard call-in / {CODE}",observation="A dispatch transcript asking for the trailer's second weight.",source="{DATE2}, 11:40 / {CODE}\nReceiving: tractor weighed; loaded trailer still in yard awaiting second pass.",note="The call-in catches the weighing halfway through. The trailer was not subtle; it was waiting.",requires={"response","yard-call"},text="The receiving call-in confirms that the loaded trailer remained awaiting the missing second pass."},
 ["Why did a lumber load lose half a ton on the road?"]={key="motor-photo",role="records",kind="photograph",title="Mill motor photograph / {CODE}",observation="A photograph of a motor on a mill floor with a chalked 1000 LB tag.",source="Photo label: {DATE2} / motor unloaded from haul {CODE}.",note="A motor on the mill floor, with a thousand pounds chalked onto it. Somebody wanted the weight recorded where it would be difficult to overlook.",requires={"response","motor-photo"},text="The mill photograph supplies a visible record of the motor removed from the haul."},
 ["How did a truck in the workshop buy fuel?"]={key="can-label",role="records",kind="key",title="Fuel-can tag / {CODE}",observation="A small key with a metal tag stamped FUEL CANS / 20 GAL / truck 3.",source="Tag: 20 GAL / RELIEF 3 / {CODE}.",note="The can tag names the relief truck and quantity. It is more mobile than the account number.",requires={"response","can-label"},text="The fuel-can tag matches the driver's stated quantity and identifies relief truck 3."},
 ["Why was a dismantled van still buying petrol?"]={key="generator-call",role="listen",kind="transcript",title="Generator call-in / {CODE}",observation="A radio transcript reporting the generator filled from cans.",source="{DATE2}, 14:05 / {CODE}\nWorkshop: generator filled from fifteen gallons; old van number used on pump form.",note="The call-in records the generator and the workaround together. The form got its van; the generator got its fuel.",requires={"response","generator-call"},text="The workshop call-in corroborates the generator use and the old-van number on the pump form."},
}
local function scenario(t)
 t.grounding=assert(businesses[t.organisation])
 local extra=assert(optionalByQuestion[t.question],"inventory scenario lacks optional evidence")
 t.essential={"claim","response","review"};t.optional={{key=extra.key,role=extra.role,kind=extra.kind,title=extra.title,observation=extra.observation,source=extra.source,note=extra.note}}
 -- See the note in AdministrativeScenarios: the second record disputes the
 -- first account, the third confirms the second, the three together explain.
 -- The optional source is a separate observation that supports what it is
 -- attached to; that is what "corroborates" is for.
 local K=t.kinds or {"disputes-delivery","corroborates","recontextualises"}
 t.comparisons={
  {requires={"claim","response"},from="response",to="claim",kind=K[1],text=t.findings[1]},
  {requires={"response","review"},from="review",to="response",kind=K[2],text=t.findings[2]},
  {requires={"claim","response","review"},from="review",to="claim",kind=K[3],text=t.findings[3]},
  {requires=extra.requires,from=extra.key,to=extra.requires[1],kind=extra.kind2 or "corroborates",text=extra.text},
 }
 -- A case where only one pair of records disagrees has one argument in it.
 -- `conflict` adds the second: the closing record set against the original
 -- claim, for the scenarios where the final paperwork plainly contradicts
 -- what the first document said had happened.
 if t.conflict then
  t.comparisons[#t.comparisons+1]={requires={"claim","review"},from="review",to="claim",
   kind="disputes-delivery",text=t.conflict}
  t.conflict=nil
 end
 t.findings=nil;t.kinds=nil
 return t
end
return {
 ["identical-inventories"]={
  scenario{
   organisation="U-Store It",
   question="Were the same belongings stored in two units?",
   event="A tenant moved one load out of a leaking unit; the old inventory stayed active until a second inspection.",
   outcome="One load moved from unit 6 to unit 14, but both units were billed until the old file closed.",
   unresolved="The promised duplicate-rent credit has no payment receipt attached.",
   readings={"The double charge looks like a file left open.","They made the tenant pay for their delay."},
   anchors={
    claim=document("dispatch","Two-unit statement / {CODE}",
     "Two inventories stapled to one bill. Even the chipped dresser handle is listed twice.",
     [[U-STORE IT / {DATE1}
Account {CODE} / {P1}
Unit 6: dresser, four dining chairs, six cartons. Dresser: left handle chipped.
Unit 14: dresser, four dining chairs, six cartons. Dresser: left handle chipped.
Both units remain chargeable pending clearance inspection.
Duplicate-inventory enquiries and retained removal slip: {B}.]],
     "Two units, the same damaged handle, two rents. I want to see a removal slip before I start believing in a second dresser."),
    response=document("letter","Tenant's removal copy / {CODE}",
     "A removal slip with a complaint written across the back.",
     [[{DATE2} / {CODE}
{P2}: I moved everything from 6 into 14 when the roof leaked, before this bill was made. You watched us carry it. Six is empty. Please stop renting me the puddle.
{P1}
Desk reply: transfer acknowledged. Only the inspection clerk may clear the old unit.]],
     "{P1} says the load moved because of a leak. {P2}'s reply accepts the transfer and still leaves the old unit open. Apparently the puddle needs an appointment."),
    review=document("receipt","Empty-unit clearance / {CODE}",
     "An inspection receipt. EMPTY is underlined hard enough to tear the carbon.",
     [[U-STORE IT / {DATE3}
{CODE}: unit 6 inspected empty. Unit 14 holds the transferred inventory, including dresser with chipped left handle. No second load.
Close unit 6 from transfer date. Duplicate rent to be credited on next statement.
Do not refund at desk: a closed unit is not a closed account.]],
     "The inspection records one load and an empty old unit. A credit is promised for the next statement. Even empty space gets paid before it gets believed."),
   },
   findings={
    "Two units are inventoried with the same damaged dresser. The complaint has one load, moved once, and an old file nobody closed.",
    "The inspection backs the complaint: unit 6 was empty and unit 14 held the transferred load. The remedy was another statement to wait for.",
    "I can account for the duplicate inventory: one move, two open unit files, two rents. The inspection ordered a credit; I haven't found evidence that the money came back.",
   },
  },
  scenario{
   organisation="U-Store It",
   question="Why does a second stock list repeat the first one's mistakes?",
   event="A clerk copied a neighbouring tenant's inventory into an uncompleted form to clear an overdue return.",
   outcome="An empty unit acquired fictitious contents and a contents-protection charge; inspection removed both.",
   unresolved="The corrected account does not show whether the earlier charge was collected.",
   readings={"The deadline mattered more than the inventory.","The extra charge deserved a closer look."},
   anchors={
    claim=document("dispatch","Matching contents lists / {CODE}",
     "Two unit lists. Both describe a sewing machine with 'no foot thing'.",
     [[U-STORE IT / {DATE1}
{CODE}: units 6 and 14 each list one sewing machine, no foot thing; two rolled rugs; one blue trunk.
Contents-protection charge entered for both accounts.
Audit queries: retained forms at {B}.]],
     "Two sewing machines could be alike. Two clerks calling the missing pedal a foot thing would be a more impressive coincidence."),
    response=document("notepad","Clerk's correction request / {CODE}",
     "A pencil note with the word TEMPORARY boxed twice.",
     [[{DATE2} / {CODE}
{P2}, I copied 6 onto 14 to get the overdue sheet off the list. I was going to replace it after counting. Fourteen was empty when I last unlocked it.
Please remove the protection charge before the next bill.
{P1}
Reply: no deletion without a signed recount.]],
     "{P1} admits copying the list to meet a deadline. The correction now needs the count the original charge managed without."),
    review=document("receipt","Recount adjustment / {CODE}",
     "A recount form with the contents total changed to zero.",
     [[U-STORE IT / {DATE3}
Recount {CODE}: unit 14 empty. Sewing machine, rugs and blue trunk present in unit 6 only.
Adjustment entered: copied inventory removed; protection charge for 14 cancelled. Overdue return marked RECEIVED; do not reopen that return.
Adjustment authorised: {P2}.]],
     "One real inventory, one empty unit. The false contents are removed. The on-time paperwork gets to keep its clean record."),
   },
   findings={
    "The overdue form lists contents for unit 14. The correction request has that unit empty and its list copied off another sheet.",
    "The recount confirms the empty unit described in the request, and {P2} cancels the invented stock and charge.",
    "The second load existed on a copied form. That was enough to produce a charge, though not enough to cancel one. The adjustment settles the stock; it doesn't tell me whether the earlier bill was paid.",
   },
  },
 },
 ["room-not-on-the-plan"]={
  scenario{
   organisation="Sunstar Motel",
   question="Why is a linen cupboard on the motel's occupancy return?",
   conflict="The return counts 14 among the let rooms. The correction takes it off guest occupancy: it was a cupboard with shelves in it.",
   event="A supervisor counted a storeroom as an occupied room to meet a room-use target.",
   outcome="The apparent guest room was linen storage; the report counted it as occupied without a paying guest.",
   unresolved="The corrected room count does not show who approved the earlier figures.",
   readings={"They stretched a definition to meet the target.","The room figures were knowingly misleading."},
   anchors={
    claim=document("dispatch","Room 14 occupancy / {CODE}",
     "A motel return with the guest-name box crossed out and SUNSTAR STOCK written over it.",
     [[SUNSTAR MOTEL / {DATE1}
Return {CODE}: room 14 occupied, guest name SUNSTAR STOCK.
Room-use target met. No cash receipt attached.
Query copies and the maintenance sketch retained at {B}.]],
     "Sunstar Stock has a room but no receipt. Either the motel has started holidaying its own sheets or somebody owes it money."),
    response=document("notebook","Linen cupboard sketch / {CODE}",
     "A shelf sketch pasted into a stock book. STORE is written over an older 14.",
     [[{DATE2} / {CODE}
Linen cupboard: internal store number 14. Shelving full; no bed or guest access.
{P1}: why is this on my room-use return?
{P2}: instructions say count every occupied room. Leave the linen where it is.]],
     "The sketch calls 14 a cupboard. {P2}'s answer treats shelves full of sheets as occupancy. I suppose none of the guests complained about the view."),
    review=document("receipt","Room-count adjustment / {CODE}",
     "A correction attached to an occupancy return, with the revenue box left unchanged.",
     [[SUNSTAR MOTEL / {DATE3}
{CODE}: remove store 14 from guest-room occupancy. Revenue unchanged: no booking or guest payment existed.
Original return remains filed as submitted. Do not amend the target report without a supervisor's authorisation.]],
     "The correction removes a guest who was never there. The target report stays put until someone volunteers to make it worse."),
   },
   findings={
    "The occupancy return counts 14 as a let room. The stock book has it holding folded sheets.",
    "The correction accepts that 14 was storage and removes it from guest occupancy, but leaves the original target report awaiting authorisation.",
    "There was no hidden guest room in these records. A cupboard helped Sunstar meet its room-use target. The room count was corrected; the flattering report was still waiting for permission to become less flattering.",
   },
  },
  scenario{
   organisation="Sunstar Motel",
   question="Where did the paid work on room 14 actually happen?",
   event="A motel repair order used job number 14; accounts copied it into the room-number field.",
   outcome="The repair was to the diner extractor, and its cost was moved out of the guest-room account.",
   unresolved="The correction does not say whether other room charges were checked for the same mistake.",
   readings={"One bad form created an imaginary room.","Nobody checked the location before paying."},
   anchors={
    claim=document("receipt","Room repair charge / {CODE}",
     "A paid repair bill marked ROOM 14, with a staple over the work description.",
     [[SUNSTAR MOTEL / {DATE1}
{CODE}: ventilation repair, room 14. Charge accepted against guest-room maintenance.
Location query and contractor's retained job card: {B}.
Payment approved: {P2}.]],
     "The room number was clear enough to pay. The work description was clear enough to staple shut."),
    response=document("letter","Contractor's job card / {CODE}",
     "A job card with a small grease drawing of an extractor fan on the reverse.",
     [[Copy sent {DATE2} / {CODE}
Job 14: diner extractor belt replaced before the attached bill was issued. Tested over kitchen range with {P1} present.
Fourteen is my job number. I do not know your room numbers.
Please stop sending me guest-room queries.]],
     "The contractor puts the work over the diner's range. Fourteen belongs to the job. It seems the bill found it a room."),
    review=document("notepad","Maintenance account correction / {CODE}",
     "An accounts correction with ROOM crossed out and JOB written in its place.",
     [[SUNSTAR MOTEL / {DATE3}
{CODE} checked with {P1}: diner extractor operating after belt replacement.
Job number entered as room number during posting. Transfer expense from guest rooms to diner. No second repair authorised.
Original form retained: replacement stationery not approved.]],
     "The diner got its repair and accounts got the right department. The form that caused the mistake has been spared the expense of retirement."),
   },
   findings={
    "The bill pays for work carried out in room 14. The contractor's copy has the same job done on the diner extractor.",
    "{P1}'s check supports the contractor's account of a working diner extractor; accounts moves the expense to the diner.",
    "I can place the repair at Sunstar's diner. Accounts paid for an imaginary room because a job number landed in the wrong box, then corrected the account while keeping the form.",
   },
  },
 },
 ["lease-outlived-tenant"]={
  scenario{
   organisation="U-Store It",
   question="Why was an empty storage unit still earning rent?",
   conflict="The demand charges rent for weeks after the tenant left. The key log dates the return and orders a refund from that day.",
   event="A tenant returned a key through the drop box, but the account stayed open because nobody issued a counter receipt.",
   outcome="Inspection found the empty unit and returned key, and ordered later rent refunded.",
   unresolved="The refund order has no signed collection entry.",
   readings={"The key-return procedure failed the tenant.","They had enough evidence to stop charging sooner."},
   anchors={
    claim=document("receipt","Continued-rent demand / {CODE}",
     "A rent demand folded around an older removal notice.",
     [[U-STORE IT / {DATE1}
Account {CODE} / {P1}: rent continues. Removal notice received; counter receipt for key return absent.
An empty unit remains let until the key is accounted for.
Retained return record and billing enquiries: {B}.]],
     "They received the notice and kept the rent running. Leaving was apparently the easy part of leaving."),
    response=document("letter","Key-return complaint / {CODE}",
     "A letter with the drop-box instructions copied along its bottom edge.",
     [[{DATE2} / {CODE}
I cleared the unit before your demand and put the tagged key through your box as instructed. {P2} helped unload the last chair and saw me post it.
The box did not offer a receipt. Please ask it again before billing me.
{P1}]],
     "{P1} names a witness and the return box. The demand wanted a counter receipt for something returned when the counter was shut."),
    review=document("notebook","Return-box reconciliation / {CODE}",
     "A key-room log with an envelope taped beside the entry.",
     [[U-STORE IT / {DATE3}
{CODE}: tagged key located in unsorted drop-box envelope. Unit inspected empty. Removal date confirmed by {P2}.
Close account from removal date; reverse later rent. Refund order raised.
Drop-box receipts remain available at the counter during opening hours.]],
     "They found the key and accepted the leaving date. The new instruction sends the after-hours tenant straight back to the closed counter."),
   },
   findings={
    "The rent demand rests on a key never returned. The complaint has it handed across the counter, in front of a witness.",
    "The key log corroborates that route and the witness, then orders a refund from the departure date.",
    "The tenant left and returned the key. An unsorted envelope kept the lease charging until the inspection caught up. I have the refund order, but no evidence that {P1} collected it.",
   },
  },
  scenario{
   organisation="U-Store It",
   question="Who was using the unit after the tenant left?",
   event="The office stored its promotional stock in a vacated unit while leaving the former tenant's billing account open.",
   outcome="A stock check identified office-owned cartons, and the former tenant's charges were cancelled.",
   unresolved="The correction leaves responsibility for authorising the continued bills blank.",
   readings={"The office forgot to move its own storage costs.","Keeping the tenant's account open was convenient."},
   anchors={
    claim=document("dispatch","Occupied-unit rent notice / {CODE}",
     "A rent notice clipped to a photograph of sealed cartons.",
     [[U-STORE IT / {DATE1}
{CODE}: departure reported by {P1}; unit remains occupied by twelve cartons. Rent continues until clear.
Do not discard contents.
Retained inspection and stock records: {B}.]],
     "{P1} says they've left; twelve cartons say the unit hasn't. The notice is charging the name it already has."),
    response=document("notepad","Promotional-stock transfer / {CODE}",
     "An internal stock note with a small flyer folded between its pages.",
     [[{DATE2} / {CODE}
{P2}: checked twelve cartons in vacated unit. Our three-for-two promotional leaflets and blank rental forms, moved there after {P1} left.
Keep dry until the promotion ends. No staff-storage account code available.
Bill query sent to accounts.]],
     "The cartons belong to U-Store It. Its own rental forms have found somewhere to stay without opening an account."),
    review=document("receipt","Tenant account release / {CODE}",
     "A corrected statement with the carton count left in place and the debtor changed.",
     [[U-STORE IT / {DATE3}
{CODE}: stock check confirms twelve cartons of office supplies. Cancel {P1}'s rent from departure. Transfer storage to office expense.
Stock may remain. Former tenant is not responsible for clearing it.
Authorisation for earlier billing: [blank].]],
     "The stock gets to stay and {P1} gets to stop paying for it. Nobody has put a name in the box for whoever thought that needed explaining."),
   },
   findings={
    "The notice charges {P1} for a unit still in use. The stock note has the office's own leaflets in it, carried there after they left.",
    "The corrected statement confirms the office stock and moves its storage cost off the former tenant's account.",
    "The lease outlasted the tenant because U-Store It filled the empty unit itself. The stock stayed; the tenant's charges were cancelled. The earlier bills still have no author to ask about them.",
   },
  },
 },
 ["load-that-got-lighter"]={
  scenario{
   organisation="McCoy Logging Co.",
   question="What disappeared between the two truck weights?",
   event="A loaded truck was weighed with the trailer attached at dispatch and without it at the receiving weighbridge.",
   outcome="A reweigh of the same sealed load accounted for the entire difference as the omitted trailer.",
   unresolved="The records leave the driver's withheld pay awaiting a separate release.",
   readings={"The weighbridge procedure caused the shortage.","They blamed the driver before checking the equipment."},
   anchors={
    claim=document("dispatch","Short-load report / {CODE}",
     "Two weigh tickets stapled to a driver-pay hold.",
     [[McCOY LOGGING CO. / {DATE1}
Load {CODE}: dispatch gross exceeds receiving gross by 12,000 lb.
Driver {P1}: payment held pending shortage explanation. Trailer field on receiving ticket blank.
Retained weigh tickets and driver enquiries: {B}.]],
     "A blank trailer box has become a shortage, and the shortage has become {P1}'s wages. That's a quick journey for an empty box."),
    response=document("letter","Driver's weighbridge account / {CODE}",
     "A letter with a pencil drawing of a truck separated from its trailer.",
     [[{DATE2} / {CODE}
At receiving, {P2} told me to leave the loaded trailer off the bridge and weigh the tractor first. The second weight was never taken.
Trailer is still sealed in the yard. Weigh that before you take it out of my pay.
{P1}]],
     "The driver describes an unfinished two-part weighing, with the load still available to check. A useful alternative to weighing their pay packet."),
    review=document("receipt","Sealed-load reweigh / {CODE}",
     "A fresh weigh ticket with the original seal number copied beneath it.",
     [[McCOY LOGGING CO. / {DATE3}
{CODE}: original seal intact. Tractor and loaded trailer reweighed together: matches dispatch gross.
Omitted loaded trailer accounts for 12,000 lb difference. No cargo shortage recorded.
Clear shortage file. Driver-pay hold requires separate payroll release.]],
     "The complete vehicle matches the dispatch weight. The shortage file can close now. Apparently the pay hold is travelling on a different trailer."),
   },
   findings={
    "The short-load report weighs the load light. The driver's account has the loaded trailer standing in the yard, never put on the scale.",
    "The reweigh checks the same sealed load and accounts for the difference described by the driver. Payroll has yet to release the hold.",
    "Nothing went missing from this load. The second weighing omitted the loaded trailer, then charged the difference against a driver. The corrected weight clears the cargo; it does not show that {P1} was paid.",
   },
  },
  scenario{
   organisation="McCoy Logging Co.",
   question="Why did a lumber load lose half a ton on the road?",
   event="A truck was weighed with a borrowed mill motor aboard; the motor was unloaded for an emergency repair before delivery.",
   outcome="The destination received the lumber intact; the weight difference was the motor left at the mill.",
   unresolved="The haulage deduction has been challenged but no repayment is recorded.",
   readings={"An urgent repair overtook the manifest.","The company left its driver carrying the cost."},
   anchors={
    claim=document("dispatch","Weight deduction / {CODE}",
     "A haulage docket with 1,000 lb SHORT stamped beside a lumber count.",
     [[McCOY LOGGING CO. / {DATE1}
{CODE}: destination weight 1,000 lb below departure. Lumber-piece count unchanged.
Deduct discrepancy from carrier invoice pending explanation.
Driver: {P1}. Retained load notes and deduction enquiries: {B}.]],
     "The lumber count is unchanged, but the invoice has lost weight too. I'd like to know what was on the truck besides lumber."),
    response=document("notebook","Mill motor receipt / {CODE}",
     "A mill repair log with an unloading sketch and two names under it.",
     [[Copy made {DATE2} / haul {CODE}
Before delivery, unload borrowed 1,000 lb motor from {P1}'s lumber truck for stopped mill line. Received and fitted by {P2}; motor test satisfactory.
Load sheet describes lumber only. Motor travelled as urgent repair equipment, no separate manifest.]],
     "The repair log puts a thousand-pound motor on the journey and takes it off at the mill. Urgent equipment apparently travels lighter on forms."),
    review=document("receipt","Carrier deduction query / {CODE}",
     "A reconciliation attached to a returned request for payment.",
     [[McCOY LOGGING CO. / {DATE3}
{CODE}: motor included in departure gross and removed before destination weighing. Lumber tally complete. Weight difference reconciled to mill receipt.
Cancel shortage claim. Repayment of deducted haulage must be requested on the carrier adjustment form.]],
     "The load is accounted for. To get paid for bringing it, the carrier has been given another thing to deliver."),
   },
   findings={
    "The manifest carries lumber only, and a thousand pounds went missing between weighings. The mill receipt has a motor lifted off on the way.",
    "The reconciliation matches the motor receipt to both weighings and cancels the shortage claim, but sends repayment into a separate form.",
    "McCoy's motor left the truck at the mill; its lumber reached the destination. The wrong manifest made that useful stop look like missing cargo. The shortage is cleared, but the deducted money is still a request.",
   },
  },
 },
 ["fuel-for-a-dead-truck"]={
  scenario{
   organisation="Fossoil",
   question="How did a truck in the workshop buy fuel?",
   event="A relief driver used an immobilised truck's account card to buy fuel in cans for another working vehicle.",
   outcome="The fuel went to a replacement truck while the account kept the workshop truck's number.",
   unresolved="The request for a replacement account card has no issued-card record.",
   readings={"The driver kept a replacement truck working.","The account numbers stopped tracking the fuel."},
   anchors={
    claim=document("receipt","Workshop-truck fuel charge / {CODE}",
     "A Fossoil receipt stapled to an OFF ROAD notice. Both carry the same vehicle number.",
     [[FOSSOIL / {DATE1}
Account {CODE}: 20 gallons charged to truck 8. Supplied in approved fuel cans; signature {P1}.
Attached workshop notice: truck 8 immobilised since {DATE0}.
Account query copies: {B}.]],
     "Truck 8 couldn't move, but its account could buy twenty gallons. The receipt says cans. That's a route worth following before accusing the truck."),
    response=document("notebook","Relief-driver fuel entry / {CODE}",
     "A driver's notebook with two truck numbers connected by an arrow.",
     [[{DATE2} / {CODE}
{P1}: fuel from the attached Fossoil receipt went into relief truck 3. {P2} watched the transfer. Eight's card is the only card the office supplied.
Requested a card for 3. Office says cards follow the assigned truck, not temporary drivers.]],
     "{P1} names truck 3 and a witness for the fuel. The office follows the assigned truck so closely it has left the moving one behind."),
    review=document("notepad","Fuel-account adjustment / {CODE}",
     "A checked account query with the vehicle field amended but the card number unchanged.",
     [[{DATE3} / {CODE}
{P2} confirms 20 gallons transferred from cans to relief truck 3. Truck 8 remained immobilised.
Fuel expense moved to 3. Fossoil transaction remains under card for 8.
New-card request returned: relief allocation has no permanent vehicle number.]],
     "The expense reaches the right truck. A card for that truck is still waiting for it to become permanent enough to need fuel."),
   },
   findings={
    "The receipt buys fuel on a truck that is in pieces in the workshop. The driver's entry has that card paying for cans carried out to truck 3.",
    "The account check corroborates the transfer to truck 3 and amends the expense, while rejecting its new-card request.",
    "The workshop truck did not make a secret trip. Its card paid for fuel carried to truck 3. The accounts now know that, but the replacement truck still has no card of its own in these records.",
   },
  },
  scenario{
   organisation="Fossoil",
   question="Why was a dismantled van still buying petrol?",
   event="A clerk reopened an inactive vehicle account because the pump system required a vehicle number for generator fuel.",
   outcome="The fuel was delivered in cans to a generator, and the vehicle account was closed again after reconciliation.",
   unresolved="No replacement procedure for the next generator purchase is recorded.",
   readings={"They borrowed a dead account to buy real fuel.","A required box made the account misleading."},
   anchors={
    claim=document("receipt","Reopened fuel account / {CODE}",
     "A Fossoil docket with CLOSED crossed out on the attached account card.",
     [[FOSSOIL / {DATE1}
{CODE}: former van account reopened for 15 gallons. Van recorded dismantled before this sale.
Collection in cans authorised by {P2}.
Retained account queries and issue record: {B}.]],
     "The van was dismantled before it bought petrol. The fuel left in cans, which seems more promising than looking for a rebuilt van."),
    response=document("letter","Generator-fuel explanation / {CODE}",
     "A short explanation written on the back of a pump transaction copy.",
     [[{DATE2} / {CODE}
{P2}, the fifteen gallons went into the workshop generator. I signed for the cans and filled it myself.
Your form would not take GENERATOR in the vehicle box. You told me to use the old van number until an equipment account exists.
{P1}]],
     "The generator needed petrol and the form needed a van. {P1} says the clerk found a way to supply both."),
    review=document("notebook","Generator issue check / {CODE}",
     "A fuel issue book with an account-closure note clipped over the cover.",
     [[{DATE3} / {CODE}
Generator issue checked: 15 gallons from {P1}'s cans, matched to Fossoil docket. {P2} confirms use of old van number for that sale.
Close van account again. Equipment-account request outstanding.
No further purchases to be entered against a dismantled vehicle.]],
     "The issue check finds the fuel in the generator's records and closes the van again. It bans the workaround without supplying the account they needed."),
   },
   findings={
    "The account is open for a van that no longer exists. The explanation has fifteen gallons going into a generator, because the form insisted on a vehicle number.",
    "The issue check matches the quantity and corroborates {P2}'s instruction, then closes the borrowed account again.",
    "The van stayed dismantled. Fifteen gallons went to a generator under its number because the form required a vehicle. They closed the false account; the equipment account was still only a request.",
   },
  },
 },
}
