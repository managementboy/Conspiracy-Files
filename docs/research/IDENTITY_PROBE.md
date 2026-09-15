# Existing identity feasibility probe — Build 42.20.4

Priority requested by owner before continuing feature development. This is a read-only experiment, not an identity registry or an NPC implementation. First native sample confirms existing names; persistence remains pending.

## Verified access

Installed projectzomboid.jar class bytecode was inspected by PM. IsoGameCharacter.getDescriptor (2ab40922b0), IsoDeadBody.getDescriptor (2ab40170b0), IsoGameCharacter.getInventory, SurvivorDesc.getForename/getSurname/getCharacterProfession/getID, IsoObject.getContainer, ItemContainer.getItems and InventoryItem.getDisplayName directly return existing fields. IsoZombie does not override getDescriptor. The probe uses getDisplayName, not formatted getName. No descriptor creation, factory calls, loot generation, item naming, inventory mutation or ModData reads/writes are performed.

Loaded zombie-list API: https://projectzomboid.com/modding/zombie/iso/IsoCell.html#getZombieList()
Corpse enumeration follows installed media/lua/client/DebugUIs/ISSpawnHordeUI.lua: getGridSquare/getStaticMovingObjects, filtered with instanceof IsoDeadBody. Character profession access is also used by installed ISCharacterScreen.lua; SpawnItems.lua demonstrates descriptor-based ID cards/badges for the player, not proof of a populated zombie descriptor database.

## Probe behavior

Source: mod/common/media/lua/client/ConspiracyFiles/IdentityProbe.lua. It registers no scan until run() is called explicitly. Debug single-player only. Reports player as a control, then at most32 distinct nearby zombies/corpses within30 tiles on the player's starting floor. Scans up to4096 loaded zombie-list entries,64 static objects per loaded square and200 existing top-level inventory items. No nested wallet/bag traversal in this first probe. Processes at most16 scan steps per tick and checks1ms elapsed budget; timeout60 seconds or2000ticks. Existing getters can individually exceed a time budget; native cost is not yet measured. Zero results do not prove identities never exist elsewhere.

Names, actual descriptor profession, descriptor ID, online ID, outfit ID and coordinates are reported separately. Outfit is not inferred to be occupation. IDs are comparison candidates, not claimed unique or save-stable. Named ID cards/passports/wallets/badges/keyrings/diaries/dog tags/notebooks/credit cards are logged with item ID and source entity location. Location means current encounter position, not residence or workplace. Missing fields and getter errors are explicit. Results are kept only in console and transient P.last; no in-game knowledge is revealed or added.

## Verification

Lua5.1 syntax passed. test/identity_probe.lua passes with next=nil, explicit-only behavior, doctor descriptor and named ID fixture, missing/throwing getters, distance and corpse filtering, duplicate invocation refusal,16-step/32-entity/200-item bounds, cancellation and timeout. Mutation/factory methods trap if used. These mocks do not prove native identity availability or persistence.

## Manual test

Restart PZ once for the new Lua file, load the current save (no new save required), stand safely near existing zombies or bodies, then run:

    require("ConspiracyFiles/IdentityProbe").run()

Unpause for roughly10 seconds, then PM reads [CF-ID] lines. No need to spawn or kill anything just for this test. If names exist, compare a second run and a save/reload of the same area before designing reuse. Confirm descriptor names match ID items and occupations are populated; do not substitute random names when missing. If nothing nearby has descriptors, investigate actual loot identity provenance separately before concluding global population exists or does not exist.

## Native sample — 2026-09-06

Owner ran the probe in a zombie-enabled save near (10770,10271,0). Console frames350–848: scan-complete,13 entities (12 zombies and1 corpse),8 existing top-level inventory items read,0 getter errors. All13 had names and descriptors; all reported profession=unemployed. Examples: Harriette Michaels (descriptor23), Sang Dugan (25), Leslie McMahon (26); corpse Shauna Strickland (descriptor0) at10792,10287,0. Separate player control: Stan Juliani, profession=burglar, descriptor0. No matching named identity items were logged among the8 items read.

This confirms readable names on loaded nearby entities, not a town-wide population registry or dependable occupations. Unemployed may be a default and must not become a claimed former occupation. Player/corpse descriptor0 collision and zombie onlineId=-1 show these fields cannot alone serve as unique identity keys. Next: compare the same area after save/reload, especially the stationary corpse, before selecting a reuse/persistence design. Current coordinates do not establish home addresses.

### Follow-up sample

Owner reports running the command following the requested save/quit/reload test. Console frames1115–1602: player Stan Juliani remains burglar, now at10777.574,10265.332,0. One corpse at10792,10287,0 retains Shauna Strickland and profession=unemployed. Scan completed with1 entity,8 items read,0 getter errors. No live zombies were returned within this scan's scope, so their name persistence cannot be compared. The corpse match supports persistence for this sampled body only; explicit reload confirmation was not separately supplied. No evidence yet of meaningful zombie occupations or a global resident database. A future adapter should copy sampled names into case-owned data when generating a case, rather than relying on descriptor IDs or continued entity availability; this remains a recommendation, not implemented behavior.
