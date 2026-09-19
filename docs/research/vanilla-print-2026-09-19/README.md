# Vanilla maps, flyers and brochures: offline inspection

## Current narrative interpretation — later review, 19 September 2026

Searching for an explanation of isolation in Knox is the central premise; no definitive cause is supplied. Local mysteries provide earned conclusions and substantive evidence relevant to that search. Our own clues establish the personal opening. Naturally discovered annotated maps each motivate travel and provide a destination payoff; universal flyer/brochure coverage remains open. See the [complete reassessment](../../design/CENTRAL_MYSTERY_REVIEW_2026-09-19.md). Earlier optional-map or occupation-flyer opening proposals are superseded; underlying source research remains valid.


19 September 2026. Local Windows game folder: `C:/Program Files (x86)/Steam/steamapps/common/ProjectZomboid`. Local `Zomboid/version.txt` reports **42.20.4, revision b0bbce05d5**; Steam manifest build ID **24909800**. These identify this inspection, not a promise about another installation.

## Result

Yes: the material is accessible offline. The installed game provides the written content, original artwork, map marks, and destination definitions needed to build a useful catalogue.

| Material | Inspected coverage |
|---|---:|
| Annotated-map definitions | 125 |
| Individual annotations / symbols | 594 |
| Registered flyer designs | 111 |
| Registered brochure designs | 22 |
| Ordinary map item definitions | 15: 14 regional sheets plus generic Map |
| Additional title-only print translations | 8, excluded from usable designs |

All 258 annotated/printed designs have an individual category, source reference and coordinate evidence. All 133 flyers/brochures have a plain-text reading version and at least one vanilla destination rectangle. Eleven annotated maps contain symbols only; they are not missing-text extraction failures. Nine annotated maps have placeholder-like building anchors near zero; their marks still provide geographic information. A hostile graffiti map has no meaningful destination to pursue.

### Open the results

- [Searchable catalogue](catalogue.html): filter all 258 designs by type/category or search their full text, places, IDs and proposed uses. Each entry includes original local artwork links and coordinate details.
- [Categorised index](INDEX.md): every design in a compact table.
- [Full reading transcripts](transcripts.md): all extracted map text and print-media reading versions.
- [Ordinary maps](ORDINARY_MAPS.md): coverage bounds for the regional sheets and generic item.
- [Structured catalogue](catalogue.json): individual marks, rectangles, vanilla setup fields and source hashes.
- Artwork contact sheets: [1](contact-1.jpg), [2](contact-2.jpg), [3](contact-3.jpg), [4](contact-4.jpg), [5](contact-5.jpg).

The HTML is a local research document. Browser automation refused its `file:` URL under its URL security policy, so its browser rendering was not verified. The Markdown and JSON versions provide the same research independently of browser access.

## What was inspected, and what the coordinates mean

1. **Annotated maps:** all ten `media/lua/shared/StashDescriptions/*StashDesc.lua` files, joined to English `Translate/EN/Stash.json`. Every referenced text key resolves. Each mark's text/symbol and world-square position are retained. `StashUtil.lua` confirms that annotation coordinates and stash container/building data are separate fields.
2. **Flyers and brochures:** IDs present in the `Flier.class` and `Brochure.class` constant pools were matched to `Print_Media.json` titles. This is registration-source evidence, not an in-game spawn test. English `Print_Text.json` supplies the readable version; `Print_Media.json` points to the artwork. All 133 referenced image files were opened into contact sheets, with focused full-size checks for key candidates and discrepancies.
3. **Destinations:** `PrintMediaDefinitions.MiscDetails` supplies the rectangles. `PZAPI/ui/organisms/PrintMedia.lua`, lines 287 onward, consumes them in the reveal-on-map controls. They reveal a place on the map; they do not identify a particular shelf or prove a reachable clue container.
4. **Ordinary map sheets:** `scripts/generated/items/map.txt` and `ISMapDefinitions.lua` specify map IDs and view bounds. These are navigation surfaces, with badges/legends rather than separate narrative messages. Annotated variants have their own bounds; the base item name is not a reliable destination label.
5. **Where the paper is found:** generic Brochure and Flier entries occur in desk, closet and bin distributions. These are weighted loot sources, not fixed coordinates for each design. An exact copy's location depends on the save. We did not inspect or alter the owner's live save to locate copies.

### Source issues that matter

- **The owner's gallery screenshot is `LouisvilleStashMap15`.** Its Target mark is **12546,1393**, inside the gallery brochure rectangle **12510,1360–12579,1429**. Its stash building anchor **12619,1406** differs. Blindly using `buildingX/buildingY` would misidentify the intended gallery.
- **`WorldStashMap11` is already a relay-maintenance lead.** Its anchor is **10267,8743**. Its text reports a dish/tower fault near 6 GHz, a possible power issue and testing with Lexington. It does not name our fictional Relay Site 31 or the Brandenburg station previously suggested by the owner.
- **Nine near-zero anchors:** Ekron 6–8, Irvington 9–10, Muldraugh 19, World 6/21/23. Preserve marks and view bounds; never route the player to these anchor values.
- **Artwork and reader text are distinct.** For `HouseforSale895`, the artwork says **$35,000**, while the reading text says **$52,000**. Both identify 1114 Main Street, West Point. The catalogue preserves the reader text and links the original; it is not a claim of pixel-perfect transcription of every artwork label. Floor plans, diagrams and some small image labels are graphical information, not plain-text fields.
- **Names can mislead:** Lectromax's advert concerns machining saw blades, not electronics. `PizzaWhirledJobAdRosewood` contains a restaurant promotion, not a recruitment notice. `FarmingAndRuralSupplyDoeValley` names Fallas Lake in the printed directions.
- **Eight title-only entries:** PonyRoamO, ChapelmountDownsRacetrack, PizzaWhirled, July4PartyEasternLouisville, LouisvilleAnimalShelter, CivilWarfort, BrandenburgAirfield, HouseforSale935. No matching body/layout or inspected flyer/brochure registration was found. They remain excluded candidates, not eight playable designs.
- Some annotated maps configure loot caches, barricades, zombies or traps. Those existing effects must be considered before adding our own clues. Written references to patrols, people or scheduled events do not establish that those actors/mechanics exist in the running game.

## Categories and what they offer

Each design's category is in the index; the groupings below suggest uses, not approved new story facts.

| Group | Examples | Potential role |
|---|---|---|
| Technical work and infrastructure | Circuital Healing, Lectromax, AMZ, relay-fault map, railyard map | Starting-skill relevance, repair records, equipment provenance |
| Personal stories and employment | Named survivor messages, job ads, missing-person testimony | Missing-past leads, dated movements, people connected across discoveries |
| Property, shelter and resources | Homeward listings, U-Store It, private shelter, survivor maps | A specific address to investigate; later outbound/return journeys |
| Civic records and care | Police meetings, town hall, library, funeral home, LSU | Permits, incident reports, custody of records, bureaucratic comedy |
| Heritage and existing mysteries | Natalie's map, gallery, Quill Manor, Coalfield, sanatorium | Extend an existing question without rewriting its original story |
| Travel and everyday life | Fuel stations, hotels, restaurants, airport, events | Plausible meeting points, receipts and timelines; useful destinations even without a conspiracy |
| Threats and ambient testimony | Hostile graffiti, fire/skull maps, warnings | Context or risk signals; some should remain atmosphere rather than actionable investigations |

## Recommended way forward

**Use selected vanilla documents as reliable place references and player motivations. Add a small related discovery at the destination.** Keep the original writing intact; a vanilla advert can simply help the player find a place mentioned in our clue. Not every flyer should automatically launch a mystery.

### First: a bounded electrician trail

The existing **Circuital Healing** flyer identifies radio/electronics repair at **8B Hutchin's Drive, Ekron**, rectangle **424,9776–471,9807**. This fits the owner's starting-skill priority.

Proposed story: a personal opening clue gives the survivor a reason to seek an old repair job. The ordinary flyer identifies the shop. At the shop, one plausible service record connects a named customer or equipment identifier to another clue. The existing **WorldStashMap11** relay-fault note can later provide the technical destination and reason for travel.

The repair job, customer connection and personal-history link are **new writing requiring premise/boundary agreement under Q27**. The vanilla flyer and map do not already establish a connection. Ekron-to-Muldraugh is a substantial journey: keep the opening local and use the distant continuation later, matching Q05. Do not bind Site 31 to this station without choosing that explicitly.

### Second: the gallery connection

Natalie's annotated map already asks for action; the gallery brochure identifies the destination and collection context. A restrained continuation could reveal an inventory, transfer request or named custodian at the gallery, with LSU as a possible later connection. The original already supplies a person, role and motivation. Exact objects, resolution and any rescue/reward mechanic remain to be designed.

### Later: skills/tools and the bunker

The **ColdWarBunker** brochure identifies northern March Ridge, rectangle **9872,12592–9967,12703**, and includes a labelled floor plan. Power systems, offices and storage are promising investigation contexts. A tool/skill interaction could reveal additional evidence later, as requested in Q14. The brochure's rooms and historical claims are design references; floor-level access and actual interactive objects need engine verification.

### Small implementation boundary to propose next

1. Support one selected vanilla media ID as a recognisable lead while preserving its normal reading/map behavior.
2. Resolve its known destination to a verified, reachable place and choose one appropriate evidence carrier.
3. Connect the discovered evidence to the investigation so reading the lead has a consequence beyond a passive note.

Use the catalogue to author those bindings. Do not infer them from every arbitrary word at runtime. Keep known destinations fixed. Relocate a missed small clue only where its appearance remains plausible; the ten-mask discovery is a clear counterexample. Preserve original stash contents and avoid double-preparing a vanilla stash. Future technical checks should cover recognition, destination selection, duplicate prevention, save/reload and coexistence with vanilla behavior. Q30 requires passing technical checks; no extra owner-playtest gate is introduced.

## Done / still open

**Done:** local access, all identified text/design records inspected and categorised, source coordinate catalogue, artwork overview, ordinary-map inventory and the proposals above. No game files, running session or Workshop build changed.

**Open before implementation:** select the first premise; verify the media-identification hook in the engine; distinguish read/seen/recorded state; validate reachable destination carriers and vanilla stash timing. These are concrete integration questions, not reasons to repeat the whole content inventory. Printed claims and source rectangles are not a substitute for live-world verification.

**Today's other work remains queued:** detailed player settings; discovery-placement redesign; research on vanilla corpses, wrecks, burned-out houses and survivor houses last. This inspection replaces the earlier assumption-led maps/flyers brainstorming step.

## Reproduce

From the repository root:

```powershell
python tools/research/catalogue_vanilla_print.py --game 'C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid' --out docs/research/vanilla-print-2026-09-19
python tools/research/review_vanilla_print.py
```

The extractor reads game files only and records SHA-256 hashes. The reviewer applies this dated editorial classification. Rerun both in that order; the extractor replaces the JSON with a fresh source inventory. Review changed source material before reusing these classifications on a future build. The five contact sheets are inspection artefacts; full-resolution artwork stays in the installed game.
