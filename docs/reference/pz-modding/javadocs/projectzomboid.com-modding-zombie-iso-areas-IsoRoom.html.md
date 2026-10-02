[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.areas](package-summary.html)
2. [IsoRoom](IsoRoom.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempSquares](#tempSquares)
   2. [beds](#beds)
   3. [bounds](#bounds)
   4. [building](#building)
   5. [containers](#containers)
   6. [windows](#windows)
   7. [exits](#exits)
   8. [layer](#layer)
   9. [roomDef](#roomDef)
   10. [tileList](#tileList)
   11. [transparentWalls](#transparentWalls)
   12. [lightSwitches](#lightSwitches)
   13. [roomLights](#roomLights)
   14. [waterSources](#waterSources)
   15. [MAXIMUM\_DAYS](#MAXIMUM_DAYS)
   16. [seen](#seen)
   17. [visited](#visited)
   18. [def](#def)
   19. [rects](#rects)
   20. [squares](#squares)
6. [Constructor Details](#constructor-detail)
   1. [IsoRoom()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getBuilding()](#getBuilding())
   2. [getName()](#getName())
   3. [CreateBuilding(IsoCell)](#CreateBuilding(zombie.iso.IsoCell))
   4. [isInside(int, int, int)](#isInside(int,int,int))
   5. [getFreeTile()](#getFreeTile())
   6. [AddToBuilding(IsoBuilding)](#AddToBuilding(zombie.iso.areas.IsoBuilding))
   7. [getWaterSources()](#getWaterSources())
   8. [setWaterSources(ArrayList)](#setWaterSources(java.util.ArrayList))
   9. [hasWater()](#hasWater())
   10. [useWater()](#useWater())
   11. [getWindows()](#getWindows())
   12. [addSquare(IsoGridSquare)](#addSquare(zombie.iso.IsoGridSquare))
   13. [refreshSquares()](#refreshSquares())
   14. [addExitTo(IsoGridSquare, IsoGridSquare)](#addExitTo(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   15. [getExitAt(int, int, int)](#getExitAt(int,int,int))
   16. [removeSquare(IsoGridSquare)](#removeSquare(zombie.iso.IsoGridSquare))
   17. [spawnZombies()](#spawnZombies())
   18. [onSee()](#onSee())
   19. [getTileList()](#getTileList())
   20. [getSquares()](#getSquares())
   21. [getContainer()](#getContainer())
   22. [getRandomSquare()](#getRandomSquare())
   23. [getRandomFreeSquare()](#getRandomFreeSquare())
   24. [getRandomDoorFreeSquare()](#getRandomDoorFreeSquare())
   25. [getRandomWallFreeSquare()](#getRandomWallFreeSquare())
   26. [getRandomWallFreePairSquare(IsoDirections, boolean)](#getRandomWallFreePairSquare(zombie.iso.IsoDirections,boolean))
   27. [getRandomWallSquare()](#getRandomWallSquare())
   28. [getRandomDoorAndWallFreeSquare()](#getRandomDoorAndWallFreeSquare())
   29. [hasLightSwitches()](#hasLightSwitches())
   30. [createLights(boolean)](#createLights(boolean))
   31. [findRoomLightByID(int)](#findRoomLightByID(int))
   32. [getRoomDef()](#getRoomDef())
   33. [getLightSwitches()](#getLightSwitches())
   34. [spawnRandomWorkstation()](#spawnRandomWorkstation())
   35. [spawnRandom2TileWorkstation()](#spawnRandom2TileWorkstation())
   36. [addMetalWorkbench()](#addMetalWorkbench())
   37. [addPotteryWheel()](#addPotteryWheel())
   38. [addOldPotteryWheel()](#addOldPotteryWheel())
   39. [addModernPotteryWheel()](#addModernPotteryWheel())
   40. [add2TileBench(String, String, String, String, String, boolean)](#add2TileBench(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,boolean))
   41. [isShop()](#isShop())
   42. [isDerelict()](#isDerelict())
   43. [isRural()](#isRural())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoRoom
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.IsoRoom

---

public final class IsoRoom
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final Vector<IsoGridSquare>`

  `beds`

  `Rectangle`

  `bounds`

  `IsoBuilding`

  `building`

  `final ArrayList<ItemContainer>`

  `containers`

  `RoomDef`

  `def`

  `final Vector<zombie.iso.areas.IsoRoomExit>`

  `exits`

  `int`

  `layer`

  `final ArrayList<IsoLightSwitch>`

  `lightSwitches`

  `static final int`

  `MAXIMUM_DAYS`

  `final ArrayList<RoomDef.RoomRect>`

  `rects`

  `String`

  `roomDef`

  `final ArrayList<zombie.iso.IsoRoomLight>`

  `roomLights`

  `int`

  `seen`

  `final ArrayList<IsoGridSquare>`

  `squares`

  `private static final ArrayList<IsoGridSquare>`

  `tempSquares`

  `final Vector<IsoGridSquare>`

  `tileList`

  `int`

  `transparentWalls`

  `int`

  `visited`

  `final ArrayList<IsoObject>`

  `waterSources`

  `final ArrayList<IsoWindow>`

  `windows`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoRoom()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `add2TileBench(String bench,
  String sprite1,
  String sprite2,
  String sprite3,
  String sprite4,
  boolean both)`

  `private void`

  `addExitTo(IsoGridSquare sq,
  IsoGridSquare sq2)`

  `boolean`

  `addMetalWorkbench()`

  `boolean`

  `addModernPotteryWheel()`

  `boolean`

  `addOldPotteryWheel()`

  `boolean`

  `addPotteryWheel()`

  `void`

  `addSquare(IsoGridSquare sq)`

  `(package private) void`

  `AddToBuilding(IsoBuilding building)`

  `IsoBuilding`

  `CreateBuilding(IsoCell cell)`

  `void`

  `createLights(boolean active)`

  `zombie.iso.IsoRoomLight`

  `findRoomLightByID(int id)`

  `IsoBuilding`

  `getBuilding()`

  `ArrayList<ItemContainer>`

  `getContainer()`

  `private zombie.iso.areas.IsoRoomExit`

  `getExitAt(int x,
  int y,
  int z)`

  `IsoGridSquare`

  `getFreeTile()`

  `ArrayList<IsoLightSwitch>`

  `getLightSwitches()`

  `String`

  `getName()`

  `IsoGridSquare`

  `getRandomDoorAndWallFreeSquare()`

  `IsoGridSquare`

  `getRandomDoorFreeSquare()`

  `IsoGridSquare`

  `getRandomFreeSquare()`

  `IsoGridSquare`

  `getRandomSquare()`

  `IsoGridSquare`

  `getRandomWallFreePairSquare(IsoDirections dir,
  boolean both)`

  `IsoGridSquare`

  `getRandomWallFreeSquare()`

  `IsoGridSquare`

  `getRandomWallSquare()`

  `RoomDef`

  `getRoomDef()`

  `ArrayList<IsoGridSquare>`

  `getSquares()`

  `Vector<IsoGridSquare>`

  `getTileList()`

  `ArrayList<IsoObject>`

  `getWaterSources()`

  `ArrayList<IsoWindow>`

  `getWindows()`

  `boolean`

  `hasLightSwitches()`

  `boolean`

  `hasWater()`

  `boolean`

  `isDerelict()`

  `boolean`

  `isInside(int x,
  int y,
  int z)`

  `boolean`

  `isRural()`

  `boolean`

  `isShop()`

  `void`

  `onSee()`

  `void`

  `refreshSquares()`

  `void`

  `removeSquare(IsoGridSquare sq)`

  `void`

  `setWaterSources(ArrayList<IsoObject> waterSources)`

  `boolean`

  `spawnRandom2TileWorkstation()`

  `boolean`

  `spawnRandomWorkstation()`

  `void`

  `spawnZombies()`

  `void`

  `useWater()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempSquares

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> tempSquares
  + ### beds

    public final [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> beds
  + ### bounds

    public [Rectangle](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/Rectangle.html "class or interface in java.awt") bounds
  + ### building

    public [IsoBuilding](IsoBuilding.html "class in zombie.iso.areas") building
  + ### containers

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory")> containers
  + ### windows

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects")> windows
  + ### exits

    public final [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<zombie.iso.areas.IsoRoomExit> exits
  + ### layer

    public int layer
  + ### roomDef

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomDef
  + ### tileList

    public final [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> tileList
  + ### transparentWalls

    public int transparentWalls
  + ### lightSwitches

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSwitch](../objects/IsoLightSwitch.html "class in zombie.iso.objects")> lightSwitches
  + ### roomLights

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.IsoRoomLight> roomLights
  + ### waterSources

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../IsoObject.html "class in zombie.iso")> waterSources
  + ### MAXIMUM\_DAYS

    public static final int MAXIMUM\_DAYS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.areas.IsoRoom.MAXIMUM_DAYS)
  + ### seen

    public int seen
  + ### visited

    public int visited
  + ### def

    public [RoomDef](../RoomDef.html "class in zombie.iso") def
  + ### rects

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef.RoomRect](../RoomDef.RoomRect.html "class in zombie.iso")> rects
  + ### squares

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> squares
* Constructor Details
  -------------------

  + ### IsoRoom

    public IsoRoom()
* Method Details
  --------------

  + ### getBuilding

    public [IsoBuilding](IsoBuilding.html "class in zombie.iso.areas") getBuilding()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### CreateBuilding

    public [IsoBuilding](IsoBuilding.html "class in zombie.iso.areas") CreateBuilding([IsoCell](../IsoCell.html "class in zombie.iso") cell)
  + ### isInside

    public boolean isInside(int x,
    int y,
    int z)
  + ### getFreeTile

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getFreeTile()
  + ### AddToBuilding

    void AddToBuilding([IsoBuilding](IsoBuilding.html "class in zombie.iso.areas") building)
  + ### getWaterSources

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../IsoObject.html "class in zombie.iso")> getWaterSources()

    Returns:
    :   the WaterSources
  + ### setWaterSources

    public void setWaterSources([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../IsoObject.html "class in zombie.iso")> waterSources)

    Parameters:
    :   `waterSources` - the WaterSources to set
  + ### hasWater

    public boolean hasWater()
  + ### useWater

    public void useWater()
  + ### getWindows

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWindow](../objects/IsoWindow.html "class in zombie.iso.objects")> getWindows()
  + ### addSquare

    public void addSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### refreshSquares

    public void refreshSquares()
  + ### addExitTo

    private void addExitTo([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq2)
  + ### getExitAt

    private zombie.iso.areas.IsoRoomExit getExitAt(int x,
    int y,
    int z)
  + ### removeSquare

    public void removeSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### spawnZombies

    public void spawnZombies()
  + ### onSee

    public void onSee()
  + ### getTileList

    public [Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> getTileList()
  + ### getSquares

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> getSquares()
  + ### getContainer

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory")> getContainer()
  + ### getRandomSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomSquare()
  + ### getRandomFreeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomFreeSquare()
  + ### getRandomDoorFreeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomDoorFreeSquare()
  + ### getRandomWallFreeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomWallFreeSquare()
  + ### getRandomWallFreePairSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomWallFreePairSquare([IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    boolean both)
  + ### getRandomWallSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomWallSquare()
  + ### getRandomDoorAndWallFreeSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomDoorAndWallFreeSquare()
  + ### hasLightSwitches

    public boolean hasLightSwitches()
  + ### createLights

    public void createLights(boolean active)
  + ### findRoomLightByID

    public zombie.iso.IsoRoomLight findRoomLightByID(int id)
  + ### getRoomDef

    public [RoomDef](../RoomDef.html "class in zombie.iso") getRoomDef()
  + ### getLightSwitches

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSwitch](../objects/IsoLightSwitch.html "class in zombie.iso.objects")> getLightSwitches()
  + ### spawnRandomWorkstation

    public boolean spawnRandomWorkstation()
  + ### spawnRandom2TileWorkstation

    public boolean spawnRandom2TileWorkstation()
  + ### addMetalWorkbench

    public boolean addMetalWorkbench()
  + ### addPotteryWheel

    public boolean addPotteryWheel()
  + ### addOldPotteryWheel

    public boolean addOldPotteryWheel()
  + ### addModernPotteryWheel

    public boolean addModernPotteryWheel()
  + ### add2TileBench

    public boolean add2TileBench([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bench,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite1,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite2,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite3,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite4,
    boolean both)
  + ### isShop

    public boolean isShop()
  + ### isDerelict

    public boolean isDerelict()
  + ### isRural

    public boolean isRural()