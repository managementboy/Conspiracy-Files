-- Mod-authored disputes using verified vanilla activities. Copies travel to
-- A/B; those sites do not become factories, shops or tourist attractions.
local grounding={
 ["Circuital Healing"]="CircuitalHealing", ["Lenny's Car Repair"]="LennysCarRepair",
 ["Hobbs & Perkins"]="HobbsandPerkinsHardware", ["Lectromax Manufacturing"]="LectromaxManufacturingJobAd",
 ["Louisville Bruiser"]="LouisvilleBruiser", ["CGE Corp"]="OldCGECorpBuilding",
 ["March Ridge bunker tours"]="ColdWarBunker",
}
local function document(kind,title,observation,source,note)
 return {kind=kind,title=title,observation=observation,source=source,note=note}
end
-- THE MIDDLE RECORD IS A THING, NOT A PAGE.
--
-- Measured 2026-09-23: twelve of fourteen evidence kinds were paper, and of
-- 4,547 catalogued Project Zomboid objects the scenarios used twelve. The
-- design vision says the world carries the story and paper establishes names,
-- dates and claims - so the record that CONTRADICTS the opening claim is now
-- the object itself, and the paper around it keeps its proper job.
--
-- An object carries no readable text: `source` says what is visibly true of
-- it, never what it says, because nothing is written on a starter motor.
-- EvidenceKinds.fits caps the whole rendered body at 240 characters for
-- exactly this reason - a page of prose about an object would be the mod
-- explaining the object, which is the one thing it must not do.
local function object(kind,title,observation,source,note,wear)
 return {kind=kind,title=title,observation=observation,source=source,note=note,wear=wear}
end
local function scenario(t)
 t.grounding=assert(grounding[t.organisation])
 t.essential={"claim","response","review"};t.optional=t.optional or {}
 -- The three relations the organiser can show ("Does not match", "Agrees
 -- with", "Adds context to") were all filed as recontextualises here, so no
 -- two sources in a generated case could ever be seen to disagree. The shape
 -- these stories actually have is: the second record contradicts the first
 -- account, the third confirms the second, and the three together explain.
 -- A scenario whose middle record does something else says so with `kinds`.
 local K=t.kinds or {"disputes-delivery","corroborates","recontextualises"}
 t.comparisons={
  {requires={"claim","response"},from="response",to="claim",kind=K[1],text=t.findings[1]},
  {requires={"response","review"},from="review",to="response",kind=K[2],text=t.findings[2]},
  {requires={"claim","response","review"},from="review",to="claim",kind=K[3],text=t.findings[3]},
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
 for _,f in ipairs(t.extraFindings or {}) do t.comparisons[#t.comparisons+1]=f end
 t.findings=nil;t.extraFindings=nil;t.kinds=nil
 return t
end
return {
 ["returned-cleaner"]={
  scenario{
   organisation="Circuital Healing",
   question="Why did the returned radio look newer than the one sent in?",
   centralAxis="movement",
   conflict="The receipt has {P1} carrying their own radio out of the shop. The serial check has both customers going home with the wrong set.",
   event="A cleaner removed two paper job labels, and the radios were handed back to the wrong customers.",
   outcome="Serial-number checks identified the exchanged radios and both customers collected their own sets.",
   unresolved="The correction doesn't say who authorised collecting another handling fee.",
   readings={"They mixed up two radios after cleaning.","Charging again made their mistake somebody else's expense."},
   anchors={
    claim=document("receipt","Cleaned-radio collection / {CODE}",
     "A Circuital Healing receipt with a pencilled complaint beneath CLEANED AND RETURNED.",
     [[CIRCUITAL HEALING / {DATE1}
Job {CODE}: radio cleaned, volume control serviced, collected by {P1}.
Customer note: mine had a cracked tuning knob. This one hasn't. Sounds better, though.
Collection query and workshop copies retained at {B}.]],
     "A clean case could hide a scratch. It would take more than a cloth to mend a cracked knob. I'd check the serial number before congratulating the repair."),
    response=object("HamRadio1","Radio, marked {P1}",
     "A serviced radio with {P1}'s name taped to it.",
     "Its serial does not match the intake card in the same box.",
     "The name is on it. Whether the radio is theirs is the question.","good"),
    review=document("receipt","Serial-number exchange / {CODE}",
     "Two collection signatures on a correction slip, with a fresh fee stamped below them.",
     [[CIRCUITAL HEALING / {DATE3}
{CODE}: serials matched to original intake cards. Sets had been exchanged at collection. Both owners now signed for their own radios.
No new repair performed. New handling fee entered for second collection.
Complaint about fee referred to manager.
Checked against the intake cards by {P2}.]],
     "Both sets reached their owners. The second fee stayed behind to meet the manager. Good that something still needs fixing."),
   },
   findings={
    "The receipt has {P1} collecting their own radio. The set still on the bench carries another customer's tag and an uncracked knob.",
    "The serial checks confirm the exchange the mismatched tag implied, and the owners sign for their own sets.",
    "The radio looked newer because it belonged to someone else. The serial checks put both sets back with their owners. A second handling fee turned the correction into another customer complaint.",
   },
   optional={{key="other-owner",role="person",kind="letter",title="Other customer's note / {CODE}",
    observation="A customer note with a station frequency written in the margin.",
    source=[[{DATE2} / radio exchange {CODE}
I accept that the cracked knob belongs to the other customer. I would still like it recorded that their radio got the ball game more clearly.
Please do not adjust mine to match. Your last adjustment took two visits.]],
    note="The other customer wants their own radio back, with a written objection to how well it works. I can follow that."}},
   extraFindings={{requires={"review","other-owner"},from="other-owner",to="review",kind="recontextualises",
    text="The exchange receipt settles ownership. The other customer's note explains why returning the right set wasn't quite the same as getting a satisfied customer."}},
  },
  scenario{
   organisation="Lenny's Car Repair",
   question="Was the spotless starter motor actually repaired?",
   centralAxis="records",
   optional={{key="parts-card",role="records",kind="businesscard",title="Parts supplier's card / {CODE}",
    observation="A trade card wedged under the spine of the bench book.",
    source="AUTO ELECTRIC SUPPLY\nContact sets: ask for {P2}.",
    note="Somebody kept the supplier's card with this job. The part was always going to come from outside."}},
   extraFindings={{requires={"response","parts-card"},from="parts-card",to="response",kind="corroborates",
    text="The supplier's card sits with the bench entry that says the contact set had to be ordered."}},
   conflict="The collection slip charged {P1} for a starter marked ready. The repeat test finds the same fault it went in with.",
   event="A cleaned starter was moved to the collection shelf before its failed electrical test was entered on the job card.",
   outcome="The original starter was returned unrepaired; a repeat bench test caught the fault and the collection charge was voided.",
   unresolved="The replacement part is ordered, but no fitted-part record is present.",
   readings={"A ready-for-test tag became a ready-for-collection tag.","The counter collected money before checking the job."},
   anchors={
    claim=document("receipt","Starter collection charge / {CODE}",
     "A garage receipt clipped to a customer note about the newly polished metal.",
     [[LENNY'S CAR REPAIR / {DATE1}
{CODE}: starter assembly cleaned; READY ticked. Collection charge received from {P1}.
Customer note: looks new. Still only clicks.
Returned-job copies and bench report: {B}.]],
     "Clean enough to collect, apparently. {P1}'s note says it still won't start the engine. The tick has done more travelling than the car."),
    response=object("Saw","Bench saw, marked {P1}",
     "The bench saw from the job, wiped clean, tagged {P1}.",
     "The blade is bright and the teeth are still blunt.",
     "Cleaned, certainly. Repaired is a different claim.","poor"),
    review=document("notepad","Returned-job correction / {CODE}",
     "A repeat-test result attached to a voided collection charge.",
     [[LENNY'S CAR REPAIR / {DATE3}
{CODE}: repeat test reproduces original fault. Collection charge voided; job reopened pending replacement contacts.
Counter instruction: read whole tray label before calling customer.
Part ordered. Do not mark READY while ordering.]],
     "The repeat test finds the fault, and the charge is void. The part is still only ordered. This time the word READY has been put under supervision."),
   },
   findings={
    "The collection slip is ticked READY and paid. The saw itself still carries its failed test tag and its blunt teeth.",
    "The repeat test backs what the saw shows: the same fault remains and no sharpening was done.",
    "Cleaning made the starter look repaired; a shortened label made the counter treat it as repaired. The retest reopened the job and voided the charge. I have no record of the replacement contacts being fitted.",
   },
  },
 },
 ["two-crates-one-number"]={
  scenario{
   organisation="Hobbs & Perkins",
   question="Why were two crate deposits charged for one crate number?",
   centralAxis="records",
   optional={{key="yard-ticket",role="records",kind="ticket",title="Loading-bay ticket / {CODE}",
    observation="A parking ticket folded into the driver's round book.",
    source="MULDRAUGH - loading bay. Issued {DATE2}, 08:15.",
    note="The driver stood at that bay long enough to be fined for it."}},
   extraFindings={{requires={"response","yard-ticket"},from="yard-ticket",to="response",kind="corroborates",
    text="The ticket puts the round at the loading bay on the morning the crate came back."}},
   event="An empty returnable crate was collected, refilled and delivered again before its first deposit was credited.",
   outcome="Two deliveries used the same physical crate; the earlier return was verified and its deposit credited.",
   unresolved="The account correction does not show whether other delayed returns were checked.",
   readings={"The return receipt arrived after the next delivery.","The store charged faster than it credited."},
   anchors={
    claim=document("receipt","Double crate deposit / {CODE}",
     "An account statement listing crate 47 twice, with a deposit against each entry.",
     [[HOBBS & PERKINS / {DATE1}
Account {CODE} / {P1}: two deliveries, returnable crate 47 entered on each. Two deposits charged; neither return credited.
Retained delivery and return copies: {B}.]],
     "Two deposits on number 47. Either there were two crates with one number or one crate has been working very hard."),
    response=object("Mov_MilitaryCrate","Crate 47, marked {P1}",
     "One crate stencilled 47, chalked twice, signed {P1}.",
     "Both chalk marks are in one hand; the runner is mended.",
     "One crate went out twice, or two were never here.","fair"),
    review=document("receipt","Crate-return credit / {CODE}",
     "A credit entry with the crate's damaged runner sketched beside it.",
     [[HOBBS & PERKINS / {DATE3}
{CODE}: loading record and wired runner identify the same crate 47 on both deliveries. Earlier return accepted; first deposit credited. Second deposit remains against crate now with customer.
Do not issue a second crate to balance the statement.
Deposit ledger reconciled by {P2}.]],
     "The first deposit is credited. One crate and one remaining deposit. Someone had to forbid solving the accounts with another crate."),
   },
   findings={
    "Accounts hold deposits on two crates numbered 47. Only one crate numbered 47 is here, and it carries both chalk marks.",
    "The loading record and the crate's repaired runner corroborate the reuse, and the first deposit is credited.",
    "There were two deliveries, not two crates. Number 47 made both trips while its first return slip stayed under a seat. The account now carries only the deposit for the crate still with {P1}.",
   },
  },
  scenario{
   organisation="Lectromax Manufacturing",
   question="Why did a saw-blade delivery include a crate of unfinished blanks?",
   centralAxis="movement",
   optional={{key="press-hammer",role="records",kind="BallPeenHammer",wear="the face pitted from use",
    title="Ball-peen hammer, marked {P1}",
    observation="A hammer left on top of the crate labels.",
    source="A name is stamped into the handle: {P1}.",
    note="A shaping bench tool, marked, sitting with the dispatch paperwork."}},
   event="Finished blades and unfinished blanks carried the same job number, and both crates were dispatched as finished stock.",
   outcome="The blanks were traced to a misread job label and returned to the press queue; the customer still lacked part of the order.",
   unresolved="No completed replacement shipment is recorded.",
   readings={"The job number was mistaken for a finished-stock label.","The dispatch check ignored whether the blades were usable."},
   anchors={
    claim=document("dispatch","Two-crate blade delivery / {CODE}",
     "A customer's delivery copy with UNFINISHED written across the second crate line.",
     [[LECTROMAX MANUFACTURING / {DATE1}
Job {CODE}: two crates delivered as finished saw blades.
{P1}: first crate usable. Second holds unshaped blanks. Both marked with this job number. Please send blades rather than the ingredients.
Production-query copies: {B}.]],
     "The customer got one usable crate and one more suitable for becoming useful later. Both have the number the delivery checker wanted."),
    response=object("SmallSaw","Saw blank, marked {P1}",
     "An untoothed saw blank under a FINISHED ORDER label for {P1}.",
     "The rim is unground and no teeth have been cut.",
     "The label travelled with the crate. The work did not.","poor"),
    review=document("receipt","Unfinished-stock return / {CODE}",
     "A return receipt stamped PRODUCTION, with no outward freight stamp.",
     [[LECTROMAX MANUFACTURING / {DATE3}
{CODE}: returned crate checked against blank-stock count. Material unshaped; no finished blades missing from factory stock.
Blanks restored to press queue. Customer balance remains outstanding. Replacement freight to factory account.
Press queue and return checked by {P2}.]],
     "The blanks are back where they can become blades. The customer still has an incomplete order, but at least the next trip won't be theirs to pay for."),
   },
   findings={
    "Two crates carry the same finished-order label. The blank inside one of them was never ground or toothed.",
    "The return check corroborates what the blank shows and restores the unfinished material to production, with the customer still owed blades.",
    "The duplicate number belonged to one order, not two finished crates. Dispatch checked labels instead of completion; the returned blanks went back into the queue. Nothing here shows that the missing blades eventually shipped.",
   },
  },
 },
 ["paid-before-ordered"]={
  scenario{
   organisation="Hobbs & Perkins",
   question="Who paid for roof materials before the purchase was approved?",
   centralAxis="access",
   optional={{key="own-card",role="person",kind="creditcard",title="Worker's own card / {CODE}",
    observation="A credit card kept with the requisition, one edge worn white.",
    source="Cardholder: {P1}.",
    note="{P1} held the roof stock on this. The reimbursement is still only a referral."}},
   extraFindings={{requires={"response","own-card"},from="own-card",to="response",kind="corroborates",
    text="The card names the worker whose letter says they paid for the stock themselves."}},
   event="A worker paid personally to hold scarce roof materials, then filed the formal requisition for reimbursement.",
   outcome="The earlier payment was a personal deposit applied to the approved order, not a second or predictive payment.",
   unresolved="The worker's reimbursement was referred back for a form, with no payment recorded.",
   readings={"The worker kept the repair supplied while approval caught up.","The employer accepted the goods and left the worker out of pocket."},
   anchors={
    claim=document("dispatch","Roof-material requisition / {CODE}",
     "An approved requisition with a supplier receipt dated one day earlier tucked beneath it.",
     [[{DATE1} / {CODE}
Roof sheets and fixings ordered from HOBBS & PERKINS. Purchase approved by {P2}.
Attached receipt: deposit paid {DATE0} by {P1}.
Retained supplier copy and reimbursement query: {B}.]],
     "The receipt is older than the approval and names {P1} as the payer. I'd like to know whose money kept the roof order waiting politely."),
    response=object("ClayShingle","Roof shingles, marked {P1}",
     "A stack of shingles with a delivery card for {P1}.",
     "The batch mark is stamped in the clay, dated before approval.",
     "The material arrived before anyone authorised buying it.","good"),
    review=document("receipt","Supplier allocation / {CODE}",
     "A supplier statement with the deposit joined to the later order by a ruled line.",
     [[HOBBS & PERKINS / {DATE3}
{CODE}: personal deposit from {P1} applied to approved roof-material order. Goods collected. No duplicate supplier payment.
Employer note: reimbursement referred back. Deposit predates requisition; retrospective expense form required.]],
     "The supplier accounts for one deposit and one order. The employer has discovered that an advance payment happened in advance, and needs a form about it."),
   },
   findings={
    "The requisition has the order approved first and paid afterwards. The shingles carry a batch mark from days before approval existed.",
    "The supplier confirms the deposit was applied once to the delivered shingles; the employer still wants a retrospective expense form.",
    "The order didn't predict its payment. A worker's money held the roof stock until approval arrived. The materials were collected and the supplier was paid once; {P1}'s reimbursement is still only a referral.",
   },
  },
  scenario{
   organisation="Louisville Bruiser",
   question="Why were the winners' bats paid for before the prize order existed?",
   centralAxis="records",
   optional={{key="spare-bat",role="records",kind="BaseballBat",wear="unused, the grip tape still bright",
    title="Baseball bat, marked {P1}",
    observation="A bat standing behind the prize paperwork, WINNER stencilled along it.",
    source="A name is inked on the knob: {P1}.",
    note="One of the twelve, kept back. Every one of them says WINNER."}},
   event="An organiser prepaid for a stock set of bats marked WINNER, then used them as identical participation prizes.",
   outcome="The early receipt bought a batch for every entrant, not awards for predetermined winners.",
   unresolved="The event's results are not included in the prize paperwork.",
   readings={"The label described the cheapest available prize batch.","The organiser preferred everyone to leave with a winning receipt."},
   anchors={
    claim=document("receipt","Advance prize payment / {CODE}",
     "A paid bat order attached to a later committee requisition.",
     [[LOUISVILLE BRUISER / paid {DATE0}
{CODE}: twelve presentation bats, stock WINNER imprint. Paid by {P1}.
Committee requisition raised {DATE1}: prizes for forthcoming event.
Retained prize list and collection copies: {B}.]],
     "Twelve winners paid for before the committee ordered prizes. Either somebody was confident about the result or WINNER came cheaper by the dozen."),
    response=object("BaseballBat","Racked bats, marked {P1}",
     "Twelve identical bats, racked, one tagged {P1}.",
     "Every grip is factory-wrapped; none has been swung.",
     "A winner's prize, or the same thing bought for all.","good"),
    review=document("receipt","Prize collection sheet / {CODE}",
     "A collection sheet showing twelve identical imprints beside a prepaid stamp.",
     [[LOUISVILLE BRUISER / {DATE3}
{CODE}: twelve stock-imprint bats collected by {P2}; earlier payment applied in full.
Committee allocation: one per entrant, no placing or winner names on supplier order.
No additional engraving commissioned.]],
     "The supplier records twelve identical bats and no winning names. Whatever happened at the event, its prizes were determined to be encouraging."),
   },
   findings={
    "The receipt reads as a prize bought for a winner. Twelve identical unused bats are racked together in the store.",
    "The collection sheet matches the racked twelve and applies the earlier payment to the same bats.",
    "The receipt records prepaid participation prizes, not a preselected winner. All twelve bats said WINNER because a more accurate word cost extra. The actual event results remain outside this file.",
   },
  },
 },
 ["overtime-nobody-worked"]={
  scenario{
   organisation="Lectromax Manufacturing",
   question="Why was a locked factory paying for a night shift?",
   centralAxis="access",
   optional={{key="gate-pass",role="person",kind="idcard",title="Works identification / {CODE}",
    observation="A works card with its gate photograph lifting at one corner.",
    source="LECTROMAX MANUFACTURING\n{P1}, production. Gate access.",
    note="{P1}'s gate card. Whatever was paid for that night, this did not go through the gate."}},
   extraFindings={{requires={"response","gate-pass"},from="gate-pass",to="response",kind="corroborates",
    text="The gate card belongs to the worker the standby instruction told to wait at home."}},
   event="An operator was required to wait by the telephone at home for a press restart, and payroll had no standby code.",
   outcome="Eight hours of restricted standby were paid under an on-site night-shift code even though no restart was ordered.",
   unresolved="The payroll correction does not supply a code for future standby.",
   readings={"Waiting for the employer was still work to be paid.","Calling it an on-site shift made the record misleading."},
   anchors={
    claim=document("dispatch","Unattended night shift / {CODE}",
     "A timesheet clipped to a blank factory entry page.",
     [[LECTROMAX MANUFACTURING / {DATE1}
{CODE}: {P1}, eight hours ON-SITE NIGHT SHIFT. Approved {P2}.
Gate entry for claimed shift: none. Factory remained locked.
Retained shift instructions and pay query: {B}.]],
     "Eight hours on site, no gate entry, factory locked. I'd want the instructions that went with those hours before deciding who had the night off."),
    response=object("Padlock","Plant padlock, marked {P1}",
     "The gate padlock, shut, its key box tagged {P1}.",
     "The shackle is unscratched and the seal is intact.",
     "A shift was paid behind a gate nobody opened.","good"),
    review=document("notepad","Standby pay decision / {CODE}",
     "A payroll decision attached to the disputed timesheet.",
     [[LECTROMAX MANUFACTURING / {DATE3}
{CODE}: {P2} confirms home standby, eight hours, no restart call. Pay issued for required availability.
No standby code in current payroll table. Retain NIGHT SHIFT code; annotate NOT ON SITE.
Do not alter gate log to make it agree.]],
     "The pay was issued for waiting. The code still says on site, followed by a note saying not on site. At least nobody has been sent to repair the gate log."),
   },
   findings={
    "The timesheet has {P1} on an eight-hour shift inside the plant. The gate padlock is shut and its key box is still sealed.",
    "Payroll confirms the waiting period the sealed gate implies and pays it under the only available shift code, recording that no restart occurred.",
    "Nobody worked inside the locked factory that night. {P1} gave up eight hours at home under an instruction to wait, and was paid for that time. The imaginary on-site shift belongs to the payroll code.",
   },
  },
  scenario{
   organisation="Circuital Healing",
   question="How did a time-clock repair produce eight hours of overtime?",
   centralAxis="records",
   optional={{key="clock-hammer",role="records",kind="Hammer",wear="the claw sprung slightly apart",
    title="Hammer, marked {P1}",
    observation="A hammer on the shelf beneath the time clock.",
    source="A name scratched into the shaft: {P1}.",
    note="The clock was opened and closed again that night. This was within reach of it."}},
   event="A bench test advanced a time clock by eight hours, and its test card was copied into the repair invoice as labour.",
   outcome="The eight-hour interval was a clock-setting test; the invoice was corrected to the technician's recorded work.",
   unresolved="The complaint asks for the false labour charge to be refunded; the credit has no refund receipt.",
   readings={"The test card was mistaken for a labour record.","The invoice was accepted without reading the technician's log."},
   anchors={
    claim=document("receipt","Eight-hour clock repair / {CODE}",
     "A repair invoice with a punched time card stapled to it.",
     [[CIRCUITAL HEALING / {DATE1}
{CODE}: time-clock repair, eight hours overtime. Supporting card: IN 18:00, OUT 02:00, technician {P1}.
Customer requests explanation: collection desk was shut throughout those hours.
Retained bench records and invoice query: {B}.]],
     "The card clocks eight hours. That tells me what the clock printed, which is precisely the thing somebody paid to have repaired."),
    response=object("Mov_WallClock","Time clock card, marked {P1}",
     "The works time clock, its test card headed {P1}.",
     "Two punches, fifty minutes apart, in one ribbon ink.",
     "Fifty minutes of testing, or a night of overtime.","fair"),
    review=document("receipt","Labour credit / {CODE}",
     "A credit note cancelling the overtime line and entering fifty minutes beneath it.",
     [[CIRCUITAL HEALING / {DATE3}
{CODE}: {P2} accepts bench log. Test punches copied as labour in error. Eight-hour overtime line cancelled; fifty minutes ordinary labour entered.
Credit issued against original bill. Customer request for cash refund referred to accounts.]],
     "The clock's pretend night has been removed from the bill. Getting the credit turned back into cash will apparently take time the clock can't supply."),
   },
   findings={
    "The invoice bills a night of overtime from the time card. The clock's own test card holds two punches fifty minutes apart.",
    "The corrected invoice accepts the punched card and replaces eight hours of overtime with fifty minutes of ordinary labour.",
    "The time clock worked through the night only because {P1} advanced it. Its test card became an overtime bill. That charge was credited; the requested cash refund is not recorded here.",
   },
  },
 },
 ["closure-announced-twice"]={
  scenario{
   organisation="CGE Corp",
   kinds={"recontextualises","corroborates","recontextualises"},
   question="Why were there recent work sheets for the old CGE factory?",
   centralAxis="access",
   optional={{key="survey-player",role="records",kind="CDplayer",wear="scuffed, the lid held with tape",
    title="CD player, marked {P1}",
    observation="A portable player left on a windowsill in a factory with no power.",
    source="A name on a strip of tape across the back: {P1}.",
    note="Somebody spent hours in here recently. They brought something to listen to."}},
   event="Preservation volunteers entered the old CGE building to measure it for a proposed museum, after manufacturing had long ceased.",
   outcome="The recent work was a heritage survey, not resumed production; later access was refused pending the demolition decision.",
   unresolved="The demolition decision and proposed museum have no final disposition in these records.",
   readings={"The survey explains the recent activity.","Keeping the building closed may decide its future by delay."},
   anchors={
    claim=document("clipping","Old factory closure / {CODE}",
     "A preservation leaflet clipped to a recent site-work query.",
     [[CGE CORP BUILDING / retained {DATE1}
Manufacturing jobs here: 1961-1980. Building proposed for demolition; preservation campaign seeks a museum.
Query {CODE}: fresh site-work sheets received despite closure. Who is still working there?
Retained survey correspondence: {B}.]],
     "The leaflet puts the factory's working life in the past. The query puts somebody inside much more recently. Work can mean more than production; I'd like to see the sheets."),
    response=object("Camera","Survey camera, marked {P1}",
     "A camera on a works bench, its case labelled {P1}.",
     "The film counter has not reached the end of the roll.",
     "Somebody photographed a closed building and stopped.","fair"),
    review=document("letter","Further access refused / {CODE}",
     "An access decision returned with the survey cover sheet still attached.",
     [[{DATE3} / {CODE}
Survey visit acknowledged. CGE production has not resumed. Building remains closed; no further volunteer entry authorised pending demolition decision.
Museum proposal requires a complete condition survey. Current submission marked INCOMPLETE.
Survey photographs logged by {P2}.]],
     "They need a complete survey to propose saving it and permission to finish the survey. Permission is waiting for the decision about demolishing it. A very tidy queue."),
   },
   findings={
    "The camera identifies the recent work queried beside the old closure leaflet: somebody was photographing a building that was shut.",
    "The access decision acknowledges that visit, then blocks another one while requiring a complete survey for the proposal.",
    "The factory had not restarted. The recent work belonged to people trying to save the building, and the second closure kept them from completing their survey. These records leave both demolition and the museum proposal unresolved.",
   },
  },
  scenario{
   organisation="March Ridge bunker tours",
   kinds={"recontextualises","corroborates","recontextualises"},
   question="Why were beds and power checked after the bunker was closed?",
   centralAxis="access",
   optional={{key="tour-broom",role="records",kind="Broom",wear="worn to one side of the head",
    title="Broom, marked {P1}",
    observation="A broom propped inside the closed visitor entrance.",
    source="A name written on the handle in marker: {P1}.",
    note="The route was swept. The permission to bring anyone down it never came."}},
   event="Staff continued preparing the decommissioned bunker for visitors while tour admission was suspended for a safety review.",
   outcome="The recent work maintained the tour display, not an operating military shelter; the public reopening request was refused.",
   unresolved="The safety review has no completed report here.",
   readings={"The work served a closed visitor attraction.","The ticket office was ready before the site was cleared."},
   anchors={
    claim=document("dispatch","Bunker admission closure / {CODE}",
     "A current admission notice pinned over part of an older tour leaflet.",
     [[MARCH RIDGE BUNKER TOURS / {DATE1}
{CODE}: public admission suspended pending safety review.
Tour leaflet: military bunker decommissioned in 1991; visitor display includes accommodation for forty.
Recent bed and power work queried. Retained work orders and admission correspondence: {B}.]],
     "The bunker closed as a military shelter in 1991 and now it's closed to visitors as well. Recent work on beds and power needs a better explanation than another CLOSED sign."),
    response=object("Generator_Old","Standby generator, marked {P1}",
     "A standby generator below the stair, log signed {P1}.",
     "The exhaust is warm-scaled and the cable run is new.",
     "The power was kept ready after closure was announced.","fair"),
    review=document("letter","Tour reopening refused / {CODE}",
     "A returned reopening request with its waiver form still attached.",
     [[MARCH RIDGE BUNKER TOURS / {DATE3}
{CODE}: display and lighting work accepted as completed. Reopening refused: safety review outstanding.
Waivers do not constitute completion of that review. Continue to suspend admission.
Ticket printing may proceed at operator's risk.
Standby plant inspected by {P2}.]],
     "The beds and lights are ready, the review isn't, and the tickets can still be printed. Paper is the first visitor allowed through."),
   },
   findings={
    "The fuelled standby generator explains the work queried in the closure notice: the power was being kept ready, not shut down.",
    "The reopening reply accepts the maintenance but refuses admission, distinguishing finished preparation from an unfinished safety review.",
    "The recent activity was tour preparation, not a military bunker reopening. The military closure and visitor closure describe different uses. Staff finished their list; permission to admit anyone was still refused.",
   },
  },
 },
}
