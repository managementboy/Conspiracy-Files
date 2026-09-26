-- Original-message enquiries after the personal collection mystery.
-- These are retained copies dated at the source case's closing day, not a
-- newly drawn past. PersonalScenarios returns a deep copy to each caller.
return {
 [1]={
  question="How did an enquiry turn into a booking in my name?",
  centralAxis="absence",
  event="The desk reserved a place from an unconfirmed suggestion, then counted its printed notice as confirmation.",
  outcome="The booking came from the reserve list without a passenger reply on file; an audit corrected its contact status.",
  unresolved="The caller who first suggested my name was not recorded.",
  readings={"They processed an unanswered enquiry into a booking.","I still want to know who put my name forward."},
  essential={"claim","response","review"},
  anchors={
   claim={kind="notepad",title="Telephone enquiry / {FROMREF}",
    observation="A retained telephone message. My name is written beside a blank answer box.",
    source="ENQUIRY COPY — {DATE1}\nOriginal file: {FROMPOINT}\nReference: {FROMREF}\nProposed passenger: {SELF}\n\nMessage: ask whether the named person requires a place in the borrowed {ORG} vehicle. Confirm before issuing a passenger list.\nAnswer: [blank]\nCaller name: not taken.\nMessage taken by: {P2}.\nRelated booking and audit copies retained at {B}.",
    note="It says to ask me. There's no answer in the box. {P2} took the message but left out who called. My name made it through the conversation in better shape than the instructions."},
   response={kind="dispatch",title="Reserve-list instruction / {FROMREF}",
    observation="A typing instruction with RESERVE circled and BOOKED written underneath.",
    source="RETAINED BOOKING NOTE — copied {DATE2}\n{FROMREF} / {SELF}\n\nName transferred from unanswered enquiry to reserve list. No reply attached at time of printing.\nFor the passenger-list print run, treat reserved places as booked. Do not delay the list for outstanding replies.\nNotice printed under {FROMREF}.\nPrepared by: {P1}.",
    note="They turned a reserved place into a booking when they printed the notices. No reply attached. A printer can get a yes out of anyone."},
   review={kind="notebook",title="Contact-count correction / {FROMREF}",
    observation="An audit page with one total corrected in red. The original total is still legible.",
    source="CONTACT AUDIT — {DATE3}\n{FROMREF} / passenger notice in the name of {SELF}\n\nContact count was taken from the number of notices produced. No passenger reply is held in the booking file.\nCorrect status: NOTICE PRODUCED; CONTACT NOT CONFIRMED.\nBooking already closed after cancelled run. Amend the count only; do not reissue closed notices.\nChecked by: {P1}.",
    note="They counted a printed notice as successful contact. The audit fixes the count and leaves the notice alone. I was reached, unreached and filed away without having to be there."}
  },
  comparisons={
   {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The enquiry asked for an answer before booking me. The typing instruction explicitly skips that answer and turns the reserved place into a booking."},
   {requires={"response","review"},from="review",to="response",kind="recontextualises",text="The print instruction explains how the notice was produced; the audit shows that producing it was also counted as contacting the passenger."},
   {requires={"claim","review"},from="review",to="claim",kind="recontextualises",text="The original enquiry has no answer from me, and the audit confirms that none reached the booking file. The contact tally was counting paper."},
   {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="That's how I became a booked passenger: someone suggested my name, the desk reserved a place, and the print run promoted it to a booking without a reply from me on file. They even counted the notice as making contact. My part in the arrangement was largely typographical. I still don't have the caller's name."}
  },
  optional={}
 },
 [2]={
  question="Why was I listed as the passenger on an enquiry about transport?",
  centralAxis="absence",
  event="The desk copied the enquiry-contact name into the passenger field because its booking form had no separate contact field.",
  outcome="The audit identified the copying error and corrected the office copy to contact only; no corrected notice was issued.",
  unresolved="The records do not identify who first supplied my name as the enquiry contact.",
  readings={"They put my name in the wrong box.","Someone supplied my name before the copying error."},
  essential={"claim","response","review"},
  anchors={
   claim={kind="notepad",title="Transport enquiry card / {FROMREF}",
    observation="A carbon card with separate boxes for contact and passenger. Only one is filled in.",
    source="ENQUIRY COPY — {DATE1}\nOriginal file: {FROMPOINT}\nReference: {FROMREF}\n\nEnquiry contact: {SELF}\nProposed passengers: [blank]\nQuery: availability of a borrowed {ORG} vehicle.\nCaller name: not taken.\nTaken by: {P2}.\nTranscription and audit copies retained at {B}.",
    note="My name is under contact. The passenger box is empty. Someone gave them my name, but this card doesn't ask them to collect me. An unusually important distinction for two adjacent boxes."},
   response={kind="dispatch",title="Booking transcription / {FROMREF}",
    observation="A copied booking sheet with a clerk's explanation along the bottom margin.",
    source="TRANSCRIPTION COPY — {DATE2}\n{FROMREF}\n\nPassenger entered: {SELF}\nCopied from enquiry-contact line. Source passenger box empty.\nBooking pad has no separate contact field; name entered in the available name box to retain the enquiry reference.\nPassenger notice produced.\nEntered by: {P1}.",
    note="The form had one name box, so the clerk used it. Now the enquiry contact is a passenger. Convenient: nobody has to ask a person if the box has already decided."},
   review={kind="notebook",title="Passenger-name correction / {FROMREF}",
    observation="The office copy has CONTACT ONLY stamped across the passenger line. A second stamp says CLOSED.",
    source="FILE AUDIT — {DATE3}\n{FROMREF} / {SELF}\n\nOriginal enquiry named a contact, not a passenger. Correct office copy to CONTACT ONLY. No nominated passenger appears on the enquiry card.\nPassenger notice already issued. Do not send an amended notice: cancelled bookings carry no further correspondence allowance.\nAudit closed by: {P1}.",
    note="The office has corrected who I was supposed to be. They aren't allowed to spend another stamp telling me. Good to know my confusion has a budget."}
  },
  comparisons={
   {requires={"claim","response"},from="response",to="claim",kind="recontextualises",text="The clerk's note admits copying the contact name into the passenger box. The original card shows exactly which two fields were confused."},
   {requires={"response","review"},from="review",to="response",kind="recontextualises",text="The audit corrects the transcription but expressly forbids a corrected notice. The office's copy and the issued paper were left saying different things."},
   {requires={"claim","review"},from="review",to="claim",kind="recontextualises",text="The enquiry card's empty passenger box supports the correction to contact only. It gives no passenger nomination for the notice bearing my name."},
   {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",text="My booking began as a copying error. The card named me as an enquiry contact; {P1} put that name in the booking pad's passenger box; the audit corrected the office copy and refused to notify me. The office and I received different versions of my travel plans. I still don't know who supplied my name in the first place."}
  },
  optional={}
 }
}
