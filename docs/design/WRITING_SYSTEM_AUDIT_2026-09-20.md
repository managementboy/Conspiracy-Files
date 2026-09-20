# Writing-system audit and replacement contract

Source baseline: `a65ce46`, including Claude's DEV-0.45.1 map fixes. Source inspection only; no new test, build or game results. The owner supplied screenshots of the personal opening and requested an audit before passage edits, coherent underlying events, evidence progression, personal voice and application across the writing system.

## Finding

The machinery reliably connects identifiers more often than it connects actions. Ordinary mysteries assemble a claim, an agreeing/disagreeing response and interchangeable optional roles. Map trails select a family by a hash of the design and seed, without semantic destination requirements. Projections then describe backend link types as findings. No common contract requires an event, a useful local answer, or an explanation grounded in the evidence the survivor actually knows.

This is not just a pronoun defect. Three separate things need correcting: what happened; what each object reveals; what the survivor can say after finding particular objects.

## Scope and current source map

Paths below are relative to `mod/common/media/lua/`. Derived vanilla wording is input, not prose to rewrite. Archived screenshots/build artifacts and proposed occupation designs are not active story producers.

| Writing surface | Authoritative source and current behavior | Required treatment |
|---|---|---|
| Ordinary mysteries | `shared/ConspiracyFiles/Generated/Premises.lua`, 20 randomly selectable families | Give each an event, participant roles, temporal scope, essential evidence and bounded outcome; retain the full pool |
| Personal opening | Same file, `no-contact-at-premises`; `client/ConspiracyFiles/GeneratedRuntime.lua` snapshots the survivor's name | Personal participation must alter observations/questions; document wording cannot invent memories, consent, occupation or prior residence |
| Connected follow-up | `still-filing`, Generator `follows`, runtime pending-thread preference | Preserve the existing sourced reference; replace a merely administrative continuation with a supported new finding |
| Optional evidence and physical objects | `Generated/Generator.lua`, `EvidenceRoles.lua`, `EvidenceKinds.lua`, `ObjectRules.lua` | Select by an event-specific evidential purpose before choosing an eligible physical carrier |
| Map trails | `MapMediaContent.lua`: 16 families plus gallery special; `MapMediaRuntime.rows` | Bind scenario to destination capabilities, give the destination an answer, and gate every comparison on its actual sources |
| Vanilla maps/prints | `MapMediaCatalogue.lua`, catalogue generator and 133 print descriptions | Preserve source wording; do not treat map symbols or advertising as verified facilities, operational services or live survivors |
| Evidence projection | `Generated/Generator.project`, `client/EvidenceRows.lua` | Infer from discovered source propositions; do not reveal unseen document titles simply because a backend edge exists |
| Native item pages | `Generated/DocumentPages.lua`; runtime stamping | Keep documentary text separate from physical description and survivor interpretation; heading-based parsing is an existing integration constraint |
| FILES/NAMES/DATES/PLACES | `client/KnoxApps.lua`, `EvidenceRows.lua`, `shared/PlaceIndex.lua` | Keep one knowledge source; distinguish written dates from discovery time; show useful case context without exposing hidden structure |
| Addresses and navigation | `Generated/PlaceNames.lua`, `client/AddressMap.lua`, marker notes | A backend destination must become an understandable address/landmark/direction in the actual text. “The receiving building” alone is insufficient |
| Spoken reactions | `client/PlayerVoice.lua`, pickup and discovery callers | Use first-person reactions to supported discoveries. Context links must not be announced as agreement; accounting must not announce omniscient completion |
| Identity/body/key observations | `IdentityObservations.lua`, `ObservedKeyLead.lua`, `KeyConnection.lua`, `client/KeyJournal.lua`, key/identity observers, outfit/name observations | Preserve observed provenance; use concise survivor wording instead of appending a legal disclaimer to every observation |
| Questions and continuing investigation | `Generated/Questions.lua`, `SuccessiveCases.lua` | Keep the player's interpretation separate from established findings and a concrete sourced open question |
| Retirement and retained history | `Generated/Session.lua`, `RetiredCase.lua` | Apply essential-evidence protection to every scenario; retain sourced findings and known evidence through compaction |
| Legacy Dead Air | `shared/Content.lua`, `Renderer.lua`, legacy runtime | Retained six-document mechanism fixture with an actual event chronology; its memo also enters generated play through `RelayMemo.lua`. Audit active reuse, preserve fixture identity and engine contracts |
| Context/metadata labels | `ContainerWords.lua`, `PlaceIndex.foundLine`, `EvidenceKinds` | Describe actual carriers. A payment slip on a notepad does not become a “review notepad” in the survivor's account |

Read-only review of the generated core covered all 22 premise definitions, generator assembly/projection, current opening and follow-up runtime paths, questions, retirement and archive code. The main review covered all 17 map scenario definitions, their selection/rendering path, the six legacy documents, reused memo, page separation, evidence/UI projection, carrier rules and identity/key/voice context. Existing September 19 findings were checked against current code rather than carried forward as current facts.

## Confirmed defects and useful existing work

1. **Optional roles do not share an event.** Generator's optional key, diary, notebook, clipping, payment and object roles are largely premise-independent. The stock attachment exists because an object was selected, rather than because a story requires that consignment. This produces the screenshot's unrelated firestarters.
2. **Link type substitutes for reasoning.** The payment role always gets a dispute link even when advance payment conflicts with nothing. EvidenceRows renders it as “Does not match.” PlayerVoice announces non-dispute links as agreement, including context links.
3. **The personal opening knows a name, but its interpretation ignores its significance.** `{SELF}` appears on the collection slip; the note says “in this name.” No first-person recognition or personal question follows.
4. **The address problem crosses layers.** The opening deliberately binds the slip to site A and schedules collection at B. That difference exists in the model. However, fallback rendering can leave the player with “the receiving building,” while the note confidently discusses an address discrepancy. The fix must make B identifiable, not merely delete a sentence.
5. **Map scenario choice is semantically unconstrained.** `family(binding,seed)` selects any of 16 families. Labels and references do not make a residential destination into a depot, clinic, staffed exchange or district yard. A family needs capabilities and a plausible reason for its records to be there.
6. **A final contradiction is routinely treated as a payoff.** Map destinations usually add a conflicting account and another question. The player learns that two records differ but not a bounded result worth the journey.
7. **Knowledge limits are only partially enforced.** Map payoff comparison waits for fragment 1, a useful existing guard. Generated body interpretations are static, while optional unseen-link hints derive from the hidden target's title. First-found items must stand alone without drawing on later discoveries.
8. **Physical labels leak authoring roles.** EvidenceKinds calls a Notepad a “Review notepad” and Note a “Dispatch document”; PlaceIndex uses those as descriptions. The screenshot's mismatched carrier text follows directly from this path.
9. **Caution dominates the voice.** Identity/key prose repeats what every observation does not prove. Map specialist observations mostly list missing identifiers. Useful uncertainty should be attached to the actual unresolved question, alongside something the player did learn.
10. **Current improvements must survive.** The personal opening, sourced `still-filing` continuation, and essential-clue completion guard now exist. The September 19 audit predates these changes. They need extension and better content, not replacement by an older architecture.
11. **Ordinary endings remain weak.** The 20 ordinary families do not declare essential anchors. Two protected special scenarios do not establish a full-system payoff contract. Deep archive preserves continuation/completion metadata but discards evidence rows and their connections.
12. **Dead Air demonstrates stronger causality but is not universal glue.** Installation, repeated carrier, seizure, custody and conflicting authorisation form an event sequence. The reused relay memo has no causal link to arbitrary generated cases; a date overlap alone cannot manufacture that link.

## Every active scenario remains in scope

The following are authoring targets, not assertions that the current code already produces these outcomes. Each event must support its own variants; no requirement to produce a sinister alternative for every ordinary explanation.

| Ordinary family | Event and bounded discovery to implement |
|---|---|
| transfer-nobody-arranged | A reassignment processed through a particular desk; establish arrival or failed handover and who handled it |
| signed-by-someone-absent | A delivery accepted by a proxy or falsely receipted; distinguish signature from custody |
| two-start-dates | A secondment later entered into a personnel file; establish the intervening assignment |
| resignation-after-payslip | A departure followed by delayed payroll processing or continued work; establish the last supported duty |
| address-that-only-receives | A holding address used for forwarding supplies; establish a particular onward movement or retained stock |
| identical-inventories | A transfer counted twice or copied from an earlier inventory; identify the actual stock or duplicate count |
| room-not-on-the-plan | Renumbering or restricted use of an actual room; establish which change occurred using a verified location |
| lease-outlived-tenant | Premises retained after a tenant's departure; distinguish a paid reservation from continued use |
| load-that-got-lighter | Partial unloading or a scale error; identify the consignment movement or the documented measurement fault |
| fuel-for-a-dead-truck | Fuel issued under a disabled vehicle's account; establish which supported use received it |
| returned-cleaner | A repaired or substituted item; trace a serial/mark and the handover that explains the change |
| two-crates-one-number | A reprint or second movement; distinguish physical consignments through marks and custody |
| paid-before-ordered | Standing authority or retrospective paperwork; establish the approval sequence and what it funded |
| overtime-nobody-worked | Standby or off-site duty entered as attendance; establish the actual assigned task |
| closure-announced-twice | Public closure and restricted continued service; establish who could still use which service |
| appointment-out-of-order | Referral or misfiled attendance; recover the earlier service without imposing medical history on the survivor |
| file-signed-out | A specific record moved to another desk; establish its contents, recipient and last supported custody |
| missing-ledger-page | An entry recovered from an independent copy; reconstruct the missing action without automatically asserting concealment |
| photograph-without-a-name | A caption or role omitted from a group record; recover who that person was doing work for, without claiming present survival |
| withdrawn-extension | Calls rerouted after public disconnection; establish the receiving desk and one message's disposition |

Special scenarios: the personal collection opening and `still-filing` continuation need an event and meaningful local result under the same contract. See the complete reference example.

Map families: fuel, water, telephone, beds, radio, bus, mail, keys, food, power, names, road, medicine, repairs, housing, waste, plus gallery. Each needs a site-compatible event, distinct fragment purposes, destination answer and optional sourced remaining question. All 125 design bindings remain in coverage scope; the existing destination defects are not permission to omit maps.

## Replacement authoring and generation contract

Implement this through the existing generator/projection boundaries; avoid building a separate quest engine.

- **Event:** actors with roles; action; affected person/resource; places; dates; local outcome; remaining uncertainty. Hidden authoring facts describe what leaves the traces, not a secret definitive explanation for Knox.
- **Source:** who made each object, why they made it, why it is at its carrier, and what it explicitly says or visibly shows. A person's report remains attributed.
- **Evidence contribution:** each essential clue reveals a different part of the event. Optional clues deepen, corroborate or identify it; random unrelated objects do not pad the count.
- **Inference:** explicit source IDs and required known facts. Contradiction requires incompatible propositions about the same subject, scope and time. Context, correction, sequence and disagreement are distinct relations.
- **Voice:** documentary wording belongs to its author; physical observation and personal interpretation belong to the survivor. No invented memories. No automatic “I don't remember” explanation. Neutral labels remain neutral.
- **Grounding:** a named vanilla business must do something consistent with verified game sources. Its activity should explain an event, document or useful destination. Do not use business names as random stationery or put a canonical business at an arbitrary bound house. Invented local events are the mod's fiction, not new claims about vanilla canon.
- **Humour:** Q24 requires fatalistic, bureaucratic dark comedy throughout. An absurd but intelligible institutional priority must produce a concrete human consequence. Documents should sound useful to their authors; the survivor may notice the absurdity. No joke quotas, repeating disclaimers, or interchangeable punchlines. Judge the complete mystery as a reading experience, not by searching for humorous words.
- **Variation:** choose coherent event alternatives first; derive dates, quantities, roles and all related text from those choices. Constrain objects and locations before rendering. The player's preferred explanation never changes historical facts.
- **Navigation:** each named destination must be locatable from discovered information. Identify the actual bound place; do not fabricate a business address for whichever house was selected.
- **Outcome:** state what was learned, why it matters, and what remains open. An incomplete case remains incomplete when essential evidence is missing. Every optional clue is not required for a valid local conclusion.
- **Persistence:** save deterministic event inputs/revision and discoveries; keep source text immutable in a save. Derive new interpretations from the growing known set. Retain sourced findings in history. Fresh-save release; no legacy migration work.
- **Presentation:** the survivor should be able to understand the important point in the small reading pane. Reference numbers can identify paperwork but cannot be the principal explanation of a case.

## Verification required from Claude after implementation

### Named-business grounding checked for the first implementation batch

The primary-source extract is `docs/research/vanilla-print-2026-09-19/catalogue.json`,
whose `sources_sha256` records the installed game files used for extraction.
The relevant vanilla translation keys are `Print_Text_<id>_info`.

| Vanilla record ID | Supported setting facts | Permitted authored role in this batch |
|---|---|---|
| `McCoyLoggingCorp` | McCoy Logging Co.; Muldraugh mill, industrial equipment, truck-driving work | Mill repair, parts, personnel and a borrowed company vehicle |
| `UStoreItMuldraugh` | U-Store It; Muldraugh rental lock-ups and stored household/work supplies | Rental records, inventories and storage staff |
| `Fossoil1` | Fossoil; retail fuel, Muldraugh location at 119 Dixie Highway | Fuel accounts and staff; a particular delivery is authored fiction |
| `SunstarMotel` | Sunstar Motel; rooms and diner at 118 Dixie Highway, Muldraugh | Room linen, diner stock and staff |

The `Base.VanJohnMcCoy` definition in the installed
`media/scripts/generated/vehicles/professionVehicles/vehicle_van_JohnMcCoy.txt`
also supports the company's vehicle context. These sources establish businesses
and activities, not the mod's invented incidents or policies. In particular,
retained-copy addresses A/B do not become those businesses' premises. Named
broadcast characters require their own source/timeline check before involvement;
the first batch does not fabricate roles for them to satisfy a name count.

All 22 generated families and 17 map families must be covered, including each authored variant and materially different carrier/site combination. Check every discovery subset/order that changes an inference, destination-first discovery, missing optional versus essential evidence, multiple cases, duplicate reads and reload. Verify contradictions against their propositions, not just against expected text strings.

Inspect complete rendered examples for readability, personal recognition and meaningful next action. Check source-only native pages, journal/UI knowledge parity, archive retention and budget at the new content sizes. Run the existing suite and update obsolete assumptions deliberately. Builds and native testing remain Claude's responsibility; this audit supplies no passing evidence for the rewrite.


## Additional primary grounding checked during the ordinary-family rewrite

These records are in the same archived vanilla catalogue; only the setting facts
below are canonical. The incidents and institutional policies are authored fiction.

| Record | Verified activity or history | Authored use |
|---|---|---|
| `CircuitalHealing` | Electronic repair in Ekron, including radios and televisions | Radio-return mix-up and electronic time-clock bench test |
| `LennysCarRepair` | Vehicle servicing and repairs in Doe Valley | Starter repair/collection-label dispute |
| `HobbsandPerkinsHardware` | Construction materials and tools in Irvington | Returnable shipping crates and roof-material deposit |
| `LectromaxManufacturingJobAd` | Cutting/shaping saw blades; lathe and hydraulic press work near Riverside | Finished-stock dispatch and press-restart standby |
| `LouisvilleBruiser` | Baseball-bat maker in Louisville; tours and bats to take home | Prepaid stock-imprint presentation bats |
| `OldCGECorpBuilding` | Manufacturing 1961-1980; proposed demolition and campaign for a museum; skybridge | Preservation survey and blocked further access, not resumed production |
| `ColdWarBunker` | March Ridge military bunker decommissioned in 1991; forty beds; subsequent visitor tours and outstanding hazard caveats | Visitor-display preparation during an authored admission suspension |

## Placement evidence supplied by the owner during implementation

See `CLUE_PLACEMENT_VARIETY.md` and decision
`DR-20260920-WRITING-PLACEMENT`. Investigate Area/foraging provides discovery;
the old furniture whitelist is not an agreed difficulty control. The writing
must describe actual non-floor hiding places, and the scanner must preserve
candidate-kind variety rather than fill its bound with the first eight common
containers. Wider placement is outstanding implementation, including honest
whereabouts for containers moved or dismantled. Parked environmental, floor and
empty-stash ideas are not silently added to the feature scope.
