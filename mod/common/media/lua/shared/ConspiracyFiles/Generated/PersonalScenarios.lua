-- Authored, payoff-first personal scenarios.  This is data only: callers bind
-- placeholders and decide discovery, comparison and placement policy.
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
     source="DISPATCH RETURNS — entered {DATE3}\nTrips for {DATE2}:\n07:00 passenger collection, {CODE}, {A}: NOT DISPATCHED.\nReason: borrowed {ORG} vehicle reassigned under {P1} amendment, 05:40. Replacement vehicle: none allocated.\nMill drive-belt transfer: departed 07:10; returned 09:25.\nPassenger request closed at end of shift. No collection recorded.\nRequest copied from a call sheet signed ‘{P2}’; caller's name not recorded. Enquiry copies retained at {B}.\n\nVehicle log complete. Outstanding passenger requests: nil.",
     note="The belt travelled. The passenger didn't. They closed the request without sending another vehicle, which brought the outstanding total down nicely. The original call sheet bears {P2}'s name; there's an enquiry copy at {B}."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The amendment names the same booking and tells dispatch not to send a driver to the collection point on my notice."},
    {requires={"response","review"},from="review",to="response",kind="recontextualises",text="The return book cites the amendment and records the equipment trip, so the reassignment was carried out."},
    {requires={"claim","review"},from="review",to="claim",kind="recontextualises",text="That passenger booking is mine. The return book says no driver was sent and no replacement allocated. My copy still tells me to wait."},
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
    review={kind="receipt",title="Refund ledger / {CODE}",observation="A ledger strip with one refund line and a clerk’s initials at the margin.",source="{DATE3}\nPassenger booking {CODE}: deposit refunded after vehicle withdrawal.\nCollection did not depart.\nRequest copied from an earlier call sheet marked ‘{P2}’; mark not verified.\nFiled at: {B}.\nAccounts note: passenger matter concluded.",note="I can see that the office recorded a refund and no departure. The request came from a call sheet marked {P2}. The passenger matter is concluded, which must be a relief to whoever had the stamp."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The workshop note identifies the booking on my notice and records its cancellation before the scheduled collection."},
    {requires={"response","review"},from="review",to="response",kind="recontextualises",text="The refund ledger agrees that the vehicle was withdrawn and the collection did not depart."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="The three records agree: the booked collection was cancelled for repair before departure, and its deposit was refunded."}
   },
   optional={
    {key="repair-job",role="records",kind="notebook",title="Workshop job / vehicle 14",observation="A grease-smudged job entry with a time written beside the fault.",source="{DATE2}, 05:20\nVehicle 14: brake hose split. Removed from service before morning dispatch.\n{P1}\nParts request marked urgent; passenger collection marked cancelled.",note="Vehicle 14 was taken out of service at 05:20 with a split brake hose. Parts urgent, passenger cancelled. At least they spotted it before putting somebody in the thing."}
   },
   thread={document="review",point="{B}",question="who submitted the named collection request"}
  }
 },
 ["still-filing"]={
  [1]={
   question="How did the collection request in my name reach the file at {FROMPOINT}?",
   event="The filing desk copied the booking from an earlier call sheet and later closed it after the passenger run was cancelled.",
   outcome="The desk’s records identify the call-sheet route into its file and the later administrative closure of the cancelled booking.",
   unresolved="The call sheet preserves a mark, not a verified identity for the person who submitted it.",
   readings={"The desk processed an earlier request through its normal filing route.","The filing route explains how the request arrived, while the writer’s identity remains unverified."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="notepad",title="Call-sheet register / {FROMREF}",observation="A call-sheet register page with a copied reference in the margin.",source="{DATE1} / enquiry copy of earlier register entry\nIncoming call sheet for passenger collection {FROMREF}.\nOriginal destination file: {FROMPOINT}.\nRelated transfer and audit copies retained at {B}.\nCaller mark: ‘{P2}’. Identity not checked.\nCopied by: {P1}.\n\nFiling instruction: preserve the mark; do not improve it.",note="I can see that the filing desk recorded an earlier call sheet for this reference and sent it to {FROMPOINT}. The mark beside it is not a verified identity."},
    response={kind="dispatch",title="Booking transfer / {FROMREF}",observation="A thin transfer sheet folded into a file divider.",source="{DATE2} / enquiry copy of earlier transfer entry\nPassenger collection {FROMREF} was copied from call-sheet register to active booking file.\nCollection point retained as recorded.\nNo change to caller mark.\nFiled at {FROMPOINT}.\nDo not delay transfer for a name that was not taken on the call.",note="I can see that the desk copied the call-sheet entry into the active booking file without identifying the caller. The file was allowed to move faster than the name."},
    review={kind="notebook",title="Closure audit / {FROMREF}",observation="A short audit page with two dated entries bracketed together.",source="{DATE3}\nAudit of {FROMREF}: booking entered from call sheet, then closed after the recorded cancelled run.\nNo replacement transport entered.\nCaller mark remains unverified; no further identity record held at {FROMPOINT}.\nFile complete for closure purposes.",note="I can connect the earlier call sheet to the booking and its later closure. This answers how the request reached the file, not who submitted it; apparently closure has lower standards than a name."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The transfer sheet shows that the call-sheet entry was copied into the active booking file."},
    {requires={"response","review"},from="review",to="response",kind="recontextualises",text="The audit places that copied booking before the recorded cancellation and closure."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="The records establish the route from call sheet to booking file and then to closure; they do not verify the caller’s identity."}
   },
   optional={
    {key="desk-routing",role="records",kind="receipt",title="Desk routing stub / {FROMREF}",observation="A narrow routing stub torn from a larger pad.",source="{DATE1} / retained routing copy\nCall sheet for {FROMREF} received earlier; copy sent to {FROMPOINT}.\nInitials: {P1}.\nRouting complete before lunch.",note="I can use this stub to corroborate the desk route for the reference. At least the paper made its appointment."}
   }
  },
  [2]={
   question="What did the transfer desk do with the cancelled booking in my name?",
   event="The desk retained the cancelled booking long enough to issue a refund record, then closed the file without another transport entry.",
   outcome="The desk recorded the cancellation, refund processing, and administrative closure of the booking.",
   unresolved="Its records still do not verify who made the earlier request in my name.",
   readings={"The desk completed a routine refund and closure after the cancelled run.","The desk’s administrative trail is complete even though the original caller cannot be identified from it."},
   essential={"claim","response","review"},
   anchors={
    claim={kind="receipt",title="Refund intake / {FROMREF}",observation="A receipt stub stamped RECEIVED at the filing desk.",source="{DATE1}\nRefund request received for passenger booking {FROMREF}.\nOriginal booking file held at {FROMPOINT}.\nAuthorisation and closure copies retained at {B}.\nOriginal request noted as call-sheet entry; caller mark not verified.\nRefund queue takes precedence over caller research.",note="I can see that the desk received a refund request for the booking and did not verify the original caller mark. The refund queue did not have that kind of time."},
    response={kind="notepad",title="Refund authorisation / {FROMREF}",observation="A half-page authorisation with a cancellation note written across its lower edge.",source="{DATE2}\nAuthorise refund for {FROMREF}. Passenger run recorded cancelled before departure.\nNo replacement transport entered.\nSend completed voucher to {FROMPOINT}.\nSigned: {P1}.\nDo not reopen the run for accounting purposes.",note="I can see an authorised refund after a cancelled passenger run and no replacement transport. The paper is careful not to reopen anything except its own folder."},
    review={kind="notebook",title="File closure / {FROMREF}",observation="A ledger page where one reference is crossed through with a closing date.",source="{DATE3}\n{FROMREF}: refund voucher filed; passenger booking closed.\nEarlier request copied from call-sheet register. Caller mark remains unverified.\nNo later transport entry found at {FROMPOINT}.\nFile closed; stationery returned to stock.",note="I can see that the desk closed the file after filing the refund voucher. The original caller’s mark remains unresolved, but the stationery made it back to stock."}
   },
   comparisons={
    {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The refund authorisation gives the reason for the intake request: the passenger run was cancelled before departure."},
    {requires={"response","review"},from="review",to="response",kind="recontextualises",text="The closure entry records that the authorised refund voucher was filed."},
    {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="The desk completed the refund and closed the booking without a later transport entry; its call-sheet record still does not verify the original caller."}
   },
   optional={
    {key="voucher-copy",role="records",kind="dispatch",title="Voucher routing / {FROMREF}",observation="A duplicate voucher with an office-routing stamp.",source="{DATE2}\nRefund voucher for {FROMREF} sent to {FROMPOINT}.\nReceived for filing: accounts.\nVoucher copy retained until month-end.",note="I can see that the voucher was received for filing. Accounts kept its copy until month-end. Passengers would have to make their own arrangements."}
   }
  }
 }
}

local function copy(value)
 if type(value)~="table" then return value end
 local out={}
 for key,item in pairs(value) do out[key]=copy(item) end
 return out
end

function M.get(id,variant)
 local set=scenarios[id]
 local scenario=set and set[variant]
 if type(variant)~="number" or variant~=math.floor(variant) or not scenario then return nil end
 local out=copy(scenario)
 out.organisation="McCoy Logging Co."
 out.grounding="McCoyLoggingCorp"
 return out
end

return M
