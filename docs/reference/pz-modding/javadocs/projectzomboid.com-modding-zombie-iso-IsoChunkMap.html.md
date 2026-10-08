[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoChunkMap](IsoChunkMap.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [LEVELS](#LEVELS)
   2. [GROUND\_LEVEL](#GROUND_LEVEL)
   3. [TOP\_LEVEL](#TOP_LEVEL)
   4. [BOTTOM\_LEVEL](#BOTTOM_LEVEL)
   5. [OLD\_CHUNKS\_PER\_WIDTH](#OLD_CHUNKS_PER_WIDTH)
   6. [CHUNKS\_PER\_WIDTH](#CHUNKS_PER_WIDTH)
   7. [CHUNK\_SIZE\_IN\_SQUARES](#CHUNK_SIZE_IN_SQUARES)
   8. [SharedChunks](#SharedChunks)
   9. [mpWorldXa](#mpWorldXa)
   10. [mpWorldYa](#mpWorldYa)
   11. [mpWorldZa](#mpWorldZa)
   12. [worldXa](#worldXa)
   13. [worldYa](#worldYa)
   14. [worldZa](#worldZa)
   15. [SWorldX](#SWorldX)
   16. [SWorldY](#SWorldY)
   17. [chunkStore](#chunkStore)
   18. [bSettingChunk](#bSettingChunk)
   19. [START\_CHUNK\_GRID\_WIDTH](#START_CHUNK_GRID_WIDTH)
   20. [chunkGridWidth](#chunkGridWidth)
   21. [chunkWidthInTiles](#chunkWidthInTiles)
   22. [inf](#inf)
   23. [splatByType](#splatByType)
   24. [playerId](#playerId)
   25. [ignore](#ignore)
   26. [worldX](#worldX)
   27. [worldY](#worldY)
   28. [filenameServerRequests](#filenameServerRequests)
   29. [chunksSwapB](#chunksSwapB)
   30. [chunksSwapA](#chunksSwapA)
   31. [readBufferA](#readBufferA)
   32. [xMinTiles](#xMinTiles)
   33. [yMinTiles](#yMinTiles)
   34. [xMaxTiles](#xMaxTiles)
   35. [yMaxTiles](#yMaxTiles)
   36. [cell](#cell)
   37. [checkVehiclesFrequency](#checkVehiclesFrequency)
   38. [hotSaveFrequency](#hotSaveFrequency)
   39. [maxHeight](#maxHeight)
   40. [minHeight](#minHeight)
   41. [ppp\_update](#ppp_update)
6. [Constructor Details](#constructor-detail)
   1. [IsoChunkMap(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
7. [Method Details](#method-detail)
   1. [CalcChunkWidth()](#CalcChunkWidth())
   2. [setWorldStartPos(int, int)](#setWorldStartPos(int,int))
   3. [Dispose()](#Dispose())
   4. [setInitialPos(int, int)](#setInitialPos(int,int))
   5. [processAllLoadGridSquare()](#processAllLoadGridSquare())
   6. [update()](#update())
   7. [updateInternal()](#updateInternal())
   8. [checkVehicles()](#checkVehicles())
   9. [checkIntegrity()](#checkIntegrity())
   10. [checkIntegrityThread()](#checkIntegrityThread())
   11. [LoadChunk(int, int, int, int)](#LoadChunk(int,int,int,int))
   12. [LoadChunkForLater(int, int, int, int)](#LoadChunkForLater(int,int,int,int))
   13. [getChunkForGridSquare(int, int)](#getChunkForGridSquare(int,int))
   14. [getChunkCurrent(int, int)](#getChunkCurrent(int,int))
   15. [setGridSquare(IsoGridSquare, int, int, int)](#setGridSquare(zombie.iso.IsoGridSquare,int,int,int))
   16. [getGridSquare(int, int, int)](#getGridSquare(int,int,int))
   17. [getGridSquareDirect(int, int, int)](#getGridSquareDirect(int,int,int))
   18. [chunkMapSquareToChunkSquareXY(int)](#chunkMapSquareToChunkSquareXY(int))
   19. [chunkMapSquareToChunkMapChunkXY(int)](#chunkMapSquareToChunkMapChunkXY(int))
   20. [isChunkMapSquareOutOfRangeXY(int)](#isChunkMapSquareOutOfRangeXY(int))
   21. [isWorldSquareOutOfRangeZ(int)](#isWorldSquareOutOfRangeZ(int))
   22. [worldSquareToChunkMapSquareX(int)](#worldSquareToChunkMapSquareX(int))
   23. [worldSquareToChunkMapSquareY(int)](#worldSquareToChunkMapSquareY(int))
   24. [getChunk(int, int)](#getChunk(int,int))
   25. [getChunks()](#getChunks())
   26. [setChunk(int, int, IsoChunk)](#setChunk(int,int,zombie.iso.IsoChunk))
   27. [setChunkDirect(IsoChunk, boolean)](#setChunkDirect(zombie.iso.IsoChunk,boolean))
   28. [drawDebugChunkMap()](#drawDebugChunkMap())
   29. [LoadLeft()](#LoadLeft())
   30. [SwapChunkBuffers()](#SwapChunkBuffers())
   31. [setChunk(int, IsoChunk)](#setChunk(int,zombie.iso.IsoChunk))
   32. [getChunk(int)](#getChunk(int))
   33. [LoadRight()](#LoadRight())
   34. [LoadUp()](#LoadUp())
   35. [LoadDown()](#LoadDown())
   36. [UpdateCellCache()](#UpdateCellCache())
   37. [Up()](#Up())
   38. [Down()](#Down())
   39. [Left()](#Left())
   40. [Right()](#Right())
   41. [getWorldXMin()](#getWorldXMin())
   42. [getWorldYMin()](#getWorldYMin())
   43. [ProcessChunkPos(IsoGameCharacter)](#ProcessChunkPos(zombie.characters.IsoGameCharacter))
   44. [calculateZExtentsForChunkMap()](#calculateZExtentsForChunkMap())
   45. [getRoom(int)](#getRoom(int))
   46. [getWidthInTiles()](#getWidthInTiles())
   47. [getWorldXMinTiles()](#getWorldXMinTiles())
   48. [getWorldYMinTiles()](#getWorldYMinTiles())
   49. [getWorldXMaxTiles()](#getWorldXMaxTiles())
   50. [getWorldYMaxTiles()](#getWorldYMaxTiles())
   51. [Save()](#Save())
   52. [renderBloodForChunks(int)](#renderBloodForChunks(int))
   53. [copy(IsoChunkMap)](#copy(zombie.iso.IsoChunkMap))
   54. [releaseChunkBeingLoaded(int, int)](#releaseChunkBeingLoaded(int,int))
   55. [Unload()](#Unload())
   56. [isGridSquareOutOfRangeZ(int)](#isGridSquareOutOfRangeZ(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoChunkMap
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoChunkMap

---

public final class IsoChunkMap
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `BOTTOM_LEVEL`

  `static final ReentrantLock`

  `bSettingChunk`

  `private final IsoCell`

  `cell`

  `private final zombie.core.utils.UpdateLimit`

  `checkVehiclesFrequency`

  `static final int`

  `CHUNK_SIZE_IN_SQUARES`

  `static int`

  `chunkGridWidth`

  `static final int`

  `CHUNKS_PER_WIDTH`

  `protected IsoChunk[]`

  `chunksSwapA`

  `protected IsoChunk[]`

  `chunksSwapB`

  `static final zombie.util.CappedConcurrentQueue<IsoChunk>`

  `chunkStore`

  `static int`

  `chunkWidthInTiles`

  `final ArrayList<String>`

  `filenameServerRequests`

  `static final int`

  `GROUND_LEVEL`

  `private final zombie.core.utils.UpdateLimit`

  `hotSaveFrequency`

  `boolean`

  `ignore`

  `private static final ColorInfo`

  `inf`

  `static final int`

  `LEVELS`

  `int`

  `maxHeight`

  `int`

  `minHeight`

  `static int`

  `mpWorldXa`

  `static int`

  `mpWorldYa`

  `static int`

  `mpWorldZa`

  `static final int`

  `OLD_CHUNKS_PER_WIDTH`

  `int`

  `playerId`

  `static final zombie.core.profiling.PerformanceProfileProbe`

  `ppp_update`

  `(package private) boolean`

  `readBufferA`

  `static final HashMap<Integer,IsoChunk>`

  `SharedChunks`

  `private static final ArrayList<ArrayList<zombie.iso.IsoFloorBloodSplat>>`

  `splatByType`

  `private static final int`

  `START_CHUNK_GRID_WIDTH`

  `static final int[]`

  `SWorldX`

  `static final int[]`

  `SWorldY`

  `static final int`

  `TOP_LEVEL`

  `int`

  `worldX`

  `static int`

  `worldXa`

  `int`

  `worldY`

  `static int`

  `worldYa`

  `static int`

  `worldZa`

  `(package private) int`

  `xMaxTiles`

  `(package private) int`

  `xMinTiles`

  `(package private) int`

  `yMaxTiles`

  `(package private) int`

  `yMinTiles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoChunkMap(IsoCell cell)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `CalcChunkWidth()`

  `void`

  `calculateZExtentsForChunkMap()`

  `void`

  `checkIntegrity()`

  `void`

  `checkIntegrityThread()`

  `private void`

  `checkVehicles()`

  `private static int`

  `chunkMapSquareToChunkMapChunkXY(int chunkMapSquareXY)`

  `private int`

  `chunkMapSquareToChunkSquareXY(int chunkMapSquareXY)`

  `void`

  `copy(IsoChunkMap from)`

  `void`

  `Dispose()`

  `private void`

  `Down()`

  `void`

  `drawDebugChunkMap()`

  `private IsoChunk`

  `getChunk(int n)`

  `IsoChunk`

  `getChunk(int chunkMapChunkX,
  int chunkMapChunkY)`

  `IsoChunk`

  `getChunkCurrent(int x,
  int y)`

  `IsoChunk`

  `getChunkForGridSquare(int worldSquareX,
  int worldSquareY)`

  `IsoChunk[]`

  `getChunks()`

  `IsoGridSquare`

  `getGridSquare(int worldSquareX,
  int worldSquareY,
  int worldSquareZ)`

  `IsoGridSquare`

  `getGridSquareDirect(int chunkMapSquareX,
  int chunkMapSquareY,
  int worldSquareZ)`

  `IsoRoom`

  `getRoom(int iD)`

  `int`

  `getWidthInTiles()`

  `int`

  `getWorldXMaxTiles()`

  `int`

  `getWorldXMin()`

  `int`

  `getWorldXMinTiles()`

  `int`

  `getWorldYMaxTiles()`

  `int`

  `getWorldYMin()`

  `int`

  `getWorldYMinTiles()`

  `private boolean`

  `isChunkMapSquareOutOfRangeXY(int chunkMapSquareXY)`

  `static boolean`

  `isGridSquareOutOfRangeZ(int tileZ)`

  `private boolean`

  `isWorldSquareOutOfRangeZ(int tileZ)`

  `private void`

  `Left()`

  `void`

  `LoadChunk(int wx,
  int wy,
  int x,
  int y)`

  `IsoChunk`

  `LoadChunkForLater(int wx,
  int wy,
  int x,
  int y)`

  `private void`

  `LoadDown()`

  `private void`

  `LoadLeft()`

  `private void`

  `LoadRight()`

  `private void`

  `LoadUp()`

  `void`

  `processAllLoadGridSquare()`

  `void`

  `ProcessChunkPos(IsoGameCharacter chr)`

  `private void`

  `releaseChunkBeingLoaded(int wx,
  int wy)`

  `void`

  `renderBloodForChunks(int zza)`

  `private void`

  `Right()`

  `void`

  `Save()`

  `private void`

  `setChunk(int x,
  int y,
  IsoChunk c)`

  `private void`

  `setChunk(int n,
  IsoChunk c)`

  `boolean`

  `setChunkDirect(IsoChunk c,
  boolean bRequireLock)`

  `void`

  `setGridSquare(IsoGridSquare square,
  int worldSquareX,
  int worldSquareY,
  int worldSquareZ)`

  `void`

  `setInitialPos(int wx,
  int wy)`

  `static void`

  `setWorldStartPos(int x,
  int y)`

  `void`

  `SwapChunkBuffers()`

  `void`

  `Unload()`

  `private void`

  `Up()`

  `void`

  `update()`

  `private void`

  `UpdateCellCache()`

  `private void`

  `updateInternal()`

  `private int`

  `worldSquareToChunkMapSquareX(int worldSquareX)`

  `private int`

  `worldSquareToChunkMapSquareY(int worldSquareY)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### LEVELS

    public static final int LEVELS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.LEVELS)
  + ### GROUND\_LEVEL

    public static final int GROUND\_LEVEL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.GROUND_LEVEL)
  + ### TOP\_LEVEL

    public static final int TOP\_LEVEL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.TOP_LEVEL)
  + ### BOTTOM\_LEVEL

    public static final int BOTTOM\_LEVEL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.BOTTOM_LEVEL)
  + ### OLD\_CHUNKS\_PER\_WIDTH

    public static final int OLD\_CHUNKS\_PER\_WIDTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.OLD_CHUNKS_PER_WIDTH)
  + ### CHUNKS\_PER\_WIDTH

    public static final int CHUNKS\_PER\_WIDTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.CHUNKS_PER_WIDTH)
  + ### CHUNK\_SIZE\_IN\_SQUARES

    public static final int CHUNK\_SIZE\_IN\_SQUARES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.CHUNK_SIZE_IN_SQUARES)
  + ### SharedChunks

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[IsoChunk](IsoChunk.html "class in zombie.iso")> SharedChunks
  + ### mpWorldXa

    public static int mpWorldXa
  + ### mpWorldYa

    public static int mpWorldYa
  + ### mpWorldZa

    public static int mpWorldZa
  + ### worldXa

    public static int worldXa
  + ### worldYa

    public static int worldYa
  + ### worldZa

    public static int worldZa
  + ### SWorldX

    public static final int[] SWorldX
  + ### SWorldY

    public static final int[] SWorldY
  + ### chunkStore

    public static final zombie.util.CappedConcurrentQueue<[IsoChunk](IsoChunk.html "class in zombie.iso")> chunkStore
  + ### bSettingChunk

    public static final [ReentrantLock](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/locks/ReentrantLock.html "class or interface in java.util.concurrent.locks") bSettingChunk
  + ### START\_CHUNK\_GRID\_WIDTH

    private static final int START\_CHUNK\_GRID\_WIDTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoChunkMap.START_CHUNK_GRID_WIDTH)
  + ### chunkGridWidth

    public static int chunkGridWidth
  + ### chunkWidthInTiles

    public static int chunkWidthInTiles
  + ### inf

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") inf
  + ### splatByType

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.IsoFloorBloodSplat>> splatByType
  + ### playerId

    public int playerId
  + ### ignore

    public boolean ignore
  + ### worldX

    public int worldX
  + ### worldY

    public int worldY
  + ### filenameServerRequests

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> filenameServerRequests
  + ### chunksSwapB

    protected [IsoChunk](IsoChunk.html "class in zombie.iso")[] chunksSwapB
  + ### chunksSwapA

    protected [IsoChunk](IsoChunk.html "class in zombie.iso")[] chunksSwapA
  + ### readBufferA

    boolean readBufferA
  + ### xMinTiles

    int xMinTiles
  + ### yMinTiles

    int yMinTiles
  + ### xMaxTiles

    int xMaxTiles
  + ### yMaxTiles

    int yMaxTiles
  + ### cell

    private final [IsoCell](IsoCell.html "class in zombie.iso") cell
  + ### checkVehiclesFrequency

    private final zombie.core.utils.UpdateLimit checkVehiclesFrequency
  + ### hotSaveFrequency

    private final zombie.core.utils.UpdateLimit hotSaveFrequency
  + ### maxHeight

    public int maxHeight
  + ### minHeight

    public int minHeight
  + ### ppp\_update

    public static final zombie.core.profiling.PerformanceProfileProbe ppp\_update
* Constructor Details
  -------------------

  + ### IsoChunkMap

    public IsoChunkMap([IsoCell](IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### CalcChunkWidth

    public static void CalcChunkWidth()
  + ### setWorldStartPos

    public static void setWorldStartPos(int x,
    int y)
  + ### Dispose

    public void Dispose()
  + ### setInitialPos

    public void setInitialPos(int wx,
    int wy)
  + ### processAllLoadGridSquare

    public void processAllLoadGridSquare()
  + ### update

    public void update()
  + ### updateInternal

    private void updateInternal()
  + ### checkVehicles

    private void checkVehicles()
  + ### checkIntegrity

    public void checkIntegrity()
  + ### checkIntegrityThread

    public void checkIntegrityThread()
  + ### LoadChunk

    public void LoadChunk(int wx,
    int wy,
    int x,
    int y)
  + ### LoadChunkForLater

    public [IsoChunk](IsoChunk.html "class in zombie.iso") LoadChunkForLater(int wx,
    int wy,
    int x,
    int y)
  + ### getChunkForGridSquare

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunkForGridSquare(int worldSquareX,
    int worldSquareY)
  + ### getChunkCurrent

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunkCurrent(int x,
    int y)
  + ### setGridSquare

    public void setGridSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    int worldSquareX,
    int worldSquareY,
    int worldSquareZ)
  + ### getGridSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquare(int worldSquareX,
    int worldSquareY,
    int worldSquareZ)
  + ### getGridSquareDirect

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getGridSquareDirect(int chunkMapSquareX,
    int chunkMapSquareY,
    int worldSquareZ)
  + ### chunkMapSquareToChunkSquareXY

    private int chunkMapSquareToChunkSquareXY(int chunkMapSquareXY)
  + ### chunkMapSquareToChunkMapChunkXY

    private static int chunkMapSquareToChunkMapChunkXY(int chunkMapSquareXY)
  + ### isChunkMapSquareOutOfRangeXY

    private boolean isChunkMapSquareOutOfRangeXY(int chunkMapSquareXY)
  + ### isWorldSquareOutOfRangeZ

    private boolean isWorldSquareOutOfRangeZ(int tileZ)
  + ### worldSquareToChunkMapSquareX

    private int worldSquareToChunkMapSquareX(int worldSquareX)
  + ### worldSquareToChunkMapSquareY

    private int worldSquareToChunkMapSquareY(int worldSquareY)
  + ### getChunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunk(int chunkMapChunkX,
    int chunkMapChunkY)
  + ### getChunks

    public [IsoChunk](IsoChunk.html "class in zombie.iso")[] getChunks()
  + ### setChunk

    private void setChunk(int x,
    int y,
    [IsoChunk](IsoChunk.html "class in zombie.iso") c)
  + ### setChunkDirect

    public boolean setChunkDirect([IsoChunk](IsoChunk.html "class in zombie.iso") c,
    boolean bRequireLock)
  + ### drawDebugChunkMap

    public void drawDebugChunkMap()
  + ### LoadLeft

    private void LoadLeft()
  + ### SwapChunkBuffers

    public void SwapChunkBuffers()
  + ### setChunk

    private void setChunk(int n,
    [IsoChunk](IsoChunk.html "class in zombie.iso") c)
  + ### getChunk

    private [IsoChunk](IsoChunk.html "class in zombie.iso") getChunk(int n)
  + ### LoadRight

    private void LoadRight()
  + ### LoadUp

    private void LoadUp()
  + ### LoadDown

    private void LoadDown()
  + ### UpdateCellCache

    private void UpdateCellCache()
  + ### Up

    private void Up()
  + ### Down

    private void Down()
  + ### Left

    private void Left()
  + ### Right

    private void Right()
  + ### getWorldXMin

    public int getWorldXMin()
  + ### getWorldYMin

    public int getWorldYMin()
  + ### ProcessChunkPos

    public void ProcessChunkPos([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### calculateZExtentsForChunkMap

    public void calculateZExtentsForChunkMap()
  + ### getRoom

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") getRoom(int iD)
  + ### getWidthInTiles

    public int getWidthInTiles()
  + ### getWorldXMinTiles

    public int getWorldXMinTiles()
  + ### getWorldYMinTiles

    public int getWorldYMinTiles()
  + ### getWorldXMaxTiles

    public int getWorldXMaxTiles()
  + ### getWorldYMaxTiles

    public int getWorldYMaxTiles()
  + ### Save

    public void Save()
  + ### renderBloodForChunks

    public void renderBloodForChunks(int zza)
  + ### copy

    public void copy([IsoChunkMap](IsoChunkMap.html "class in zombie.iso") from)
  + ### releaseChunkBeingLoaded

    private void releaseChunkBeingLoaded(int wx,
    int wy)
  + ### Unload

    public void Unload()
  + ### isGridSquareOutOfRangeZ

    public static boolean isGridSquareOutOfRangeZ(int tileZ)