[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [FishSchoolManager](FishSchoolManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [noiseFishPointDisabler](#noiseFishPointDisabler)
   2. [zoneCache](#zoneCache)
   3. [chumPoints](#chumPoints)
   4. [tempArrayList](#tempArrayList)
   5. [seed](#seed)
   6. [trashSeed](#trashSeed)
   7. [INSTANCE](#INSTANCE)
   8. [noFishZones](#noFishZones)
   9. [nearbyNoFishZones](#nearbyNoFishZones)
   10. [doneChunks](#doneChunks)
7. [Constructor Details](#constructor-detail)
   1. [FishSchoolManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [generateSeed()](#generateSeed())
   3. [updateSeed()](#updateSeed())
   4. [init()](#init())
   5. [update()](#update())
   6. [updateFishingData()](#updateFishingData())
   7. [getCurrentGameTimeInMinutes()](#getCurrentGameTimeInMinutes())
   8. [generateSplashes()](#generateSplashes())
   9. [initNearbyNoFishZones(IsoChunkMap, ArrayList)](#initNearbyNoFishZones(zombie.iso.IsoChunkMap,java.util.ArrayList))
   10. [isNoFishZone(int, int, ArrayList)](#isNoFishZone(int,int,java.util.ArrayList))
   11. [isNoFishZone(int, int)](#isNoFishZone(int,int))
   12. [isFishPoint(int, int)](#isFishPoint(int,int))
   13. [isFishPoint(int, int, ArrayList)](#isFishPoint(int,int,java.util.ArrayList))
   14. [getFishPointRadius(int, int)](#getFishPointRadius(int,int))
   15. [isTrashPoint(int, int)](#isTrashPoint(int,int))
   16. [getTrashPointRadius(int, int)](#getTrashPointRadius(int,int))
   17. [coordsToHash(int, int)](#coordsToHash(int,int))
   18. [procedureRandomFloat(long, long, long)](#procedureRandomFloat(long,long,long))
   19. [getNumberOfFishInPoint(int, int)](#getNumberOfFishInPoint(int,int))
   20. [generateSplashInRadius(int, int, float)](#generateSplashInRadius(int,int,float))
   21. [dist(float, float, float, float)](#dist(float,float,float,float))
   22. [addSoundNoise(int, int, int)](#addSoundNoise(int,int,int))
   23. [addChum(int, int, int)](#addChum(int,int,int))
   24. [catchFish(int, int)](#catchFish(int,int))
   25. [getOrCreateFishingZone(int, int)](#getOrCreateFishingZone(int,int))
   26. [getFishAbundance(int, int)](#getFishAbundance(int,int))
   27. [getTrashAbundance(int, int)](#getTrashAbundance(int,int))
   28. [setFishingData(ByteBufferWriter)](#setFishingData(zombie.core.network.ByteBufferWriter))
   29. [receiveFishingData(ByteBufferReader)](#receiveFishingData(zombie.core.network.ByteBufferReader))
   30. [load()](#load())
   31. [save()](#save())
   32. [drawDebugFishingZones(int, int)](#drawDebugFishingZones(int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FishSchoolManager
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.FishSchoolManager

---

public final class FishSchoolManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `FishSchoolManager.ChumData`

  `static class`

  `FishSchoolManager.ZoneData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final gnu.trove.map.hash.TLongObjectHashMap<FishSchoolManager.ChumData>`

  `chumPoints`

  `private final gnu.trove.map.hash.TObjectByteHashMap<IsoChunk>`

  `doneChunks`

  `private static final FishSchoolManager`

  `INSTANCE`

  `private final ArrayList<int[]>`

  `nearbyNoFishZones`

  `private final ArrayList<int[]>`

  `noFishZones`

  `private static final gnu.trove.map.hash.TLongIntHashMap`

  `noiseFishPointDisabler`

  `private int`

  `seed`

  `private static final ArrayList<Zone>`

  `tempArrayList`

  `private int`

  `trashSeed`

  `private static final gnu.trove.map.hash.TLongObjectHashMap<FishSchoolManager.ZoneData>`

  `zoneCache`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FishSchoolManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChum(int x,
  int y,
  int force)`

  `void`

  `addSoundNoise(int x,
  int y,
  int radius)`

  `void`

  `catchFish(int x,
  int y)`

  `private long`

  `coordsToHash(int x,
  int y)`

  `private double`

  `dist(float x1,
  float y1,
  float x2,
  float y2)`

  `private void`

  `drawDebugFishingZones(int x,
  int y)`

  `void`

  `generateSeed()`

  `private void`

  `generateSplashes()`

  `private void`

  `generateSplashInRadius(int x,
  int y,
  float radiusCoeff)`

  `private int`

  `getCurrentGameTimeInMinutes()`

  `double`

  `getFishAbundance(int x,
  int y)`

  `private float`

  `getFishPointRadius(int x,
  int y)`

  `static FishSchoolManager`

  `getInstance()`

  `private int`

  `getNumberOfFishInPoint(int x,
  int y)`

  `private Zone`

  `getOrCreateFishingZone(int x,
  int y)`

  `double`

  `getTrashAbundance(int x,
  int y)`

  `private float`

  `getTrashPointRadius(int x,
  int y)`

  `void`

  `init()`

  `private void`

  `initNearbyNoFishZones(IsoChunkMap chunkMap,
  ArrayList<int[]> noFishZones1)`

  `private boolean`

  `isFishPoint(int x,
  int y)`

  `private boolean`

  `isFishPoint(int x,
  int y,
  ArrayList<int[]> noFishZones1)`

  `private boolean`

  `isNoFishZone(int x,
  int y)`

  `private boolean`

  `isNoFishZone(int x,
  int y,
  ArrayList<int[]> noFishZones1)`

  `private boolean`

  `isTrashPoint(int x,
  int y)`

  `void`

  `load()`

  `private float`

  `procedureRandomFloat(long x,
  long y,
  long seed)`

  `void`

  `receiveFishingData(zombie.core.network.ByteBufferReader bb)`

  `void`

  `save()`

  `void`

  `setFishingData(zombie.core.network.ByteBufferWriter bb)`

  `void`

  `update()`

  `void`

  `updateFishingData()`

  `void`

  `updateSeed()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### noiseFishPointDisabler

    private static final gnu.trove.map.hash.TLongIntHashMap noiseFishPointDisabler
  + ### zoneCache

    private static final gnu.trove.map.hash.TLongObjectHashMap<[FishSchoolManager.ZoneData](FishSchoolManager.ZoneData.html "class in zombie.iso")> zoneCache
  + ### chumPoints

    private static final gnu.trove.map.hash.TLongObjectHashMap<[FishSchoolManager.ChumData](FishSchoolManager.ChumData.html "class in zombie.iso")> chumPoints
  + ### tempArrayList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](zones/Zone.html "class in zombie.iso.zones")> tempArrayList
  + ### seed

    private int seed
  + ### trashSeed

    private int trashSeed
  + ### INSTANCE

    private static final [FishSchoolManager](FishSchoolManager.html "class in zombie.iso") INSTANCE
  + ### noFishZones

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<int[]> noFishZones
  + ### nearbyNoFishZones

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<int[]> nearbyNoFishZones
  + ### doneChunks

    private final gnu.trove.map.hash.TObjectByteHashMap<[IsoChunk](IsoChunk.html "class in zombie.iso")> doneChunks
* Constructor Details
  -------------------

  + ### FishSchoolManager

    public FishSchoolManager()
* Method Details
  --------------

  + ### getInstance

    public static [FishSchoolManager](FishSchoolManager.html "class in zombie.iso") getInstance()
  + ### generateSeed

    public void generateSeed()
  + ### updateSeed

    public void updateSeed()
  + ### init

    public void init()
  + ### update

    public void update()
  + ### updateFishingData

    public void updateFishingData()
  + ### getCurrentGameTimeInMinutes

    private int getCurrentGameTimeInMinutes()
  + ### generateSplashes

    private void generateSplashes()
  + ### initNearbyNoFishZones

    private void initNearbyNoFishZones([IsoChunkMap](IsoChunkMap.html "class in zombie.iso") chunkMap,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<int[]> noFishZones1)
  + ### isNoFishZone

    private boolean isNoFishZone(int x,
    int y,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<int[]> noFishZones1)
  + ### isNoFishZone

    private boolean isNoFishZone(int x,
    int y)
  + ### isFishPoint

    private boolean isFishPoint(int x,
    int y)
  + ### isFishPoint

    private boolean isFishPoint(int x,
    int y,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<int[]> noFishZones1)
  + ### getFishPointRadius

    private float getFishPointRadius(int x,
    int y)
  + ### isTrashPoint

    private boolean isTrashPoint(int x,
    int y)
  + ### getTrashPointRadius

    private float getTrashPointRadius(int x,
    int y)
  + ### coordsToHash

    private long coordsToHash(int x,
    int y)
  + ### procedureRandomFloat

    private float procedureRandomFloat(long x,
    long y,
    long seed)
  + ### getNumberOfFishInPoint

    private int getNumberOfFishInPoint(int x,
    int y)
  + ### generateSplashInRadius

    private void generateSplashInRadius(int x,
    int y,
    float radiusCoeff)
  + ### dist

    private double dist(float x1,
    float y1,
    float x2,
    float y2)
  + ### addSoundNoise

    public void addSoundNoise(int x,
    int y,
    int radius)
  + ### addChum

    public void addChum(int x,
    int y,
    int force)
  + ### catchFish

    public void catchFish(int x,
    int y)
  + ### getOrCreateFishingZone

    private [Zone](zones/Zone.html "class in zombie.iso.zones") getOrCreateFishingZone(int x,
    int y)
  + ### getFishAbundance

    public double getFishAbundance(int x,
    int y)
  + ### getTrashAbundance

    public double getTrashAbundance(int x,
    int y)
  + ### setFishingData

    public void setFishingData(zombie.core.network.ByteBufferWriter bb)
  + ### receiveFishingData

    public void receiveFishingData(zombie.core.network.ByteBufferReader bb)
  + ### load

    public void load()
  + ### save

    public void save()
  + ### drawDebugFishingZones

    private void drawDebugFishingZones(int x,
    int y)