-- Ten authored first-case starts for the Fitness Instructor profession.  The
-- variant is saved with the case: it is not inferred from the two legacy
-- outline labels, so this family can grow without changing old cases.
local definitions={
 {label="Cover class",activity="cover the 06:30 circuit class",place="studio floor",
  trigger="the regular instructor reported sick",result="the class was cancelled when no members signed in",
  source="a telephone message copied by {P2}",question="Why was I assigned a cover class I do not remember accepting?"},
 {label="Member assessment",activity="perform a new-member fitness assessment",place="assessment desk",
  trigger="a membership application requested an instructor",result="the assessment was closed when the applicant never arrived",
  source="an unsigned membership application entered by {P2}",question="Why does a member assessment name me as the instructor?"},
 {label="Equipment induction",activity="run an equipment induction",place="weights room",
  trigger="three induction places were opened",result="the induction was postponed after the equipment check failed",
  source="a booking card transcribed by {P2}",question="Why was I booked to lead an equipment induction?"},
 {label="Workplace session",activity="lead a workplace stretching session",place="meeting room",
  trigger="a company wellness request arrived",result="the session was cancelled after the client office closed",
  source="a fax request logged by {P2}",question="Why was I named for a workplace fitness session?"},
 {label="Boxing trial",activity="supervise a beginner boxing trial",place="boxing room",
  trigger="a trial group paid a counter deposit",result="the trial was stopped when no participant waivers were found",
  source="an unsigned counter sheet opened by {P2}",question="Why was I assigned to supervise a boxing trial?"},
 {label="Morning run",activity="lead the 05:45 beginner running group",place="front entrance",
  trigger="the route roster was copied for the morning desk",result="the run was called off because the route marshal did not report",
  source="a route-list amendment copied by {P2}",question="Why does an early running-group roster name me as its leader?"},
 {label="Service fitness test",activity="conduct a fire-service fitness practice",place="training floor",
  trigger="a public-service practice block was reserved",result="the practice was deferred when the visiting group did not confirm",
  source="an unreturned booking enquiry taken by {P2}",question="Why was I put down to conduct a service fitness test?"},
 {label="Youth circuit",activity="coach an after-school youth circuit",place="small studio",
  trigger="a youth-group block was added to the timetable",result="the session was withdrawn when no guardian forms arrived",
  source="a timetable request recorded by {P2}",question="Why was I listed to coach a youth circuit?"},
 {label="Safety inspection",activity="attend an equipment safety inspection",place="machine floor",
  trigger="a maintenance inspection needed an instructor witness",result="the inspection was completed before the listed instructor arrived",
  source="a maintenance call copied by {P2}",question="Why was I named as witness for an equipment inspection?"},
 {label="Private appointment",activity="meet a private client for a one-to-one session",place="consultation desk",
  trigger="cash was left against a private appointment",result="the appointment was voided when neither payer nor client could be identified",
  source="an unsigned appointment slip entered by {P2}",question="Why was a private training appointment made in my name?"},
}

local function make(d)
 local lower=string.lower(d.label)
 return {
  question=d.question,
  event="The {ORG} desk assigned {SELF} to "..d.activity.." after "..d.trigger..".",
  outcome="The closeout says "..d.result..".",
  unresolved="The file does not say who authorised the desk to use my name.",
  readings={
   "The desk filled a real operational need with the instructor name available to it.",
   "A booking became official in my name without a recorded acceptance from me."
  },
  essential={"claim","response","review"},
  anchors={
   claim={kind="dispatch",title=d.label.." assignment / {CODE}",
    observation="A folded staff copy has my name typed in the instructor box.",
    source="{ORG} — "..string.upper(d.label).."\nReference {CODE} / issued {DATE1}\nInstructor: {SELF}\nReport to: {A}\nDuty: "..d.activity.."\nWork point: "..d.place.."\nRecords held at: {B}\n\nKeep this copy and report to the desk before the listed duty.",
    note="This tells me to "..d.activity.." at {A}. It has my name, but not my signature or anything that says I accepted it."},
   response={kind="notepad",title=d.label.." desk note / {CODE}",
    observation="A desk note records why the slot was opened and who entered the instructor line.",
    source="{DATE2} / {CODE}\nReason opened: "..d.trigger..".\nInstructor line entered as {SELF}. Acceptance call: none recorded.\nDo not hold the activity if the remaining conditions are not met.\nEntered by {P1}; source was "..d.source..".\nWorking copy filed at {B}.",
    note="{P1} entered my name but recorded no acceptance call. The source was "..d.source..", not a message from me."},
   review={kind="notebook",title=d.label.." closeout / {CODE}",
    observation="A ruled closeout page puts the planned duty and its result on adjacent lines.",
    source="ACTIVITY CLOSEOUT — {DATE3}\nReference {CODE}; instructor listed: {SELF}.\nLocation: {A}; work point: "..d.place..".\nResult: "..d.result..".\nInstructor attendance: none recorded. No disciplinary absence entered.\nOrigin of instructor name: "..d.source..". Original authorisation: not retained.\nFile closed at {B}.",
    note="The "..lower.." did not proceed as planned, and nobody marked me absent. The records explain the cancelled duty, but not why my name was used."}
  },
  comparisons={
   {requires={"claim","response"},from="response",to="claim",kind="recontextualises",
    text="The assignment reads like an accepted duty. The desk note says my name was entered with no acceptance call recorded."},
   {requires={"response","review"},from="review",to="response",kind="corroborates",
    text="The closeout agrees with the desk note: the activity was opened, my attendance was not recorded, and no absence was charged."},
   {requires={"claim","response","review"},from="review",to="claim",kind="recontextualises",
    text="The three records show how the "..lower.." assignment was opened and how it ended. They do not show who authorised anyone to put my name on it."}
  },
  optional={},
  thread={document="review",point="{B}",question="who authorised the use of my name for the "..lower},
  organisation="Sure Fitness & Boxing Club",grounding="SureFitnessBoxingClub"
 }
end

local scenarios={}
for index,definition in ipairs(definitions) do scenarios[index]=make(definition) end
return scenarios
