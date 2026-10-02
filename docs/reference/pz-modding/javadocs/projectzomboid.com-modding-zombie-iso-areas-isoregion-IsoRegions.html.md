[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion](package-summary.html)
2. [IsoRegions](IsoRegions.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [SINGLE\_CHUNK\_PACKET\_SIZE](#SINGLE_CHUNK_PACKET_SIZE)
   2. [CHUNKS\_DATA\_PACKET\_SIZE](#CHUNKS_DATA_PACKET_SIZE)
   3. [printD](#printD)
   4. [CELL\_DIM](#CELL_DIM)
   5. [CELL\_CHUNK\_DIM](#CELL_CHUNK_DIM)
   6. [CHUNK\_DIM](#CHUNK_DIM)
   7. [CHUNK\_MAX\_Z](#CHUNK_MAX_Z)
   8. [BIT\_EMPTY](#BIT_EMPTY)
   9. [BIT\_WALL\_N](#BIT_WALL_N)
   10. [BIT\_WALL\_W](#BIT_WALL_W)
   11. [BIT\_PATH\_WALL\_N](#BIT_PATH_WALL_N)
   12. [BIT\_PATH\_WALL\_W](#BIT_PATH_WALL_W)
   13. [BIT\_HAS\_FLOOR](#BIT_HAS_FLOOR)
   14. [BIT\_STAIRCASE](#BIT_STAIRCASE)
   15. [BIT\_HAS\_ROOF](#BIT_HAS_ROOF)
   16. [DIR\_NONE](#DIR_NONE)
   17. [DIR\_N](#DIR_N)
   18. [DIR\_W](#DIR_W)
   19. [DIR\_2D\_NW](#DIR_2D_NW)
   20. [DIR\_S](#DIR_S)
   21. [DIR\_E](#DIR_E)
   22. [DIR\_2D\_MAX](#DIR_2D_MAX)
   23. [DIR\_TOP](#DIR_TOP)
   24. [DIR\_BOT](#DIR_BOT)
   25. [DIR\_MAX](#DIR_MAX)
   26. [CHUNK\_LOAD\_DIMENSIONS](#CHUNK_LOAD_DIMENSIONS)
   27. [debugLoadAllChunks](#debugLoadAllChunks)
   28. [FILE\_PRE](#FILE_PRE)
   29. [FILE\_SEP](#FILE_SEP)
   30. [FILE\_EXT](#FILE_EXT)
   31. [FILE\_DIR](#FILE_DIR)
   32. [SQUARE\_CHANGE\_WARN\_THRESHOLD](#SQUARE_CHANGE_WARN_THRESHOLD)
   33. [squareChangePerTick](#squareChangePerTick)
   34. [cacheDir](#cacheDir)
   35. [cacheDirFile](#cacheDirFile)
   36. [headDataFile](#headDataFile)
   37. [chunkFileNames](#chunkFileNames)
   38. [regionWorker](#regionWorker)
   39. [dataRoot](#dataRoot)
   40. [logger](#logger)
   41. [lastChunkX](#lastChunkX)
   42. [lastChunkY](#lastChunkY)
   43. [previousFlags](#previousFlags)
6. [Constructor Details](#constructor-detail)
   1. [IsoRegions()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getHeaderFile()](#getHeaderFile())
   2. [getDirectory()](#getDirectory())
   3. [getChunkFile(int, int)](#getChunkFile(int,int))
   4. [GetOppositeDir(byte)](#GetOppositeDir(byte))
   5. [setDebugLoadAllChunks(boolean)](#setDebugLoadAllChunks(boolean))
   6. [isDebugLoadAllChunks()](#isDebugLoadAllChunks())
   7. [hash(int, int)](#hash(int,int))
   8. [getDataRoot()](#getDataRoot())
   9. [init()](#init())
   10. [getLogger()](#getLogger())
   11. [log(String)](#log(java.lang.String))
   12. [log(String, Color)](#log(java.lang.String,zombie.core.Color))
   13. [warn(String)](#warn(java.lang.String))
   14. [reset()](#reset())
   15. [receiveServerUpdatePacket(ByteBufferReader)](#receiveServerUpdatePacket(zombie.core.network.ByteBufferReader))
   16. [receiveClientRequestFullDataChunks(ByteBufferReader, UdpConnection)](#receiveClientRequestFullDataChunks(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   17. [update()](#update())
   18. [forceRecalcSurroundingChunks()](#forceRecalcSurroundingChunks())
   19. [getSquareFlags(int, int, int)](#getSquareFlags(int,int,int))
   20. [getIsoWorldRegion(int, int, int)](#getIsoWorldRegion(int,int,int))
   21. [getIsoWorldRegionsInCell(int, int, ArrayList)](#getIsoWorldRegionsInCell(int,int,java.util.ArrayList))
   22. [getDataChunk(int, int)](#getDataChunk(int,int))
   23. [getChunkRegion(int, int, int)](#getChunkRegion(int,int,int))
   24. [ResetAllDataDebug()](#ResetAllDataDebug())
   25. [clientResetCachedRegionReferences()](#clientResetCachedRegionReferences())
   26. [setPreviousFlags(IsoGridSquare)](#setPreviousFlags(zombie.iso.IsoGridSquare))
   27. [squareChanged(IsoGridSquare)](#squareChanged(zombie.iso.IsoGridSquare))
   28. [squareChanged(IsoGridSquare, boolean)](#squareChanged(zombie.iso.IsoGridSquare,boolean))
   29. [calculateSquareFlags(IsoGridSquare)](#calculateSquareFlags(zombie.iso.IsoGridSquare))
   30. [getRegionWorker()](#getRegionWorker())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class IsoRegions
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.IsoRegions

---

public final class IsoRegions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final byte`

  `BIT_EMPTY`

  `static final byte`

  `BIT_HAS_FLOOR`

  `static final byte`

  `BIT_HAS_ROOF`

  `static final byte`

  `BIT_PATH_WALL_N`

  `static final byte`

  `BIT_PATH_WALL_W`

  `static final byte`

  `BIT_STAIRCASE`

  `static final byte`

  `BIT_WALL_N`

  `static final byte`

  `BIT_WALL_W`

  `private static String`

  `cacheDir`

  `private static File`

  `cacheDirFile`

  `static final int`

  `CELL_CHUNK_DIM`

  `static final int`

  `CELL_DIM`

  `static final int`

  `CHUNK_DIM`

  `protected static final int`

  `CHUNK_LOAD_DIMENSIONS`

  `static final int`

  `CHUNK_MAX_Z`

  `private static final Map<Integer,File>`

  `chunkFileNames`

  `static final int`

  `CHUNKS_DATA_PACKET_SIZE`

  `private static zombie.iso.areas.isoregion.data.DataRoot`

  `dataRoot`

  `protected static boolean`

  `debugLoadAllChunks`

  `static final byte`

  `DIR_2D_MAX`

  `static final byte`

  `DIR_2D_NW`

  `static final byte`

  `DIR_BOT`

  `static final byte`

  `DIR_E`

  `static final byte`

  `DIR_MAX`

  `static final byte`

  `DIR_N`

  `static final byte`

  `DIR_NONE`

  `static final byte`

  `DIR_S`

  `static final byte`

  `DIR_TOP`

  `static final byte`

  `DIR_W`

  `static final String`

  `FILE_DIR`

  `static final String`

  `FILE_EXT`

  `static final String`

  `FILE_PRE`

  `static final String`

  `FILE_SEP`

  `private static File`

  `headDataFile`

  `protected static int`

  `lastChunkX`

  `protected static int`

  `lastChunkY`

  `private static IsoRegionsLogger`

  `logger`

  `private static byte`

  `previousFlags`

  `static boolean`

  `printD`

  `private static zombie.iso.areas.isoregion.IsoRegionWorker`

  `regionWorker`

  `static final int`

  `SINGLE_CHUNK_PACKET_SIZE`

  `private static final int`

  `SQUARE_CHANGE_WARN_THRESHOLD`

  `private static int`

  `squareChangePerTick`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoRegions()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected static byte`

  `calculateSquareFlags(IsoGridSquare gs)`

  Record bitFlags for the state of a given square that are used to calculate IsoRegions.

  `private static void`

  `clientResetCachedRegionReferences()`

  Resets MasterRegions to null for all squares in the ChunkMap due to a DataRoot swap.

  `protected static void`

  `forceRecalcSurroundingChunks()`

  `static File`

  `getChunkFile(int chunkX,
  int chunkY)`

  `static zombie.iso.areas.isoregion.regions.IChunkRegion`

  `getChunkRegion(int x,
  int y,
  int z)`

  Returns a IChunkRegion for the square.

  `static DataChunk`

  `getDataChunk(int chunkx,
  int chunky)`

  Returns a DataChunk for the square.

  `protected static zombie.iso.areas.isoregion.data.DataRoot`

  `getDataRoot()`

  `static File`

  `getDirectory()`

  `static File`

  `getHeaderFile()`

  `static zombie.iso.areas.isoregion.regions.IWorldRegion`

  `getIsoWorldRegion(int x,
  int y,
  int z)`

  Returns a IWorldRegion for the square.

  `static List<IsoWorldRegion>`

  `getIsoWorldRegionsInCell(int cellX,
  int cellY,
  ArrayList<IsoWorldRegion> worldRegions)`

  `static IsoRegionsLogger`

  `getLogger()`

  `static byte`

  `GetOppositeDir(byte dir)`

  `protected static zombie.iso.areas.isoregion.IsoRegionWorker`

  `getRegionWorker()`

  `static byte`

  `getSquareFlags(int x,
  int y,
  int z)`

  `static int`

  `hash(int x,
  int y)`

  `static void`

  `init()`

  `static boolean`

  `isDebugLoadAllChunks()`

  `static void`

  `log(String str)`

  `static void`

  `log(String str,
  Color col)`

  `static void`

  `receiveClientRequestFullDataChunks(zombie.core.network.ByteBufferReader input,
  zombie.core.raknet.UdpConnection conn)`

  `static void`

  `receiveServerUpdatePacket(zombie.core.network.ByteBufferReader input)`

  `static void`

  `reset()`

  `static void`

  `ResetAllDataDebug()`

  `static void`

  `setDebugLoadAllChunks(boolean b)`

  `static void`

  `setPreviousFlags(IsoGridSquare gs)`

  Needs to be called before a player manipulates the grid.

  `static void`

  `squareChanged(IsoGridSquare gs)`

  Called after the grid has been manipulated by a player.

  `static void`

  `squareChanged(IsoGridSquare gs,
  boolean isRemoval)`

  Called after the grid has been manipulated by a player.

  `static void`

  `update()`

  `static void`

  `warn(String str)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### SINGLE\_CHUNK\_PACKET\_SIZE

    public static final int SINGLE\_CHUNK\_PACKET\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.SINGLE_CHUNK_PACKET_SIZE)
  + ### CHUNKS\_DATA\_PACKET\_SIZE

    public static final int CHUNKS\_DATA\_PACKET\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.CHUNKS_DATA_PACKET_SIZE)
  + ### printD

    public static boolean printD
  + ### CELL\_DIM

    public static final int CELL\_DIM

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.CELL_DIM)
  + ### CELL\_CHUNK\_DIM

    public static final int CELL\_CHUNK\_DIM

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.CELL_CHUNK_DIM)
  + ### CHUNK\_DIM

    public static final int CHUNK\_DIM

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.CHUNK_DIM)
  + ### CHUNK\_MAX\_Z

    public static final int CHUNK\_MAX\_Z

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.CHUNK_MAX_Z)
  + ### BIT\_EMPTY

    public static final byte BIT\_EMPTY

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_EMPTY)
  + ### BIT\_WALL\_N

    public static final byte BIT\_WALL\_N

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_WALL_N)
  + ### BIT\_WALL\_W

    public static final byte BIT\_WALL\_W

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_WALL_W)
  + ### BIT\_PATH\_WALL\_N

    public static final byte BIT\_PATH\_WALL\_N

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_PATH_WALL_N)
  + ### BIT\_PATH\_WALL\_W

    public static final byte BIT\_PATH\_WALL\_W

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_PATH_WALL_W)
  + ### BIT\_HAS\_FLOOR

    public static final byte BIT\_HAS\_FLOOR

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_HAS_FLOOR)
  + ### BIT\_STAIRCASE

    public static final byte BIT\_STAIRCASE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_STAIRCASE)
  + ### BIT\_HAS\_ROOF

    public static final byte BIT\_HAS\_ROOF

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.BIT_HAS_ROOF)
  + ### DIR\_NONE

    public static final byte DIR\_NONE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_NONE)
  + ### DIR\_N

    public static final byte DIR\_N

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_N)
  + ### DIR\_W

    public static final byte DIR\_W

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_W)
  + ### DIR\_2D\_NW

    public static final byte DIR\_2D\_NW

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_2D_NW)
  + ### DIR\_S

    public static final byte DIR\_S

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_S)
  + ### DIR\_E

    public static final byte DIR\_E

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_E)
  + ### DIR\_2D\_MAX

    public static final byte DIR\_2D\_MAX

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_2D_MAX)
  + ### DIR\_TOP

    public static final byte DIR\_TOP

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_TOP)
  + ### DIR\_BOT

    public static final byte DIR\_BOT

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_BOT)
  + ### DIR\_MAX

    public static final byte DIR\_MAX

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.DIR_MAX)
  + ### CHUNK\_LOAD\_DIMENSIONS

    protected static final int CHUNK\_LOAD\_DIMENSIONS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.CHUNK_LOAD_DIMENSIONS)
  + ### debugLoadAllChunks

    protected static boolean debugLoadAllChunks
  + ### FILE\_PRE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FILE\_PRE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.FILE_PRE)
  + ### FILE\_SEP

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FILE\_SEP

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.FILE_SEP)
  + ### FILE\_EXT

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FILE\_EXT

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.FILE_EXT)
  + ### FILE\_DIR

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FILE\_DIR

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.FILE_DIR)
  + ### SQUARE\_CHANGE\_WARN\_THRESHOLD

    private static final int SQUARE\_CHANGE\_WARN\_THRESHOLD

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegions.SQUARE_CHANGE_WARN_THRESHOLD)
  + ### squareChangePerTick

    private static int squareChangePerTick
  + ### cacheDir

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cacheDir
  + ### cacheDirFile

    private static [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") cacheDirFile
  + ### headDataFile

    private static [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") headDataFile
  + ### chunkFileNames

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io")> chunkFileNames
  + ### regionWorker

    private static zombie.iso.areas.isoregion.IsoRegionWorker regionWorker
  + ### dataRoot

    private static zombie.iso.areas.isoregion.data.DataRoot dataRoot
  + ### logger

    private static [IsoRegionsLogger](IsoRegionsLogger.html "class in zombie.iso.areas.isoregion") logger
  + ### lastChunkX

    protected static int lastChunkX
  + ### lastChunkY

    protected static int lastChunkY
  + ### previousFlags

    private static byte previousFlags
* Constructor Details
  -------------------

  + ### IsoRegions

    public IsoRegions()
* Method Details
  --------------

  + ### getHeaderFile

    public static [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") getHeaderFile()
  + ### getDirectory

    public static [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") getDirectory()
  + ### getChunkFile

    public static [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") getChunkFile(int chunkX,
    int chunkY)
  + ### GetOppositeDir

    public static byte GetOppositeDir(byte dir)
  + ### setDebugLoadAllChunks

    public static void setDebugLoadAllChunks(boolean b)
  + ### isDebugLoadAllChunks

    public static boolean isDebugLoadAllChunks()
  + ### hash

    public static int hash(int x,
    int y)
  + ### getDataRoot

    protected static zombie.iso.areas.isoregion.data.DataRoot getDataRoot()
  + ### init

    public static void init()
  + ### getLogger

    public static [IsoRegionsLogger](IsoRegionsLogger.html "class in zombie.iso.areas.isoregion") getLogger()
  + ### log

    public static void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### log

    public static void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../core/Color.html "class in zombie.core") col)
  + ### warn

    public static void warn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### reset

    public static void reset()
  + ### receiveServerUpdatePacket

    public static void receiveServerUpdatePacket(zombie.core.network.ByteBufferReader input)
  + ### receiveClientRequestFullDataChunks

    public static void receiveClientRequestFullDataChunks(zombie.core.network.ByteBufferReader input,
    zombie.core.raknet.UdpConnection conn)
  + ### update

    public static void update()
  + ### forceRecalcSurroundingChunks

    protected static void forceRecalcSurroundingChunks()
  + ### getSquareFlags

    public static byte getSquareFlags(int x,
    int y,
    int z)
  + ### getIsoWorldRegion

    public static zombie.iso.areas.isoregion.regions.IWorldRegion getIsoWorldRegion(int x,
    int y,
    int z)

    Returns a IWorldRegion for the square.
    Note: Returned objects from this function should not be retained as the DataRoot may get swapped.
    Note: The IWorldRegion does get cached in IsoGridSquare for optimizing purposes but this gets handled in 'clientResetCachedRegionReferences()'

    Returns:
    :   can be null.
  + ### getIsoWorldRegionsInCell

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoWorldRegion](regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> getIsoWorldRegionsInCell(int cellX,
    int cellY,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoWorldRegion](regions/IsoWorldRegion.html "class in zombie.iso.areas.isoregion.regions")> worldRegions)
  + ### getDataChunk

    public static [DataChunk](data/DataChunk.html "class in zombie.iso.areas.isoregion.data") getDataChunk(int chunkx,
    int chunky)

    Returns a DataChunk for the square.
    Note: Returned objects from this function should not be retained as the DataRoot may get swapped.

    Returns:
    :   can be null.
  + ### getChunkRegion

    public static zombie.iso.areas.isoregion.regions.IChunkRegion getChunkRegion(int x,
    int y,
    int z)

    Returns a IChunkRegion for the square.
    Note: Returned objects from this function should not be retained as the DataRoot may get swapped.

    Returns:
    :   can be null.
  + ### ResetAllDataDebug

    public static void ResetAllDataDebug()
  + ### clientResetCachedRegionReferences

    private static void clientResetCachedRegionReferences()

    Resets MasterRegions to null for all squares in the ChunkMap due to a DataRoot swap.
    MasterRegions will be reassigned when they are requested from IsoRegions.getMasterRegion.
  + ### setPreviousFlags

    public static void setPreviousFlags([IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") gs)

    Needs to be called before a player manipulates the grid.
    Records bitFlags for the state of the square that are compared to bitFlags for the state of the square after manipulation to detect relevant changes.
  + ### squareChanged

    public static void squareChanged([IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") gs)

    Called after the grid has been manipulated by a player.
    NOTE: setPreviousFlags needs to be called prior to the grid being manipulated by a player.
  + ### squareChanged

    public static void squareChanged([IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") gs,
    boolean isRemoval)

    Called after the grid has been manipulated by a player.
    NOTE: setPreviousFlags needs to be called prior to the grid being manipulated by a player.
  + ### calculateSquareFlags

    protected static byte calculateSquareFlags([IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") gs)

    Record bitFlags for the state of a given square that are used to calculate IsoRegions.
  + ### getRegionWorker

    protected static zombie.iso.areas.isoregion.IsoRegionWorker getRegionWorker()