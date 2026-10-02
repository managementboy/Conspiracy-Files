[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.stash](package-summary.html)
2. [StashSystem](StashSystem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [allStashes](#allStashes)
   2. [possibleStashes](#possibleStashes)
   3. [buildingsToDo](#buildingsToDo)
   4. [possibleTrap](#possibleTrap)
   5. [alreadyReadMap](#alreadyReadMap)
6. [Constructor Details](#constructor-detail)
   1. [StashSystem()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init()](#init())
   2. [initAllStashes()](#initAllStashes())
   3. [getAllStashes()](#getAllStashes())
   4. [getAlreadyReadMap()](#getAlreadyReadMap())
   5. [checkStashItem(InventoryItem)](#checkStashItem(zombie.inventory.InventoryItem))
   6. [doStashItem(Stash, InventoryItem)](#doStashItem(zombie.core.stash.Stash,zombie.inventory.InventoryItem))
   7. [prepareBuildingStash(String)](#prepareBuildingStash(java.lang.String))
   8. [checkSpecificSpawnProperties(Stash, InventoryItem)](#checkSpecificSpawnProperties(zombie.core.stash.Stash,zombie.inventory.InventoryItem))
   9. [removeFromPossibleStash(Stash)](#removeFromPossibleStash(zombie.core.stash.Stash))
   10. [doBuildingStash(BuildingDef)](#doBuildingStash(zombie.iso.BuildingDef))
   11. [doSpecificBuildingProperties(Stash, BuildingDef)](#doSpecificBuildingProperties(zombie.core.stash.Stash,zombie.iso.BuildingDef))
   12. [getStash(String)](#getStash(java.lang.String))
   13. [visitedBuilding(BuildingDef)](#visitedBuilding(zombie.iso.BuildingDef))
   14. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   15. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   16. [getPossibleStashes()](#getPossibleStashes())
   17. [reinit()](#reinit())
   18. [Reset()](#Reset())
   19. [isStashBuilding(BuildingDef)](#isStashBuilding(zombie.iso.BuildingDef))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class StashSystem
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.stash.StashSystem

---

public final class StashSystem
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static ArrayList<Stash>`

  `allStashes`

  `private static ArrayList<String>`

  `alreadyReadMap`

  `static ArrayList<StashBuilding>`

  `buildingsToDo`

  `static ArrayList<StashBuilding>`

  `possibleStashes`

  `private static final ArrayList<String>`

  `possibleTrap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StashSystem()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static boolean`

  `checkSpecificSpawnProperties(Stash stash,
  InventoryItem item)`

  `static void`

  `checkStashItem(InventoryItem item)`

  check if the spawned item could be a stash item (map or note...)

  `static void`

  `doBuildingStash(BuildingDef def)`

  Fetch our list of building in which we'll spawn stash, if this building correspond, we do the necessary stuff

  `private static void`

  `doSpecificBuildingProperties(Stash stash,
  BuildingDef def)`

  Spawn the zombie, traps etc.

  `static void`

  `doStashItem(Stash stash,
  InventoryItem item)`

  Public for lua debug stash map

  `static ArrayList<Stash>`

  `getAllStashes()`

  `static ArrayList<String>`

  `getAlreadyReadMap()`

  `static ArrayList<StashBuilding>`

  `getPossibleStashes()`

  `static Stash`

  `getStash(String stashName)`

  `static void`

  `init()`

  `static void`

  `initAllStashes()`

  Load our different stashes description from lua files in "media/lua/shared/StashDescriptions"

  `static boolean`

  `isStashBuilding(BuildingDef def)`

  `static void`

  `load(ByteBuffer input,
  int worldVersion)`

  `static void`

  `prepareBuildingStash(String stashName)`

  Used when you read an annotated map

  `static void`

  `reinit()`

  `private static void`

  `removeFromPossibleStash(Stash stash)`

  `static void`

  `Reset()`

  `static void`

  `save(ByteBuffer output)`

  `static void`

  `visitedBuilding(BuildingDef def)`

  Check if the visited building is in one of our random stash, in that case we won't spawn any stash for this building

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### allStashes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Stash](Stash.html "class in zombie.core.stash")> allStashes
  + ### possibleStashes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StashBuilding](StashBuilding.html "class in zombie.core.stash")> possibleStashes
  + ### buildingsToDo

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StashBuilding](StashBuilding.html "class in zombie.core.stash")> buildingsToDo
  + ### possibleTrap

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> possibleTrap
  + ### alreadyReadMap

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> alreadyReadMap
* Constructor Details
  -------------------

  + ### StashSystem

    public StashSystem()
* Method Details
  --------------

  + ### init

    public static void init()
  + ### initAllStashes

    public static void initAllStashes()

    Load our different stashes description from lua files in "media/lua/shared/StashDescriptions"
  + ### getAllStashes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Stash](Stash.html "class in zombie.core.stash")> getAllStashes()
  + ### getAlreadyReadMap

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAlreadyReadMap()
  + ### checkStashItem

    public static void checkStashItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    check if the spawned item could be a stash item (map or note...)
  + ### doStashItem

    public static void doStashItem([Stash](Stash.html "class in zombie.core.stash") stash,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)

    Public for lua debug stash map
  + ### prepareBuildingStash

    public static void prepareBuildingStash([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stashName)

    Used when you read an annotated map
  + ### checkSpecificSpawnProperties

    private static boolean checkSpecificSpawnProperties([Stash](Stash.html "class in zombie.core.stash") stash,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### removeFromPossibleStash

    private static void removeFromPossibleStash([Stash](Stash.html "class in zombie.core.stash") stash)
  + ### doBuildingStash

    public static void doBuildingStash([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Fetch our list of building in which we'll spawn stash, if this building correspond, we do the necessary stuff
  + ### doSpecificBuildingProperties

    private static void doSpecificBuildingProperties([Stash](Stash.html "class in zombie.core.stash") stash,
    [BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Spawn the zombie, traps etc. define in the stash description in the building
  + ### getStash

    public static [Stash](Stash.html "class in zombie.core.stash") getStash([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stashName)
  + ### visitedBuilding

    public static void visitedBuilding([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Check if the visited building is in one of our random stash, in that case we won't spawn any stash for this building
  + ### load

    public static void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### save

    public static void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### getPossibleStashes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StashBuilding](StashBuilding.html "class in zombie.core.stash")> getPossibleStashes()
  + ### reinit

    public static void reinit()
  + ### Reset

    public static void Reset()
  + ### isStashBuilding

    public static boolean isStashBuilding([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)