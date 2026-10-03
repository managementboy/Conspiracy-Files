[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.logic](package-summary.html)
2. [RecipeCodeOnCreate](RecipeCodeOnCreate.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [mysteryCans](#mysteryCans)
7. [Constructor Details](#constructor-detail)
   1. [RecipeCodeOnCreate()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [makeCoffee(CraftRecipeData, IsoGameCharacter)](#makeCoffee(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   2. [refillBlowTorch(CraftRecipeData, IsoGameCharacter)](#refillBlowTorch(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   3. [refillLighter(CraftRecipeData, IsoGameCharacter)](#refillLighter(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   4. [setEcruColor(CraftRecipeData, IsoGameCharacter)](#setEcruColor(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   5. [torchBatteryInsert(CraftRecipeData, IsoGameCharacter)](#torchBatteryInsert(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   6. [dismantleFlashlight(CraftRecipeData, IsoGameCharacter)](#dismantleFlashlight(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   7. [inheritColorFromMaterial(CraftRecipeData, IsoGameCharacter)](#inheritColorFromMaterial(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   8. [findInheritedColor(CraftRecipeData)](#findInheritedColor(zombie.entity.components.crafting.recipe.CraftRecipeData))
   9. [shotgunSawnoff(CraftRecipeData, IsoGameCharacter)](#shotgunSawnoff(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   10. [tryAttachPart(HandWeapon, WeaponPart, IsoGameCharacter)](#tryAttachPart(zombie.inventory.types.HandWeapon,zombie.inventory.types.WeaponPart,zombie.characters.IsoGameCharacter))
   11. [inheritFoodNameBowl(CraftRecipeData, IsoGameCharacter)](#inheritFoodNameBowl(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   12. [inheritFoodDisplayName(CraftRecipeData, IsoGameCharacter)](#inheritFoodDisplayName(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   13. [cutFish(CraftRecipeData, IsoGameCharacter)](#cutFish(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   14. [makeJar(CraftRecipeData, IsoGameCharacter)](#makeJar(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   15. [modifyLidCondition(CraftRecipeData, IsoGameCharacter)](#modifyLidCondition(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   16. [applyLidCondition(CraftRecipeData, IsoGameCharacter)](#applyLidCondition(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   17. [makeSushi(CraftRecipeData, IsoGameCharacter)](#makeSushi(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   18. [name\_muffins(CraftRecipeData, IsoGameCharacter)](#name_muffins(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   19. [cutSmallAnimal(CraftRecipeData, IsoGameCharacter)](#cutSmallAnimal(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   20. [createLogStack(CraftRecipeData, IsoGameCharacter)](#createLogStack(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   21. [splitLogStack(CraftRecipeData, IsoGameCharacter)](#splitLogStack(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   22. [dismantleMiscElectronics(CraftRecipeData, IsoGameCharacter)](#dismantleMiscElectronics(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   23. [fixFishingRope(CraftRecipeData, IsoGameCharacter)](#fixFishingRope(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   24. [makeOmelette(CraftRecipeData, IsoGameCharacter)](#makeOmelette(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   25. [copyFoodValuesFromList(CraftRecipeData, List)](#copyFoodValuesFromList(zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List))
   26. [dismantleElectronics(CraftRecipeData, IsoGameCharacter)](#dismantleElectronics(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   27. [dismantleRadioTwoWay(CraftRecipeData, IsoGameCharacter)](#dismantleRadioTwoWay(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   28. [dismantleRadio(CraftRecipeData, IsoGameCharacter)](#dismantleRadio(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   29. [getRadioBaseItems(IsoGameCharacter)](#getRadioBaseItems(zombie.characters.IsoGameCharacter))
   30. [dismantleRadioTV(CraftRecipeData, IsoGameCharacter)](#dismantleRadioTV(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   31. [getRandomRadioValue(float, float, int)](#getRandomRadioValue(float,float,int))
   32. [radioCraft(CraftRecipeData, IsoGameCharacter)](#radioCraft(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   33. [ripClothing(CraftRecipeData, IsoGameCharacter)](#ripClothing(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   34. [makeMilkFromPowder(CraftRecipeData, IsoGameCharacter)](#makeMilkFromPowder(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   35. [purifyWater(CraftRecipeData, IsoGameCharacter)](#purifyWater(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   36. [carveSpear(CraftRecipeData, IsoGameCharacter)](#carveSpear(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   37. [fireHardenSpear(CraftRecipeData, IsoGameCharacter)](#fireHardenSpear(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   38. [setRandomSpearCondition(IsoGameCharacter, InventoryItem, int)](#setRandomSpearCondition(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,int))
   39. [dismantleSpear(CraftRecipeData, IsoGameCharacter)](#dismantleSpear(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   40. [openCan(CraftRecipeData, IsoGameCharacter)](#openCan(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   41. [openMysteryCan(CraftRecipeData, IsoGameCharacter)](#openMysteryCan(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   42. [openMysteryCanKnife(CraftRecipeData, IsoGameCharacter)](#openMysteryCanKnife(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   43. [openWaterCan(CraftRecipeData, IsoGameCharacter)](#openWaterCan(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   44. [openWaterCanKnife(CraftRecipeData, IsoGameCharacter)](#openWaterCanKnife(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   45. [openDentedCan(CraftRecipeData, IsoGameCharacter)](#openDentedCan(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   46. [openDentedCanKnife(CraftRecipeData, IsoGameCharacter)](#openDentedCanKnife(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   47. [addToPack(CraftRecipeData, IsoGameCharacter)](#addToPack(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   48. [drawRandomCard(CraftRecipeData, IsoGameCharacter)](#drawRandomCard(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   49. [rollDice(CraftRecipeData, IsoGameCharacter)](#rollDice(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   50. [dismantleFishingNet(CraftRecipeData, IsoGameCharacter)](#dismantleFishingNet(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   51. [refillHurricaneLantern(CraftRecipeData, IsoGameCharacter)](#refillHurricaneLantern(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   52. [scratchTicket(CraftRecipeData, IsoGameCharacter)](#scratchTicket(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   53. [removeGasFilter(CraftRecipeData, IsoGameCharacter)](#removeGasFilter(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   54. [removeOxygenTank(CraftRecipeData, IsoGameCharacter)](#removeOxygenTank(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   55. [removeTankOrFilter(IsoGameCharacter, Clothing, DrainableComboItem, boolean)](#removeTankOrFilter(zombie.characters.IsoGameCharacter,zombie.inventory.types.Clothing,zombie.inventory.types.DrainableComboItem,boolean))
   56. [assignRagFilterLife(CraftRecipeData, IsoGameCharacter)](#assignRagFilterLife(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   57. [addGasFilter(CraftRecipeData, IsoGameCharacter)](#addGasFilter(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   58. [addOxygenTank(CraftRecipeData, IsoGameCharacter)](#addOxygenTank(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   59. [attachTankOrFilter(Clothing, InventoryItem, boolean)](#attachTankOrFilter(zombie.inventory.types.Clothing,zombie.inventory.InventoryItem,boolean))
   60. [scrapJewellery(CraftRecipeData, IsoGameCharacter)](#scrapJewellery(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   61. [replaceSawBlade(CraftRecipeData, IsoGameCharacter)](#replaceSawBlade(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   62. [minorCondition(CraftRecipeData, IsoGameCharacter)](#minorCondition(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   63. [sharpenBlade(CraftRecipeData, IsoGameCharacter)](#sharpenBlade(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   64. [sharpenBladeGrindstone(CraftRecipeData, IsoGameCharacter)](#sharpenBladeGrindstone(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   65. [sharpenBladeGeneric(CraftRecipeData, IsoGameCharacter, InventoryItem, int, InventoryItem)](#sharpenBladeGeneric(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,int,zombie.inventory.InventoryItem))
   66. [genericFixing(CraftRecipeData, IsoGameCharacter)](#genericFixing(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   67. [genericBetterFixing(CraftRecipeData, IsoGameCharacter)](#genericBetterFixing(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   68. [genericEvenBetterFixing(CraftRecipeData, IsoGameCharacter)](#genericEvenBetterFixing(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   69. [genericFixer(CraftRecipeData, IsoGameCharacter, int, InventoryItem)](#genericFixer(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter,int,zombie.inventory.InventoryItem))
   70. [sliceAnimalHead(CraftRecipeData, IsoGameCharacter)](#sliceAnimalHead(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   71. [cutChicken(CraftRecipeData, IsoGameCharacter)](#cutChicken(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   72. [placeInBox(CraftRecipeData, IsoGameCharacter)](#placeInBox(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   73. [unpackBox(CraftRecipeData, IsoGameCharacter)](#unpackBox(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   74. [placeItemTypeInBox(CraftRecipeData, IsoGameCharacter)](#placeItemTypeInBox(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   75. [unpackItemTypeFromBox(CraftRecipeData, IsoGameCharacter)](#unpackItemTypeFromBox(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   76. [knappFlake(CraftRecipeData, IsoGameCharacter)](#knappFlake(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   77. [slightlyMoreDurable(CraftRecipeData, IsoGameCharacter)](#slightlyMoreDurable(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   78. [untieHeadband(CraftRecipeData, IsoGameCharacter)](#untieHeadband(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   79. [smeltIronOrSteelSmall(CraftRecipeData, IsoGameCharacter)](#smeltIronOrSteelSmall(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   80. [smeltIronOrSteelMedium(CraftRecipeData, IsoGameCharacter)](#smeltIronOrSteelMedium(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   81. [smeltIronOrSteelMediumPlus(CraftRecipeData, IsoGameCharacter)](#smeltIronOrSteelMediumPlus(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   82. [smeltIronOrSteelLarge(CraftRecipeData, IsoGameCharacter)](#smeltIronOrSteelLarge(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   83. [smeltIronOrSteelIngot(CraftRecipeData, IsoGameCharacter)](#smeltIronOrSteelIngot(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   84. [smeltIronOrSteel(CraftRecipeData, IsoGameCharacter, int)](#smeltIronOrSteel(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter,int))
   85. [sewHideJacket(CraftRecipeData, IsoGameCharacter)](#sewHideJacket(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   86. [pickAramidThread(CraftRecipeData, IsoGameCharacter)](#pickAramidThread(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   87. [openAndEat(CraftRecipeData, IsoGameCharacter)](#openAndEat(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   88. [copyKey(CraftRecipeData, IsoGameCharacter)](#copyKey(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))
   89. [openMacAndCheese(CraftRecipeData, IsoGameCharacter)](#openMacAndCheese(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RecipeCodeOnCreate
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.logic.RecipeCodeHelper

zombie.scripting.logic.RecipeCodeOnCreate

---

public class RecipeCodeOnCreate
extends zombie.scripting.logic.RecipeCodeHelper

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.scripting.logic.RecipeCodeHelper

  `zombie.scripting.logic.RecipeCodeHelper.DateResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final List<ItemKey>`

  `mysteryCans`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecipeCodeOnCreate()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addGasFilter(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `addOxygenTank(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `addToPack(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `applyLidCondition(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `assignRagFilterLife(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `attachTankOrFilter(Clothing maskOrSuit,
  InventoryItem tankOrFilter,
  boolean isFilter)`

  `static void`

  `carveSpear(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `copyFoodValuesFromList(CraftRecipeData data,
  List<Food> foodList)`

  `static void`

  `copyKey(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `createLogStack(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `cutChicken(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `cutFish(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `cutSmallAnimal(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `dismantleElectronics(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `dismantleFishingNet(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `dismantleFlashlight(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `dismantleMiscElectronics(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `dismantleRadio(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `dismantleRadioTV(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `dismantleRadioTwoWay(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `dismantleSpear(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `drawRandomCard(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static Color`

  `findInheritedColor(CraftRecipeData data)`

  `static void`

  `fireHardenSpear(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `fixFishingRope(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `genericBetterFixing(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `genericEvenBetterFixing(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `genericFixer(CraftRecipeData data,
  IsoGameCharacter character,
  int factor,
  InventoryItem item)`

  `static void`

  `genericFixing(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `getRadioBaseItems(IsoGameCharacter character)`

  `private static float`

  `getRandomRadioValue(float valMin,
  float valMax,
  int perkLevel)`

  `static void`

  `inheritColorFromMaterial(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `inheritFoodDisplayName(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `inheritFoodNameBowl(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `knappFlake(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `makeCoffee(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `makeJar(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `makeMilkFromPowder(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `makeOmelette(CraftRecipeData data,
  IsoGameCharacter character)`

  Combine hunger/nutrition stats of both eggs for omelette.

  `static void`

  `makeSushi(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `minorCondition(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `modifyLidCondition(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `name_muffins(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openAndEat(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openCan(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openDentedCan(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openDentedCanKnife(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openMacAndCheese(CraftRecipeData data,
  IsoGameCharacter isoGameCharacter)`

  `static void`

  `openMysteryCan(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openMysteryCanKnife(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openWaterCan(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `openWaterCanKnife(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `pickAramidThread(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `placeInBox(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `placeItemTypeInBox(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `purifyWater(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `radioCraft(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `refillBlowTorch(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `refillHurricaneLantern(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `refillLighter(CraftRecipeData data,
  IsoGameCharacter character)`

  Fill entirely the lighter with the remaining lighter fluid

  `static void`

  `removeGasFilter(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `removeOxygenTank(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `removeTankOrFilter(IsoGameCharacter character,
  Clothing maskOrSuit,
  DrainableComboItem tankOrFilter,
  boolean isFilter)`

  `static void`

  `replaceSawBlade(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `ripClothing(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `rollDice(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `scrapJewellery(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `scratchTicket(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `setEcruColor(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `setRandomSpearCondition(IsoGameCharacter character,
  InventoryItem result,
  int defaultCond)`

  `static void`

  `sewHideJacket(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `sharpenBlade(CraftRecipeData data,
  IsoGameCharacter character)`

  Fully repair the blade or until it's broken or file/whetstone is broken

  `private static void`

  `sharpenBladeGeneric(CraftRecipeData data,
  IsoGameCharacter character,
  InventoryItem item,
  int damageChance,
  InventoryItem whestone)`

  `static void`

  `sharpenBladeGrindstone(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `shotgunSawnoff(CraftRecipeData data,
  IsoGameCharacter character)`

  Sawn-off recipe callback, copies modData to the new sawn-off.

  `static void`

  `sliceAnimalHead(CraftRecipeData data,
  IsoGameCharacter character)`

  If the head was rotten, we don't add brain

  `static void`

  `slightlyMoreDurable(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `smeltIronOrSteel(CraftRecipeData data,
  IsoGameCharacter character,
  int add)`

  `static void`

  `smeltIronOrSteelIngot(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `smeltIronOrSteelLarge(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `smeltIronOrSteelMedium(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `smeltIronOrSteelMediumPlus(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `smeltIronOrSteelSmall(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `splitLogStack(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `torchBatteryInsert(CraftRecipeData data,
  IsoGameCharacter character)`

  `private static void`

  `tryAttachPart(HandWeapon weapon,
  WeaponPart part,
  IsoGameCharacter player)`

  `static void`

  `unpackBox(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `unpackItemTypeFromBox(CraftRecipeData data,
  IsoGameCharacter character)`

  `static void`

  `untieHeadband(CraftRecipeData data,
  IsoGameCharacter character)`

  ### Methods inherited from class zombie.scripting.logic.RecipeCodeHelper

  `addItemToCharacterInventory, addItemToCharacterInventory, addItemToCharacterInventory, getConsumedItems, getConsumedItems, getConsumedItems, getCreatedItems, getCreatedItems, getInputItems, getKeepItems, getKeepItems, getKeepItems, nameNewspaper, removeItemFromCharacterInventory, removeItemFromCharacterInventory, removeItemFromCharacterInventory, scratchTicketWinner, setColor, setPrintMediaInfo`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### mysteryCans

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemKey](../objects/ItemKey.html "class in zombie.scripting.objects")> mysteryCans
* Constructor Details
  -------------------

  + ### RecipeCodeOnCreate

    public RecipeCodeOnCreate()
* Method Details
  --------------

  + ### makeCoffee

    public static void makeCoffee([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### refillBlowTorch

    public static void refillBlowTorch([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### refillLighter

    public static void refillLighter([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)

    Fill entirely the lighter with the remaining lighter fluid
  + ### setEcruColor

    public static void setEcruColor([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### torchBatteryInsert

    public static void torchBatteryInsert([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### dismantleFlashlight

    public static void dismantleFlashlight([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### inheritColorFromMaterial

    public static void inheritColorFromMaterial([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### findInheritedColor

    private static [Color](../../core/Color.html "class in zombie.core") findInheritedColor([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data)
  + ### shotgunSawnoff

    public static void shotgunSawnoff([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)

    Sawn-off recipe callback, copies modData to the new sawn-off.
  + ### tryAttachPart

    private static void tryAttachPart([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [WeaponPart](../../inventory/types/WeaponPart.html "class in zombie.inventory.types") part,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") player)
  + ### inheritFoodNameBowl

    public static void inheritFoodNameBowl([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### inheritFoodDisplayName

    public static void inheritFoodDisplayName([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### cutFish

    public static void cutFish([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### makeJar

    public static void makeJar([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### modifyLidCondition

    private static void modifyLidCondition([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### applyLidCondition

    public static void applyLidCondition([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### makeSushi

    public static void makeSushi([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### name\_muffins

    public static void name\_muffins([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### cutSmallAnimal

    public static void cutSmallAnimal([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### createLogStack

    public static void createLogStack([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### splitLogStack

    public static void splitLogStack([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### dismantleMiscElectronics

    public static void dismantleMiscElectronics([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### fixFishingRope

    public static void fixFishingRope([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### makeOmelette

    public static void makeOmelette([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)

    Combine hunger/nutrition stats of both eggs for omelette.
  + ### copyFoodValuesFromList

    private static void copyFoodValuesFromList([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Food](../../inventory/types/Food.html "class in zombie.inventory.types")> foodList)
  + ### dismantleElectronics

    public static void dismantleElectronics([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### dismantleRadioTwoWay

    private static void dismantleRadioTwoWay([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### dismantleRadio

    private static void dismantleRadio([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getRadioBaseItems

    private static void getRadioBaseItems([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### dismantleRadioTV

    private static void dismantleRadioTV([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getRandomRadioValue

    private static float getRandomRadioValue(float valMin,
    float valMax,
    int perkLevel)
  + ### radioCraft

    public static void radioCraft([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### ripClothing

    public static void ripClothing([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### makeMilkFromPowder

    public static void makeMilkFromPowder([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### purifyWater

    public static void purifyWater([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### carveSpear

    public static void carveSpear([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### fireHardenSpear

    public static void fireHardenSpear([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### setRandomSpearCondition

    private static void setRandomSpearCondition([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") result,
    int defaultCond)
  + ### dismantleSpear

    public static void dismantleSpear([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openCan

    public static void openCan([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openMysteryCan

    public static void openMysteryCan([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openMysteryCanKnife

    public static void openMysteryCanKnife([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openWaterCan

    public static void openWaterCan([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openWaterCanKnife

    public static void openWaterCanKnife([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openDentedCan

    public static void openDentedCan([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openDentedCanKnife

    public static void openDentedCanKnife([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### addToPack

    public static void addToPack([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### drawRandomCard

    public static void drawRandomCard([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### rollDice

    public static void rollDice([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### dismantleFishingNet

    public static void dismantleFishingNet([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### refillHurricaneLantern

    public static void refillHurricaneLantern([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### scratchTicket

    public static void scratchTicket([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### removeGasFilter

    public static void removeGasFilter([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### removeOxygenTank

    public static void removeOxygenTank([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### removeTankOrFilter

    private static void removeTankOrFilter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [Clothing](../../inventory/types/Clothing.html "class in zombie.inventory.types") maskOrSuit,
    [DrainableComboItem](../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") tankOrFilter,
    boolean isFilter)
  + ### assignRagFilterLife

    public static void assignRagFilterLife([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### addGasFilter

    public static void addGasFilter([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### addOxygenTank

    public static void addOxygenTank([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### attachTankOrFilter

    private static void attachTankOrFilter([Clothing](../../inventory/types/Clothing.html "class in zombie.inventory.types") maskOrSuit,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") tankOrFilter,
    boolean isFilter)
  + ### scrapJewellery

    public static void scrapJewellery([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### replaceSawBlade

    public static void replaceSawBlade([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### minorCondition

    public static void minorCondition([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### sharpenBlade

    public static void sharpenBlade([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)

    Fully repair the blade or until it's broken or file/whetstone is broken
  + ### sharpenBladeGrindstone

    public static void sharpenBladeGrindstone([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### sharpenBladeGeneric

    private static void sharpenBladeGeneric([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    int damageChance,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") whestone)
  + ### genericFixing

    public static void genericFixing([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### genericBetterFixing

    public static void genericBetterFixing([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### genericEvenBetterFixing

    public static void genericEvenBetterFixing([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### genericFixer

    private static void genericFixer([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    int factor,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### sliceAnimalHead

    public static void sliceAnimalHead([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)

    If the head was rotten, we don't add brain
  + ### cutChicken

    public static void cutChicken([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### placeInBox

    public static void placeInBox([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### unpackBox

    public static void unpackBox([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### placeItemTypeInBox

    public static void placeItemTypeInBox([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### unpackItemTypeFromBox

    public static void unpackItemTypeFromBox([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### knappFlake

    public static void knappFlake([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### slightlyMoreDurable

    public static void slightlyMoreDurable([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### untieHeadband

    public static void untieHeadband([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### smeltIronOrSteelSmall

    public static void smeltIronOrSteelSmall([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### smeltIronOrSteelMedium

    public static void smeltIronOrSteelMedium([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### smeltIronOrSteelMediumPlus

    public static void smeltIronOrSteelMediumPlus([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### smeltIronOrSteelLarge

    public static void smeltIronOrSteelLarge([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### smeltIronOrSteelIngot

    public static void smeltIronOrSteelIngot([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### smeltIronOrSteel

    private static void smeltIronOrSteel([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    int add)
  + ### sewHideJacket

    public static void sewHideJacket([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### pickAramidThread

    public static void pickAramidThread([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openAndEat

    public static void openAndEat([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### copyKey

    public static void copyKey([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### openMacAndCheese

    public static void openMacAndCheese([CraftRecipeData](../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)