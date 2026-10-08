[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion.regions](package-summary.html)
2. [IsoWorldRegion](IsoWorldRegion.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [manager](#manager)
   2. [isInPool](#isInPool)
   3. [id](#id)
   4. [color](#color)
   5. [enclosed](#enclosed)
   6. [isoChunkRegions](#isoChunkRegions)
   7. [squareSize](#squareSize)
   8. [roofCnt](#roofCnt)
   9. [isDirtyEnclosed](#isDirtyEnclosed)
   10. [isDirtyRoofed](#isDirtyRoofed)
   11. [neighbors](#neighbors)
   12. [buildingDef](#buildingDef)
   13. [tempLocation](#tempLocation)
6. [Constructor Details](#constructor-detail)
   1. [IsoWorldRegion(IsoRegionManager)](#%3Cinit%3E(zombie.iso.areas.isoregion.regions.IsoRegionManager))
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [getColor()](#getColor())
   3. [size()](#size())
   4. [getSquareSize()](#getSquareSize())
   5. [isInPool()](#isInPool())
   6. [init(int)](#init(int))
   7. [reset()](#reset())
   8. [unlinkNeighbors()](#unlinkNeighbors())
   9. [linkNeighbors()](#linkNeighbors())
   10. [addNeighbor(IsoWorldRegion)](#addNeighbor(zombie.iso.areas.isoregion.regions.IsoWorldRegion))
   11. [removeNeighbor(IsoWorldRegion)](#removeNeighbor(zombie.iso.areas.isoregion.regions.IsoWorldRegion))
   12. [getNeighbors()](#getNeighbors())
   13. [getDebugConnectedNeighborCopy()](#getDebugConnectedNeighborCopy())
   14. [isFogMask()](#isFogMask())
   15. [isPlayerRoom()](#isPlayerRoom())
   16. [isFullyRoofed()](#isFullyRoofed())
   17. [getRoofedPercentage()](#getRoofedPercentage())
   18. [getRoofCnt()](#getRoofCnt())
   19. [addRoof()](#addRoof())
   20. [removeRoofs(int)](#removeRoofs(int))
   21. [addIsoChunkRegion(IsoChunkRegion)](#addIsoChunkRegion(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   22. [removeIsoChunkRegion(IsoChunkRegion)](#removeIsoChunkRegion(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   23. [containsIsoChunkRegion(IsoChunkRegion)](#containsIsoChunkRegion(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   24. [swapIsoChunkRegions(ArrayList)](#swapIsoChunkRegions(java.util.ArrayList))
   25. [resetSquareSize()](#resetSquareSize())
   26. [setDirtyEnclosed()](#setDirtyEnclosed())
   27. [isEnclosed()](#isEnclosed())
   28. [recalcEnclosed()](#recalcEnclosed())
   29. [merge(IsoWorldRegion)](#merge(zombie.iso.areas.isoregion.regions.IsoWorldRegion))
   30. [getDebugIsoChunkRegionCopy()](#getDebugIsoChunkRegionCopy())
   31. [getCellX()](#getCellX())
   32. [getCellY()](#getCellY())
   33. [setBuildingDef(BuildingDef)](#setBuildingDef(zombie.iso.BuildingDef))
   34. [getBuildingDef()](#getBuildingDef())
   35. [clearBuildingDef(ArrayList)](#clearBuildingDef(java.util.ArrayList))
   36. [getChunkRegions()](#getChunkRegions())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class IsoWorldRegion
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.regions.IsoWorldRegion

All Implemented Interfaces:
:   `zombie.iso.areas.isoregion.regions.IWorldRegion`

---

public final class IsoWorldRegion
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.iso.areas.isoregion.regions.IWorldRegion

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private BuildingDef`

  `buildingDef`

  `private Color`

  `color`

  `private boolean`

  `enclosed`

  `private int`

  `id`

  `private boolean`

  `isDirtyEnclosed`

  `private boolean`

  `isDirtyRoofed`

  `private boolean`

  `isInPool`

  `private ArrayList<IsoChunkRegion>`

  `isoChunkRegions`

  `private final zombie.iso.areas.isoregion.regions.IsoRegionManager`

  `manager`

  `private final ArrayList<IsoWorldRegion>`

  `neighbors`

  `private int`

  `roofCnt`

  `private int`

  `squareSize`

  `(package private) static final IsoGameCharacter.Location`

  `tempLocation`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `IsoWorldRegion(zombie.iso.areas.isoregion.regions.IsoRegionManager manager)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addIsoChunkRegion(IsoChunkRegion region)`

  `private void`

  `addNeighbor(IsoWorldRegion mr)`

  `protected void`

  `addRoof()`

  `void`

  `clearBuildingDef(ArrayList<IsoGameCharacter.Location> changedCells)`

  `boolean`

  `containsIsoChunkRegion(IsoChunkRegion region)`

  `BuildingDef`

  `getBuildingDef()`

  `int`

  `getCellX()`

  `int`

  `getCellY()`

  `List<IsoChunkRegion>`

  `getChunkRegions()`

  `Color`

  `getColor()`

  `ArrayList<IsoWorldRegion>`

  `getDebugConnectedNeighborCopy()`

  `ArrayList<IsoChunkRegion>`

  `getDebugIsoChunkRegionCopy()`

  `int`

  `getID()`

  `ArrayList<IsoWorldRegion>`

  `getNeighbors()`

  `int`

  `getRoofCnt()`

  `float`

  `getRoofedPercentage()`

  `int`

  `getSquareSize()`

  `protected void`

  `init(int id)`

  `boolean`

  `isEnclosed()`

  `boolean`

  `isFogMask()`

  `boolean`

  `isFullyRoofed()`

  `protected boolean`

  `isInPool()`

  `boolean`

  `isPlayerRoom()`

  `void`

  `linkNeighbors()`

  `void`

  `merge(IsoWorldRegion other)`

  `private void`

  `recalcEnclosed()`

  `protected void`

  `removeIsoChunkRegion(IsoChunkRegion region)`

  `private void`

  `removeNeighbor(IsoWorldRegion mr)`

  `protected void`

  `removeRoofs(int roofs)`

  `protected IsoWorldRegion`

  `reset()`

  `protected void`

  `resetSquareSize()`

  `void`

  `setBuildingDef(BuildingDef buildingDef)`

  `protected void`

  `setDirtyEnclosed()`

  `int`

  `size()`

  `ArrayList<IsoChunkRegion>`

  `swapIsoChunkRegions(ArrayList<IsoChunkRegion> newlist)`

  `void`

  `unlinkNeighbors()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### manager

    private final zombie.iso.areas.isoregion.regions.IsoRegionManager manager
  + ### isInPool

    private boolean isInPool
  + ### id

    private int id
  + ### color

    private [Color](../../../../core/Color.html "class in zombie.core") color
  + ### enclosed

    private boolean enclosed
  + ### isoChunkRegions

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> isoChunkRegions
  + ### squareSize

    private int squareSize
  + ### roofCnt

    private int roofCnt
  + ### isDirtyEnclosed

    private boolean isDirtyEnclosed
  + ### isDirtyRoofed

    private boolean isDirtyRoofed
  + ### neighbors

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> neighbors
  + ### buildingDef

    private [BuildingDef](../../../BuildingDef.html "class in zombie.iso") buildingDef
  + ### tempLocation

    static final [IsoGameCharacter.Location](../../../../characters/IsoGameCharacter.Location.html "class in zombie.characters") tempLocation
* Constructor Details
  -------------------

  + ### IsoWorldRegion

    protected IsoWorldRegion(zombie.iso.areas.isoregion.regions.IsoRegionManager manager)
* Method Details
  --------------

  + ### getID

    public int getID()
  + ### getColor

    public [Color](../../../../core/Color.html "class in zombie.core") getColor()
  + ### size

    public int size()
  + ### getSquareSize

    public int getSquareSize()

    Specified by:
    :   `getSquareSize` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### isInPool

    protected boolean isInPool()
  + ### init

    protected void init(int id)
  + ### reset

    protected [IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") reset()
  + ### unlinkNeighbors

    public void unlinkNeighbors()
  + ### linkNeighbors

    public void linkNeighbors()
  + ### addNeighbor

    private void addNeighbor([IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") mr)
  + ### removeNeighbor

    private void removeNeighbor([IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") mr)
  + ### getNeighbors

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> getNeighbors()

    Specified by:
    :   `getNeighbors` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### getDebugConnectedNeighborCopy

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> getDebugConnectedNeighborCopy()

    Specified by:
    :   `getDebugConnectedNeighborCopy` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### isFogMask

    public boolean isFogMask()

    Specified by:
    :   `isFogMask` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### isPlayerRoom

    public boolean isPlayerRoom()

    Specified by:
    :   `isPlayerRoom` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### isFullyRoofed

    public boolean isFullyRoofed()

    Specified by:
    :   `isFullyRoofed` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### getRoofedPercentage

    public float getRoofedPercentage()
  + ### getRoofCnt

    public int getRoofCnt()

    Specified by:
    :   `getRoofCnt` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### addRoof

    protected void addRoof()
  + ### removeRoofs

    protected void removeRoofs(int roofs)
  + ### addIsoChunkRegion

    public void addIsoChunkRegion([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") region)
  + ### removeIsoChunkRegion

    protected void removeIsoChunkRegion([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") region)
  + ### containsIsoChunkRegion

    public boolean containsIsoChunkRegion([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") region)
  + ### swapIsoChunkRegions

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> swapIsoChunkRegions([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> newlist)
  + ### resetSquareSize

    protected void resetSquareSize()
  + ### setDirtyEnclosed

    protected void setDirtyEnclosed()
  + ### isEnclosed

    public boolean isEnclosed()
  + ### recalcEnclosed

    private void recalcEnclosed()
  + ### merge

    public void merge([IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") other)
  + ### getDebugIsoChunkRegionCopy

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> getDebugIsoChunkRegionCopy()

    Specified by:
    :   `getDebugIsoChunkRegionCopy` in interface `zombie.iso.areas.isoregion.regions.IWorldRegion`
  + ### getCellX

    public int getCellX()
  + ### getCellY

    public int getCellY()
  + ### setBuildingDef

    public void setBuildingDef([BuildingDef](../../../BuildingDef.html "class in zombie.iso") buildingDef)
  + ### getBuildingDef

    public [BuildingDef](../../../BuildingDef.html "class in zombie.iso") getBuildingDef()
  + ### clearBuildingDef

    public void clearBuildingDef([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.Location](../../../../characters/IsoGameCharacter.Location.html "class in zombie.characters")> changedCells)
  + ### getChunkRegions

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> getChunkRegions()