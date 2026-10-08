[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [ISWorldObjectContextMenuLogic](ISWorldObjectContextMenuLogic.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DIRECTIONS](#DIRECTIONS)
6. [Constructor Details](#constructor-detail)
   1. [ISWorldObjectContextMenuLogic()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [fetch(KahluaTable, IsoObject, double, boolean)](#fetch(se.krka.kahlua.vm.KahluaTable,zombie.iso.IsoObject,double,boolean))
   2. [getAllObjects(KahluaTable)](#getAllObjects(se.krka.kahlua.vm.KahluaTable))
   3. [getAllObjectOnSquare(IsoGridSquare, Set, Set, KahluaTable)](#getAllObjectOnSquare(zombie.iso.IsoGridSquare,java.util.Set,java.util.Set,se.krka.kahlua.vm.KahluaTable))
   4. [createMenuEntries(KahluaTable, KahluaTable, double, KahluaTable, int, int, boolean)](#createMenuEntries(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,double,se.krka.kahlua.vm.KahluaTable,int,int,boolean))
   5. [doDestroyMenu(KahluaTable, ItemContainer, ISContextMenuWrapper, IsoPlayer)](#doDestroyMenu(se.krka.kahlua.vm.KahluaTable,zombie.inventory.ItemContainer,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer))
   6. [doClickedPlayerMenu(KahluaTable, boolean, IsoPlayer, IsoPlayer, ISContextMenuWrapper)](#doClickedPlayerMenu(se.krka.kahlua.vm.KahluaTable,boolean,zombie.characters.IsoPlayer,zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   7. [doBurnBodyMenu(double, KahluaTable, boolean, ItemContainer, ISContextMenuWrapper, IsoDeadBody)](#doBurnBodyMenu(double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.inventory.ItemContainer,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.objects.IsoDeadBody))
   8. [doExtinguishFireMenu(KahluaTable, boolean, ISContextMenuWrapper, IsoGridSquare, InventoryItem, IsoPlayer)](#doExtinguishFireMenu(se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.IsoGridSquare,zombie.inventory.InventoryItem,zombie.characters.IsoPlayer))
   9. [doBuryCorpseMenu(double, boolean, IsoObject, ISContextMenuWrapper, IsoPlayer)](#doBuryCorpseMenu(double,boolean,zombie.iso.IsoObject,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer))
   10. [doWashClothingOrYourselfMenu(KahluaTable, double, KahluaTable, KahluaTable, KahluaTable, ISContextMenuWrapper, IsoClothingWasher, IsoCombinationWasherDryer, IsoPlayer)](#doWashClothingOrYourselfMenu(se.krka.kahlua.vm.KahluaTable,double,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.objects.IsoClothingWasher,zombie.iso.objects.IsoCombinationWasherDryer,zombie.characters.IsoPlayer))
   11. [doShovelAndRackMenu(double, KahluaTable, boolean, ISContextMenuWrapper, InventoryItem, InventoryItem, IsoPlayer, IsoObject)](#doShovelAndRackMenu(double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.inventory.InventoryItem,zombie.inventory.InventoryItem,zombie.characters.IsoPlayer,zombie.iso.IsoObject))
   12. [doTrapMenu(double, KahluaTable, boolean, ISContextMenuWrapper)](#doTrapMenu(double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   13. [doPadLockMenu(KahluaTable, double, KahluaTable, boolean, ItemContainer, ISContextMenuWrapper)](#doPadLockMenu(se.krka.kahlua.vm.KahluaTable,double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.inventory.ItemContainer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   14. [doWaterPipeMenu(double, KahluaTable, boolean, IsoObject, ISContextMenuWrapper, ItemContainer)](#doWaterPipeMenu(double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.iso.IsoObject,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.inventory.ItemContainer))
   15. [doFishingMenu(KahluaTable, KahluaTable, boolean, ISContextMenuWrapper, IsoPlayer, IsoGridSquare, double, ItemContainer)](#doFishingMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare,double,zombie.inventory.ItemContainer))
   16. [doBedMenu(double, boolean, ISContextMenuWrapper, IsoObject, IsoPlayer)](#doBedMenu(double,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.IsoObject,zombie.characters.IsoPlayer))
   17. [getBestWindowFrame(IsoPlayer)](#getBestWindowFrame(zombie.characters.IsoPlayer))
   18. [doThumpableWindowFrameMenu(KahluaTable, KahluaTable, boolean, ISContextMenuWrapper, double, boolean)](#doThumpableWindowFrameMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,double,boolean))
   19. [doThumpableMenu(IsoThumpable, double, KahluaTable, boolean, boolean, IsoPlayer, boolean, ISContextMenuWrapper)](#doThumpableMenu(zombie.iso.objects.IsoThumpable,double,se.krka.kahlua.vm.KahluaTable,boolean,boolean,zombie.characters.IsoPlayer,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   20. [doTreeMenu(KahluaTable, KahluaTable, KahluaTable, boolean, IsoPlayer, ItemContainer, ISContextMenuWrapper)](#doTreeMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.characters.IsoPlayer,zombie.inventory.ItemContainer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   21. [doFuelMenu(KahluaTable, KahluaTable, double, boolean, ISContextMenuWrapper)](#doFuelMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,double,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   22. [doPlayerMenu(KahluaTable, KahluaTable, boolean, IsoPlayer, ISContextMenuWrapper)](#doPlayerMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   23. [doCarBatteryMenu(KahluaTable, KahluaTable, KahluaTable, boolean, IsoPlayer, ItemContainer)](#doCarBatteryMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.characters.IsoPlayer,zombie.inventory.ItemContainer))
   24. [doCleaningMenu(KahluaTable, double, KahluaTable, boolean, IsoPlayer, ISContextMenuWrapper)](#doCleaningMenu(se.krka.kahlua.vm.KahluaTable,double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   25. [doGeneratorMenu(KahluaTable, double, KahluaTable, boolean, IsoPlayer, ISContextMenuWrapper, ItemContainer)](#doGeneratorMenu(se.krka.kahlua.vm.KahluaTable,double,se.krka.kahlua.vm.KahluaTable,boolean,zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.inventory.ItemContainer))
   26. [doDoorMenu(KahluaTable, KahluaTable, KahluaTable, boolean, ISContextMenuWrapper, IsoPlayer, boolean)](#doDoorMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,boolean))
   27. [doHoppableMenu(boolean, ISContextMenuWrapper, IsoObject, IsoPlayer)](#doHoppableMenu(boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.IsoObject,zombie.characters.IsoPlayer))
   28. [doWindowMenu(KahluaTable, KahluaTable, boolean, ISContextMenuWrapper, IsoWindow, boolean, IsoPlayer, boolean, boolean)](#doWindowMenu(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.objects.IsoWindow,boolean,zombie.characters.IsoPlayer,boolean,boolean))
   29. [doBarricadeMenu(BarricadeAble, IsoPlayer, ItemContainer, ISContextMenuWrapper)](#doBarricadeMenu(zombie.iso.objects.interfaces.BarricadeAble,zombie.characters.IsoPlayer,zombie.inventory.ItemContainer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   30. [doBarricadeOption(IsoPlayer, ISContextMenuWrapper, String, String, String)](#doBarricadeOption(zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper,java.lang.String,java.lang.String,java.lang.String))
   31. [doGardeningSubmenu(ISContextMenuWrapper, KahluaTable, IsoPlayer, KahluaTable, boolean)](#doGardeningSubmenu(zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable,boolean))
   32. [isGraveFilledIn(IsoObject)](#isGraveFilledIn(zombie.iso.IsoObject))
   33. [getFishingRod(IsoPlayer)](#getFishingRod(zombie.characters.IsoPlayer))
   34. [predicateFishingRodOrSpear(InventoryItem, IsoPlayer)](#predicateFishingRodOrSpear(zombie.inventory.InventoryItem,zombie.characters.IsoPlayer))
   35. [getFishingLure(IsoPlayer, InventoryItem)](#getFishingLure(zombie.characters.IsoPlayer,zombie.inventory.InventoryItem))
   36. [farmingSystem\_getLuaObjectOnSquare(IsoGridSquare)](#farmingSystem_getLuaObjectOnSquare(zombie.iso.IsoGridSquare))
   37. [getFarmingSystem()](#getFarmingSystem())
   38. [getDirtGravelSand(IsoGridSquare)](#getDirtGravelSand(zombie.iso.IsoGridSquare))
   39. [canCleanBlood(IsoPlayer, IsoGridSquare)](#canCleanBlood(zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare))
   40. [predicateCleaningLiquid(InventoryItem)](#predicateCleaningLiquid(zombie.inventory.InventoryItem))
   41. [canCleanGraffiti(IsoPlayer, IsoGridSquare)](#canCleanGraffiti(zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare))
   42. [predicateStoreFuel(InventoryItem)](#predicateStoreFuel(zombie.inventory.InventoryItem))
   43. [fetchPickupItems(KahluaTable, IsoObject, PropertyContainer, ItemContainer)](#fetchPickupItems(se.krka.kahlua.vm.KahluaTable,zombie.iso.IsoObject,zombie.core.properties.PropertyContainer,zombie.inventory.ItemContainer))
   44. [fetchThrowCorpseOver(IsoPlayer, KahluaTable, String)](#fetchThrowCorpseOver(zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable,java.lang.String))
   45. [compareType(String, InventoryItem)](#compareType(java.lang.String,zombie.inventory.InventoryItem))
   46. [compareType(String, String)](#compareType(java.lang.String,java.lang.String))
   47. [addToolTip()](#addToolTip())
   48. [isForceDropHeavyItem(InventoryItem)](#isForceDropHeavyItem(zombie.inventory.InventoryItem))
   49. [getSquaresInRadius(float, float, float, float, KahluaTable, KahluaTable)](#getSquaresInRadius(float,float,float,float,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable))
   50. [getWorldObjectsInRadius(int, int, int, KahluaTable, float, KahluaTable)](#getWorldObjectsInRadius(int,int,int,se.krka.kahlua.vm.KahluaTable,float,se.krka.kahlua.vm.KahluaTable))
   51. [handleInteraction(int, int, boolean, ISContextMenuWrapper, KahluaTable, IsoPlayer, ItemContainer)](#handleInteraction(int,int,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer,zombie.inventory.ItemContainer))
   52. [handleGrabWorldItem(KahluaTable, int, int, boolean, ISContextMenuWrapper, KahluaTable, IsoPlayer, ItemContainer)](#handleGrabWorldItem(se.krka.kahlua.vm.KahluaTable,int,int,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer,zombie.inventory.ItemContainer))
   53. [handleGrabCorpseSubmenu(KahluaTable, IsoPlayer, KahluaTable, ISContextMenuWrapper, boolean)](#handleGrabCorpseSubmenu(se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable,zombie.ui.ISUIWrapper.ISContextMenuWrapper,boolean))
   54. [addGrabCorpseSubmenuOption(KahluaTable, ISContextMenuWrapper, IsoDeadBody, double)](#addGrabCorpseSubmenuOption(se.krka.kahlua.vm.KahluaTable,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.objects.IsoDeadBody,double))
   55. [prePickupGroundCoverItem(ISContextMenuWrapper, KahluaTable, double, IsoObject)](#prePickupGroundCoverItem(zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable,double,zombie.iso.IsoObject))
   56. [ISEmptyGraves\_canDigHere(KahluaTable)](#ISEmptyGraves_canDigHere(se.krka.kahlua.vm.KahluaTable))
   57. [isGraveFullOfCorpses(IsoObject)](#isGraveFullOfCorpses(zombie.iso.IsoObject))
   58. [getMoveableDisplayName(IsoObject)](#getMoveableDisplayName(zombie.iso.IsoObject))
   59. [doFishNetOptions(ISContextMenuWrapper, IsoPlayer, IsoGridSquare)](#doFishNetOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare))
   60. [doPlacedFishNetOptions(ISContextMenuWrapper, IsoPlayer, IsoObject)](#doPlacedFishNetOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,zombie.iso.IsoObject))
   61. [doChumOptions(ISContextMenuWrapper, IsoPlayer, IsoGridSquare)](#doChumOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare))
   62. [doCreateChumOptions(ISContextMenuWrapper, IsoPlayer, IsoGridSquare)](#doCreateChumOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,zombie.iso.IsoGridSquare))
   63. [isSomethingTo(IsoObject, IsoPlayer)](#isSomethingTo(zombie.iso.IsoObject,zombie.characters.IsoPlayer))
   64. [doSleepOption(ISContextMenuWrapper, IsoObject, double, IsoPlayer)](#doSleepOption(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.IsoObject,double,zombie.characters.IsoPlayer))
   65. [getBedQuality(IsoPlayer, IsoObject)](#getBedQuality(zombie.characters.IsoPlayer,zombie.iso.IsoObject))
   66. [doFluidContainerMenu(ISContextMenuWrapper, IsoObject, double, IsoPlayer, KahluaTable)](#doFluidContainerMenu(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.IsoObject,double,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable))
   67. [addFluidFromItem(KahluaTable, boolean, ISContextMenuWrapper, IsoObject, KahluaTable, IsoPlayer, ItemContainer)](#addFluidFromItem(se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.IsoObject,se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer,zombie.inventory.ItemContainer))
   68. [formatWaterAmount(IsoObject, float, float)](#formatWaterAmount(zombie.iso.IsoObject,float,float))
   69. [doDrinkWaterMenu(IsoObject, double, IsoPlayer, KahluaTable, ISContextMenuWrapper)](#doDrinkWaterMenu(zombie.iso.IsoObject,double,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   70. [doFillFluidMenu(IsoObject, double, IsoPlayer, KahluaTable, ISContextMenuWrapper)](#doFillFluidMenu(zombie.iso.IsoObject,double,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   71. [createWaterSourceTooltip(IsoObject)](#createWaterSourceTooltip(zombie.iso.IsoObject))
   72. [setWashClothingTooltip(double, double, double, double, KahluaTable, KahluaTable)](#setWashClothingTooltip(double,double,double,double,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable))
   73. [doWashClothingMenu(IsoObject, double, IsoPlayer, ISContextMenuWrapper)](#doWashClothingMenu(zombie.iso.IsoObject,double,zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   74. [CleanBandages\_getAvailableItems(KahluaTable, IsoPlayer, String, String)](#CleanBandages_getAvailableItems(se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   75. [doRecipeUsingWaterMenu(IsoObject, IsoPlayer, ISContextMenuWrapper)](#doRecipeUsingWaterMenu(zombie.iso.IsoObject,zombie.characters.IsoPlayer,zombie.ui.ISUIWrapper.ISContextMenuWrapper))
   76. [toggleClothingWasher(ISContextMenuWrapper, KahluaTable, double, IsoPlayer, IsoClothingWasher)](#toggleClothingWasher(zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable,double,zombie.characters.IsoPlayer,zombie.iso.objects.IsoClothingWasher))
   77. [toggleComboWasherDryer(ISContextMenuWrapper, IsoPlayer, IsoCombinationWasherDryer, boolean)](#toggleComboWasherDryer(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.characters.IsoPlayer,zombie.iso.objects.IsoCombinationWasherDryer,boolean))
   78. [toggleClothingDryer(ISContextMenuWrapper, double, IsoPlayer, KahluaTable, IsoClothingDryer)](#toggleClothingDryer(zombie.ui.ISUIWrapper.ISContextMenuWrapper,double,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable,zombie.iso.objects.IsoClothingDryer))
   79. [onWashingDryer(String, ISContextMenuWrapper, IsoClothingDryer, IsoPlayer, KahluaTable)](#onWashingDryer(java.lang.String,zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.iso.objects.IsoClothingDryer,zombie.characters.IsoPlayer,se.krka.kahlua.vm.KahluaTable))
   80. [doStoveOption(KahluaTable, boolean, ISContextMenuWrapper, double, IsoPlayer)](#doStoveOption(se.krka.kahlua.vm.KahluaTable,boolean,zombie.ui.ISUIWrapper.ISContextMenuWrapper,double,zombie.characters.IsoPlayer))
   81. [checkBlowTorchForBarricade(IsoPlayer)](#checkBlowTorchForBarricade(zombie.characters.IsoPlayer))
   82. [addTileDebugInfo(ISContextMenuWrapper, KahluaTable)](#addTileDebugInfo(zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable))
   83. [doContextConfigOptionsFromFetch(ISContextMenuWrapper, KahluaTable, IsoPlayer)](#doContextConfigOptionsFromFetch(zombie.ui.ISUIWrapper.ISContextMenuWrapper,se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoPlayer))
   84. [doContextConfigOptions(ISContextMenuWrapper, GameEntity, IsoPlayer)](#doContextConfigOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper,zombie.entity.GameEntity,zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ISWorldObjectContextMenuLogic
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.ISWorldObjectContextMenuLogic

---

public class ISWorldObjectContextMenuLogic
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final IsoDirections[]`

  `DIRECTIONS`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ISWorldObjectContextMenuLogic()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `addFluidFromItem(se.krka.kahlua.vm.KahluaTable fetch,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoObject pourFluidInto,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  IsoPlayer playerObj,
  ItemContainer playerInv)`

  `private static void`

  `addGrabCorpseSubmenuOption(se.krka.kahlua.vm.KahluaTable worldobjects,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper subMenuGrab,
  IsoDeadBody corpse,
  double player)`

  `private static void`

  `addTileDebugInfo(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  se.krka.kahlua.vm.KahluaTable fetch)`

  `private static zombie.ui.ISUIWrapper.ISToolTipWrapper`

  `addToolTip()`

  `private static boolean`

  `canCleanBlood(IsoPlayer playerObj,
  IsoGridSquare square)`

  `private static boolean`

  `canCleanGraffiti(IsoPlayer playerObj,
  IsoGridSquare square)`

  `static boolean`

  `checkBlowTorchForBarricade(IsoPlayer chr)`

  `private static void`

  `CleanBandages_getAvailableItems(se.krka.kahlua.vm.KahluaTable items,
  IsoPlayer playerObj,
  String recipeName,
  String itemType)`

  `private static boolean`

  `compareType(String type1,
  String type2)`

  `private static boolean`

  `compareType(String type,
  InventoryItem item)`

  `static boolean`

  `createMenuEntries(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable context,
  double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  int x,
  int y,
  boolean test)`

  `private static zombie.ui.ISUIWrapper.ISToolTipWrapper`

  `createWaterSourceTooltip(IsoObject sink)`

  `private static void`

  `doBarricadeMenu(BarricadeAble barricadeAble,
  IsoPlayer playerObj,
  ItemContainer playerInv,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static void`

  `doBarricadeOption(IsoPlayer playerObj,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  String tile,
  String itemIcon,
  String optionName)`

  `private static boolean`

  `doBedMenu(double player,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoObject bed,
  IsoPlayer playerObj)`

  `private static boolean`

  `doBurnBodyMenu(double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  ItemContainer playerInv,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoDeadBody body)`

  `private static boolean`

  `doBuryCorpseMenu(double player,
  boolean test,
  IsoObject graves,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoPlayer playerObj)`

  `private static boolean`

  `doCarBatteryMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoPlayer playerObj,
  ItemContainer playerInv)`

  `private static void`

  `doChumOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoPlayer playerObj,
  IsoGridSquare square)`

  `private static boolean`

  `doCleaningMenu(se.krka.kahlua.vm.KahluaTable fetch,
  double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoPlayer playerObj,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static boolean`

  `doClickedPlayerMenu(se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoPlayer playerObj,
  IsoPlayer clickedPlayer,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static void`

  `doContextConfigOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  GameEntity entity,
  IsoPlayer playerObj)`

  `private static void`

  `doContextConfigOptionsFromFetch(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  se.krka.kahlua.vm.KahluaTable fetch,
  IsoPlayer playerObj)`

  `private static void`

  `doCreateChumOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoPlayer playerObj,
  IsoGridSquare square)`

  `private static void`

  `doDestroyMenu(se.krka.kahlua.vm.KahluaTable worldobjects,
  ItemContainer playerInv,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoPlayer playerObj)`

  `private static zombie.ui.ISUIWrapper.ISContextMenuWrapper`

  `doDoorMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoPlayer playerObj,
  boolean hasRemoveBarricadeTool)`

  `private static void`

  `doDrinkWaterMenu(IsoObject object,
  double player,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context)`

  `private static boolean`

  `doExtinguishFireMenu(se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoGridSquare firetile,
  InventoryItem extinguisher,
  IsoPlayer playerObj)`

  `private static void`

  `doFillFluidMenu(IsoObject sink,
  double playerNum,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context)`

  `private static boolean`

  `doFishingMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoPlayer playerObj,
  IsoGridSquare clickedSquare,
  double player,
  ItemContainer playerInv)`

  `private static void`

  `doFishNetOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoPlayer playerObj,
  IsoGridSquare square)`

  `private static zombie.ui.ISUIWrapper.ISContextMenuWrapper`

  `doFluidContainerMenu(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoObject object,
  double player,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable worldObjects)`

  `private static boolean`

  `doFuelMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable context,
  double player,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static void`

  `doGardeningSubmenu(zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  se.krka.kahlua.vm.KahluaTable worldObjects,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable fetch,
  boolean test)`

  `private static boolean`

  `doGeneratorMenu(se.krka.kahlua.vm.KahluaTable fetch,
  double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoPlayer playerObj,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  ItemContainer playerInv)`

  `private static boolean`

  `doHoppableMenu(boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoObject hoppable,
  IsoPlayer playerObj)`

  `private static boolean`

  `doPadLockMenu(se.krka.kahlua.vm.KahluaTable fetch,
  double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  ItemContainer playerInv,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static void`

  `doPlacedFishNetOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoPlayer playerObj,
  IsoObject trapFish)`

  `private static boolean`

  `doPlayerMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoPlayer playerObj,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static void`

  `doRecipeUsingWaterMenu(IsoObject waterObject,
  IsoPlayer playerObj,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context)`

  `private static boolean`

  `doShovelAndRackMenu(double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  InventoryItem shovel,
  InventoryItem rakedung,
  IsoPlayer playerObj,
  IsoObject graves)`

  `private static void`

  `doSleepOption(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoObject bed,
  double player,
  IsoPlayer playerObj)`

  `private static boolean`

  `doStoveOption(se.krka.kahlua.vm.KahluaTable fetch,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  double player,
  IsoPlayer playerObj)`

  `private static boolean`

  `doThumpableMenu(IsoThumpable thump,
  double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  boolean invincibleWindow,
  IsoPlayer playerObj,
  boolean hasRemoveBarricadeTool,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static boolean`

  `doThumpableWindowFrameMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  double player,
  boolean hasRemoveBarricadeTool)`

  `private static boolean`

  `doTrapMenu(double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static boolean`

  `doTreeMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoPlayer playerObj,
  ItemContainer playerInv,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)`

  `private static void`

  `doWashClothingMenu(IsoObject sink,
  double player,
  IsoPlayer playerObj,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context)`

  `private static boolean`

  `doWashClothingOrYourselfMenu(se.krka.kahlua.vm.KahluaTable fetch,
  double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  se.krka.kahlua.vm.KahluaTable fetchStoreWater,
  se.krka.kahlua.vm.KahluaTable fluidcontainer,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoClothingWasher clothingWasher,
  IsoCombinationWasherDryer comboWasherDryer,
  IsoPlayer playerObj)`

  `private static boolean`

  `doWaterPipeMenu(double player,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  boolean test,
  IsoObject canBeWaterPiped,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  ItemContainer playerInv)`

  `private static zombie.ui.ISUIWrapper.ISContextMenuWrapper`

  `doWindowMenu(se.krka.kahlua.vm.KahluaTable fetch,
  se.krka.kahlua.vm.KahluaTable worldObjects,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
  IsoWindow window,
  boolean invincibleWindow,
  IsoPlayer playerObj,
  boolean hasRemoveBarricadeTool,
  boolean hasHammer)`

  `private static se.krka.kahlua.vm.KahluaTable`

  `farmingSystem_getLuaObjectOnSquare(IsoGridSquare square)`

  `static void`

  `fetch(se.krka.kahlua.vm.KahluaTable fetch,
  IsoObject v,
  double player,
  boolean doSquare)`

  `private static void`

  `fetchPickupItems(se.krka.kahlua.vm.KahluaTable fetch,
  IsoObject v,
  PropertyContainer props,
  ItemContainer playerInv)`

  `private static void`

  `fetchThrowCorpseOver(IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable fetch,
  String key)`

  `private static String`

  `formatWaterAmount(IsoObject object,
  float amount,
  float max)`

  `private static void`

  `getAllObjectOnSquare(IsoGridSquare square,
  Set<IsoGridSquare> doneSquares,
  Set<IsoObject> doneObjects,
  se.krka.kahlua.vm.KahluaTable worldobjects)`

  `private static se.krka.kahlua.vm.KahluaTable`

  `getAllObjects(se.krka.kahlua.vm.KahluaTable worldobjects)`

  `private static String`

  `getBedQuality(IsoPlayer playerObj,
  IsoObject bed)`

  `private static IsoObject`

  `getBestWindowFrame(IsoPlayer playerObj)`

  `private static se.krka.kahlua.vm.KahluaTable`

  `getDirtGravelSand(IsoGridSquare square)`

  `private static CGlobalObjectSystem`

  `getFarmingSystem()`

  `private static Object`

  `getFishingLure(IsoPlayer player,
  InventoryItem rod)`

  `private static InventoryItem`

  `getFishingRod(IsoPlayer playerObj)`

  `private static String`

  `getMoveableDisplayName(IsoObject obj)`

  `private static void`

  `getSquaresInRadius(float worldX,
  float worldY,
  float worldZ,
  float radius,
  se.krka.kahlua.vm.KahluaTable doneSquares,
  se.krka.kahlua.vm.KahluaTable squares)`

  `private static void`

  `getWorldObjectsInRadius(int playerNum,
  int screenX,
  int screenY,
  se.krka.kahlua.vm.KahluaTable squares,
  float radius,
  se.krka.kahlua.vm.KahluaTable worldObjects)`

  `private static boolean`

  `handleGrabCorpseSubmenu(se.krka.kahlua.vm.KahluaTable fetch,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper subMenuGrab,
  boolean test)`

  `private static boolean`

  `handleGrabWorldItem(se.krka.kahlua.vm.KahluaTable fetch,
  int x,
  int y,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  IsoPlayer playerObj,
  ItemContainer playerInv)`

  `private static boolean`

  `handleInteraction(int x,
  int y,
  boolean test,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  IsoPlayer playerObj,
  ItemContainer playerInv)`

  `private static boolean`

  `ISEmptyGraves_canDigHere(se.krka.kahlua.vm.KahluaTable worldObjects)`

  `private static boolean`

  `isForceDropHeavyItem(InventoryItem item)`

  `private static boolean`

  `isGraveFilledIn(IsoObject grave)`

  `private static boolean`

  `isGraveFullOfCorpses(IsoObject grave)`

  `private static boolean`

  `isSomethingTo(IsoObject item,
  IsoPlayer playerObj)`

  `private static boolean`

  `onWashingDryer(String source,
  zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoClothingDryer object,
  IsoPlayer player,
  se.krka.kahlua.vm.KahluaTable worldobjects)`

  `private static boolean`

  `predicateCleaningLiquid(InventoryItem item)`

  `private static boolean`

  `predicateFishingRodOrSpear(InventoryItem item,
  IsoPlayer playerObj)`

  `private static boolean`

  `predicateStoreFuel(InventoryItem item)`

  `private static void`

  `prePickupGroundCoverItem(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  double player,
  IsoObject pickupItem)`

  `private static void`

  `setWashClothingTooltip(double soapRemaining,
  double waterRemaining,
  double soapRequired,
  double waterRequired,
  se.krka.kahlua.vm.KahluaTable washList,
  se.krka.kahlua.vm.KahluaTable option)`

  `private static boolean`

  `toggleClothingDryer(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  double playerId,
  IsoPlayer playerObj,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  IsoClothingDryer object)`

  `private static boolean`

  `toggleClothingWasher(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  se.krka.kahlua.vm.KahluaTable worldobjects,
  double playerId,
  IsoPlayer playerObj,
  IsoClothingWasher object)`

  `private static boolean`

  `toggleComboWasherDryer(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
  IsoPlayer playerObj,
  IsoCombinationWasherDryer object,
  boolean bAddObjectSubmenu)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DIRECTIONS

    private static final [IsoDirections](IsoDirections.html "enum class in zombie.iso")[] DIRECTIONS
* Constructor Details
  -------------------

  + ### ISWorldObjectContextMenuLogic

    public ISWorldObjectContextMenuLogic()
* Method Details
  --------------

  + ### fetch

    public static void fetch(se.krka.kahlua.vm.KahluaTable fetch,
    [IsoObject](IsoObject.html "class in zombie.iso") v,
    double player,
    boolean doSquare)
  + ### getAllObjects

    private static se.krka.kahlua.vm.KahluaTable getAllObjects(se.krka.kahlua.vm.KahluaTable worldobjects)
  + ### getAllObjectOnSquare

    private static void getAllObjectOnSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> doneSquares,
    [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> doneObjects,
    se.krka.kahlua.vm.KahluaTable worldobjects)
  + ### createMenuEntries

    public static boolean createMenuEntries(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable context,
    double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    int x,
    int y,
    boolean test)
  + ### doDestroyMenu

    private static void doDestroyMenu(se.krka.kahlua.vm.KahluaTable worldobjects,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doClickedPlayerMenu

    private static boolean doClickedPlayerMenu(se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") clickedPlayer,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doBurnBodyMenu

    private static boolean doBurnBodyMenu(double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") body)
  + ### doExtinguishFireMenu

    private static boolean doExtinguishFireMenu(se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") firetile,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") extinguisher,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doBuryCorpseMenu

    private static boolean doBuryCorpseMenu(double player,
    boolean test,
    [IsoObject](IsoObject.html "class in zombie.iso") graves,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doWashClothingOrYourselfMenu

    private static boolean doWashClothingOrYourselfMenu(se.krka.kahlua.vm.KahluaTable fetch,
    double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    se.krka.kahlua.vm.KahluaTable fetchStoreWater,
    se.krka.kahlua.vm.KahluaTable fluidcontainer,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoClothingWasher](objects/IsoClothingWasher.html "class in zombie.iso.objects") clothingWasher,
    [IsoCombinationWasherDryer](objects/IsoCombinationWasherDryer.html "class in zombie.iso.objects") comboWasherDryer,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doShovelAndRackMenu

    private static boolean doShovelAndRackMenu(double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") shovel,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") rakedung,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoObject](IsoObject.html "class in zombie.iso") graves)
  + ### doTrapMenu

    private static boolean doTrapMenu(double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doPadLockMenu

    private static boolean doPadLockMenu(se.krka.kahlua.vm.KahluaTable fetch,
    double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doWaterPipeMenu

    private static boolean doWaterPipeMenu(double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoObject](IsoObject.html "class in zombie.iso") canBeWaterPiped,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### doFishingMenu

    private static boolean doFishingMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") clickedSquare,
    double player,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### doBedMenu

    private static boolean doBedMenu(double player,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoObject](IsoObject.html "class in zombie.iso") bed,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### getBestWindowFrame

    private static [IsoObject](IsoObject.html "class in zombie.iso") getBestWindowFrame([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doThumpableWindowFrameMenu

    private static boolean doThumpableWindowFrameMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    double player,
    boolean hasRemoveBarricadeTool)
  + ### doThumpableMenu

    private static boolean doThumpableMenu([IsoThumpable](objects/IsoThumpable.html "class in zombie.iso.objects") thump,
    double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    boolean invincibleWindow,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    boolean hasRemoveBarricadeTool,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doTreeMenu

    private static boolean doTreeMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doFuelMenu

    private static boolean doFuelMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable context,
    double player,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doPlayerMenu

    private static boolean doPlayerMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doCarBatteryMenu

    private static boolean doCarBatteryMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### doCleaningMenu

    private static boolean doCleaningMenu(se.krka.kahlua.vm.KahluaTable fetch,
    double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doGeneratorMenu

    private static boolean doGeneratorMenu(se.krka.kahlua.vm.KahluaTable fetch,
    double player,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### doDoorMenu

    private static zombie.ui.ISUIWrapper.ISContextMenuWrapper doDoorMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    boolean hasRemoveBarricadeTool)
  + ### doHoppableMenu

    private static boolean doHoppableMenu(boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoObject](IsoObject.html "class in zombie.iso") hoppable,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doWindowMenu

    private static zombie.ui.ISUIWrapper.ISContextMenuWrapper doWindowMenu(se.krka.kahlua.vm.KahluaTable fetch,
    se.krka.kahlua.vm.KahluaTable worldObjects,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [IsoWindow](objects/IsoWindow.html "class in zombie.iso.objects") window,
    boolean invincibleWindow,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    boolean hasRemoveBarricadeTool,
    boolean hasHammer)
  + ### doBarricadeMenu

    private static void doBarricadeMenu([BarricadeAble](objects/interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces") barricadeAble,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper)
  + ### doBarricadeOption

    private static void doBarricadeOption([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemIcon,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") optionName)
  + ### doGardeningSubmenu

    private static void doGardeningSubmenu(zombie.ui.ISUIWrapper.ISContextMenuWrapper contextWrapper,
    se.krka.kahlua.vm.KahluaTable worldObjects,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable fetch,
    boolean test)
  + ### isGraveFilledIn

    private static boolean isGraveFilledIn([IsoObject](IsoObject.html "class in zombie.iso") grave)
  + ### getFishingRod

    private static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getFishingRod([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### predicateFishingRodOrSpear

    private static boolean predicateFishingRodOrSpear([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### getFishingLure

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getFishingLure([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") rod)
  + ### farmingSystem\_getLuaObjectOnSquare

    private static se.krka.kahlua.vm.KahluaTable farmingSystem\_getLuaObjectOnSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getFarmingSystem

    private static [CGlobalObjectSystem](../globalObjects/CGlobalObjectSystem.html "class in zombie.globalObjects") getFarmingSystem()
  + ### getDirtGravelSand

    private static se.krka.kahlua.vm.KahluaTable getDirtGravelSand([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### canCleanBlood

    private static boolean canCleanBlood([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### predicateCleaningLiquid

    private static boolean predicateCleaningLiquid([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canCleanGraffiti

    private static boolean canCleanGraffiti([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### predicateStoreFuel

    private static boolean predicateStoreFuel([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### fetchPickupItems

    private static void fetchPickupItems(se.krka.kahlua.vm.KahluaTable fetch,
    [IsoObject](IsoObject.html "class in zombie.iso") v,
    [PropertyContainer](../core/properties/PropertyContainer.html "class in zombie.core.properties") props,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### fetchThrowCorpseOver

    private static void fetchThrowCorpseOver([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable fetch,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### compareType

    private static boolean compareType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### compareType

    private static boolean compareType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type1,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type2)
  + ### addToolTip

    private static zombie.ui.ISUIWrapper.ISToolTipWrapper addToolTip()
  + ### isForceDropHeavyItem

    private static boolean isForceDropHeavyItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getSquaresInRadius

    private static void getSquaresInRadius(float worldX,
    float worldY,
    float worldZ,
    float radius,
    se.krka.kahlua.vm.KahluaTable doneSquares,
    se.krka.kahlua.vm.KahluaTable squares)
  + ### getWorldObjectsInRadius

    private static void getWorldObjectsInRadius(int playerNum,
    int screenX,
    int screenY,
    se.krka.kahlua.vm.KahluaTable squares,
    float radius,
    se.krka.kahlua.vm.KahluaTable worldObjects)
  + ### handleInteraction

    private static boolean handleInteraction(int x,
    int y,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### handleGrabWorldItem

    private static boolean handleGrabWorldItem(se.krka.kahlua.vm.KahluaTable fetch,
    int x,
    int y,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### handleGrabCorpseSubmenu

    private static boolean handleGrabCorpseSubmenu(se.krka.kahlua.vm.KahluaTable fetch,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper subMenuGrab,
    boolean test)
  + ### addGrabCorpseSubmenuOption

    private static void addGrabCorpseSubmenuOption(se.krka.kahlua.vm.KahluaTable worldobjects,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper subMenuGrab,
    [IsoDeadBody](objects/IsoDeadBody.html "class in zombie.iso.objects") corpse,
    double player)
  + ### prePickupGroundCoverItem

    private static void prePickupGroundCoverItem(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    double player,
    [IsoObject](IsoObject.html "class in zombie.iso") pickupItem)
  + ### ISEmptyGraves\_canDigHere

    private static boolean ISEmptyGraves\_canDigHere(se.krka.kahlua.vm.KahluaTable worldObjects)
  + ### isGraveFullOfCorpses

    private static boolean isGraveFullOfCorpses([IsoObject](IsoObject.html "class in zombie.iso") grave)
  + ### getMoveableDisplayName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMoveableDisplayName([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### doFishNetOptions

    private static void doFishNetOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### doPlacedFishNetOptions

    private static void doPlacedFishNetOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoObject](IsoObject.html "class in zombie.iso") trapFish)
  + ### doChumOptions

    private static void doChumOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### doCreateChumOptions

    private static void doCreateChumOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### isSomethingTo

    private static boolean isSomethingTo([IsoObject](IsoObject.html "class in zombie.iso") item,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doSleepOption

    private static void doSleepOption(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoObject](IsoObject.html "class in zombie.iso") bed,
    double player,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### getBedQuality

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBedQuality([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoObject](IsoObject.html "class in zombie.iso") bed)
  + ### doFluidContainerMenu

    private static zombie.ui.ISUIWrapper.ISContextMenuWrapper doFluidContainerMenu(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoObject](IsoObject.html "class in zombie.iso") object,
    double player,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable worldObjects)
  + ### addFluidFromItem

    private static void addFluidFromItem(se.krka.kahlua.vm.KahluaTable fetch,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoObject](IsoObject.html "class in zombie.iso") pourFluidInto,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") playerInv)
  + ### formatWaterAmount

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatWaterAmount([IsoObject](IsoObject.html "class in zombie.iso") object,
    float amount,
    float max)
  + ### doDrinkWaterMenu

    private static void doDrinkWaterMenu([IsoObject](IsoObject.html "class in zombie.iso") object,
    double player,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context)
  + ### doFillFluidMenu

    private static void doFillFluidMenu([IsoObject](IsoObject.html "class in zombie.iso") sink,
    double playerNum,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context)
  + ### createWaterSourceTooltip

    private static zombie.ui.ISUIWrapper.ISToolTipWrapper createWaterSourceTooltip([IsoObject](IsoObject.html "class in zombie.iso") sink)
  + ### setWashClothingTooltip

    private static void setWashClothingTooltip(double soapRemaining,
    double waterRemaining,
    double soapRequired,
    double waterRequired,
    se.krka.kahlua.vm.KahluaTable washList,
    se.krka.kahlua.vm.KahluaTable option)
  + ### doWashClothingMenu

    private static void doWashClothingMenu([IsoObject](IsoObject.html "class in zombie.iso") sink,
    double player,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context)
  + ### CleanBandages\_getAvailableItems

    private static void CleanBandages\_getAvailableItems(se.krka.kahlua.vm.KahluaTable items,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### doRecipeUsingWaterMenu

    private static void doRecipeUsingWaterMenu([IsoObject](IsoObject.html "class in zombie.iso") waterObject,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context)
  + ### toggleClothingWasher

    private static boolean toggleClothingWasher(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    double playerId,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoClothingWasher](objects/IsoClothingWasher.html "class in zombie.iso.objects") object)
  + ### toggleComboWasherDryer

    private static boolean toggleComboWasherDryer(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    [IsoCombinationWasherDryer](objects/IsoCombinationWasherDryer.html "class in zombie.iso.objects") object,
    boolean bAddObjectSubmenu)
  + ### toggleClothingDryer

    private static boolean toggleClothingDryer(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    double playerId,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj,
    se.krka.kahlua.vm.KahluaTable worldobjects,
    [IsoClothingDryer](objects/IsoClothingDryer.html "class in zombie.iso.objects") object)
  + ### onWashingDryer

    private static boolean onWashingDryer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") source,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [IsoClothingDryer](objects/IsoClothingDryer.html "class in zombie.iso.objects") object,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    se.krka.kahlua.vm.KahluaTable worldobjects)
  + ### doStoveOption

    private static boolean doStoveOption(se.krka.kahlua.vm.KahluaTable fetch,
    boolean test,
    zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    double player,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### checkBlowTorchForBarricade

    public static boolean checkBlowTorchForBarricade([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### addTileDebugInfo

    private static void addTileDebugInfo(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    se.krka.kahlua.vm.KahluaTable fetch)
  + ### doContextConfigOptionsFromFetch

    private static void doContextConfigOptionsFromFetch(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    se.krka.kahlua.vm.KahluaTable fetch,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)
  + ### doContextConfigOptions

    private static void doContextConfigOptions(zombie.ui.ISUIWrapper.ISContextMenuWrapper context,
    [GameEntity](../entity/GameEntity.html "class in zombie.entity") entity,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") playerObj)