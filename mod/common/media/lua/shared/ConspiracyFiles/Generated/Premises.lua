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
-- names, {SUBJECT} the premise's own noun for the matter, {UNKNOWN} the thing
-- the paperwork cannot settle.
--
-- Dates come from the case calendar (Generator.calendar, P4-R108, owner
-- 2026-09-15) and are whole phrases, never a day spliced into a month:
-- {DATE1} the claim, {DATE2} the response, {DATE3} the review ("June 14,
-- 1993"; claim < response < review, all by 8 July 1993), {DATE0} the day
-- before the claim, {DATE1CAPS}/{DATE2CAPS} the same in capitals, {DAYS12} the
-- gap from claim to response ("four days"), {PRIORMONTH} the month before the
-- claim's ("April"; the claim is May or June, so always 1993), {SINCE11} the
-- month and year eleven months before the claim's. A relative phrase ("the day
-- before", "for four days", "four months") is written from these or checked
-- against them - see `asserts` below and test/premise_consistency.lua.
--
-- Drafted by AI; ships without a separate approval step (P4-R97). See
-- docs/design/PREMISES.md for the prose originals and the owner's selection.
local M={}

-- Each entry: id, title, subject, unknown, orgs (3), an optional
-- `reviewOptional`,
-- and three anchor documents - claim, response, review - each with a carrier
-- `kind`, a `title`, a physical `found` description, the document's own `text`,
-- and a `meaning` that must never assert a conclusion. The response and review
-- additionally carry `agree` and `dispute` lines; the case outline picks one,
-- which is what makes the same premise readable two ways.
--
-- `reviewOptional` marks a premise whose claim and response already hold the
-- whole disagreement. For those the review - somebody inside the organisation
-- looking at the pair and doing less about it than the reader would like - is
-- worth having but is not load-bearing, so the case may end on the
-- contradiction itself. Thirteen of the twenty are marked; the other seven
-- need their review, because the point of those cases IS what the office did
-- next.
--
-- `meaning` is the reading for the disputing case; `meaningAgree` replaces it
-- when the case corroborates. EVERY RESPONSE CARRIES ONE (P4-R107, owner
-- 2026-09-15): the audit found a dozen responses whose only meaning said "one
-- of them is wrong" or "backdated" beside a line saying the records matched. A
-- review carries one wherever its meaning speaks to only one branch. The
-- `found` text is read in both branches, so it describes the evidence and never
-- which way the evidence goes.
--
-- `asserts` (optional, read only by test/premise_consistency.lua) says what a
-- relative phrase in the premise is relative TO, so the test can check it on
-- every calendar: `days` lists date pairs one of whose gap any "N days" or "the
-- day before" must equal; `months` the two month references a "N months" is
-- counted between; `precedes="dispute"` marks a premise whose disputing response
-- is dated before its claim, which is the point of that premise. A relative
-- phrase with no assert fails the test.
local P={
{id="transfer-nobody-arranged",title="A transfer nobody arranged",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A rota somebody filed badly.","A move nobody would sign for."},
 subject="the transfer",unknown="who asked for it",
 orgs={"County Personnel Office","Regional Staffing Service","District Works Department"},
 claim={kind="dispatch",title="Transfer notice / {CODE}",
  found="A carbon transfer notice, its lower edge softened by damp. The name in the destination box is written in a heavier hand than the rest of the form.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\n{P1} is released from {A} and reports to {B} from Monday.\nRequested by: (box left empty)\nAuthorising officer: to follow under separate cover.",
  meaning="A staff move recorded without recording who asked for it. That could be a rota fixed over the telephone and filed badly, or a placement someone preferred not to sign for. The receiving address is a real place to compare accounts."},
 response={kind="receipt",title="Receiving roster / {CODE}",
  found="A duty roster torn along the fold, with the week's names typed and one added by hand.",
  text="{DATE2}\n{P2} / {B}\nRecord: {CODE}\nRoster for the week beginning Monday, checked against the establishment list.",
  agree="{P1} appears on our copy in the correct hand, with the transfer reference against the name.",
  dispute="We did not request anyone. {P1} is on nobody's establishment list here, and the name has been added to our roster in ink that is not mine.",
  meaningAgree="Both offices have the person on paper. A roster is a record of intention as much as of fact, and two copies that line up still do not show where the person actually went.",
  meaning="One office says a person was sent; the other says what its own paperwork shows. A roster is a record of intention as much as of fact, and neither copy proves where the person actually went."},
 review={kind="notepad",title="File review / {CODE}",
  found="An internal review sheet with two staple holes and a pencil tick beside 'complete' that has been crossed out rather than erased.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nBoth copies held on file.",
  agree="The move is confirmed at both ends. The requesting authority is still blank, and a confirmed arrival is not the same as an authorised one.",
  dispute="The two copies do not agree and the file has nevertheless been marked closed. Retain both; do not correct one from the other.",
  meaningAgree="A move confirmed at both ends with nobody named as asking for it can be an office that forgot to fill in a box, or an arrival somebody preferred to happen without a name against it.",
  meaning="Somebody wanted the disagreement preserved, or somebody wanted it tidied. The sheet raises a question about authority without answering who exercised it."}},

{id="signed-by-someone-absent",reviewOptional=true,title="Signed for by someone who was not there",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A colleague signing for it.","Someone using another name."},
 subject="the signature",unknown="whose hand it was",
 orgs={"Knox County Supply Office","Regional Distribution Depot","County Equipment Service"},
 claim={kind="dispatch",title="Delivery docket / {CODE}",
  found="A delivery docket in triplicate, the top copy gone. The signature box is filled in a broad confident hand and the printed name beneath it in another.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nDelivered to {B} and signed for at the door.\nReceived by: {P2}\nTime not entered.",
  meaning="A signature is the whole of the evidence that anything arrived. It could have been given by a colleague standing in, as colleagues do, or by someone with a reason to use another name."},
 -- Headed {B}, where the docket says it was signed and where the note is
 -- filed; it was headed {A} (P4-R107, 2026-09-15).
 response={kind="receipt",title="Attendance note / {CODE}",
  found="A short attendance note on lined paper, folded twice and kept in a pocket rather than filed.",
  text="{DATE2}\n{B}\nRecord: {CODE}\nStaff accounted for on the day in question.",
  agree="{P2} was on site and signed personally. The entry matches the docket.",
  dispute="{P2} was away all that day at a funeral two towns over, and three people here will say so. The signature on the docket is not theirs.",
  meaningAgree="The note and the docket put the same person at the same door. That is an ordinary delivery, and it is also a note written by the office that had most reason to want the docket to stand.",
  meaning="Two records place the same person in two places. One of them is wrong, and nothing in either says which - an absent colleague's name is signed every day in every workplace for perfectly ordinary reasons."},
 review={kind="notepad",title="Query sheet / {CODE}",
  found="A query sheet with a torn corner and a coffee ring across the lower half.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nQuery raised on the signature against this record.",
  agree="Answered: the recipient confirms the signature is their own. The query is closed without a countersignature.",
  dispute="No answer received. The query has been marked closed by someone who did not sign the closure.",
  meaning="A closed query is not a settled one. Who closed it, and on what basis, is the part the sheet does not record."}},

{id="two-start-dates",reviewOptional=true,title="The employee with two start dates",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A record retyped for no reason.","A date that became inconvenient."},
 subject="the start date",unknown="where the missing months were spent",
 orgs={"McCoy Logging Corp","Knox County Public Works","Fossoil Regional Office"},
 asserts={months={"November 1992","March 1993"}},
 claim={kind="letter",title="Employment record / {CODE}",
  found="A personnel card with a punched corner, the top line typed and the date beneath it written over an erasure.",
  text="{ORG}\nRecord: {CODE}\nEmployee: {P1}\nCommenced service: March 1993, at {A}.\nPrevious employment: not stated.\nReferences: held elsewhere.",
  meaning="A start date with an erasure under it. Records are retyped for dull reasons every day, and they are also retyped when a date has become inconvenient."},
 response={kind="receipt",title="Union card / {CODE}",
  found="A membership card in a plastic sleeve gone cloudy at the edges, the stamps on the reverse running in a neat column.",
  text="Record: {CODE}\nMember: {P1}\nAdmitted: November 1992.\nSite of employment at admission: {B}.",
  agree="Transferred to {A} in March 1993; the stamps run unbroken through the change.",
  dispute="No stamps at all between November and March. The column resumes as if nothing had been missed.",
  -- Four months, November to March; it said eight (P4-R107, 2026-09-15).
  meaningAgree="The two start dates are four months apart and the card calls the change a transfer. Clerks copy the date they are given, and a transfer is also the tidiest word to write across a gap.",
  meaning="The two documents differ by four months. That is a gap in paperwork, not a proven gap in a life; people leave and are rehired, and clerks copy the date they are given."},
 review={kind="notepad",title="Records note / {CODE}",
  found="A note clipped to a folder, the clip rusted into the paper.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nFile requested for the period in question.",
  agree="Both dates now on file with a note explaining the transfer. The explanation is unsigned.",
  dispute="The earlier file cannot be produced. It is recorded as sent for review and not returned.",
  meaningAgree="An explanation nobody signed is worth exactly as much as the person who wrote it, and there is no way to tell from here who that was.",
  meaning="A file that cannot be produced is the most ordinary thing in an office and the most useful thing to a person with something to keep out of it."}},

-- The payslip is dated after the letter where the records agree and the day
-- before it where they do not, so the order each line states is true on every
-- calendar. It was dated before the letter in both (P4-R107, 2026-09-15).
{id="resignation-after-payslip",title="The last week of a job",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A plain letter of resignation.","A letter written to close a file."},
 subject="the resignation",unknown="who wrote it",
 orgs={"Knox County Schools","Regional Health Service","{A} Site Office"},
 asserts={days={{"{DATE1}","{DATE2}"},{"{DATE0}","{DATE1}"}},precedes="dispute"},
 claim={kind="letter",title="Letter of resignation / {CODE}",
  found="A short letter on ruled paper, the ink pressed hard enough to emboss the reverse. The signature sits noticeably lower and smaller than the text.",
  text="{DATE1}\nRecord: {CODE}\nI am leaving my position at {A} with immediate effect and thank you for the years.\nNothing further is owed to me.\n{P2}",
  meaning="A resignation that asks for nothing. People do write those, and people also write them on someone else's behalf when a form is needed to close a file."},
 response={kind="receipt",title="Final payslip / {CODE}",
  found="A payslip still in its window envelope, the address panel showing a name that is not the addressee's.",
  text="{ORG}\nRecord: {CODE}\nFinal payment to {P2}.\nReason for leaving: resigned.",
  agree="Issued {DATE2}, {DAYS12} after the letter, and countersigned by the site clerk.",
  dispute="Issued {DATE0}, the day before the letter it relies on, and countersigned by nobody.",
  meaningAgree="The payslip follows the letter, which is the order payroll is meant to work in. That is a department doing its job, or a file put together in the right order by someone who knew it would be read.",
  meaning="Payroll is often ahead of paperwork; that is why payroll departments exist. It is also the order things happen in when the letter is written afterwards to match the payment."},
 review={kind="notepad",title="Leavers list / {CODE}",
  found="A leavers list for the month with one entry underlined twice.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nLeavers reconciled against final payments.",
  agree="Entry reconciles. The handwriting on the letter was not compared with anything.",
  dispute="Entry does not reconcile and has been left underlined rather than corrected.",
  meaningAgree="A reconciled entry settles the payroll and leaves the handwriting alone. Nobody was asked to compare it, which is ordinary, and which is also how a letter written by someone else goes through.",
  meaning="Somebody noticed and stopped short of writing down what they suspected. The underlining is the whole of their comment."}},

{id="address-that-only-receives",reviewOptional=true,title="The address that receives but never sends",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"Just a store room.","Things leaving out of sight."},
 subject="the deliveries",unknown="who was there to take them",
 orgs={"Regional Supply Office","County Equipment Service","Valu-Line Distribution"},
 -- Eleven months from {SINCE11} to the schedule's own date. It said "since
 -- August 1992", eleven months only if the case fell in July (2026-09-15).
 asserts={months={"{SINCE11}","{DATE1}"}},
 claim={kind="dispatch",title="Delivery schedule / {CODE}",
  found="A folded delivery schedule with a column of dates down one side, eleven months of them, and a single address repeated the whole way down.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nStanding delivery to {B}, monthly, since {SINCE11}.\nReturns to date: none.\nAccess: leave at side door. Do not call at the front.",
  meaning="Eleven months of arrivals and nothing ever going back. That describes a store room, and it also describes a place where things were not meant to be seen leaving."},
 response={kind="receipt",title="Utility record / {CODE}",
  found="A utility statement in a window envelope, the consumption column a row of identical low figures.",
  text="Record: {CODE}\nAccount for {B}.\nBilling period covers the same eleven months.",
  agree="Occupied throughout; the readings are small but they are not nothing.",
  dispute="No occupancy recorded. The account is held in the name of {ORG} rather than a resident, and the readings do not move.",
  meaningAgree="Small steady readings fit a building somebody uses lightly. They fit a store room with one light on a timer just as well. The statement narrows the question without closing it.",
  meaning="A building can consume nothing and still be in use, and can consume a little and be empty. The statement narrows the question without closing it."},
 review={kind="notepad",title="Route review / {CODE}",
  found="A route review sheet with the driver's copy stapled behind it.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nStanding deliveries reviewed for the quarter.",
  agree="Retained on the schedule. No contact name is recorded for the address.",
  dispute="Marked for removal from the schedule, then reinstated in a different hand on the same day.",
  meaningAgree="An address kept on a schedule with no contact name behind it is normal in a large organisation, and is also how a place stays supplied without being visited.",
  meaning="Somebody took the address off a list and somebody put it back within hours. Neither of them wrote down why."}},

{id="identical-inventories",reviewOptional=true,title="Two buildings, one inventory",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A lazy count copied across.","A count made up on purpose."},
 subject="the inventory",unknown="which building it describes",
 orgs={"MassGenFac Stores","Regional Distribution Depot","County Equipment Service"},
 claim={kind="dispatch",title="Stock list / {CODE}",
  found="A stock list on continuous paper, the perforated edges still attached, itemised down to a crate recorded as damaged.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nStock held at {A}, counted and certified.\nIncludes one crate noted damaged in transit, retained pending inspection.",
  meaning="An inventory is a claim about a place at a moment. It is only as good as the person who walked the aisles, and sometimes nobody walked them."},
 -- The found text no longer mentions "the same smudge", which told the reader
 -- the lists were copies before either line did; and the two sites are within
 -- one reach radius, never four miles apart (P4-R107, 2026-09-15).
 response={kind="receipt",title="Second stock list / {CODE}",
  found="A second stock list from another site, in the same typeface and the same column widths.",
  text="Record: {CODE}\nStock held at {B}, counted and certified the same week.",
  agree="Differs from the first in three lines, as two real counts of similar stores would.",
  dispute="Identical to the first line for line, including the damaged crate and its number. Two buildings across town cannot hold the same damaged crate.",
  meaningAgree="Two counts of similar stores a few lines apart is what honest counting looks like. It is also what a copied list looks like once somebody has changed a few lines.",
  meaning="A template copied and never updated explains this completely. So does a count that was never made, at a site nobody wanted counted."},
 review={kind="notepad",title="Audit note / {CODE}",
  found="An audit note in pencil, half of it rubbed out and rewritten.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nBoth lists received and compared.",
  agree="Difference accounted for. Certified by initials that do not appear on the establishment list.",
  dispute="Comparison abandoned. The note ends mid-sentence and the file was closed the same day.",
  meaningAgree="Initials that appear on no establishment list certified this. That is a gap in a record of who works there, before it is anything else.",
  meaning="An audit that stops mid-sentence has a reason, and the reason is not on the page."}},

{id="room-not-on-the-plan",title="The room that is not on the plan",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"An old numbering scheme.","A room kept off the drawings."},
 subject="the callout",unknown="which room was worked on",
 orgs={"County Building Maintenance","District Works Department","{B} Facilities Office"},
 claim={kind="dispatch",title="Maintenance callout / {CODE}",
  found="A callout slip on carbonless paper, the pressure marks of the missing top copy still legible across it.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nAttend {B}, room 14. Ventilation, second visit.\nWork completed and signed off.\nParts: not listed.",
  meaning="A room number is the least suspicious thing on a form until the building does not have that room. Numbering schemes change and old ones outlive the drawings."},
 response={kind="receipt",title="Floor plan copy / {CODE}",
  found="A blueprint copy folded to a quarter of its size, the creases worn through where it has been opened and refolded.",
  text="Record: {CODE}\nPlan of {B}, revision of 1989.\nRooms numbered 1 to 12 on the ground floor and 1 to 9 above.",
  agree="A pencil addition in the margin extends the ground floor numbering to 14.",
  dispute="No room 14 appears anywhere on the plan, and no revision since 1989 is on file.",
  meaningAgree="A pencil addition is how most buildings are kept track of between redrawings. It is also how a room reaches a plan after somebody needs it to be there.",
  meaning="Either the drawing is out of date or the work is described as happening somewhere that does not exist. Buildings are altered far more often than plans are redrawn."},
 -- "Open at July" named a month the case may not be in (2026-09-15).
 review={kind="notepad",title="Works ledger / {CODE}",
  found="A works ledger held flat by a bent paperclip.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nCallout reconciled against the works ledger.",
  agree="Reconciles. The signature accepting the work is a set of initials and nothing more.",
  dispute="Does not reconcile. The ledger shows the crew elsewhere that afternoon.",
  meaningAgree="The ledger and the callout account for the same hours. Accepting work on initials alone is common practice, and it also leaves nobody in particular to ask.",
  meaning="Two records of the same hours. Crews are moved without the ledger being told, and hours are also written down for work that was not done."}},

{id="lease-outlived-tenant",title="The lease that outlived the tenant",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A standing order nobody stopped.","Someone still using the place."},
 subject="the tenancy",unknown="who holds the keys now",
 orgs={"Knox County Property Trust","Regional Estates Office","Valu-Line Distribution"},
 -- The found text said the letterhead and the body named different names while
 -- both printed {ORG}; the body now names a tenant (P4-R107, 2026-09-15).
 claim={kind="letter",title="Rent statement / {CODE}",
  found="A rent statement on headed paper, the tenant's name typed into the body in a different typeface from the rest.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nQuarterly rent received for the unit at {A}, paid on time and in full.\nTenant of record: {P1}.\nCorrespondence to be sent to {B}.",
  meaning="Rent paid punctually is the least remarkable fact in any file. It becomes a question only when set against who is meant to be inside."},
 response={kind="receipt",title="Key return note / {CODE}",
  found="A short note on a compliments slip, a key tag outline stamped into the paper where something was once taped to it.",
  text="Record: {CODE}\nKeys for the unit at {A} returned to the office, two years ago this month.\nHandover completed. Nothing outstanding.",
  agree="A second set was issued afterwards, signed for by {P1}.",
  dispute="No further set was ever issued, and the payments have continued every quarter since.",
  meaningAgree="A second set of keys explains why the rent kept coming. Whether {P1} is the one using them, or only the one who signed for them, is not on the note.",
  meaning="A standing order nobody cancelled explains a paid lease. It does not explain who has been going in, if anyone has."},
 -- The found text said the 'inspected' column was blank while the agreeing
 -- line said "Inspected." It now describes the sheet only.
 review={kind="notepad",title="Property review / {CODE}",
  found="A property review sheet with a column headed 'inspected' and a signature box at the foot.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nUnit listed for quarterly inspection.",
  agree="Inspected. The inspecting officer's name is recorded as illegible.",
  dispute="Not inspected in two years. Each quarter carries the note 'access not obtained'.",
  meaningAgree="An inspection recorded with an illegible name is an inspection nobody can be asked about. Offices produce that by accident constantly.",
  meaning="Access not obtained can mean nobody had the time or nobody was let in. The sheet was designed to record the visit, not the reason it failed."}},

{id="load-that-got-lighter",reviewOptional=true,title="The load that got lighter",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A weighbridge that was wrong.","Part of the load going elsewhere."},
 subject="the load",unknown="what came off it",
 orgs={"McCoy Logging Corp","Regional Haulage Service","Fossoil Transport"},
 claim={kind="dispatch",title="Weighbridge ticket / {CODE}",
  found="A weighbridge ticket printed on thin paper, the figures struck through the ribbon hard enough to tear it in one place.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nLoaded at {A}. Gross weight recorded at the bridge.\nDestination: {B}. Direct, no scheduled stop.\nDriver's name not entered.",
  meaning="A weight and a destination. Everything interesting about this ticket is what the second weighbridge says."},
 response={kind="receipt",title="Arrival ticket / {CODE}",
  found="A second weighbridge ticket, the same day, the same reference, on a different machine's paper.",
  text="Record: {CODE}\nUnloaded at {B}, the same afternoon.\nGross weight recorded on arrival.",
  agree="Within the tolerance the two bridges are known to differ by. Signed at both ends.",
  dispute="Short by more than either bridge has ever been out. No unloading stop is recorded between them.",
  meaningAgree="Two bridges within their known tolerance is the ordinary result. A load can also be lightened by no more than the tolerance would hide, and neither ticket could show it.",
  meaning="Scales disagree; every haulier knows it. A difference larger than the scales explain has two readings, and the ticket supports neither on its own."},
 review={kind="notepad",title="Weights review / {CODE}",
  found="A review page from a ring binder, the holes torn open on one side.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nBridge weights reviewed for the week.",
  agree="Both bridges calibrated within the month. The discrepancy is inside the certificate.",
  dispute="Calibration certificate for one bridge cannot be found. The reviewer has written 'ask again' and not signed.",
  meaningAgree="A difference inside the certificate is a difference nobody has to explain. That may be the end of it, or the reason it ends there.",
  meaning="A missing certificate makes the numbers unprovable in either direction, which is convenient for whoever would rather they stayed that way - and is also just what a filing system does."}},

{id="fuel-for-a-dead-truck",reviewOptional=true,title="Fuel for a vehicle that was off the road",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"The card used for another van.","A journey kept off someone's name."},
 subject="the fuel account",unknown="which vehicle was being filled",
 orgs={"Fossoil Regional Office","Gas 2 Go Commercial Accounts","County Motor Pool"},
 -- "Through June and July 1993" was read in early July at the latest; the
 -- account now runs from the month before the claim (P4-R107, 2026-09-15).
 claim={kind="dispatch",title="Fuel account statement / {CODE}",
  found="A fuel account statement, the weekly entries running down the page in an even column, each one the same rounded amount.",
  text="{ORG}\nRecord: {CODE}\nAccount for vehicle registered to {A}.\nDrawn weekly since {PRIORMONTH} 1993.\nCard held by: {P1}.\nOdometer readings: not recorded.",
  meaning="Fuel drawn on a card, week after week, with no mileage against it. Fleet cards are used for other vehicles constantly, and are also used by people who do not want a journey in their own name."},
 response={kind="receipt",title="Maintenance log / {CODE}",
  found="A workshop log with oil-darkened page edges and a wire binding one loop short.",
  text="Record: {CODE}\nSame vehicle, same weeks.\nIn the shop at {B}.",
  agree="Released and back on the road each Friday, which fits the drawings.",
  dispute="Stripped for parts the whole month. The engine is recorded as out of the vehicle.",
  meaningAgree="A vehicle back on the road each Friday can use a week's fuel. With no odometer readings, the same drawings would fit fuel that went into something else just as well.",
  meaning="A vehicle cannot be fuelled and dismantled at once, but a card can be used away from its vehicle any day of the week. The log narrows who, not why."},
 -- "Explained as another vehicle" answered a question the agreeing log never
 -- raised: that log has the vehicle on the road (P4-R107, 2026-09-15).
 review={kind="notepad",title="Account query / {CODE}",
  found="A query note with the account number copied out twice, once wrongly and once corrected.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nAccount queried against the workshop record.",
  agree="Explained by the workshop's release dates. No odometer readings were asked for.",
  dispute="No explanation offered. The card was not stopped.",
  meaningAgree="The query was closed on the workshop's dates alone. That is a fair answer to a fuel query, and it is also one that never asks where the fuel went.",
  meaning="Nobody stopped the card. That is either indifference or someone protecting the arrangement, and a query note cannot tell you which."}},

{id="returned-cleaner",title="The equipment that came back cleaner",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"Ordinary cleaning before return.","Something being cleaned away."},
 subject="the hire",unknown="where it had been",
 orgs={"County Equipment Service","Regional Plant Hire","{A} Site Office"},
 -- The hire runs from the claim to the response, the day it came back "on
 -- time"; it was "four days" whatever the dates said (P4-R107, 2026-09-15).
 asserts={days={{"{DATE1}","{DATE2}"}}},
 claim={kind="dispatch",title="Hire note / {CODE}",
  found="A hire note with a carbon so faint the lower half must be read at an angle.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nItems hired to {A} for {DAYS12}.\nCondition on issue: fair, marked and scratched as expected.\nHirer: {P1}.",
  meaning="A hire note describes the condition of things going out so that an argument can be settled when they come back. This one is the note any such argument would start from."},
 response={kind="receipt",title="Return note / {CODE}",
  found="A return note with two sets of initials in the same ink, one written over a hesitation.",
  text="Record: {CODE}\nItems returned to {B} on time and complete.",
  agree="Condition on return: fair, as issued. Nothing further to record.",
  dispute="Condition on return: better than on issue. Cleaned, repainted in part, and one serial plate replaced.",
  meaningAgree="Equipment back in the condition it went out in is what a hire note hopes for. It is also what a return looks like when nobody checked closely enough to see anything else.",
  meaning="Somebody was being generous about wear, or somebody removed the marks by which a particular item could be recognised. A return note records the state of a thing, never the reason for it."},
 review={kind="notepad",title="Hire ledger note / {CODE}",
  found="A ledger note beside a column of hire references, one of them circled.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nReturn checked against the issue note.",
  agree="Accepted without comment. No serial numbers were compared.",
  dispute="Serial numbers do not match the issue note. The entry has been initialled anyway.",
  meaningAgree="Serial numbers that were never compared cannot contradict anything. An item can leave the system as one thing and come back as another simply because nobody looked.",
  meaning="An item accepted back under the wrong serial has left the system as one thing and returned as another. Clerks do this in a hurry every week."}},

{id="two-crates-one-number",reviewOptional=true,title="Two crates, one number",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A printing error.","One thing moved twice."},
 subject="the crate reference",unknown="which crate is which",
 orgs={"MassGenFac Stores","Regional Distribution Depot","County Equipment Service"},
 -- The second crate arrives on the response's day. "Eight days later" could
 -- land after the review that looked at both (P4-R107, 2026-09-15).
 asserts={days={{"{DATE1}","{DATE2}"}}},
 claim={kind="dispatch",title="Goods receipt / {CODE}",
  found="A goods receipt from a bound book, the stub still attached along its perforation.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nOne crate received at {A}, reference as above.\nSigned at the gate. Contents not entered.",
  meaning="A reference number is how a crate is spoken about after it stops being visible. Two crates sharing one is an ordinary printing error and a very tidy way to move something twice."},
 response={kind="receipt",title="Second goods receipt / {CODE}",
  found="A second receipt from the same book, eight leaves further on, the same reference printed at its head.",
  text="Record: {CODE}\nOne crate received at {B}, {DAYS12} later.\nSigned at the gate. Contents not entered.\nNeither receipt is cancelled.",
  agree="A reprint is noted on the stub of the book, in the storeman's hand.",
  dispute="No reprint is noted anywhere, and the book runs in sequence either side.",
  meaningAgree="One number, two crates, and a reprint noted on the stub. Print runs repeat numbers, and a note on a stub is also an easy thing to add afterwards.",
  meaning="One number, two crates, two gates. Print runs repeat numbers; so do people who need a second movement to look like the first."},
 review={kind="notepad",title="Stores review / {CODE}",
  found="A stores review sheet folded into a pocket-sized square and unfolded many times.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nDuplicate reference reviewed.",
  agree="Recorded as a printing fault; the book was withdrawn from use.",
  dispute="Both receipts stand. The reviewer notes that only one crate can be found.",
  meaningAgree="A book withdrawn from use takes its stubs with it. The fault is recorded and the means of checking it is gone.",
  meaning="Only one crate can be found. That is a fact about a search, not about a crate, and searches end for all sorts of reasons."}},

-- Same construction as the resignation: after the requisition where the
-- records agree, the day before it where they do not. Generator leaves out its
-- own "Payment slip / {CODE}" for this premise, whose response already is one.
{id="paid-before-ordered",reviewOptional=true,title="Paid before it was ordered",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"Shorthand between old contacts.","Words chosen to say nothing."},
 subject="the payment",unknown="who authorised it",
 orgs={"County Accounts Office","County Finance Department","Regional Supply Office"},
 asserts={days={{"{DATE1}","{DATE2}"},{"{DATE0}","{DATE1}"}},precedes="dispute"},
 claim={kind="dispatch",title="Requisition / {CODE}",
  found="A requisition form with the office copy's blue tint, its authorisation box bearing a signature and no printed name.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nGoods requisitioned by {A} for delivery to {B}.\nValue entered. Description entered as 'as agreed'.\nAuthorised by: signature only.",
  meaning="A requisition describing its goods as 'as agreed' is either shorthand between people who speak daily, or a description written to avoid being one."},
 response={kind="receipt",title="Payment slip / {CODE}",
  found="A carbon payment slip with a smudged duplicate line, kept in a wallet fold rather than filed.",
  text="Record: {CODE}\nPayment made against the requisition above.\nCounter-signature: none.",
  agree="Raised {DATE2}, {DAYS12} after the requisition, in the ordinary way.",
  dispute="Raised {DATE0}, the day before the requisition it settles, by someone who signed nothing else that month.",
  meaningAgree="Payment following the order is the ordinary sequence. With no counter-signature it is also a payment one person could raise alone, whenever it suited them.",
  meaning="Invoices are backdated in every accounts office in the county. They are also backdated to make a payment that was already made look like a purchase."},
 review={kind="notepad",title="Ledger note / {CODE}",
  found="A ledger note in a fine hand, the numerals formed carefully enough to be read upside down across a desk.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nEntry examined during the monthly reconciliation.",
  agree="Reconciled. The authorising signature was not compared with any specimen.",
  dispute="Not reconciled. The signature does not resemble the specimen held on file.",
  meaningAgree="A signature never set beside its specimen is neither genuine nor forged on paper. Reconciliations skip that step all the time, and it is also the step that would have caught one.",
  meaning="A specimen signature settles a question of hands, not of intent. Somebody may have signed for a colleague at a desk, as happens hourly."}},

{id="overtime-nobody-worked",reviewOptional=true,title="The overtime nobody worked",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A generous supervisor.","Hours paid for something else."},
 subject="the night shift",unknown="who was on the site",
 orgs={"County Public Works","McCoy Logging Corp","{B} Site Office"},
 claim={kind="dispatch",title="Timesheet / {CODE}",
  found="A timesheet with the week ruled off in pencil and the night hours added in pen afterwards.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nNight shift worked at {B} by {P2}, eight hours.\nApproved by: {P1}.\nNo task description entered.",
  meaning="Approved overtime with no task against it. Supervisors are generous with hours for good reasons and for bad ones, and the sheet does not distinguish them."},
 response={kind="receipt",title="Gate log / {CODE}",
  found="A gate log in a hardback book, ruled in columns, the ink changing colour halfway down the page.",
  text="Record: {CODE}\nEntries for the night in question at {B}.",
  agree="{P2} signed in at the gate and out again at first light, as the timesheet says.",
  dispute="The gate was locked at six and nobody signed in or out. The page for that night has no entries at all.",
  meaningAgree="A name signed in and out at the gate puts that name at the gate. A log records what the gate saw, which is not the same as eight hours of work inside it.",
  meaning="An empty page can mean an empty site or an unmanned gate. A log records what the gate saw, which is not the same as what happened."},
 review={kind="notepad",title="Payroll query / {CODE}",
  found="A payroll query slip with the amount circled and a question mark beside it.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nHours queried before payment.",
  agree="Query answered by the approving supervisor. Paid.",
  dispute="Query unanswered. Paid anyway, on the authority of the same signature that approved the hours.",
  meaning="The person who approved the hours also settled the question about them. That is poor practice everywhere and it is not, by itself, evidence of anything else."}},

{id="closure-announced-twice",title="A closure announced twice",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"Just a public notice.","A story told for the public."},
 subject="the closure",unknown="whether the place was still working",
 orgs={"Knox County Administration","Regional Health Service","MassGenFac"},
 -- Closed the month before the claim's, so the memo is always after the
 -- closure. "May 1993" put a May memo before or beside it (2026-09-15).
 claim={kind="letter",title="Public notice / {CODE}",
  found="A public notice cut from a local paper, the newsprint gone amber, with a pin hole at each corner where it once hung.",
  text="{ORG}\nRecord: {CODE}\nThe facility at {A} closed to the public in {PRIORMONTH} 1993.\nEnquiries to {B}.\nStaff have been redeployed; no further work is planned at the site.",
  meaning="A closure notice is written for the public. What it says about the inside of a building is only ever what somebody chose to publish."},
 response={kind="receipt",title="Internal memo / {CODE}",
  found="An internal memo on thin duplicator paper, the purple ink faded at the top of the page and strong at the bottom.",
  text="Record: {CODE}\nCirculation: site supervisors only.\n{DATE2}.",
  agree="Refers to the site at {A} in the past tense throughout, consistent with the notice.",
  dispute="Refers to the site at {A} as operating, in the present tense, and asks that deliveries continue to the side entrance.",
  meaningAgree="A memo in the past tense is what a closure looks like from the inside. Keeping it to site supervisors is ordinary for a closure, and ordinary for one with something still going on.",
  meaning="A template reused without editing produces exactly this. So does a facility that was announced closed and was not."},
 review={kind="notepad",title="Circulation note / {CODE}",
  found="A circulation note with a list of initials down the side, one of them scratched out.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nMemo circulated and recovered.",
  agree="All copies returned and destroyed as routine.",
  dispute="One copy is unaccounted for. The note asks that it be found and does not say why.",
  meaningAgree="Copies returned and destroyed as routine is exactly what routine looks like, and exactly what it would look like if it were not.",
  meaning="Recovering circulated copies is ordinary practice for confidential paper. The urgency in the wording is the only unusual thing here, and urgency is not proof."}},

{id="appointment-out-of-order",reviewOptional=true,title="The medical appointment that came first",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A first record that got lost.","A visit that was never logged."},
 subject="the follow-up",unknown="when the patient was first seen",
 orgs={"Knox County Health Office","Regional Health Service","{B} Medical Centre"},
 claim={kind="dispatch",title="Follow-up note / {CODE}",
  found="A clinic note on a small pre-printed card, the boxes filled in a fast professional hand that thins towards the end of each line.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nFollow-up review for {P2}, seen at {B}.\nCondition described as unchanged since the first attendance.\nNext review: not scheduled.",
  meaning="A follow-up is written to sit on top of a first visit. Everything about this card depends on an earlier record of that visit."},
 -- The first attendance is in the month before the follow-up. "In June" came
 -- after a May follow-up; and the review's "another drawer" contradicted a
 -- first attendance on this same card (P4-R107, 2026-09-15).
 response={kind="receipt",title="Attendance card / {CODE}",
  found="An attendance card from a card index, the top edge furred from being drawn out often.",
  text="Record: {CODE}\nAttendances recorded for {P2} at {B}.",
  agree="A first attendance is recorded in {PRIORMONTH}, before the review, as it should be.",
  dispute="No first attendance is recorded at all. The card begins with the follow-up.",
  meaningAgree="A first attendance before the follow-up is the order a card index expects. A first entry can also be written onto a card later, so that it reads in that order.",
  meaning="Two clerks and one calendar produce this every week. So does a patient seen somewhere that did not keep cards."},
 review={kind="notepad",title="Records check / {CODE}",
  found="A records check sheet with a column of ticks and one space in it left wider than the rest.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nSequence checked for the month.",
  agree="Sequence in order once the {PRIORMONTH} attendance is counted.",
  dispute="Sequence out of order and left uncorrected, with the note 'ask the doctor' and no answer beneath it.",
  meaningAgree="The sequence works once the earlier attendance is counted. Whether that entry was written at the time or afterwards is a question the check did not ask.",
  meaning="Nobody asked, or nobody wrote the answer down. A gap in a card index is a gap in an index."}},

{id="file-signed-out",title="The file that was signed out and never returned",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A file signed out for someone.","Someone hiding who took it."},
 subject="the missing file",unknown="who took it",
 orgs={"Knox County Courthouse","Rosewood Correctional","County Records Office"},
 -- The list is {DAYS12} after the file was drawn, not "each week" or "for
 -- weeks" (P4-R107, 2026-09-15).
 asserts={days={{"{DATE1}","{DATE2}"}}},
 claim={kind="dispatch",title="Records log / {CODE}",
  found="A records log in a bound book, every line filled in the same office hand except one, which is written with a different pen and slopes the other way.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nFile drawn from the registry at {A}.\nTaken by: initials only.\nReturn expected: same day.",
  meaning="A set of initials that appear nowhere else in the book. Staff sign out files for other people constantly; the book is not designed to prove who stood at the counter."},
 response={kind="receipt",title="Registry list / {CODE}",
  found="A registry list of outstanding files, typed, with one line added at the bottom by hand.",
  text="Record: {CODE}\nFiles outstanding at {A} as at {DATE2}.",
  agree="The file is listed as returned to the shelf, initialled by the registry clerk.",
  dispute="The file is still listed as outstanding, {DAYS12} after it was drawn, and the entry has been carried forward without comment.",
  meaningAgree="A file back on the shelf with the clerk's initials is how a registry is meant to work. The list records that it came back, not who had it while it was out.",
  meaning="Files are mis-shelved and lost in every registry in the state. A file carried forward without comment is either forgotten or not to be asked about."},
 review={kind="notepad",title="Registry review / {CODE}",
  found="A review sheet with the registry's stamp applied twice, once crookedly.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nOutstanding files reviewed.",
  agree="Recovered. The reviewer notes the initials were never identified.",
  dispute="Not recovered. The reviewer has written the initials out in full letters and then crossed them through.",
  meaningAgree="The file came back and the initials were never identified. A returned file closes a query without answering it.",
  meaning="Somebody worked out whose initials they were and thought better of writing it down. What they concluded is not on the sheet."}},

{id="missing-ledger-page",reviewOptional=true,title="The page that is missing",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A spoiled page, rewritten.","A page removed on purpose."},
 subject="the ledger",unknown="what the removed page said",
 orgs={"{A} Site Office","County Public Works","Rosewood Correctional"},
 claim={kind="dispatch",title="Duty ledger / {CODE}",
  found="A bound duty ledger. One page has been cut out close to the spine with something sharper than scissors, leaving a narrow stub of paper still attached.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nDuty entries for {A}.\nThe page before the cut ends mid-entry.\nThe page after begins by referring to 'the above'.",
  meaning="A spoiled page cut out and rewritten is ordinary bookkeeping. A page cut out that both neighbours still refer to is a hole with a shape."},
 response={kind="receipt",title="Carbon duplicate / {CODE}",
  found="A duplicate book of the same period, its carbons thin and blue.",
  text="Record: {CODE}\nDuplicates for the same days at {A}.",
  agree="The duplicate for the missing day survives and is unremarkable: two names and a delivery time.",
  dispute="The duplicate for the missing day is gone from this book as well, cut at the same place.",
  meaningAgree="A surviving duplicate makes the missing day look ordinary: two names and a delivery time. Pages are not usually cut out for being unremarkable, and the duplicate cannot say why this one was.",
  meaning="One removal is an accident. Two matching removals in different books is a decision - though whose, and about what, is not written anywhere that remains."},
 review={kind="notepad",title="Ledger note / {CODE}",
  found="A loose note tucked into the ledger at the cut, the paper a different weight from the book's.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nDamage to the ledger noted.",
  agree="Recorded as accidental damage; the entries were rewritten from the duplicate.",
  dispute="Recorded as damage of unknown origin. No rewriting was attempted.",
  meaningAgree="Entries rewritten from a duplicate are only as good as the duplicate. Nobody recorded who did the rewriting, or when.",
  meaning="A book that nobody tried to reconstruct was either unimportant or better left incomplete. The note does not say which and the person who wrote it did not sign."}},

{id="photograph-without-a-name",reviewOptional=true,title="The photograph with no caption",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"Nobody knowing the temp's name.","Someone left unaccounted for."},
 subject="the photograph",unknown="who the unnamed person is",
 orgs={"{A} Site Office","McCoy Logging Corp","Knox County Schools"},
 claim={kind="photograph",title="Staff photograph / {CODE}",
  found="A workplace photograph, curling at two corners. On the reverse, names are written in a careful column with a pencil that has been sharpened partway down the list.",
  text="Record: {CODE}\nTaken at {A}, spring 1993.\nNames as written on the reverse.\nThe last line of the column is left blank, and the blank has been ruled off.",
  meaning="A photograph with one name short. Nobody knew the temporary staff member's surname is the likeliest answer, and it is an answer that leaves a person unaccounted for."},
 response={kind="receipt",title="Establishment list / {CODE}",
  found="An establishment list, typed, with a column of job titles and one line where the title is filled in and the name is not.",
  text="Record: {CODE}\nStaff on the establishment at {A} for that quarter.",
  agree="The count matches the photograph once the temporary staff are added at the foot.",
  dispute="The count is one short of the faces in the photograph, and no temporary staff are listed at all.",
  meaningAgree="Temporary staff added at the foot make the count come out. Lists are corrected that way every quarter, and a line at the foot is also the easiest kind to add after a photograph is taken.",
  meaning="Establishment lists lag behind the people actually on a site by weeks. The difference is a gap in a list before it is anything else."},
 -- The agency answer now names the staff the agreeing list carries at its
 -- foot, and the unnamed agency moved to the branch that has one (P4-R107).
 review={kind="notepad",title="Personnel note / {CODE}",
  found="A personnel note paperclipped to nothing, the clip shape rusted onto the page.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nQuery on staff numbers for the quarter.",
  agree="Answered: the temporary staff at the foot of the list are agency cover. No agency is named.",
  dispute="Unanswered. The note has been filed rather than pursued.",
  meaningAgree="An unnamed face and an unnamed agency are two absences, not one fact. Neither becomes a person until something else names them.",
  meaning="A query filed rather than pursued is the commonest end for a question about staff numbers. It also leaves the face in the photograph where it started, without a name."}},

{id="withdrawn-extension",reviewOptional=true,title="The number that was withdrawn",
 -- What the survivor may believe at the end (P4-R113, P4-R122): ordinary, then the other.
 readings={"A directory printing error.","A department left off on purpose."},
 subject="the extension",unknown="what department used it",
 orgs={"Knox County Administration","MassGenFac","Regional Health Service"},
 claim={kind="dispatch",title="Internal directory / {CODE}",
  found="An internal telephone directory, a single folded sheet, worn soft along the crease and annotated in three different hands.",
  text="{ORG}\nRecord: {CODE}\nDirectory for {A}, issue of spring 1993.\nOne extension is listed without a department beside it.\nBeside it, in pencil: 'ask for the desk, not the name'.",
  meaning="An extension with no department is a line that somebody answered. Directories are printed with errors constantly, and departments are also left off them on purpose."},
 -- Reissued on the response's date: "summer 1993" could be printed before a
 -- May review (2026-09-15).
 response={kind="receipt",title="Revised directory / {CODE}",
  found="The next issue of the same sheet, crisper, with fewer annotations.",
  text="Record: {CODE}\nDirectory for {A}, reissued {DATE2}.",
  agree="The extension now carries a department name, added in the reprint.",
  dispute="The extension is blank in this issue, and the department it belonged to appears in neither.",
  meaningAgree="A department added in a reprint is what a corrected directory looks like. It is also the easiest place to print a name that nobody will ring to check.",
  meaning="Reorganisations remove lines from directories every year without anybody explaining them. This one leaves a number that existed and a department that does not appear to have."},
 review={kind="notepad",title="Switchboard note / {CODE}",
  found="A switchboard note on a message pad, the carbon sheet beneath it still bearing the pressure of a call that was taken.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nCalls to the extension in question.",
  agree="Redirected to {B} on request. A name is given for the person taking them.",
  dispute="Recorded as 'no longer connected' while three calls that week are logged as answered.",
  meaningAgree="Calls redirected on request, with a name for whoever took them, is a switchboard doing its work. The name is only what the operator was given to write.",
  meaning="A switchboard records what an operator was told to write. Both entries could be true of the same afternoon, which is exactly why neither settles it."}},

-- THE PERSONAL OPENING (DR-20260919-BUILD-PAIR, DR-20260919-SITING).
--
-- Appended LAST on purpose. It is validated, listed and covered by
-- test/premise_consistency.lua like any other, but `choose` draws only from the
-- premises without an `opening` flag, so no existing seed tells a different
-- story than it did - the premise is the seed's most significant choice, and
-- moving those indices would rewrite every case ever generated.
--
-- {SELF} is the survivor's own name, passed in by the caller: the generator has
-- no engine access and must not acquire any. Reached in the client through
-- getDescriptor():getForename()/getSurname(), already used by CaseFile.lua and
-- KnoxApps.lua, so this adds no new Build 42 assumption.
--
-- It obeys the two rules every premise obeys. Two honest readings - a number
-- written down wrong, or one written down differently on purpose - and NOTHING
-- IS WITNESSED: the register REPORTS a visit, which is not the same as a visit
-- having happened (DR-20260919-OPENING-PAYOFF). No employer, no relative, no
-- official visitor and no proven visit appears anywhere in it.
{id="no-contact-at-premises",opening=true,reviewOptional=true,
 -- THE ESSENTIAL CHAIN (OPENING_PAIR_COMPLETION.md). The slip is link A - the
 -- case's only personal anchor, with no alternative - and the register is link
 -- C. The round sheet is corroboration: it supports that a round ran, which is
 -- a DIFFERENT claim, and its own meaning says it cannot stand in for the
 -- register. So claim and response are essential and review is not.
 essential={"claim","response"},
 title="No contact at premises",
 -- Ordinary first, then the other. Neither is chosen (P4-R113, P4-R122).
 readings={"A number written down wrong.","A number that was made wrong."},
 subject="the collection",unknown="whether anyone came",
 orgs={"Knox County Transport Office","Regional Collection Service","District Transfer Desk"},
 claim={kind="dispatch",title="Collection slip / {CODE}",
  found="A carbon slip folded twice, soft at the creases, the kind that is meant to be kept and never is.",
  text="{ORG}\n{DATE1}\nRecord: {CODE}\nName: {SELF}\nCollection scheduled: {B}\nRETAIN THIS SLIP. Do not present it at the assembly point.\nEnquiries: after 0900, by telephone only.",
  meaning="A collection was scheduled in this name, for that address. The address is not the one this was found at. That could be a number written down wrong, or a number written down differently on purpose; the slip settles neither, and the address on it is a real place to go and compare."},
 response={kind="receipt",title="Collection register / {CODE}",
  found="A register page carried on a clipboard, its top edge grubby where a thumb held it. One line is struck through in the same ink as the annotation beside it.",
  text="{DATE2}\nRecord: {CODE}\nRound: {B} and adjoining\nEntry closed.",
  agree="Attended as scheduled. Reference retained against the name.",
  dispute="No contact at premises. Entry cancelled; no further attempt scheduled under this reference.",
  meaningAgree="The register says the collection was attended and the reference kept. A register records what was entered, not what happened at a door, and an entry that agrees with a slip still does not put anyone at an address.",
  meaning="The register reports the visit as unsuccessful and closes the entry. What is established is what the record SAYS: the annotation is unsigned, so who closed it and why are not on the paper, and the report is not itself proof that anyone went."},
 review={kind="notepad",title="Round sheet / {CODE}",
  found="A round sheet with the day's street names typed down one side and a pencil tick against most of them.",
  text="{ORG}\n{DATE3}\nRecord: {CODE}\nStreet covered. Sheet held for the file.",
  agree="The round is marked covered and the entry is closed to match. Both sheets say the same thing, which is what a file is for.",
  dispute="The round is marked covered on a day an entry under this reference was closed for no contact. The sheet speaks for the street, not for a door.",
  meaningAgree="A covered round and a closed entry agree on paper. Neither says which doors were knocked on.",
  meaning="A round that covered the street, and an entry closed for no contact on it. The sheet corroborates that a round ran; it does not say this address was reached, and cannot stand in for the register."}},
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
local seenId={}
for _,premise in ipairs(P) do
    assert(type(premise.id)=="string" and #premise.id>0,"premise needs an id")
    assert(not seenId[premise.id],"duplicate premise id "..premise.id)
    seenId[premise.id]=true
    for _,field in ipairs({"title","subject","unknown"}) do
        assert(type(premise[field])=="string" and #premise[field]>0,"premise "..premise.id.." needs "..field)
    end
    assert(type(premise.orgs)=="table" and #premise.orgs==3,"premise "..premise.id.." needs three organisations")
    for _,org in ipairs(premise.orgs) do
        assert(type(org)=="string" and #org>0,"premise "..premise.id.." has an empty organisation")
        assert(not org:find("{ORG}",1,true),"premise "..premise.id.." organisation cannot reference {ORG}")
    end
    assert(premise.asserts==nil or type(premise.asserts)=="table","premise "..premise.id.." asserts must be a table")
    for _,anchor in ipairs(ANCHORS) do
        local doc=premise[anchor]
        assert(type(doc)=="table","premise "..premise.id.." needs a "..anchor)
        for _,field in ipairs({"kind","title","found","text","meaning"}) do
            assert(type(doc[field])=="string" and #doc[field]>0,
                "premise "..premise.id.."'s "..anchor.." needs "..field)
        end
        -- P4-R107: a response's meaning must fit the branch it is read in.
        if anchor=="response" then
            assert(doc.meaningAgree~=nil,"premise "..premise.id.."'s response needs meaningAgree")
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
-- The premises an ordinary case may draw. An opening premise is never drawn at
-- random: it is asked for by name, once, for the first case of a save. Built by
-- filtering rather than by slicing, so appending another opening later cannot
-- silently change what an ordinary seed picks.
local CHOOSABLE={}
for _,premise in ipairs(P) do if not premise.opening then CHOOSABLE[#CHOOSABLE+1]=premise end end

function M.choose(random)
    if type(random)~="function" then return nil,"random generator required" end
    return copy(CHOOSABLE[random(#CHOOSABLE)])
end
-- How many an ordinary case may draw from. The test holds this at twenty, so
-- adding an opening can never quietly widen the ordinary pool.
function M.choosableCount() return #CHOOSABLE end
-- The opening premise, by name rather than by chance.
function M.opening()
    for _,premise in ipairs(P) do if premise.opening then return copy(premise) end end
    return nil,"no opening premise"
end


return M
