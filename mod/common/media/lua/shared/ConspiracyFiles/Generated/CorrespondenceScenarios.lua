-- Authored local events; vanilla print supplies businesses and their activities,
-- not these incidents. A/B hold retained copies, not invented business premises.
local grounding={
 ["Crossroads Medical Center"]="CrossRoadsMall", ["Spiffo's Louisville"]="SpiffosHiringLouisville",
 ["Sunstar Motel"]="SunstarMotel", ["Scarlet Oak Distillery"]="ScarletOakDistillery",
 ["Wellington Heights Golf Club"]="WellingtonHeightsGolfClub", ["March Ridge bunker tours"]="ColdWarBunker",
}
local function doc(kind,title,observation,source,note)
 return {kind=kind,title=title,observation=observation,source=source,note=note}
end
local function story(t)
 t.grounding=assert(grounding[t.organisation]);t.essential={"claim","response","review"};t.optional=t.optional or {}
 -- See the note in AdministrativeScenarios. Default: the second record
 -- disputes the first account, the third confirms it, the three explain.
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
 t.findings=nil;t.kinds=nil;return t
end
return {
 ["appointment-out-of-order"]={
  story{
   organisation="Crossroads Medical Center",
   question="How was an appointment booked before its patient was referred?",
   centralAxis="records",
   event="An employer reserved unnamed examination slots, then the clinic added patient names without changing the block's booking date.",
   outcome="The booking log and attendance correction distinguish the early purchase of time from the later referral of a person.",
   readings={"The employer booked the time before it knew who would use it.","The clinic's form made a bulk purchase look like a decision about a person."},
   anchors={
    claim=doc("dispatch","Early appointment card / {CODE}",
     "An appointment card stapled to a referral dated one day after the booking.",
     [[CROSSROADS MEDICAL CENTER / CrossRoads Mall
Appointment {CODE}: {P1}. Booking entered {DATE0}.
Employer referral received {DATE1}. Attendance due {DATE2}.
Query and duplicate booking sheet retained at {B}.
Patient note: how did you book me before you were told about me?]],
     "I'd have asked that too. The booking predates the referral. I want the original booking sheet before deciding what they knew."),
    response=doc("notebook","Block-booking sheet / {CODE}",
     "A booking sheet whose patient column was originally headed NAMES TO FOLLOW.",
     [[Booking sheet copied {DATE2} / {CODE}
{DATE0}: employer purchased six examination slots. No patient names supplied.
{DATE1}: {P2} entered {P1} against reserved slot 4 on receipt of referral.
Do not amend BOOKED date. Altering it restarts the cancellation period.]],
     "They had a slot before they had a patient. The old date stays because a corrected card might give somebody time to cancel. That makes the odd date useful to them."),
    review=doc("receipt","Appointment-date correction / {CODE}",
     "A signed attendance entry beneath a correction pasted over BOOKED.",
     [[CROSSROADS MEDICAL CENTER / {DATE3}
{CODE}: {P1} attended on {DATE2}. Slot bought {DATE0}; patient referred {DATE1}.
Card amended to SLOT RESERVED. Original cancellation terms retained.
Copy issued to patient. No charge for correcting the heading.]],
     "The corrected card separates the slot from the person. Nobody predicted a referral. They did manage to preserve the cancellation charge through the correction."),
   },
   findings={
    "The card has {P1} booked the day before the referral arrived. The booking sheet has six unnamed slots sold that day, with names written in later.",
    "The correction preserves the two dates in the booking sheet and records attendance on the scheduled day.",
    "The clinic sold a block of time before receiving the patient names. Its card inherited the purchase date, making {P1}'s appointment look planned before the referral. The correction separates those events and leaves the cancellation terms untouched.",
   },
  },
  story{
   organisation="Crossroads Medical Center",
   question="Why does an appointment appear before the incident that required it?",
   centralAxis="records",
   conflict="The account charges {P1} for arriving before the incident happened. The employer's correction puts the incident and the visit on the same day.",
   event="A walk-in visit preceded the employer's incident report; accounts treated the report's filing date as the incident date and the visit as an advance booking.",
   outcome="The walk-in register and corrected incident report account for the order of events, and the advance-booking surcharge is reversed.",
   readings={"The clinic saw a walk-in before the employer finished its report.","A filing date became a reason to charge the patient for booking in advance."},
   anchors={
    claim=doc("receipt","Advance-booking surcharge / {CODE}",
     "A clinic account with a surcharge circled beside two consecutive dates.",
     [[CROSSROADS MEDICAL CENTER / {DATE1}
Account {CODE}, {P1}: visit {DATE0}; employer incident date {DATE1}.
Visit preceding incident coded ADVANCE BOOKING. Surcharge entered.
Patient objection and retained attendance copies: {B}.
I came straight from work. I did not arrange to need you.]],
     "The account has charged {P1} for arriving before the incident. I'd like to see which date the employer actually supplied."),
    response=doc("notebook","Walk-in register extract / {CODE}",
     "An attendance extract with the appointment-number column ruled through.",
     [[{DATE2} / register extract for {CODE}
{DATE0}: {P1} arrived without appointment after leaving work; employer contacted from reception.
Employer called back {DATE1}: incident report now filed.
{P2}, reception: there was no booking. The crossed-out box means there was no booking.]],
     "Reception recorded a walk-in and an employer who called back the next day. The crossed-out box has now required a written defence."),
    review=doc("letter","Incident-date correction / {CODE}",
     "A corrected employer report clipped to a credit entry.",
     [[{DATE3} / {CODE}
Employer confirms: incident {DATE0}; report filed {DATE1}. Date copied to clinic account was filing date.
ADVANCE BOOKING removed. Surcharge reversed. Visit charge unchanged.
Future reports to state both dates. Please do not combine boxes to save space.]],
     "The incident and visit belong to the same day. The employer's report came later. They've taken off the charge for foresight; the ordinary bill survives."),
   },
   findings={
    "The walk-in register contradicts the account's advance-booking label and dates the employer's callback to the following day.",
    "The corrected report explains the callback delay: the report was filed a day after the incident and visit.",
    "A filing date was copied as an incident date. That made an ordinary walk-in visit look booked before it was needed and generated a surcharge. The corrected report puts the events in order and reverses that charge.",
   },
  },
 },
 ["file-signed-out"]={
  story{
   organisation="Spiffo's Louisville",
   question="Who signed out the complaint file as CCR, and why did the customer hear nothing?",
   centralAxis="absence",
   event="The Customer Complaints Representative used an unanswered complaint as a training example of successful resolution, leaving the reply in the training binder.",
   outcome="The returned binder contains the unsent reply; the case is reopened and the customer is finally sent it.",
   readings={"Training borrowed a real complaint and forgot the person waiting for an answer.","The office counted a model resolution before it resolved anything."},
   anchors={
    claim=doc("notebook","Complaint checkout / {CODE}",
     "A checkout card with three initials where a borrower's name should be.",
     [[SPIFFO'S LOUISVILLE / {DATE1}
Complaint {CODE}, {P1}. Signed out: CCR. Purpose: resolved-case training.
Customer has called twice asking for reply. Mark further calls DUPLICATE.
Checkout query and retained copies: {B}.]],
     "Someone has a resolved case for training and a customer still asking for an answer. CCR gets the file; {P1} gets marked duplicate."),
    response=doc("letter","Representative's binder request / {CODE}",
     "A training request with the borrower's job title expanded in the margin.",
     [[{DATE2} / {CODE}
{P2}, Customer Complaints Representative (CCR): I took the file for training. The reply is a model of a calm response and should remain beside the complaint.
Please count this example in the resolved total for the course.
Return binder after staff have read both sheets.]],
     "CCR is a job title. {P2} kept the reply beside the complaint so staff could admire the answer. I wonder whether the customer ever got to read it."),
    review=doc("dispatch","Returned training file / {CODE}",
     "A returned-file check with an unstamped envelope flattened beneath it.",
     [[SPIFFO'S / {DATE3}
{CODE}: original reply found in training binder, still sealed in unposted envelope. No outgoing copy logged.
Case reopened. Reply dispatched to {P1} today; outgoing book signed by {P2}.
Training total reduced by one. Course example relabelled AVOIDABLE DELAY.]],
     "The envelope was still in the binder. They've finally sent it and changed the lesson. Same complaint, twice the training value."),
   },
   findings={
    "The file is recorded as held for reply. The training request has the same binder signed out of the building.",
    "The returned binder contains the very reply the representative wanted staff to read. It had never been posted.",
    "The customer was waiting while an unsent reply taught staff how to resolve complaints. The return check found the envelope, reopened the case and recorded dispatch. The training department had to subtract one success.",
   },
  },
  story{
   organisation="Sunstar Motel",
   question="Why was a guest complaint file signed out for air-conditioning work?",
   centralAxis="access",
   event="A maintenance worker wedged a folded complaint folder behind a rattling air-conditioner cover and forgot to return it.",
   outcome="A later repair recovers the complete folder, secures the cover with screws and returns the complaint to the desk.",
   readings={"The complaint folder briefly fixed the very noise it complained about.","The motel counted a quiet machine as a closed complaint while its paperwork was inside it."},
   anchors={
    claim=doc("dispatch","Complaint file checkout / {CODE}",
     "A desk card with MAINTENANCE in the file's destination column.",
     [[SUNSTAR MOTEL / {DATE1}
Guest {P1}, complaint {CODE}: air-conditioner cover rattles all night.
Folder signed out to {P2}, maintenance. Return requested before desk closes complaint.
Retained checkout and repair copies: {B}.]],
     "The complaint went out with the repair. That seems sensible, provided somebody brings it back."),
    response=doc("notepad","Temporary noise repair / {CODE}",
     "A maintenance note with a crease pressed through the word TEMPORARY.",
     [[{DATE2} / {CODE}
{P2}: cover lacked two screws. Folded complaint folder behind edge; rattle stopped. No loose pages removed.
Temporary only. Fetch screws and retrieve folder on return.
Desk note: guest reports quiet night. Mark resolved.]],
     "The complaint itself stopped the noise. The desk has marked it resolved, but the worker still needs screws and a way to return the file without making the guest complain again."),
    review=doc("receipt","Folder returned after repair / {CODE}",
     "A completion slip stapled to a folder with a curved dent along its spine.",
     [[SUNSTAR MOTEL / {DATE3}
{CODE}: two cover screws fitted. Folder removed; all numbered sheets checked present. Test run quiet without folder.
Returned to desk by {P2}. Complaint closed after mechanical repair.
Stationery consumed: none. Folder remains serviceable for filing.]],
     "Two screws do the folder's job now. The file is complete and the machine ran quietly without it. Even the stationery budget gets a happy ending."),
   },
   findings={
    "The register has the folder checked out and due back. The maintenance note has it folded inside the air conditioner it complained about.",
    "The repair slip records the promised screws and retrieval, with every sheet accounted for and a quiet test run.",
    "The missing file was a temporary packing piece in the air conditioner it complained about. The permanent repair returned it intact and stopped the noise. The first closure came before the repair; the second had screws behind it.",
   },
  },
 },
 ["missing-ledger-page"]={
  story{
   organisation="Spiffo's Louisville",
   question="Why was the signed mop-training page cut out of the attendance book?",
   centralAxis="records",
   optional={{key="training-mop",role="records",kind="Mop",wear="the head stiff and long dry",
    title="Mop, marked {P1}",
    observation="A mop standing beside the attendance book.",
    source="A name on the shaft in marker: {P1}.",
    note="The training was signed for twice and the page went to headquarters. The mop stayed."}},
   event="The trainer removed an original attendance page to satisfy headquarters' demand for an original, leaving the local book unable to satisfy the same demand.",
   outcome="Headquarters acknowledges receipt of the cut-out page and grants an exception allowing the local book to hold a copy.",
   readings={"Two offices demanded the same original sheet.","The staff completed their training and then had to prove the paperwork's absence was authorised."},
   anchors={
    claim=doc("notebook","Training book with missing page / {CODE}",
     "A bound attendance book with one sheet cut close to its stitched edge.",
     [[SPIFFO'S LOUISVILLE / {DATE1}
Mop training {CODE}, led by {P2}. Page 18 removed after signatures collected, including {P1}.
Local audit: attendance unproven without original page. Repeat course unless original supplied.
Trainer's objection and dispatch copies retained at {B}.]],
     "Someone cut out the attendance page. The proposed remedy is another mop course. I'd want to know where the first set of signatures went."),
    response=doc("letter","Trainer's original-page objection / {CODE}",
     "A trainer's letter clipped to headquarters' instruction, ORIGINAL underlined in both.",
     [[{DATE2} / {CODE}
{P2}: headquarters required the signed ORIGINAL. I cut out page 18 and posted it; dispatch slip attached. Your local audit requires the ORIGINAL to remain bound.
We have one original. Please nominate which office is allowed not to have it.
The staff have already learned to mop.]],
     "One sheet, two offices, both demanding the original. Repeating the course would produce another sheet for them to fight over."),
    review=doc("receipt","Original-page receipt / {CODE}",
     "A headquarters receipt attached to a photocopy of the missing signed page.",
     [[SPIFFO'S / {DATE3}
{CODE}: original page 18 received; signatures checked. Attendance accepted, including {P1}. No repeat course required.
Local exception granted: bind this copy into attendance book.
Stamp copy ORIGINAL HELD ELSEWHERE. Do not send stamped copy back.]],
     "Headquarters has the missing sheet. The staff are spared another lesson and the book gets a copy with permission to be a copy. I'd keep that permission attached."),
   },
   findings={
    "The audit refuses the attendance because the page is missing from the book. The trainer's letter has that page posted to headquarters, because another rule demanded the original.",
    "Headquarters' receipt confirms the trainer sent the original and accepts the attendance the local audit had refused.",
    "The page was removed to obey one original-only rule and failed another by leaving the book. Headquarters confirms receipt and authorises a local copy. The missing page is accounted for; nobody needs to learn the mop again.",
   },
  },
  story{
   organisation="Scarlet Oak Distillery",
   question="What was removed from the visitors' sample ledger?",
   centralAxis="records",
   optional={{key="cellar-diary",role="person",kind="diary",title="Cellar hand's diary / {CODE}",
    observation="A pocket diary kept behind the cask racks, its spine swollen with damp.",
    source="{DATE2}. Six bottles out before anyone arrived. No tour came today. Writing it here because the ledger has no room for it.",
    note="The cellar hand kept their own note of the same six bottles. A diary is what you use once the book has been arranged."}},
   event="A manager removed the page showing a directors' tasting charged to the free visitor-sample allowance; the attendant kept the carbon beneath it.",
   outcome="The carbon and a signed correction move six bottles from visitor samples to management hospitality and account for the removed page.",
   readings={"The missing page concealed management drinking from the visitor-sample account.","Management corrected the account only after somebody kept the second copy."},
   anchors={
    claim=doc("notebook","Distillery sample ledger / {CODE}",
     "A sample ledger with a torn leaf stub and a six-bottle gap in its running balance.",
     [[SCARLET OAK DISTILLERY / {DATE1}
Tour sample account {CODE}. Six bottles issued; visitor tally for issue left blank.
Page removed on manager's instruction. Balance carried forward unchanged.
Stock attendant's retained copies and query: {B}.]],
     "Six bottles have left the sample stock without a visitor tally. The balance survived the missing page. I'd look for whoever kept the issue copy."),
    response=doc("letter","Attendant's carbon copy / {CODE}",
     "A faint carbon leaf bearing a drinks order and a note from the stock attendant.",
     [[{DATE2} / {CODE}, copy of removed entry
Six bottles: directors' palate-calibration meeting. No tour group present. Charge to free visitor samples.
{P1}, stock attendant: {P2} took top sheet for private filing. Carbon stayed under pad. I am sending it because stock is asking me for six bottles.]],
     "The carbon names a directors' tasting, not visitors. {P1} kept a copy because six missing bottles were about to become a stock attendant's problem."),
    review=doc("receipt","Sample-account adjustment / {CODE}",
     "A signed adjustment with VISITOR crossed out and MANAGEMENT written above it.",
     [[SCARLET OAK DISTILLERY / {DATE3}
{CODE}: {P2} confirms top sheet removed after directors' tasting. Six bottles consumed at that meeting, no visitor issue.
Transfer charge to management hospitality. Stock attendant cleared of shortage.
Description PALATE CALIBRATION retained for accounts.]],
     "The attendant is cleared and management gets its own bill. They have kept the grand name for the drinking. Apparently that part passed inspection."),
   },
   findings={
    "The ledger charges six bottles to visitor samples. The retained carbon has no tour that day and the bottles poured for directors.",
    "The signed adjustment confirms the carbon's account and clears the attendant by charging management for the bottles.",
    "The missing leaf hid a directors' tasting in the visitor-sample budget. The carbon survived, and the signed correction accounts for both the sheet and the six bottles. Management kept its preferred description of the meeting.",
   },
  },
 },
 ["photograph-without-a-name"]={
  story{
   organisation="Wellington Heights Golf Club",
   question="Who is the third person in a staff photograph with only two names?",
   centralAxis="absence",
   event="A publicity photograph included visiting lesson coach Logan Barton, but its OUR STAFF caption was matched only against the employee roster.",
   outcome="A corrected caption identifies Barton and a lesson invoice confirms he was visiting as a coach, not omitted from payroll.",
   readings={"A visiting coach became unnamed when publicity called everyone in the photograph staff.","The club wanted the champion in its picture before it bothered getting the caption right."},
   anchors={
    claim=doc("photograph","Golf-club staff photograph / {CODE}",
     "Three adults stand beside a golf bag. The pasted caption names only two.",
     [[WELLINGTON HEIGHTS GOLF CLUB / {DATE1}
OUR STAFF / publicity proof {CODE}
Names from employee roster: {P1}; {P2}.
Editorial query: three people, two names. Obtain corrected caption before printing.
Proof correspondence retained at {B}.]],
     "There are three people in the picture. The caption got its two names from a roster. I'd try the person who arranged the photograph before deciding somebody was erased."),
    response=doc("dispatch","Lesson-coach invoice / {CODE}",
     "A lesson invoice with the photograph's proof number pencilled at its corner.",
     [[{DATE2} / associated proof {CODE}
Logan Barton: weekly coaching visit at Wellington Heights, {DATE1}. Lesson fee invoiced separately; not staff wages.
{P2}: coach stayed for photograph after lesson. Please put his name under it, not on the employee roster.]],
     "The invoice gives me a visiting coach and says he stayed for the picture. Publicity seems to have borrowed a person as casually as it borrowed the golf bag."),
    review=doc("letter","Corrected photograph caption / {CODE}",
     "A caption proof with a line joining each printed name to a position in the photograph.",
     [[WELLINGTON HEIGHTS / {DATE3} / {CODE}
Left: {P1}. Centre: Logan Barton, winner of the 1992 Riverside Classic; visiting lesson coach. Right: {P2}.
Replace OUR STAFF with AT THE CLUB.
Accounts: Barton paid against coaching invoice. Do not open an employee file for a caption.]],
     "The corrected caption names all three. Barton was there to teach and was paid for that. Four replacement words save accounts from accidentally hiring a golfer."),
   },
   findings={
    "The caption calls all three figures staff. The invoice has the third of them paid as a visiting coach.",
    "The corrected caption places the visiting coach between the two employees and matches his payment to the lesson invoice.",
    "The unnamed figure is Logan Barton, a visiting coach included in a publicity photograph. OUR STAFF sent the caption writer to the wrong list. The correction names him and accounts pays for the lesson without inventing a third employee.",
   },
  },
  story{
   organisation="Spiffo's Louisville",
   question="Why are there three figures in a photograph billed for only two employees?",
   centralAxis="absence",
   event="A publicity print combined two exposures so the same employee appeared in uniform and inside the Spiffo costume.",
   outcome="The photographer's proof and approved caption identify the costumed figure as the employee already standing beside it.",
   readings={"The photographer combined two poses to make a fuller-looking staff picture.","Publicity counted three happy faces while payroll paid two people."},
   anchors={
    claim=doc("photograph","Three happy faces / {CODE}",
     "A restaurant publicity photograph: two uniformed employees beside a costumed Spiffo.",
     [[SPIFFO'S LOUISVILLE / {DATE1}
Proof {CODE}: THREE HAPPY FACES FROM OUR FAMILY.
Staff names supplied: {P1}; {P2}. Photographer's query: please identify costume performer for caption.
Proof envelope and invoice copies: {B}.]],
     "Two names for three figures. Somebody could just have left the performer off the caption. The photographer is asking the same question."),
    response=doc("letter","Photographer's double-exposure note / {CODE}",
     "Two numbered negative sleeves clipped to a note about combining the prints.",
     [[{DATE2} / proof {CODE}
Exposure 1: {P1} and {P2} in uniform. Exposure 2: {P1} changed into Spiffo costume; {P2} holding backdrop.
Instruction received: combine uniform pair and costume in final print. Use three smiling figures. Do not show spare costume head on table.]],
     "{P1} is in both exposures. The request is for three smiling figures, which the photographer can supply without a third wage."),
    review=doc("receipt","Composite-print approval / {CODE}",
     "A print approval with the costumed figure numbered to match one of the employees.",
     [[SPIFFO'S / {DATE3} / {CODE}
Composite approved from exposures 1 and 2. {P1} appears twice: uniform and costume. {P2} appears once.
Pay two employees for sitting. Pay photographer for one retouch.
Caption approved unchanged: THREE HAPPY FACES FROM OUR FAMILY.]],
     "Two people became three figures and accounts paid for the extra face as a retouch. The caption is still technically safe. I'd count the people myself."),
   },
   findings={
    "The proof shows three figures and names two. The negative sleeves have one employee photographed twice, the second time inside the costume.",
    "The approval confirms the photographer combined those exposures and that only two employees took part.",
    "There was no unnamed third employee. {P1} appears both in uniform and as Spiffo, assembled from two exposures. The final approval pays two staff and keeps a caption boasting three happy faces.",
   },
  },
 },
 ["withdrawn-extension"]={
  story{
   organisation="Spiffo's Louisville",
   question="Why do calls continue after the complaint extension was withdrawn?",
   centralAxis="access",
   event="The restaurant removed its complaint extension from public listings while staff kept using it for callbacks and counted those conversations as follow-ups.",
   outcome="The switchboard order and call tally account for the continuing calls and the reported drop in complaints without showing a drop in problems.",
   readings={"The extension stayed available for callbacks after public listing ended.","Calling complaints follow-ups improved the figures without resolving them."},
   anchors={
    claim=doc("dispatch","Withdrawn complaint extension / {CODE}",
     "A telephone notice with a call tally attached below its cancellation stamp.",
     [[SPIFFO'S LOUISVILLE / {DATE1}
Complaint extension 204: WITHDRAWN from public listing, reference {CODE}.
Three later conversations charged to 204 on attached tally. Query raised by {P1}.
Telephone orders and retained call copies: {B}.]],
     "WITHDRAWN is a large stamp for a line still logging conversations. I need the switchboard instruction, not a larger stamp."),
    response=doc("notepad","Switchboard instruction / {CODE}",
     "A switchboard card with PUBLIC struck through but INTERNAL left untouched.",
     [[{DATE2} / instruction for {CODE}
{P2}, Customer Complaints Representative: 204 remains connected for staff callbacks. Stop printing it on customer material; switchboard to take messages instead.
Return calls coded FOLLOW-UP, not NEW COMPLAINT, even if customer repeats original complaint.]],
     "The line was taken off the customer material, not disconnected. Staff can call back, and the complaint gets a new name when they do."),
    review=doc("notebook","Complaint-total reconciliation / {CODE}",
     "A totals sheet with the same three callers listed under a second heading.",
     [[SPIFFO'S / {DATE3} / {CODE}
All three disputed calls on 204 confirmed as staff callbacks to earlier complainants. Original matters still open.
Report: new complaints down by three; follow-ups up by three. No cases closed.
Manager's instruction: use new-complaint figure in improvement report.]],
     "All three callers are accounted for, and all three complaints remain open. The improvement is in the heading. I'd be less impressed if I were still waiting for an answer."),
   },
   findings={
    "The notice has the extension withdrawn. The switchboard instruction has it still connected, for staff calling out.",
    "The reconciliation matches all three calls to the callback instruction and confirms the complaints themselves remained open.",
    "The extension was delisted, not disconnected. Its three later calls were staff callbacks, counted as follow-ups while the original matters stayed open. The report improved because the heading changed.",
   },
  },
  story{
   organisation="March Ridge bunker tours",
   question="Who answered calls on a telephone line withdrawn when the bunker closed?",
   centralAxis="absence",
   event="Tour staff tested the bunker's isolated internal handsets and wrote the demonstrations into an old call book as answered calls.",
   outcome="A signed demonstration check accounts for all three entries and confirms they were local handset tests without an external connection.",
   readings={"Tour staff used an old call book to log a working exhibit.","The exhibit's paperwork made maintenance look like the return of an active bunker."},
   anchors={
    claim=doc("notebook","Calls after withdrawal / {CODE}",
     "An old telephone book with three fresh ANSWERED entries below a withdrawal notice.",
     [[MARCH RIDGE BUNKER TOURS / preparation file {CODE} / {DATE1}
External line withdrawn on decommissioning, 1991.
Handset log: three calls ANSWERED today. Operator {P1}.
Enquiry: why calls on withdrawn line? Copies and exhibit work orders retained at {B}.]],
     "Three answered calls under a notice saying the external line was withdrawn. That could mean several things. I'd start with what the tour staff were preparing."),
    response=doc("dispatch","Handset exhibit work order / {CODE}",
     "A tour-display work order with two handsets joined by a short diagram.",
     [[{DATE2} / account of work on {DATE1} / {CODE}
{P2}: demonstration loop only. Connect local handsets, ring each end, check speech. External cable remains disconnected.
{P1} used old call book because exhibit checklist has no space for ringing tests.
Three entries submitted for reconciliation.]],
     "The work order describes two local handsets, not a call out of the bunker. The exhibit checklist had no box, so the old call book got another shift."),
    review=doc("receipt","Demonstration-call signoff / {CODE}",
     "A check sheet signed by both staff members, each of the three calls ticked off.",
     [[MARCH RIDGE BUNKER / {DATE3} / {CODE}
All three ANSWERED entries reconciled: {P1} and {P2}, opposite ends of internal demonstration loop. No external connection used. Cable isolation checked.
Exhibit test accepted. Tours not authorised by this sheet.
Call book relabelled HANDSET TESTS. Retain historic cover for display.]],
     "The staff account for each call between themselves. The line stayed disconnected and the tours got no permission to open. Only the call book came out of retirement."),
   },
   findings={
    "The call book has fresh entries on a line recorded as dead. The work order has two handsets tested on a loop that reaches nothing.",
    "The signed check accounts for every test entry and confirms the external cable remained disconnected.",
    "The three answered calls were tour staff testing an internal telephone exhibit. The old call book gave maintenance the appearance of a reopened line. Both operators signed the reconciliation; no external connection was used.",
   },
  },
 },
}
