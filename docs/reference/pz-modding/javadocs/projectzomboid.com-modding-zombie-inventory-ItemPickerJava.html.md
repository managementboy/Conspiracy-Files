[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemPickerJava](ItemPickerJava.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [player](#player)
   2. [otherLootModifier](#otherLootModifier)
   3. [foodLootModifier](#foodLootModifier)
   4. [cannedFoodLootModifier](#cannedFoodLootModifier)
   5. [weaponLootModifier](#weaponLootModifier)
   6. [rangedWeaponLootModifier](#rangedWeaponLootModifier)
   7. [ammoLootModifier](#ammoLootModifier)
   8. [literatureLootModifier](#literatureLootModifier)
   9. [survivalGearsLootModifier](#survivalGearsLootModifier)
   10. [medicalLootModifier](#medicalLootModifier)
   11. [bagLootModifier](#bagLootModifier)
   12. [mechanicsLootModifier](#mechanicsLootModifier)
   13. [clothingLootModifier](#clothingLootModifier)
   14. [containerLootModifier](#containerLootModifier)
   15. [keyLootModifier](#keyLootModifier)
   16. [keyLootModifierD100](#keyLootModifierD100)
   17. [mediaLootModifier](#mediaLootModifier)
   18. [mementoLootModifier](#mementoLootModifier)
   19. [cookwareLootModifier](#cookwareLootModifier)
   20. [materialLootModifier](#materialLootModifier)
   21. [farmingLootModifier](#farmingLootModifier)
   22. [toolLootModifier](#toolLootModifier)
   23. [skillBookLootModifier](#skillBookLootModifier)
   24. [recipeResourceLootModifier](#recipeResourceLootModifier)
   25. [OtherLootType](#OtherLootType)
   26. [FoodLootType](#FoodLootType)
   27. [CannedFoodLootType](#CannedFoodLootType)
   28. [WeaponLootType](#WeaponLootType)
   29. [RangedWeaponLootType](#RangedWeaponLootType)
   30. [AmmoLootType](#AmmoLootType)
   31. [LiteratureLootType](#LiteratureLootType)
   32. [SurvivalGearsLootType](#SurvivalGearsLootType)
   33. [MedicalLootType](#MedicalLootType)
   34. [MechanicsLootType](#MechanicsLootType)
   35. [ClothingLootType](#ClothingLootType)
   36. [ContainerLootType](#ContainerLootType)
   37. [KeyLootType](#KeyLootType)
   38. [MediaLootType](#MediaLootType)
   39. [MementoLootType](#MementoLootType)
   40. [CookwareLootType](#CookwareLootType)
   41. [MaterialLootType](#MaterialLootType)
   42. [FarmingLootType](#FarmingLootType)
   43. [ToolLootType](#ToolLootType)
   44. [GeneratorLootType](#GeneratorLootType)
   45. [SkillBookLootType](#SkillBookLootType)
   46. [RecipeResourceLootType](#RecipeResourceLootType)
   47. [NO\_GENERIC\_LOOT\_CONTAINERS](#NO_GENERIC_LOOT_CONTAINERS)
   48. [zombieDensityCap](#zombieDensityCap)
   49. [NoContainerFillRooms](#NoContainerFillRooms)
   50. [WeaponUpgrades](#WeaponUpgrades)
   51. [WeaponUpgradeMap](#WeaponUpgradeMap)
   52. [rooms](#rooms)
   53. [containers](#containers)
   54. [ProceduralDistributions](#ProceduralDistributions)
   55. [VehicleDistributions](#VehicleDistributions)
   56. [addedInvalidAlready](#addedInvalidAlready)
7. [Constructor Details](#constructor-detail)
   1. [ItemPickerJava()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getItemPickerContainers()](#getItemPickerContainers())
   2. [Parse()](#Parse())
   3. [ParseSuburbsDistributions()](#ParseSuburbsDistributions())
   4. [ParseVehicleDistributions()](#ParseVehicleDistributions())
   5. [ParseProceduralDistributions()](#ParseProceduralDistributions())
   6. [ExtractContainersFromLua(KahluaTableImpl)](#ExtractContainersFromLua(se.krka.kahlua.j2se.KahluaTableImpl))
   7. [ExtractProcList(KahluaTableImpl)](#ExtractProcList(se.krka.kahlua.j2se.KahluaTableImpl))
   8. [InitSandboxLootSettings()](#InitSandboxLootSettings())
   9. [doSandboxSettings(int)](#doSandboxSettings(int))
   10. [initNoGenericLootContainers()](#initNoGenericLootContainers())
   11. [fillContainer(ItemContainer, IsoPlayer)](#fillContainer(zombie.inventory.ItemContainer,zombie.characters.IsoPlayer))
   12. [fillContainerInternal(ItemPickInfo, ItemContainer, IsoPlayer)](#fillContainerInternal(zombie.inventory.ItemPickInfo,zombie.inventory.ItemContainer,zombie.characters.IsoPlayer))
   13. [fillContainerType(ItemPickerJava.ItemPickerRoom, ItemContainer, String, IsoGameCharacter)](#fillContainerType(zombie.inventory.ItemPickerJava.ItemPickerRoom,zombie.inventory.ItemContainer,java.lang.String,zombie.characters.IsoGameCharacter))
   14. [fillContainerTypeInternal(ItemPickInfo, ItemPickerJava.ItemPickerRoom, ItemContainer, String, IsoGameCharacter)](#fillContainerTypeInternal(zombie.inventory.ItemPickInfo,zombie.inventory.ItemPickerJava.ItemPickerRoom,zombie.inventory.ItemContainer,java.lang.String,zombie.characters.IsoGameCharacter))
   15. [tryAddItemToContainer(ItemContainer, String, ItemPickerJava.ItemPickerContainer)](#tryAddItemToContainer(zombie.inventory.ItemContainer,java.lang.String,zombie.inventory.ItemPickerJava.ItemPickerContainer))
   16. [rollProceduralItem(ArrayList, ItemContainer, float, IsoGameCharacter, ItemPickerJava.ItemPickerRoom)](#rollProceduralItem(java.util.ArrayList,zombie.inventory.ItemContainer,float,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   17. [rollProceduralItemInternal(ItemPickInfo, ArrayList, ItemContainer, float, IsoGameCharacter, ItemPickerJava.ItemPickerRoom)](#rollProceduralItemInternal(zombie.inventory.ItemPickInfo,java.util.ArrayList,zombie.inventory.ItemContainer,float,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   18. [getDistribInHashMap(HashMap)](#getDistribInHashMap(java.util.HashMap))
   19. [rollItem(ItemPickerJava.ItemPickerContainer, ItemContainer, boolean, IsoGameCharacter, ItemPickerJava.ItemPickerRoom)](#rollItem(zombie.inventory.ItemPickerJava.ItemPickerContainer,zombie.inventory.ItemContainer,boolean,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   20. [rollItemInternal(ItemPickInfo, ItemPickerJava.ItemPickerContainer, ItemContainer, boolean, IsoGameCharacter, ItemPickerJava.ItemPickerRoom)](#rollItemInternal(zombie.inventory.ItemPickInfo,zombie.inventory.ItemPickerJava.ItemPickerContainer,zombie.inventory.ItemContainer,boolean,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   21. [doRollItem(ItemPickerJava.ItemPickerContainer, ItemContainer, float, IsoGameCharacter, boolean, ItemPickerJava.ItemPickerRoom)](#doRollItem(zombie.inventory.ItemPickerJava.ItemPickerContainer,zombie.inventory.ItemContainer,float,zombie.characters.IsoGameCharacter,boolean,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   22. [doRollItemInternal(ItemPickInfo, ItemPickerJava.ItemPickerContainer, ItemContainer, float, IsoGameCharacter, boolean, ItemPickerJava.ItemPickerRoom)](#doRollItemInternal(zombie.inventory.ItemPickInfo,zombie.inventory.ItemPickerJava.ItemPickerContainer,zombie.inventory.ItemContainer,float,zombie.characters.IsoGameCharacter,boolean,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   23. [doRollItemInternal(ItemPickInfo, ItemPickerJava.ItemPickerContainer, ItemContainer, float, IsoGameCharacter, boolean, ItemPickerJava.ItemPickerRoom, boolean)](#doRollItemInternal(zombie.inventory.ItemPickInfo,zombie.inventory.ItemPickerJava.ItemPickerContainer,zombie.inventory.ItemContainer,float,zombie.characters.IsoGameCharacter,boolean,zombie.inventory.ItemPickerJava.ItemPickerRoom,boolean))
   24. [checkStashItem(InventoryItem, ItemPickerJava.ItemPickerContainer)](#checkStashItem(zombie.inventory.InventoryItem,zombie.inventory.ItemPickerJava.ItemPickerContainer))
   25. [rollContainerItem(InventoryContainer, IsoGameCharacter, ItemPickerJava.ItemPickerContainer)](#rollContainerItem(zombie.inventory.types.InventoryContainer,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerContainer))
   26. [rollContainerItemInternal(ItemPickInfo, InventoryContainer, IsoGameCharacter, ItemPickerJava.ItemPickerContainer)](#rollContainerItemInternal(zombie.inventory.ItemPickInfo,zombie.inventory.types.InventoryContainer,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerContainer))
   27. [rollContainerItemInternal(ItemPickInfo, InventoryContainer, IsoGameCharacter, ItemPickerJava.ItemPickerContainer, boolean)](#rollContainerItemInternal(zombie.inventory.ItemPickInfo,zombie.inventory.types.InventoryContainer,zombie.characters.IsoGameCharacter,zombie.inventory.ItemPickerJava.ItemPickerContainer,boolean))
   28. [DoWeaponUpgrade(InventoryItem)](#DoWeaponUpgrade(zombie.inventory.InventoryItem))
   29. [getLootModifier(String)](#getLootModifier(java.lang.String))
   30. [getLootModifierFromType(String)](#getLootModifierFromType(java.lang.String))
   31. [getLootType(Item)](#getLootType(zombie.scripting.objects.Item))
   32. [updateOverlaySprite(IsoObject)](#updateOverlaySprite(zombie.iso.IsoObject))
   33. [doOverlaySprite(IsoGridSquare)](#doOverlaySprite(zombie.iso.IsoGridSquare))
   34. [getItemContainer(String, String, String, boolean)](#getItemContainer(java.lang.String,java.lang.String,java.lang.String,boolean))
   35. [keyNamerBuilding(InventoryItem, IsoGridSquare)](#keyNamerBuilding(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare))
   36. [trashItem(InventoryItem)](#trashItem(zombie.inventory.InventoryItem))
   37. [trashItemLooted(InventoryItem)](#trashItemLooted(zombie.inventory.InventoryItem))
   38. [trashItemRats(InventoryItem)](#trashItemRats(zombie.inventory.InventoryItem))
   39. [wearDownItem(InventoryItem)](#wearDownItem(zombie.inventory.InventoryItem))
   40. [rotItem(InventoryItem)](#rotItem(zombie.inventory.InventoryItem))
   41. [spawnLootCarKey(InventoryItem, ItemContainer)](#spawnLootCarKey(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer))
   42. [spawnLootCarKey(InventoryItem, ItemContainer, ItemContainer)](#spawnLootCarKey(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer,zombie.inventory.ItemContainer))
   43. [isGoodKey(String)](#isGoodKey(java.lang.String))
   44. [addVehicleKeyAsLoot(InventoryItem, ItemContainer)](#addVehicleKeyAsLoot(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer))
   45. [containerHasZone(ItemContainer, String)](#containerHasZone(zombie.inventory.ItemContainer,java.lang.String))
   46. [squareHasZone(IsoGridSquare, String)](#squareHasZone(zombie.iso.IsoGridSquare,java.lang.String))
   47. [getContainerZombiesType(ItemContainer)](#getContainerZombiesType(zombie.inventory.ItemContainer))
   48. [getSquareZombiesType(IsoGridSquare)](#getSquareZombiesType(zombie.iso.IsoGridSquare))
   49. [getSquareBuildingName(IsoGridSquare)](#getSquareBuildingName(zombie.iso.IsoGridSquare))
   50. [getSquareRegion(IsoGridSquare)](#getSquareRegion(zombie.iso.IsoGridSquare))
   51. [getBaseChance(ItemPickerJava.ItemPickerItem, IsoGameCharacter, boolean)](#getBaseChance(zombie.inventory.ItemPickerJava.ItemPickerItem,zombie.characters.IsoGameCharacter,boolean))
   52. [getBaseChanceMultiplier(IsoGameCharacter, boolean, Item)](#getBaseChanceMultiplier(zombie.characters.IsoGameCharacter,boolean,zombie.scripting.objects.Item))
   53. [getLootModifier(String, boolean)](#getLootModifier(java.lang.String,boolean))
   54. [getAdjustedZombieDensity(float, Item, boolean)](#getAdjustedZombieDensity(float,zombie.scripting.objects.Item,boolean))
   55. [getActualSpawnChance(ItemPickerJava.ItemPickerItem, IsoGameCharacter, ItemContainer, float, boolean)](#getActualSpawnChance(zombie.inventory.ItemPickerJava.ItemPickerItem,zombie.characters.IsoGameCharacter,zombie.inventory.ItemContainer,float,boolean))
   56. [getZombieDensityFactor(ItemPickerJava.ItemPickerContainer, ItemContainer)](#getZombieDensityFactor(zombie.inventory.ItemPickerJava.ItemPickerContainer,zombie.inventory.ItemContainer))
   57. [itemSpawnSanityCheck(InventoryItem)](#itemSpawnSanityCheck(zombie.inventory.InventoryItem))
   58. [itemSpawnSanityCheck(InventoryItem, ItemContainer)](#itemSpawnSanityCheck(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer))
   59. [getLootDebugString(IsoObject)](#getLootDebugString(zombie.iso.IsoObject))
   60. [hasDistributionForRoom(String)](#hasDistributionForRoom(java.lang.String))
   61. [hasDistributionForContainerInRoom(String, String)](#hasDistributionForContainerInRoom(java.lang.String,java.lang.String))
   62. [onCreateRegion(InventoryItem, String)](#onCreateRegion(zombie.inventory.InventoryItem,java.lang.String))
   63. [doGunStorageContainer(boolean, HandWeapon, ItemContainer)](#doGunStorageContainer(boolean,zombie.inventory.types.HandWeapon,zombie.inventory.ItemContainer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemPickerJava
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemPickerJava

---

public final class ItemPickerJava
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `ItemPickerJava.ItemPickerContainer`

  `static final class`

  `ItemPickerJava.ItemPickerItem`

  `static final class`

  `ItemPickerJava.ItemPickerRoom`

  `static final class`

  `ItemPickerJava.ItemPickerUpgradeWeapons`

  `static final class`

  `ItemPickerJava.KeyNamer`

  `static final class`

  `ItemPickerJava.ProceduralItem`

  `static final class`

  `ItemPickerJava.VehicleDistribution`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<String>`

  `addedInvalidAlready`

  `private static float`

  `ammoLootModifier`

  `private static final String`

  `AmmoLootType`

  `private static float`

  `bagLootModifier`

  `private static float`

  `cannedFoodLootModifier`

  `private static final String`

  `CannedFoodLootType`

  `private static float`

  `clothingLootModifier`

  `private static final String`

  `ClothingLootType`

  `private static float`

  `containerLootModifier`

  `private static final String`

  `ContainerLootType`

  `static final gnu.trove.map.hash.THashMap<String, ItemPickerJava.ItemPickerContainer>`

  `containers`

  `private static float`

  `cookwareLootModifier`

  `private static final String`

  `CookwareLootType`

  `private static float`

  `farmingLootModifier`

  `private static final String`

  `FarmingLootType`

  `private static float`

  `foodLootModifier`

  `private static final String`

  `FoodLootType`

  `private static final String`

  `GeneratorLootType`

  `private static float`

  `keyLootModifier`

  `private static float`

  `keyLootModifierD100`

  `private static final String`

  `KeyLootType`

  `private static float`

  `literatureLootModifier`

  `private static final String`

  `LiteratureLootType`

  `private static float`

  `materialLootModifier`

  `private static final String`

  `MaterialLootType`

  `private static float`

  `mechanicsLootModifier`

  `private static final String`

  `MechanicsLootType`

  `private static float`

  `mediaLootModifier`

  `private static final String`

  `MediaLootType`

  `private static float`

  `medicalLootModifier`

  `private static final String`

  `MedicalLootType`

  `private static float`

  `mementoLootModifier`

  `private static final String`

  `MementoLootType`

  `private static final Set<zombie.scripting.objects.ContainerType>`

  `NO_GENERIC_LOOT_CONTAINERS`

  `static final ArrayList<String>`

  `NoContainerFillRooms`

  `private static float`

  `otherLootModifier`

  `private static final String`

  `OtherLootType`

  `private static IsoPlayer`

  `player`

  `static final gnu.trove.map.hash.THashMap<String, ItemPickerJava.ItemPickerContainer>`

  `ProceduralDistributions`

  `private static float`

  `rangedWeaponLootModifier`

  `private static final String`

  `RangedWeaponLootType`

  `private static float`

  `recipeResourceLootModifier`

  `private static final String`

  `RecipeResourceLootType`

  `static final gnu.trove.map.hash.THashMap<String, ItemPickerJava.ItemPickerRoom>`

  `rooms`

  `private static float`

  `skillBookLootModifier`

  `private static final String`

  `SkillBookLootType`

  `private static float`

  `survivalGearsLootModifier`

  `private static final String`

  `SurvivalGearsLootType`

  `private static float`

  `toolLootModifier`

  `private static final String`

  `ToolLootType`

  `static final gnu.trove.map.hash.THashMap<String, ItemPickerJava.VehicleDistribution>`

  `VehicleDistributions`

  `private static float`

  `weaponLootModifier`

  `private static final String`

  `WeaponLootType`

  `static final HashMap<String, ItemPickerJava.ItemPickerUpgradeWeapons>`

  `WeaponUpgradeMap`

  `static final ArrayList<ItemPickerJava.ItemPickerUpgradeWeapons>`

  `WeaponUpgrades`

  `static float`

  `zombieDensityCap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemPickerJava()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `addVehicleKeyAsLoot(InventoryItem spawnItem,
  ItemContainer container)`

  `private static void`

  `checkStashItem(InventoryItem spawnItem,
  ItemPickerJava.ItemPickerContainer containerDist)`

  `static boolean`

  `containerHasZone(ItemContainer container,
  String zone)`

  `private static void`

  `doGunStorageContainer(boolean dontSpawnAmmo,
  HandWeapon weapon,
  ItemContainer container)`

  `static void`

  `doOverlaySprite(IsoGridSquare sq)`

  `static void`

  `doRollItem(ItemPickerJava.ItemPickerContainer containerDist,
  ItemContainer container,
  float zombieDensity,
  IsoGameCharacter character,
  boolean doItemContainer,
  ItemPickerJava.ItemPickerRoom roomDist)`

  `private static void`

  `doRollItemInternal(zombie.inventory.ItemPickInfo pickInfo,
  ItemPickerJava.ItemPickerContainer containerDist,
  ItemContainer container,
  float zombieDensity,
  IsoGameCharacter character,
  boolean doItemContainer,
  ItemPickerJava.ItemPickerRoom roomDist)`

  `private static void`

  `doRollItemInternal(zombie.inventory.ItemPickInfo pickInfo,
  ItemPickerJava.ItemPickerContainer containerDist,
  ItemContainer container,
  float zombieDensity,
  IsoGameCharacter character,
  boolean doItemContainer,
  ItemPickerJava.ItemPickerRoom roomDist,
  boolean isJunk)`

  `private static float`

  `doSandboxSettings(int value)`

  `static void`

  `DoWeaponUpgrade(InventoryItem item)`

  `private static ItemPickerJava.ItemPickerContainer`

  `ExtractContainersFromLua(se.krka.kahlua.j2se.KahluaTableImpl con)`

  `private static ArrayList<ItemPickerJava.ProceduralItem>`

  `ExtractProcList(se.krka.kahlua.j2se.KahluaTableImpl table)`

  `static void`

  `fillContainer(ItemContainer container,
  IsoPlayer player)`

  `private static void`

  `fillContainerInternal(zombie.inventory.ItemPickInfo pickInfo,
  ItemContainer container,
  IsoPlayer player)`

  `static void`

  `fillContainerType(ItemPickerJava.ItemPickerRoom roomDist,
  ItemContainer container,
  String roomName,
  IsoGameCharacter character)`

  `private static void`

  `fillContainerTypeInternal(zombie.inventory.ItemPickInfo pickInfo,
  ItemPickerJava.ItemPickerRoom roomDist,
  ItemContainer container,
  String roomName,
  IsoGameCharacter character)`

  `static float`

  `getActualSpawnChance(ItemPickerJava.ItemPickerItem item,
  IsoGameCharacter character,
  ItemContainer container,
  float zombieDensity,
  boolean isJunk)`

  `static float`

  `getAdjustedZombieDensity(float zombieDensity,
  Item scriptItem,
  boolean isJunk)`

  `static float`

  `getBaseChance(ItemPickerJava.ItemPickerItem item,
  IsoGameCharacter character,
  boolean isJunk)`

  `static float`

  `getBaseChanceMultiplier(IsoGameCharacter character,
  boolean isJunk,
  Item scriptItem)`

  `static String`

  `getContainerZombiesType(ItemContainer container)`

  `private static String`

  `getDistribInHashMap(HashMap<String,Integer> map)`

  `static ItemPickerJava.ItemPickerContainer`

  `getItemContainer(String room,
  String container,
  String proceduralName,
  boolean junk)`

  `static gnu.trove.map.hash.THashMap<String, ItemPickerJava.ItemPickerContainer>`

  `getItemPickerContainers()`

  `static String`

  `getLootDebugString(IsoObject object)`

  `static float`

  `getLootModifier(String itemname)`

  `static float`

  `getLootModifier(String itemName,
  boolean isJunk)`

  `static float`

  `getLootModifierFromType(String lootType)`

  `static String`

  `getLootType(Item item)`

  `static String`

  `getSquareBuildingName(IsoGridSquare square)`

  `static String`

  `getSquareRegion(IsoGridSquare square)`

  `static String`

  `getSquareZombiesType(IsoGridSquare square)`

  `static float`

  `getZombieDensityFactor(ItemPickerJava.ItemPickerContainer containerDist,
  ItemContainer container)`

  `static boolean`

  `hasDistributionForContainerInRoom(String containerType,
  String roomdef)`

  `static boolean`

  `hasDistributionForRoom(String roomdef)`

  `private static void`

  `initNoGenericLootContainers()`

  `static void`

  `InitSandboxLootSettings()`

  `static boolean`

  `isGoodKey(String vehicleType)`

  `static void`

  `itemSpawnSanityCheck(InventoryItem spawnItem)`

  `static void`

  `itemSpawnSanityCheck(InventoryItem spawnItem,
  ItemContainer container)`

  `static void`

  `keyNamerBuilding(InventoryItem item,
  IsoGridSquare square)`

  `static void`

  `onCreateRegion(InventoryItem item,
  String region)`

  `static void`

  `Parse()`

  `private static void`

  `ParseProceduralDistributions()`

  `private static void`

  `ParseSuburbsDistributions()`

  `private static void`

  `ParseVehicleDistributions()`

  `static void`

  `rollContainerItem(InventoryContainer bag,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerContainer containerDist)`

  `private static void`

  `rollContainerItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
  InventoryContainer bag,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerContainer containerDist)`

  `private static void`

  `rollContainerItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
  InventoryContainer bag,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerContainer containerDist,
  boolean isJunk)`

  `static void`

  `rollItem(ItemPickerJava.ItemPickerContainer containerDist,
  ItemContainer container,
  boolean doItemContainer,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerRoom roomDist)`

  `private static void`

  `rollItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
  ItemPickerJava.ItemPickerContainer containerDist,
  ItemContainer container,
  boolean doItemContainer,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerRoom roomDist)`

  `private static void`

  `rollProceduralItem(ArrayList<ItemPickerJava.ProceduralItem> proceduralItems,
  ItemContainer container,
  float zombieDensity,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerRoom roomDist)`

  `private static void`

  `rollProceduralItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
  ArrayList<ItemPickerJava.ProceduralItem> proceduralItems,
  ItemContainer container,
  float zombieDensity,
  IsoGameCharacter character,
  ItemPickerJava.ItemPickerRoom roomDist)`

  `static void`

  `rotItem(InventoryItem spawnItem)`

  `static void`

  `spawnLootCarKey(InventoryItem spawnItem,
  ItemContainer container)`

  `static void`

  `spawnLootCarKey(InventoryItem spawnItem,
  ItemContainer container,
  ItemContainer outtermost)`

  `static boolean`

  `squareHasZone(IsoGridSquare square,
  String zone)`

  `static void`

  `trashItem(InventoryItem spawnItem)`

  `static void`

  `trashItemLooted(InventoryItem spawnItem)`

  `static void`

  `trashItemRats(InventoryItem spawnItem)`

  `static InventoryItem`

  `tryAddItemToContainer(ItemContainer container,
  String itemType,
  ItemPickerJava.ItemPickerContainer containerDist)`

  `static void`

  `updateOverlaySprite(IsoObject obj)`

  `static void`

  `wearDownItem(InventoryItem spawnItem)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### player

    private static [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player
  + ### otherLootModifier

    private static float otherLootModifier
  + ### foodLootModifier

    private static float foodLootModifier
  + ### cannedFoodLootModifier

    private static float cannedFoodLootModifier
  + ### weaponLootModifier

    private static float weaponLootModifier
  + ### rangedWeaponLootModifier

    private static float rangedWeaponLootModifier
  + ### ammoLootModifier

    private static float ammoLootModifier
  + ### literatureLootModifier

    private static float literatureLootModifier
  + ### survivalGearsLootModifier

    private static float survivalGearsLootModifier
  + ### medicalLootModifier

    private static float medicalLootModifier
  + ### bagLootModifier

    private static float bagLootModifier
  + ### mechanicsLootModifier

    private static float mechanicsLootModifier
  + ### clothingLootModifier

    private static float clothingLootModifier
  + ### containerLootModifier

    private static float containerLootModifier
  + ### keyLootModifier

    private static float keyLootModifier
  + ### keyLootModifierD100

    private static float keyLootModifierD100
  + ### mediaLootModifier

    private static float mediaLootModifier
  + ### mementoLootModifier

    private static float mementoLootModifier
  + ### cookwareLootModifier

    private static float cookwareLootModifier
  + ### materialLootModifier

    private static float materialLootModifier
  + ### farmingLootModifier

    private static float farmingLootModifier
  + ### toolLootModifier

    private static float toolLootModifier
  + ### skillBookLootModifier

    private static float skillBookLootModifier
  + ### recipeResourceLootModifier

    private static float recipeResourceLootModifier
  + ### OtherLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") OtherLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.OtherLootType)
  + ### FoodLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FoodLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.FoodLootType)
  + ### CannedFoodLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") CannedFoodLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.CannedFoodLootType)
  + ### WeaponLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") WeaponLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.WeaponLootType)
  + ### RangedWeaponLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") RangedWeaponLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.RangedWeaponLootType)
  + ### AmmoLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") AmmoLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.AmmoLootType)
  + ### LiteratureLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") LiteratureLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.LiteratureLootType)
  + ### SurvivalGearsLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") SurvivalGearsLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.SurvivalGearsLootType)
  + ### MedicalLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") MedicalLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.MedicalLootType)
  + ### MechanicsLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") MechanicsLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.MechanicsLootType)
  + ### ClothingLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ClothingLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.ClothingLootType)
  + ### ContainerLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ContainerLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.ContainerLootType)
  + ### KeyLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") KeyLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.KeyLootType)
  + ### MediaLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") MediaLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.MediaLootType)
  + ### MementoLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") MementoLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.MementoLootType)
  + ### CookwareLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") CookwareLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.CookwareLootType)
  + ### MaterialLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") MaterialLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.MaterialLootType)
  + ### FarmingLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FarmingLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.FarmingLootType)
  + ### ToolLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ToolLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.ToolLootType)
  + ### GeneratorLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GeneratorLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.GeneratorLootType)
  + ### SkillBookLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") SkillBookLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.SkillBookLootType)
  + ### RecipeResourceLootType

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") RecipeResourceLootType

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemPickerJava.RecipeResourceLootType)
  + ### NO\_GENERIC\_LOOT\_CONTAINERS

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<zombie.scripting.objects.ContainerType> NO\_GENERIC\_LOOT\_CONTAINERS
  + ### zombieDensityCap

    public static float zombieDensityCap
  + ### NoContainerFillRooms

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> NoContainerFillRooms
  + ### WeaponUpgrades

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemPickerJava.ItemPickerUpgradeWeapons](ItemPickerJava.ItemPickerUpgradeWeapons.html "class in zombie.inventory")> WeaponUpgrades
  + ### WeaponUpgradeMap

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.ItemPickerUpgradeWeapons](ItemPickerJava.ItemPickerUpgradeWeapons.html "class in zombie.inventory")> WeaponUpgradeMap
  + ### rooms

    public static final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory")> rooms
  + ### containers

    public static final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory")> containers
  + ### ProceduralDistributions

    public static final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory")> ProceduralDistributions
  + ### VehicleDistributions

    public static final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.VehicleDistribution](ItemPickerJava.VehicleDistribution.html "class in zombie.inventory")> VehicleDistributions
  + ### addedInvalidAlready

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> addedInvalidAlready
* Constructor Details
  -------------------

  + ### ItemPickerJava

    public ItemPickerJava()
* Method Details
  --------------

  + ### getItemPickerContainers

    public static gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory")> getItemPickerContainers()
  + ### Parse

    public static void Parse()
  + ### ParseSuburbsDistributions

    private static void ParseSuburbsDistributions()
  + ### ParseVehicleDistributions

    private static void ParseVehicleDistributions()
  + ### ParseProceduralDistributions

    private static void ParseProceduralDistributions()
  + ### ExtractContainersFromLua

    private static [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") ExtractContainersFromLua(se.krka.kahlua.j2se.KahluaTableImpl con)
  + ### ExtractProcList

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemPickerJava.ProceduralItem](ItemPickerJava.ProceduralItem.html "class in zombie.inventory")> ExtractProcList(se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### InitSandboxLootSettings

    public static void InitSandboxLootSettings()
  + ### doSandboxSettings

    private static float doSandboxSettings(int value)
  + ### initNoGenericLootContainers

    private static void initNoGenericLootContainers()
  + ### fillContainer

    public static void fillContainer([ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### fillContainerInternal

    private static void fillContainerInternal(zombie.inventory.ItemPickInfo pickInfo,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### fillContainerType

    public static void fillContainerType([ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomName,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### fillContainerTypeInternal

    private static void fillContainerTypeInternal(zombie.inventory.ItemPickInfo pickInfo,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomName,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### tryAddItemToContainer

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") tryAddItemToContainer([ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist)
  + ### rollProceduralItem

    private static void rollProceduralItem([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemPickerJava.ProceduralItem](ItemPickerJava.ProceduralItem.html "class in zombie.inventory")> proceduralItems,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    float zombieDensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist)
  + ### rollProceduralItemInternal

    private static void rollProceduralItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemPickerJava.ProceduralItem](ItemPickerJava.ProceduralItem.html "class in zombie.inventory")> proceduralItems,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    float zombieDensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist)
  + ### getDistribInHashMap

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDistribInHashMap([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> map)
  + ### rollItem

    public static void rollItem([ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    boolean doItemContainer,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist)
  + ### rollItemInternal

    private static void rollItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    boolean doItemContainer,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist)
  + ### doRollItem

    public static void doRollItem([ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    float zombieDensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean doItemContainer,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist)
  + ### doRollItemInternal

    private static void doRollItemInternal(zombie.inventory.ItemPickInfo pickInfo,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    float zombieDensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean doItemContainer,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist)
  + ### doRollItemInternal

    private static void doRollItemInternal(zombie.inventory.ItemPickInfo pickInfo,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    float zombieDensity,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean doItemContainer,
    [ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") roomDist,
    boolean isJunk)
  + ### checkStashItem

    private static void checkStashItem([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist)
  + ### rollContainerItem

    public static void rollContainerItem([InventoryContainer](types/InventoryContainer.html "class in zombie.inventory.types") bag,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist)
  + ### rollContainerItemInternal

    private static void rollContainerItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
    [InventoryContainer](types/InventoryContainer.html "class in zombie.inventory.types") bag,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist)
  + ### rollContainerItemInternal

    private static void rollContainerItemInternal(zombie.inventory.ItemPickInfo itemPickInfo,
    [InventoryContainer](types/InventoryContainer.html "class in zombie.inventory.types") bag,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    boolean isJunk)
  + ### DoWeaponUpgrade

    public static void DoWeaponUpgrade([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getLootModifier

    public static float getLootModifier([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemname)
  + ### getLootModifierFromType

    public static float getLootModifierFromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lootType)
  + ### getLootType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLootType([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") item)
  + ### updateOverlaySprite

    public static void updateOverlaySprite([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### doOverlaySprite

    public static void doOverlaySprite([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getItemContainer

    public static [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") getItemContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") container,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") proceduralName,
    boolean junk)
  + ### keyNamerBuilding

    public static void keyNamerBuilding([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### trashItem

    public static void trashItem([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem)
  + ### trashItemLooted

    public static void trashItemLooted([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem)
  + ### trashItemRats

    public static void trashItemRats([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem)
  + ### wearDownItem

    public static void wearDownItem([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem)
  + ### rotItem

    public static void rotItem([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem)
  + ### spawnLootCarKey

    public static void spawnLootCarKey([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### spawnLootCarKey

    public static void spawnLootCarKey([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") outtermost)
  + ### isGoodKey

    public static boolean isGoodKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleType)
  + ### addVehicleKeyAsLoot

    public static boolean addVehicleKeyAsLoot([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### containerHasZone

    public static boolean containerHasZone([ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zone)
  + ### squareHasZone

    public static boolean squareHasZone([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zone)
  + ### getContainerZombiesType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerZombiesType([ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### getSquareZombiesType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSquareZombiesType([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getSquareBuildingName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSquareBuildingName([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getSquareRegion

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSquareRegion([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getBaseChance

    public static float getBaseChance([ItemPickerJava.ItemPickerItem](ItemPickerJava.ItemPickerItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean isJunk)
  + ### getBaseChanceMultiplier

    public static float getBaseChanceMultiplier([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean isJunk,
    [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem)
  + ### getLootModifier

    public static float getLootModifier([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemName,
    boolean isJunk)
  + ### getAdjustedZombieDensity

    public static float getAdjustedZombieDensity(float zombieDensity,
    [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem,
    boolean isJunk)
  + ### getActualSpawnChance

    public static float getActualSpawnChance([ItemPickerJava.ItemPickerItem](ItemPickerJava.ItemPickerItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container,
    float zombieDensity,
    boolean isJunk)
  + ### getZombieDensityFactor

    public static float getZombieDensityFactor([ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") containerDist,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### itemSpawnSanityCheck

    public static void itemSpawnSanityCheck([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem)
  + ### itemSpawnSanityCheck

    public static void itemSpawnSanityCheck([InventoryItem](InventoryItem.html "class in zombie.inventory") spawnItem,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)
  + ### getLootDebugString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLootDebugString([IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### hasDistributionForRoom

    public static boolean hasDistributionForRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomdef)
  + ### hasDistributionForContainerInRoom

    public static boolean hasDistributionForContainerInRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomdef)
  + ### onCreateRegion

    public static void onCreateRegion([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") region)
  + ### doGunStorageContainer

    private static void doGunStorageContainer(boolean dontSpawnAmmo,
    [HandWeapon](types/HandWeapon.html "class in zombie.inventory.types") weapon,
    [ItemContainer](ItemContainer.html "class in zombie.inventory") container)