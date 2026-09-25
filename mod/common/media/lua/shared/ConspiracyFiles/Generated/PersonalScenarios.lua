-- Authored, payoff-first personal scenarios.  This is data only: callers bind
-- placeholders and decide discovery, comparison and placement policy.
local Continuation=require("ConspiracyFiles/Generated/PersonalContinuation")
local FitnessOpenings=require("ConspiracyFiles/Generated/FitnessOpeningScenarios")
local M={}

local scenarios={
 ["no-contact-at-premises"]={
  [1]={
   question="Why did the collection in my name never come?",
   centralAxis="absence",
   event="A borrowed {ORG} vehicle was reassigned to carry a replacement mill drive belt before departure.",
   outcome="The scheduled passenger run was cancelled before it left; no replacement vehicle was allocated.",
   unresolved="I still do not know who submitted the collection request in my name.",
   readings={"The contractor protected its equipment run and documented the passenger cancellation.","The records show the cancellation, but not why this request was entered in my name."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="dispatch",title="Collection notice / {CODE}",
     observation="A folded carbon slip. My name is typed above a box marked KEEP THIS COPY.",
     source="HIRED COLLECTION — {ORG} VEHICLE\nBooking {CODE} / issued {DATE1}\nPassenger: {SELF}\nCollection point: {A}\nScheduled collection: {DATE2}, 07:00\nRetained copy for enquiries: {B}\n\nA borrowed {ORG} vehicle is assigned for this one collection. Wait at the collection point. Keep this copy if the vehicle does not arrive.",
     note="That's my name. Someone booked a lift for me from {A}, in a borrowed {ORG} vehicle. There's a file copy at {B}; I want to know whether they ever sent the driver. Useful of them to provide instructions for being left behind."},
    response={kind="notepad",title="Dispatch amendment / {CODE}",
     observation="A message clipped to a route card. ‘Passenger collection’ is crossed out once, with an amendment signed underneath.",
     source="{DATE2}, 05:40\nTo dispatch / {CODE}\n\nUse the borrowed {ORG} vehicle assigned to the 07:00 passenger collection for the replacement mill drive belt instead. Do not send a driver to {A}.\nKeep the passenger request open until replacement transport is arranged. Do not mark the passenger absent; dispatch is the part not attending.\nAmendment authorised: {P1}.",
     note="{P1} wants the vehicle sent for a mill belt instead of a passenger. Keep the request open, send nobody. The passenger can continue waiting at no additional cost."},
    review={kind="notebook",title="Dispatch returns / {CODE}",
     observation="A ruled dispatch page. Passenger and equipment entries occupy separate lines under the same vehicle number.",
     source="DISPATCH RETURNS — entered {DATE3}\nTrips for {DATE2}:\n07:00 passenger collection, {CODE}, {A}: NOT DISPATCHED.\nReason: borrowed {ORG} vehicle reassigned under {P1} amendment, 05:40. Replacement vehicle: none allocated.\nMill drive-belt transfer: departed 07:10; returned 09:25.\nPassenger request closed at end of shift. No collection recorded.\nRequest copied from a call sheet taken by {P2}; caller's name not recorded. Enquiry copies retained at {B}.\n\nVehicle log complete. Outstanding passenger requests: nil.",
     note="The belt travelled. The passenger didn't. They closed the request without sending another vehicle, which brought the outstanding total down nicely. {P2} took the original call sheet; there's an enquiry copy at {B}."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="disputes-delivery",text="My notice has a vehicle assigned to collect me at 07:00. The amendment, timed 05:40, sends that vehicle to fetch a drive belt and tells dispatch not to send a driver at all."},
    {requires={"response","review"},from="review",to="response",kind="corroborates",text="The return book cites the amendment and records the equipment trip, so the reassignment was carried out."},
    {requires={"claim","review"},from="review",to="claim",kind="disputes-delivery",text="That passenger booking is mine. The return book says no driver was sent and no replacement allocated. My copy still tells me to wait."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="Now I have the notice, the order and the result: {P1} reassigned the borrowed {ORG} vehicle, and dispatch used it for the mill belt. The belt got a ride. I got instructions. That explains the missed collection; it doesn't explain who booked me onto it."}
   },
   optional={
    {key="counter-copy",role="records",kind="receipt",title="Counter copy / {CODE}",observation="A duplicate amendment copy with a time-stamp pressed into its corner.",source="{DATE2}, 05:47\nCounter received amendment for {CODE}. Passenger collection removed from the active board.\nBoard wiped clean after entry.",note="The counter took this collection off the board at 05:47. Whoever was waiting for it had been neatly dealt with in chalk."},
    {key="deposit-refund",role="records",kind="receipt",title="Deposit refund / {CODE}",observation="A narrow receipt with a refund amount circled in pencil.",source="{DATE3}\nDeposit returned against passenger booking {CODE}.\nAuthorised by: {P1}.\nReceipt retained: accounts balanced.",note="I can see that the office recorded a refund for this booking. The receipt does not say who paid the deposit, only that the accounts were comforted."}
   },
   thread={document="review",point="{B}",question="who submitted the named collection request"}
  },
  [2]={
   question="Why was the collection in my name cancelled before its scheduled run?",
   centralAxis="records",
   event="A borrowed {ORG} vehicle was withdrawn for repair and the one-off collection deposit was refunded.",
   outcome="The office cancelled the run before departure, recorded the repair, and refunded the booking deposit.",
   unresolved="The records do not identify who placed my name on the booking.",
   readings={"The cancelled run and refund are an ordinary response to a vehicle fault.","The paperwork agrees about the cancellation, while the origin of the named request remains unrecorded."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="dispatch",title="Collection notice / {CODE}",observation="A folded carbon slip with KEEP THIS COPY boxed beside my typed name.",source="HIRED COLLECTION — {ORG} VEHICLE\nBooking {CODE} / issued {DATE1}\nPassenger: {SELF}\nCollection point: {A}\nScheduled collection: {DATE2}, 07:00\nRetained copy for enquiries: {B}\n\nA borrowed {ORG} vehicle is assigned for this one collection. Keep this copy if it does not arrive.",note="I have a one-off collection booking in my name from {A}. The notice directs enquiries to {B}, which is more useful than a promise from a borrowed truck."},
    response={kind="notepad",title="Vehicle withdrawal / {CODE}",observation="A route card with a mechanic’s note clipped over the passenger line.",source="{DATE2}, 05:35\nBorrowed {ORG} vehicle 14 withdrawn before dispatch: brake hose leak.\nPassenger collection {CODE}, {A}, CANCELLED.\nNo substitute vehicle available. Refer deposit to retained copy at {B}.\nSigned: {P1}, workshop.\n\nWorkshop note: repair queue takes priority over promises already printed.",note="I can see that the borrowed vehicle was withdrawn before dispatch and no substitute was available. The workshop had the decency to write down which promise lost the queue."},
    review={kind="receipt",title="Refund ledger / {CODE}",observation="A ledger strip with one refund line and a clerk’s initials at the margin.",source="{DATE3}\nPassenger booking {CODE}: deposit refunded after vehicle withdrawal.\nCollection did not depart.\nRequest copied from an earlier call sheet taken by {P2}; caller's name not recorded.\nFiled at: {B}.\nAccounts note: passenger matter concluded.",note="The office recorded a refund and no departure. {P2} took the call sheet that started it. The passenger matter is concluded, which must be a relief to whoever had the stamp."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="disputes-delivery",text="My notice says to wait at the collection point. The workshop card cancels that booking before dispatch and finds no substitute."},
    {requires={"response","review"},from="review",to="response",kind="corroborates",text="The refund ledger agrees that the vehicle was withdrawn and the collection did not depart."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="The three records agree: the booked collection was cancelled for repair before departure, and its deposit was refunded."}
   },
   optional={
    {key="repair-job",role="records",kind="notebook",title="Workshop job / vehicle 14",observation="A grease-smudged job entry with a time written beside the fault.",source="{DATE2}, 05:20\nVehicle 14: brake hose split. Removed from service before morning dispatch.\n{P1}\nParts request marked urgent; passenger collection marked cancelled.",note="Vehicle 14 was taken out of service at 05:20 with a split brake hose. Parts urgent, passenger cancelled. At least they spotted it before putting somebody in the thing."}
   },
   thread={document="review",point="{B}",question="who submitted the named collection request"}
 }
 },
 ["name-on-standby-list"]={
  [1]={
   question="Why was my name promoted from a standby list without an answer from me?",
   centralAxis="access",
   event="Dispatch promoted every standby name when seats appeared, then reassigned the vehicle before the passenger run.",
   outcome="No passenger trip departed; the promoted list was closed with no confirmation recorded for the named passenger.",
   unresolved="The records do not identify who first supplied my name for the standby list.",
   readings={"The office filled newly available seats from its standby list.","A name on a list became a booking without a reply from the person named."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="dispatch",title="Standby list copy / {CODE}",observation="A narrow carbon list headed STANDBY, with my name typed on the first line.",source="PASSENGER STANDBY — {ORG}\nReference {CODE} / entered {DATE1}\nName: {SELF}\nCollection point if called: {A}\nStatus: WAIT FOR CONFIRMATION. Do not report unless contacted.\nEnquiry and list copies: {B}.",note="My name is first on a standby list. It says not to report without contact, which is at least one instruction I could have followed without knowing about it."},
    response={kind="notepad",title="Seat-release instruction / {CODE}",observation="A dispatch note with STANDBY crossed out and BOOKED written above it.",source="{DATE2}, 05:30 / {CODE}\nTwo passenger seats released. Promote standby names in order and print the manifest now. Outstanding confirmations may follow; do not hold the vehicle for replies.\nAt 06:10 the borrowed {ORG} vehicle was reassigned to the mill safety crew. Passenger departure cancelled.\nEntered by: {P1}.",note="They promoted the list before collecting the answers, then gave the vehicle to the safety crew. For forty minutes I was booked with unusual efficiency."},
    review={kind="notebook",title="Standby manifest closeout / {CODE}",observation="A ruled manifest page stamped NO DEPARTURE across the passenger column.",source="MANIFEST CLOSEOUT — {DATE3}\n{CODE} / {SELF}\nName copied from standby entry taken by {P2}. Confirmation received: none recorded.\nPassenger vehicle reassigned before departure. Passenger manifest closed; no passenger collected at {A}.\nOriginal caller or source of standby name: not recorded. File retained at {B}.",note="The closeout says nobody confirmed me and nobody collected me. {P2} took the standby entry, but the source of my name never reached the file."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The first paper says standby until confirmed. The instruction promotes the name before any reply and prints it as booked."},
    {requires={"response","review"},from="review",to="response",kind="corroborates",text="The closeout confirms that the reassignment cancelled the passenger departure recorded in the instruction."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="My name moved from standby to booked without a confirmation, then the vehicle was reassigned and the manifest closed. That explains the trip that never happened, but not who supplied my name."}
   },
   optional={},thread={document="review",point="{B}",question="who supplied the named standby entry"}
  },
  [2]={
   question="Why was I printed on a passenger manifest for a dispatch exercise?",
   centralAxis="records",
   event="A clerk copied a real standby card into a training manifest and filed the printout with active passenger paperwork.",
   outcome="The exercise never dispatched a vehicle; an audit reclassified the manifest as training and removed it from the passenger count.",
   unresolved="The training correction does not identify who originally put my name on the standby card.",
   readings={"A training exercise accidentally used a real standby name.","Filing the exercise with active manifests made a rehearsal look like my travel plan."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="dispatch",title="Passenger manifest stub / {CODE}",observation="A torn manifest stub with my name beside a route from the collection point.",source="{ORG} PASSENGER MANIFEST\nExercise reference {CODE} / printed {DATE1}\nPassenger: {SELF}\nCollection: {A}\nVehicle: borrowed unit 14\nManifest and enquiry file: {B}\nThe word EXERCISE is missing from this retained strip.",note="This stub puts me on a passenger route from {A}. The reference calls it an exercise, but the part of the form that might have explained that has been torn away."},
    response={kind="notepad",title="Dispatch exercise sheet / {CODE}",observation="A training sheet whose sample passenger line has been filled from another card.",source="DISPATCH EXERCISE — {DATE2}\nUse one live-format passenger name to test manifest printing. {P2} copied {SELF} from the top standby card.\nDo not contact the named person. Do not release a vehicle. Destroy practice copies after review.\nSupervisor: {P1}.",note="The exercise sheet says my name was copied from a real standby card and nobody was meant to contact me. The practice stub survived its destruction instruction rather well."},
    review={kind="receipt",title="Manifest-count correction / {CODE}",observation="A count sheet with one passenger removed in red and TRAINING written in the margin.",source="FILE AUDIT — {DATE3}\n{CODE}: practice manifest filed among active passenger returns.\nVehicle dispatched: no. Passenger contact: no. Passenger collected: no.\nRemove {SELF} from active count; retain correction at {B}.\nSource of original standby card not recorded.",note="The audit removes me from the passenger count and confirms there was no trip. It still leaves the real standby card—and whoever started it—unexplained."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The manifest stub looks active by itself. The exercise sheet identifies it as a practice print made from a real standby card."},
    {requires={"response","review"},from="review",to="response",kind="corroborates",text="The audit agrees that no vehicle or passenger contact belonged to the exercise."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="The passenger manifest was a training print filed in the wrong stack. My name came from a real standby card, and the records still do not say who created that card."}
   },
   optional={},thread={document="review",point="{B}",question="who created the original named standby card"}
  }
 },
 ["deposit-for-unknown-booking"]={
  [1]={
   question="Why is there a passenger-booking deposit receipt in my name?",
   centralAxis="access",
   event="An unidentified caller paid a deposit under the survivor's name; the vehicle was withdrawn and the refund was held for a claimant.",
   outcome="The run was cancelled before departure and the unclaimed refund remained in the office register.",
   unresolved="The records do not identify who paid the deposit or submitted the booking in my name.",
   readings={"The office preserved a refund after the booked run failed.","A paid receipt made an unidentified caller's request look like my transaction."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="receipt",title="Booking deposit receipt / {CODE}",observation="A small cash receipt bearing my typed name and no payer signature.",source="{ORG} PASSENGER BOOKING\nReceipt {CODE} / {DATE1}\nPassenger: {SELF}\nCollection point: {A}\nDeposit received: $12.00 cash\nPaid by: [blank]\nCancellation and refund enquiries: {B}.",note="This receipt says somebody paid cash for a passenger booking in my name. The payer box is blank. Apparently twelve dollars knows more about my plans than I do."},
    response={kind="notepad",title="Cancellation and refund note / {CODE}",observation="A cancellation note folded around a refund envelope number.",source="{DATE2} / {CODE}\nBorrowed passenger vehicle withdrawn before dispatch: steering fault. No substitute available.\nCancel collection at {A}. Prepare deposit refund against receipt, payable only to named passenger or original payer with receipt.\nRefund envelope: 31. Authorised {P1}.",note="The vehicle was withdrawn and the deposit put into envelope 31. The office will return it to me or to the person with my receipt, which are two rather different people."},
    review={kind="notebook",title="Unclaimed refund register / {CODE}",observation="A refund register with envelope 31 carried forward twice.",source="REFUND REGISTER — {DATE3}\nEnvelope 31 / {CODE} / {SELF}: $12.00\nPassenger run did not depart. Claimant attended: none. Original payer identity: not recorded.\nCarry refund forward. Booking source sheet retained at {B}; collection point was {A}.",note="The refund is still unclaimed, and the register confirms the payer was never identified. The booking has my name, but no person in this file admits supplying it."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The receipt records a paid booking. The cancellation note shows why it produced a refund instead of a journey."},
    {requires={"response","review"},from="review",to="response",kind="corroborates",text="The register carries the same refund envelope and confirms that the run never departed."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="Someone paid cash for a booking in my name. The vehicle failed before dispatch and the refund went unclaimed. None of these records identifies the payer or the person who made the booking."}
   },
   optional={},thread={document="review",point="{B}",question="who paid for and submitted the named booking"}
  },
  [2]={
   question="Why was an anonymous counter payment allocated to a passenger account in my name?",
   centralAxis="access",
   event="A clerk used the enquiry-card name to allocate an otherwise anonymous cash payment, then printed a passenger account receipt.",
   outcome="A counter audit reversed the allocation and returned the cash to unclaimed funds before any trip was dispatched.",
   unresolved="The enquiry card still does not say who supplied my name.",
   readings={"The clerk gave anonymous money a temporary account so the till would balance.","Using my name to balance the till created a booking that no identified person requested."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="receipt",title="Passenger account receipt / {CODE}",observation="A counter receipt with my name typed above CASH — SOURCE UNKNOWN.",source="{ORG} COUNTER RECEIPT\n{DATE1} / account {CODE}\nPassenger: {SELF}\nProposed collection: {A}\nCash allocated: $12.00\nSource: UNKNOWN — held from counter close\nAccount copies and enquiries: {B}.",note="The receipt gives anonymous cash a passenger account and gives that account my name. The source is unknown, which is doing a great deal of work here."},
    response={kind="notepad",title="Counter allocation note / {CODE}",observation="A till note explaining one handwritten transfer into the passenger column.",source="{DATE2}\nTill over by $12.00 after close. {P2} found an enquiry card naming {SELF} and opened passenger account {CODE} so the cash could be carried.\nNo signed booking form. Do not dispatch until payer or passenger confirms.\nChecked by {P1}.",note="They attached the unexplained cash to the first useful name and called the balance solved. At least the note says not to send a vehicle on the strength of arithmetic."},
    review={kind="receipt",title="Deposit allocation correction / {CODE}",observation="A correction slip with the passenger account struck through cleanly.",source="COUNTER AUDIT — {DATE3}\nAccount {CODE}: allocation unsupported. No payer, signed booking or passenger confirmation found.\nReturn $12.00 to unclaimed counter funds. Cancel passenger account before dispatch.\nEnquiry card retained at {B}; source of name {SELF} not recorded.",note="The audit undoes the account and returns the cash to nowhere in particular. It confirms that nobody verified a booking; it does not tell me who put my name on the enquiry card."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The receipt looks like a paid passenger account. The counter note says the account was created only to carry anonymous surplus cash."},
    {requires={"response","review"},from="review",to="response",kind="corroborates",text="The audit confirms there was no signed booking or confirmation behind the allocation."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="The account in my name was a till-balancing device, not a confirmed journey. The allocation was reversed before dispatch, while the source of my name remained unrecorded."}
   },
   optional={},thread={document="review",point="{B}",question="who supplied the name on the enquiry card"}
  }
 },
}
scenarios["fitness-instructor-start"]=FitnessOpenings
local Occupations=require("ConspiracyFiles/Generated/OccupationOpeningScenarios")
for _,profession in ipairs(Occupations.ORDER) do
 scenarios[profession.."-start"]=Occupations.get(profession)
end
-- An opening family of a profession carries its own organisation and objects.
local function professionFamily(id)
 if id=="fitness-instructor-start" then return true end
 local profession=id:match("^(.+)%-start$")
 return profession~=nil and Occupations.families[profession]~=nil
end

local function copy(value)
 if type(value)~="table" then return value end
 local out={}
 for key,item in pairs(value) do out[key]=copy(item) end
 return out
end

function M.get(id,variant)
 local set=id=="still-filing" and Continuation or scenarios[id]
 local scenario=set and set[variant]
 if type(variant)~="number" or variant~=math.floor(variant) or not scenario then return nil end
 local out=copy(scenario)
 if not professionFamily(id) then
  out.organisation="McCoy Logging Co."
  out.grounding="McCoyLoggingCorp"
 end
 if not professionFamily(id) and not out.anchors.claim.source:find("{A}",1,true) then
  out.anchors.claim.source=out.anchors.claim.source.."\nEnquiry copy filed at: {A}."
 end
 return out
end

return M
