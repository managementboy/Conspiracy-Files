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
-- Mod-authored incidents, not new canonical events. Ordinary destinations
-- retain customer/contact copies. Only the gallery story requires a gallery.
local function page(kind,title,observation,source,note)
 return {kind=kind,title=title,observation=observation,source=source,note=note}
end
return {
 food={
  -- supplies delivered to a place that could not use them
  centralAxis="movement",
  organisation="Spiffo's Louisville",grounding="SpiffosHiringLouisville",siteRole="recipient-copy",
  question="What did the completed meal delivery actually contain?",
  event="Promotional meal vouchers were counted as meals supplied, although each required a purchase and no food had been delivered.",
  outcome="The recipient's complaint and correction account for the voucher bundle and withdraw the completed food-delivery claim.",
  skill="medical",observationPart=4,
  professional="The correction explicitly records no food supplied. A voucher total cannot be used as a meal count, regardless of what the delivery heading says.",
  parts={
   page("dispatch","Meals supplied return",
    "A restaurant dispatch carbon with a meal total beside a small envelope weight.",
    [[SPIFFO'S LOUISVILLE / {day} July 1993 / {code}
{amount} meals supplied to contact {name}, correspondence at {place}. Delivery completed by envelope.
Community promotion account. Recipient copy and queries retained at {place}.]],
    "Meals delivered by envelope would solve several packing problems. I'd like to see what the recipient actually received before counting on this as a food run."),
   page("letter","Recipient's voucher complaint",
    "A complaint with one unused voucher pinned through its purchase condition.",
    [[{day} July 1993 / {code}
{name}: envelope contains {amount} vouchers, each for a meal with another meal purchased. No food received.
We asked what you could supply. We have instead learned what we could buy twice.]],
    "The envelope contained an offer to spend money. That explains its weight, though it leaves the original request rather hungry."),
   page("notepad","Promotion counting instruction",
    "A promotion desk instruction with ISSUED printed above two incompatible column headings.",
    [[SPIFFO'S LOUISVILLE / {day} July 1993 / {code}
{other}: count each meal voucher distributed as MEAL ISSUED in promotion return. Redemption is a separate counter total.
No kitchen order accompanies this dispatch.]],
    "Promotion counts the promise; the kitchen counts the order. The column heading has managed to feed people neither department has seen."),
   page("receipt","Recipient's meal-count correction",
    "A corrected return attached to the unused voucher bundle.",
    [[{nextday} July 1993 / {code} / copy retained at {place}
Spiffo's Louisville confirms {amount} promotional vouchers dispatched, no prepared meals. No vouchers redeemed on this account.
MEALS SUPPLIED replaced with VOUCHERS DISTRIBUTED. Recipient's objection accepted.
Promotion distribution target remains met.]],
    "No meals went out under this reference. The correction says so, while preserving the promotion's successful day. I'd keep the correction where somebody might otherwise find only the first carbon."),
  },
  findings={
   "The pinned voucher explains how the original return claimed meals delivered in an envelope.",
   "The correction separates the promotion's issue count from the kitchen supply, exactly the split described in the desk instruction.",
   "A bundle of purchase-dependent vouchers became a completed food delivery in the promotion return. The recipient challenged it and the correction records no meals supplied or redeemed. This paper trail accounts for an offer, not a stock of food waiting here.",
  },
 },
 power={
  -- power kept on for premises officially closed
  centralAxis="access",
  organisation="Circuital Healing",grounding="CircuitalHealing",siteRole="recipient-copy",
  question="What was still powered after the reported disconnection?",
  event="A customer mistook a serviced battery-backed radio's lit dial for evidence that the building's mains supply had returned.",
  outcome="A signed customer check accounts for the light on the radio's battery supply while the disconnected mains lead remained unplugged.",
  skill="electrician",observationPart=4,
  professional="The check describes a separate battery supply. The lit dial and the building's mains connection answer different questions; the record proves only the radio's local test.",
  parts={
   page("dispatch","Light after disconnection report",
    "A customer message referring to a light seen through a window after power was cut.",
    [[{day} July 1993 / {code}
{name}, contact for {place}: mains supply disconnected; radio dial lit later that evening. Reported as POWER BACK.
Circuital Healing service query. Retain response with equipment copies at {place}.]],
    "A light appeared after the reported cut. I'd understand taking that as good news. I want to know what was lighting it before making the building into a working supply."),
   page("receipt","Backup-power service receipt",
    "A radio receipt listing a battery compartment repair separately from its mains lead.",
    [[CIRCUITAL HEALING / {day} July 1993 / {code}
Battery contacts repaired; fresh backup cells fitted. Dial illumination tested on batteries by {other}.
Mains operation not tested at customer's address. Demonstration charge: one power source only.]],
    "The service receipt gives the radio its own supply. Even the demonstration charge has been careful about which kind of power was restored."),
   page("letter","Customer's plug check",
    "A second message with a drawing of an unplugged mains lead.",
    [[{day} July 1993 / {code}
{name}: checked lead after your call. Mains plug was still tied to handle from collection. Dial lights on battery setting; goes dark when battery connection removed.
Please correct my earlier report.]],
    "The customer checked the plug and the battery setting. That is considerably more useful than somebody at a desk stamping POWER BACK a second time."),
   page("dispatch","Power-report correction",
    "A correction retained with the original report and the radio receipt.",
    [[CIRCUITAL HEALING / {nextday} July 1993 / {code}
Customer copy, {place}: visible dial light accounted for by serviced battery supply. Customer confirms mains lead remained unplugged throughout observation.
POWER BACK report withdrawn. No restoration of building supply established by this job.]],
    "The light was real. The conclusion about the building was wrong. This file explains the hopeful window without turning it into evidence of a secretly powered building."),
  },
  findings={
   "The service receipt gives the reported dial light a power source independent of the building's mains.",
   "The correction accepts the customer's plug check and withdraws the claim of restored building power.",
   "A battery-powered dial was mistaken for restored mains electricity. The service receipt, plug check and correction account for the light. The business repaired a radio; the first report accidentally repaired a whole building on paper.",
  },
 },
 names={
  -- a name on a list nobody will account for
  centralAxis="absence",
  organisation="Spiffo's Louisville",grounding="SpiffosHiringLouisville",siteRole="recipient-copy",
  question="Why did the roster count somebody who never checked in?",
  event="An entertainer's stage assignment, Spiffo, was copied into the head-count column as a second worker beside the person wearing the costume.",
  outcome="A signed roster correction identifies the performer and costume assignment as one person and cancels the extra attendance entry.",
  skill="police",observationPart=4,
  professional="The check-in and costume issue share one employee signature. The correction explicitly removes the role counted as a second person; it does not establish any later whereabouts.",
  parts={
   page("dispatch","Entertainer attendance return",
    "An event staffing return with a costumed character listed beside the performer's name.",
    [[SPIFFO'S LOUISVILLE / {day} July 1993 / {code}
Event contact {name}, correspondence at {place}. Staff supplied: {other}; SPIFFO.
Head count: TWO. Signed return requested for both entries; correspondence retained by contact.]],
    "The return counts two. One name belongs to a restaurant mascot. I'd want the sign-in sheet before looking for a second person."),
   page("letter","Contact's missing-signature query",
    "A returned attendance form with only one signature and an annoyed note.",
    [[{day} July 1993 / {code}
{name}: one entertainer checked in, put on the costume, performed, then changed back. Same person signed out.
Your form asks for Spiffo's separate signature. Is a paw print acceptable or should we ask the costume?]],
    "The contact watched one person arrive and leave. The second signature seems to be waiting for the costume to develop clerical skills."),
   page("receipt","Costume issue sheet",
    "A costume issue-and-return slip signed with the same employee name twice.",
    [[SPIFFO'S LOUISVILLE / {day} July 1993 / {code}
Spiffo costume issued to {other}; returned by {other}. Stage assignment: SPIFFO.
Supervisor: assignment column copied to event return. It is not a second employee.]],
    "The costume sheet explains the extra name. The performer returned both themselves and the costume, which is more than the attendance form seems able to accommodate."),
   page("dispatch","Corrected entertainer count",
    "A corrected return kept with the contact's single-signature form.",
    [[SPIFFO'S LOUISVILLE / {nextday} July 1993 / {code}
Copy to {name}, {place}: one performer, {other}, also recorded under stage assignment SPIFFO. Head count amended TWO to ONE.
No second worker assigned or missing. Costume return complete. Remove duplicate meal allowance.]],
    "The missing worker was a stage assignment counted twice. This correction accounts for that roster and its spare meal allowance. It says nothing about where the real performer went after signing out."),
  },
  findings={
   "The contact's account challenges the two-person total with one observed arrival, costume change and departure.",
   "The correction matches the costume sheet: the stage assignment belongs to the named performer, not a second employee.",
   "The roster turned a performer and their costume role into two workers. The contact and costume sheet let the office correct it to one. There is no missing second person in this entry; an inflated head count is not evidence of a departure.",
  },
 },
 road={
  -- a route closed to some traffic and not to others
  centralAxis="movement",
  organisation="McCoy Logging Co.",grounding="McCoyLoggingCorp",siteRole="recipient-copy",
  question="Why was one truck admitted after the local access closure?",
  event="A closed yard admitted its driver solely to return the gate's own signed closure paperwork, under a standing document-return exception.",
  outcome="The gate return identifies one inward paperwork trip and the same truck's empty return, with no passengers or onward passage authorised.",
  skill="police",observationPart=4,
  professional="The pass covers one named yard entry and exit. It is not an outside-road permit, and the log records no onward route or passenger authority.",
  parts={
   page("dispatch","Closed-yard access notice",
    "A McCoy access notice with a later vehicle entry copied into the margin.",
    [[McCOY LOGGING CO. / {day} July 1993 / {code}
Yard entry closed to collections after 20:00. Contact copies routed through {name} at {place}.
Margin query: truck admitted 21:15. Obtain guard's return before circulating notice again.]],
    "A truck got into a closed yard. That could be a useful exception, or a very small one. I'd want the pass before imagining it led any further."),
   page("letter","Driver's document-return instruction",
    "A driver's instruction with RETURN SIGNED ORIGINAL stamped twice.",
    [[{day} July 1993 / {code}
{other}: take signed closure notice back to issuing yard. Gate cannot close its file without the original.
Use document-return exception. Collect no cargo; carry no passengers.]],
    "The gate needs a vehicle to bring back proof that vehicles cannot enter. This is either a very narrow exception or an excellent career for a piece of paper."),
   page("receipt","Yard gate entry slip",
    "A gate slip with PAPERWORK entered in both load columns.",
    [[McCOY LOGGING CO. / {day} July 1993 / {code}
21:15, driver {other} admitted under standing signed-document-return exception. Closure original received by gate.
Truck left same gate empty at 21:22. No passenger count; passenger authority explicitly NONE.]],
    "Seven minutes to deliver the signed notice and leave again. The pass has none of the features I'd want from a route out."),
   page("dispatch","Contact's access reconciliation",
    "A gate reconciliation retained with the contact's closure notice.",
    [[{nextday} July 1993 / {code} / copy at {place}
McCoy gate confirms disputed entry: {other}, closure-original return only. No collection, onward movement or passenger service under that pass.
Access notice stands. Signed original now on file; further copies need not be returned by vehicle.]],
    "The exception delivered the gate's own paperwork. The truck went back out empty, and somebody finally stopped asking for more originals. This explains that entry without offering me a passage through the wider closures."),
  },
  findings={
   "The return instruction identifies an exception relevant to the truck entry written beside the closure notice.",
   "The contact's reconciliation matches the gate slip: one paperwork delivery, followed by an empty exit through the same gate.",
   "The driver was admitted to return the signed closure notice that the gate needed to close its file. The records account for that short trip and deny cargo, passenger or onward authority. The apparent escape route was a paperwork return.",
  },
 },
 medicine={
  -- medical stock drawn before the public emergency
  centralAxis="protection",
  organisation="Crossroads Medical Center",grounding="CrossRoadsMall",siteRole="recipient-copy",
  question="Did the medical delivery contain supplies or only case packs?",
  event="A referral desk ordered patient-record packs, but the courier's generic MEDICAL SUPPLIES heading was copied into a recipient's supply tally.",
  outcome="The sealed dispatch manifest and recipient correction identify blank referral forms, with no treatment supplies in that consignment.",
  skill="medical",observationPart=4,
  professional="The manifest lists blank record packs. They do not establish treatment, diagnoses, patient admission or a medicine supply, whatever the courier's category says.",
  parts={
   page("dispatch","Medical supplies dispatch carbon",
    "A courier carbon with MEDICAL SUPPLIES printed above a pack count.",
    [[CROSSROADS MEDICAL CENTER / {day} July 1993 / {code}
{amount} packs dispatched for contact {name}, correspondence at {place}. Courier category MEDICAL SUPPLIES.
Recipient to acknowledge sealed bundle. Retain detailed manifest with local copy.]],
    "Medical supplies sounds promising. The carbon counts packs without naming their contents. I'd look for the detailed manifest before turning a courier heading into help."),
   page("letter","Recipient's contents query",
    "A receiving query with a blank referral sheet enclosed as a sample.",
    [[{day} July 1993 / {code}
{name}: bundle contains forms. Our tally now says medical supplies received. People are asking what they can collect.
Please give us a description that cannot be mistaken for something useful in a treatment cupboard.]],
    "The recipient got forms and inherited the questions. The tally has more confidence in the delivery than the person who opened it."),
   page("receipt","Referral-pack packing manifest",
    "A manifest listing the contents of each sealed pack, down to its paper fastening.",
    [[CROSSROADS MEDICAL CENTER / {day} July 1993 / {code}
Packed by {other}: {amount} referral-record packs. Each: blank referral form, copy sheet, paper fastener.
Treatment supplies: NONE. Ordered by records desk. Courier category cannot be edited on this form.]],
    "The fasteners get their own entry; treatment supplies get NONE. The contents were quite precisely recorded before the courier's heading made them into a different delivery."),
   page("dispatch","Recipient's medical-tally correction",
    "A corrected local tally attached to the opened bundle wrapper.",
    [[{nextday} July 1993 / {code} / retained at {place}
{name}: seal matched manifest; {amount} blank referral-record packs received from Crossroads Medical Center. No treatment supplies received under this reference.
Local supply tally corrected. Records desk requests completed receipt form before issuing further forms.]],
    "The bundle was exactly what the records desk ordered. It was not what the local supply tally promised. At least the next batch of forms is being held up by a missing form."),
  },
  findings={
   "The enclosed blank sheet gives the recipient's contents query more weight than the generic category on the courier carbon.",
   "The sealed manifest and corrected tally agree on the pack contents: referral forms and fasteners, not treatment supplies.",
   "Blank referral packs were reported as medical supplies because that was the courier category. The manifest and receiving check account for every pack and correct the local tally. This delivery offered paperwork for requesting help, not the help people thought had arrived.",
  },
 },
 repairs={
  -- a repair recorded that the part does not show
  centralAxis="records",
  organisation="Lenny's Car Repair",grounding="LennysCarRepair",siteRole="recipient-copy",
  question="Was the vehicle available when its job was marked released?",
  event="A parts-return invoice received the workshop's release stamp, and its customer-facing copy omitted the word PARTS.",
  outcome="The signed correction accounts for returned wrong-fit parts while the vehicle remained in the bay awaiting replacements.",
  skill="mechanic",observationPart=4,
  professional="The correction distinguishes parts released to a supplier from a vehicle released to its driver. It records the vehicle still awaiting work at that time, not its condition today.",
  parts={
   page("dispatch","Workshop release carbon",
    "A workshop carbon whose release stamp runs over a truncated description.",
    [[LENNY'S CAR REPAIR / {day} July 1993 / {code}
Customer contact {name}, correspondence at {place}. Job movement: RELEASED, 12:00.
Collection queries quote this number. Retain complete job sheet at correspondence address.]],
    "Something was released at noon. That is not quite the same as a car ready to collect, however much the stamp invites me to read it that way."),
   page("letter","Recovery driver's waiting note",
    "A driver's complaint about being sent to collect a vehicle still in the bay.",
    [[{day} July 1993 / {code}
{name}: sent driver on strength of release copy. Car still in bay; work incomplete. Desk says the return went at noon.
Please identify what returned before charging another collection call.]],
    "The driver found the car still waiting. The desk is answering a question about a return instead. I suspect the missing noun is expensive."),
   page("receipt","Wrong-fit parts return",
    "A supplier return counterfoil with PARTS RELEASED printed in full.",
    [[LENNY'S CAR REPAIR / {day} July 1993 / {code}
12:00: wrong-fit replacement parts released to supplier. {other} signs carrier handover.
Vehicle remains in bay awaiting correct parts. No vehicle release authorised.
Carbon descriptor lost first word under stamp.]],
    "The parts left, not the vehicle. The full counterfoil even identifies the word the stamp hid. That is a remarkably small place to lose an entire collection run."),
   page("dispatch","Customer's release correction",
    "A complete job copy retained with a waived collection charge.",
    [[LENNY'S CAR REPAIR / {nextday} July 1993 / {code}
Copy for {name}, {place}: noon release was wrong-fit parts to supplier. Vehicle remained in bay awaiting replacements; customer collection instruction withdrawn.
Wasted collection call not charged. Correct-parts arrival not recorded in this bundle.]],
    "The garage has corrected what left and waived the wasted call. It hadn't released the vehicle at the time of this copy. I cannot turn that old stamp into a working car or a completed departure."),
  },
  findings={
   "The waiting note challenges the apparent vehicle release: the customer sent a driver, but the car was still in the bay.",
   "The correction matches the complete supplier counterfoil. The released item was a parts return, not the vehicle.",
   "The word PARTS disappeared from a release description under its stamp. That sent a driver for a vehicle still awaiting replacements. The retained correction explains the false collection instruction and waives the wasted call; it records no completed vehicle departure.",
  },
 },
 housing={
  -- a property entered by somebody unaccounted for
  centralAxis="access",
  organisation="Red Oak Apartments",grounding="RedOakApartments",siteRole="recipient-copy",
  question="Why did a vacant-unit list contradict the people answering the door?",
  event="A rent-free staff stay was entered as a zero-rent unit and then copied into a vacancy list used by a visiting contractor.",
  outcome="The signed correction records the authorised occupants and withdraws the vacant-unit instruction before boarding work began.",
  skill="carpenter",observationPart=4,
  professional="The contractor's sheet says work was stopped before boarding. It documents a refused instruction, not proof that an occupied unit was sealed or that its door remains usable now.",
  parts={
   page("dispatch","Vacant-unit instruction",
    "An apartment-office carbon copied from a rent ledger, with VACANT stamped over ZERO.",
    [[RED OAK APARTMENTS / {day} July 1993 / {code}
Unit account handled by {name}; correspondence retained at {place}.
Rent due: ZERO. Entered on vacant-unit list for contractor's boarding estimate.
Confirm clear before work.]],
    "Zero rent has become a vacant unit. I would want someone to knock before treating that as a count of the people inside."),
   page("letter","Contractor's occupied-door report",
    "A contractor's refused-work note with two occupants' initials in its margin.",
    [[{day} July 1993 / {code}
{other}: occupants answered and showed staff-stay authorisation. No boarding begun. Estimate returned pending office correction.
They would prefer their permitted stay to include a door they can continue using.]],
    "The contractor knocked and stopped. Whatever the office thought vacant meant, it met people who had permission to be there."),
   page("receipt","Rent-free stay authorisation",
    "An apartment office authorisation with CHARGE WAIVED circled above an occupied-room entry.",
    [[RED OAK APARTMENTS / {day} July 1993 / {code}
Temporary staff stay authorised by {name}. Rent waived; unit occupied. Enter zero in rent column, not vacancy column.
Authority remains valid for stated stay. Contractor copy attached.]],
    "The rent was waived, not the occupants. The authorisation even explains which column should get the zero. Apparently it needed to explain it louder."),
   page("dispatch","Contact's vacancy correction",
    "A correction retained by the account contact, with the boarding estimate cancelled.",
    [[RED OAK APARTMENTS / {nextday} July 1993 / {code}
Copy retained at {place}. Zero-rent entry wrongly copied as vacancy. Authorised staff occupants confirmed; unit removed from vacant list.
Boarding estimate cancelled before work. Rent remains waived; do not reopen charge to avoid another zero.]],
    "The occupants were authorised and the contractor never boarded them in. The office has corrected its vacancy list without solving the problem by charging rent. That last instruction sounds painfully necessary."),
  },
  findings={
   "The contractor's answered knock contradicts the vacant-unit instruction without requiring anyone to have moved between entries.",
   "The correction preserves the rent-free authorisation and identifies the zero copied into the wrong list.",
   "A zero in a rent ledger became a vacancy instruction. The contractor found authorised occupants and stopped, and the office cancelled the estimate. This list's apparent disappearance was an accounting error caught before the work.",
  },
 },
 waste={
  -- material disposed of under precautions nobody explained
  centralAxis="protection",
  organisation="Scarlet Oak Distillery",grounding="ScarletOakDistillery",siteRole="recipient-copy",
  question="What happened to the supposedly accepted sealed load?",
  event="Empty returnable sample bottles were described as routine waste to avoid a commercial return fee; the yard refused them and the driver brought the sealed load back.",
  outcome="The contact's return check identifies the bottles and accounts for the whole load back in its original custody.",
  skill="medical",observationPart=4,
  professional="The return check identifies empty bottles and intact seals. Sealed packaging alone would not identify the contents or establish contamination; here there is an actual counted contents record.",
  parts={
   page("dispatch","Sealed-load disposal carbon",
    "A disposal carbon stamped ACCEPTED before its receiving signature was filled.",
    [[SCARLET OAK DISTILLERY / {day} July 1993 / {code}
Contact {name}, retained correspondence at {place}. Sealed load entered as routine waste, yard acceptance anticipated.
Office return stamped ACCEPTED for daily total. Receiving signature to follow.]],
    "The office accepted its own load in advance. I'd want the gate slip before reading this as anything having been cleared away."),
   page("letter","Driver's refusal report",
    "A driver report with the yard's unused signature box outlined in pencil.",
    [[{day} July 1993 / {code}
{other}: yard refused commercial returnable bottles under routine-waste category. Load stayed aboard, seals intact.
Contact instructed return, not another yard. Refusal fee queried.]],
    "The driver names bottles and says the yard took nothing. The missing signature suddenly seems more informative than the acceptance stamp."),
   page("receipt","Sample-bottle return order",
    "A dispatch order whose commercial-return category has been crossed out.",
    [[SCARLET OAK DISTILLERY / {day} July 1993 / {code}
Empty sample bottles, counted and sealed for commercial return. {name}: book as routine waste to avoid commercial fee.
Driver to return entire load if classification refused. Do not break seals for sorting.]],
    "The cheap category was chosen before the driver left. They had even planned how to bring it all back if the yard could read its own tariff."),
   page("receipt","Contact's sealed-load return check",
    "A signed bottle count retained with the rejected disposal carbon.",
    [[SCARLET OAK DISTILLERY / {nextday} July 1993 / {code}
Copy retained at {place}: entire load returned by {other}. Original seals checked, empty bottles recounted against return order. No disposal occurred.
ACCEPTED cancelled. Commercial return charge still due; refusal fee added for review.]],
    "The bottles came back and the cheap disposal never happened. The return count accounts for the load. The attempt to save one fee has at least created a second fee to discuss."),
  },
  findings={
   "The driver's refusal report disputes the office's advance acceptance stamp and accounts for the load still on the vehicle.",
   "The return check matches the original bottle order and its instruction to bring the whole load back if refused.",
   "Commercial bottle returns were relabelled routine waste to avoid a fee. The yard refused that category, and the sealed load came back intact. The acceptance carbon described an office target, not a completed disposal or an unidentified vanished load.",
  },
 },
 gallery={
  -- a catalogue entry changed after the crates moved
  centralAxis="records",
  organisation="Art Gallery of Louisville",grounding="ArtGalleryofLouisville",siteRole="gallery",
  question="Had the gallery's priority removal already taken the art to safety?",
  event="A packing inventory of empty transport cases was moved to store 4; a copied removal heading omitted EMPTY CASES and made the transfer look like evacuation of the works.",
  outcome="The gallery's reconciliation identifies the moved cases, the internal store and the works still on the art inventory at that check.",
  skill="police",observationPart=4,
  professional="The reconciliation distinguishes packing inventory G14 from the works inventory. The shared W-114 is a job reference, not a verified warden identity or an evacuation authority.",
  parts={
   page("dispatch","Gallery priority removal carbon",
    "A priority removal carbon with its stock description cut short by the copy margin.",
    [[ART GALLERY OF LOUISVILLE / {day} July 1993
Job W-114 / circulation {code}. G14 inventory removed to SHELTER 4. Priority handling. Prepared {name}.
Full packing and works reconciliation retained at the gallery.
Description continues on original.]],
    "Natalie Sigmundsson's map asks someone to save the gallery's art. This old carbon sounds as though somebody moved it already. I want the full description before deciding her request was answered."),
   page("letter","Gallery packing request",
    "A stores copy with EMPTY CASES repeated beside the packing schedule.",
    [[ART GALLERY OF LOUISVILLE / {day} July 1993 / W-114 / {code}
G14: empty transport cases reserved for works, including the Ashling Dwyer display. Move cases under cover pending packing team.
Do not enter paintings as packed because their cases are ready. Works remain on separate inventory.]],
    "The cases were ready; the paintings weren't packed. Somebody at stores had already thought of the mistake the carbon seems to invite."),
   page("notepad","Porter's internal transfer slip",
    "A porter slip with STORE corrected to SHELTER in a different hand.",
    [[{day} July 1993 / W-114 / {code}
{other}: empty G14 cases moved by handcart to covered store 4 inside gallery. No loading vehicle used.
Stores heading now SHELTER to match protection grant form. Do not carry visitors on cart.]],
    "Shelter 4 was an internal store with a new heading. The handcart instruction is clear about passengers. This is looking less like an evacuation route and more like a successful grant form."),
   page("receipt","Gallery inventory reconciliation",
    "A gallery check laid out in two columns: transport cases and works of art.",
    [[ART GALLERY OF LOUISVILLE / {nextday} July 1993 / W-114 / {code}
G14 empty cases: all accounted for in internal covered store 4. Original removal description EMPTY CASES lost on circulation carbon.
Works inventory, including Ashling Dwyer display: all present at check, none packed or removed under W-114.
Packing job remains open. Case-protection grant stage marked complete.]],
    "The cases reached shelter. The art was still here at this check, waiting to be packed. This file does not make Natalie's request redundant; it shows how the packaging was saved first and a stage called complete."),
  },
  findings={
   "The packing request identifies G14 as empty transport cases, which the cropped priority-removal carbon failed to say.",
   "The inventory check confirms the porter's internal handcart transfer and distinguishes the protected cases from the still-unpacked works.",
   "The priority removal moved empty cases into the gallery's own covered store. A cropped description and SHELTER heading made it sound like the art had escaped. The works were still unpacked at the check. Natalie's plea concerns something this completed grant stage had not accomplished.",
  },
 },
}
