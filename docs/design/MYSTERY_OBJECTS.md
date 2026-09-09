# Fifty objects that could carry a mystery

> **This list is an illustration, not the pool.** Owner, 2026-09-09: *"50 just
> as 200 was an example not a requirement. selection rules over the derived
> catalogue."* The mod does not draw from these fifty. It draws from
> `Generated/ObjectCatalogue.lua` - 844 items derived from the game's own
> scripts - through the rules in `Generated/ObjectRules.lua`. Those rules reach
> 216 objects that can be found damaged, all 16 the engine names, 6 keys and 65
> household or trade objects that could be somewhere they do not belong. What
> follows is a worked example of what those rules should produce, and a record
> of which objects are traps.

Owner, 2026-09-09:

> Why can't we place objects? Like a bloody knife. A broken gun?

We can. The mod already places notes, receipts, keys and cards into real
containers; a knife is no harder than a receipt. What we had never done is ask
what an object could *mean* when nobody has written anything on it.

Every item named below was parsed out of the installed game's own scripts by
`tools/extract_mystery_objects.py`, which found **838 candidates** with at least
one usable property. The fifty here are a curation of that, not a replacement
for it - rerun the tool for the rest.

## What makes an object evidence

A document means something because of its words. An object has to mean
something a different way, and there are only four honest ways available:

| Property | What it gives us | Proven? |
|---|---|---|
| `name` | the engine stamps an owner's name on it - 16 items carry `Tags = base:applyownername` | yes (T7, and `docs/research/OWNER_NAMED_ITEMS.md`) |
| `condition` | it has a condition track, so it can be found nearly broken, and that is a fact about its history | condition is a core saved field |
| `blood` | `HandWeapon.setBloodLevel(float)` exists on the installed jar, so a weapon can be found bloodied | **not verified to persist - test before relying on it** |
| `keyed` | a key can be tested against a real door, which the mod has already proven in play | yes (`observedKeyDoor`) |

And one that costs nothing and needs no API at all: **where the thing is**. A
security pass in a kitchen drawer is evidence. The same pass in a security
office is furniture.

## The fifty

Item names are exact, verified against `media/scripts/generated/items/*.txt`.
The suggested reading is a person's judgement and is the part that must stay
cautious: none of these may ever be presented as proof of what happened.

### Traces of something that happened

| Item | Uses | A possible reading |
|---|---|---|
| `KitchenKnife` | blood, condition | a bloodied kitchen knife in a house with no other damage |
| `HuntingKnife` | blood, condition | the wrong knife for a kitchen, in a kitchen |
| `Machete` | blood, condition | far from anywhere that sells one |
| `Crowbar` | blood, condition | the tool that opens doors, found inside a locked one |
| `Hammer` | blood, condition | ordinary everywhere; not ordinary bloodied and hidden |
| `Sledgehammer` | blood, condition | too much tool for the job it was near |
| `Axe` | blood, condition | worn to nearly nothing, or barely used |
| `BaseballBat_Broken` | condition | the game ships the broken version as its own item |
| `Katana_Broken` | condition | something that was somebody's pride, snapped |
| `Sword_Broken` | condition | as above, in a place that explains neither |
| `StraightRazor` | blood, condition | a personal object with an ugly second use |
| `Shovel` | condition | worn out in a month, in a town with no gardens |

### Objects that name a person, with no prose at all

| Item | Uses | A possible reading |
|---|---|---|
| `Necklace_DogTag` | name | a serviceman's name, in a house that is not his |
| `Badge` | name | authority the wearer may or may not have had |
| `KeyRing_SecurityPass` | name | someone here had access to somewhere else |
| `Passport` | name | nobody leaves without this, and somebody did |
| `PressID` | name | a reason to have been where they should not be |
| `IDcard` | name | already watched by the identity observer |
| `CreditCard` | name | a name and an issuer |
| `BusinessCard_Personal` | name | an association, not an employment |
| `Diary1` | name | the engine names the diary after its owner |
| `ParkingTicket` | name | a name, a place and a date |
| `SpeedingTicket` | name | the same, moving |

### Access - the objects the player can test

| Item | Uses | A possible reading |
|---|---|---|
| `Key1` | keyed | proven in play: it opens a real door or it does not |
| `CarKey` | keyed | a vehicle somewhere, belonging to someone |
| `Key_Blank` | - | a key that was going to be cut, and was not |
| `Padlock` | condition | found open, found cut, or found on the wrong door |
| `KeyPadlock` | keyed | a padlock with a key that exists somewhere |
| `CombinationPadlock` | condition | a lock nobody can open without being told |

### Firearms

| Item | Uses | A possible reading |
|---|---|---|
| `Pistol` | blood, condition | condition near zero says it was fired hard or kept badly |
| `Revolver` | blood, condition | as above, and it does not eject its cases |
| `Shotgun` | blood, condition | a house weapon found a long way from a house |
| `Bullets9mmBox` | - | ammunition for a weapon that is not here |

### Things that carry other things

| Item | Uses | A possible reading |
|---|---|---|
| `Briefcase` | condition | empty, in a place with nothing to carry |
| `Suitcase` | condition | packed and never taken |
| `Bag_DuffelBag` | condition | more capacity than a life needs |
| `Toolbox` | condition | a trade's tools, without the trade |
| `PetrolCan` | condition | fuel where there is nothing to fuel |

### Recording and communication

| Item | Uses | A possible reading |
|---|---|---|
| `Camera` | condition | someone was documenting something |
| `CameraDisposable` | condition | bought to be thrown away afterwards |
| `Photo` | - | **we cannot show a custom image; never describe one** |
| `PhotoAlbum` | - | the same caution, at length |
| `VHS_Home` | - | a recording we cannot play; the label is all we may claim |
| `WalkieTalkie1` | condition | two of these means two people |
| `HamRadio1` | condition | reach far beyond a neighbourhood |
| `RadioBlack` | condition | ordinary, unless it is somewhere odd |
| `CDplayer` | condition | a personal object that dates a room |

### Personal, medical, ordinary

| Item | Uses | A possible reading |
|---|---|---|
| `Pills` | - | a prescription without a person |
| `PillsAntiDep` | - | a private fact, and none of the mod's business to interpret |
| `Bandage` | - | used, in a place with no other sign of injury |
| `Whiskey` | - | two glasses, or one |
| `Glasses` | condition | nobody walks away from these on purpose |
| `Lighter` | - | left where a non-smoker lives |
| `Matches` | - | from somewhere that can be named |
| `HandTorch` | condition | someone was here in the dark |

## The rules these must obey

1. **An object is a lead, never proof.** A bloodied knife in a drawer means
   somebody put a bloodied knife in a drawer. The mod may say that and no more.
2. **Never describe what the player cannot see.** No custom photograph, no
   playable tape, no engraving we did not put there.
3. **Placement carries the meaning.** The same object is furniture in one room
   and evidence in another, so room affinity does the work here that prose does
   for documents.
4. **Never rewrite what a player's world already contains.** These are placed,
   like every other piece of evidence - vanilla loot is left alone.
5. **`blood` is unverified.** `setBloodLevel` exists on the installed jar. That
   it survives a save is an assumption until somebody proves it. Until then, a
   bloodied object must be the kind of thing that still reads as evidence
   without the blood.
