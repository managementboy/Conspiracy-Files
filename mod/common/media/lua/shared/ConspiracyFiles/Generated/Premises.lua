-- Twenty case premises. Pure data; zero engine dependencies; plain Lua 5.1.
--
-- Until now the generator told exactly one story - a maintenance company moving
-- a sealed equipment case between two addresses with a missing authorisation -
-- and every improvement since (carriers, roles, disagreement) gave that one
-- story more ways to be told without giving it a second story. This file is the
-- second story, nineteen times over.
--
-- THE RULE EVERY PREMISE OBEYS. Each has two honest readings, one ordinary and
-- one not, and nothing here chooses between them. That is the product. A
-- premise that can only be read one way is a plot, and this mod does not write
-- plots; it leaves paperwork that disagrees and lets the player draw the line.
--
-- THE SECOND RULE. Nothing can be witnessed. Every premise had to survive being
-- found in a drawer, which means the interesting fact must be something a
-- person would write down and someone else would keep.
--
-- Placeholders are substituted by Generator.fill: {CODE} record reference,
-- {ORG} organisation, {P1}/{P2} the two named people, {A}/{B} the two site
-- names, {D1}/{D2}/{D3} the three July 1993 days, {SUBJECT} the premise's own
-- noun for the matter, {UNKNOWN} the thing the paperwork cannot settle.
--
-- Content status: drafted by AI, pending human approval per ADR-0002. See
-- docs/design/PREMISES.md for the prose originals and the owner's selection.
local M={}

-- Each entry: id, title, code (reference prefix), subject, unknown, orgs (3),
-- and three anchor documents - claim, response, review - each with a carrier
-- `kind`, a `title`, a physical `found` description, the document's own `text`,
-- and a `meaning` that must never assert a conclusion. The response and review
-- additionally carry `agree` and `dispute` lines; the case outline picks one,
-- which is what makes the same premise readable two ways. A review may also
-- carry `meaningAgree`, used in place of `meaning` when the case corroborates:
-- several reviews are written for the version where the records conflict, and
-- reusing that wording where they agree would put a suspicion on the page that
-- the paperwork does not support.
local P={
{id="transfer-nobody-arranged",title="A transfer nobody arranged",code="TR",
 subject="the transfer",unknown="who asked for it",
 orgs={"County Personnel Office","Regional Staffing Service","District Works Department"},
 claim={kind="dispatch",title="Transfer notice / {CODE}",
  found="A carbon transfer notice, its lower edge softened by damp. The name in the destination box is written in a heavier hand than the rest of the form.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\n{P1} is released from {A} and reports to {B} from Monday.\nRequested by: (box left empty)\nAuthorising officer: to follow under separate cover.",
  meaning="A staff move recorded without recording who asked for it. That could be a rota fixed over the telephone and filed badly, or a placement someone preferred not to sign for. The receiving address is a real place to compare accounts."},
 response={kind="receipt",title="Receiving roster / {CODE}",
  found="A duty roster torn along the fold, with the week's names typed and one added by hand.",
  text="July {D2}, 1993\n{P2} / {B}\nRecord: {CODE}\nRoster for the week beginning Monday, checked against the establishment list.",
  agree="{P1} appears on our copy in the correct hand, with the transfer reference against the name.",
  dispute="We did not request anyone. {P1} is on nobody's establishment list here, and the name has been added to our roster in ink that is not mine.",
  meaning="One office says a person was sent; the other says what its own paperwork shows. A roster is a record of intention as much as of fact, and neither copy proves where the person actually went."},
 review={kind="notepad",title="File review / {CODE}",
  found="An internal review sheet with two staple holes and a pencil tick beside 'complete' that has been crossed out rather than erased.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nBoth copies held on file.",
  agree="The move is confirmed at both ends. The requesting authority is still blank, and a confirmed arrival is not the same as an authorised one.",
  dispute="The two copies do not agree and the file has nevertheless been marked closed. Retain both; do not correct one from the other.",
  meaning="Somebody wanted the disagreement preserved, or somebody wanted it tidied. The sheet raises a question about authority without answering who exercised it."}},

{id="signed-by-someone-absent",title="Signed for by someone who was not there",code="SG",
 subject="the signature",unknown="whose hand it was",
 orgs={"Knox County Supply Office","Regional Distribution Depot","County Equipment Service"},
 claim={kind="dispatch",title="Delivery docket / {CODE}",
  found="A delivery docket in triplicate, the top copy gone. The signature box is filled in a broad confident hand and the printed name beneath it in another.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nDelivered to {B} and signed for at the door.\nReceived by: {P2}\nTime not entered.",
  meaning="A signature is the whole of the evidence that anything arrived. It could have been given by a colleague standing in, as colleagues do, or by someone with a reason to use another name."},
 response={kind="receipt",title="Attendance note / {CODE}",
  found="A short attendance note on lined paper, folded twice and kept in a pocket rather than filed.",
  text="July {D2}, 1993\n{A}\nRecord: {CODE}\nStaff accounted for on the day in question.",
  agree="{P2} was on site and signed personally. The entry matches the docket.",
  dispute="{P2} was away all that day at a funeral two towns over, and three people here will say so. The signature on the docket is not theirs.",
  meaning="Two records place the same person in two places. One of them is wrong, and nothing in either says which - an absent colleague's name is signed every day in every workplace for perfectly ordinary reasons."},
 review={kind="notepad",title="Query sheet / {CODE}",
  found="A query sheet with a torn corner and a coffee ring across the lower half.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nQuery raised on the signature against this record.",
  agree="Answered: the recipient confirms the signature is their own. The query is closed without a countersignature.",
  dispute="No answer received. The query has been marked closed by someone who did not sign the closure.",
  meaning="A closed query is not a settled one. Who closed it, and on what basis, is the part the sheet does not record."}},

{id="two-start-dates",title="The employee with two start dates",code="ST",
 subject="the start date",unknown="where the missing months were spent",
 orgs={"McCoy Logging Corp","Knox County Public Works","Fossoil Regional Office"},
 claim={kind="letter",title="Employment record / {CODE}",
  found="A personnel card with a punched corner, the top line typed and the date beneath it written over an erasure.",
  text="{ORG}\nRecord: {CODE}\nEmployee: {P1}\nCommenced service: March 1993, at {A}.\nPrevious employment: not stated.\nReferences: held elsewhere.",
  meaning="A start date with an erasure under it. Records are retyped for dull reasons every day, and they are also retyped when a date has become inconvenient."},
 response={kind="receipt",title="Union card / {CODE}",
  found="A membership card in a plastic sleeve gone cloudy at the edges, the stamps on the reverse running in a neat column.",
  text="Record: {CODE}\nMember: {P1}\nAdmitted: November 1992.\nSite of employment at admission: {B}.",
  agree="Transferred to {A} in March 1993; the stamps run unbroken through the change.",
  dispute="No stamps at all between November and March. The column resumes as if nothing had been missed.",
  meaning="The two documents differ by eight months. That is a gap in paperwork, not a proven gap in a life; people leave and are rehired, and clerks copy the date they are given."},
 review={kind="notepad",title="Records note / {CODE}",
  found="A note clipped to an empty folder, the clip rusted into the paper.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nFile requested for the period in question.",
  agree="Both dates now on file with a note explaining the rehire. The explanation is unsigned.",
  dispute="The earlier file cannot be produced. It is recorded as sent for review and not returned.",
  meaningAgree="An explanation nobody signed is worth exactly as much as the person who wrote it, and there is no way to tell from here who that was.",
  meaning="A file that cannot be produced is the most ordinary thing in an office and the most useful thing to a person with something to keep out of it."}},

{id="resignation-after-payslip",title="The last week of a job",code="RS",
 subject="the resignation",unknown="who wrote it",
 orgs={"Knox County Schools","Regional Health Service","{A} Site Office"},
 claim={kind="letter",title="Letter of resignation / {CODE}",
  found="A short letter on ruled paper, the ink pressed hard enough to emboss the reverse. The signature sits noticeably lower and smaller than the text.",
  text="July {D2}, 1993\nRecord: {CODE}\nI am leaving my position at {A} with immediate effect and thank you for the years.\nNothing further is owed to me.\n{P2}",
  meaning="A resignation that asks for nothing. People do write those, and people also write them on someone else's behalf when a form is needed to close a file."},
 response={kind="receipt",title="Final payslip / {CODE}",
  found="A payslip still in its window envelope, the address panel showing a name that is not the addressee's.",
  text="{ORG}\nRecord: {CODE}\nFinal payment to {P2}, issued July {D1}, 1993.\nReason for leaving: resigned.",
  agree="Dated after the letter and countersigned by the site clerk.",
  dispute="Issued the day before the letter it relies on, and countersigned by nobody.",
  meaning="Payroll is often ahead of paperwork; that is why payroll departments exist. It is also the order things happen in when the letter is written afterwards to match the payment."},
 review={kind="notepad",title="Leavers list / {CODE}",
  found="A leavers list for the month with one entry underlined twice.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nLeavers reconciled against final payments.",
  agree="Entry reconciles. The handwriting on the letter was not compared with anything.",
  dispute="Entry does not reconcile and has been left underlined rather than corrected.",
  meaning="Somebody noticed and stopped short of writing down what they suspected. The underlining is the whole of their comment."}},

{id="address-that-only-receives",title="The address that receives but never sends",code="AD",
 subject="the deliveries",unknown="who was there to take them",
 orgs={"Regional Supply Office","County Equipment Service","Valu-Line Distribution"},
 claim={kind="dispatch",title="Delivery schedule / {CODE}",
  found="A folded delivery schedule with a column of dates down one side, eleven months of them, and a single address repeated the whole way down.",
  text="{ORG}\nRecord: {CODE}\nStanding delivery to {B}, monthly, since August 1992.\nReturns to date: none.\nAccess: leave at side door. Do not call at the front.",
  meaning="Eleven months of arrivals and nothing ever going back. That describes a store room, and it also describes a place where things were not meant to be seen leaving."},
 response={kind="receipt",title="Utility record / {CODE}",
  found="A utility statement in a window envelope, the consumption column a row of identical low figures.",
  text="Record: {CODE}\nAccount for {B}.\nBilling period covers the same eleven months.",
  agree="Occupied throughout; the readings are small but they are not nothing.",
  dispute="No occupancy recorded. The account is held in the name of {ORG} rather than a resident, and the readings do not move.",
  meaning="A building can consume nothing and still be in use, and can consume a little and be empty. The statement narrows the question without closing it."},
 review={kind="notepad",title="Route review / {CODE}",
  found="A route review sheet with the driver's copy stapled behind it.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nStanding deliveries reviewed for the quarter.",
  agree="Retained on the schedule. No contact name is recorded for the address.",
  dispute="Marked for removal from the schedule, then reinstated in a different hand on the same day.",
  meaningAgree="An address kept on a schedule with no contact name behind it is normal in a large organisation, and is also how a place stays supplied without being visited.",
  meaning="Somebody took the address off a list and somebody put it back within hours. Neither of them wrote down why."}},

{id="identical-inventories",title="Two buildings, one inventory",code="IN",
 subject="the inventory",unknown="which building it describes",
 orgs={"MassGenFac Stores","Regional Distribution Depot","County Equipment Service"},
 claim={kind="dispatch",title="Stock list / {CODE}",
  found="A stock list on continuous paper, the perforated edges still attached, itemised down to a crate recorded as damaged.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nStock held at {A}, counted and certified.\nIncludes one crate noted damaged in transit, retained pending inspection.",
  meaning="An inventory is a claim about a place at a moment. It is only as good as the person who walked the aisles, and sometimes nobody walked them."},
 response={kind="receipt",title="Second stock list / {CODE}",
  found="A near-identical list from another site, the same typeface, the same column widths, the same smudge in the margin.",
  text="Record: {CODE}\nStock held at {B}, counted and certified the same week.",
  agree="Differs from the first in three lines, as two real counts of similar stores would.",
  dispute="Identical to the first line for line, including the damaged crate and its number. Two buildings four miles apart cannot hold the same damaged crate.",
  meaning="A template copied and never updated explains this completely. So does a count that was never made, at a site nobody wanted counted."},
 review={kind="notepad",title="Audit note / {CODE}",
  found="An audit note in pencil, half of it rubbed out and rewritten.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nBoth lists received and compared.",
  agree="Difference accounted for. Certified by initials that do not appear on the establishment list.",
  dispute="Comparison abandoned. The note ends mid-sentence and the file was closed the same day.",
  meaningAgree="Initials that appear on no establishment list certified this. That is a gap in a record of who works there, before it is anything else.",
  meaning="An audit that stops mid-sentence has a reason, and the reason is not on the page."}},

{id="room-not-on-the-plan",title="The room that is not on the plan",code="RM",
 subject="the callout",unknown="which room was worked on",
 orgs={"County Building Maintenance","District Works Department","{B} Facilities Office"},
 claim={kind="dispatch",title="Maintenance callout / {CODE}",
  found="A callout slip on carbonless paper, the pressure marks of the missing top copy still legible across it.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nAttend {B}, room 14. Ventilation, second visit.\nWork completed and signed off.\nParts: not listed.",
  meaning="A room number is the least suspicious thing on a form until the building does not have that room. Numbering schemes change and old ones outlive the drawings."},
 response={kind="receipt",title="Floor plan copy / {CODE}",
  found="A blueprint copy folded to a quarter of its size, the creases worn through where it has been opened and refolded.",
  text="Record: {CODE}\nPlan of {B}, revision of 1989.\nRooms numbered 1 to 12 on the ground floor and 1 to 9 above.",
  agree="A pencil addition in the margin extends the ground floor numbering to 14.",
  dispute="No room 14 appears anywhere on the plan, and no revision since 1989 is on file.",
  meaning="Either the drawing is out of date or the work is described as happening somewhere that does not exist. Buildings are altered far more often than plans are redrawn."},
 review={kind="notepad",title="Works ledger / {CODE}",
  found="A works ledger open at July, held flat by a bent paperclip.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nCallout reconciled against the works ledger.",
  agree="Reconciles. The signature accepting the work is a set of initials and nothing more.",
  dispute="Does not reconcile. The ledger shows the crew elsewhere that afternoon.",
  meaning="Two records of the same hours. Crews are moved without the ledger being told, and hours are also written down for work that was not done."}},

{id="lease-outlived-tenant",title="The lease that outlived the tenant",code="LS",
 subject="the tenancy",unknown="who holds the keys now",
 orgs={"Knox County Property Trust","Regional Estates Office","Valu-Line Distribution"},
 claim={kind="letter",title="Rent statement / {CODE}",
  found="A rent statement on headed paper, the letterhead a different name from the one in the body of the letter.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nQuarterly rent received for the unit at {A}, paid on time and in full.\nTenant of record: {ORG}.\nCorrespondence to be sent to {B}.",
  meaning="Rent paid punctually is the least remarkable fact in any file. It becomes a question only when set against who is meant to be inside."},
 response={kind="receipt",title="Key return note / {CODE}",
  found="A short note on a compliments slip, a key tag outline stamped into the paper where something was once taped to it.",
  text="Record: {CODE}\nKeys for the unit at {A} returned to the office, two years ago this month.\nHandover completed. Nothing outstanding.",
  agree="A second set was issued afterwards, signed for by {P1}.",
  dispute="No further set was ever issued, and the payments have continued every quarter since.",
  meaning="A standing order nobody cancelled explains a paid lease. It does not explain who has been going in, if anyone has."},
 review={kind="notepad",title="Property review / {CODE}",
  found="A property review sheet with a column for 'inspected' left blank down its whole length.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nUnit listed for quarterly inspection.",
  agree="Inspected. The inspecting officer's name is recorded as illegible.",
  dispute="Not inspected in two years. Each quarter carries the note 'access not obtained'.",
  meaningAgree="An inspection recorded with an illegible name is an inspection nobody can be asked about. Offices produce that by accident constantly.",
  meaning="Access not obtained can mean nobody had the time or nobody was let in. The sheet was designed to record the visit, not the reason it failed."}},

{id="load-that-got-lighter",title="The load that got lighter",code="LD",
 subject="the load",unknown="what came off it",
 orgs={"McCoy Logging Corp","Regional Haulage Service","Fossoil Transport"},
 claim={kind="dispatch",title="Weighbridge ticket / {CODE}",
  found="A weighbridge ticket printed on thin paper, the figures struck through the ribbon hard enough to tear it in one place.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nLoaded at {A}. Gross weight recorded at the bridge.\nDestination: {B}. Direct, no scheduled stop.\nDriver's name not entered.",
  meaning="A weight and a destination. Everything interesting about this ticket is what the second weighbridge says."},
 response={kind="receipt",title="Arrival ticket / {CODE}",
  found="A second weighbridge ticket, the same day, the same reference, on a different machine's paper.",
  text="Record: {CODE}\nUnloaded at {B}, the same afternoon.\nGross weight recorded on arrival.",
  agree="Within the tolerance the two bridges are known to differ by. Signed at both ends.",
  dispute="Short by more than either bridge has ever been out. No unloading stop is recorded between them.",
  meaning="Scales disagree; every haulier knows it. A difference larger than the scales explain has two readings, and the ticket supports neither on its own."},
 review={kind="notepad",title="Weights review / {CODE}",
  found="A review page from a ring binder, the holes torn open on one side.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nBridge weights reviewed for the week.",
  agree="Both bridges calibrated within the month. The discrepancy is inside the certificate.",
  dispute="Calibration certificate for one bridge cannot be found. The reviewer has written 'ask again' and not signed.",
  meaningAgree="A difference inside the certificate is a difference nobody has to explain. That may be the end of it, or the reason it ends there.",
  meaning="A missing certificate makes the numbers unprovable in either direction, which is convenient for whoever would rather they stayed that way - and is also just what a filing system does."}},

{id="fuel-for-a-dead-truck",title="Fuel for a vehicle that was off the road",code="FL",
 subject="the fuel account",unknown="which vehicle was being filled",
 orgs={"Fossoil Regional Office","Gas 2 Go Commercial Accounts","County Motor Pool"},
 claim={kind="dispatch",title="Fuel account statement / {CODE}",
  found="A fuel account statement, the weekly entries running down the page in an even column, each one the same rounded amount.",
  text="{ORG}\nRecord: {CODE}\nAccount for vehicle registered to {A}.\nDrawn weekly through June and July 1993.\nCard held by: {P1}.\nOdometer readings: not recorded.",
  meaning="Fuel drawn on a card, week after week, with no mileage against it. Fleet cards are used for other vehicles constantly, and are also used by people who do not want a journey in their own name."},
 response={kind="receipt",title="Maintenance log / {CODE}",
  found="A workshop log with oil-darkened page edges and a wire binding one loop short.",
  text="Record: {CODE}\nSame vehicle, same weeks.\nIn the shop at {B}.",
  agree="Released and back on the road each Friday, which fits the drawings.",
  dispute="Stripped for parts the whole month. The engine is recorded as out of the vehicle.",
  meaning="A vehicle cannot be fuelled and dismantled at once, but a card can be used away from its vehicle any day of the week. The log narrows who, not why."},
 review={kind="notepad",title="Account query / {CODE}",
  found="A query note with the account number copied out twice, once wrongly and once corrected.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nAccount queried against the workshop record.",
  agree="Explained as another vehicle on the same card. No registration is given for it.",
  dispute="No explanation offered. The card was not stopped.",
  meaning="Nobody stopped the card. That is either indifference or someone protecting the arrangement, and a query note cannot tell you which."}},

{id="returned-cleaner",title="The equipment that came back cleaner",code="HR",
 subject="the hire",unknown="where it had been",
 orgs={"County Equipment Service","Regional Plant Hire","{A} Site Office"},
 claim={kind="dispatch",title="Hire note / {CODE}",
  found="A hire note with a carbon so faint the lower half must be read at an angle.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nItems hired to {A} for four days.\nCondition on issue: fair, marked and scratched as expected.\nHirer: {P1}.",
  meaning="A hire note describes the condition of things going out so that an argument can be settled when they come back. This one is about to become that argument."},
 response={kind="receipt",title="Return note / {CODE}",
  found="A return note with two sets of initials in the same ink, one written over a hesitation.",
  text="Record: {CODE}\nItems returned to {B} on time and complete.",
  agree="Condition on return: fair, as issued. Nothing further to record.",
  dispute="Condition on return: better than on issue. Cleaned, repainted in part, and one serial plate replaced.",
  meaning="Somebody was being generous about wear, or somebody removed the marks by which a particular item could be recognised. A return note records the state of a thing, never the reason for it."},
 review={kind="notepad",title="Hire ledger note / {CODE}",
  found="A ledger note beside a column of hire references, one of them circled.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nReturn checked against the issue note.",
  agree="Accepted without comment. No serial numbers were compared.",
  dispute="Serial numbers do not match the issue note. The entry has been initialled anyway.",
  meaningAgree="Serial numbers that were never compared cannot contradict anything. An item can leave the system as one thing and come back as another simply because nobody looked.",
  meaning="An item accepted back under the wrong serial has left the system as one thing and returned as another. Clerks do this in a hurry every week."}},

{id="two-crates-one-number",title="Two crates, one number",code="CR",
 subject="the crate reference",unknown="which crate is which",
 orgs={"MassGenFac Stores","Regional Distribution Depot","County Equipment Service"},
 claim={kind="dispatch",title="Goods receipt / {CODE}",
  found="A goods receipt from a bound book, the stub still attached along its perforation.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nOne crate received at {A}, reference as above.\nSigned at the gate. Contents not entered.",
  meaning="A reference number is how a crate is spoken about after it stops being visible. Two crates sharing one is an ordinary printing error and a very tidy way to move something twice."},
 response={kind="receipt",title="Second goods receipt / {CODE}",
  found="A second receipt from the same book, eight leaves further on, the same reference printed at its head.",
  text="Record: {CODE}\nOne crate received at {B}, eight days later.\nSigned at the gate. Contents not entered.\nNeither receipt is cancelled.",
  agree="A reprint is noted on the stub of the book, in the storeman's hand.",
  dispute="No reprint is noted anywhere, and the book runs in sequence either side.",
  meaning="One number, two crates, two gates. Print runs repeat numbers; so do people who need a second movement to look like the first."},
 review={kind="notepad",title="Stores review / {CODE}",
  found="A stores review sheet folded into a pocket-sized square and unfolded many times.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nDuplicate reference reviewed.",
  agree="Recorded as a printing fault; the book was withdrawn from use.",
  dispute="Both receipts stand. The reviewer notes that only one crate can be found.",
  meaningAgree="A book withdrawn from use takes its stubs with it. The fault is recorded and the means of checking it is gone.",
  meaning="Only one crate can be found. That is a fact about a search, not about a crate, and searches end for all sorts of reasons."}},

{id="paid-before-ordered",title="Paid before it was ordered",code="PY",
 subject="the payment",unknown="who authorised it",
 orgs={"County Accounts Office","County Finance Department","Regional Supply Office"},
 claim={kind="dispatch",title="Requisition / {CODE}",
  found="A requisition form with the office copy's blue tint, its authorisation box bearing a signature and no printed name.",
  text="{ORG}\nJuly {D2}, 1993\nRecord: {CODE}\nGoods requisitioned by {A} for delivery to {B}.\nValue entered. Description entered as 'as agreed'.\nAuthorised by: signature only.",
  meaning="A requisition describing its goods as 'as agreed' is either shorthand between people who speak daily, or a description written to avoid being one."},
 response={kind="receipt",title="Payment slip / {CODE}",
  found="A carbon payment slip with a smudged duplicate line, kept in a wallet fold rather than filed.",
  text="Record: {CODE}\nPayment made against the requisition above.\nRaised July {D1}, 1993.\nCounter-signature: none.",
  agree="Dated after the requisition, in the ordinary way.",
  dispute="Dated the day before the requisition it settles, by someone who signed nothing else that month.",
  meaning="Invoices are backdated in every accounts office in the county. They are also backdated to make a payment that was already made look like a purchase."},
 review={kind="notepad",title="Ledger note / {CODE}",
  found="A ledger note in a fine hand, the numerals formed carefully enough to be read upside down across a desk.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nEntry examined during the monthly reconciliation.",
  agree="Reconciled. The authorising signature was not compared with any specimen.",
  dispute="Not reconciled. The signature does not resemble the specimen held on file.",
  meaning="A specimen signature settles a question of hands, not of intent. Somebody may have signed for a colleague at a desk, as happens hourly."}},

{id="overtime-nobody-worked",title="The overtime nobody worked",code="OT",
 subject="the night shift",unknown="who was on the site",
 orgs={"County Public Works","McCoy Logging Corp","{B} Site Office"},
 claim={kind="dispatch",title="Timesheet / {CODE}",
  found="A timesheet with the week ruled off in pencil and the night hours added in pen afterwards.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nNight shift worked at {B} by {P2}, eight hours.\nApproved by: {P1}.\nNo task description entered.",
  meaning="Approved overtime with no task against it. Supervisors are generous with hours for good reasons and for bad ones, and the sheet does not distinguish them."},
 response={kind="receipt",title="Gate log / {CODE}",
  found="A gate log in a hardback book, ruled in columns, the ink changing colour halfway down the page.",
  text="Record: {CODE}\nEntries for the night in question at {B}.",
  agree="{P2} signed in at the gate and out again at first light, as the timesheet says.",
  dispute="The gate was locked at six and nobody signed in or out. The page for that night has no entries at all.",
  meaning="An empty page can mean an empty site or an unmanned gate. A log records what the gate saw, which is not the same as what happened."},
 review={kind="notepad",title="Payroll query / {CODE}",
  found="A payroll query slip with the amount circled and a question mark beside it.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nHours queried before payment.",
  agree="Query answered by the approving supervisor. Paid.",
  dispute="Query unanswered. Paid anyway, on the authority of the same signature that approved the hours.",
  meaning="The person who approved the hours also settled the question about them. That is poor practice everywhere and it is not, by itself, evidence of anything else."}},

{id="closure-announced-twice",title="A closure announced twice",code="CL",
 subject="the closure",unknown="whether the place was still working",
 orgs={"Knox County Administration","Regional Health Service","MassGenFac"},
 claim={kind="letter",title="Public notice / {CODE}",
  found="A public notice cut from a local paper, the newsprint gone amber, with a pin hole at each corner where it once hung.",
  text="{ORG}\nRecord: {CODE}\nThe facility at {A} closed to the public in May 1993.\nEnquiries to {B}.\nStaff have been redeployed; no further work is planned at the site.",
  meaning="A closure notice is written for the public. What it says about the inside of a building is only ever what somebody chose to publish."},
 response={kind="receipt",title="Internal memo / {CODE}",
  found="An internal memo on thin duplicator paper, the purple ink faded at the top of the page and strong at the bottom.",
  text="Record: {CODE}\nCirculation: site supervisors only.\nJuly {D2}, 1993.",
  agree="Refers to the site at {A} in the past tense throughout, consistent with the notice.",
  dispute="Refers to the site at {A} as operating, in the present tense, and asks that deliveries continue to the side entrance.",
  meaning="A template reused without editing produces exactly this. So does a facility that was announced closed and was not."},
 review={kind="notepad",title="Circulation note / {CODE}",
  found="A circulation note with a list of initials down the side, one of them scratched out.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nMemo circulated and recovered.",
  agree="All copies returned and destroyed as routine.",
  dispute="One copy is unaccounted for. The note asks that it be found and does not say why.",
  meaningAgree="Copies returned and destroyed as routine is exactly what routine looks like, and exactly what it would look like if it were not.",
  meaning="Recovering circulated copies is ordinary practice for confidential paper. The urgency in the wording is the only unusual thing here, and urgency is not proof."}},

{id="appointment-out-of-order",title="The medical appointment that came first",code="MD",
 subject="the follow-up",unknown="when the patient was first seen",
 orgs={"Knox County Health Office","Regional Health Service","{B} Medical Centre"},
 claim={kind="dispatch",title="Follow-up note / {CODE}",
  found="A clinic note on a small pre-printed card, the boxes filled in a fast professional hand that thins towards the end of each line.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nFollow-up review for {P2}, seen at {B}.\nCondition described as unchanged since the first attendance.\nNext review: not scheduled.",
  meaning="A follow-up is written to sit on top of a first visit. Everything about this card depends on a document nobody has produced."},
 response={kind="receipt",title="Attendance card / {CODE}",
  found="An attendance card from a card index, the top edge furred from being drawn out often.",
  text="Record: {CODE}\nAttendances recorded for {P2} at {B}.",
  agree="A first attendance is recorded in June, before the review, as it should be.",
  dispute="No first attendance is recorded at all. The card begins with the follow-up.",
  meaning="Two clerks and one calendar produce this every week. So does a patient seen somewhere that did not keep cards."},
 review={kind="notepad",title="Records check / {CODE}",
  found="A records check sheet with a column of ticks and one blank space left deliberately wide.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nSequence checked for the month.",
  agree="Sequence in order once the June card is counted.",
  dispute="Sequence out of order and left uncorrected, with the note 'ask the doctor' and no answer beneath it.",
  meaningAgree="The sequence works once a card in another drawer is counted. Whether that card describes this patient is a question the check did not ask.",
  meaning="Nobody asked, or nobody wrote the answer down. A gap in a card index is a gap in an index."}},

{id="file-signed-out",title="The file that was signed out and never returned",code="FC",
 subject="the missing file",unknown="who took it",
 orgs={"Knox County Courthouse","Rosewood Correctional","County Records Office"},
 claim={kind="dispatch",title="Records log / {CODE}",
  found="A records log in a bound book, every line filled in the same office hand except one, which is written with a different pen and slopes the other way.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nFile drawn from the registry at {A}.\nTaken by: initials only.\nReturn expected: same day.",
  meaning="A set of initials that appear nowhere else in the book. Staff sign out files for other people constantly; the book is not designed to prove who stood at the counter."},
 response={kind="receipt",title="Registry list / {CODE}",
  found="A registry list of outstanding files, typed, with one line added at the bottom by hand.",
  text="Record: {CODE}\nFiles outstanding at {A} as at July {D2}, 1993.",
  agree="The file is listed as returned to the shelf, initialled by the registry clerk.",
  dispute="The file is still listed as outstanding, and the entry has been carried forward each week without comment.",
  meaning="Files are mis-shelved and lost in every registry in the state. A file carried forward without comment for weeks is either forgotten or not to be asked about."},
 review={kind="notepad",title="Registry review / {CODE}",
  found="A review sheet with the registry's stamp applied twice, once crookedly.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nOutstanding files reviewed.",
  agree="Recovered. The reviewer notes the initials were never identified.",
  dispute="Not recovered. The reviewer has written the initials out in full letters and then crossed them through.",
  meaningAgree="The file came back and the initials were never identified. A returned file closes a query without answering it.",
  meaning="Somebody worked out whose initials they were and thought better of writing it down. What they concluded is not on the sheet."}},

{id="missing-ledger-page",title="The page that is missing",code="LG",
 subject="the ledger",unknown="what the removed page said",
 orgs={"{A} Site Office","County Public Works","Rosewood Correctional"},
 claim={kind="dispatch",title="Duty ledger / {CODE}",
  found="A bound duty ledger. One page has been cut out close to the spine with something sharper than scissors, leaving a narrow stub of paper still attached.",
  text="{ORG}\nJuly {D1}, 1993\nRecord: {CODE}\nDuty entries for {A}.\nThe page before the cut ends mid-entry.\nThe page after begins by referring to 'the above'.",
  meaning="A spoiled page cut out and rewritten is ordinary bookkeeping. A page cut out that both neighbours still refer to is a hole with a shape."},
 response={kind="receipt",title="Carbon duplicate / {CODE}",
  found="A duplicate book of the same period, its carbons thin and blue.",
  text="Record: {CODE}\nDuplicates for the same days at {A}.",
  agree="The duplicate for the missing day survives and is unremarkable: two names and a delivery time.",
  dispute="The duplicate for the missing day is gone from this book as well, cut at the same place.",
  meaning="One removal is an accident. Two matching removals in different books is a decision - though whose, and about what, is not written anywhere that remains."},
 review={kind="notepad",title="Ledger note / {CODE}",
  found="A loose note tucked into the ledger at the cut, the paper a different weight from the book's.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nDamage to the ledger noted.",
  agree="Recorded as accidental damage; the entries were rewritten from the duplicate.",
  dispute="Recorded as damage of unknown origin. No rewriting was attempted.",
  meaningAgree="Entries rewritten from a duplicate are only as good as the duplicate. Nobody recorded who did the rewriting, or when.",
  meaning="A book that nobody tried to reconstruct was either unimportant or better left incomplete. The note does not say which and the person who wrote it did not sign."}},

{id="photograph-without-a-name",title="The photograph with no caption",code="PH",
 subject="the photograph",unknown="who the unnamed person is",
 orgs={"{A} Site Office","McCoy Logging Corp","Knox County Schools"},
 claim={kind="letter",title="Staff photograph / {CODE}",
  found="A workplace photograph, curling at two corners. On the reverse, names are written in a careful column with a pencil that has been sharpened partway down the list.",
  text="Record: {CODE}\nTaken at {A}, spring 1993.\nNames as written on the reverse.\nThe last line of the column is left blank, and the blank has been ruled off.",
  meaning="A photograph with one name short. Nobody knew the temporary staff member's surname is the likeliest answer, and it is an answer that leaves a person unaccounted for."},
 response={kind="receipt",title="Establishment list / {CODE}",
  found="An establishment list, typed, with a column of job titles and one line where the title is filled in and the name is not.",
  text="Record: {CODE}\nStaff on the establishment at {A} for that quarter.",
  agree="The count matches the photograph once the temporary staff are added at the foot.",
  dispute="The count is one short of the faces in the photograph, and no temporary staff are listed at all.",
  meaning="Establishment lists lag behind the people actually on a site by weeks. The difference is a gap in a list before it is anything else."},
 review={kind="notepad",title="Personnel note / {CODE}",
  found="A personnel note paperclipped to nothing, the clip shape rusted onto the page.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nQuery on staff numbers for the quarter.",
  agree="Answered: agency cover, not carried on the list. No agency is named.",
  dispute="Unanswered. The note has been filed rather than pursued.",
  meaning="An unnamed face and an unnamed agency are two absences, not one fact. Neither becomes a person until something else names them."}},

{id="withdrawn-extension",title="The number that was withdrawn",code="EX",
 subject="the extension",unknown="what department used it",
 orgs={"Knox County Administration","MassGenFac","Regional Health Service"},
 claim={kind="dispatch",title="Internal directory / {CODE}",
  found="An internal telephone directory, a single folded sheet, worn soft along the crease and annotated in three different hands.",
  text="{ORG}\nRecord: {CODE}\nDirectory for {A}, issue of spring 1993.\nOne extension is listed without a department beside it.\nBeside it, in pencil: 'ask for the desk, not the name'.",
  meaning="An extension with no department is a line that somebody answered. Directories are printed with errors constantly, and departments are also left off them on purpose."},
 response={kind="receipt",title="Revised directory / {CODE}",
  found="The next issue of the same sheet, crisper, with fewer annotations.",
  text="Record: {CODE}\nDirectory for {A}, issue of summer 1993.",
  agree="The extension now carries a department name, added in the reprint.",
  dispute="The extension is blank in this issue, and the department it belonged to appears in neither.",
  meaning="Reorganisations remove lines from directories every year without anybody explaining them. This one leaves a number that existed and a department that does not appear to have."},
 review={kind="notepad",title="Switchboard note / {CODE}",
  found="A switchboard note on a message pad, the carbon sheet beneath it still bearing the pressure of a call that was taken.",
  text="{ORG}\nJuly {D3}, 1993\nRecord: {CODE}\nCalls to the extension in question.",
  agree="Redirected to {B} on request. A name is given for the person taking them.",
  dispute="Recorded as 'no longer connected' while three calls that week are logged as answered.",
  meaning="A switchboard records what an operator was told to write. Both entries could be true of the same afternoon, which is exactly why neither settles it."}},
}

-- Ordered ids. Callers must never rely on Lua table iteration order: the
-- generator picks a premise from the case seed, and a case must rebuild
-- identically on every machine and every Lua implementation for
-- Generator.validate to accept it after a reload.
local ORDER={}
for i,premise in ipairs(P) do ORDER[i]=premise.id end

-- Load-time checks. A premise with a missing field or an impossible carrier
-- would otherwise fail at case generation, in play, on one seed in twenty.
local ANCHORS={"claim","response","review"}
local seenId,seenCode={},{}
for _,premise in ipairs(P) do
    assert(type(premise.id)=="string" and #premise.id>0,"premise needs an id")
    assert(not seenId[premise.id],"duplicate premise id "..premise.id)
    seenId[premise.id]=true
    assert(type(premise.code)=="string" and #premise.code>=2,"premise "..premise.id.." needs a reference prefix")
    assert(not seenCode[premise.code],"duplicate premise code "..premise.code)
    seenCode[premise.code]=true
    for _,field in ipairs({"title","subject","unknown"}) do
        assert(type(premise[field])=="string" and #premise[field]>0,"premise "..premise.id.." needs "..field)
    end
    assert(type(premise.orgs)=="table" and #premise.orgs==3,"premise "..premise.id.." needs three organisations")
    for _,org in ipairs(premise.orgs) do
        assert(type(org)=="string" and #org>0,"premise "..premise.id.." has an empty organisation")
        assert(not org:find("{ORG}",1,true),"premise "..premise.id.." organisation cannot reference {ORG}")
    end
    for _,anchor in ipairs(ANCHORS) do
        local doc=premise[anchor]
        assert(type(doc)=="table","premise "..premise.id.." needs a "..anchor)
        for _,field in ipairs({"kind","title","found","text","meaning"}) do
            assert(type(doc[field])=="string" and #doc[field]>0,
                "premise "..premise.id.."'s "..anchor.." needs "..field)
        end
        if doc.meaningAgree~=nil then
            assert(type(doc.meaningAgree)=="string" and #doc.meaningAgree>0,
                "premise "..premise.id.."'s "..anchor.." has an empty meaningAgree")
        end
        if anchor~="claim" then
            for _,field in ipairs({"agree","dispute"}) do
                assert(type(doc[field])=="string" and #doc[field]>0,
                    "premise "..premise.id.."'s "..anchor.." needs "..field)
            end
        end
    end
end

function M.count() return #ORDER end

function M.list()
    local out={}
    for i,id in ipairs(ORDER) do out[i]=id end
    return out
end

local function copy(v)
    if type(v)~="table" then return v end
    local out={}
    for k,c in pairs(v) do out[k]=copy(c) end
    return out
end

function M.get(id)
    for _,premise in ipairs(P) do if premise.id==id then return copy(premise) end end
    return nil,"unknown premise"
end

-- Deterministic premise choice. `random` must be the caller's seeded PRNG
-- (Generator.rng), exactly as EvidenceRoles.choose requires, so the same seed
-- always tells the same story.
function M.choose(random)
    if type(random)~="function" then return nil,"random generator required" end
    return copy(P[random(#P)])
end

return M
