[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion.data](package-summary.html)
2. [DataChunk](DataChunk.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [cell](#cell)
   2. [hashId](#hashId)
   3. [chunkX](#chunkX)
   4. [chunkY](#chunkY)
   5. [highestZ](#highestZ)
   6. [lastUpdateStamp](#lastUpdateStamp)
   7. [activeZLayers](#activeZLayers)
   8. [dirtyZLayers](#dirtyZLayers)
   9. [squareFlags](#squareFlags)
   10. [regionIds](#regionIds)
   11. [chunkRegions](#chunkRegions)
   12. [selectedFlags](#selectedFlags)
   13. [tempWorldRegions](#tempWorldRegions)
   14. [tmpSquares](#tmpSquares)
   15. [tmpLinkedChunks](#tmpLinkedChunks)
   16. [exploredPositions](#exploredPositions)
   17. [lastCurRegion](#lastCurRegion)
   18. [lastOtherRegionFullConnect](#lastOtherRegionFullConnect)
   19. [oldList](#oldList)
   20. [chunkQueue](#chunkQueue)
6. [Constructor Details](#constructor-detail)
   1. [DataChunk(int, int, DataCell, int)](#%3Cinit%3E(int,int,zombie.iso.areas.isoregion.data.DataCell,int))
7. [Method Details](#method-detail)
   1. [getHashId()](#getHashId())
   2. [getChunkX()](#getChunkX())
   3. [getChunkY()](#getChunkY())
   4. [getCellX()](#getCellX())
   5. [getCellY()](#getCellY())
   6. [getChunkRegions(int)](#getChunkRegions(int))
   7. [getLastUpdateStamp()](#getLastUpdateStamp())
   8. [setLastUpdateStamp(long)](#setLastUpdateStamp(long))
   9. [isDirty(int)](#isDirty(int))
   10. [setDirty(int)](#setDirty(int))
   11. [setDirtyAllActive()](#setDirtyAllActive())
   12. [unsetDirtyAll()](#unsetDirtyAll())
   13. [validCoords(int, int, int)](#validCoords(int,int,int))
   14. [getCoord1D(int, int, int)](#getCoord1D(int,int,int))
   15. [getSquare(int, int, int)](#getSquare(int,int,int))
   16. [getSquare(int, int, int, boolean)](#getSquare(int,int,int,boolean))
   17. [setOrAddSquare(int, int, int, byte)](#setOrAddSquare(int,int,int,byte))
   18. [setOrAddSquare(int, int, int, byte, boolean)](#setOrAddSquare(int,int,int,byte,boolean))
   19. [ensureSquares(int)](#ensureSquares(int))
   20. [ensureSquareArray(int)](#ensureSquareArray(int))
   21. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   22. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   23. [setSelectedFlags(int, int, int)](#setSelectedFlags(int,int,int))
   24. [selectedHasFlags(byte)](#selectedHasFlags(byte))
   25. [squareHasFlags(int, int, int, byte)](#squareHasFlags(int,int,int,byte))
   26. [squareHasFlags(int, byte)](#squareHasFlags(int,byte))
   27. [squareGetFlags(int, int, int)](#squareGetFlags(int,int,int))
   28. [squareGetFlags(int)](#squareGetFlags(int))
   29. [squareAddFlags(int, int, int, byte)](#squareAddFlags(int,int,int,byte))
   30. [squareAddFlags(int, byte)](#squareAddFlags(int,byte))
   31. [squareRemoveFlags(int, int, int, byte)](#squareRemoveFlags(int,int,int,byte))
   32. [squareRemoveFlags(int, byte)](#squareRemoveFlags(int,byte))
   33. [squareCanConnect(int, int, int, byte)](#squareCanConnect(int,int,int,byte))
   34. [squareCanConnect(int, int, byte)](#squareCanConnect(int,int,byte))
   35. [getIsoChunkRegion(int, int, int)](#getIsoChunkRegion(int,int,int))
   36. [getIsoChunkRegion(int, int)](#getIsoChunkRegion(int,int))
   37. [setRegion(int, int, int, byte)](#setRegion(int,int,int,byte))
   38. [clearBuildingDefs(ArrayList)](#clearBuildingDefs(java.util.ArrayList))
   39. [clearBuildingDefs(IsoWorldRegion, ArrayList, HashSet)](#clearBuildingDefs(zombie.iso.areas.isoregion.regions.IsoWorldRegion,java.util.ArrayList,java.util.HashSet))
   40. [recalculate()](#recalculate())
   41. [recalculate(int)](#recalculate(int))
   42. [floodFill(int, int, int)](#floodFill(int,int,int))
   43. [isExploredPosition(int, int)](#isExploredPosition(int,int))
   44. [setExploredPosition(int, int)](#setExploredPosition(int,int))
   45. [clearExploredPositions()](#clearExploredPositions())
   46. [getNeighbor(DataSquarePos, byte)](#getNeighbor(zombie.iso.areas.isoregion.data.DataSquarePos,byte))
   47. [link(DataChunk, DataChunk, DataChunk, DataChunk)](#link(zombie.iso.areas.isoregion.data.DataChunk,zombie.iso.areas.isoregion.data.DataChunk,zombie.iso.areas.isoregion.data.DataChunk,zombie.iso.areas.isoregion.data.DataChunk))
   48. [linkRegionsOnSide(int, DataChunk, byte)](#linkRegionsOnSide(int,zombie.iso.areas.isoregion.data.DataChunk,byte))
   49. [resetEnclosedSide(int, byte)](#resetEnclosedSide(int,byte))
   50. [interConnect()](#interConnect())
   51. [floodFillExpandWorldRegion(IsoChunkRegion, IsoWorldRegion)](#floodFillExpandWorldRegion(zombie.iso.areas.isoregion.regions.IsoChunkRegion,zombie.iso.areas.isoregion.regions.IsoWorldRegion))
   52. [recalcRoofs()](#recalcRoofs())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class DataChunk
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.data.DataChunk

---

public final class DataChunk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean[]`

  `activeZLayers`

  `private final DataCell`

  `cell`

  `private static final ArrayDeque<IsoChunkRegion>`

  `chunkQueue`

  `private final ArrayList<ArrayList<IsoChunkRegion>>`

  `chunkRegions`

  `private final int`

  `chunkX`

  `private final int`

  `chunkY`

  `private final boolean[]`

  `dirtyZLayers`

  `private static final boolean[]`

  `exploredPositions`

  `private final int`

  `hashId`

  `private int`

  `highestZ`

  `private static IsoChunkRegion`

  `lastCurRegion`

  `private static IsoChunkRegion`

  `lastOtherRegionFullConnect`

  `private long`

  `lastUpdateStamp`

  `private static ArrayList<IsoChunkRegion>`

  `oldList`

  `private byte[]`

  `regionIds`

  `private static byte`

  `selectedFlags`

  `private byte[]`

  `squareFlags`

  `(package private) static final HashSet<IsoWorldRegion>`

  `tempWorldRegions`

  `private static final HashSet<Integer>`

  `tmpLinkedChunks`

  `private static final ArrayDeque<zombie.iso.areas.isoregion.data.DataSquarePos>`

  `tmpSquares`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DataChunk(int chunkX,
  int chunkY,
  DataCell cell,
  int chunkID)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `clearBuildingDefs(ArrayList<IsoGameCharacter.Location> changedCells)`

  `(package private) void`

  `clearBuildingDefs(IsoWorldRegion isoWorldRegion,
  ArrayList<IsoGameCharacter.Location> changedCells,
  HashSet<IsoWorldRegion> done)`

  `private void`

  `clearExploredPositions()`

  `private void`

  `ensureSquareArray(int zlayer)`

  `private void`

  `ensureSquares(int zlayer)`

  `private IsoChunkRegion`

  `floodFill(int x,
  int y,
  int z)`

  `private void`

  `floodFillExpandWorldRegion(IsoChunkRegion start,
  IsoWorldRegion worldRegion)`

  `int`

  `getCellX()`

  `int`

  `getCellY()`

  `(package private) ArrayList<IsoChunkRegion>`

  `getChunkRegions(int z)`

  `int`

  `getChunkX()`

  `int`

  `getChunkY()`

  `private int`

  `getCoord1D(int x,
  int y,
  int z)`

  `(package private) int`

  `getHashId()`

  `private IsoChunkRegion`

  `getIsoChunkRegion(int coord1D,
  int z)`

  `IsoChunkRegion`

  `getIsoChunkRegion(int x,
  int y,
  int z)`

  `long`

  `getLastUpdateStamp()`

  `private zombie.iso.areas.isoregion.data.DataSquarePos`

  `getNeighbor(zombie.iso.areas.isoregion.data.DataSquarePos pos,
  byte dir)`

  `byte`

  `getSquare(int x,
  int y,
  int z)`

  `byte`

  `getSquare(int x,
  int y,
  int z,
  boolean ignoreCoordCheck)`

  `(package private) void`

  `interConnect()`

  `private boolean`

  `isDirty(int z)`

  `private boolean`

  `isExploredPosition(int coord1D,
  int z)`

  `(package private) void`

  `link(DataChunk n,
  DataChunk w,
  DataChunk s,
  DataChunk e)`

  `private void`

  `linkRegionsOnSide(int z,
  DataChunk opposite,
  byte dir)`

  `void`

  `load(ByteBuffer bb,
  int worldVersion,
  boolean readLength)`

  `(package private) void`

  `recalcRoofs()`

  `(package private) void`

  `recalculate()`

  `private void`

  `recalculate(int z)`

  `private void`

  `resetEnclosedSide(int z,
  byte dir)`

  `void`

  `save(ByteBuffer bb)`

  `boolean`

  `selectedHasFlags(byte flags)`

  `private void`

  `setDirty(int z)`

  `void`

  `setDirtyAllActive()`

  `private void`

  `setExploredPosition(int coord1D,
  int z)`

  `void`

  `setLastUpdateStamp(long lastUpdateStamp)`

  `private byte`

  `setOrAddSquare(int x,
  int y,
  int z,
  byte flags)`

  `(package private) byte`

  `setOrAddSquare(int x,
  int y,
  int z,
  byte flags,
  boolean ignoreCoordCheck)`

  `void`

  `setRegion(int x,
  int y,
  int z,
  byte regionIndex)`

  `void`

  `setSelectedFlags(int x,
  int y,
  int z)`

  `private void`

  `squareAddFlags(int coord1D,
  byte flags)`

  `private void`

  `squareAddFlags(int x,
  int y,
  int z,
  byte flags)`

  `private boolean`

  `squareCanConnect(int coord1D,
  int z,
  byte dir)`

  `private boolean`

  `squareCanConnect(int x,
  int y,
  int z,
  byte dir)`

  `private byte`

  `squareGetFlags(int coord1D)`

  `byte`

  `squareGetFlags(int x,
  int y,
  int z)`

  `private boolean`

  `squareHasFlags(int coord1D,
  byte flags)`

  `private boolean`

  `squareHasFlags(int x,
  int y,
  int z,
  byte flags)`

  `private void`

  `squareRemoveFlags(int coord1D,
  byte flags)`

  `private void`

  `squareRemoveFlags(int x,
  int y,
  int z,
  byte flags)`

  `(package private) void`

  `unsetDirtyAll()`

  `private boolean`

  `validCoords(int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### cell

    private final [DataCell](DataCell.html "class in zombie.iso.areas.isoregion.data") cell
  + ### hashId

    private final int hashId
  + ### chunkX

    private final int chunkX
  + ### chunkY

    private final int chunkY
  + ### highestZ

    private int highestZ
  + ### lastUpdateStamp

    private long lastUpdateStamp
  + ### activeZLayers

    private final boolean[] activeZLayers
  + ### dirtyZLayers

    private final boolean[] dirtyZLayers
  + ### squareFlags

    private byte[] squareFlags
  + ### regionIds

    private byte[] regionIds
  + ### chunkRegions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")>> chunkRegions
  + ### selectedFlags

    private static byte selectedFlags
  + ### tempWorldRegions

    static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[IsoWorldRegion](../regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> tempWorldRegions
  + ### tmpSquares

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<zombie.iso.areas.isoregion.data.DataSquarePos> tmpSquares
  + ### tmpLinkedChunks

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> tmpLinkedChunks
  + ### exploredPositions

    private static final boolean[] exploredPositions
  + ### lastCurRegion

    private static [IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") lastCurRegion
  + ### lastOtherRegionFullConnect

    private static [IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") lastOtherRegionFullConnect
  + ### oldList

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> oldList
  + ### chunkQueue

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> chunkQueue
* Constructor Details
  -------------------

  + ### DataChunk

    DataChunk(int chunkX,
    int chunkY,
    [DataCell](DataCell.html "class in zombie.iso.areas.isoregion.data") cell,
    int chunkID)
* Method Details
  --------------

  + ### getHashId

    int getHashId()
  + ### getChunkX

    public int getChunkX()
  + ### getChunkY

    public int getChunkY()
  + ### getCellX

    public int getCellX()
  + ### getCellY

    public int getCellY()
  + ### getChunkRegions

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions")> getChunkRegions(int z)
  + ### getLastUpdateStamp

    public long getLastUpdateStamp()
  + ### setLastUpdateStamp

    public void setLastUpdateStamp(long lastUpdateStamp)
  + ### isDirty

    private boolean isDirty(int z)
  + ### setDirty

    private void setDirty(int z)
  + ### setDirtyAllActive

    public void setDirtyAllActive()
  + ### unsetDirtyAll

    void unsetDirtyAll()
  + ### validCoords

    private boolean validCoords(int x,
    int y,
    int z)
  + ### getCoord1D

    private int getCoord1D(int x,
    int y,
    int z)
  + ### getSquare

    public byte getSquare(int x,
    int y,
    int z)
  + ### getSquare

    public byte getSquare(int x,
    int y,
    int z,
    boolean ignoreCoordCheck)
  + ### setOrAddSquare

    private byte setOrAddSquare(int x,
    int y,
    int z,
    byte flags)
  + ### setOrAddSquare

    byte setOrAddSquare(int x,
    int y,
    int z,
    byte flags,
    boolean ignoreCoordCheck)
  + ### ensureSquares

    private void ensureSquares(int zlayer)
  + ### ensureSquareArray

    private void ensureSquareArray(int zlayer)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion,
    boolean readLength)
  + ### setSelectedFlags

    public void setSelectedFlags(int x,
    int y,
    int z)
  + ### selectedHasFlags

    public boolean selectedHasFlags(byte flags)
  + ### squareHasFlags

    private boolean squareHasFlags(int x,
    int y,
    int z,
    byte flags)
  + ### squareHasFlags

    private boolean squareHasFlags(int coord1D,
    byte flags)
  + ### squareGetFlags

    public byte squareGetFlags(int x,
    int y,
    int z)
  + ### squareGetFlags

    private byte squareGetFlags(int coord1D)
  + ### squareAddFlags

    private void squareAddFlags(int x,
    int y,
    int z,
    byte flags)
  + ### squareAddFlags

    private void squareAddFlags(int coord1D,
    byte flags)
  + ### squareRemoveFlags

    private void squareRemoveFlags(int x,
    int y,
    int z,
    byte flags)
  + ### squareRemoveFlags

    private void squareRemoveFlags(int coord1D,
    byte flags)
  + ### squareCanConnect

    private boolean squareCanConnect(int x,
    int y,
    int z,
    byte dir)
  + ### squareCanConnect

    private boolean squareCanConnect(int coord1D,
    int z,
    byte dir)
  + ### getIsoChunkRegion

    public [IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") getIsoChunkRegion(int x,
    int y,
    int z)
  + ### getIsoChunkRegion

    private [IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") getIsoChunkRegion(int coord1D,
    int z)
  + ### setRegion

    public void setRegion(int x,
    int y,
    int z,
    byte regionIndex)
  + ### clearBuildingDefs

    void clearBuildingDefs([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.Location](../../../../characters/IsoGameCharacter.Location.html "class in zombie.characters")> changedCells)
  + ### clearBuildingDefs

    void clearBuildingDefs([IsoWorldRegion](../regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") isoWorldRegion,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.Location](../../../../characters/IsoGameCharacter.Location.html "class in zombie.characters")> changedCells,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[IsoWorldRegion](../regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> done)
  + ### recalculate

    void recalculate()
  + ### recalculate

    private void recalculate(int z)
  + ### floodFill

    private [IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") floodFill(int x,
    int y,
    int z)
  + ### isExploredPosition

    private boolean isExploredPosition(int coord1D,
    int z)
  + ### setExploredPosition

    private void setExploredPosition(int coord1D,
    int z)
  + ### clearExploredPositions

    private void clearExploredPositions()
  + ### getNeighbor

    private zombie.iso.areas.isoregion.data.DataSquarePos getNeighbor(zombie.iso.areas.isoregion.data.DataSquarePos pos,
    byte dir)
  + ### link

    void link([DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") n,
    [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") w,
    [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") s,
    [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") e)
  + ### linkRegionsOnSide

    private void linkRegionsOnSide(int z,
    [DataChunk](DataChunk.html "class in zombie.iso.areas.isoregion.data") opposite,
    byte dir)
  + ### resetEnclosedSide

    private void resetEnclosedSide(int z,
    byte dir)
  + ### interConnect

    void interConnect()
  + ### floodFillExpandWorldRegion

    private void floodFillExpandWorldRegion([IsoChunkRegion](../regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") start,
    [IsoWorldRegion](../regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions") worldRegion)
  + ### recalcRoofs

    void recalcRoofs()