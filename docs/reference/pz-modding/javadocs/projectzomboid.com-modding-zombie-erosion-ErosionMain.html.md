[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.erosion](package-summary.html)
2. [ErosionMain](ErosionMain.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [cfg](#cfg)
   3. [debug](#debug)
   4. [sprMngr](#sprMngr)
   5. [iceQueen](#iceQueen)
   6. [isSnow](#isSnow)
   7. [gameSaveWorld](#gameSaveWorld)
   8. [cfgPath](#cfgPath)
   9. [chunk](#chunk)
   10. [chunkModData](#chunkModData)
   11. [noiseMain](#noiseMain)
   12. [noiseMoisture](#noiseMoisture)
   13. [noiseMinerals](#noiseMinerals)
   14. [noiseKudzu](#noiseKudzu)
   15. [world](#world)
   16. [season](#season)
   17. [tickUnit](#tickUnit)
   18. [ticks](#ticks)
   19. [eTicks](#eTicks)
   20. [day](#day)
   21. [month](#month)
   22. [year](#year)
   23. [epoch](#epoch)
   24. [soilTable](#soilTable)
   25. [snowFrac](#snowFrac)
   26. [snowFracYesterday](#snowFracYesterday)
   27. [snowFracOnDay](#snowFracOnDay)
6. [Constructor Details](#constructor-detail)
   1. [ErosionMain(IsoSpriteManager, boolean)](#%3Cinit%3E(zombie.iso.sprite.IsoSpriteManager,boolean))
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [getConfig()](#getConfig())
   3. [getSeasons()](#getSeasons())
   4. [getEtick()](#getEtick())
   5. [getSpriteManager()](#getSpriteManager())
   6. [mainTimer()](#mainTimer())
   7. [snowCheck()](#snowCheck())
   8. [getSnowFraction()](#getSnowFraction())
   9. [getSnowFractionYesterday()](#getSnowFractionYesterday())
   10. [isSnow()](#isSnow())
   11. [sendState(ByteBufferWriter)](#sendState(zombie.core.network.ByteBufferWriter))
   12. [receiveState(ByteBufferReader)](#receiveState(zombie.core.network.ByteBufferReader))
   13. [loadGridsquare(IsoGridSquare)](#loadGridsquare(zombie.iso.IsoGridSquare))
   14. [initGridSquare(IsoGridSquare, ErosionData.Square)](#initGridSquare(zombie.iso.IsoGridSquare,zombie.erosion.ErosionData.Square))
   15. [getChunk(IsoGridSquare)](#getChunk(zombie.iso.IsoGridSquare))
   16. [initChunk(IsoChunk, ErosionData.Chunk)](#initChunk(zombie.iso.IsoChunk,zombie.erosion.ErosionData.Chunk))
   17. [initConfig()](#initConfig())
   18. [start()](#start())
   19. [loadChunk(IsoChunk)](#loadChunk(zombie.iso.IsoChunk))
   20. [DebugUpdateMapNow()](#DebugUpdateMapNow())
   21. [updateMapNow()](#updateMapNow())
   22. [LoadGridsquare(IsoGridSquare)](#LoadGridsquare(zombie.iso.IsoGridSquare))
   23. [ChunkLoaded(IsoChunk)](#ChunkLoaded(zombie.iso.IsoChunk))
   24. [EveryTenMinutes()](#EveryTenMinutes())
   25. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ErosionMain
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.erosion.ErosionMain

---

public final class ErosionMain
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ErosionConfig`

  `cfg`

  `private String`

  `cfgPath`

  `private IsoChunk`

  `chunk`

  `private zombie.erosion.ErosionData.Chunk`

  `chunkModData`

  `private int`

  `day`

  `private boolean`

  `debug`

  `private int`

  `epoch`

  `private int`

  `eTicks`

  `private String`

  `gameSaveWorld`

  `private zombie.erosion.season.ErosionIceQueen`

  `iceQueen`

  `private static ErosionMain`

  `instance`

  `private boolean`

  `isSnow`

  `private int`

  `month`

  `private zombie.erosion.utils.Noise2D`

  `noiseKudzu`

  `private zombie.erosion.utils.Noise2D`

  `noiseMain`

  `private zombie.erosion.utils.Noise2D`

  `noiseMinerals`

  `private zombie.erosion.utils.Noise2D`

  `noiseMoisture`

  `private ErosionSeason`

  `season`

  `private int`

  `snowFrac`

  `private int[]`

  `snowFracOnDay`

  `private int`

  `snowFracYesterday`

  `private static final int[][]`

  `soilTable`

  `private final IsoSpriteManager`

  `sprMngr`

  `private int`

  `ticks`

  `private int`

  `tickUnit`

  `private zombie.erosion.ErosionWorld`

  `world`

  `private int`

  `year`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ErosionMain(IsoSpriteManager isoSpriteManager,
  boolean debug)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `ChunkLoaded(IsoChunk isoChunk)`

  `void`

  `DebugUpdateMapNow()`

  `static void`

  `EveryTenMinutes()`

  `private void`

  `getChunk(IsoGridSquare square)`

  `ErosionConfig`

  `getConfig()`

  `int`

  `getEtick()`

  `static ErosionMain`

  `getInstance()`

  `ErosionSeason`

  `getSeasons()`

  `int`

  `getSnowFraction()`

  `int`

  `getSnowFractionYesterday()`

  `IsoSpriteManager`

  `getSpriteManager()`

  `private void`

  `initChunk(IsoChunk chunk,
  zombie.erosion.ErosionData.Chunk chunkModData)`

  `private boolean`

  `initConfig()`

  `private void`

  `initGridSquare(IsoGridSquare square,
  zombie.erosion.ErosionData.Square erosionModData)`

  `boolean`

  `isSnow()`

  `private void`

  `loadChunk(IsoChunk chunk)`

  `private void`

  `loadGridsquare(IsoGridSquare square)`

  `static void`

  `LoadGridsquare(IsoGridSquare square)`

  `void`

  `mainTimer()`

  `void`

  `receiveState(zombie.core.network.ByteBufferReader bb)`

  `static void`

  `Reset()`

  `void`

  `sendState(zombie.core.network.ByteBufferWriter bb)`

  `void`

  `snowCheck()`

  `void`

  `start()`

  `private void`

  `updateMapNow()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [ErosionMain](ErosionMain.html "class in zombie.erosion") instance
  + ### cfg

    private [ErosionConfig](ErosionConfig.html "class in zombie.erosion") cfg
  + ### debug

    private boolean debug
  + ### sprMngr

    private final [IsoSpriteManager](../iso/sprite/IsoSpriteManager.html "class in zombie.iso.sprite") sprMngr
  + ### iceQueen

    private zombie.erosion.season.ErosionIceQueen iceQueen
  + ### isSnow

    private boolean isSnow
  + ### gameSaveWorld

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameSaveWorld
  + ### cfgPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cfgPath
  + ### chunk

    private [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk
  + ### chunkModData

    private zombie.erosion.ErosionData.Chunk chunkModData
  + ### noiseMain

    private zombie.erosion.utils.Noise2D noiseMain
  + ### noiseMoisture

    private zombie.erosion.utils.Noise2D noiseMoisture
  + ### noiseMinerals

    private zombie.erosion.utils.Noise2D noiseMinerals
  + ### noiseKudzu

    private zombie.erosion.utils.Noise2D noiseKudzu
  + ### world

    private zombie.erosion.ErosionWorld world
  + ### season

    private [ErosionSeason](season/ErosionSeason.html "class in zombie.erosion.season") season
  + ### tickUnit

    private int tickUnit
  + ### ticks

    private int ticks
  + ### eTicks

    private int eTicks
  + ### day

    private int day
  + ### month

    private int month
  + ### year

    private int year
  + ### epoch

    private int epoch
  + ### soilTable

    private static final int[][] soilTable
  + ### snowFrac

    private int snowFrac
  + ### snowFracYesterday

    private int snowFracYesterday
  + ### snowFracOnDay

    private int[] snowFracOnDay
* Constructor Details
  -------------------

  + ### ErosionMain

    public ErosionMain([IsoSpriteManager](../iso/sprite/IsoSpriteManager.html "class in zombie.iso.sprite") isoSpriteManager,
    boolean debug)
* Method Details
  --------------

  + ### getInstance

    public static [ErosionMain](ErosionMain.html "class in zombie.erosion") getInstance()
  + ### getConfig

    public [ErosionConfig](ErosionConfig.html "class in zombie.erosion") getConfig()
  + ### getSeasons

    public [ErosionSeason](season/ErosionSeason.html "class in zombie.erosion.season") getSeasons()
  + ### getEtick

    public int getEtick()
  + ### getSpriteManager

    public [IsoSpriteManager](../iso/sprite/IsoSpriteManager.html "class in zombie.iso.sprite") getSpriteManager()
  + ### mainTimer

    public void mainTimer()
  + ### snowCheck

    public void snowCheck()
  + ### getSnowFraction

    public int getSnowFraction()
  + ### getSnowFractionYesterday

    public int getSnowFractionYesterday()
  + ### isSnow

    public boolean isSnow()
  + ### sendState

    public void sendState(zombie.core.network.ByteBufferWriter bb)
  + ### receiveState

    public void receiveState(zombie.core.network.ByteBufferReader bb)
  + ### loadGridsquare

    private void loadGridsquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### initGridSquare

    private void initGridSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    zombie.erosion.ErosionData.Square erosionModData)
  + ### getChunk

    private void getChunk([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### initChunk

    private void initChunk([IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    zombie.erosion.ErosionData.Chunk chunkModData)
  + ### initConfig

    private boolean initConfig()
  + ### start

    public void start()
  + ### loadChunk

    private void loadChunk([IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk)
  + ### DebugUpdateMapNow

    public void DebugUpdateMapNow()
  + ### updateMapNow

    private void updateMapNow()
  + ### LoadGridsquare

    public static void LoadGridsquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### ChunkLoaded

    public static void ChunkLoaded([IsoChunk](../iso/IsoChunk.html "class in zombie.iso") isoChunk)
  + ### EveryTenMinutes

    public static void EveryTenMinutes()
  + ### Reset

    public static void Reset()