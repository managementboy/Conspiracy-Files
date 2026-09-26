-- Place-specific incident for a vanilla lap-time map. The times and place
-- come from the archived vanilla source; the dispute below is mod-authored.
local function page(kind,title,observation,source,note)
 return {kind=kind,title=title,observation=observation,source=source,note=note}
end
return {
 speedway={id="repairs",organisation="Irvington Speedway / Lenny's Car Repair",
  grounding="IrvingtonStashMap1; IrvingtonSpeedway; LennysCarRepair",siteRole="recipient-copy",
  question="Why did two lap times become a repair booking?",
  event="A clerk used the Cossette's lap as a repair standard for the Dart and sent the difference to a garage without an inspection.",
  outcome="The garage rejected a fault diagnosis made from different cars' lap times, and the requested repair was cancelled before authorisation.",
  -- BOUND TO WHICHEVER CENTRAL CONSPIRACY THE SAVE DREW, like every generated
  -- scenario. A vanilla annotated map is the strongest evidence surface the
  -- mod has - somebody's own handwriting, marking a real place - and leaving
  -- it outside the campaign's central question wasted it.
  --
  -- Measured 2026-09-23: 125 annotated destinations drive placement, and this
  -- is the ONLY one with an authored story (MapMediaContent.lua binds it by
  -- id). The other 124 resolve to generic payoffs. That gap is the real
  -- finding here; binding this one does not close it.
  centralAxis="records",
  skill="mechanic",observationPart=4,
  professional="Different cars' lap times cannot identify a failed component. The garage records no inspection or authorised repair, which is exactly the gap its reply asked the clerk to fill.",
  parts={
   page("dispatch","Lap deficit service request",
    "A service request with two times copied into a box headed PERFORMANCE LOSS.",
    [[IRVINGTON SPEEDWAY / {day} July 1993 / {code}
To Lenny's Car Repair. Contact: {name}. Retained copy: {place}.
Cossette: 56.34 seconds. Dart: 1 minute 14.55 seconds.
Dart deficit: 18.21 seconds. Please quote to restore missing performance.
Vehicle inspection section: see timing sheet.]],
    "Somebody has sent a garage eighteen missing seconds. I'd like to see the inspection that located them."),
   page("letter","Timing-sheet correction",
    "A reply with COSSETTE and DART underlined separately.",
    [[{day} July 1993 / {code}
{name} to service desk: these are laps by two different cars at Irvington Speedway, not before and after times for one car.
No fault was reported with the Dart. Please stop copying the faster car into the box marked BEFORE.]],
    "Two cars became one car with a problem when somebody filled in the form. The slower one has been entered in a race against the stationery."),
   page("notepad","Garage's inspection query",
    "A mechanic's reply with the replacement-parts line left empty.",
    [[LENNY'S CAR REPAIR / {day} July 1993 / {code}
{other}: cannot quote for 18.21 seconds. Need vehicle and reported symptom before inspection.
No vehicle received, no component diagnosed. Return request for correction.
Time cannot be ordered from supplier; already asked.]],
    "The garage has neither the Dart nor a reported fault. At least somebody noticed before ordering a box of seconds."),
   page("receipt","Cancelled lap-deficit booking",
    "A cancellation attached to both copies of the timing request.",
    [[{nextday} July 1993 / {code} / retained at {place}
Irvington Speedway contact confirms comparison was between Cossette and Dart lap times.
Lenny's Car Repair request withdrawn. No inspection, repair or charge authorised under this reference.
Service desk: performance deficit removed from outstanding jobs. Original lap times unchanged.]],
    "They cancelled the repair booking and left the lap times alone. The Dart recovered eighteen seconds in the outstanding-jobs column without going anywhere."),
  },
  findings={
   "The correction identifies the two different cars behind the request's supposed before-and-after times.",
   "The cancellation answers the garage's query: no fault inspection or repair had been authorised.",
   "A comparison between two cars was copied into a form for one car's lost performance. The garage challenged it and the booking was cancelled. This file explains a fictitious repair job, not what became of either driver.",
  },
 },
}
