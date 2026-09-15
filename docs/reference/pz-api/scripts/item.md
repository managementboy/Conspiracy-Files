---
title: "item"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/scripts/item.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/scripts/item.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="item"></a>

<a id="scripts-item"></a>

# item

**Soft Override:** True

The item block is used to create items in the game, from weapons to food and clothing. The parameters available in this block mostly depend on the type of item you are creating, set with [ItemType](item.md#scripts-item-itemtype).

To get started, create a simple item structure by setting that parameter up correctly, then add more parameters as you need. For example, for a normal item:



```cpp
module yourModule
{
  item yourID
  {
    ItemType = base:normal,
    ...
  }
}
```



To add a name to display for your item, you need to add the item full type, that is its `module.id`, inside the [ItemName](../translations/translation_files.md#itemname) translation file. Taking the example from above, your translation file would be:



```json
{
  "yourModule.yourID": "Your Item Name"
}
```



<a id="hierarchy"></a>

## Hierarchy

This block can be a child of the following blocks:

- [module](module.md#scripts-module)

This block can have the following child blocks:

- [component](component.md#scripts-component)
- [component ContextMenuConfig](component/component-contextmenuconfig.md#scripts-component-contextmenuconfig)
- [component Durability](component/component-durability.md#scripts-component-durability)
- [component FluidContainer](component/component-fluidcontainer.md#scripts-component-fluidcontainer)

<a id="id"></a>

## ID

This block can have an ID.

**Optional:** False

**Can have spaces:** False

<a id="itemtype-parameters"></a>

## ItemType parameters

Specific parameters are only available for certain [ItemType](item.md#scripts-item-itemtype). The following lists for each ItemType will show what parameter is only saved for that specific ItemType script class (sub classes to Item), which means using them for other classes doesn’t make any sense as they will simply not be loaded in by the game.

<a id="base-container"></a>

### base:container

- [CanBeEquipped](item.md#scripts-item-canbeequipped)
- [Capacity](item.md#scripts-item-capacity)
- [WeightReduction](item.md#scripts-item-weightreduction)

<a id="base-drainable"></a>

### base:drainable

- [cantBeConsolided](item.md#scripts-item-cantbeconsolided)
- [ConsolidateOption](item.md#scripts-item-consolidateoption)
- [OnCooked](item.md#scripts-item-oncooked)
- [ReplaceOnCooked](item.md#scripts-item-replaceoncooked)
- [Spice](item.md#scripts-item-spice)

<a id="base-food"></a>

### base:food

- [BadCold](item.md#scripts-item-badcold)
- [BadInMicrowave](item.md#scripts-item-badinmicrowave)
- [Calories](item.md#scripts-item-calories)
- [CannedFood](item.md#scripts-item-cannedfood)
- [Carbohydrates](item.md#scripts-item-carbohydrates)
- [DangerousUncooked](item.md#scripts-item-dangerousuncooked)
- [DaysFresh](item.md#scripts-item-daysfresh)
- [DaysTotallyRotten](item.md#scripts-item-daystotallyrotten)
- [fluReduction](item.md#scripts-item-flureduction)
- [Lipids](item.md#scripts-item-lipids)
- [OnCooked](item.md#scripts-item-oncooked)
- [Packaged](item.md#scripts-item-packaged)
- [painReduction](item.md#scripts-item-painreduction)
- [Poison](item.md#scripts-item-poison)
- [Proteins](item.md#scripts-item-proteins)
- [RemoveNegativeEffectOnCooked](item.md#scripts-item-removenegativeeffectoncooked)
- [ReplaceOnCooked](item.md#scripts-item-replaceoncooked)
- [ReplaceOnRotten](item.md#scripts-item-replaceonrotten)
- [Spice](item.md#scripts-item-spice)
- [UseForPoison](item.md#scripts-item-useforpoison)

<a id="base-literature"></a>

### base:literature

- [LearnedRecipes](item.md#scripts-item-learnedrecipes)
- [LvlSkillTrained](item.md#scripts-item-lvlskilltrained)

<a id="base-radio"></a>

### base:radio

- [CanBeEquipped](item.md#scripts-item-canbeequipped)

<a id="base-weapon"></a>

### base:weapon

- [AimingPerkMinAngleModifier](item.md#scripts-item-aimingperkminanglemodifier)
- [AimingPerkRangeModifier](item.md#scripts-item-aimingperkrangemodifier)
- [Aimingtime](item.md#scripts-item-aimingtime)
- [AmmoBox](item.md#scripts-item-ammobox)
- [ClickSound](item.md#scripts-item-clicksound)
- [ClipSize](item.md#scripts-item-clipsize)
- [CriticalChance](item.md#scripts-item-criticalchance)
- [CyclicRateMultiplier](item.md#scripts-item-cyclicratemultiplier)
- [EnduranceMod](item.md#scripts-item-endurancemod)
- [ExplosionDuration](item.md#scripts-item-explosionduration)
- [ExplosionPower](item.md#scripts-item-explosionpower)
- [ExplosionRange](item.md#scripts-item-explosionrange)
- [extraDamage](item.md#scripts-item-extradamage)
- [FireMode](item.md#scripts-item-firemode)
- [FireModePossibilities](item.md#scripts-item-firemodepossibilities)
- [FireRange](item.md#scripts-item-firerange)
- [FireStartingChance](item.md#scripts-item-firestartingchance)
- [FireStartingEnergy](item.md#scripts-item-firestartingenergy)
- [HitChance](item.md#scripts-item-hitchance)
- [HitFloorSound](item.md#scripts-item-hitfloorsound)
- [HitSound](item.md#scripts-item-hitsound)
- [ImpactSound](item.md#scripts-item-impactsound)
- [IsAimedFirearm](item.md#scripts-item-isaimedfirearm)
- [IsAimedHandWeapon](item.md#scripts-item-isaimedhandweapon)
- [JamGunChance](item.md#scripts-item-jamgunchance)
- [MagazineType](item.md#scripts-item-magazinetype)
- [MaxHitcount](item.md#scripts-item-maxhitcount)
- [MaxSightRange](item.md#scripts-item-maxsightrange)
- [MinAngle](item.md#scripts-item-minangle)
- [MinSightRange](item.md#scripts-item-minsightrange)
- [PhysicsObject](item.md#scripts-item-physicsobject)
- [PiercingBullets](item.md#scripts-item-piercingbullets)
- [Projectilecount](item.md#scripts-item-projectilecount)
- [ProjectileSpread](item.md#scripts-item-projectilespread)
- [PushBackMod](item.md#scripts-item-pushbackmod)
- [Ranged](item.md#scripts-item-ranged)
- [RangeFalloff](item.md#scripts-item-rangefalloff)
- [RecoilDelay](item.md#scripts-item-recoildelay)
- [ShellFallSound](item.md#scripts-item-shellfallsound)
- [StopPower](item.md#scripts-item-stoppower)
- [SwingSound](item.md#scripts-item-swingsound)
- [TwoHandWeapon](item.md#scripts-item-twohandweapon)
- [UseEndurance](item.md#scripts-item-useendurance)
- [WeaponReloadType](item.md#scripts-item-weaponreloadtype)

<a id="base-weaponpart"></a>

### base:weaponpart

- [AimingTimeModifier](item.md#scripts-item-aimingtimemodifier)
- [CanAttach](item.md#scripts-item-canattach)
- [CanDetach](item.md#scripts-item-candetach)
- [ClipSizeModifier](item.md#scripts-item-clipsizemodifier)
- [DamageModifier](item.md#scripts-item-damagemodifier)
- [HitChanceModifier](item.md#scripts-item-hitchancemodifier)
- [MaxRangeModifier](item.md#scripts-item-maxrangemodifier)
- [MaxSightRange](item.md#scripts-item-maxsightrange)
- [MinSightRange](item.md#scripts-item-minsightrange)
- [MountOn](item.md#scripts-item-mounton)
- [OnAttach](item.md#scripts-item-onattach)
- [OnDetach](item.md#scripts-item-ondetach)
- [PartType](item.md#scripts-item-parttype)
- [ProjectileSpreadModifier](item.md#scripts-item-projectilespreadmodifier)
- [RecoilDelayModifier](item.md#scripts-item-recoildelaymodifier)
- [ReloadTimeModifier](item.md#scripts-item-reloadtimemodifier)
- [WeightModifier](item.md#scripts-item-weightmodifier)

<a id="parameters"></a>

## Parameters

<a id="scripts-item-acceptitemfunction"></a>

### AcceptItemFunction

**Type:** callback

No description provided.

<a id="scripts-item-acceptmediatype"></a>

### AcceptMediaType

**Type:** integer

**Default:** `-1`

No description provided.

<a id="scripts-item-activateditem"></a>

### ActivatedItem

**Type:** Unknown

No description provided.

<a id="scripts-item-aimingmod"></a>

### AimingMod

**Type:** Unknown

No description provided.

<a id="scripts-item-aimingperkcritmodifier"></a>

### AimingPerkCritModifier

**Type:** integer

See parameter [CriticalChance](item.md#scripts-item-criticalchance).

<a id="scripts-item-aimingperkhitchancemodifier"></a>

### AimingPerkHitChanceModifier

**Type:** float

See parameter [HitChance](item.md#scripts-item-hitchance).

<a id="scripts-item-aimingperkminanglemodifier"></a>

### AimingPerkMinAngleModifier

**Type:** float

See parameter [MinAngle](item.md#scripts-item-minangle).

<a id="scripts-item-aimingperkrangemodifier"></a>

### AimingPerkRangeModifier

**Type:** float

See parameter [MaxRange](item.md#scripts-item-maxrange).

<a id="scripts-item-aimingtime"></a>

### Aimingtime

**Type:** integer

[Aimingtime](item.md#scripts-item-aimingtime) is a stat which is directly applied to a HandWeapon while [AimingTimeModifier](item.md#scripts-item-aimingtimemodifier) is applied to weapon parts. The attachments directly add their [AimingTimeModifier](item.md#scripts-item-aimingtimemodifier) to the aiming delay.

It controls the aim-settling delay, the aiming delay counter that must tick down to 0 before the weapon is “settled”. Lower values means faster target reacquisition after each shots. The primary “how snappy does this gun feel” lever for semi-automatic guns. It tick down the aiming via the following formula:



```java
rate = 0.625 x gameSpeed x (1 + 0.05 x AimingLevel + (Marksman ? 0.1 : 0))
```



The marksman trait being no longer accessible in the recent versions of the game, the condition involving it will never be reached.

> Note:
> This formula might not be fully accurate as time deltas don’t appear in the formula.

While `aimingDelay > 0`, both [hit chance](item.md#scripts-item-hitchance) and [critical chance](item.md#scripts-item-criticalchance) take an aim-delay penalty proportional to the remaining delay. The countdown only starts after `recoilDelay` has recovered, so high [RecoilDelay](item.md#scripts-item-recoildelay) directly delays when `AimingTime` begins ticking.

On each shots or equip, the aiming delay will be increased or reduced, being impacted by aiming while in a vehicle, being reduced by the trait Dextrous or increased by All Thumbs. The following formula is used:



```java
aimingDelay = AimingTime
        * (Dextrous ? 0.8 : AllThumbs ? 1.2 : 1.0)
        * (in vehicle ? 1.5 : 1.0)
```



See also:

- [AimingTimeModifier](item.md#scripts-item-aimingtimemodifier)
- [RecoilDelay](item.md#scripts-item-recoildelay)
- [HitChance](item.md#scripts-item-hitchance)
- [CriticalChance](item.md#scripts-item-criticalchance)

<a id="scripts-item-aimingtimemodifier"></a>

### AimingTimeModifier

**Type:** integer

See parameter [AimingTime](item.md#scripts-item-aimingtime).

See also:

- [AimingTime](item.md#scripts-item-aimingtime)
- [RecoilDelay](item.md#scripts-item-recoildelay)
- [HitChance](item.md#scripts-item-hitchance)
- [CriticalChance](item.md#scripts-item-criticalchance)

<a id="scripts-item-aimreleasesound"></a>

### AimReleaseSound

**Type:** Unknown

No description provided.

<a id="scripts-item-alarmsound"></a>

### AlarmSound

**Type:** Unknown

No description provided.

<a id="scripts-item-alcoholic"></a>

### Alcoholic

**Type:** Unknown

No description provided.

<a id="scripts-item-alcoholpower"></a>

### AlcoholPower

**Type:** Unknown

No description provided.

<a id="scripts-item-alwaysknockdown"></a>

### AlwaysKnockdown

**Type:** Unknown

No description provided.

<a id="scripts-item-alwayswelcomegift"></a>

### AlwaysWelcomeGift

**Type:** boolean

**Is useless:** True

No description provided.

<a id="scripts-item-ammobox"></a>

### AmmoBox

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

Used to indicate the type of ammo box associated to the weapon. This is mostly used to spawn this type of ammo box alongside the gun.

See also:

- [AmmoType](item.md#scripts-item-ammotype)
- [MaxAmmo](item.md#scripts-item-maxammo)

<a id="scripts-item-ammotype"></a>

### AmmoType

**Type:** string

[AmmoType](item.md#scripts-item-ammotype) indicates what ammo is consumed when shooting, but it also determines tracer and hit-reaction sound lookups. The value needs to reference the [registries](../../pzwiki/scripts/Registries.md) entry of the ammo you want to use.

Here is a list of some of the ammo types available in the vanilla game:

- `base:bullets_3030`
- `base:bullets_308`
- `base:bullets_357`
- `base:bullets_38`
- `base:bullets_44`
- `base:bullets_45`
- `base:bullets_556`
- `base:bullets_9mm`
- `base:cap_gun_cap`
- `base:shotgun_shells`

See also:

- [MagazineType](item.md#scripts-item-magazinetype)
- [MaxAmmo](item.md#scripts-item-maxammo)
- [WeaponReloadType](item.md#scripts-item-weaponreloadtype)
- [AmmoBox](item.md#scripts-item-ammobox)

<a id="scripts-item-anglefalloff"></a>

### AngleFalloff

**Type:** Unknown

No description provided.

<a id="scripts-item-animalfeedtype"></a>

### AnimalFeedType

**Type:** Unknown

No description provided.

<a id="scripts-item-attachmentreplacement"></a>

### AttachmentReplacement

**Type:** Unknown

No description provided.

<a id="scripts-item-attachmentsprovided"></a>

### AttachmentsProvided

**Type:** Unknown

No description provided.

<a id="scripts-item-attachmenttype"></a>

### AttachmentType

**Type:** Unknown

No description provided.

<a id="scripts-item-badcold"></a>

### BadCold

**Type:** boolean

<a id="scripts-item-badinmicrowave"></a>

### BadInMicrowave

**Type:** boolean

No description provided.

<a id="scripts-item-bandagepower"></a>

### BandagePower

**Type:** Unknown

No description provided.

<a id="scripts-item-basespeed"></a>

### BaseSpeed

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-basevolumerange"></a>

### BaseVolumeRange

**Type:** Unknown

No description provided.

<a id="scripts-item-bitedefense"></a>

### BiteDefense

**Type:** Unknown

No description provided.

<a id="scripts-item-bloodlocation"></a>

### BloodLocation

**Type:** array (array of string, separator: ‘;’)

**Allowed values:** `Apron` | `Bag` | `Foot_L` | `Foot_R` | `ForeArm_L` | `ForeArm_R` | `FullHelmet` | `Groin` | `Hand_L` | `Hand_R` | `Hands` | `Head` | `Jacket` | `JumperNoSleeves` | `Jumper` | `LongJacket` | `LowerArms` | `LowerBody` | `LowerLeg_L` | `LowerLeg_R` | `LowerLegs` | `Neck` | `ShirtLongSleeves` | `ShirtNoSleeves` | `Shirt` | `Shoes` | `ShortsShort` | `Trousers` | `UpperArm_L` | `UpperArm_R` | `UpperArms` | `UpperBody` | `UpperLeg_L` | `UpperLeg_R` | `UpperLegs`

No description provided.

<a id="scripts-item-bodylocation"></a>

### BodyLocation

**Type:** Unknown

Used to define which location on the human character this clothing item can be worn. Needs to be a valid [BodyLocation](../java/item_body_locations.md) value. You can also create new ones via [registries](../../pzwiki/scripts/Registries.md).

<a id="scripts-item-book-subject"></a>

### book_subject

**Type:** array (array of string, separator: ‘;’)

Add a subject to the litterature item. The value needs to be an array of BookSubject values.

[book_subject](item.md#scripts-item-book-subject) is for books while [magazine_subject](item.md#scripts-item-magazine-subject) is for magazines.

This is notably used to pick a random book or magazine when spawning a book.

<a id="scripts-item-boredomchange"></a>

### BoredomChange

**Type:** integer

When negative, the item being consumed will reduce the player’s boredom, with `100` the maximum amount of boredom of a player.

See also:

- [HungerChange](item.md#scripts-item-hungerchange)
- [ThirstChange](item.md#scripts-item-thirstchange)
- [UnhappyChange](item.md#scripts-item-unhappychange)
- [StressChange](item.md#scripts-item-stresschange)

<a id="scripts-item-brakeforce"></a>

### brakeForce

**Type:** Unknown

No description provided.

<a id="scripts-item-breaksound"></a>

### BreakSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-bringtobearsound"></a>

### BringToBearSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-bulletdefense"></a>

### BulletDefense

**Type:** Unknown

No description provided.

<a id="scripts-item-bullethitarmoursound"></a>

### BulletHitArmourSound

**Type:** Unknown

No description provided.

<a id="scripts-item-calories"></a>

### Calories

**Type:** float

The following stats are directly linked to the player’s nutrition, which are hidden stats that will impact the player’s weight gains and more (positive values will increase the stat when eaten):

- [Calories](item.md#scripts-item-calories)
- [Carbohydrates](item.md#scripts-item-carbohydrates)
- [Lipids](item.md#scripts-item-lipids)
- [Proteins](item.md#scripts-item-proteins)

<a id="scripts-item-canattach"></a>

### CanAttach

**Type:** callback

[CanAttach](item.md#scripts-item-canattach) and [CanDetach](item.md#scripts-item-candetach) are used to define whenever a [WeaponPart](item.md#scripts-item-itemtype) can be respectively attached or detached to and from a [HandWeapon](item.md#scripts-item-itemtype).

[OnAttach](item.md#scripts-item-onattach) and [OnDetach](item.md#scripts-item-ondetach) are used to define a callback function which will be called when the weapon part is attached or detached from the weapon.

<a id="scripts-item-canbandage"></a>

### CanBandage

**Type:** Unknown

No description provided.

<a id="scripts-item-canbarricade"></a>

### CanBarricade

**Type:** Unknown

No description provided.

<a id="scripts-item-canbeequipped"></a>

### CanBeEquipped

**Type:** Unknown

Needs to reference a valid [BodyLocation](item.md#scripts-item-bodylocation) value which will serve as the equipment location.

<a id="scripts-item-canbeplaced"></a>

### CanBePlaced

**Type:** Unknown

No description provided.

<a id="scripts-item-canberemote"></a>

### CanBeRemote

**Type:** Unknown

No description provided.

<a id="scripts-item-canbereused"></a>

### CanBeReused

**Type:** Unknown

No description provided.

<a id="scripts-item-canbewrite"></a>

### CanBeWrite

**Type:** Unknown

No description provided.

<a id="scripts-item-candetach"></a>

### CanDetach

**Type:** callback

See parameter [CanAttach](item.md#scripts-item-canattach).

<a id="scripts-item-canhaveholes"></a>

### CanHaveHoles

**Type:** boolean

**Default:** `True`

Used to define whenever this item can get holes in it.

<a id="scripts-item-cannedfood"></a>

### CannedFood

**Type:** boolean

[CannedFood](item.md#scripts-item-cannedfood) will mark the item as a canned food which will impact how it is spawned in the world. It will also impact the type of item where instead of being “Food” it will be “CannedFood”.

<a id="scripts-item-canstack"></a>

### CanStack

**Type:** Unknown

No description provided.

<a id="scripts-item-canstorewater"></a>

### CanStoreWater

**Type:** Unknown

No description provided.

<a id="scripts-item-cantattackwithlowestendurance"></a>

### CantAttackWithLowestEndurance

**Type:** Unknown

No description provided.

<a id="scripts-item-cantbeconsolided"></a>

### cantBeConsolided

**Type:** boolean

See parameter [ConsolidateOption](item.md#scripts-item-consolidateoption).

<a id="scripts-item-cantbefrozen"></a>

### CantBeFrozen

**Type:** Unknown

No description provided.

<a id="scripts-item-canteat"></a>

### CantEat

**Type:** Unknown

No description provided.

<a id="scripts-item-capacity"></a>

### Capacity

**Type:** integer

**Default:** `-1`

**Maximum:** `50`

Sets the capacity of the container. This value is limited to a maximum of 50 minus its own [weight](item.md#scripts-item-weight). The weight of the bag will follow the formula `equippedWeight = weight * EquippedOrWornEncumbranceMultiplier + contentWeight * (1.0 - weightReduction / 100)`.

<a id="scripts-item-carbohydrates"></a>

### Carbohydrates

**Type:** float

See parameter [Calories](item.md#scripts-item-calories).

<a id="scripts-item-categories"></a>

### Categories

**Type:** Unknown

No description provided.

<a id="scripts-item-chancetofall"></a>

### ChanceToFall

**Type:** Unknown

No description provided.

<a id="scripts-item-chancetospawndamaged"></a>

### ChanceToSpawnDamaged

**Type:** Unknown

No description provided.

<a id="scripts-item-clicksound"></a>

### ClickSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Default:** `Stormy9mmClick`

No description provided.

<a id="scripts-item-clipsize"></a>

### ClipSize

**Type:** integer

**Is useless:** True

No description provided.

<a id="scripts-item-clipsizemodifier"></a>

### ClipSizeModifier

**Type:** integer

**Is useless:** True

No description provided.

<a id="scripts-item-closekillmove"></a>

### CloseKillMove

**Type:** Unknown

Used to whenever this weapon can be used to do a close kill move, like knives to assassinate in the back.

<a id="scripts-item-closesound"></a>

### CloseSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-clothingextrasubmenu"></a>

### ClothingExtraSubmenu

**Type:** Unknown

See parameter [ClothingItem](item.md#scripts-item-clothingitem).

<a id="scripts-item-clothingitem"></a>

### ClothingItem

**Type:** Unknown

`ClothingItem` references the clothing defined inside the clothing.xml file. `ClothingExtraSubmenu` will define the name of the context menu option to equip the clothing item.

`ClothingItemExtra` and `ClothingItemExtraOption` are used to define additional clothing equip options, they reference another item script block.

<a id="scripts-item-clothingitemextra"></a>

### ClothingItemExtra

**Type:** Unknown

See parameter [ClothingItem](item.md#scripts-item-clothingitem).

<a id="scripts-item-clothingitemextraoption"></a>

### ClothingItemExtraOption

**Type:** Unknown

See parameter [ClothingItem](item.md#scripts-item-clothingitem).

<a id="scripts-item-colorblue"></a>

### ColorBlue

**Type:** integer

**Default:** `255`

No description provided.

<a id="scripts-item-colorgreen"></a>

### ColorGreen

**Type:** integer

**Default:** `255`

No description provided.

<a id="scripts-item-colorred"></a>

### ColorRed

**Type:** integer

**Default:** `255`

No description provided.

<a id="scripts-item-combatspeedmodifier"></a>

### CombatSpeedModifier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-conditionaffectscapacity"></a>

### ConditionAffectsCapacity

**Type:** Unknown

Set whenever condition of the item can impact the capacity value of the container.

<a id="scripts-item-conditionlowerchanceonein"></a>

### ConditionLowerChanceOneIn

**Type:** integer

**Default:** `10`

[ConditionLowerChanceOneIn](item.md#scripts-item-conditionlowerchanceonein) impacts the durability of the item, reducing the value
used to calculate the chance by doing `chance = 1/ConditionLowerChanceOneIn`,
which means increasing this parameter value will reduce the chance to damage the
item.

[ConditionMax](item.md#scripts-item-conditionmax) sets the total durability pool, starting condition and repair ceiling. Make these two parameters high for robust military rifles, and low for a cheap civilian gun.

<a id="scripts-item-conditionloweroffroad"></a>

### ConditionLowerOffroad

**Type:** Unknown

No description provided.

<a id="scripts-item-conditionlowerstandard"></a>

### ConditionLowerStandard

**Type:** Unknown

No description provided.

<a id="scripts-item-conditionmax"></a>

### ConditionMax

**Type:** integer

**Default:** `10`

See parameter [ConditionLowerChanceOneIn](item.md#scripts-item-conditionlowerchanceonein).

<a id="scripts-item-consolidateoption"></a>

### ConsolidateOption

**Type:** Unknown

By setting [cantBeConsolided](item.md#scripts-item-cantbeconsolided) to `false` and providing a [ConsolidateOption](item.md#scripts-item-consolidateoption) value, the item can be marked to merge its uses with other items of the same type in the inventory. This requires the item to be [Drainable type](item.md#scripts-item-itemtype).

The ConsolidateOption value needs to be a translation key which will be passed through getText) to retrieve the translation value. The vanilla drainables (duct tape, wires, matches…) use the translation key `ContextMenu_Merge` which outputs a text ‘Add to’.

<a id="scripts-item-cookingsound"></a>

### CookingSound

**Type:** block (block: [sound](sound.md#scripts-sound))

Custom sound to play when cooking this item.

<a id="scripts-item-corpsesicknessdefense"></a>

### CorpseSicknessDefense

**Type:** Unknown

No description provided.

<a id="scripts-item-cosmetic"></a>

### Cosmetic

**Type:** Unknown

No description provided.

<a id="scripts-item-count"></a>

### Count

**Type:** integer

**Default:** `1`

The parameter is unused in the game scripts, unclear what it is used for.

<a id="scripts-item-critdmgmultiplier"></a>

### CritDmgMultiplier

**Type:** float

**Default:** `2.0`

Multiplier applied to the damage of a hit if it is a critical hit, applied inside IsoGameCharacter.Hit()). Two types of crits can trigger:

- A normal crit: `damage *= max(2.0, CritDmgMultiplier)`
- Aim-at-floor stomp (melee only): `damage *= max(5.0, CritDmgMultiplier)`

The default value of the `HandWeapon` class is `2.0`. Values of `3.0` to `5.0` visibly spike crit damage while values above `5.0` also start boosting stomps.

<a id="scripts-item-criticalchance"></a>

### CriticalChance

**Type:** float

**Default:** `20.0`

[CriticalChance](item.md#scripts-item-criticalchance) sets the base critical hit chance of the weapon. The final `CriticalChance` value after all applied bonuses and penalties have been applied is compared on a 0-100 roll.

Below is a table listing the different elements which can influence the critical hit chance of a weapon:

| Element | Type | Description | Formula |
| --- | --- | --- | --- |
| [AimingPerkCritModifier](item.md#scripts-item-aimingperkcritmodifier) and aiming skill of the character | Weapon parameter | The aiming level of the character impacts the player’s critical hit chance by adding the following to the `CriticalChance` value. | `CriticalChance += AimingPerkCritModifier * Aiming level` |
| Sight bonus / penalty | Weapon parameter | In the formula, `sightWindowBonus` refers to the bonus from [MinSightRange](item.md#scripts-item-minsightrange) and [MaxSightRange](item.md#scripts-item-maxsightrange). `sightlessBonus` on the other hand is a simpler parameter which uses a distance falloff when there is not active sight. The best path is used for the better result. The aim delay penalty depends on [Aimingtime](item.md#scripts-item-aimingtime) | `CriticalChance += max(sightlessBonus - sightlessAimDelayPenalty, sightWindowBonus - sightWindowAimDelayPenalty)` |
| Moodles penalty | Player condition | Being panicked, stressed, tired, drunk or lacking endurance will all negatively impact the `CriticalChance`. | `CriticalChance -= moodlesPenalty` |
| Weather penalty | Environment | Wind, rain, fog, low-light will all negatively impact the `CriticalChance`. | `CriticalChance -= weatherPenalty` |
| Movement penalty | Player condition | The shooter speed and the distance will negatively impact the `CriticalChance`. | `CriticalChance -= movementPenalty` |
| Marksman trait | Player condition | This condition can never be reached as the Marksman trait no longer exists. | `CriticalChance += 10` |

For PvP targets, the entire formula is bypassed and [StopPower](item.md#scripts-item-stoppower) is used instead. `StopPower` is never used against non-player targets.



```
CriticalChance = StopPower * ( 1 + Aiming level / 15)
```



`CriticalChance` sets the floor for unskilled players while `AimingPerkCritModifier` rewards more or less the character ability to aim. High modified and low base chance means the weapon is a skill-gated crit machine, making the weapon a sort of “experts” weapon.

See also:

- [AimingTime](item.md#scripts-item-aimingtime)
- [RecoilDelay](item.md#scripts-item-recoildelay)
- [HitChance](item.md#scripts-item-hitchance)
- [MinSightRange](item.md#scripts-item-minsightrange)
- [MaxSightRange](item.md#scripts-item-maxsightrange)
- [StopPower](item.md#scripts-item-stoppower)

<a id="scripts-item-customcontextmenu"></a>

### CustomContextMenu

**Type:** translation

No description provided.

<a id="scripts-item-customeatsound"></a>

### CustomEatSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Can be empty:** True

Custom sound to play when eating or drinking this item. Set to an empty string to disable any sound from playing.

<a id="scripts-item-cyclicratemultiplier"></a>

### CyclicRateMultiplier

**Type:** float

**Default:** `1.0`

**Minimum:** `0.0`

Only in `Auto` [fire mode](item.md#scripts-item-firemode). Drives the full-auto animation cycle rate via the `autoShootSpeed` animation variable.

A higher value means more shots per second. In `Single` mode this field is ignored and shot speed comes from [RecoilDelay](item.md#scripts-item-recoildelay) and [Aimingtime](item.md#scripts-item-aimingtime) instead.

Increase for SMG feel and decrease for heavy LMG feel.

<a id="scripts-item-damagecategory"></a>

### DamageCategory

**Type:** Unknown

No description provided.

<a id="scripts-item-damagemakehole"></a>

### DamageMakeHole

**Type:** Unknown

No description provided.

<a id="scripts-item-damagemodifier"></a>

### DamageModifier

**Type:** float

See parameter [MaxDamage](item.md#scripts-item-maxdamage).

<a id="scripts-item-dangerousuncooked"></a>

### DangerousUncooked

**Type:** boolean

If true, the item will cause food poisoning when eaten raw. Used for example for raw meat. The iron gut trait will stop you from getting sick from eating a raw food with the [tag](item.md#scripts-item-tags) `Egg`. The severity of the food poisoning is not impacted by traits or other criteria, only by the quantity of food you eat.

<a id="scripts-item-daysfresh"></a>

### DaysFresh

**Type:** integer

**Default:** `1000000000`

[DaysFresh](item.md#scripts-item-daysfresh) sets how many days this food item will stay fresh with default sandbox settings. [DaysTotallyRotten](item.md#scripts-item-daystotallyrotten) sets how many days this food item will take to rot.

[Icon](item.md#scripts-item-icon) provides the ability to set a different icon for the rotten and stale version of the food.

<a id="scripts-item-daystotallyrotten"></a>

### DaysTotallyRotten

**Type:** integer

**Default:** `1000000000`

See parameter [DaysFresh](item.md#scripts-item-daysfresh).

<a id="scripts-item-digitalpadlock"></a>

### DigitalPadlock

**Type:** boolean

Looks unused by the game.

<a id="scripts-item-digtype"></a>

### DigType

**Type:** Unknown

No description provided.

<a id="scripts-item-disappearonuse"></a>

### DisappearOnUse

**Type:** boolean

**Default:** `True`

No description provided.

<a id="scripts-item-discomfortmodifier"></a>

### DiscomfortModifier

**Type:** Unknown

No description provided.

<a id="scripts-item-displaycategory"></a>

### DisplayCategory

**Type:** translation

Used to define the category being displayed in the inventory menu. The value needs to be a key which is used to refer to the translation in the [IG_UI](../translations/translation_files.md#ig-ui) translation file. The translation key will be `IGUI_ItemCat_{value}` where `{value}` is the value of this parameter.

For example, if you want to display the category as “Weapons”, the translation key will be `IGUI_ItemCat_Weapons`.

<a id="scripts-item-displayname"></a>

### DisplayName

**Type:** Unknown

**Deprecated:** {‘description’: ‘Naming an item should be done with a translation entry. See the wiki page for more information.’, ‘version’: ‘42.13.0’}

Sets the name of the item which will be displayed in-game. It’s recommended to use a translation entry for this parameter to allow localization of the item name.

<a id="scripts-item-doordamage"></a>

### DoorDamage

**Type:** integer

**Default:** `1`

**Minimum:** `1`

Damage dealt to doors, windows, barricades and some vehicle/object hits. The damage to doors cannot go lower than 1, even in the formulas it is clamped to a minimum of 1. The formula used to retrieve the damage to doors is:



```
damage = max(1, DoorDamage * sharpness multiplier)
```



More parameters will impact the door damage based on where it is used.

<a id="scripts-item-doorhitsound"></a>

### DoorHitSound

**Type:** string

**Default:** `BaseballBatHit`

No description provided.

<a id="scripts-item-doubleclickrecipe"></a>

### DoubleClickRecipe

**Type:** block (block: [craftRecipe](craftrecipe.md#scripts-craftrecipe), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-item-dropsound"></a>

### DropSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-eattime"></a>

### Eattime

**Type:** Unknown

No description provided.

<a id="scripts-item-eattype"></a>

### EatType

**Type:** string

Used mostly on the Lua side and in [AnimNodes](../../pzwiki/assets-and-animation/AnimNode.md) as a condition to mark what animation to use when eating this item. Based on the type of item, this is directly applied to the `FoodType` animation condition.

Here’s a small summary of some special conditions:

- `Pot` and `PotForged` are applied directly, and will force the item to be held in the right hand and removing other items from the left hand, meant for a pot held with two hands.
- `popcan` forces drinking timed action) `maxTime` to a flat `160`.
- `Candrink` will make the player uses an item with the spoon or fork tag in their inventory. A “scraping” sound will also be played when using an utensil and 70% of the eating action is passed.
- `Plate` can also use a fork or spoon.
- `2handbowl` will use only spoons in the player inventory.

There also exists more generic ones:

- `2hand`
- `plate` (different than `Plate`)
- `EatSmall`
- `EatBox`

You can use any custom value which will be passed to the `FoodType` condition.

<a id="scripts-item-ejectammosound"></a>

### EjectAmmoSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-ejectammostartsound"></a>

### EjectAmmoStartSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-ejectammostopsound"></a>

### EjectAmmoStopSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-endurancechange"></a>

### enduranceChange

**Type:** float

No description provided.

<a id="scripts-item-endurancemod"></a>

### EnduranceMod

**Type:** float

**Default:** `1.0`

See parameter [UseEndurance](item.md#scripts-item-useendurance).

<a id="scripts-item-engineloudness"></a>

### engineLoudness

**Type:** Unknown

No description provided.

<a id="scripts-item-equippednosprint"></a>

### EquippedNoSprint

**Type:** Unknown

No description provided.

<a id="scripts-item-equipsound"></a>

### EquipSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-evolvedrecipe"></a>

### EvolvedRecipe

**Type:** object (object: block->>string, kv: ‘:’, pairs: ‘;’)

[EvolvedRecipe](item.md#scripts-item-evolvedrecipe) is used to list the [evolved recipes](evolvedrecipe.md) this item can be used in as an ingredient. The syntax needs to be as follows:



```cpp
EvolvedRecipe = recipeName1:quantity1;recipeName2:quantity2;recipeName3:quantity3,
```



A custom flag `cooked` can also be added for specific recipes, for example:



```cpp
EvolvedRecipe = recipeName1:quantity1|cooked;recipeName2:quantity2;recipeName3:quantity3,
```



Here the `recipeName1` will require the item to be cooked first before being used in the recipe.

A simpler syntax is also technically supported where the quantity can be omitted:



```cpp
EvolvedRecipe = recipeName1;recipeName2:quantity2;recipeName3,
```



[EvolvedRecipeName](item.md#scripts-item-evolvedrecipename) can be used to set the name of the item that will be displayed in the result item. That parameter gets ignored if the game language is not english, and due to a bug it won’t even use the translation of the item so it will use the fullType.

<a id="scripts-item-evolvedrecipename"></a>

### EvolvedRecipeName

**Type:** Unknown

See parameter [EvolvedRecipe](item.md#scripts-item-evolvedrecipe).

<a id="scripts-item-explosionduration"></a>

### ExplosionDuration

**Type:** integer

See parameter [ExplosionRange](item.md#scripts-item-explosionrange).

<a id="scripts-item-explosionpower"></a>

### ExplosionPower

**Type:** integer

See parameter [ExplosionRange](item.md#scripts-item-explosionrange).

<a id="scripts-item-explosionrange"></a>

### ExplosionRange

**Type:** integer

[FireStartingChance](item.md#scripts-item-firestartingchance) out of 100 is a chance of the explosion to set on fire tiles and burn characters in the [ExplosionRange](item.md#scripts-item-explosionrange). A value above 100 means the explosion will always set on fire tiles and burn characters, while a value of 0 means it will never set on fire tiles nor burn characters. Each tiles in the explosion range will run the [FireStartingChance](item.md#scripts-item-firestartingchance) check independently, so a value of 50 means that on average half of the tiles in the explosion range will be set on fire.

If [ExplosionPower](item.md#scripts-item-explosionpower) is set above 0, the explosion will burn tiles and set fire to them based on the provided [fireStartingChance](item.md#scripts-item-firestartingchance).

[extraDamage](item.md#scripts-item-extradamage) is used to add a net bonus damage dealt by the trap.

The damage the trap deals is calculated as follows:



```
damage = random(explosionPower/20, explosionPower/20 * 2) + extraDamage
```



[SmokeRange](item.md#scripts-item-smokerange) sets the range of the smoke effect. Squares in this range also can be set on fire individually based on [FireStartingChance](item.md#scripts-item-firestartingchance).

[FireRange](item.md#scripts-item-firerange) will set every tiles in the provided range on fire.

[FireStartingEnergy](item.md#scripts-item-firestartingenergy) is an extra check added on top of all of these whenever a fire is attempted to be started. Will set the energy of the fire which impacts how strong is is. A value of 0 means no fire is started. Vegetation tiles provide a net bonus of 50 in energy to the fire being created. The created fire will have a life expectency between 300 and 600 (unclear on the units).

[ExplosionSound](item.md#scripts-item-explosionsound) can be used to set the sound played when the explosion happens, while [ExplosionDuration](item.md#scripts-item-explosionduration) can be used to set the duration of the explosion effect, which is especially useful for smoke bombs.

<a id="scripts-item-explosionsound"></a>

### ExplosionSound

**Type:** block (block: [sound](sound.md#scripts-sound))

See parameter [ExplosionRange](item.md#scripts-item-explosionrange).

<a id="scripts-item-explosiontimer"></a>

### ExplosionTimer

**Type:** Unknown

No description provided.

<a id="scripts-item-extradamage"></a>

### extraDamage

**Type:** float

See parameter [ExplosionRange](item.md#scripts-item-explosionrange).

<a id="scripts-item-fabrictype"></a>

### FabricType

**Type:** Unknown

No description provided.

<a id="scripts-item-fatiguechange"></a>

### fatigueChange

**Type:** Unknown

No description provided.

<a id="scripts-item-fillfromdispensersound"></a>

### FillFromDispenserSound

**Type:** Unknown

No description provided.

<a id="scripts-item-fillfromlakesound"></a>

### FillFromLakeSound

**Type:** Unknown

No description provided.

<a id="scripts-item-fillfromtapsound"></a>

### FillFromTapSound

**Type:** Unknown

No description provided.

<a id="scripts-item-fillfromtoiletsound"></a>

### FillFromToiletSound

**Type:** Unknown

No description provided.

<a id="scripts-item-firefuelratio"></a>

### FireFuelRatio

**Type:** Unknown

**Is useless:** True

No description provided.

<a id="scripts-item-firemode"></a>

### FireMode

**Type:** string

[FireModePossibilities](item.md#scripts-item-firemodepossibilities) lists the available fire modes of the weapon, and the player can automatically switch between them with the relevant keybind. [FireMode](item.md#scripts-item-firemode) sets the default fire mode of the weapon, which is the one it will spawn with.

The vanilla fire modes are:

- `Single`
- `Auto`

Other values are not supported by the game and will be considered as `Single`.

<a id="scripts-item-firemodepossibilities"></a>

### FireModePossibilities

**Type:** array (array of string, separator: ‘/’)

See parameter [FireMode](item.md#scripts-item-firemode).

<a id="scripts-item-firerange"></a>

### FireRange

**Type:** Unknown

See parameter [ExplosionRange](item.md#scripts-item-explosionrange).

<a id="scripts-item-firestartingchance"></a>

### FireStartingChance

**Type:** integer

See parameter [ExplosionRange](item.md#scripts-item-explosionrange).

<a id="scripts-item-firestartingenergy"></a>

### FireStartingEnergy

**Type:** integer

No description provided.

<a id="scripts-item-fishinglure"></a>

### FishingLure

**Type:** Unknown

No description provided.

<a id="scripts-item-flureduction"></a>

### fluReduction

**Type:** integer

When eating this food item, the player cold or pain will be reduced by the percentage of the food being eaten times respectively the values of [fluReduction](item.md#scripts-item-flureduction) and [painReduction](item.md#scripts-item-painreduction).

<a id="scripts-item-foodsicknesschange"></a>

### FoodSicknessChange

**Type:** integer

Set the base food sickness change.

The amount of food sickness you get varies based on this parameter and other factors:

- burnt food will divide by 3 the amount of food sickness you get
- stale food will divide by 1.3
- rotten food will divide by 2.2
- cooked food will multiply by 1.3
- raw food provides this base value

<a id="scripts-item-foodtype"></a>

### FoodType

**Type:** string

Sets the food type of the item. A translation entry needs to be made for custom types which has the key `ContextMenu_FoodType_<type>`.

To be a valid food item to feed to animals, the item needs to be of type `Fruits` or `Vegetables`.

<a id="scripts-item-goodhot"></a>

### GoodHot

**Type:** Unknown

[GoodHot](item.md#scripts-item-goodhot) reduces by a flat 2 the happiness change when eating this food hot. On the other hand, [BadCold](item.md#scripts-item-badcold) increases by a flat 2 the unhappiness change when eating this food cold.

<a id="scripts-item-guntype"></a>

### GunType

**Type:** Unknown

No description provided.

<a id="scripts-item-havechamber"></a>

### HaveChamber

**Type:** boolean

**Default:** `True`

Whether the weapon has a chamber that can hold a round in addition to its magazine.

<a id="scripts-item-headcondition"></a>

### HeadCondition

**Type:** Unknown

No description provided.

<a id="scripts-item-headconditionlowerchancemultiplier"></a>

### HeadConditionLowerChanceMultiplier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-headconditionmax"></a>

### HeadConditionMax

**Type:** Unknown

No description provided.

<a id="scripts-item-hearingmodifier"></a>

### HearingModifier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-herbalisttype"></a>

### HerbalistType

**Type:** Unknown

No description provided.

<a id="scripts-item-hidden"></a>

### Hidden

**Type:** Unknown

No description provided.

<a id="scripts-item-hitanglemod"></a>

### HitAngleMod

**Type:** Unknown

No description provided.

<a id="scripts-item-hitchance"></a>

### HitChance

**Type:** integer

[HitChance](item.md#scripts-item-hitchance) is a stat which is directly applied to a HandWeapon while [HitChanceModified](item.md#scripts-item-hitchancemodifier) is applied to weapon parts.

The initial hitchance is determined by the following configuration:



```
HitChance = min(HitChance, CombatConfigKey.MAXIMUM_START_TO_HIT_CHANCE)
```



MAXIMUM_START_TO_HIT_CHANCE is a configuration of the combat system of Project Zomboid. In this case, the default value is `95.0`, which means the initial HitChance cannot be above `95.0`.

Below is a table listing the different elements which can influence the hit chance of a weapon:

| Element | Type | Description | Formula |
| --- | --- | --- | --- |
| [AimingPerkHitChanceModifier](item.md#scripts-item-aimingperkhitchancemodifier) and aiming skill of the character | Weapon parameter | The aiming level of the character impacts the player’s hit chance. | `HitChance += AimingPerkHitChanceModifier * Aiming level` |
| Sight bonus / penalty | Weapon parameter | In the formula, `sightWindowBonus` refers to the bonus from [MinSightRange](item.md#scripts-item-minsightrange) and [MaxSightRange](item.md#scripts-item-maxsightrange). `sightlessBonus` on the other hand is a simpler parameter which uses a distance falloff when there is not active sight. The best path is used for the better result. | `HitChance += max(sightlessBonus - sightlessAimDelayPenalty, sightWindowBonus - sightWindowAimDelayPenalty)` |
| Moodles penalty | Player condition | Being panicked, stressed, tired, drunk or lacking endurance will all negatively impact the `HitChance`. | `HitChance -= moodlesPenalty` |
| Weather penalty | Environment | Wind, rain, fog, low-light will all negatively impact the `HitChance`. | `HitChance -= weatherPenalty` |
| Movement penalty | Player condition | The shooter speed and the distance will negatively impact the `HitChance`. | `HitChance -= movementPenalty` |
| Arm pain penalty | Player condition | The character’s level of pain will impact its aiming. | `HitChance -= armPainPenalty` |
| Headgear vision penalty | Player condition | Headgear will impact aiming, if the relevant sandbox option is enabled. | `HitChance -= headgearVisionPenalty` |

The final obtained value of `HitChance` is clamped against the MINIMUM_TO_HIT_CHANCE and MAXIMUM_TO_HIT_CHANCE, both respectively equal to `5.0` and `100.0` by default.

At point-blank range, all combined penalties are scaled toward zero, so close shots are always more forgiving. The [HitChance](item.md#scripts-item-hitchance) parameter will set the floor for all players while [AimingPerkHitChanceModifier](item.md#scripts-item-aimingperkhitchancemodifier) will increase accuracy with the level of aiming of the player. Low base and high modifier makes the gun terrible while unskilled but excellent with investment in aiming.

<a id="scripts-item-hitchancemodifier"></a>

### HitChanceModifier

**Type:** integer

See parameter [HitChance](item.md#scripts-item-hitchance).

<a id="scripts-item-hitfloorsound"></a>

### HitFloorSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Default:** `BatOnFloor`

No description provided.

<a id="scripts-item-hitsound"></a>

### HitSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Default:** `BaseballBatHit`

No description provided.

<a id="scripts-item-hungerchange"></a>

### HungerChange

**Type:** float

When negative, the item being consumed will reduce the player’s hunger, with `100` the maximum amount of hunger of a player.

See also:

- [UnhappyChange](item.md#scripts-item-unhappychange)
- [ThirstChange](item.md#scripts-item-thirstchange)
- [StressChange](item.md#scripts-item-stresschange)
- [BoredomChange](item.md#scripts-item-boredomchange)

<a id="scripts-item-icon"></a>

### Icon

**Type:** string

**Default:** `None`

Used to specify the icon of the item, usually used in the inventory and crafting menus to easily recognize the item. The icon file needs to be located inside the `media/textures/` folder and the file name must start with `Item_`, and be of the extension `.png`.



```
📁 media
  📁 textures
    📄 Item_iconName.png
```



When referencing the icon in the item script, you should not include the `Item_` prefix and the `.png` extension. For example, to reference the icon file above in the item script:



```
Icon = iconName,
```



<a id="subfolders"></a>

### Subfolders

Subfolders are not directly supported, but you can use some tricks to have them working. Here’s a simple example:



```
Icon = subFolder/iconName,
```



Means your folder structure should be:



```
📁 media
  📁 textures
    📁 Item_subFolder
      📄 iconName.png
```



Notice how the `Item_` prefix is not on the file but on the folder in this case.

<a id="food-icons"></a>

### Food icons

Icons can be specified for rotten, cooked and burned food (`ItemType = base:food,`) by adding the following suffix to the icon files:

- `Rotten` or `Spoiled` for food that has rotten, meaning has passed the [DaysTotallyRotten](item.md#scripts-item-daystotallyrotten) value.
- `Cooked` for food that has been cooked, meaning has passed the [MinutesToCook](item.md#scripts-item-minutestocook) value.
- `Overdone` or `Burnt` for food that has been cooked to the point of burning, meaning has passed the [MinutesToBurn](item.md#scripts-item-minutestoburn) value.

For example, take a food item with the icon file defined as such:



```
Icon = iconName,
```



To add variants based on food condition, you would have the following file structure:



```
📁 media
  📁 textures
    📄 Item_iconName.png
    📄 Item_iconNameCooked.png
    📄 Item_iconNameRotten.png
    📄 Item_iconNameBurnt.png
```



[IconsForTexture](item.md#scripts-item-iconsfortexture) can be used alongside [WorldStaticModelsByIndex](item.md#scripts-item-worldstaticmodelsbyindex) and [StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex) to have variant icons for different models, and all for the same item definition. See those parameters definitions for more information.

<a id="scripts-item-iconcolormask"></a>

### IconColorMask

**Type:** Unknown

No description provided.

<a id="scripts-item-iconfluidmask"></a>

### IconFluidMask

**Type:** Unknown

No description provided.

<a id="scripts-item-iconsfortexture"></a>

### IconsForTexture

**Type:** array (array of string, separator: ‘;’)

See parameter [Icon](item.md#scripts-item-icon).

See also:

- [StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex)
- [WorldStaticModelsByIndex](item.md#scripts-item-worldstaticmodelsbyindex)

<a id="scripts-item-idleanim"></a>

### IdleAnim

**Type:** string

**Default:** `Idle`

No description provided.

<a id="scripts-item-impactsound"></a>

### ImpactSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Default:** `BaseballBatHit`

No description provided.

<a id="scripts-item-insertallbulletsreload"></a>

### InsertAllBulletsReload

**Type:** Unknown

No description provided.

<a id="scripts-item-insertammosound"></a>

### InsertAmmoSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-insertammostartsound"></a>

### InsertAmmoStartSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-insertammostopsound"></a>

### InsertAmmoStopSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-insulation"></a>

### Insulation

**Type:** Unknown

No description provided.

<a id="scripts-item-inversecoughprobability"></a>

### InverseCoughProbability

**Type:** Unknown

No description provided.

<a id="scripts-item-inversecoughprobabilitysmoker"></a>

### InverseCoughProbabilitySmoker

**Type:** Unknown

No description provided.

<a id="scripts-item-isaimedfirearm"></a>

### IsAimedFirearm

**Type:** boolean

[IsAimedFirearm](item.md#scripts-item-isaimedfirearm) enables the entire aimed-firearm subsystem: ballistics controller, reticle, muzzle flash, firearm-specific condition handling and ballistics-base target detection. Without it the weapon falls back to melee sweep logic.

Set to `true` for any normal gun. Distinct from [Ranged](item.md#scripts-item-ranged) which marks the item as a ranged weapon for the animations conditions.

<a id="scripts-item-isaimedhandweapon"></a>

### IsAimedHandWeapon

**Type:** boolean

No description provided.

<a id="scripts-item-iscookable"></a>

### IsCookable

**Type:** boolean

[IsCookable](item.md#scripts-item-iscookable) marks as the item as cookable.

[MinutesToCook](item.md#scripts-item-minutestocook) controls how many in-game minutes it takes for the food to be fully cooked.

[MinutesToBurn](item.md#scripts-item-minutestoburn) controls how many in-game minutes it takes for the food to burn. This value must be higher than [MinutesToCook](item.md#scripts-item-minutestocook) or your item will be instantly burnt before being fully cooked.

[RemoveNegativeEffectOnCooked](item.md#scripts-item-removenegativeeffectoncooked) will remove any negative changes in thirst, unhappiness and boredom when the food is cooked.

[BadInMicrowave](item.md#scripts-item-badinmicrowave) will set the unhappiness and boredom changes to `5.0` when cooked in a microwave.

<a id="scripts-item-isdung"></a>

### IsDung

**Type:** boolean

No description provided.

<a id="scripts-item-ishightier"></a>

### IsHighTier

**Type:** Unknown

No description provided.

<a id="scripts-item-isportable"></a>

### IsPortable

**Type:** Unknown

No description provided.

<a id="scripts-item-istelevision"></a>

### IsTelevision

**Type:** Unknown

No description provided.

<a id="scripts-item-iswatersource"></a>

### IsWaterSource

**Type:** Unknown

No description provided.

<a id="scripts-item-itemaftercleaning"></a>

### ItemAfterCleaning

**Type:** Unknown

No description provided.

<a id="scripts-item-itemtype"></a>

### ItemType

**Type:** string

**Required:** True

**Allowed values:** `base:alarmclock` | `base:alarmclockclothing` | `base:animal` | `base:clothing` | `base:container` | `base:drainable` | `base:food` | `base:key` | `base:literature` | `base:map` | `base:moveable` | `base:normal` | `base:radio` | `base:weapon` | `base:weaponpart`

Defines the class of the item which will impact which parameters the item can take and its properties as well as how it is used by the player. Clothing for instance will handle differently their texture and model in comparison to the other type of items, containers can hold items and weapons can be used by the player to attack and deal damage. You cannot use a custom class of item and only the ones accepted by the game.

<a id="scripts-item-itemwhendry"></a>

### ItemWhenDry

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

See parameter [Wet](item.md#scripts-item-wet).

<a id="scripts-item-jamgunchance"></a>

### JamGunChance

**Type:** float

**Default:** `1.0`

Base probability of a jam on each trigger pull. Final jam roml also scales with the sandbox jam multiplier, current gun condition (lower condition = higher jam chance), and low Aiming/Strength.

`JamGunChance = 1` is already low. Setting it to `0` basically disables jams from this weapon. Higher values makes the gun unreliable and punishes neglecting the gun or unskilled use.

<a id="scripts-item-keepondeplete"></a>

### KeepOnDeplete

**Type:** Unknown

No description provided.

<a id="scripts-item-knockbackonnodeath"></a>

### KnockBackOnNoDeath

**Type:** boolean

**Default:** `True`

No description provided.

<a id="scripts-item-knockdownmod"></a>

### KnockdownMod

**Type:** float

**Deprecated:** {‘description’: ‘This parameter is not used by the base game.’}

**Default:** `1.0`

No description provided.

<a id="scripts-item-learnedrecipes"></a>

### LearnedRecipes

**Type:** array (array of block, separator: ‘;’)

List of [craftRecipe](craftrecipe.md) this item will teach the player when read.

<a id="scripts-item-lightdistance"></a>

### LightDistance

**Type:** integer

See parameter [LightStrength](item.md#scripts-item-lightstrength).

<a id="scripts-item-lightstrength"></a>

### LightStrength

**Type:** float

[LightDistance](item.md#scripts-item-lightdistance) is used to determine the radius of the light emitted by the item. It is compared to the Manhattan distance of the item to the square. The higher the value, the higher is the radius of the light.

[LightStrength](item.md#scripts-item-lightstrength) will boost the light emitted.



```
new_light_level = current_light_level + 3 * LightStrength * (1 - clamp(dist / LightDistance, 0.0, 1.0))
```



The `new_light_level` is limited to a maximum of `2.5`.

<a id="scripts-item-lipids"></a>

### Lipids

**Type:** float

See parameter [Calories](item.md#scripts-item-calories).

<a id="scripts-item-lowlightbonus"></a>

### LowLightBonus

**Type:** float

**Is useless:** True

No description provided.

<a id="scripts-item-lvlskilltrained"></a>

### LvlSkillTrained

**Type:** integer

**Default:** `-1`

See parameter [SkillTrained](item.md#scripts-item-skilltrained).

<a id="scripts-item-magazine-subject"></a>

### magazine_subject

**Type:** array (array of string, separator: ‘;’)

You can find a list of subjects in the [MagazineSubject](../java/magazine_subject.md).

<a id="scripts-item-magazinetype"></a>

### MagazineType

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

Used to set the magazine item the gun uses. If not provided, then the gun doesn’t use a magazine item and loads rounds individually. [MaxAmmo](item.md#scripts-item-maxammo) is used to set the capacity of either the magazine item or the gun.

See also:

- [AmmoType](item.md#scripts-item-ammotype)
- [MaxAmmo](item.md#scripts-item-maxammo)
- [AmmoBox](item.md#scripts-item-ammobox)
- [WeaponReloadType](item.md#scripts-item-weaponreloadtype)

<a id="scripts-item-makeuptype"></a>

### MakeUpType

**Type:** Unknown

No description provided.

<a id="scripts-item-manuallyremovespentrounds"></a>

### ManuallyRemoveSpentRounds

**Type:** Unknown

No description provided.

<a id="scripts-item-map"></a>

### Map

**Type:** Unknown

No description provided.

<a id="scripts-item-maxammo"></a>

### MaxAmmo

**Type:** integer

See parameter [MagazineType](item.md#scripts-item-magazinetype).

See also:

- [MagazineType](item.md#scripts-item-magazinetype)
- [AmmoType](item.md#scripts-item-ammotype)
- [AmmoBox](item.md#scripts-item-ammobox)

<a id="scripts-item-maxcapacity"></a>

### MaxCapacity

**Type:** integer

**Default:** `-1`

No description provided.

<a id="scripts-item-maxchannel"></a>

### MaxChannel

**Type:** integer

**Default:** `108000`

No description provided.

<a id="scripts-item-maxdamage"></a>

### MaxDamage

**Type:** float

**Default:** `1.5`

Rolls the hit damage of the weapon between `MinDamage` and `MaxDamage`.

[WeaponParts](item.md#scripts-item-itemtype) can modify the damage of the weapon with the [DamageModifier](item.md#scripts-item-damagemodifier) parameter. When equipped, a [WeaponPart](item.md#scripts-item-itemtype) will increase the minimum and maximum damage of the weapon by the provided value. You are not limited to positive values, you can also add damage debuffs to the weapon by providing negative values.

<a id="scripts-item-maxhitcount"></a>

### MaxHitcount

**Type:** integer

**Default:** `1000`

[MaxHitcount](item.md#scripts-item-maxhitcount) sets the maximum number of targets the weapon can hit with one attack. For ranged weapons, it will determine how many targets a single shot can hit. For melee weapons, a single swing can hit multiple targets if the relevant sandbox option allows it (Weapon Multi-Hit).

When [PiercingBullets](item.md#scripts-item-piercingbullets) is `true`, a shot continues past the first target and registers on collinear targets behind it. Each subsequent pierced target receives reduced damage (`damage / PIERCING_BULLET_DAMAGE_REDUCTION`). Targets must be within approximatively 1 degree of each other in angle to qualify.

Keep `MaxHitcount` to 1 for a standard rifle, and set it to 2 with [PiercingBullets](item.md#scripts-item-piercingbullets) to have AP rounds behavior (M16A2 for example).

<a id="scripts-item-maxitemsize"></a>

### MaxItemSize

**Type:** Unknown

No description provided.

<a id="scripts-item-maxrange"></a>

### MaxRange

**Type:** float

**Default:** `1.0`

[MaxRange](item.md#scripts-item-maxrange) is a stat which is directly applied to a HandWeapon while [MaxRangeModifier](item.md#scripts-item-maxrangemodifier) is applied to weapon parts.

The [MaxRange](item.md#scripts-item-maxrange) of a weapon is used to determine the maximum distance the weapon can shoot. Targets beyond `effectiveMaxRange` calculated with the formula below simply can’t be reached, the parameter is a hard cutoff, not a penalty in damage or anything like that.



```
effectiveMaxRange = MaxRange + AimingPerkRangeModifier x (AimingLevel / 2.0)
```



All rifles from the base game have a `AimingPerkRangeModifier` of 0, so aiming level has no effect on the range of guns. Set it above 0 to give skilled players extra reach.

<a id="scripts-item-maxrangemodifier"></a>

### MaxRangeModifier

**Type:** float

See parameter [MaxRange](item.md#scripts-item-maxrange).

<a id="scripts-item-maxsightrange"></a>

### MaxSightRange

**Type:** float

[MinSightRange](item.md#scripts-item-minsightrange) and [MaxSightRange](item.md#scripts-item-maxsightrange) define the optimal sight window, to be more specific, the distance band where hits and critical hits bonuses peak.

The aiming skill and eagle eyed will impact these values:



```
effectiveMin = MinSightRange x (1 - AimingLevel / 30)
effectiveMax = MaxSightRange x (1 + AimingLevel / 30) x (EagleEyed ? 1.2 : 1.0)
```



At aiming 10, the minimum shrinks by 33% and the max grows by 33%, which widens the window significantly. When the trait Short Sighted is present and the character doesn’t wear glasses, the `effectiveMax` equals `effectiveMin`, making the entire bonus window disappear.

Inside the the `effectiveMin` and `effectiveMax` window, the bonus follows a Gaussian with the bonus peaking at the midpoint. Aim-delay penalty is also reduced inside the window.

Below `effectiveMin`, a small linear penalty is applied as the gun is not suited for point-blank. Above `effectiveMax`, a growing quadratic penalty is applied, the bonus degrades rapidly past the edge.

A CQC gun should have a low [MaxSightRange](item.md#scripts-item-maxsightrange) while a marksman riffle should have a high [MinSightRange](item.md#scripts-item-minsightrange) with a wide window.

<a id="scripts-item-mechanicsitem"></a>

### MechanicsItem

**Type:** Unknown

No description provided.

<a id="scripts-item-mediacategory"></a>

### MediaCategory

**Type:** Unknown

No description provided.

<a id="scripts-item-medical"></a>

### Medical

**Type:** Unknown

No description provided.

<a id="scripts-item-metalvalue"></a>

### MetalValue

**Type:** Unknown

No description provided.

<a id="scripts-item-micrange"></a>

### MicRange

**Type:** Unknown

No description provided.

<a id="scripts-item-minangle"></a>

### MinAngle

**Type:** float

**Default:** `1.0`

For [IsAimedFirearm](item.md#scripts-item-isaimedfirearm) set to `true`, the ballistics controller handles target detection and does not use [MinAngle](item.md#scripts-item-minangle) in the ranged hit-chance formula. These serve one narrow purpose: the `isMeleeTargetTooCloseToShoot()` check, detecting if a target is so close it should trigger a melee strike instead of a shot.

`MinAngle` is a dot-product threshold (-1 to 1). Values near 1.0 mean the target must be almost directly in front to trigger the melee-swap check, while lower values widen the angle.

[AimingPerkMinAngleModifier](item.md#scripts-item-aimingperkminanglemodifier) is parsed and stored and impacts the minimum angle with the following formula:



```java
effectiveMinAngle = MinAngle - AimingPerkMinAngleModifier * Aiming level
```



<a id="scripts-item-minchannel"></a>

### MinChannel

**Type:** integer

**Default:** `88000`

No description provided.

<a id="scripts-item-mindamage"></a>

### MinDamage

**Type:** float

See parameter [MaxDamage](item.md#scripts-item-maxdamage).

<a id="scripts-item-minimumswingtime"></a>

### MinimumSwingtime

**Type:** Unknown

No description provided.

<a id="scripts-item-minrange"></a>

### MinRange

**Type:** float

Hard minimum attack distance. If the target is closer than `MinRange`, the ballistics controller does not register the shot and the game may force a melee swap. This is a binary threshold, not a penalty band. Separate from [MinSightRange](item.md#scripts-item-minsightrange).

Long rifles should be hard to use in tight spaces. `0.2` to `0.35` is a small gap but `0.61` is noticeably limiting indoors.

<a id="scripts-item-minsightrange"></a>

### MinSightRange

**Type:** float

See parameter [MaxSightRange](item.md#scripts-item-maxsightrange).

<a id="scripts-item-minutestoburn"></a>

### MinutesToBurn

**Type:** float

**Default:** `120.0`

See parameter [IsCookable](item.md#scripts-item-iscookable).

<a id="scripts-item-minutestocook"></a>

### MinutesToCook

**Type:** float

**Default:** `60.0`

See parameter [IsCookable](item.md#scripts-item-iscookable).

<a id="scripts-item-modelweaponpart"></a>

### ModelWeaponPart

**Type:** array (array of string, separator: ‘ ‘)

No description provided.

<a id="scripts-item-mounton"></a>

### MountOn

**Type:** array (array of string, separator: ‘;’)

No description provided.

<a id="scripts-item-multiplehitconditionaffected"></a>

### MultipleHitConditionAffected

**Type:** boolean

**Deprecated:** {‘description’: ‘This parameter is not used by the base game.’}

No description provided.

<a id="scripts-item-muzzleflashmodelkey"></a>

### MuzzleFlashModelKey

**Type:** block (block: [model](model.md#scripts-model))

No description provided.

<a id="scripts-item-neckprotectionmodifier"></a>

### NeckProtectionModifier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-needtobeclosedoncereload"></a>

### needtobeclosedoncereload

**Type:** Unknown

No description provided.

<a id="scripts-item-noiseduration"></a>

### NoiseDuration

**Type:** Unknown

No description provided.

<a id="scripts-item-noiserange"></a>

### NoiseRange

**Type:** Unknown

No description provided.

<a id="scripts-item-notransmit"></a>

### NoTransmit

**Type:** Unknown

No description provided.

<a id="scripts-item-npcsoundboost"></a>

### NPCSoundBoost

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-numberofpages"></a>

### NumberOfPages

**Type:** integer

**Default:** `-1`

See parameter [SkillTrained](item.md#scripts-item-skilltrained).

<a id="scripts-item-numlevelstrained"></a>

### NumLevelsTrained

**Type:** integer

**Default:** `1`

See parameter [SkillTrained](item.md#scripts-item-skilltrained).

<a id="scripts-item-onattach"></a>

### OnAttach

**Type:** callback

See parameter [CanAttach](item.md#scripts-item-canattach).

<a id="scripts-item-onbreak"></a>

### OnBreak

**Type:** callback

Triggered when the item condition drops below 0.

<a id="scripts-item-oncooked"></a>

### OnCooked

**Type:** callback

No description provided.

<a id="scripts-item-oncreate"></a>

### OnCreate

**Type:** callback

Triggered when the item is instantiated.

<a id="scripts-item-ondetach"></a>

### OnDetach

**Type:** callback

See parameter [CanAttach](item.md#scripts-item-canattach).

<a id="scripts-item-oneat"></a>

### OnEat

**Type:** Unknown

No description provided.

<a id="scripts-item-onlyacceptcategory"></a>

### OnlyAcceptCategory

**Type:** string

Makes sure only items with the specified ItemCategory corresponding to the provided value of this parameter can be inserted into the container.

<a id="scripts-item-openingrecipe"></a>

### OpeningRecipe

**Type:** Unknown

No description provided.

<a id="scripts-item-opensound"></a>

### OpenSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-originx"></a>

### OriginX

**Type:** integer

Seems to indicate the coordinates this item is associate to, mostly used for keys.

<a id="scripts-item-originy"></a>

### OriginY

**Type:** integer

See parameter [OriginX](item.md#scripts-item-originx).

<a id="scripts-item-originz"></a>

### originZ

**Type:** integer

See parameter [OriginX](item.md#scripts-item-originx).

<a id="scripts-item-otherhandrequire"></a>

### OtherHandRequire

**Type:** Unknown

No description provided.

<a id="scripts-item-otherhanduse"></a>

### OtherHandUse

**Type:** Unknown

No description provided.

<a id="scripts-item-packaged"></a>

### Packaged

**Type:** boolean

Setting this to `true` will add readable content on the food item, which will display the [nutrional information](item.md#scripts-item-calories) of the food item.

<a id="scripts-item-padlock"></a>

### Padlock

**Type:** Unknown

No description provided.

<a id="scripts-item-pagetowrite"></a>

### PageToWrite

**Type:** Unknown

No description provided.

<a id="scripts-item-painreduction"></a>

### painReduction

**Type:** integer

See parameter [fluReduction](item.md#scripts-item-flureduction).

<a id="scripts-item-parttype"></a>

### PartType

**Type:** string

Marks the [WeaponPart](item.md#scripts-item-itemtype) as a specific type of part. For proper tooltip of your weapon part, you need to either use one of the existing parts or use a custom part type but provide a translation entry inside [Tooltip.json](../translations/translation_files.md#tooltip) as `Tooltip_weapon_` followed by that part type value. For example, if you set `PartType = customPart`, you need to provide a translation entry as `Tooltip_weapon_customPart` with the name of your part.

Here are the available part types in the base game:

- RecoilPad
- Clip
- Canon
- Scope
- Sling
- Stock

There are also some indirect part types. If the item has the [TorchCone](item.md#scripts-item-torchcone) parameter, that part will be valid as a torch attachment. If it has the tag `base:optics`, it will be valid as an optics attachment.

Technically, there are other `Tooltip_weapon_` combination than the ones listed above, but they are not used as part types, but due to them sharing the same translation entry format, they can technically be used as a part type. It means these should not be used as part types, as you’d have to overwrite their translation entries which could brake the translation of the base game:

- Condition
- HandleCondition
- HeadCondition
- Sharpness
- Repaired
- Damage
- Unusable_at_max_exertion
- Ammo
- AmmoCount
- Range
- Type
- CanBeMountOn
- Jammed
- NoRoundChambered
- SpentRoundChambered
- SpentRounds
- ContainsClip
- NoClip
- NoMaintenanceXp

<a id="scripts-item-physicsobject"></a>

### PhysicsObject

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

Provides another item (or itself) as a throwable object. When used, the item will be thrown instead of used as an actual in hands weapon.

<a id="scripts-item-piercingbullets"></a>

### PiercingBullets

**Type:** boolean

See parameter [MaxHitcount](item.md#scripts-item-maxhitcount).

<a id="scripts-item-placedsprite"></a>

### PlacedSprite

**Type:** Unknown

No description provided.

<a id="scripts-item-placemultiplesound"></a>

### PlaceMultipleSound

**Type:** Unknown

No description provided.

<a id="scripts-item-placeonesound"></a>

### PlaceOneSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-poison"></a>

### Poison

**Type:** boolean

**Is useless:** True

**Default:** `False`

See parameter [PoisonPower](item.md#scripts-item-poisonpower).

<a id="scripts-item-poisondetectionlevel"></a>

### PoisonDetectionLevel

**Type:** integer

See parameter [PoisonPower](item.md#scripts-item-poisonpower).

<a id="scripts-item-poisonpower"></a>

### PoisonPower

**Type:** integer

[PoisonPower](item.md#scripts-item-poisonpower) defines the strength of the poison, where a positive value will make the food poisonous.

[PoisonDetectionLevel](item.md#scripts-item-poisondetectionlevel) doesn’t seem to be useful, where a positive value will make it pass all the checks anyway, so increasing that value doesn’t do anything.]

You can also mark an item to be shown as poisonous to the player by adding the ItemTag `base:showpoison`.

The parameters [Poison](item.md#scripts-item-poison) and [UseForPoison](item.md#scripts-item-useforpoison) look unused.

<a id="scripts-item-pourtype"></a>

### PourType

**Type:** string

Sets an identifier for the pouring type. This will set the `PourType` condition of [AnimNode](../../pzwiki/assets-and-animation/AnimNode.md) to the provided value when doing different actions:

- pouring, dumping, adding liquid etc
- fertilizing
- curing a plant

Specific values have different effects:

- `Bucket` will cause the item to play the sound `Base.PourLiquidOnGroundMetal` with the [tag](item.md#scripts-item-tags) `base:hasmetal` when pouring liquid.
- `Pot` will also play `Base.PourLiquidOnGroundMetal` but without the need for the tag.
- Other values will play `Base.PourLiquidOnGround` when pouring liquid.

<a id="scripts-item-primaryanimmask"></a>

### primaryAnimMask

**Type:** Unknown

No description provided.

<a id="scripts-item-projectilecount"></a>

### Projectilecount

**Type:** integer

**Default:** `1`

Only active when the weapon is ranged and has [RangeFalloff](item.md#scripts-item-rangefalloff) set to `true`. In that mode, the ballistics controller generates multiple spread projectiles. The field is never read when [RangeFalloff](item.md#scripts-item-rangefalloff) is `false`.

Inert for standard rifles. Required only for shotgun-style spread.

<a id="scripts-item-projectilespread"></a>

### ProjectileSpread

**Type:** float

Projectile spread seems to be mostly a visual effect and doesn’t affect the actual hit chance of the weapon. The spread will be calculated following a formula close to the following:



```
spread = ProjectileSpread * 10 degrees +/- 2 degrees
```



With the `spread` value being the total cone angle of the projectiles.

<a id="scripts-item-projectilespreadmodifier"></a>

### ProjectileSpreadModifier

**Type:** float

No description provided.

<a id="scripts-item-projectileweightcenter"></a>

### ProjectileWeightCenter

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-protectfromrainwhenequipped"></a>

### ProtectFromRainWhenEquipped

**Type:** Unknown

No description provided.

<a id="scripts-item-proteins"></a>

### Proteins

**Type:** float

See parameter [Calories](item.md#scripts-item-calories).

<a id="scripts-item-pushbackmod"></a>

### PushBackMod

**Type:** float

**Default:** `1.0`

Scales the magnitude of the hit-reaction push applied to the target character. A higher value will increase the time the target is staggered. It will also impact the spread of blood.

Higher gives a more weighty, impactful feel.

<a id="scripts-item-putinsound"></a>

### PutInSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-rackaftershoot"></a>

### RackAfterShoot

**Type:** Unknown

No description provided.

<a id="scripts-item-racksound"></a>

### RackSound

**Type:** Unknown

No description provided.

<a id="scripts-item-rainfactor"></a>

### RainFactor

**Type:** Unknown

No description provided.

<a id="scripts-item-ranged"></a>

### Ranged

**Type:** boolean

See parameter [IsAimedFirearm](item.md#scripts-item-isaimedfirearm).

<a id="scripts-item-rangefalloff"></a>

### RangeFalloff

**Type:** boolean

No description provided.

<a id="scripts-item-readtype"></a>

### ReadType

**Type:** Unknown

No description provided.

<a id="scripts-item-recoildelay"></a>

### RecoilDelay

**Type:** Unknown

[RecoilDelay](item.md#scripts-item-recoildelay) is a stat which is directly applied to a HandWeapon while [AimingTimeModifier](item.md#scripts-item-recoildelaymodifier) is applied to weapon parts. Weapon attachments will add or subtract from [RecoilDelay](item.md#scripts-item-recoildelay) directly.

Controls how long post-shot recovery takes before aim settling can begin. High values means the gun has a huge kick and forces a pause. Lower values is a flat, fast and snappy gun. Strength and aiming will both reduce the recoil delay. Holding the gun one-handed will negatively impact the recoil handling. The following formula is used:



```java
effectiveDelay = RecoilDelay
              * (1 - AimingLevel / 40)
              * (1 - (StrengthLevel * 2 - 10) / 40)
              * (one-handed penalty: * 1.3 if primary hand only, secondary empty)
```



Aim countdown starts when the recoil delay counter is less than `effectiveDelay * AimingLevel / 30`. Higher aiming also lets aim recovery start earlier in the recoil window.

See also:

- [RecoilDelayModifier](item.md#scripts-item-recoildelaymodifier)
- [AimingTime](item.md#scripts-item-aimingtime)
- [HitChance](item.md#scripts-item-hitchance)

<a id="scripts-item-recoildelaymodifier"></a>

### RecoilDelayModifier

**Type:** Unknown

See parameter [RecoilDelay](item.md#scripts-item-recoildelay).

See also:

- [RecoilDelay](item.md#scripts-item-recoildelay)
- [AimingTime](item.md#scripts-item-aimingtime)
- [AimingTimeModifier](item.md#scripts-item-aimingtimemodifier)
- [HitChance](item.md#scripts-item-hitchance)

<a id="scripts-item-reduceinfectionpower"></a>

### ReduceInfectionPower

**Type:** Unknown

No description provided.

<a id="scripts-item-reloadtime"></a>

### Reloadtime

**Type:** Unknown

No description provided.

<a id="scripts-item-reloadtimemodifier"></a>

### ReloadTimeModifier

**Type:** integer

No description provided.

<a id="scripts-item-remotecontroller"></a>

### RemoteController

**Type:** Unknown

No description provided.

<a id="scripts-item-remoterange"></a>

### RemoteRange

**Type:** Unknown

No description provided.

<a id="scripts-item-removenegativeeffectoncooked"></a>

### RemoveNegativeEffectOnCooked

**Type:** boolean

See parameter [IsCookable](item.md#scripts-item-iscookable).

<a id="scripts-item-removeonbroken"></a>

### RemoveOnBroken

**Type:** boolean

**Default:** `True`

No description provided.

<a id="scripts-item-removeunhappinesswhencooked"></a>

### RemoveUnhappinessWhenCooked

**Type:** Unknown

No description provided.

<a id="scripts-item-replaceinprimaryhand"></a>

### ReplaceInPrimaryHand

**Type:** Unknown

No description provided.

<a id="scripts-item-replaceinsecondhand"></a>

### ReplaceInSecondHand

**Type:** Unknown

No description provided.

<a id="scripts-item-replaceoncooked"></a>

### ReplaceOnCooked

**Type:** array (array of string, separator: ‘;’)

A list of [items](item.md) that will replace the cooked item by adding them to the player’s inventory.

<a id="scripts-item-replaceondeplete"></a>

### ReplaceOnDeplete

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

When providing a [ReplaceOnDeplete](item.md#scripts-item-replaceondeplete), the moment the item is depleted (e.g. a drainable item has no uses left anymore), it will be replaced by the item defined in this parameter. If this is empty, the item will be deleted without any replacement. This can notably be used to replace towels with a [wet](item.md#scripts-item-wet) towel.

[ReplaceOnExtinguish](item.md#scripts-item-replaceonextinguish) on the other hand is used for [light sources items](item.md#scripts-item-lightstrength) to swap between the lit and unlit version of the item when it is fully drained.

[ReplaceOnRotten](item.md#scripts-item-replaceonrotten) is used for food items to swap to a different rotten version of items when they are fully rotten. This is actually not used to make an item rotten, which is natively handled by the game when providing [DaysFresh](item.md#scripts-item-daysfresh) and [DaysTotallyRotten](item.md#scripts-item-daystotallyrotten) but instead when the item isn’t necessary bad to eat after the days rotten duration, like ice cream becoming melted for example.

[ReplaceOnUse](item.md#scripts-item-replaceonuse) is used whenever an item is used, to replace it with another item. Used for containers containing food items to provide the container back after the food is eaten, or for dirty items getting cleaned.

<a id="scripts-item-replaceonextinguish"></a>

### ReplaceOnExtinguish

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-item-replaceonrotten"></a>

### ReplaceOnRotten

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-item-replaceonuse"></a>

### ReplaceOnUse

**Type:** block (block: [item](item.md#scripts-item), with [module](module.md#scripts-module))

No description provided.

<a id="scripts-item-replaceonuseon"></a>

### ReplaceOnUseOn

**Type:** array (array of string, separator: ‘-‘)

Unclear what this does exactly.

<a id="scripts-item-requireinhandorinventory"></a>

### RequireInHandOrInventory

**Type:** Unknown

No description provided.

<a id="scripts-item-requiresequippedbothhands"></a>

### RequiresEquippedBothHands

**Type:** boolean

No description provided.

<a id="scripts-item-researchablerecipes"></a>

### Researchablerecipes

**Type:** array (array of block, separator: ‘;’)

No description provided.

<a id="scripts-item-runanim"></a>

### RunAnim

**Type:** string

**Default:** `Run`

No description provided.

<a id="scripts-item-runspeedmodifier"></a>

### RunSpeedModifier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-scaleworldicon"></a>

### ScaleWorldIcon

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-scratchdefense"></a>

### ScratchDefense

**Type:** Unknown

No description provided.

<a id="scripts-item-secondaryanimmask"></a>

### secondaryAnimMask

**Type:** Unknown

No description provided.

<a id="scripts-item-sensorrange"></a>

### SensorRange

**Type:** Unknown

No description provided.

<a id="scripts-item-sharpness"></a>

### Sharpness

**Type:** Unknown

No description provided.

<a id="scripts-item-shellfallsound"></a>

### ShellFallSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-shoutmultiplier"></a>

### ShoutMultiplier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-shouttype"></a>

### ShoutType

**Type:** Unknown

No description provided.

<a id="scripts-item-skilltrained"></a>

### SkillTrained

**Type:** string

**Default:** (empty)

[SkillTrained](item.md#scripts-item-skilltrained) is used to determine which skill the player will start training when reading this literature.

[LvlSkillTrained](item.md#scripts-item-lvlskilltrained) indicates at what level this literature can be used to start training the skill. [NumLevelsTrained](item.md#scripts-item-numlevelstrained) marks how many level can be trained thanks to this literature.

<a id="scripts-item-smokerange"></a>

### SmokeRange

**Type:** Unknown

No description provided.

<a id="scripts-item-soundgain"></a>

### SoundGain

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-soundmap"></a>

### SoundMap

**Type:** object (object: string->>block, kv: ‘ ‘, pairs: ‘;’)

No description provided.

<a id="scripts-item-soundparameter"></a>

### SoundParameter

**Type:** Unknown

No description provided.

<a id="scripts-item-soundradius"></a>

### SoundRadius

**Type:** Unknown

No description provided.

<a id="scripts-item-soundvolume"></a>

### SoundVolume

**Type:** Unknown

No description provided.

<a id="scripts-item-spawnwith"></a>

### SpawnWith

**Type:** Unknown

No description provided.

<a id="scripts-item-spice"></a>

### Spice

**Type:** boolean

Marks this item as a spice, which can be used in the [evolved recipes](evolvedrecipe.md) system.

<a id="scripts-item-splatbloodonnodeath"></a>

### SplatBloodOnNoDeath

**Type:** Unknown

No description provided.

<a id="scripts-item-splatnumber"></a>

### SplatNumber

**Type:** integer

**Default:** `2`

No description provided.

<a id="scripts-item-splatsize"></a>

### SplatSize

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-staticmodel"></a>

### StaticModel

**Type:** block (block: [model](model.md#scripts-model), with [module](module.md#scripts-module))

[StaticModel](item.md#scripts-item-staticmodel) is used to define the model of the item being held in hands. On the other hand, [WorldStaticModel](item.md#scripts-item-worldstaticmodel) is used to define the model of the item being placed in the world. The two models can be different, for example a bucket can have a handle that is up when held in hands, but down when placed in the world.

See also:

- [WeaponSprite](item.md#scripts-item-weaponsprite)
- [WorldStaticModel](item.md#scripts-item-worldstaticmodel)
- [StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex)
- [WorldStaticModelsByIndex](item.md#scripts-item-worldstaticmodelsbyindex)

<a id="scripts-item-staticmodelsbyindex"></a>

### StaticModelsByIndex

**Type:** array (array of string, separator: ‘;’)

[StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex) and [WorldStaticModelsByIndex](item.md#scripts-item-worldstaticmodelsbyindex) can be used to define multiple models for the same item definition, which is useful for variants of the same item (e.g. a weapon with different skins). You can use [IconsForTexture](item.md#scripts-item-iconsfortexture) alongside those to define different [icons](item.md#scripts-item-icon) for each variant. Here’s an example usage with three variants of the same item:



```cpp
StaticModelsByIndex = AK47;AK47_Desert;AK47_Woodland,
WorldStaticModelsByIndex = AK47;AK47_Desert;AK47_Woodland,
IconsForTexture = AK47;AK47_Desert;AK47_Woodland,
```



See also:

- [StaticModel](item.md#scripts-item-staticmodel)
- [WorldStaticModel](item.md#scripts-item-worldstaticmodel)
- [IconsForTexture](item.md#scripts-item-iconsfortexture)

<a id="scripts-item-stomppower"></a>

### StompPower

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-stoppower"></a>

### StopPower

**Type:** float

**Default:** `5.0`

See parameter [CriticalChance](item.md#scripts-item-criticalchance).

<a id="scripts-item-stresschange"></a>

### StressChange

**Type:** float

When positive, the item being consumed will decrease the player’s stress, with `100` the maximum amount of stress of a player.

See also:

- [HungerChange](item.md#scripts-item-hungerchange)
- [ThirstChange](item.md#scripts-item-thirstchange)
- [UnhappyChange](item.md#scripts-item-unhappychange)
- [BoredomChange](item.md#scripts-item-boredomchange)

<a id="scripts-item-subcategory"></a>

### SubCategory

**Type:** string

**Default:** (empty)

No description provided.

<a id="scripts-item-survivalgear"></a>

### SurvivalGear

**Type:** Unknown

No description provided.

<a id="scripts-item-suspensioncompression"></a>

### suspensionCompression

**Type:** Unknown

No description provided.

<a id="scripts-item-suspensiondamping"></a>

### suspensionDamping

**Type:** Unknown

No description provided.

<a id="scripts-item-swingamountbeforeimpact"></a>

### SwingAmountBeforeImpact

**Type:** Unknown

No description provided.

<a id="scripts-item-swinganim"></a>

### SwingAnim

**Type:** string

**Default:** `Rifle`

No description provided.

<a id="scripts-item-swingsound"></a>

### SwingSound

**Type:** block (block: [sound](sound.md#scripts-sound))

**Default:** `BaseballBatSwing`

No description provided.

<a id="scripts-item-swingtime"></a>

### Swingtime

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-tags"></a>

### Tags

**Type:** array (array of string, separator: ‘;’)

A list of tags to assign to the item. Tags are used by the game to easily identify properties of the items from the Lua or Java. This can notably be used in [craftRecipes](craftrecipe.md).

For example:



```cpp
Tags = base:egg;base:hasmetal,
```



You can find a list of all tags on the [PZ API Doc](../java/item_tags.md). The pzwiki also provides a list of every items (per full type) associated to tags here.

To create a custom tag, you have to first create its definition in your mod’s [registries](../../pzwiki/scripts/Registries.md). In the `registries.lua` file, define the following by renaming the various elements to fit your mod name, id etc:



```lua
YourModRegistry = {}
YourModRegistry.YOUR_TAG_NAME = ItemTag.register("yourmodid:yourtagname")
```



You can then use that tag `yourmodid:yourtagname` in your item definition. And you can use the stored ItemTag reference `YourModRegistry.YOUR_TAG_NAME` in your Lua code.

<a id="scripts-item-thirstchange"></a>

### ThirstChange

**Type:** float

When positive, the item being consumed will decrease the player’s thirst, with `100` the maximum amount of thirst of a player.

See also:

- [HungerChange](item.md#scripts-item-hungerchange)
- [UnhappyChange](item.md#scripts-item-unhappychange)
- [StressChange](item.md#scripts-item-stresschange)
- [BoredomChange](item.md#scripts-item-boredomchange)

<a id="scripts-item-ticksperequipuse"></a>

### ticksPerEquipUse

**Type:** integer

**Default:** `30`

No description provided.

<a id="scripts-item-tohitmodifier"></a>

### ToHitModifier

**Type:** float

**Deprecated:** {‘description’: ‘This parameter is not used by the base game.’}

**Default:** `1.0`

No description provided.

<a id="scripts-item-tooltip"></a>

### Tooltip

**Type:** translation

Defines the tooltip of the item. The value needs to be a translation key preferably in the [Tooltip.json](../translations/translation_files.md#tooltip) translation file. If the translation key doesn’t exist, the value will be used as the tooltip instead.

<a id="scripts-item-torchcone"></a>

### TorchCone

**Type:** Unknown

No description provided.

<a id="scripts-item-torchdot"></a>

### TorchDot

**Type:** float

**Default:** `0.96`

No description provided.

<a id="scripts-item-transmitrange"></a>

### TransmitRange

**Type:** Unknown

No description provided.

<a id="scripts-item-trap"></a>

### Trap

**Type:** boolean

**Default:** `False`

No description provided.

<a id="scripts-item-treedamage"></a>

### TreeDamage

**Type:** Unknown

No description provided.

<a id="scripts-item-triggerexplosiontimer"></a>

### triggerExplosionTimer

**Type:** Unknown

No description provided.

<a id="scripts-item-twohandweapon"></a>

### TwoHandWeapon

**Type:** boolean

[TwoHandWeapon](item.md#scripts-item-twohandweapon) marks the weapon as a two-handed weapon. [RecoilDelay](item.md#scripts-item-recoildelay) gets a x1.3 penalty when the weapon is held one-handed instead of two handed. [RequiresEquippedBothHands](item.md#scripts-item-requiresequippedbothhands) enforces the equip restriction in the context menu.

<a id="scripts-item-twoway"></a>

### TwoWay

**Type:** Unknown

No description provided.

<a id="scripts-item-type"></a>

### Type

**Type:** Unknown

**Deprecated:** {‘replacedBy’: ‘ItemType’, ‘version’: ‘42.13.0’}

Used to set the class of the item, which will influence parameters available.

<a id="scripts-item-unequipsound"></a>

### UnequipSound

**Type:** block (block: [sound](sound.md#scripts-sound))

No description provided.

<a id="scripts-item-unhappychange"></a>

### UnhappyChange

**Type:** float

When positive, the item being consumed will decrease the player’s unhappiness, with `100` the maximum amount of unhappiness of a player.

See also:

- [HungerChange](item.md#scripts-item-hungerchange)
- [ThirstChange](item.md#scripts-item-thirstchange)
- [StressChange](item.md#scripts-item-stresschange)
- [BoredomChange](item.md#scripts-item-boredomchange)

<a id="scripts-item-usedelta"></a>

### UseDelta

**Type:** float

**Default:** `0.03125`

Used to set the number of uses) for the item where its durability has a value of `1` when full and `0` when empty. For example, a [base:drainable](item.md#scripts-item-itemtype) item with a `UseDelta` of `0.03125` (the default value) will have 32 uses ($1/0.03125$) before it is depleted.

Additionally, a modder can determine how long a battery will last (as In-Game Hours) for a battery-powered device by using the following formula: `# of Hours = 1 / (useDelta * 6)`

When used for [Clothing items](item.md#scripts-item-itemtype), the `UseDelta` is used to indicate the amount of durability lost for oxygen tanks for items with the [ItemTag](../java/item_tags.md) `base:scba` or gas mask filters for items with the ItemTags `base:gasmask`, `base:respirator` or `base:improvisedgasmask`.

Some vanilla food items are using that parameter but it doesn’t seem to be used for those anywhere. There’s uses for it in the Java for Drainable, Weapon and Radio items, but it doesn’t seem to be limited to those.

<a id="scripts-item-useendurance"></a>

### UseEndurance

**Type:** boolean

**Default:** `True`

If `true`, the weapon will consume stamina on use based on the weapon [weight](item.md#scripts-item-weight), [EnduranceMod](item.md#scripts-item-endurancemod), fatigue modifiers and traits.

For guns, it is preferable to keep this as `False`.

<a id="scripts-item-useforpoison"></a>

### UseForPoison

**Type:** integer

**Default:** `0`

No description provided.

<a id="scripts-item-usesbattery"></a>

### UsesBattery

**Type:** Unknown

No description provided.

<a id="scripts-item-useself"></a>

### UseSelf

**Type:** Unknown

No description provided.

<a id="scripts-item-usewhileequipped"></a>

### UseWhileEquipped

**Type:** boolean

**Default:** `True`

No description provided.

<a id="scripts-item-usewhileunequipped"></a>

### UseWhileUnequipped

**Type:** Unknown

No description provided.

<a id="scripts-item-useworlditem"></a>

### UseWorldItem

**Type:** Unknown

No description provided.

<a id="scripts-item-vehiclepartmodel"></a>

### VehiclePartModel

**Type:** Unknown

No description provided.

<a id="scripts-item-vehicletype"></a>

### VehicleType

**Type:** Unknown

No description provided.

<a id="scripts-item-visionmodifier"></a>

### VisionModifier

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-visualaid"></a>

### VisualAid

**Type:** Unknown

No description provided.

<a id="scripts-item-waterresistance"></a>

### WaterResistance

**Type:** float

[WaterResistance](item.md#scripts-item-waterresistance) is used to define how much the clothing item will resist water. The higher the value, the more resistant the clothing item will be to water. A value of `1.0` means the clothing item is fully waterproof, while a value of `0.0` means it is not waterproof at all.

This is the exact same process for [WindResistance](item.md#scripts-item-windresistance) but for wind instead of water.

<a id="scripts-item-weaponhitarmoursound"></a>

### WeaponHitArmourSound

**Type:** Unknown

No description provided.

<a id="scripts-item-weaponlength"></a>

### WeaponLength

**Type:** float

**Default:** `0.4`

No description provided.

<a id="scripts-item-weaponreloadtype"></a>

### WeaponReloadType

**Type:** string

**Default:** `handgun`

Used to select the reload workflow of the gun. Notably affects rack-after-shot, insertion style and animations. The provided value references the [variable condition](../xml/animnode.md#m-conditions) `WeaponReloadType` in AnimNodes. The game has the following values available by default:

- `handgun`
- `shotgun`
- `boltactionnomag`
- `boltaction`
- `revolver`
- `doublebarrelshotgun`
- `doublebarrelshotgunsawn`

A custom `WeaponReloadType` can be used if the relevant animations and condition logic are properly set up in a custom AnimNode.

See also:

- [AmmoType](item.md#scripts-item-ammotype)
- [MagazineType](item.md#scripts-item-magazinetype)

<a id="scripts-item-weaponsprite"></a>

### WeaponSprite

**Type:** block (block: [model](model.md#scripts-model), with [module](module.md#scripts-module))

Defines the model of the weapon. If [StaticModel](item.md#scripts-item-staticmodel) is not provided, the static model will be WeaponSprite. You can also define variants of a weapon model by using [StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex).

See also:

- [StaticModel](item.md#scripts-item-staticmodel)
- [WorldStaticModel](item.md#scripts-item-worldstaticmodel)
- [StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex)

<a id="scripts-item-weaponspritesbyindex"></a>

### WeaponSpritesByIndex

**Type:** Unknown

No description provided.

<a id="scripts-item-weaponweight"></a>

### WeaponWeight

**Type:** float

**Default:** `1.0`

No description provided.

<a id="scripts-item-weight"></a>

### Weight

**Type:** float

**Default:** `1.0`

**Minimum:** `0.0`

[Weight](item.md#scripts-item-weight) sets the weight of the item, or more commonly refered to as a encumbrance. Weapon parts will impact the weight of the weapon when attached. Will also impact stamina drain when [UseEndurance](item.md#scripts-item-useendurance) is `true`. You need to make sure to add a translation#Display_name) to the item or the weight will not work in-game.

[WeightEmpty](item.md#scripts-item-weightempty) is used to set the weight of a drainable when it is empty.

[WeightWet](item.md#scripts-item-weightwet) is used to set the weight of a clothing item when it is wet. The weight of the clothing item will be interpolated between `Weight` and `WeightWet` based on the wetness) of the clothing item.

<a id="scripts-item-weightempty"></a>

### WeightEmpty

**Type:** Unknown

See parameter [Weight](item.md#scripts-item-weight).

<a id="scripts-item-weightmodifier"></a>

### WeightModifier

**Type:** float

No description provided.

<a id="scripts-item-weightreduction"></a>

### WeightReduction

**Type:** integer

**Minimum:** `0`

**Maximum:** `100`

Percentage of the total contained weight in the bag that will be reduced. If the bag’s content weights 10 and the reduction is 65, the bag content will only weight

<a id="scripts-item-weightwet"></a>

### WeightWet

**Type:** Unknown

See parameter [Weight](item.md#scripts-item-weight).

<a id="scripts-item-wet"></a>

### Wet

**Type:** boolean

[Wet](item.md#scripts-item-wet) marks the item as being wet. This is notably used for towels alongside the [WetCooldown](item.md#scripts-item-wetcooldown) which indicates how long the item will stay wet before drying out.

When the item is dry, it is another item marked with the parameter [ItemWhenDry](item.md#scripts-item-itemwhendry).

<a id="scripts-item-wetcooldown"></a>

### WetCooldown

**Type:** float

**Default:** `-1.0`

See parameter [Wet](item.md#scripts-item-wet).

<a id="scripts-item-wheelfriction"></a>

### wheelFriction

**Type:** Unknown

No description provided.

<a id="scripts-item-windresistance"></a>

### WindResistance

**Type:** Unknown

See parameter [WaterResistance](item.md#scripts-item-waterresistance).

<a id="scripts-item-withdrainable"></a>

### WithDrainable

**Type:** Unknown

No description provided.

<a id="scripts-item-withoutdrainable"></a>

### WithoutDrainable

**Type:** Unknown

No description provided.

<a id="scripts-item-worldobjectsprite"></a>

### WorldObjectSprite

**Type:** Unknown

No description provided.

<a id="scripts-item-worldrender"></a>

### WorldRender

**Type:** Unknown

No description provided.

<a id="scripts-item-worldstaticmodel"></a>

### WorldStaticModel

**Type:** block (block: [model](model.md#scripts-model), with [module](module.md#scripts-module))

See parameter [StaticModel](item.md#scripts-item-staticmodel).

<a id="scripts-item-worldstaticmodelsbyindex"></a>

### WorldStaticModelsByIndex

**Type:** array (array of string, separator: ‘;’)

See parameter [StaticModelsByIndex](item.md#scripts-item-staticmodelsbyindex).
