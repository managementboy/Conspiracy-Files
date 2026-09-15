---
title: "Procedural distributions properties"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/mapping/procedural_distributions_properties.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/mapping/procedural_distributions_properties.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="procedural-distributions-properties"></a>

# Procedural distributions properties

Reference for all available properties that can be set on procedural distributions.

<a id="bags"></a>

<a id="procedural-distributions-property-bags"></a>

## bags

Unclear what this does.

<a id="canburn"></a>

<a id="procedural-distributions-property-canburn"></a>

## canBurn

Food cna be burnt (25% chance) or cooked.

<a id="cookfood"></a>

<a id="procedural-distributions-property-cookfood"></a>

## cookFood

No description available.

<a id="dontspawnammo"></a>

<a id="procedural-distributions-property-dontspawnammo"></a>

## dontSpawnAmmo

No description available.

<a id="fillrand"></a>

<a id="procedural-distributions-property-fillrand"></a>

## fillRand

No description available.

<a id="gunstorage"></a>

<a id="procedural-distributions-property-gunstorage"></a>

## gunStorage

No description available.

<a id="ignorezombiedensity"></a>

<a id="procedural-distributions-property-ignorezombiedensity"></a>

## ignoreZombieDensity

Ignores the zombie density impact on item spawn chance.

<a id="isrotten"></a>

<a id="procedural-distributions-property-isrotten"></a>

## isRotten

Non-rotten items will be rotten (75% chance) or have increased age (less fresh).

<a id="isshop"></a>

<a id="procedural-distributions-property-isshop"></a>

## isShop

When not set to true:

- Can be a stash (related to `stashChance`)
- DrainableComboItem get random amount of uses
- HandWeapon can have lower condition (40% chance)
- Items with head conditio nget reduced head condition (40% chance)
- Items with sharpness condition get reduced sharpness condition (40% chance)
- Bags get items inside them

<a id="istrash"></a>

<a id="procedural-distributions-property-istrash"></a>

## isTrash

items spawn with lower condition, delta etc:

- HandWeapon get reduced item condition
- Items with head condition get reduced head condition
- Items with sharpness condition get reduced head condition
- DrainiableComboItem get reduced item uses (i.e. batteries)
- Impact on non-canned and edible (non can’t eat) food:

  - Non-vermin, cookable and non-replacable on cooked will be either cooked or burnt (50% chance)
  - Non-rotten item will be rotten (75% chance) or have increased age (less fresh)
  - Have reduced food values

`isWorn` containers will have clothing items with reduced condition, can be dirty (25% chance), bloody (1% chance) and/or have holes (25% chance).

`isTrash` containers will have clothing items with reduced condition, can be wet (25% chance), dirty (95% chance), bloody (10% chance) and /or have holes (75% chance).

<a id="isworn"></a>

<a id="procedural-distributions-property-isworn"></a>

## isWorn

No description available.

<a id="items"></a>

<a id="procedural-distributions-property-items"></a>

## items

Holds the various items that will spawn in this procedural distribution list. The format should be as follow:



```lua
items = {
  "item1", roll_chance1,
  "item2", roll_chance2,
  "item3", roll_chance3,
  ...
}
```



<a id="junk"></a>

<a id="procedural-distributions-property-junk"></a>

## junk

No description available.

<a id="maxmap"></a>

<a id="procedural-distributions-property-maxmap"></a>

## maxMap

Integer value, limits the same item to a max amount (UNSURE).

<a id="noautoage"></a>

<a id="procedural-distributions-property-noautoage"></a>

## noAutoAge

No description available.

<a id="onlyone"></a>

<a id="procedural-distributions-property-onlyone"></a>

## onlyOne

Deprecated, a tag which can be found in distributions looks deprecated from the Java.

<a id="rolls"></a>

<a id="procedural-distributions-property-rolls"></a>

## rolls

Number of rolls to perform on the procedural distribution list. This roll amount is applied for each item entries of this procedural distribution list. So if there are 5 items and 2 rolls, the game will roll 2 times for each of the 5 items individually, so 10 rolls in total.

<a id="stashchance"></a>

<a id="procedural-distributions-property-stashchance"></a>

## stashchance

Chance for the container to be a stash.
