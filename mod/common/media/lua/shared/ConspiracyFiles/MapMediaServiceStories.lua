-- EVERY MAP STORY IS BOUND TO THE LIVE CENTRAL CONSPIRACY.
--
-- All 125 vanilla annotated stash maps already trigger one of these stories,
-- selected by family from the map's own handwriting. None of them reached the
-- campaign's central question, so a player could follow somebody's own marked
-- map to a real place, find a real incident, and have it connect to nothing.
--
-- Each story now names the AXIS its evidence bears on. The sentence belongs to
-- whichever pair the save drew (ConspiracyPair.axisLine), so the same marked
-- place reads differently in a Farm Zero campaign and a Failed Cordon one, and
-- neither reading is ever resolved.
-- Authored incidents, grounded in vanilla business activities. Destination
-- records are the customer's/recipient's retained copies, not proof that a
-- randomly bound house is a canonical shop, depot, clinic or exchange.
local function page(kind,title,observation,source,note)
 return {kind=kind,title=title,observation=observation,source=source,note=note}
end
return {
 fuel={
  -- fuel reserved for one journey and issued into cans for another
  centralAxis="movement",
  organisation="Fossoil",grounding="Fossoil1",siteRole="recipient-copy",
  question="Was fuel actually supplied for the promised collection?",
  event="A reserved passenger-fuel allowance was reassigned to generator cans before the driver could draw it.",
  outcome="The pump and driver records account for the fuel in generator cans and confirm the passenger collection was cancelled.",
  skill="mechanic",observationPart=4,
  professional="The pump entry identifies cans, not a vehicle tank. It accounts for the issue without requiring a vehicle to have made the passenger trip.",
  parts={
   page("dispatch","Passenger fuel reservation",
    "A Fossoil reservation carbon, stamped ALLOCATED above an empty collection signature.",
    [[FOSSOIL / {day} July 1993 / {code}
Reserve {amount} gallons against passenger collection for {place}. Account contact: {name}.
Dispatch may report fuel ALLOCATED. Fuel must still be collected.
Recipient's reconciliation copy to be kept at {place}.]],
    "Fuel was allocated for a collection here. That is a reason to look for the receipt, not a reason to wait by the road."),
   page("receipt","Driver's unpaid waiting slip",
    "An expense slip with WAITING crossed out and replaced by NO PRODUCTIVE MILEAGE.",
    [[{day} July 1993 / {code}
{other}: pump attendant could not release passenger allowance. Waited two hours. Vehicle tank remained empty; collection not attempted.
Expense query: no mileage, therefore no journey. Please claim waiting against something else.]],
    "The driver says the fuel was unavailable. Accounts have decided that two hours beside a pump don't belong to a journey. I'd like to know which account got the fuel."),
   page("notepad","Generator priority amendment",
    "A fuel amendment clipped to a list of returnable cans.",
    [[{day} July 1993 / {code}
{name}: transfer the reserved {amount} gallons to generator cans. Use the existing collection reference; new accounts are suspended.
Advise passenger dispatcher that allocation is fulfilled under EQUIPMENT.
Do not duplicate the allowance.]],
    "Same reference, different recipient. The form can call the allocation fulfilled while the passenger vehicle stays empty. A generator cannot complain about its seat."),
   page("receipt","Recipient's fuel reconciliation",
    "A retained pump receipt and cancellation slip, fastened through the same reference number.",
    [[FOSSOIL / {nextday} July 1993 / {code}
Recipient copy retained at {place}.
{amount} gallons issued into generator cans under signed amendment from {name}. Passenger vehicle issue: zero.
{other}'s collection cancelled before departure. Passenger allocation closed; equipment charge accepted.
Waiting expense returned: no passenger account remains open.]],
    "The fuel went into cans and the passenger trip never started. This file accounts for both. It also explains how to make a waiting driver's expense disappear without making the driver go anywhere."),
  },
  findings={
   "The driver's empty tank explains why ALLOCATED on the reservation was not a completed fuel collection.",
   "The receipt records the generator-can issue ordered in the amendment, with no fuel issued to the passenger vehicle.",
   "The promised collection lost its fuel before departure. The allowance was reassigned to equipment and closed under the same reference, leaving the driver with an empty tank and an expense nobody would own. This was a cancelled local trip, not a route out that I missed.",
  },
 },
 water={
  -- a supply record altered after the fact
  centralAxis="records",
  organisation="Knox Pack Kitchens",grounding="KnoxPackKitchens",siteRole="recipient-copy",
  question="Did WATER SERVICE RESTORED mean water was available at the marked place?",
  event="An appliance service desk closed a disconnected water-dispenser job after a bench test, and its customer copied the closure as a building-service notice.",
  outcome="The retained correction identifies an appliance-only test; the disconnected site supply had never been restored by that job.",
  skill="plumber",observationPart=4,
  professional="The correction names a test reservoir and a disconnected inlet. A successful appliance test says nothing about the building's water supply or the quality of any water there.",
  parts={
   page("dispatch","Water service notice",
    "A hand-copied notice with a Knox Pack Kitchens job number at the bottom.",
    [[{day} July 1993 / {code}
For {place}: WATER SERVICE RESTORED. Copied by {name} from contractor's completion line.
Bring containers after confirmation. Service correspondence retained at {place}.
Do not ring twice about the same completion.]],
    "That heading is exactly what I'd want to see. It was copied from another form, though. I'd check what work the contractor actually completed before carrying empty bottles there."),
   page("letter","Customer's empty-dispenser complaint",
    "A customer letter with the contractor's completion line pasted beneath it.",
    [[KNOX PACK KITCHENS / customer query {code}, {day} July 1993
{name}: the dispenser still gives nothing. People read WATER SERVICE RESTORED and arrived with bottles.
Your desk says the job is complete. Please send either water or a different sentence.]],
    "The customer tried the dispenser and got nothing. Other people trusted the heading. A corrected sentence would be lighter to carry home than all those bottles."),
   page("notebook","Appliance bench test",
    "A service sheet with BENCH ONLY written across its location box.",
    [[KNOX PACK KITCHENS / {code} / {day} July 1993
{other}: dispenser valve tested from workshop reservoir. Appliance passed.
Site inlet remains disconnected; building supply is outside this job. WATER SERVICE line refers to dispenser service.
Return appliance with inlet tag attached.]],
    "The technician tested one appliance from a reservoir. The desk's heading has somehow grown large enough to cover a building. The inlet tag is doing the honest part of the work."),
   page("letter","Corrected water notice",
    "A customer copy headed APPLIANCE TEST COMPLETE, with the previous notice folded behind it.",
    [[{nextday} July 1993 / {code} / retained at {place}
Knox Pack Kitchens confirms bench test only. Site inlet was not reconnected and no building supply was restored by this job.
{name}: original notice withdrawn; bottle collection cancelled. Dispenser received with disconnected-inlet tag.
Desk instruction: use full service description even when it runs onto a second line.]],
    "The correction closes this promise of water. The appliance worked on the bench; the supply here was still disconnected. They could have saved everyone a trip by paying for a second line of typing."),
  },
  findings={
   "The customer's complaint is about the dispenser behind the copied notice. RESTORED did not describe what people arriving with bottles found.",
   "The correction confirms the bench sheet's limited job: testing an appliance did not reconnect the site supply.",
   "A short completion heading became a public promise of water. The job concerned a dispenser tested from a workshop reservoir, and the retained correction cancels the bottle collection. This file gives me a reason to distrust that notice, not evidence of a working supply now.",
  },
 },
 telephone={
  -- a line answered by somebody not accounted for
  centralAxis="absence",
  organisation="Circuital Healing",grounding="CircuitalHealing",siteRole="recipient-copy",
  question="Did the apparently answered call reach anyone outside?",
  event="A repaired answering machine was left in greeting-preview mode, and its returned customer's test call was logged as an answered message.",
  outcome="The repair correction identifies the voice as a local greeting playback; the supposed reply was never a conversation with a distant person.",
  skill="electrician",observationPart=4,
  professional="A local speaker playing a greeting does not demonstrate a connection through the telephone line. The correction explicitly identifies the preview circuit.",
  parts={
   page("dispatch","Answered-message report",
    "A message report bearing a copied greeting and a repair reference.",
    [[{day} July 1993 / {code}
Telephone equipment returned from Circuital Healing to the contact for {place}.
{name}: voice heard, 'We are unable to take your call.' Entered ANSWERED. Message left asking whether anyone can collect us.
Keep equipment correspondence at {place}.]],
    "A voice came out of something. That might have felt like enough at the time. I want the equipment notes before taking this for contact with someone who could help."),
   page("notepad","Repeated greeting note",
    "A listener's note with the same sentence copied three times.",
    [[{day} July 1993 / {code}
{name}: exact same greeting each time. It starts when I press PLAY, even with the wall cord out. Nobody replies to the collection question.
Return desk says recorded speech proves audio restored.]],
    "It speaks with the cord out. The return desk is satisfied with the audio; the customer was hoping for a person. Those are separate standards of repair."),
   page("receipt","Service demonstration slip",
    "An equipment collection slip whose DEMONSTRATE GREETING box is ticked.",
    [[CIRCUITAL HEALING / {code} / {day} July 1993
{other}: greeting playback demonstrated through local speaker. Unit left on GREETING PREVIEW.
Telephone connection test not performed. Explain operating switch at collection.
Customer instruction box: unsigned.]],
    "The workshop demonstrated the greeting and left the switch there. The only empty box is the one for explaining it to the customer. That was probably the useful box."),
   page("letter","Local-playback correction",
    "A signed correction retained with the customer's message report.",
    [[CIRCUITAL HEALING / {nextday} July 1993 / {code}
Copy for {place}: voice on reported test was this unit's stored greeting in PREVIEW. No outgoing conversation or received reply occurred during that demonstration.
{name} withdraws ANSWERED entry. Operating-switch instruction supplied without repeat demonstration fee.]],
    "The voice was the machine talking to its own owner. This corrects that one hopeful ANSWERED entry. It doesn't tell me whether a different line ever worked, but there was no reply to follow here."),
  },
  findings={
   "The repeated greeting with the cord unplugged gives the answered-message report a local explanation.",
   "The correction confirms the service slip's preview setting and missing connection test: this was the machine's own greeting.",
   "The reported answer was a greeting demonstration left running after repair. A customer asking for collection mistook restored audio for contact. The correction withdraws that entry; it supplies no distant person to call back.",
  },
 },
 beds={
  -- beds prepared in a place that was said to be shut
  centralAxis="access",
  organisation="Sunstar Motel",grounding="SunstarMotel",siteRole="recipient-copy",
  question="Did the reservation actually keep beds available for arriving people?",
  event="A group reservation held motel rooms until a payment deadline; after expiry the manager rented them as storage while the old referral list kept circulating.",
  outcome="The recipient's cancellation file records expiry before arrival and the reassignment of the rooms to boxed stock.",
  skill="medical",observationPart=4,
  professional="This is a motel reservation and room account. It records neither hospital admissions nor a patient count; the later storage rental explains the occupied-room total.",
  parts={
   page("dispatch","Group-bed reservation carbon",
    "A Sunstar reservation carbon with HELD in large type and its deadline in small type.",
    [[SUNSTAR MOTEL / {day} July 1993 / {code}
Group contact {name}, correspondence at {place}. Rooms HELD for arrivals. Deposit due 12:00 today; unpaid hold expires automatically.
Circulate referral list only while hold remains live.]],
    "There was a reservation, with a noon deadline. I'd want to know what happened at noon before telling anybody to walk to the motel."),
   page("letter","Late-arrival objection",
    "A group contact's letter listing the referral copies that had already gone out.",
    [[{day} July 1993 / {code}
{name}: we reached the desk after noon and were told all the rooms were occupied. The people on our list had not been admitted.
Please stop sending copies stamped HELD. Some of ours have already gone on to other addresses.]],
    "The group arrived and got no rooms. The old promise was still travelling without them. Paper seems to have had the better arrangements."),
   page("receipt","Room-storage charge",
    "A room-rental duplicate with GUEST NAMES replaced by BOX COUNT.",
    [[SUNSTAR MOTEL / {code} / {day} July 1993
12:05: expired group rooms let for temporary boxed-stock storage, approved {other}.
Linen retained on beds; charge standard room rate. Occupancy report: full.
No guest keys issued against storage account.]],
    "The rooms were full of boxes five minutes after the hold expired. The linen stays because the rate stays. Apparently a box is a very undemanding guest."),
   page("dispatch","Recipient's reservation cancellation",
    "A cancellation copy retained with the group's original list.",
    [[SUNSTAR MOTEL / {nextday} July 1993 / {code}
To group contact at {place}: deposit not received by deadline. Hold expired before group's arrival; rooms re-let for boxed stock at 12:05.
No people on this referral list were admitted under this booking. List withdrawn; stale HELD copies invalid.
No lodging charge to group.]],
    "This booking bought nobody a bed. The deposit deadline passed, the rooms went to stock, and the list kept promising them. The cancellation is clear about this group. I'd keep it with the old carbon so the promise can't travel alone again."),
  },
  findings={
   "The arrival objection shows why the deadline on the reservation matters: the group reached the desk after it.",
   "The cancellation confirms that the occupied rooms on the storage receipt held stock, not the people on the referral list.",
   "The bed promise expired before the group arrived. The motel rented the rooms to boxed stock and counted itself full while HELD copies continued circulating. This local booking never became accommodation for the named group.",
  },
 },
 radio={
  -- a log entry rewritten after transmission
  centralAxis="records",
  organisation="Circuital Healing",grounding="CircuitalHealing",siteRole="recipient-copy",
  question="Why did the radio fail after its battery issue was signed complete?",
  event="Returned exhausted batteries were put into a fresh-stock carton and issued by carton label; their return deposit was mistaken for a stock receipt.",
  outcome="The workshop identifies the returned cells, replaces the issue and reverses the charge, while recording only a bench reception test.",
  skill="electrician",observationPart=4,
  professional="The test is local bench reception, not evidence that this radio transmitted or reached anybody outside Knox. The dated battery marks account for the failed issue.",
  parts={
   page("receipt","Radio battery issue",
    "A shop receipt with BATTERIES SUPPLIED ticked beneath a radio job number.",
    [[CIRCUITAL HEALING / {day} July 1993 / {code}
Radio account for {name}, correspondence at {place}. Fresh batteries issued from counter carton; collection signed.
Customer to confirm reception. Stock issue COMPLETE.]],
    "The radio got batteries on paper. The receipt still asks the customer to confirm reception. I'd rather have that confirmation than the tick."),
   page("letter","Silent-radio complaint",
    "A customer note with a pencil rubbing of dates scratched into two batteries.",
    [[{day} July 1993 / {code}
{name}: radio gives nothing. These cells carry the same date marks as the exhausted set I returned.
I paid for a replacement, not for my old batteries to take a trip behind the counter.]],
    "The customer recognised their own marks. That gives this complaint something better than a general suspicion about bad batteries."),
   page("notebook","Counter carton report",
    "A stock note with a deposit slip pasted over an earlier carton label.",
    [[CIRCUITAL HEALING / {day} July 1993 / {code}
{other}: exhausted returns stored in fresh-stock carton. RETURN DEPOSIT slip was entered as STOCK RECEIVED.
Counter issued by carton label. Quarantine remainder for reconciliation, not another sale.]],
    "A return became a receipt, and the carton kept its old label. Two quite tidy entries have sent exhausted batteries back into service."),
   page("receipt","Corrected battery issue",
    "A replacement receipt stapled to a cancelled charge and a short test result.",
    [[CIRCUITAL HEALING / {nextday} July 1993 / {code}
Copy retained for {name} at {place}. Date-marked cells matched to customer's exhausted returns. First issue charge reversed; fresh set supplied.
Bench reception heard on local test signal. No transmission or outside contact tested.
Returns carton relabelled.]],
    "The date marks settle it: the customer bought back their own exhausted cells. Fresh ones passed the shop's local test. That is a repair result, not the outside voice I would have hoped to hear."),
  },
  findings={
   "The customer's date marks challenge what the issue receipt called fresh batteries.",
   "The corrected issue confirms the carton report: returned cells were sold again, then identified and replaced.",
   "An exhausted return was booked as incoming stock and reissued. The shop corrected the sale and tested local reception with fresh cells. The original COMPLETE tick had measured stock movement, not a working radio or contact beyond Knox.",
  },
 },
 bus={
  -- a vehicle that carried something other than its booking
  centralAxis="movement",
  organisation="McCoy Logging Co.",grounding="McCoyLoggingCorp",siteRole="recipient-copy",
  question="Did the reported crew collection carry any passengers?",
  event="Dispatch used the planned crew head count as the completion count after a truck was sent to collect tools instead of workers.",
  outcome="The driver's load check and corrected recipient copy record a tools-only trip and cancel the passenger count.",
  skill="mechanic",observationPart=4,
  professional="The load check names secured tools and no passengers on either leg. It establishes this trip's cargo without treating a route or mileage entry as proof people travelled.",
  parts={
   page("dispatch","Crew collection return",
    "A McCoy transport carbon with a head count neatly copied under COMPLETE.",
    [[McCOY LOGGING CO. / {day} July 1993 / {code}
Collection associated with {place}. Planned crew: {amount}. Return marked COMPLETE, passengers: {amount}.
Prepared by {name} from allocation sheet. Recipient's copy and load query to {place}.]],
    "That is a precise passenger count, but it was copied from a plan. I'd want the driver's return before deciding those people got away."),
   page("notepad","Driver's tool run",
    "A pocket note with CREW crossed out and TOOL CHESTS written above it.",
    [[{day} July 1993 / {code}
{other}: instruction changed before departure. Collect tool chests only. No passenger pickup.
Loaded chests, returned them to mill stores. Dispatch wanted original run number retained so mileage would balance.]],
    "The driver says this became a tool run. The mileage could balance perfectly while the head count stayed entirely imaginary."),
   page("receipt","Stores load check",
    "A mill stores receipt counting tied tool chests, with a passenger box added by hand.",
    [[McCOY Logging Co. / {day} July 1993 / {code}
Tools received from {other}; lashings checked. Driver confirms no passengers on outward or return leg.
Stores received equipment, not crew. Please ask dispatch to stop charging lunch against this receipt.]],
    "The tool chests reached stores. Dispatch has even arranged lunch for the passenger count. I don't suppose an uneaten lunch counts as a survivor."),
   page("dispatch","Corrected recipient transport copy",
    "A correction with the old passenger total ruled through, retained at the named correspondence address.",
    [[{nextday} July 1993 / {code} / recipient copy at {place}
{name}: planned crew total was copied into completion field. Driver and stores confirm tools-only run.
Passengers carried: ZERO. Passenger collection cancelled before departure. Tool movement and mileage remain valid.
Cancel crew lunches; do not cancel tool receipt.]],
    "The corrected return says zero. The truck moved tools while the form moved people, and the original count came from the plan. This is one departure I can account for without inventing its passengers."),
  },
  findings={
   "The driver's changed instruction explains how a completed run could differ from the crew collection on the original carbon.",
   "The correction agrees with the stores load check: the completed movement carried tools and no passengers.",
   "Dispatch copied the planned crew count into a tools-only run. The truck made the trip, but nobody on that passenger plan travelled in it. The correction cancels the count and its lunches while preserving the real equipment movement.",
  },
 },
 mail={
  -- post that travelled where people could not
  centralAxis="movement",
  organisation="US Mail",grounding="MailCarrierAdEkron",siteRole="recipient-copy",
  question="Did the collected letters leave the area?",
  event="A mail bag was collected but refused at transfer after its routing label detached; it was returned to the sender under a completed-delivery code.",
  outcome="The sender's retained return receipt accounts for the unopened bag back at its origin, not delivered to the addressees.",
  skill="police",observationPart=4,
  professional="The sender's signature acknowledges a return. A completed-delivery code without its recipient field would conceal that direction of travel.",
  parts={
   page("receipt","Mail collection receipt",
    "A mail counterfoil with a bag seal number and a completed-collection stamp.",
    [[US MAIL / {day} July 1993 / bag {code}
Correspondence collected from contact {name}, {place}. Seal intact. Transfer address on tied label.
Collection COMPLETE. Sender to retain receipt until delivery or return.]],
    "Someone collected a sealed bag of letters. I want the next receipt. Getting a message out of a house is only the first part of getting it out of here."),
   page("letter","Sender's delivery enquiry",
    "A delivery enquiry with the word COMPLETE copied in a different pen.",
    [[{day} July 1993 / bag {code}
{name}: counter tells me COMPLETE. None of the people expecting these letters have replied.
Please state where the bag went. 'Off our counter' is a direction, but it is not an address.]],
    "The sender asked the useful question. COMPLETE has been working very hard without saying what was completed."),
   page("notepad","Transfer refusal slip",
    "A transfer slip with a loose piece of string threaded through its corner.",
    [[US MAIL / {day} July 1993 / {code}
Transfer clerk {other}: routing label detached. Seal intact; contents not opened to obtain destination.
Return to originating sender against collection book. Record RETURN DELIVERY on receipt.]],
    "The label came off. They could find the sender in the book, so the bag was ordered back. Its seal has been more successful than its journey."),
   page("receipt","Sender's signed bag return",
    "A signed return receipt retained beside the original collection counterfoil.",
    [[US MAIL / {nextday} July 1993 / {code}
Returned unopened to {name} at {place}, seal checked against collection entry. Sender signature received.
Delivery status COMPLETE: return to sender. No delivery to original addressees.
Postage query must be submitted separately from delivery query.]],
    "The bag came back unopened and the sender signed for it. That is the completed delivery. Whatever happened elsewhere, these letters did not reach their intended readers on this attempt."),
  },
  findings={
   "The enquiry asks what the collection stamp leaves unanswered: where the sealed bag went after the counter.",
   "The signed return follows the transfer clerk's instruction and accounts for the unopened bag at its origin.",
   "The routing label detached, transfer refused the bag, and the postal service returned it unopened. COMPLETE described a delivery back to the sender. This attempt carried the letters around a loop, not to the people waiting for them.",
  },
 },
 keys={
  -- a key held by somebody with no reason to hold it
  centralAxis="access",
  organisation="U-Store-It",grounding="UStoreItMuldraugh",siteRole="recipient-copy",
  question="Why was the supplied storage key said to open the wrong unit?",
  event="The storage office renumbered two lockups on paper before changing their door plates and issued a key using the new number.",
  outcome="The tenant's corrected plan matches the key to the existing lock and accounts for the contents without any second tenant or vanished property.",
  skill="carpenter",observationPart=4,
  professional="The check identifies the same lock and key before and after the plate correction. A changed unit number does not by itself establish a changed lock or moved contents.",
  parts={
   page("dispatch","Storage access instruction",
    "A storage-office instruction with a hand-drawn door number beside a key tag.",
    [[U-STORE-IT / {day} July 1993 / {code}
Tenant contact {name}, correspondence at {place}. Your issued key now listed for unit 14. Use revised unit plan.
Copies of plan and access queries to be retained by tenant at {place}.]],
    "The key has acquired a new unit number. I'd want the revised plan before treating it as a key to somebody else's supplies."),
   page("letter","Tenant's wrong-door complaint",
    "A complaint with two door numbers drawn inside rough rectangles.",
    [[{day} July 1993 / {code}
{name}: key opens door marked 6, not door marked 14. My labelled boxes are behind door 6 where I left them.
Desk proposes a replacement key fee. Please try replacing the instruction first.]],
    "The tenant found their own boxes behind the door the key already opened. That makes a replacement key seem an expensive answer to a numbering question."),
   page("notebook","Unit-renumbering work sheet",
    "A site work sheet with OFFICE COMPLETE ticked and DOOR PLATES left blank.",
    [[U-STORE-IT / {day} July 1993 / {code}
{other}: swap unit numbers 6 and 14 in office plan. Physical locks and tenants' contents unchanged.
Door plates to be swapped after paint dries. Tell desk not to issue revised directions until then.]],
    "The office finished before the paint did. The instruction to wait is on the part of the form the desk apparently didn't need."),
   page("receipt","Tenant's corrected access plan",
    "A corrected plan and cancelled key charge, kept with the tenant's access instruction.",
    [[U-STORE-IT / {nextday} July 1993 / {code}
Copy for {name}, {place}: plates 6 and 14 now match revised office plan. Original key tested in original lock; labelled contents checked with tenant.
No contents moved under renumbering. Replacement key charge void; original key retained.]],
    "The same key still opens the same lock. The numbers caught up with the office and the replacement charge was cancelled. This was a wrong instruction, not another person's hidden store."),
  },
  findings={
   "The tenant's complaint puts the supplied instruction beside an observed lock and their own labelled contents.",
   "The corrected plan records completion of the delayed plate swap and confirms the locks and contents stayed put.",
   "The office renumbered the units before changing the door plates. The key was right; its new directions were early. The retained correction accounts for the tenant's property and cancels the proposed replacement fee.",
  },
 },
}
