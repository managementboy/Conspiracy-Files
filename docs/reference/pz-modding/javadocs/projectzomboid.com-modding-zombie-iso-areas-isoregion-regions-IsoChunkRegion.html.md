[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion.regions](package-summary.html)
2. [IsoChunkRegion](IsoChunkRegion.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [manager](#manager)
   2. [isInPool](#isInPool)
   3. [color](#color)
   4. [id](#id)
   5. [dataChunk](#dataChunk)
   6. [zLayer](#zLayer)
   7. [squareSize](#squareSize)
   8. [roofCnt](#roofCnt)
   9. [chunkBorderSquaresCnt](#chunkBorderSquaresCnt)
   10. [enclosed](#enclosed)
   11. [enclosedCache](#enclosedCache)
   12. [connectedNeighbors](#connectedNeighbors)
   13. [allNeighbors](#allNeighbors)
   14. [isDirtyEnclosed](#isDirtyEnclosed)
   15. [isoWorldRegion](#isoWorldRegion)
6. [Constructor Details](#constructor-detail)
   1. [IsoChunkRegion(IsoRegionManager)](#%3Cinit%3E(zombie.iso.areas.isoregion.regions.IsoRegionManager))
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [getSquareSize()](#getSquareSize())
   3. [getColor()](#getColor())
   4. [getzLayer()](#getzLayer())
   5. [getIsoWorldRegion()](#getIsoWorldRegion())
   6. [setIsoWorldRegion(IsoWorldRegion)](#setIsoWorldRegion(zombie.iso.areas.isoregion.regions.IsoWorldRegion))
   7. [isInPool()](#isInPool())
   8. [getDataChunk()](#getDataChunk())
   9. [init(int, DataChunk, int)](#init(int,zombie.iso.areas.isoregion.data.DataChunk,int))
   10. [reset()](#reset())
   11. [unlinkFromIsoWorldRegion()](#unlinkFromIsoWorldRegion())
   12. [getRoofCnt()](#getRoofCnt())
   13. [addRoof()](#addRoof())
   14. [resetRoofCnt()](#resetRoofCnt())
   15. [addSquareCount()](#addSquareCount())
   16. [getChunkBorderSquaresCnt()](#getChunkBorderSquaresCnt())
   17. [addChunkBorderSquaresCnt()](#addChunkBorderSquaresCnt())
   18. [removeChunkBorderSquaresCnt()](#removeChunkBorderSquaresCnt())
   19. [resetChunkBorderSquaresCnt()](#resetChunkBorderSquaresCnt())
   20. [resetEnclosed()](#resetEnclosed())
   21. [setEnclosed(byte, boolean)](#setEnclosed(byte,boolean))
   22. [setDirtyEnclosed()](#setDirtyEnclosed())
   23. [getIsEnclosed()](#getIsEnclosed())
   24. [getConnectedNeighbors()](#getConnectedNeighbors())
   25. [addConnectedNeighbor(IsoChunkRegion)](#addConnectedNeighbor(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   26. [removeConnectedNeighbor(IsoChunkRegion)](#removeConnectedNeighbor(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   27. [getNeighborCount()](#getNeighborCount())
   28. [getAllNeighbors()](#getAllNeighbors())
   29. [addNeighbor(IsoChunkRegion)](#addNeighbor(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   30. [removeNeighbor(IsoChunkRegion)](#removeNeighbor(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   31. [unlinkNeighbors()](#unlinkNeighbors())
   32. [getDebugConnectedNeighborCopy()](#getDebugConnectedNeighborCopy())
   33. [containsConnectedNeighbor(IsoChunkRegion)](#containsConnectedNeighbor(zombie.iso.areas.isoregion.regions.IsoChunkRegion))
   34. [containsConnectedNeighborID(int)](#containsConnectedNeighborID(int))
   35. [getConnectedNeighborWithLargestIsoWorldRegion()](#getConnectedNeighborWithLargestIsoWorldRegion())
   36. [getFirstNeighborWithIsoWorldRegion()](#getFirstNeighborWithIsoWorldRegion())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class IsoChunkRegion
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.regions.IsoChunkRegion

All Implemented Interfaces:
:   `zombie.iso.areas.isoregion.regions.IChunkRegion`

---

public final class IsoChunkRegion
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.iso.areas.isoregion.regions.IChunkRegion

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final List<IsoChunkRegion>`

  `allNeighbors`

  `private byte`

  `chunkBorderSquaresCnt`

  `private Color`

  `color`

  `private final List<IsoChunkRegion>`

  `connectedNeighbors`

  `private DataChunk`

  `dataChunk`

  `private final boolean[]`

  `enclosed`

  `private boolean`

  `enclosedCache`

  `private int`

  `id`

  `private boolean`

  `isDirtyEnclosed`

  `private boolean`

  `isInPool`

  `private IsoWorldRegion`

  `isoWorldRegion`

  `private final zombie.iso.areas.isoregion.regions.IsoRegionManager`

  `manager`

  `private byte`

  `roofCnt`

  `private byte`

  `squareSize`

  `private byte`

  `zLayer`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `IsoChunkRegion(zombie.iso.areas.isoregion.regions.IsoRegionManager manager)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChunkBorderSquaresCnt()`

  `void`

  `addConnectedNeighbor(IsoChunkRegion neighbor)`

  `void`

  `addNeighbor(IsoChunkRegion neighbor)`

  `void`

  `addRoof()`

  `void`

  `addSquareCount()`

  `boolean`

  `containsConnectedNeighbor(IsoChunkRegion n)`

  `boolean`

  `containsConnectedNeighborID(int id)`

  `protected List<IsoChunkRegion>`

  `getAllNeighbors()`

  `int`

  `getChunkBorderSquaresCnt()`

  `Color`

  `getColor()`

  `List<IsoChunkRegion>`

  `getConnectedNeighbors()`

  `IsoChunkRegion`

  `getConnectedNeighborWithLargestIsoWorldRegion()`

  `DataChunk`

  `getDataChunk()`

  `ArrayList<IsoChunkRegion>`

  `getDebugConnectedNeighborCopy()`

  `protected IsoChunkRegion`

  `getFirstNeighborWithIsoWorldRegion()`

  `int`

  `getID()`

  `boolean`

  `getIsEnclosed()`

  `IsoWorldRegion`

  `getIsoWorldRegion()`

  `int`

  `getNeighborCount()`

  `int`

  `getRoofCnt()`

  `int`

  `getSquareSize()`

  `int`

  `getzLayer()`

  `protected void`

  `init(int id,
  DataChunk dataChunk,
  int zLayer)`

  `protected boolean`

  `isInPool()`

  `protected void`

  `removeChunkBorderSquaresCnt()`

  `protected void`

  `removeConnectedNeighbor(IsoChunkRegion neighbor)`

  `protected void`

  `removeNeighbor(IsoChunkRegion neighbor)`

  `protected IsoChunkRegion`

  `reset()`

  `protected void`

  `resetChunkBorderSquaresCnt()`

  `private void`

  `resetEnclosed()`

  `void`

  `resetRoofCnt()`

  `protected void`

  `setDirtyEnclosed()`

  `void`

  `setEnclosed(byte dir,
  boolean b)`

  `void`

  `setIsoWorldRegion(IsoWorldRegion mr)`

  `IsoWorldRegion`

  `unlinkFromIsoWorldRegion()`

  `protected void`

  `unlinkNeighbors()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### manager

    private final zombie.iso.areas.isoregion.regions.IsoRegionManager manager
  + ### isInPool

    private boolean isInPool
  + ### color

    private [Color](../../../../core/Color.html "class in zombie.core") color
  + ### id

    private int id
  + ### dataChunk

    private [DataChunk](../data/DataChunk.html "class in zombie.iso.areas.isoregion.data") dataChunk
  + ### zLayer

    private byte zLayer
  + ### squareSize

    private byte squareSize
  + ### roofCnt

    private byte roofCnt
  + ### chunkBorderSquaresCnt

    private byte chunkBorderSquaresCnt
  + ### enclosed

    private final boolean[] enclosed
  + ### enclosedCache

    private boolean enclosedCache
  + ### connectedNeighbors

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> connectedNeighbors
  + ### allNeighbors

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> allNeighbors
  + ### isDirtyEnclosed

    private boolean isDirtyEnclosed
  + ### isoWorldRegion

    private [IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") isoWorldRegion
* Constructor Details
  -------------------

  + ### IsoChunkRegion

    protected IsoChunkRegion(zombie.iso.areas.isoregion.regions.IsoRegionManager manager)
* Method Details
  --------------

  + ### getID

    public int getID()
  + ### getSquareSize

    public int getSquareSize()
  + ### getColor

    public [Color](../../../../core/Color.html "class in zombie.core") getColor()
  + ### getzLayer

    public int getzLayer()
  + ### getIsoWorldRegion

    public [IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") getIsoWorldRegion()
  + ### setIsoWorldRegion

    public void setIsoWorldRegion([IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") mr)
  + ### isInPool

    protected boolean isInPool()
  + ### getDataChunk

    public [DataChunk](../data/DataChunk.html "class in zombie.iso.areas.isoregion.data") getDataChunk()
  + ### init

    protected void init(int id,
    [DataChunk](../data/DataChunk.html "class in zombie.iso.areas.isoregion.data") dataChunk,
    int zLayer)
  + ### reset

    protected [IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") reset()
  + ### unlinkFromIsoWorldRegion

    public [IsoWorldRegion](IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") unlinkFromIsoWorldRegion()
  + ### getRoofCnt

    public int getRoofCnt()
  + ### addRoof

    public void addRoof()
  + ### resetRoofCnt

    public void resetRoofCnt()
  + ### addSquareCount

    public void addSquareCount()
  + ### getChunkBorderSquaresCnt

    public int getChunkBorderSquaresCnt()
  + ### addChunkBorderSquaresCnt

    public void addChunkBorderSquaresCnt()
  + ### removeChunkBorderSquaresCnt

    protected void removeChunkBorderSquaresCnt()
  + ### resetChunkBorderSquaresCnt

    protected void resetChunkBorderSquaresCnt()
  + ### resetEnclosed

    private void resetEnclosed()
  + ### setEnclosed

    public void setEnclosed(byte dir,
    boolean b)
  + ### setDirtyEnclosed

    protected void setDirtyEnclosed()
  + ### getIsEnclosed

    public boolean getIsEnclosed()
  + ### getConnectedNeighbors

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> getConnectedNeighbors()
  + ### addConnectedNeighbor

    public void addConnectedNeighbor([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") neighbor)
  + ### removeConnectedNeighbor

    protected void removeConnectedNeighbor([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") neighbor)
  + ### getNeighborCount

    public int getNeighborCount()
  + ### getAllNeighbors

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> getAllNeighbors()
  + ### addNeighbor

    public void addNeighbor([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") neighbor)
  + ### removeNeighbor

    protected void removeNeighbor([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") neighbor)
  + ### unlinkNeighbors

    protected void unlinkNeighbors()
  + ### getDebugConnectedNeighborCopy

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> getDebugConnectedNeighborCopy()
  + ### containsConnectedNeighbor

    public boolean containsConnectedNeighbor([IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") n)
  + ### containsConnectedNeighborID

    public boolean containsConnectedNeighborID(int id)
  + ### getConnectedNeighborWithLargestIsoWorldRegion

    public [IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") getConnectedNeighborWithLargestIsoWorldRegion()
  + ### getFirstNeighborWithIsoWorldRegion

    protected [IsoChunkRegion](IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") getFirstNeighborWithIsoWorldRegion()