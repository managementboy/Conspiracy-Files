-- Authored, payoff-first personal scenarios.  This is data only: callers bind
-- placeholders and decide discovery, comparison and placement policy.
local Continuation=require("ConspiracyFiles/Generated/PersonalContinuation")
local M={}

local scenarios={
 ["no-contact-at-premises"]={
  [1]={
   question="Why did the collection in my name never come?",
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
}

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
 out.organisation="McCoy Logging Co."
 out.grounding="McCoyLoggingCorp"
 if not out.anchors.claim.source:find("{A}",1,true) then
  out.anchors.claim.source=out.anchors.claim.source.."\nEnquiry copy filed at: {A}."
 end
 return out
end

return M
