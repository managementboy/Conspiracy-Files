# Map-media editorial inventory

This development branch contains 125 annotated-map bindings, 133 vanilla flyer/
brochure descriptions, 16 reusable record families and the gallery-specific family.
These are authored templates with seeded variations, not 125 bespoke stories.
Native location/carrier coverage and editorial play assessment remain unverified.

Each binding has three independently readable local fragments and a destination
record. No fragment is a piece of a hidden final answer. The destination can be
read first: comparisons appear in the organiser only after the conflicting local
record has also been noted. Facts are rendered from the saved seed; optional
interpretations and map/advert context are separate from physical document text.

| Family | Question | Conflicting records / observation |
|---|---|---|
| Fuel | Departures or equipment? | Passenger issue versus pump account; engine hours are not road mileage. |
| Water | Who had a supply? | Isolation order versus valve round; flow does not establish water quality. |
| Telephone | Did messages get out? | Disconnected circuit versus connection entry; switching is not a conversation. |
| Beds | Was there space for arrivals? | Beds held vacant versus occupied; billing is not an admission record. |
| Radio | Failure or changed communications? | All-day withdrawal versus transmission; acknowledgement lacks a return path. |
| Bus | Passengers or repositioning? | Passenger carbon versus empty-run ledger; run ID is not vehicle identity. |
| Mail | Could messages leave? | Bag collected versus retained; neither records the seal number. |
| Keys | Who had access? | Original issued versus still in cabinet; inventory number is not a lock match. |
| Food | Supplies received or waiting? | Acceptance versus refusal; storage timing is absent. |
| Power | Which places stayed lit? | Isolation versus measured current; instrument/range omitted. |
| Names | Person absent or list changed? | Attendance versus reception; neither proves badge user's identity. |
| Road | Closed to everyone? | No exceptions versus service admission; authorisation has no pass reference. |
| Medicine | Delivered or recalled? | Dispatch versus receiving book; packaging does not identify treatment. |
| Repairs | Vehicles kept off the road? | Release versus brakes dismantled; a stamp does not establish roadworthiness. |
| Housing | Empty or counted as empty? | Vacancy versus answering occupants; an estimate does not prove completed work. |
| Waste | What was cleared away? | Yard acceptance versus gate refusal; sealed bins do not establish hazardous contents. |
| Gallery | A route for cargo or people? | All G14 removed at 04:10 versus continuously present at 05:00; W-114 identifies neither a verified person nor the true account. |

Dates vary deterministically within 1–7 July, before the vanilla July 9 start.
The gallery preserves the overnight ordering and five-hour-ten-minute interval
from 23:00 to 04:10. The plan's fixed July 11/12 example was moved earlier to avoid
future-dated discoveries at the vanilla start. Names, reference codes and amounts
vary by persisted seed. Calendar starts before July 1993 are outside this content
baseline and require separate validation/content handling.

Coordinates are source candidates, not verified loot locations. Usable stash
anchors are the baseline; placeholder anchors use meaningful non-text symbols.
The gallery explicitly uses its map mark at 12546,1393. EkronStashMap6 has no
meaningful vanilla destination: our circulation copy explicitly concerns a map
complaint routed to Circuital Healing, 8B Hutchin's Drive, rather than pretending
its graffiti marks a building. This is an authored connection, not vanilla lore.

Only actual overlap with a flyer's/brochure's source rectangle associates that
print with a binding. Reading a print is optional and reveals its ordinary place
information; it never starts or gates a map trail. Artwork-only claims, container
existence and symbol interpretation require Claude's native/source review.

`tools/research/build_map_media_catalogue.py` regenerates the catalogue from the
checked-in survey. It does not overwrite the authored content module.
