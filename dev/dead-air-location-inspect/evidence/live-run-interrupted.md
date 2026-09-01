# Dead Air P2/R2 live location review — migration-interrupted evidence

**Status:** Substantial live evidence captured; final binding deliberately not
made because the regional route and candidate-specific arrival negatives remain
unverified. Work stopped for migration to the x380 laptop.

**Environment:** Project Zomboid stable 42.20.4, revision `b0bbce05d5`,
single-player disposable save `CF_dead_air_location_live_manual`, with only
`ConspiracyFiles_DeadAir_Location_Inspect` enabled.

**Evidence boundary:** `Observed` is visible owner evidence or structured probe
output. `Story judgement` is the owner's/design review of those facts.
`Recommendation` is provisional until the missing route/negative checks pass.

## R2 — Knox Talk Radio / communications facility

### Observed

- Building ID `1689073198563470`; bounds `(13549,1572)-(13581,1604)`;
  floors `0..3`; 26 room definitions.
- Exterior signage names the facility `Knox Talk Radio`. All tested exterior
  doors were locked in this disposable save; the owner entered by breaking a
  ground-floor window using ordinary gameplay.
- The ground floor contains a large newsroom, reception area, offices and many
  desks/filing cabinets. Exact recorded newsroom: room ID
  `1689073198563926`, z=0, rectangles `(13560,1590,9,12)` and
  `(13560,1602,6,2)`.
- The room labelled `garage` is an empty indoor parking area with no visible
  service equipment and zero logged containers. Exact room ID
  `1689073198563925`, z=0, rectangle `(13559,1572,22,14)`.
- Upper floors visibly contain communications/control equipment, metal
  shelving, desks and filing cabinets. Recorded communications room ID
  `1689073198565037`, z=1, rectangle `(13562,1576,4,6)`. Recorded top office
  room ID `1689073198565276`, z=2, rectangles `(13571,1578,6,3)` and
  `(13571,1581,8,5)`.
- Rooftop evidence shows transmitter framing and satellite dishes.
- The bounded building scan covered 1,583 loaded squares and logged 72
  containers.

### Story judgement

The owner explicitly rejected an overly literal service-garage requirement.
The public radio identity does not disqualify R2: CSS can plausibly service
communications equipment hosted at this facility, and `Relay Site 31` can be
an internal service designation rather than the public building name. The top
control office beneath the rooftop transmitter is a plausible technician
context.

### Provisional placement targets

- `CSS Field Service Ticket 93-0714`: newsroom/service desk at
  `(13563,1592,0)`, object index 1, sprite
  `location_business_office_generic_01_45`, container type `desk`.
- `CSS Invoice / Stock Transfer 9327`: communications-room desk at
  `(13562,1579,1)`, object index 2, sprite
  `location_community_medical_01_106`, container type `desk`.
- `Torn Page from Rourke's Work Notebook`: top control-office desk at
  `(13577,1581,2)`, object index 2, sprite
  `location_business_office_generic_01_42`, container type `desk`.

These are exact observed containers and plausible story choices, not final T4
production bindings. Clean-reload persistence and target-specific exact-once
integration remain later work.

### Recommendation

**Provisional pass**, with commercial-radio branding, locked exterior access,
and the empty garage recorded as caveats rather than disqualifiers.

## P2 — medium local police station

### Observed

- Building ID `3377918763860009`; bounds `(13206,3073)-(13238,3101)`;
  floors `0..1`; 24 room definitions.
- The exterior and interior visibly read as a medium local police station. All
  tested exterior doors were locked in this disposable save; the owner entered
  through broken glass using ordinary gameplay.
- A public-facing reception/property-style counter is backed by filing
  cabinets. The recorded counter boundary is room ID `3377918763860255`,
  name `hall`, z=0, rectangle `(13221,3091,2,8)`.
- A large police workroom contains many desks and filing cabinets. Recorded
  room ID `3377918763860246`, name `policeoffice`, z=0, rectangles
  `(13206,3090,12,9)` and `(13212,3099,6,2)`.
- A locked keypad security door separates the work area from visible secured
  filing cabinets. The row is logged at `(13214,3082..3086,0)`, object index 2,
  sprite `location_business_office_generic_01_33`, container type
  `filingcabinet`. The owner did not force this internal door.
- The bounded building scan covered 829 loaded squares and logged 83
  containers, including desks, filing cabinets, lockers and metal shelves.

### Story judgement and provisional placement targets

- `Police Property Record 4471`: front-area filing cabinet at
  `(13224,3090,0)`, object index 2, sprite
  `location_business_office_generic_01_32`, type `filingcabinet`.
- `Property Desk Shift Note`: front counter at `(13220,3092,0)`, object index
  1, sprite `fixtures_counters_01_42`, type `counter`.
- `Temporary Access and Reporting Procedure — Relay 31`: large workroom filing
  cabinet at `(13206,3098,0)`, object index 2, sprite
  `location_business_office_generic_01_34`, type `filingcabinet`.
- Optional red-tagged B-37 key and seized receiver context: secured cabinet at
  `(13214,3084,0)`, object index 2, sprite
  `location_business_office_generic_01_33`, type `filingcabinet`.

### Recommendation

**Provisional pass.** P2 supplies a convincing local-station scale, public
property/records context, separate general workroom files and a particularly
strong secured B-37/receiver context. The large headquarters fallback is not
currently needed.

## Regional route and remaining evidence gap

The straight-line separation remains approximately 1,538 tiles, within
P4-R41. The owner opened the world map at P2, but the disposable character knew
only the immediate local area; the screenshot cannot establish a route between
P2 and R2. No ordinary 1,500-tile journey was attempted.

The smallest follow-up on the x380 is a map-only disposable pass that reveals
the bounded P2/R2 regional corridor through the installed
`WorldMapVisited:setKnownInSquares` surface, followed by owner visual review of
the road network. It must also capture candidate-specific adjacent/wrong-room
arrival negatives before any final binding. Do not infer either result from
distance alone.

## Safety incidents and corrections

- The first safety attempt did not suppress zombies and the disposable
  character was attacked. The owner stopped, the compromised save was archived,
  and a clean save was restored. The revised probe continually removed nearby
  zombies, healed the disposable character and kept ghost/no-clip mode off.
- Initial letter-key controls collided with vanilla Crafting/Skills bindings.
  The owner stopped; the probe was corrected to inventory-context actions and
  the remaining run used those actions successfully.
- No security alert occurred. No GUI automation, synthetic input, helper,
  injection, antivirus change, exclusion or bypass was used.

## Evidence files

- Raw console: retained only in the external full audit archive because it
  contains source-PC user paths; the relevant structured facts are transcribed
  in this report.
- Screenshots: `screenshots/01-*.png` through `screenshots/17-*.png` (16 files;
  the temporary R2 lobby-only attachment expired before migration copy, but the
  later R2 images and structured lobby log remain).
- External full audit archive on the source PC:
  `C:\Users\elkin.fricke\Zomboid\_pzstory_backups\DeadAir_location_live_20260901`.

## Restoration

Project Zomboid was closed. The active disposable save/mod were moved into the
audit archive, and the original controls were restored byte-for-byte:

- `latestSave.ini` — `DE54EEC0EFA7A7BF9810E9B22CA882D1C9DEF8CB3937283CF2B6DA5383084B29`
- `options.ini` — `B726B45FB8150EB71CEC394EADE151A0502D658479A9E9F8F712573AB2935D06`
- `debuglog.ini` — `3DBD2F68125D6B1912BEC0843DD47D6165589CDC2EA90D8613690D750E06AA70`
- `mods/default.txt` — `601B865924C8456DFD1820B0237450F1906E2D4253D4FAF7FF4BA6B4A86CE850`
