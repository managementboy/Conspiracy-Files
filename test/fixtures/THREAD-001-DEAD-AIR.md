# THREAD-001 — Dead Air

**Status:** Development-time AI-assisted authored content; owner approval with explanatory context is verified for 2026-09-05 under `docs/design/AI_PROVENANCE.md`. See [approval record](../../docs/reviews/DEAD_AIR_CONTENT_REVIEW_2026-09-03.md). Issue #26 remains open for context delivery/disclosure and projection-copy reconciliation; this is not live integration acceptance.
**Content revision:** `dead-air-r1`
**Purpose:** one hand-authored narrative thread that proves the v0.1 investigation loop before any generic content-pack schema exists.

**Correction, 2026-09-05:** six bodies preserved; display names, contextual introductions and journal summaries now match Content.lua. P4-R48 selects two Muldraugh sites with D4 at relay; exact live binding is pending. P4-R49 preserves order-independent physical eligibility. See the correction report.

## Authorial boundary

Dead Air has one fixed authored situation:

> In the days before the Knox Event becomes the player's problem, a communications maintenance contractor is instructed to activate a reserved channel at a rural relay site. A precise, repeated carrier appears. Local police take a technician's receiver after an outside request. Paperwork exists that seems to authorise the whole thing, but the people handling the paperwork cannot agree who issued that authority or even whether the approving name is a person.

That is the invariant. The thread does **not** establish what the carrier was for, whether the operation was state, federal, military, scientific, criminal, incompetent, or some mixture of those, and it does not explain the Knox Event.

The comedy comes from ordinary people trying to obey extraordinary paperwork.

## Narrative Thread

**Narrative Thread ID:** `dead-air:thread`
**Title:** Dead Air

The player may enter through either story location and may never see all six documents. The authored truth does not change between runs. Variation comes from what is found first, what survives long enough to be followed, and what the player decides the contradictions mean.

## Organisation (1)

### `dead-air:organisation:cumberland-signal-services`

**Specific name:** Cumberland Signal Services  
**Initial generic description:** a communications maintenance contractor, first identifiable only by a faded `C.S.S. COMMUNICATIONS SERVICE` equipment sticker if the police-side fallback is found first.

**Apparent purpose:** maintain public-safety and utility radio equipment under standing service contracts: relay cabinets, repeaters, backup power, feed lines, frequency-control hardware and emergency call-outs.

**Internal bureaucratic culture:** carbon-copy tickets, handwritten dispatch additions, route/site numbers instead of useful place names, standing authorisation codes, "customer supplied" parts that are deliberately not inventoried, and an almost religious faith that a form becomes legitimate if enough boxes have initials in them.

**Relationship to the three identities:**
- M. Rourke performs field work on CSS tickets.
- Sgt. Dana Pike is not CSS staff; she encounters CSS through seized equipment, Rourke and the access paperwork.
- H. Vale appears to approve CSS billing and to issue or transmit CSS-facing access instructions, but the documents never prove whether Vale is an employee, a client liaison, an office alias or an authorisation label.

**What remains uncertain:** whether CSS knowingly participates in a secret programme or is simply a contractor being used by a customer whose name is deliberately omitted. Nothing proves that the unnamed authority behind the work is legitimate, illegitimate, unified, or connected to the Knox Event.

## Identities (3)

### `dead-air:identity:m-rourke` — M. Rourke

**Role:** CSS field technician.

**What the player initially knows:** a technician named `M. Rourke` signed the Relay Site 31 service ticket. If D1 is found first, Rourke initially looks like an ordinary worker documenting a strange radio fault.

**What later evidence adds:** D4 gives Rourke a private voice: competent, tired, suspicious of the job, and angry that dispatch later tells him the test did not happen. D6 shows Pike remembered Rourke separately from the paperwork and that Rourke came looking for a red-tagged cabinet key.

**Documents referencing this identity:** D1, D4, D6.

**Ambiguity / contradiction:** Rourke never claims to know what the channel was for. His notebook says dispatch attributed instructions to Vale, but he never proves he spoke to Vale directly. His account could be accurate, defensive, incomplete, or all three.

### `dead-air:identity:dana-pike` — Sgt. Dana Pike

**Role:** police property/evidence supervisor.

**What the player initially knows:** Pike signed the intake of a modified receiver recovered from the Relay Site 31 service road.

**What later evidence adds:** D4 suggests Pike treated Rourke as a confused technician rather than a criminal. D6 shows Pike resisted releasing the receiver without a real name and callback number and did not trust the retroactive neatness of the authorisation memo.

**Documents referencing this identity:** D2, D4, D6.

**Ambiguity / contradiction:** Pike's property record is meticulous about custody but blank where the requesting agency should be. D5 says local police were already instructed how to handle the exact situation. D6 says Pike's shift did not have that memo when the receiver was taken.

### `dead-air:identity:h-vale` — H. Vale

**Role:** approval / coordination identity; exact nature unresolved.

**What the player initially knows:** `H. Vale` appears as an approval name on CSS billing or, depending on discovery order, as the signature on an access memo.

**What later evidence adds:** Rourke's notebook says dispatch used "Vale" as if everyone should know who that meant. Pike's shift note records one caller using `H. Vale` as a person's name and another describing it as "the authorisation name."

**Documents referencing this identity:** D3, D4, D5, D6.

**Ambiguity / contradiction:** the thread never resolves whether H. Vale is a person, cover identity, shared desk name, routing code, or a real person whose name is also used as an authorisation label. Per project terminology, this remains one encountered Identity; the module does not auto-merge it with any hypothetical biological person.

## Story locations (2)

Exact vanilla map targets remain deliberately **unbound** until live inspection. P4-R48 selects the Muldraugh electronics/relay and police candidate, approximately 806 straight-line tiles apart, subject to live route and access verification; it supersedes the earlier P2/R2 priority and distance target. v0.1 uses hand-curated targets; T3 candidate evidence prioritizes inspection but does not create story truth, while T4/T8 still govern placement and arrival mechanics.

### `dead-air:location:relay-office` — Relay Site 31 service office

**Story purpose:** the technical side of the thread. It is where ordinary maintenance records reveal a channel activation that does not behave like ordinary maintenance.

**Real PZ location type to map later:** a believable transmission/utility communications site or small service building associated with a mast/tower, fenced utility compound, radio infrastructure or equivalent hand-curated vanilla location. It needs plausible storage for service paperwork and tools, not a purpose-built conspiracy bunker.

**Provisional inspection priority:** owner-selected Muldraugh electronics/relay centre (10614,9604,0). Verify the exact shelves, access and room/floor/boundary negatives before binding.

**What the player knows before reaching it:** if led from the police side, only `Relay Site 31`, `south service road`, a fenced communications mast/utility structure, and CSS ticket `93-0714`. This should read as a landmark-style lead, not a quest marker.

**What confirms it:** physical arrival at the selected hand-curated location plus matching story dressing/asset context, using T8/P4-R39's bounded, debounced, exact-predicate arrival mechanism.

**Associated documents/items:** D1, D3, D4; optional ordinary B-37 key relevance.

**Why it is plausible:** public-safety radio infrastructure requires maintenance, after-hours access and boring paper records. A rural or edge-of-town service location naturally intersects normal scavenging and travel.

### `dead-air:location:police-property` — police property desk / records area

**Story purpose:** the administrative side of the thread. It turns a technical oddity into a question about who had authority to make it disappear into routine procedure.

**Real PZ location type to map later:** a hand-curated vanilla police station with a believable desk, records room, property/evidence area or office container.

**Provisional inspection priority:** owner-selected Muldraugh police centre (10637,10410,0); owner previously confirmed inside at (10638,10411,0). Exact containers and arrival boundaries still require observation.

**What the player knows before reaching it:** if led from D1, Rourke's portable receiver was taken by county police and entered as property record `4471`. Candidate coordinates are development provenance, not player-facing knowledge or a final station binding.

**What confirms it:** physical arrival at the selected police station and discovery of matching property/shift paperwork, subject to T8.

**Associated documents/items:** D2, D5, D6; optional red-tagged B-37 key.

**Why it is plausible:** police stations accumulate found property, confiscated electronics, memos that arrived too late, and shift notes created because one person does not trust the next telephone call.

# Six documents

The six document Assets below are the complete v0.1 authored document set. Each has a separate real-world purpose and voice. T7/T10 established persistent custom names plus validated ModData and the cooperative inventory-pane `Inspect` reader boundary; production integration remains outstanding.

---

## D1 — Cumberland Signal Services Field Service Ticket 93-0714

**Document ID:** `dead-air:asset:service-ticket-93-0714`  
**Display name:** Cumberland Signal Services Field Service Ticket 93-0714
**What this is:** A field-service ticket from Cumberland Signal Services (CSS), the private communications contractor that maintained the relay equipment.
**Author/source:** Cumberland Signal Services; field entries signed `M. Rourke`  
**Approximate date:** overnight 1–2 July 1993  
**Physical form:** grease-smudged three-part carbon service ticket; technician copy  
**Intended placement:** Relay Site 31 service office, in a maintenance clipboard/file drawer  
**Preferred player interaction:** **Read** or **Inspect**; actual reader mechanism depends on T7/T10  
**Entities referenced:** M. Rourke; Cumberland Signal Services; Relay Site 31; police property desk indirectly  
**Role:** **Primary anchor**

### Full player-readable text

```text
CUMBERLAND SIGNAL SERVICES
FIELD SERVICE TICKET

Ticket: 93-0714
Opened: 07/01/93 23:18
Closed: 07/02/93 04:26

Site: RELAY 31 / SOUTH SERVICE ROAD
Customer: PUBLIC SAFETY MAINT. — BILL BY STANDING AUTH.
Dispatch class: AFTER-HOURS / PRIORITY B

Reported condition:
RESERVE CHANNEL SETUP / INTERMITTENT CARRIER

Equipment:
Main repeater shelf — normal
Backup power — normal
Spare exciter cabinet B-37

Work performed:
23:52  Checked normal county channels. No fault found.
23:58  Installed customer-supplied frequency-control package marked
       "7C-41" in spare exciter per dispatch instruction.
00:24  Key test, five seconds. No voice path requested.
00:31  Dispatch instructed: LEAVE 7C-41 ENABLED. DO NOT ENTER FREQ. ON COPY.
00:47  Carrier observed on reserve channel. No voice, tone or station ID.
00:53  Carrier repeated.
00:59  Carrier repeated.
01:05  Carrier repeated.
       Duration each occurrence approximately 37 seconds.
01:17  Checked local cabinet timer and stuck PTT. Negative.
01:44  Disconnected local test handset. Carrier continued on schedule.
02:10  Dispatch advised condition is "expected during window."
       No trouble code supplied.
03:41  County unit arrived at south gate with typed hold request.
       My portable monitor was taken for property intake.
       No equipment removed from relay cabinet.
04:05  Dispatch: leave 7C-41 package installed. Close ticket as routine setup.

Parts:
1 customer-supplied frequency-control package .......... N/C
2 coax jumpers ......................................... stock
1 cabinet fuse ......................................... stock

Technician: M. Rourke

HANDWRITTEN AT BOTTOM:
They told me twice not to write down the frequency, so I didn't.
They also told me the carrier is normal and not to listen to it.
If this is an exercise, it has better paperwork than we do.

Property desk said the receiver would be under 4471.
B-37 red key was on the same ring when they took the set.
```

### Facts introduced
- CSS performed an after-hours activation at Relay Site 31.
- A customer-supplied package labelled `7C-41` was installed.
- An unmodulated carrier repeated for about 37 seconds every six minutes.
- Dispatch treated the carrier as expected but would not provide a trouble code.
- Police took Rourke's portable monitor and the red B-37 key.
- Police property record `4471` exists.

### Ambiguous implications
The carrier could be a test signal, telemetry, interference, a procedural exercise, or something else. The instruction not to record the frequency is suspicious but not proof of a larger cause.

### Connections
- Points directly to D2 via property record `4471`.
- D3 shares `7C-41`.
- D4 explains why Rourke kept his carbon copy.
- D5 claims this kind of access was pre-authorised.
- D6 confirms the B-37 key/property problem.

---

## D2 — Police Property Record 4471

**Document ID:** `dead-air:asset:property-record-4471`  
**Display name:** Police Property Record 4471
**What this is:** A police intake form for a seized radio receiver. The initials C.S.S. identify its communications maintenance contractor; this record does not spell out the company name.
**Author/source:** county police property desk; intake signed Sgt. Dana Pike  
**Approximate date:** 2 July 1993, early morning  
**Physical form:** property/evidence intake card with stapled continuation strip  
**Intended placement:** police property desk / records area  
**Preferred player interaction:** **Examine** or **Read**; actual mechanism depends on T7/T10  
**Entities referenced:** Sgt. Dana Pike; Cumberland Signal Services initially only as `C.S.S.` sticker; Relay Site 31  
**Role:** **Fallback**

### Full player-readable text

```text
PROPERTY / FOUND ARTICLE RECORD

Record No.: 4471
Date/Time Received: 07/02/93 04:38
Receiving Supervisor: SGT. D. PIKE

Article:
ONE PORTABLE WIDEBAND RECEIVER / MONITOR
Black case, aftermarket speaker lead, battery pack taped at base.
Rear label: "C.S.S. COMMUNICATIONS SERVICE"
Handwritten service number inside battery door: 93-0714.

Associated item:
ONE SMALL CABINET KEY, red plastic tag, marked "B-37".

Location recovered:
SOUTH SERVICE ROAD — RELAY SITE 31
Beside service vehicle at fenced communications site.

Owner / possessor:
M. ROURKE — service technician

Reason held:
HOLD PENDING TELEPHONE INSTRUCTION.
DO NOT POWER OR TEST.

Requesting agency:
____________________________________

Incident / complaint no.:
____________________________________

Chain:
04:38  Received from Unit 12, seal applied. — D.P.
05:10  Receiver and key placed Drawer C / Property.
09:25  Telephone inquiry, caller declined local case number.
       No release. — D.P.

Disposition:
HOLD. RETURN ONLY ON VERIFIED STATE CALLBACK.

HANDWRITTEN IN MARGIN:
No complainant, no incident, no requesting agency, but somebody typed
a beautiful instruction sheet.

Apparently "nobody" has excellent stationery.
```

### Facts introduced
- Police possess Rourke's receiver and B-37 key.
- The receiver bears a CSS service sticker and D1 ticket number.
- It was taken at Relay Site 31.
- No requesting agency or incident number is recorded.
- An outside caller tried to discuss its release.

### Ambiguous implications
The receiver may have been legitimately held, informally seized, or taken because somebody did not want it monitoring the reserved channel. The blank requesting-agency line may indicate secrecy, sloppy paperwork, or Pike refusing to invent a name.

### Connections
- The service number `93-0714` points to D1.
- The CSS sticker lets this document introduce the organisation generically before its full name is known.
- D5 claims police had advance instructions for exactly this situation.
- D6 continues the release dispute.
- The B-37 key can become a manually marked ordinary object.

---

## D3 — Cumberland Signal Services Invoice / Stock Transfer 9327

**Document ID:** `dead-air:asset:invoice-9327`  
**Display name:** Cumberland Signal Services Invoice / Stock Transfer 9327
**What this is:** An invoice and stock-transfer sheet from Cumberland Signal Services (CSS). It records the equipment and authorization code used at Relay Site 31.
**Author/source:** Cumberland Signal Services billing/stock office  
**Approximate date:** 2 July 1993  
**Physical form:** dot-matrix invoice/stock transfer on tractor-feed paper  
**Intended placement:** Relay Site 31 service office, filed with parts paperwork  
**Preferred player interaction:** **Examine**  
**Entities referenced:** Cumberland Signal Services; H. Vale; Relay Site 31  
**Role:** supporting evidence

### Full player-readable text

```text
CUMBERLAND SIGNAL SERVICES
SERVICE PARTS / STOCK TRANSFER

Invoice: 9327
Service ticket: 93-0714
Service date: 07/01-07/02/93
Site: RELAY 31
Billing route: STANDING EMERGENCY MAINTENANCE

QTY  DESCRIPTION                                  CHARGE
  2  Coax jumper, short cabinet                    18.00
  1  Fuse, cabinet power                            1.40
  1  Fan filter, 4-inch                             3.10
  1  Battery pack inspection                       N/C
  1  Frequency-control package "7C-41"             N/C
     CUSTOMER FURNISHED — DO NOT STOCK

Labor:
After-hours field service, 5.0 hr                 162.50
Mileage                                            24.00

Customer name:
[BLANK — BILL UNDER STANDING AUTHORIZATION]

Authorization:
H. VALE
Code: 7C-41 / SPECIAL

Billing note:
Do not request purchase-order number from local dispatch.
Attach service ticket and route to standing account.
Customer-furnished frequency package is not CSS inventory and is not
to be returned through stock.

Clerk note, pencil:
If Accounts sends this back again, tell them "standing" apparently means
it can stand here forever.

APPROVED: H. VALE
```

### Facts introduced
- The full organisation name `Cumberland Signal Services` is explicit.
- `7C-41` was customer-furnished and deliberately excluded from CSS stock.
- The customer name and purchase order are intentionally absent.
- `H. Vale` approved both the standing authorisation and the special code.

### Ambiguous implications
Vale may be CSS staff, the customer, a liaison or merely the name attached to an account code. A standing emergency-maintenance account is plausible bureaucracy; its deliberate lack of a customer name is not ordinary.

### Connections
- Matches D1 ticket `93-0714` and `7C-41`.
- Introduces H. Vale before the more authoritative-looking D5, depending on discovery order.
- Makes D6's claim that "H. Vale" may be an authorisation name more plausible without proving it.

---

## D4 — Torn Page from Rourke's Work Notebook

**Document ID:** `dead-air:asset:rourke-notebook-0703`  
**Display name:** Torn Page from Rourke's Work Notebook
**What this is:** A private notebook page by M. Rourke, a field technician for the communications maintenance contractor identified as C.S.S. It describes the Relay Site 31 job outside the official paperwork.
**Author/source:** M. Rourke  
**Approximate date:** 3 July 1993  
**Physical form:** torn lined pocket-notebook page, written in pencil and blue pen  
**Intended placement:** Relay Site 31 service office, tucked into a tool drawer/clipboard  
**Preferred player interaction:** **Read**  
**Entities referenced:** M. Rourke; Sgt. Dana Pike; H. Vale; Cumberland Signal Services; Relay Site 31  
**Role:** supporting evidence

### Full player-readable text

```text
7/3

Keeping this one off the official pad because the official pad has developed
a sudden allergy to events.

Thursday night dispatch says "Vale wants 7C-41 live before midnight."
I ask WHICH Vale. Answer: "the one on the authorization."
Excellent. Very helpful. I will repair radios by horoscope next.

Package was already in the cabinet envelope. Not ours. No stock number.
Slid into B-37 exactly where the old reserve unit goes.

After 12:47 it keyed itself every six minutes.
Thirty-seven seconds of absolutely nothing. No voice. No tone. No ID.
I pulled the handset, checked the timer, checked the PTT line and then
checked whether I had finally gone stupid. Carrier kept coming.

Around 3:40 county car shows up with a typed sheet and takes my portable
monitor. Pike at the property desk was decent about it. She looked more
annoyed than I was, which is impressive. Red B-37 key was still on the
receiver ring when they bagged it.

This morning dispatch says 93-0714 was "duplicate maintenance" and no
out-of-band test was performed.

I have the carbon copy in my pocket.

Carbon paper: the nation's last reliable backup system.
```

### Facts introduced
- Rourke says dispatch attributed the activation to Vale.
- The 7C-41 package was already waiting at the site and was not normal CSS stock.
- Rourke independently observed the timed dead carrier.
- Rourke says Pike was not acting like somebody who understood the reason for the seizure.
- CSS dispatch later told Rourke the recorded test did not occur.
- The B-37 key was bagged with the receiver.

### Ambiguous implications
Rourke is writing privately and may be more candid, but private notes are not automatically more accurate. "Vale wants" could be dispatch shorthand, hearsay, or a real instruction.

### Connections
- Reinforces D1 without merely repeating it.
- Humanises Pike from D2.
- Makes D3's no-stock treatment of `7C-41` meaningful.
- Sets up D6's problem with the missing key and the nature of H. Vale.

---

## D5 — Temporary Access and Reporting Procedure — Relay 31

**Document ID:** `dead-air:asset:access-memo-7c`  
**Display name:** Temporary Access and Reporting Procedure — Relay 31
**What this is:** An administrative memo on Cumberland Signal Services (CSS) letterhead, addressed to local patrol, property, and communications supervisors.
**Author/source:** Cumberland Signal Services administrative copy; signed `H. Vale`  
**Approximate date:** 30 June 1993  
**Physical form:** typed one-page memo on CSS letterhead; photocopy with a faint top edge  
**Intended placement:** police station records / supervisor file  
**Preferred player interaction:** **Read**  
**Entities referenced:** H. Vale; Cumberland Signal Services; Relay Site 31; local police generically  
**Role:** supporting evidence / contradiction trigger

### Full player-readable text

```text
CUMBERLAND SIGNAL SERVICES
ADMINISTRATIVE COORDINATION

30 JUNE 1993

RE: TEMPORARY ACCESS AND REPORTING PROCEDURE
    RELAY SITE 31 / AUTHORIZATION 7C-41
    EFFECTIVE 30 JUNE THROUGH 08 JULY

To local patrol, property and communications supervisors:

Cumberland Signal Services personnel presenting service work associated
with authorization 7C-41 are conducting scheduled infrastructure activity.

During the effective period:

1. After-hours access at Relay Site 31 is authorized under standing
   emergency-maintenance procedure.

2. Carrier tests on the reserve equipment are scheduled activity and do
   not, by themselves, require an incident report.

3. Do not request a customer name from field technicians. Local dispatch
   will not have the customer routing information.

4. If portable monitoring equipment associated with the work is taken into
   local custody, hold it sealed. Release may be made after telephone
   confirmation from Frankfort using the standing authorization.

5. Create a normal incident report if there is injury, property damage,
   public interference or another independent public-safety reason.
   This memo is not an instruction to disregard an actual emergency.

For billing or authorization questions, reference:
7C-41 / SPECIAL / STANDING

A missing customer name is not a missing authorization.

H. Vale
Field Coordination
Cumberland Signal Services

ROUTING:
LOCAL COPY / PROPERTY
LOCAL COPY / COMMUNICATIONS
CSS FILE
CUSTOMER COPY — [faint/illegible]
```

### Facts introduced
- A memo dated before the seizure describes the exact relay, code and handling procedure.
- It explicitly tells police not to create an incident report for the activity itself.
- It anticipates monitoring equipment being held and released after a Frankfort call.
- H. Vale signs as `Field Coordination` for CSS.
- It explicitly acknowledges that the customer name will be unavailable.

### Ambiguous implications
This could be legitimate emergency-communications bureaucracy, a contractor overreaching, a backdated cover memo, or an authentic instruction routed so poorly that the people expected to obey it never saw it. The phrase "A missing customer name is not a missing authorization" is bureaucratically confident, not proof that the authorization was valid.

### Connections
- Directly conflicts with D2's blank requesting-agency/incident fields and D6's account of when the memo was actually available.
- Shares H. Vale and `7C-41` with D3.
- Explains why Rourke was told local dispatch would not have a useful customer name.
- Deepens the thread without resolving who the customer was.

---

## D6 — Property Desk Shift Note

**Document ID:** `dead-air:asset:pike-shift-note-0705`  
**Display name:** Property Desk Shift Note
**What this is:** A handwritten note by Sgt. Dana Pike, the police property supervisor who logged the receiver under record 4471.
**Author/source:** Sgt. Dana Pike  
**Approximate date:** 5 July 1993  
**Physical form:** handwritten note on the back of a property-room count sheet  
**Intended placement:** police station desk/property files near D2  
**Preferred player interaction:** **Examine**  
**Entities referenced:** Sgt. Dana Pike; M. Rourke; H. Vale; Cumberland Signal Services; Relay Site 31  
**Role:** supporting evidence / contradiction trigger

### Full player-readable text

```text
PROPERTY — DAY SHIFT

Re: 4471

If Frankfort calls again about the receiver, DO NOT release it until they
give a person's name and a callback number we can verify.

Friday caller said "H. Vale" like that was supposed to settle everything.
Saturday caller said H. Vale is "the authorization name" and would not say
whether that means a man, a woman, an office or a filing cabinet.

The CSS memo in the supervisor file is dated June 30 and says we were
supposed to know about 7C-41 before the pickup.

We did not.

Unit 12 says the typed sheet at the gate only said HOLD THE MONITOR.
The full memo turned up after shift change. Maybe it was sitting in the
wrong tray for two days. Maybe time itself is now a filing error.

Rourke came by looking for the red B-37 cabinet key that was on the receiver
ring. Key is still Drawer C. It was never logged as a separate article.
Do not hand it over by itself unless 4471 is released.

No release is entered as of 0700.

If anyone asks, the radio arrested itself.

— Pike
```

### Facts introduced
- Repeated callers from Frankfort sought the receiver.
- Different callers described `H. Vale` differently.
- Pike says her shift did not have D5's full memo before the seizure.
- The gate instruction was narrower than D5.
- The B-37 key remains in police property and was not separately logged.
- No clean release/disposition exists.

### Ambiguous implications
The discrepancy may be a cover-up, late paperwork, normal shift-change incompetence, multiple authorities using the same shorthand, or some combination. The document deliberately does not choose.

### Connections
- Gives D2 an unresolved disposition.
- Contradicts D5's implication of advance coordination.
- Recontextualises D3/D4's `H. Vale`.
- Makes the B-37 key meaningful if the player marked it earlier.

# Anchor and fallback

## Primary anchor — D1

D1 is the preferred introduction because it begins as ordinary maintenance paperwork and lets the impossible-feeling part emerge from technical detail. It introduces:
- CSS by full name;
- Rourke;
- Relay Site 31;
- `7C-41`;
- the repeated dead carrier;
- property record `4471`, which points toward the police location.

## Fallback — D2

D2 can introduce the same Narrative Thread from the opposite side if the anchor opportunity cannot safely materialise. It introduces:
- a seized receiver;
- `C.S.S.` as a generic communications service;
- Relay Site 31;
- service ticket `93-0714`;
- Sgt. Dana Pike;
- an unexplained outside hold/release request.

## Shared information

Both identify Relay Site 31, the CSS connection and ticket `93-0714`. Both imply that ordinary maintenance and police procedure intersected during the same overnight job.

## Different information

D1 gives the technical anomaly and Rourke's perspective. D2 gives the custody anomaly and Pike's perspective. Neither is a duplicate transcription of the other.

## Discovery-first behavior

Conceptually, finding either first:
1. introduces `dead-air:thread` in the journal/evidence list;
2. records that document as Evidence with its actual discovery context;
3. exposes a non-quest Lead toward the other story location through ordinary text;
4. does not announce an objective, spawn a marker, or reveal hidden truth.

Anchor/fallback governs only the guaranteed introduction path. Both curated locations retain their complete authored supporting-document contents in every case: activating D2 as the fallback does not suppress D3 or D4, and it does not remove the relay site's normal authored content.

P4-R40 resolves the placed-but-undiscovered case. If D1 was durably placed, remained undiscovered and later becomes conclusively `unavailable` only after T5/P4-R37 reconciliation, D2 may activate once as the fallback introduction. Mere unloading, absence from D1's original container, `unknown`, `untracked` or `conflict` does not qualify. D1 never respawns. T4 continues to define materialisation and idempotency sequencing in `docs/research/T4_EXACT_ONCE_PLACEMENT.md`.

# Plausible discovery paths

These are examples, not quest orders.

### Path A — relay first
D1 → D4 → D3 → survive a trip to the police location → D2 → D5 → D6.

Interpretation pressure: a weird radio job first looks like contractor nonsense, then the police paperwork makes the outside authority feel less ordinary.

### Path B — police first
D2 → D6 → D5 → follow `Relay Site 31 / 93-0714` → D1 → D3 → D4.

Interpretation pressure: an unexplained seizure first looks like police confusion, then the relay paperwork shows the confusion was attached to a real, timed technical operation.

### Path C — curiosity first
Player finds the red B-37 key near property record 4471 and manually **Marks Interesting** → D2 or D6 → D1 at the relay → D4 → D3/D5 in either order.

Interpretation pressure: an ordinary key only becomes interesting because the player decided it was. Later paperwork rewards that attention without making the key mandatory.

# Three rewarding player moments

These instantiate the targets in `docs/requirements/PLAYER_MOMENTS.md`.

## Moment 1 — the red B-37 key mattered

**Previously discovered:** the player has found a small red-tagged key in the police property area and manually Marked Interesting, perhaps before understanding D2.

**Encounter now:** D1, D4 or D6 explicitly mentions the red B-37 cabinet key. D6 is the strongest deterministic trigger because it states where the key came from and why Rourke wanted it.

**On screen:** the existing key Evidence receives an `Updated` marker. Opening it shows its original discovery context plus a deterministic note such as: `Pike's shift note says the red B-37 key came off Rourke's receiver ring and belongs to the relay cabinet.`

**Journal/evidence change:** append an evidence-update journal event; do not replace the original entry.

**Possible realization:** the player noticed a mundane object before the module formally explained why it might matter.

**Why satisfying:** the game validates player curiosity, not checklist compliance.

## Moment 2 — Relay Site 31 is a real place

**Previously discovered:** D2 or D6 has given the player the vague `Relay Site 31 / south service road / CSS ticket 93-0714` wording.

**Encounter now:** through normal survival travel, the player physically enters the hand-curated transmission/service location selected for v0.1.

**On screen:** the location's journal wording can resolve from an unconfirmed `Relay Site 31` lead to the confirmed curated building/location label. A major-discovery marker may appear. No world map quest marker or completion banner appears.

**Journal/evidence change:** append a location-confirmed entry and make evidence that referenced the site easier to recognise under the confirmed label.

**Possible realization:** the boring line on the property card corresponds to a real place the survivor managed to reach.

**Why satisfying:** survival travel and investigation become the same action.

## Moment 3 — the paperwork cannot all be cleanly true

**Previously discovered:** D2 and D5, or D5 and enough of the relay paperwork to understand `7C-41`.

**Encounter now:** D6 states that Pike's shift did not have the advance memo, while D5 is dated before the seizure; D6 also records two incompatible descriptions of `H. Vale`.

**On screen:** both source records remain visible. The notebook adds a concise contradiction entry/major marker only when the required documents are actually known. It does not choose which source is correct.

**Journal/evidence change:** append the deterministic contradiction journal event; evidence remains immutable.

**Possible realization:** either the authorisation was late/backdated, police procedure failed badly, multiple callers were using the same authority label, or something else the module will not resolve.

**Why satisfying:** the player has enough evidence to form a theory without the system awarding a solved state.

# Deterministic journal output

Journal chronology is discovery order, not story chronology. Text below is implementation-neutral authored fallback text; runtime AI is not required.

| Discovery | Journal entry | Major discovery? |
|---|---|---|
| D1 | `Found a Cumberland Signal Services (CSS) service ticket for Relay Site 31. Rourke logged a 37-second dead carrier and says police took his receiver.` | Major **only if** this is the first Dead Air document discovered; it triggers the thread-introduced event. |
| D2 | `Police logged a modified receiver from Relay Site 31. No requesting agency is named; the set carries a service number from the communications maintenance contractor, listed here as C.S.S.` | Major **only if** this is the first Dead Air document discovered; it triggers the same thread-introduced event. |
| D3 | `Cumberland Signal Services (CSS) billed ordinary relay work around a customer-supplied 7C-41 package. H. Vale approved it without a customer name.` | No. |
| D4 | `Rourke, the communications maintenance technician, kept a private account. He says he was told to make 7C-41 live, then told the test never happened.` | No. |
| D5 | `A Cumberland Signal Services (CSS) memo signed H. Vale says police were warned about the relay work in advance and told not to report the tests by themselves.` | No by itself. |
| D6 | `Pike's shift note says the contractor's advance memo was not there when the receiver was taken, and callers could not agree what "H. Vale" meant.` | Major when this discovery completes the authored contradiction prerequisites. |

Additional major-discovery events:
- **Relay location confirmed** — major, once, when the player actually reaches the selected Relay Site 31 location after it has been referenced.
- **Contradiction surfaced** — major, once, when the player knows enough source documents for the D5/D6 inconsistency to be stated without hidden knowledge.

These are discovery-state events, not quest stages. There is no final major marker for "solving" Dead Air.

# Manual Mark Interesting example

## Ordinary object — red-tagged B-37 cabinet key

**Conceptual Asset ID:** `dead-air:asset:key-b37`  
**Formal clue?** No. It is an optional ordinary object associated with the thread, not one of the six required document clues and not required to understand Dead Air.  
**Automatic Evidence?** No. It becomes Evidence only if the player manually **Marks Interesting**.

**Appearance/context:** a small, ordinary cabinet key with a cheap red plastic tag marked `B-37`, found in or near the police property drawer associated with record 4471.

**Why it could look suspicious:** by itself, almost not at all. It becomes suspicious because it is stored beside an unexplained modified receiver and is not separately listed on the main property card unless D2 is read closely.

**Facts recorded when Mark Interesting is used:**
- item description / label: `small key; red tag B-37`;
- discovery context: where the survivor found it;
- discovery order;
- optional physical tracking token only if T5 proves a safe method.

**Later relevance:** D1, D4 and especially D6 identify B-37 as the relay cabinet key that was on Rourke's receiver ring.

**Deterministic later journal update:**
`The red B-37 key I marked earlier matches the relay paperwork. Pike says it came off Rourke's receiver ring and belongs with property record 4471.`

The wording says `matches`; it does not claim the survivor has scientifically proven it is the same physical key if T5 cannot provide stable item identity.

# Evidence-list expectations

Each discovered document creates one Evidence record with:
- its authored Asset ID;
- actual discovery order;
- the story location if confirmed/known;
- a short immutable discovery-context string.

The evidence list never stores another copy of the document body. It resolves title/text/entity references from static authored content.

The manually marked B-37 key creates Evidence only if the player chooses to mark it.

# Preferred asset interaction

This is a content preference, not a Build 42 API decision.

| Asset | Preferred interaction | Engine status |
|---|---|---|
| D1 service ticket | Read / Inspect | T7/T10 mechanism proven; production adapter pending |
| D2 property record | Examine / Read | T7/T10 mechanism proven; production adapter pending |
| D3 invoice | Examine | T7/T10 mechanism proven; production adapter pending |
| D4 notebook page | Read | T7/T10 mechanism proven; production adapter pending |
| D5 memo | Read | T7/T10 mechanism proven; production adapter pending |
| D6 shift note | Examine | T7/T10 mechanism proven; production adapter pending |
| B-37 key | Examine / Mark Interesting | T5/T7/T10 mechanisms proven; production adapter pending |

No choice above decides native reader vs ModData-backed text vs custom reader UI.

# Technical assumptions deliberately not resolved here

- **T1:** complete on Build 42.20.4; the implementation must obey P4-R32 and the hard ≤500 KB/save canonical-state budget. This paper fixture does not select the final conforming encoding.
- **T3:** no automatic categorisation is required. Its checked-in live matrix supplies provisional candidates P2 `(13206,3073)` and R2 `(13549,1572)`, paired at roughly 1,538 straight-line tiles, but exact curated bindings still require live route/access, boundary and container/story-plausibility verification.
- **T4:** complete on Build 42.20.4; use queued relevant-binding wake-ups, detached item pre-stamping and exact-container reconciliation. This fixture still does not select final map bindings.
- **T5:** use the accepted mod-owned per-instance token with separate availability/conflict state and P4-R37 reconciliation; engine IDs remain diagnostic, incomplete coverage cannot prove loss, and copied-token duplication is sticky `conflict`.
- **T7:** use a persistent custom item name plus validated plain ModData title/description/body, with the custom T10 `Inspect` reader as the world-specific presentation boundary; optional locked Literature pages are limited projections only.
- **T8:** use P4-R39's bounded/debounced sampling and exact binding predicates; delayed-reference ordering and reload-inside remain production-adapter acceptance cases rather than completed probe claims.
- **T10:** complete on Build 42.20.4 through the P4-R44 manual-GUI route. Use P4-R45's privately keyed, activation-revalidated player/Ground inventory-pane actions; direct-world-item right-click is not a supported dependency. Production reader/adapter integration remains outstanding.

# Self-review

- Exactly one Narrative Thread: **yes**.
- Exactly six documents: **yes**.
- Exactly three Identities: **yes**.
- Exactly one Organisation: **yes**.
- Exactly two story locations: **yes**.
- One primary anchor and one fallback: **yes**.
- Six complete player-readable artifacts rather than summaries: **yes**.
- Three distinct voices/purposes: contractor service record, police property bureaucracy, billing, private technician notes, administrative memo, police shift note: **yes**.
- Three rewarding moments matching `PLAYER_MOMENTS.md`: **yes**.
- Multiple discovery sequences without changing authored truth: **yes**.
- No quest completion, truth banner or world reaction: **yes**.
- No runtime AI dependency: **yes**.
- No explanation of the Knox Event: **yes**.
- Exact PZ locations / engine behavior falsely claimed: **no**.
