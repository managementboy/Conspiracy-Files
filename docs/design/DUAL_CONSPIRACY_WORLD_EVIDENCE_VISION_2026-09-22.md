# Dual Conspiracy and World-Evidence Vision

**Status:** Owner-approved direction; first implementation slice built in `DEV-0.47.0-dual-world-evidence`
**Date:** 2026-09-22
**Implementation update:** 2026-09-23
**Purpose:** Preserve the approved design direction and distinguish the implemented first slice from the larger vision still to build.

This document describes both the intended player experience and the bounded first implementation. Where the current mod still falls short, that gap is stated explicitly.

## The vision in one page

The player should not begin by being told a conspiracy story. The player should wake inside a physical situation that does not quite make sense.

For the Fitness Instructor, the first question is personal and immediate:

> Why was I at this address when everything collapsed?

The occupation explains the route into that predicament. It does **not** explain immunity, special knowledge, guilt, or why this survivor lived while others died.

The opening clue may be on the player at spawn. It should appear as early as technically possible and may use a short character thought or proximity hint to draw attention to the contradiction. The clue begins the investigation; it does not answer it.

As the player follows the local mystery, the objects and scenes they encounter should also point toward two incompatible explanations for the larger Knox Event. Both explanations must fit the same established facts. Neither may be secretly selected as the correct answer.

The first proposed pair is:

1. **Farm Zero / zoonotic spillover:** infection crossed from animals to people at a farm, after which authorities concealed their delayed response and earlier negligence.
2. **Delivered Agent:** biological material reached the farm from a research, military, or weapon-related source; animals and workers then became secondary victims, and records were altered to hide where it came from.

Both theories accept that animals were sick, farm workers became ill, biological material moved, records were altered, and officials knew more than they admitted. They disagree about the direction of travel.

The campaign's central unanswered question is:

> **Did the infection leave the farm as a sample, or arrive at the farm as a sample?**

The world, not a stack of exposition documents, should carry most of the story. A key that opens a real door, an animal-feed sack in a bedroom, a room full of spent protective equipment, a corpse wearing the wrong uniform, or a damaged vehicle containing a cooler can all be evidence. Paper is still useful, but mainly for names, dates, destinations, and what somebody claimed.

Vanilla randomized scenes — crashes, emergency vehicles, roadblocks, barricaded houses, burned buildings, campsites, bodies, outfits, and contextual cargo — should become optional evidence when the current save happens to generate them. The mod should observe these scenes after vanilla creates them, describe only what is physically observable, and avoid claiming knowledge of the hidden vanilla story definition.

The intended experience is discovery, testing, and comparison:

- The player finds a real object.
- The object creates or sharpens a question.
- The player can test some relationships in the world.
- The same observation supports two plausible readings.
- Local questions can be resolved, but the central origin remains disputed.

## 1. Non-negotiable design principles

### 1.1 The world is evidence

Evidence should exist as things the player can find, inspect, carry, open, compare, revisit, or physically travel to.

Documents may connect those things, but documents should not do all of the narrative work.

### 1.2 Observation comes before interpretation

The mod may assert facts the game can actually support:

- this key opens this door;
- this vehicle is damaged;
- these objects were in this container;
- several used masks were gathered in an unusual room;
- this corpse wore a particular outfit;
- an animal-feed sack was found in a residence;
- a named card lists an address and date.

The mod should not magically assert facts that the player or survivor could not establish:

- whose blood is present;
- whether biological material contains the Knox infection;
- the exact cause of a crash;
- the internal name of a vanilla randomized story;
- what another person intended;
- whether a government, farm, laboratory, or foreign power is ultimately responsible.

### 1.3 Every central conspiracy has a rival

The campaign must never offer one master theory with a few decorative doubts. It should establish two strong, competing explanations that fight over the meaning and direction of the same evidence.

The player may develop a preference. The game must not secretly calculate that one belief is correct.

### 1.4 Profession is an entry point, not destiny

The survivor's profession provides a credible reason to be at a location, know a client, recognize ordinary equipment, or follow a particular lead.

It does not make the survivor:

- uniquely immune;
- the only survivor;
- responsible for the Knox Event;
- a preselected investigator;
- an expert virologist, intelligence officer, or forensic scientist;
- automatically trusted by institutions they have never worked for.

### 1.5 Local answers, central uncertainty

A local mystery may have a concrete solution. The player might learn who owned a vehicle, why a client had a key copied, where a cooler was supposed to go, or who altered an appointment.

Those answers should clarify the chain of events without resolving the ultimate origin of the Knox Event.

### 1.6 No loot windfalls

Evidence objects must not become an excuse to give the player a powerful starter kit. A relevant vehicle may be wrecked, nearly empty, inaccessible without work, low on fuel, or valuable mainly because of its contents and relationships.

### 1.7 The campaign belongs to the world

The conspiracy pair and fixed historical facts should persist at world level. A replacement survivor in the same save inhabits the same history.

What an individual survivor has personally discovered should remain character-specific unless another survivor physically recovers the evidence or records.

### 1.8 Vanilla randomness should increase replayability

The mod should take advantage of scenes vanilla already generated in this save. It should not assume every save contains the same car crash, body, barricaded house, or vehicle.

No essential chain may depend on a random scene before the mod has proved that the scene exists, is stable, and is reachable enough for the current case.

## 2. Lore boundary

The opening must fit Project Zomboid's unresolved Knox Event rather than replacing it with a definitive canon.

The survivor is not established as the only living person. Other immune or uninfected survivors exist. The occupation-specific story therefore answers a smaller and more useful question:

> Why was this particular survivor at this particular starting place at the moment ordinary life ended?

The profession cannot explain airborne immunity. It can explain an appointment, house call, delivery, client relationship, access key, borrowed equipment, or other ordinary obligation that became suspicious in retrospect.

The origin opening must also use a timeline appropriate to the start of the outbreak. A broad May–June paperwork calendar may be useful later, but it is not sufficient for a scene intended to explain why the player is present immediately before or during the collapse.

## 3. Three narrative layers

The mod should keep three questions distinct even when a clue touches all three.

### Layer 1: Personal predicament

Why was I here? Why did I have this key? Who expected me? Was my name used? What ordinary commitment put me in the path of this event?

This layer begins immediately and should be legible to a new player without prior lore knowledge.

### Layer 2: Local incident

What happened in this house, vehicle, farm, clinic, workplace, or response scene? Who moved the objects? What sequence best explains the physical arrangement?

This layer can produce real, satisfying answers.

### Layer 3: Central conspiracy

What does the local incident imply about the origin and handling of the Knox Event? Was the farm the origin or a destination? Was an official response late, or was it concealing prior knowledge?

This layer remains unresolved. The evidence should improve the player's argument without producing a canonical winner.

## 4. The paired-conspiracy model

Each campaign should define:

- two named central readings;
- a set of fixed facts accepted by both;
- a disputed causal direction or motive;
- a fact that is genuinely missing and cannot be recovered conclusively;
- evidence leaning toward the first reading;
- evidence leaning toward the second reading;
- dual-use evidence that fits both;
- evidence that damages both stories or suggests panic, error, opportunism, or administrative chaos.

The pair is not a multiple-choice quiz. The mod should not store `correctTheory = A` or award points for selecting the author's preferred interpretation.

The design should also avoid a simplistic fifty-fifty rhythm. Ambiguity is stronger when evidence has different weight, provenance, and reliability. One theory may appear dominant for a while, then a physical contradiction may reopen the other.

The following must not exist:

- a hidden objective winner;
- theory scores presented as truth;
- a victory screen declaring the origin solved;
- a final confession that resolves the central pair;
- a conveniently complete laboratory record;
- a captured mastermind who explains everything;
- an invented foreign country named as the proven attacker;
- a single smoking gun that collapses all ambiguity.

## 5. First central pair: Farm Zero versus Delivered Agent

This is the recommended first authored conspiracy pair. It is specific enough to design evidence around, but remains compatible with the deliberately uncertain lore.

### Theory A — Farm Zero / zoonotic spillover

The first meaningful crossing occurred naturally between animals and people at or near a farm. Authorities or contractors later collected samples, suppressed early warnings, changed records, and concealed negligence or delay.

Under this reading:

- animal illness comes first;
- workers and households become the earliest human cluster;
- coolers, specimens, and emergency transport are attempts to carry samples away for testing;
- protective equipment is a late and inadequate containment response;
- altered records hide failure, not creation or delivery.

### Theory B — Delivered Agent

Research-, military-, or weapon-related biological material was transported to or through the farm. The animals and workers became secondary victims. Later records were altered to hide the origin, route, or purpose of that material.

Under this reading:

- the suspicious material arrives before the animal cluster;
- vehicles, coolers, cases, and access arrangements form an inbound route;
- protective equipment belongs to handlers, monitors, or cleanup personnel;
- altered records conceal prior knowledge or unauthorized movement;
- the farm is a test site, transfer point, accident site, or convenient cover story.

### Facts both theories accept

- Animals at or near a farm became sick.
- Farm workers or their close contacts became ill.
- Biological or animal-related material was moved.
- Some people used protective equipment before the full public collapse.
- Records, labels, schedules, or explanations were altered.
- Officials, contractors, or responders knew more than they publicly admitted.
- Later chaos damaged the evidence chain.

### The missing fact

The decisive direction of transfer is absent:

> Did the infection leave the farm as a sample, or arrive at the farm as a sample?

That missing fact should not be waiting in a late-game safe. It is the structural absence around which the campaign is built.

### Future pairs

Other pairs may later use the same design grammar:

- foreign biological sabotage versus domestic research accident;
- failed medical countermeasure versus response to an already-existing outbreak;
- natural outbreak plus institutional cover-up versus introduced material plus operational cover-up.

These are future directions, not a reason to dilute the first implementation. The first pair should be authored and tested deeply before a library of shallow alternatives is added.

## 6. Fitness Instructor opening

### 6.1 Required opening behavior

For the first Fitness Instructor investigation:

1. The opening evidence belongs inside the starting house or on the spawning survivor.
2. It is placed as early as technically possible.
3. A plausible closed container away from the exact spawn point is preferred when the selected clue benefits from searching and the house permits it.
4. The opening may instead be directly on the survivor when possession is the contradiction.
5. A proximity hint or brief character thought should draw attention to the opening clue; it should not be suppressed.
6. The player should not be required to search the entire building blindly before the story starts.
7. The first clue asks why the survivor is here. Other evidence is placed elsewhere so the first clue does not immediately answer its own question.

### 6.2 Residential reasons that fit the occupation

Residential spawns need residential appointments. Suitable opening premises include:

- a private home fitness assessment;
- a rehabilitation or mobility house call;
- instruction for newly installed home exercise equipment;
- an injury follow-up;
- collection of gym equipment loaned to a client;
- private boxing or conditioning coaching;
- firefighter or police physical-test preparation;
- an early running-group rendezvous;
- an insurance fitness assessment;
- a welfare visit to a regular client who suddenly stopped attending.

Studio classes, boxing rooms, and gym inductions are valid only when the actual starting building supports that setting.

### 6.3 Ten starts are variants, not ten interchangeable paragraphs

The Fitness Instructor should eventually have at least ten genuine openings. They should vary by:

- the credible reason for being at the location;
- the first physical contradiction;
- the relationship to the client or destination;
- the type of object or access being tested;
- the local incident that connects to the central pair.

They must also be filtered by spawn context. A home visit should select a residence. A gym-class opening should require a gym-like location. A vehicle-related opening should not promise a vehicle until one has been found and reserved in this save.

The ten implemented starts now use the residential reasons above and the same authored five-finding evidence grammar. They are no longer generic technical placeholders. Their local pretexts, client relationships, and wording vary, while all ten deliberately test the same Farm Zero versus Delivered Agent campaign pair. Native play remains necessary to judge whether they feel distinct enough; later versions should vary their physical evidence grammars as well as their appointments.

## 7. Proposed first Fitness Instructor mystery

This is the approved and implemented first reference structure. Its wording remains subject to ordinary playtest revision.

### Opening premise

The survivor appears to have had a July 8 home fitness assessment at the current address. A client connection leads toward a local farm.

The ordinary explanation is plausible: a trainer made a house call. The contradiction is that the survivor's access and the remaining physical evidence do not line up cleanly with the surviving schedule.

The personal question is:

> Did I come here for an ordinary appointment, was my name used to make the visit look ordinary, or did somebody erase part of a real arrangement?

The restrained survivor thought is approved and implemented as: “This opens the house. Why did I have access?” The mod still must not invent a detailed biography or false memory merely to force the mystery.

### The first five clues

| # | Physical evidence | What the player can test or observe | Farm Zero reading | Delivered Agent reading |
|---|---|---|---|---|
| 1 | A real `Key1` on the survivor | It opens the starting house and is not part of an ordinary generic key handout | A client legitimately supplied access for a home appointment or emergency welfare visit | Someone equipped the instructor to enter a selected site under an ordinary-looking pretext |
| 2 | One appointment card dated July 8 | It carries the current address, survivor name, client identity, farm connection, and a confirmed status | The visit was a real service call to a household already touched by an animal-health incident | The appointment created a civilian cover for entry, observation, delivery, or retrieval |
| 3 | A damaged or worn `AnimalFeedBag` in the wrong residential room | Its presence, damage, and location are directly observable | Contaminated farm material was brought home during an emerging animal outbreak | A feed sack was used to carry or conceal introduced material |
| 4 | A suspicious concentration of spent protective equipment in an unsuitable room | The player sees used masks, gloves, disinfectant, worn filters, and dirty or bloodied bandages as one environmental finding | The household improvised containment after animals or people became ill | Handlers or a cleanup team worked inside the house before abandoning it |
| 5 | A second key linked to a nearby real vehicle containing an ambiguous transport scene | The key opens the vehicle; the player can inspect damage and cargo such as a cooler or protective case, animal-related remains or specimen material, used PPE, or feed | Samples were being taken away from the farm or household for testing | Material was being delivered toward the farm or house, or recovered after exposure |

The fifth finding is powerful because it proves access and transport without proving direction.

### Suggested opening thought

If the first key is on the survivor, a concise prompt could be:

> This opens the house. It isn't one of my usual keys. Why did I have access?

The final wording needs to respect the project's survivor-voice rules. The important function is to identify the contradiction without narrating an answer.

### Optional supporting paper

Only one document is essential in the five-clue chain: the appointment card. Later supporting material may include:

- a cancellation record where “animal-health quarantine” was replaced with “routine client illness”;
- an ambiguous cold-chain docket;
- conflicting sample registers;
- a route list whose times cannot all be true.

These papers should deepen or contradict the physical evidence. They should not substitute for it.

## 8. Evidence grammar: paper is a minority

The guiding sentence is:

> **Papers tell what people claimed. Objects show what they handled, moved, used, or tried to conceal.**

An ideal five-clue mystery contains:

- one personal object on or immediately associated with the survivor;
- one testable object, such as a real key or keyed vehicle;
- one object whose condition matters, such as damage, dirt, wear, blood, or missing contents;
- one quantity or room anomaly, such as an implausible accumulation of protective equipment;
- one larger physical scene involving a corpse, vehicle, locked destination, crash, fire, barricade, or spatial arrangement;
- no more than one necessary document used to establish a name, date, address, or claim.

This is a design target, not a rigid formula for every investigation. The important correction is that the player should not solve mysteries by reading five pieces of prose in sequence.

### Existing object vocabulary

The current catalogue and rules already provide useful building blocks:

- keys and car keys;
- animal-feed sacks, animal bones, and animal tissue items;
- coolers and meat coolers;
- bleach and disinfectant;
- surgical gloves, surgical masks, respirators, and gas masks;
- medical bags, protective cases, and specimen-like items;
- physical-trace, name-bearing, testable-access, accumulation, vehicle-bulk, medical-hoard, misplaced-bulk, and out-of-place rules.

These systems establish a good vocabulary. They do not yet compose those objects into the required multi-object scenes or paired interpretations.

### A scene is one finding

A room containing twelve pieces of spent protective equipment should not automatically become twelve clues. It is one environmental finding whose meaning comes from quantity, condition, and location.

The future evidence model therefore needs to support grouped observations:

- the scene anchor;
- the objects or bodies that belong to it;
- observable conditions;
- spatial relationships;
- access relationships;
- competing interpretations;
- stability and reachability status.

## 9. Vanilla randomized scenes as evidence

Vanilla already generates environmental stories more effectively than a document-only system can. Relevant examples include:

- single- and multi-vehicle crashes;
- ambulance, police, fire, and other emergency scenes;
- roadblocks and traffic jams;
- burned or abandoned vehicles;
- corpses associated with vehicles or buildings;
- barricaded survivor houses;
- burned or disturbed buildings;
- campsites and outdoor scenes;
- work and construction scenes;
- profession outfits in meaningful locations;
- contextual vehicle cargo.

The mod should not replace these scenes or force every save to contain the same one. It should notice suitable scenes the current save has already created and, when safe, recruit them into an investigation.

### Two readings for one scene

| Observable scene | Farm Zero reading | Delivered Agent reading |
|---|---|---|
| Damaged vehicle with cooler, PPE, and animal-related cargo | A sample-collection vehicle crashed while removing material for testing | A transport or escort vehicle crashed while delivering or recovering introduced material |
| Roadblock | Responders tried to stop an emerging natural spread | Personnel contained, guarded, or redirected traffic around a known source |
| Burned vehicle | A chaotic evacuation or response ended in fire | Someone destroyed transport evidence or cargo |
| Ambulance with unusual protective gear | Medics responded to an early patient from the farm cluster | A team responded to a known exposure connected to a controlled operation |
| Barricaded house | Residents recognized contagion early and isolated themselves | Residents or handlers had advance warning that ordinary people lacked |
| Campsite with protective equipment and cases | Refugees or field responders improvised away from town | A monitoring, transport, or recovery team staged outside normal facilities |

The mod should present the observation, not label the canonical scene:

- Good: “Two damaged vehicles are angled across the road. A corpse in medical clothing lies near the rear doors. A cooler remains in the cargo area.”
- Bad: “You found the vanilla ambulance ambush story, proving samples were being stolen.”

## 10. Can the mod catch vanilla placing those scenes?

### Current answer

Partly. `DEV-0.47.0-dual-world-evidence` implements the first conservative observer slice for vehicles. It does not intercept vanilla placement or claim a hidden randomized-story name. Loaded grid squares queue bounded vehicle observations; a scene is accepted only after two identical snapshots. Confirmed vehicle clusters, emergency-service vehicles, and vehicles with contextual cargo can then host the optional fifth finding.

The observer presently records vehicle identity, position, cargo, and a broad scene classification. It does **not** yet record vehicle damage, corpses, outfits, fire, barricades, roadblocks, or building-scene facts. Observer memory itself is session-local; when a scene is assigned to a case, its stable signature is persisted with that target, but the full observer snapshot is not yet retained. This is a safe first slice, not the complete randomized-world evidence system described below.

Existing hooks provide partial ingredients:

- loaded-grid-square events can tell the runtime that an area is active;
- nearby-vehicle scanning can find vehicle parts and containers;
- corpse and zombie events can observe some bodies and outfits;
- container-fill events can see some inventory generation, although Build 42 may expose only an abstract container with no reliable parent or coordinates.

The new observer uses the loaded-grid-square hook and nearby-vehicle access for the limited classification above. Existing corpse, zombie, and container-fill hooks are not yet composed into a complete scene.

### Recommended approach: observe after generation

The first implementation should avoid monkey-patching vanilla random-story placement. Instead it should build a conservative `VanillaSceneObserver`:

1. Queue an area when its grid squares load.
2. Wait briefly so vanilla can finish spawning objects, vehicles, corpses, and cargo.
3. Scan a bounded neighborhood for observable facts.
4. Build a stable signature from vehicle identities and positions, damage, bodies, outfits, containers, contents, fire or barricade indicators, and relevant object relationships.
5. Require the same signature to be observed twice before accepting it.
6. Store only the observations and the anchor, not a guessed vanilla internal story name.
7. Classify the scene conservatively into broad evidence shapes such as transport incident, emergency response, road obstruction, burned transport, barricaded residence, or field camp.
8. Test reachability and persistence.
9. Offer the scene to the case generator as optional evidence.
10. Promote it to an essential case step only after the scene is confirmed stable and suitable.

### Why delayed, repeated observation matters

If the scan runs too early, it may see the vehicles before their cargo or bodies exist. If it treats the first partial result as truth, the recorded scene can change underneath the case.

Two matching observations are a simple protection against adopting half-generated scenes.

### Questions requiring a native-game probe

Before implementation is considered reliable, a diagnostic build should record:

- the order of loaded-square events relative to randomized-story completion;
- when vehicle cargo becomes available;
- when associated corpses become available;
- whether stable vehicle or object identifiers survive unload and reload;
- which damage, blood, fire, outfit, barricade, and spatial facts are exposed in Build 42;
- how often a scene changes after its first observation;
- the cost of bounded scanning during normal travel;
- whether multiplayer ownership changes any of these assumptions.

Until those questions are answered, vanilla scenes should remain optional enrichment rather than mandatory evidence.

## 11. Save determinism and safety

The conspiracy pair, fixed campaign facts, accepted scene signatures, and case assignments must be serialized. Reloading a save must not reinterpret the same scene differently or move already assigned evidence.

The observer must also account for:

- a scene destroyed by fire or player action before adoption;
- a vehicle moved after observation;
- corpses reanimated, moved, burned, or removed;
- containers looted before they are assigned;
- map chunks not yet visited;
- multiplayer players loading nearby areas in different orders;
- mod updates introducing new classifiers into an existing save.

The system should prefer preserving the earlier accepted interpretation of observable facts over silently rewriting campaign history after an update.

## 12. What exists in `DEV-0.47.0-dual-world-evidence`

### Existing building blocks

- Ten residential Fitness Instructor opening variants are generated and selectable.
- Every variant uses an immediate real `Key1` for the current building and the opening thought, “This opens the house. Why did I have access?”
- Every variant authors the same five-finding chain: house key, July 8 appointment, misplaced damaged feed sack, heterogeneous used-PPE accumulation, and an optional confirmed vehicle/cooler scene.
- The PPE finding materializes as three masks, four gloves, and two disinfectant items while remaining one finding.
- The fixed Farm Zero versus Delivered Agent pair, its shared facts, and its unresolved central question are stored and strictly validated on every generated case. No winner or truth score exists.
- The first four household findings are essential. The vehicle finding waits for a confirmed vanilla scene and cannot make the case fail merely because this save has no suitable nearby scene.
- A bounded two-observation vehicle classifier recognizes clusters, emergency transport, and contextual cargo without naming vanilla's hidden story definition.
- Once a confirmed scene is assigned, its stable signature persists with the target; retaining the complete observed snapshot remains future work.
- Generator schema `3` and revision `g16-dual-world-evidence-1` intentionally reject old generated saves; no migration is required.

### Missing or insufficient systems

- The paired conspiracy is stored on each case rather than exposed through a dedicated world-level campaign screen.
- Evidence carries two readings, but long-term balancing across A-leaning, B-leaning, dual-use, and both-damaging findings is not implemented.
- The observer does not yet combine damage, bodies, outfits, fire, barricades, roadblocks, or buildings into rich environmental scenes.
- The vehicle scene is optional and currently uses a cooler as the authored anchor; it is not yet the full key/body/damage/cargo relationship envisioned for later scenes.
- Observer candidates are not maintained as a separate persisted world catalogue before assignment.
- Only the Fitness Instructor has received this deep treatment. The other occupations and later campaign cases remain to be authored.
- The ten openings vary their residential appointment premise, but intentionally share one evidence grammar; native play must establish whether that is sufficiently varied and fun.
- There is no native-game acceptance yet for exact spawn timing, real key behaviour, observed-scene stability, UI readability, or performance.

The implementation therefore establishes the complete first authored chain in code and protects it with offline tests. It does **not** yet establish native gameplay quality or the full world-evidence vision.

## 13. Implementation sequence and status

### Phase 1 — Make one opening excellent — implemented, native acceptance pending

- Replace one Fitness Instructor variant with the residential key-and-appointment opening.
- Align its date and language with the actual outbreak start.
- Use a real key tied to the current building.
- Add the direct opening thought or hint.
- Keep the rest of the evidence optional while testing the opening experience.

### Phase 2 — Add grouped physical findings — implemented for feed and PPE

- Represent the misplaced feed sack as an object-context finding.
- Represent the PPE accumulation as one environmental finding.
- Support condition, quantity, room type, and out-of-place reasoning.

### Phase 3 — Add the paired campaign motif — implemented at case/domain level

- Persist Farm Zero versus Delivered Agent at world level.
- Record shared facts and the permanently missing direction-of-transfer fact.
- Tag authored evidence by interpretive function without scoring truth.

### Phase 4 — Build and instrument the scene observer — first vehicle-only slice implemented

- Run native timing probes.
- Implement delayed bounded scans.
- Stabilize signatures across unload and reload.
- Classify only high-confidence observable scene shapes.

### Phase 5 — Adopt a vehicle scene — bounded cooler scene implemented

- Locate a suitable real vehicle scene.
- Tie a real key to it when possible.
- Read damage, bodies, outfit, and cargo as one scene.
- Keep two live interpretations.

### Phase 6 — Author the other nine Fitness Instructor openings — implemented with a shared evidence grammar

- Make each premise spatially valid.
- Give each a distinct personal contradiction and physical evidence grammar.
- Reuse the central pair without making every opening tell the identical local story.

## 14. Acceptance criteria

The direction is working when all of the following are true:

- The first meaningful prompt appears at or immediately after spawn.
- The player understands the personal question without reading design documentation.
- The opening fits the actual building and the Fitness Instructor profession.
- The profession explains presence, not immunity.
- At least four of the first five important findings are physical objects, conditions, relationships, or scenes rather than exposition papers.
- At least one relationship is genuinely testable in the game world.
- At least one clue uses condition, quantity, or spatial mismatch.
- The first local case contributes to both central theories.
- A reasonable player can argue either Farm Zero or Delivered Agent after reviewing the same evidence.
- The mod never tells the player which central theory is correct.
- Local discoveries still feel like progress despite the unresolved origin.
- A vanilla randomized scene can enrich a save when present without breaking a save when absent.
- Reloading preserves accepted evidence, scene identity, and campaign facts.
- Evidence does not provide an unreasonable gameplay advantage.

## 15. Owner decisions recorded

The owner approved the following direction in discussion. Items whose exact breadth was not separately decided remain implementation questions rather than permission blockers:

1. **Exactly two central theories:** Should every campaign always be organized around exactly two principal competing explanations?
2. **First pair:** Is Farm Zero versus Delivered Agent the right first campaign pair?
3. **Permanent central uncertainty:** Should the central origin remain unanswered forever, even if many local cases are solved?
4. **Shared truth:** May parts of both central theories be true, provided the decisive direction of transfer stays unknowable?
5. **First Fitness Instructor case:** Is the key, appointment, feed sack, PPE room, and vehicle scene the right first five-clue structure?
6. **Survivor voice:** May the opening use restrained first-person thoughts such as “Why did I have access?”, or should all prompts remain impersonal observations?
7. **Farm connection:** Should the first client explicitly be a farm worker, a worker's family member, or should the farm connection be discovered later?
8. **Animal evidence tone:** Are feed, animal remains, tissue/specimen objects, and sick-animal implications acceptable, and how graphic should they become?
9. **Random-scene promotion:** Is it acceptable for a vanilla scene to become essential only after the runtime has observed and confirmed it in the current save?
10. **World persistence:** Should the same conspiracy pair and historical facts survive character death within the same world while personal discoveries remain separate?
11. **Variation strategy:** Should version one deeply author this single pair across occupations before adding other central pairs?
12. **Ten Fitness openings:** All ten are rewritten now around the approved five-finding structure; later expansion should add more varied evidence grammars after native play establishes the reference case.

## 16. Relationship to earlier design documents

This review draft supplements and, where they conflict, proposes to supersede the relevant narrative portions of:

- `OCCUPATION_MYSTERIES_LINUX_PLAN_2026-09-19.md`
- `CENTRAL_MYSTERY_REVIEW_2026-09-19.md`
- `EXISTING_EVIDENCE_AUDIT_2026-09-19.md`
- `OPENING_PREMISE.md`
- `OPENING_PAIR_COMPLETION.md`
- `CLUE_PLACEMENT_VARIETY.md`
- `MYSTERY_OBJECTS.md`
- `VEHICLES_AS_PLACES.md`
- `CAMPAIGN_VISION.md`

The owner has approved this vision. Contradictions in earlier source documents should now be resolved incrementally as their systems are touched, rather than maintaining competing current specifications indefinitely.

## Review summary

The proposed game is not about finding enough papers to reveal what happened. It is about waking inside an ordinary obligation that has become suspicious, following physical contradictions through a world already telling stories, and discovering that the same trail supports two incompatible explanations.

For the Fitness Instructor, the occupation answers **why this person could plausibly be at this house**. The key, appointment, feed sack, protective-equipment accumulation, and vehicle scene turn that ordinary reason into a mystery. The farm connects the personal story to the larger Knox Event. The direction of transfer remains missing.

The player should finish a case knowing more facts, understanding more relationships, and feeling less certain about the one question that matters most.
