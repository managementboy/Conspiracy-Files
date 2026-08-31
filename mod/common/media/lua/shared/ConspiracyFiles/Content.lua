local Ids = require("ConspiracyFiles.Ids")

local Content = {}

local THREAD_ID = "dead-air:thread"
local RELAY = "dead-air:location:relay-office"
local POLICE = "dead-air:location:police-property"
local ROURKE = "dead-air:identity:m-rourke"
local PIKE = "dead-air:identity:dana-pike"
local VALE = "dead-air:identity:h-vale"
local CSS = "dead-air:organisation:cumberland-signal-services"

local D1 = "dead-air:asset:service-ticket-93-0714"
local D2 = "dead-air:asset:property-record-4471"
local D3 = "dead-air:asset:invoice-9327"
local D4 = "dead-air:asset:rourke-notebook-0703"
local D5 = "dead-air:asset:access-memo-7c"
local D6 = "dead-air:asset:pike-shift-note-0705"
local KEY = "dead-air:asset:key-b37"

Content.ids = {
    thread = THREAD_ID, relay = RELAY, police = POLICE,
    d1 = D1, d2 = D2, d3 = D3, d4 = D4, d5 = D5, d6 = D6, key = KEY,
    rourke = ROURKE, pike = PIKE, vale = VALE, css = CSS
}

Content.thread = {
    threadId = THREAD_ID,
    title = "Dead Air",
    contentRevision = "dead-air-r1",
    documentAssetIds = { D1, D2, D3, D4, D5, D6 },
    optionalAssetIds = { KEY },
    identityIds = { ROURKE, PIKE, VALE },
    organisationId = CSS,
    locationIds = { RELAY, POLICE },
    anchorAssetId = D1,
    fallbackAssetId = D2
}

Content.identities = {
    [ROURKE] = { identityId = ROURKE, displayLabel = "M. Rourke", roleDescriptor = "CSS field technician" },
    [PIKE] = { identityId = PIKE, displayLabel = "Sgt. Dana Pike", roleDescriptor = "police property/evidence supervisor" },
    [VALE] = { identityId = VALE, displayLabel = "H. Vale", roleDescriptor = "approval / coordination identity; exact nature unresolved" }
}

Content.organisations = {
    [CSS] = {
        organisationId = CSS,
        genericLabel = "communications maintenance contractor (C.S.S.)",
        specificLabel = "Cumberland Signal Services",
        specificNameRevealAssetIds = { D1, D3, D5 }
    }
}

Content.locations = {
    [RELAY] = {
        locationId = RELAY,
        preArrivalLabel = "Relay Site 31",
        confirmedLabel = "Relay Site 31 service office",
        storyRequirement = "hand-curated transmission/utility communications service location"
    },
    [POLICE] = {
        locationId = POLICE,
        preArrivalLabel = "police property desk",
        confirmedLabel = "police property / records area",
        storyRequirement = "hand-curated vanilla police station with plausible property/records context"
    }
}

Content.assets = {
    [D1] = {
        assetId = D1, threadId = THREAD_ID, displayName = "CSS Field Service Ticket 93-0714",
        assetKind = "document", placementLocationId = RELAY, entryRole = "anchor",
        references = { ROURKE, CSS, RELAY }, leadLocationIds = { POLICE }, autoRecordEvidence = true,
        journalText = "Found a CSS service ticket for Relay Site 31. Rourke logged a 37-second dead carrier and says police took his receiver.",
        bodyText = [[CUMBERLAND SIGNAL SERVICES
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
00:11  Installed customer-supplied frequency-control package marked
       "7C-41" in spare exciter per dispatch instruction.
00:24  Key test, five seconds. No voice path requested.
00:31  Dispatch instructed: LEAVE 7C ENABLED. DO NOT ENTER FREQ. ON COPY.
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
04:05  Dispatch: leave 7C package installed. Close ticket as routine setup.

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
B-37 red key was on the same ring when they took the set.]]
    },
    [D2] = {
        assetId = D2, threadId = THREAD_ID, displayName = "Police Property Record 4471",
        assetKind = "document", placementLocationId = POLICE, entryRole = "fallback",
        references = { PIKE, CSS, RELAY }, leadLocationIds = { RELAY }, autoRecordEvidence = true,
        journalText = "Police logged a modified receiver from Relay Site 31. No requesting agency is named; the set carries a CSS service number.",
        bodyText = [[PROPERTY / FOUND ARTICLE RECORD

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

Apparently "nobody" has excellent stationery.]]
    },
    [D3] = {
        assetId = D3, threadId = THREAD_ID, displayName = "CSS Invoice / Stock Transfer 9327",
        assetKind = "document", placementLocationId = RELAY,
        references = { CSS, VALE, RELAY }, autoRecordEvidence = true,
        journalText = "CSS billed ordinary relay work around a customer-supplied 7C-41 package. H. Vale approved it without a customer name.",
        bodyText = [[CUMBERLAND SIGNAL SERVICES
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

APPROVED: H. VALE]]
    },
    [D4] = {
        assetId = D4, threadId = THREAD_ID, displayName = "Torn Page from Rourke's Work Notebook",
        assetKind = "document", placementLocationId = RELAY,
        references = { ROURKE, PIKE, VALE, CSS, RELAY }, autoRecordEvidence = true,
        journalText = "Rourke kept a private account. He says he was told to make 7C live, then told the test never happened.",
        bodyText = [[7/3

Keeping this one off the official pad because the official pad has developed
a sudden allergy to events.

Thursday night dispatch says "Vale wants 7C live before midnight."
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

Carbon paper: the nation's last reliable backup system.]]
    },
    [D5] = {
        assetId = D5, threadId = THREAD_ID, displayName = "Temporary Access and Reporting Procedure — Relay 31",
        assetKind = "document", placementLocationId = POLICE,
        references = { VALE, CSS, RELAY }, contradictsAssetIds = { D6, D2 }, autoRecordEvidence = true,
        journalText = "A memo signed H. Vale says police were warned about the relay work in advance and told not to report the tests by themselves.",
        bodyText = [=[CUMBERLAND SIGNAL SERVICES
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
CUSTOMER COPY — [faint/illegible]]=]
    },
    [D6] = {
        assetId = D6, threadId = THREAD_ID, displayName = "Property Desk Shift Note",
        assetKind = "document", placementLocationId = POLICE,
        references = { PIKE, ROURKE, VALE, CSS, RELAY }, contradictsAssetIds = { D5 },
        recontextualisesAssetIds = { KEY }, autoRecordEvidence = true,
        journalText = "Pike's shift note says the advance memo was not there when the receiver was taken, and callers could not agree what \"H. Vale\" meant.",
        bodyText = [[PROPERTY — DAY SHIFT

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

— Pike]]
    },
    [KEY] = {
        assetId = KEY, threadId = THREAD_ID, displayName = "Small key; red tag B-37",
        assetKind = "ordinary-object", placementLocationId = POLICE,
        references = { RELAY }, autoRecordEvidence = false
    }
}

local function registryCount(registry)
    local count = 0
    for _, _ in pairs(registry) do count = count + 1 end
    return count
end

local function checkUniqueIds(list, registry, label)
    local seen = {}
    for _, id in ipairs(list) do
        if not Ids.isAuthored(id) then return false, label .. " contains invalid authored ID " .. tostring(id) end
        if seen[id] then return false, label .. " contains duplicate ID " .. id end
        if not registry[id] then return false, label .. " contains unresolved ID " .. id end
        seen[id] = true
    end
    return true
end

function Content.validate()
    if not Ids.isAuthored(Content.thread.threadId) then return false, "invalid Thread ID" end
    if #Content.thread.documentAssetIds ~= 6 or #Content.thread.optionalAssetIds ~= 1
        or #Content.thread.identityIds ~= 3 or #Content.thread.locationIds ~= 2 then
        return false, "Dead Air inventory counts do not match the accepted model"
    end
    if registryCount(Content.assets) ~= 7 or registryCount(Content.identities) ~= 3
        or registryCount(Content.organisations) ~= 1 or registryCount(Content.locations) ~= 2 then
        return false, "Dead Air registry counts do not match the accepted model"
    end
    local ok, message = checkUniqueIds(Content.thread.documentAssetIds, Content.assets, "documentAssetIds")
    if not ok then return false, message end
    ok, message = checkUniqueIds(Content.thread.optionalAssetIds, Content.assets, "optionalAssetIds")
    if not ok then return false, message end
    ok, message = checkUniqueIds(Content.thread.identityIds, Content.identities, "identityIds")
    if not ok then return false, message end
    ok, message = checkUniqueIds(Content.thread.locationIds, Content.locations, "locationIds")
    if not ok then return false, message end
    if not Content.organisations[Content.thread.organisationId] then return false, "unresolved Organisation ID" end
    if Content.thread.anchorAssetId ~= D1 or Content.thread.fallbackAssetId ~= D2 then return false, "anchor/fallback IDs changed" end
    for assetId, asset in pairs(Content.assets) do
        if asset.assetId ~= assetId or asset.threadId ~= THREAD_ID or not Ids.isAuthored(assetId) then return false, "invalid Asset registry key" end
        if not Content.locations[asset.placementLocationId] then return false, "unresolved Asset placement ID " .. assetId end
        for _, referenceId in ipairs(asset.references or {}) do
            if not Content.identities[referenceId] and not Content.organisations[referenceId] and not Content.locations[referenceId] then
                return false, "unresolved Asset reference " .. referenceId
            end
        end
        for _, locationId in ipairs(asset.leadLocationIds or {}) do if not Content.locations[locationId] then return false, "unresolved lead Location ID" end end
        for _, otherAssetId in ipairs(asset.contradictsAssetIds or {}) do if not Content.assets[otherAssetId] then return false, "unresolved contradiction Asset ID" end end
        for _, otherAssetId in ipairs(asset.recontextualisesAssetIds or {}) do if not Content.assets[otherAssetId] then return false, "unresolved recontextualisation Asset ID" end end
        if asset.assetKind == "document" and (type(asset.bodyText) ~= "string" or type(asset.journalText) ~= "string" or not asset.autoRecordEvidence) then
            return false, "document Asset is incomplete " .. assetId
        end
    end
    return true
end

return Content
