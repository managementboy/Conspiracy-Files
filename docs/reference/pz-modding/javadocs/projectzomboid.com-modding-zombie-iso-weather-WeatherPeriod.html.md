[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [WeatherPeriod](WeatherPeriod.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [STAGE\_START](#STAGE_START)
   2. [STAGE\_SHOWERS](#STAGE_SHOWERS)
   3. [STAGE\_HEAVY\_PRECIP](#STAGE_HEAVY_PRECIP)
   4. [STAGE\_STORM](#STAGE_STORM)
   5. [STAGE\_CLEARING](#STAGE_CLEARING)
   6. [STAGE\_MODERATE](#STAGE_MODERATE)
   7. [STAGE\_DRIZZLE](#STAGE_DRIZZLE)
   8. [STAGE\_BLIZZARD](#STAGE_BLIZZARD)
   9. [STAGE\_TROPICAL\_STORM](#STAGE_TROPICAL_STORM)
   10. [STAGE\_INTERMEZZO](#STAGE_INTERMEZZO)
   11. [STAGE\_MODDED](#STAGE_MODDED)
   12. [STAGE\_KATEBOB\_STORM](#STAGE_KATEBOB_STORM)
   13. [STAGE\_MAX](#STAGE_MAX)
   14. [FRONT\_STRENGTH\_THRESHOLD](#FRONT_STRENGTH_THRESHOLD)
   15. [climateManager](#climateManager)
   16. [frontCache](#frontCache)
   17. [startTime](#startTime)
   18. [duration](#duration)
   19. [currentTime](#currentTime)
   20. [currentStage](#currentStage)
   21. [weatherStages](#weatherStages)
   22. [weatherStageIndex](#weatherStageIndex)
   23. [stagesPool](#stagesPool)
   24. [isRunning](#isRunning)
   25. [totalProgress](#totalProgress)
   26. [stageProgress](#stageProgress)
   27. [weatherNoise](#weatherNoise)
   28. [maxTemperatureInfluence](#maxTemperatureInfluence)
   29. [temperatureInfluence](#temperatureInfluence)
   30. [currentStrength](#currentStrength)
   31. [rainThreshold](#rainThreshold)
   32. [windAngleDirMod](#windAngleDirMod)
   33. [isThunderStorm](#isThunderStorm)
   34. [isTropicalStorm](#isTropicalStorm)
   35. [isBlizzard](#isBlizzard)
   36. [precipitationFinal](#precipitationFinal)
   37. [thunderStorm](#thunderStorm)
   38. [cloudColor](#cloudColor)
   39. [cloudColorReddish](#cloudColorReddish)
   40. [cloudColorGreenish](#cloudColorGreenish)
   41. [cloudColorBlueish](#cloudColorBlueish)
   42. [cloudColorPurplish](#cloudColorPurplish)
   43. [cloudColorTropical](#cloudColorTropical)
   44. [cloudColorBlizzard](#cloudColorBlizzard)
   45. [printStuff](#printStuff)
   46. [kateBobStormProgress](#kateBobStormProgress)
   47. [kateBobStormX](#kateBobStormX)
   48. [kateBobStormY](#kateBobStormY)
   49. [seededRandom](#seededRandom)
   50. [climateValues](#climateValues)
   51. [isDummy](#isDummy)
   52. [hasStartedInit](#hasStartedInit)
   53. [cache](#cache)
7. [Constructor Details](#constructor-detail)
   1. [WeatherPeriod(ClimateManager, ThunderStorm)](#%3Cinit%3E(zombie.iso.weather.ClimateManager,zombie.iso.weather.ThunderStorm))
8. [Method Details](#method-detail)
   1. [setDummy(boolean)](#setDummy(boolean))
   2. [getMaxTemperatureInfluence()](#getMaxTemperatureInfluence())
   3. [setKateBobStormProgress(float)](#setKateBobStormProgress(float))
   4. [setKateBobStormCoords(int, int)](#setKateBobStormCoords(int,int))
   5. [getCloudColorReddish()](#getCloudColorReddish())
   6. [getCloudColorGreenish()](#getCloudColorGreenish())
   7. [getCloudColorBlueish()](#getCloudColorBlueish())
   8. [getCloudColorPurplish()](#getCloudColorPurplish())
   9. [getCloudColorTropical()](#getCloudColorTropical())
   10. [getCloudColorBlizzard()](#getCloudColorBlizzard())
   11. [isRunning()](#isRunning())
   12. [getDuration()](#getDuration())
   13. [getFrontCache()](#getFrontCache())
   14. [getCurrentStageID()](#getCurrentStageID())
   15. [getCurrentStage()](#getCurrentStage())
   16. [getWeatherNoise()](#getWeatherNoise())
   17. [getCurrentStrength()](#getCurrentStrength())
   18. [getRainThreshold()](#getRainThreshold())
   19. [isThunderStorm()](#isThunderStorm())
   20. [isTropicalStorm()](#isTropicalStorm())
   21. [isBlizzard()](#isBlizzard())
   22. [getPrecipitationFinal()](#getPrecipitationFinal())
   23. [getCloudColor()](#getCloudColor())
   24. [setCloudColor(ClimateColorInfo)](#setCloudColor(zombie.iso.weather.ClimateColorInfo))
   25. [getTotalProgress()](#getTotalProgress())
   26. [getStageProgress()](#getStageProgress())
   27. [hasTropical()](#hasTropical())
   28. [hasStorm()](#hasStorm())
   29. [hasBlizzard()](#hasBlizzard())
   30. [hasHeavyRain()](#hasHeavyRain())
   31. [getTotalStrength()](#getTotalStrength())
   32. [getStageForWorldAge(double)](#getStageForWorldAge(double))
   33. [getWindAngleDegrees()](#getWindAngleDegrees())
   34. [getFrontType()](#getFrontType())
   35. [print(String)](#print(java.lang.String))
   36. [setPrintStuff(boolean)](#setPrintStuff(boolean))
   37. [getPrintStuff()](#getPrintStuff())
   38. [initSimulationDebug(ClimateManager.AirFront, double)](#initSimulationDebug(zombie.iso.weather.ClimateManager.AirFront,double))
   39. [initSimulationDebug(ClimateManager.AirFront, double, int, float)](#initSimulationDebug(zombie.iso.weather.ClimateManager.AirFront,double,int,float))
   40. [init(ClimateManager.AirFront, double, int, int, int)](#init(zombie.iso.weather.ClimateManager.AirFront,double,int,int,int))
   41. [init(ClimateManager.AirFront, double, int, int, int, int, float)](#init(zombie.iso.weather.ClimateManager.AirFront,double,int,int,int,int,float))
   42. [reseed(int, int, int)](#reseed(int,int,int))
   43. [RandNext(float, float)](#RandNext(float,float))
   44. [RandNext(float)](#RandNext(float))
   45. [RandNext(int, int)](#RandNext(int,int))
   46. [RandNext(int)](#RandNext(int))
   47. [startCreateModdedPeriod(boolean, float, float)](#startCreateModdedPeriod(boolean,float,float))
   48. [endCreateModdedPeriod()](#endCreateModdedPeriod())
   49. [startInit(ClimateManager.AirFront, double)](#startInit(zombie.iso.weather.ClimateManager.AirFront,double))
   50. [endInit()](#endInit())
   51. [stopWeatherPeriod()](#stopWeatherPeriod())
   52. [writeNetWeatherData(ByteBufferWriter)](#writeNetWeatherData(zombie.core.network.ByteBufferWriter))
   53. [readNetWeatherData(ByteBufferReader)](#readNetWeatherData(zombie.core.network.ByteBufferReader))
   54. [getWeatherStages()](#getWeatherStages())
   55. [linkWeatherStages()](#linkWeatherStages())
   56. [clearCurrentWeatherStages()](#clearCurrentWeatherStages())
   57. [createSingleStage(int, float)](#createSingleStage(int,float))
   58. [createWeatherPattern()](#createWeatherPattern())
   59. [createAndAddModdedStage(String, double)](#createAndAddModdedStage(java.lang.String,double))
   60. [createAndAddStage(int, double)](#createAndAddStage(int,double))
   61. [createAndAddStage(int, double, String)](#createAndAddStage(int,double,java.lang.String))
   62. [createStage(int, double)](#createStage(int,double))
   63. [createStage(int, double, String)](#createStage(int,double,java.lang.String))
   64. [updateCurrentStage()](#updateCurrentStage())
   65. [update(double)](#update(double))
   66. [resetClimateManagerOverrides()](#resetClimateManagerOverrides())
   67. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   68. [load(DataInputStream, int)](#load(java.io.DataInputStream,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WeatherPeriod
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.WeatherPeriod

---

public class WeatherPeriod
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `WeatherPeriod.StrLerpVal`

  `static class`

  `WeatherPeriod.WeatherStage`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<Integer, WeatherPeriod.StrLerpVal>`

  `cache`

  `private final ClimateManager`

  `climateManager`

  `private final ClimateValues`

  `climateValues`

  `private ClimateColorInfo`

  `cloudColor`

  `private final ClimateColorInfo`

  `cloudColorBlizzard`

  `private final ClimateColorInfo`

  `cloudColorBlueish`

  `private final ClimateColorInfo`

  `cloudColorGreenish`

  `private final ClimateColorInfo`

  `cloudColorPurplish`

  `private final ClimateColorInfo`

  `cloudColorReddish`

  `private final ClimateColorInfo`

  `cloudColorTropical`

  `private WeatherPeriod.WeatherStage`

  `currentStage`

  `private float`

  `currentStrength`

  `private double`

  `currentTime`

  `private double`

  `duration`

  `static final float`

  `FRONT_STRENGTH_THRESHOLD`

  `private final ClimateManager.AirFront`

  `frontCache`

  `private boolean`

  `hasStartedInit`

  `private boolean`

  `isBlizzard`

  `private boolean`

  `isDummy`

  `private boolean`

  `isRunning`

  `private boolean`

  `isThunderStorm`

  `private boolean`

  `isTropicalStorm`

  `private static float`

  `kateBobStormProgress`

  `private int`

  `kateBobStormX`

  `private int`

  `kateBobStormY`

  `private static final float`

  `maxTemperatureInfluence`

  `private float`

  `precipitationFinal`

  `private static boolean`

  `printStuff`

  `private float`

  `rainThreshold`

  `private final Random`

  `seededRandom`

  `static final int`

  `STAGE_BLIZZARD`

  `static final int`

  `STAGE_CLEARING`

  `static final int`

  `STAGE_DRIZZLE`

  `static final int`

  `STAGE_HEAVY_PRECIP`

  `static final int`

  `STAGE_INTERMEZZO`

  `static final int`

  `STAGE_KATEBOB_STORM`

  `static final int`

  `STAGE_MAX`

  `static final int`

  `STAGE_MODDED`

  `static final int`

  `STAGE_MODERATE`

  `static final int`

  `STAGE_SHOWERS`

  `static final int`

  `STAGE_START`

  `static final int`

  `STAGE_STORM`

  `static final int`

  `STAGE_TROPICAL_STORM`

  `private float`

  `stageProgress`

  `private final Stack<WeatherPeriod.WeatherStage>`

  `stagesPool`

  `private double`

  `startTime`

  `private float`

  `temperatureInfluence`

  `private final ThunderStorm`

  `thunderStorm`

  `private float`

  `totalProgress`

  `private float`

  `weatherNoise`

  `private int`

  `weatherStageIndex`

  `private final ArrayList<WeatherPeriod.WeatherStage>`

  `weatherStages`

  `private float`

  `windAngleDirMod`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WeatherPeriod(ClimateManager climmgr,
  ThunderStorm ts)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `clearCurrentWeatherStages()`

  `WeatherPeriod.WeatherStage`

  `createAndAddModdedStage(String moddedID,
  double duration)`

  `WeatherPeriod.WeatherStage`

  `createAndAddStage(int typeid,
  double duration)`

  `private WeatherPeriod.WeatherStage`

  `createAndAddStage(int typeid,
  double duration,
  String moddedID)`

  `private void`

  `createSingleStage(int stage,
  float duration)`

  `private WeatherPeriod.WeatherStage`

  `createStage(int typeID,
  double duration)`

  `private WeatherPeriod.WeatherStage`

  `createStage(int typeID,
  double duration,
  String moddedID)`

  `private void`

  `createWeatherPattern()`

  `boolean`

  `endCreateModdedPeriod()`

  `private boolean`

  `endInit()`

  `ClimateColorInfo`

  `getCloudColor()`

  `ClimateColorInfo`

  `getCloudColorBlizzard()`

  `ClimateColorInfo`

  `getCloudColorBlueish()`

  `ClimateColorInfo`

  `getCloudColorGreenish()`

  `ClimateColorInfo`

  `getCloudColorPurplish()`

  `ClimateColorInfo`

  `getCloudColorReddish()`

  `ClimateColorInfo`

  `getCloudColorTropical()`

  `WeatherPeriod.WeatherStage`

  `getCurrentStage()`

  `int`

  `getCurrentStageID()`

  `float`

  `getCurrentStrength()`

  `double`

  `getDuration()`

  `ClimateManager.AirFront`

  `getFrontCache()`

  `int`

  `getFrontType()`

  `static float`

  `getMaxTemperatureInfluence()`

  `float`

  `getPrecipitationFinal()`

  `boolean`

  `getPrintStuff()`

  `float`

  `getRainThreshold()`

  `WeatherPeriod.WeatherStage`

  `getStageForWorldAge(double worldAgeHours)`

  `float`

  `getStageProgress()`

  `float`

  `getTotalProgress()`

  `float`

  `getTotalStrength()`

  `double`

  `getWeatherNoise()`

  `ArrayList<WeatherPeriod.WeatherStage>`

  `getWeatherStages()`

  `float`

  `getWindAngleDegrees()`

  `boolean`

  `hasBlizzard()`

  `boolean`

  `hasHeavyRain()`

  `boolean`

  `hasStorm()`

  `boolean`

  `hasTropical()`

  `protected void`

  `init(ClimateManager.AirFront front,
  double hoursSinceStart,
  int year,
  int month,
  int day)`

  `protected void`

  `init(ClimateManager.AirFront front,
  double hoursSinceStart,
  int year,
  int month,
  int day,
  int doThisStageOnly,
  float singleStageDuration)`

  `void`

  `initSimulationDebug(ClimateManager.AirFront front,
  double hoursSinceStart)`

  `void`

  `initSimulationDebug(ClimateManager.AirFront front,
  double hoursSinceStart,
  int doThisStageOnly,
  float singleStageDuration)`

  `boolean`

  `isBlizzard()`

  `boolean`

  `isRunning()`

  `boolean`

  `isThunderStorm()`

  `boolean`

  `isTropicalStorm()`

  `private void`

  `linkWeatherStages()`

  `void`

  `load(DataInputStream input,
  int worldVersion)`

  `private void`

  `print(String str)`

  `private float`

  `RandNext(float bound)`

  `private float`

  `RandNext(float min,
  float max)`

  `private int`

  `RandNext(int bound)`

  `private int`

  `RandNext(int min,
  int max)`

  `void`

  `readNetWeatherData(zombie.core.network.ByteBufferReader input)`

  `protected void`

  `reseed(int year,
  int month,
  int day)`

  `private void`

  `resetClimateManagerOverrides()`

  `void`

  `save(DataOutputStream output)`

  `void`

  `setCloudColor(ClimateColorInfo cloudcol)`

  `void`

  `setDummy(boolean b)`

  `void`

  `setKateBobStormCoords(int x,
  int y)`

  `void`

  `setKateBobStormProgress(float progress)`

  `void`

  `setPrintStuff(boolean b)`

  `boolean`

  `startCreateModdedPeriod(boolean warmFront,
  float strength,
  float angle)`

  `private boolean`

  `startInit(ClimateManager.AirFront front,
  double hoursSinceStart)`

  `void`

  `stopWeatherPeriod()`

  `void`

  `update(double hoursSinceStart)`

  `private void`

  `updateCurrentStage()`

  `void`

  `writeNetWeatherData(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### STAGE\_START

    public static final int STAGE\_START

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_START)
  + ### STAGE\_SHOWERS

    public static final int STAGE\_SHOWERS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_SHOWERS)
  + ### STAGE\_HEAVY\_PRECIP

    public static final int STAGE\_HEAVY\_PRECIP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_HEAVY_PRECIP)
  + ### STAGE\_STORM

    public static final int STAGE\_STORM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_STORM)
  + ### STAGE\_CLEARING

    public static final int STAGE\_CLEARING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_CLEARING)
  + ### STAGE\_MODERATE

    public static final int STAGE\_MODERATE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_MODERATE)
  + ### STAGE\_DRIZZLE

    public static final int STAGE\_DRIZZLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_DRIZZLE)
  + ### STAGE\_BLIZZARD

    public static final int STAGE\_BLIZZARD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_BLIZZARD)
  + ### STAGE\_TROPICAL\_STORM

    public static final int STAGE\_TROPICAL\_STORM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_TROPICAL_STORM)
  + ### STAGE\_INTERMEZZO

    public static final int STAGE\_INTERMEZZO

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_INTERMEZZO)
  + ### STAGE\_MODDED

    public static final int STAGE\_MODDED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_MODDED)
  + ### STAGE\_KATEBOB\_STORM

    public static final int STAGE\_KATEBOB\_STORM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_KATEBOB_STORM)
  + ### STAGE\_MAX

    public static final int STAGE\_MAX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.STAGE_MAX)
  + ### FRONT\_STRENGTH\_THRESHOLD

    public static final float FRONT\_STRENGTH\_THRESHOLD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.FRONT_STRENGTH_THRESHOLD)
  + ### climateManager

    private final [ClimateManager](ClimateManager.html "class in zombie.iso.weather") climateManager
  + ### frontCache

    private final [ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") frontCache
  + ### startTime

    private double startTime
  + ### duration

    private double duration
  + ### currentTime

    private double currentTime
  + ### currentStage

    private [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") currentStage
  + ### weatherStages

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather")> weatherStages
  + ### weatherStageIndex

    private int weatherStageIndex
  + ### stagesPool

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather")> stagesPool
  + ### isRunning

    private boolean isRunning
  + ### totalProgress

    private float totalProgress
  + ### stageProgress

    private float stageProgress
  + ### weatherNoise

    private float weatherNoise
  + ### maxTemperatureInfluence

    private static final float maxTemperatureInfluence

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WeatherPeriod.maxTemperatureInfluence)
  + ### temperatureInfluence

    private float temperatureInfluence
  + ### currentStrength

    private float currentStrength
  + ### rainThreshold

    private float rainThreshold
  + ### windAngleDirMod

    private float windAngleDirMod
  + ### isThunderStorm

    private boolean isThunderStorm
  + ### isTropicalStorm

    private boolean isTropicalStorm
  + ### isBlizzard

    private boolean isBlizzard
  + ### precipitationFinal

    private float precipitationFinal
  + ### thunderStorm

    private final [ThunderStorm](ThunderStorm.html "class in zombie.iso.weather") thunderStorm
  + ### cloudColor

    private [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColor
  + ### cloudColorReddish

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColorReddish
  + ### cloudColorGreenish

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColorGreenish
  + ### cloudColorBlueish

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColorBlueish
  + ### cloudColorPurplish

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColorPurplish
  + ### cloudColorTropical

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColorTropical
  + ### cloudColorBlizzard

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudColorBlizzard
  + ### printStuff

    private static boolean printStuff
  + ### kateBobStormProgress

    private static float kateBobStormProgress
  + ### kateBobStormX

    private int kateBobStormX
  + ### kateBobStormY

    private int kateBobStormY
  + ### seededRandom

    private final [Random](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Random.html "class or interface in java.util") seededRandom
  + ### climateValues

    private final [ClimateValues](ClimateValues.html "class in zombie.iso.weather") climateValues
  + ### isDummy

    private boolean isDummy
  + ### hasStartedInit

    private boolean hasStartedInit
  + ### cache

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather")> cache
* Constructor Details
  -------------------

  + ### WeatherPeriod

    public WeatherPeriod([ClimateManager](ClimateManager.html "class in zombie.iso.weather") climmgr,
    [ThunderStorm](ThunderStorm.html "class in zombie.iso.weather") ts)
* Method Details
  --------------

  + ### setDummy

    public void setDummy(boolean b)
  + ### getMaxTemperatureInfluence

    public static float getMaxTemperatureInfluence()
  + ### setKateBobStormProgress

    public void setKateBobStormProgress(float progress)
  + ### setKateBobStormCoords

    public void setKateBobStormCoords(int x,
    int y)
  + ### getCloudColorReddish

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColorReddish()
  + ### getCloudColorGreenish

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColorGreenish()
  + ### getCloudColorBlueish

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColorBlueish()
  + ### getCloudColorPurplish

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColorPurplish()
  + ### getCloudColorTropical

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColorTropical()
  + ### getCloudColorBlizzard

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColorBlizzard()
  + ### isRunning

    public boolean isRunning()
  + ### getDuration

    public double getDuration()
  + ### getFrontCache

    public [ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") getFrontCache()
  + ### getCurrentStageID

    public int getCurrentStageID()
  + ### getCurrentStage

    public [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") getCurrentStage()
  + ### getWeatherNoise

    public double getWeatherNoise()
  + ### getCurrentStrength

    public float getCurrentStrength()
  + ### getRainThreshold

    public float getRainThreshold()
  + ### isThunderStorm

    public boolean isThunderStorm()
  + ### isTropicalStorm

    public boolean isTropicalStorm()
  + ### isBlizzard

    public boolean isBlizzard()
  + ### getPrecipitationFinal

    public float getPrecipitationFinal()
  + ### getCloudColor

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getCloudColor()
  + ### setCloudColor

    public void setCloudColor([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") cloudcol)
  + ### getTotalProgress

    public float getTotalProgress()
  + ### getStageProgress

    public float getStageProgress()
  + ### hasTropical

    public boolean hasTropical()
  + ### hasStorm

    public boolean hasStorm()
  + ### hasBlizzard

    public boolean hasBlizzard()
  + ### hasHeavyRain

    public boolean hasHeavyRain()
  + ### getTotalStrength

    public float getTotalStrength()
  + ### getStageForWorldAge

    public [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") getStageForWorldAge(double worldAgeHours)
  + ### getWindAngleDegrees

    public float getWindAngleDegrees()
  + ### getFrontType

    public int getFrontType()
  + ### print

    private void print([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### setPrintStuff

    public void setPrintStuff(boolean b)
  + ### getPrintStuff

    public boolean getPrintStuff()
  + ### initSimulationDebug

    public void initSimulationDebug([ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") front,
    double hoursSinceStart)
  + ### initSimulationDebug

    public void initSimulationDebug([ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") front,
    double hoursSinceStart,
    int doThisStageOnly,
    float singleStageDuration)
  + ### init

    protected void init([ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") front,
    double hoursSinceStart,
    int year,
    int month,
    int day)
  + ### init

    protected void init([ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") front,
    double hoursSinceStart,
    int year,
    int month,
    int day,
    int doThisStageOnly,
    float singleStageDuration)
  + ### reseed

    protected void reseed(int year,
    int month,
    int day)
  + ### RandNext

    private float RandNext(float min,
    float max)
  + ### RandNext

    private float RandNext(float bound)
  + ### RandNext

    private int RandNext(int min,
    int max)
  + ### RandNext

    private int RandNext(int bound)
  + ### startCreateModdedPeriod

    public boolean startCreateModdedPeriod(boolean warmFront,
    float strength,
    float angle)
  + ### endCreateModdedPeriod

    public boolean endCreateModdedPeriod()
  + ### startInit

    private boolean startInit([ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") front,
    double hoursSinceStart)
  + ### endInit

    private boolean endInit()
  + ### stopWeatherPeriod

    public void stopWeatherPeriod()
  + ### writeNetWeatherData

    public void writeNetWeatherData(zombie.core.network.ByteBufferWriter output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### readNetWeatherData

    public void readNetWeatherData(zombie.core.network.ByteBufferReader input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getWeatherStages

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather")> getWeatherStages()
  + ### linkWeatherStages

    private void linkWeatherStages()
  + ### clearCurrentWeatherStages

    private void clearCurrentWeatherStages()
  + ### createSingleStage

    private void createSingleStage(int stage,
    float duration)
  + ### createWeatherPattern

    private void createWeatherPattern()
  + ### createAndAddModdedStage

    public [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") createAndAddModdedStage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") moddedID,
    double duration)
  + ### createAndAddStage

    public [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") createAndAddStage(int typeid,
    double duration)
  + ### createAndAddStage

    private [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") createAndAddStage(int typeid,
    double duration,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") moddedID)
  + ### createStage

    private [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") createStage(int typeID,
    double duration)
  + ### createStage

    private [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") createStage(int typeID,
    double duration,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") moddedID)
  + ### updateCurrentStage

    private void updateCurrentStage()
  + ### update

    public void update(double hoursSinceStart)
  + ### resetClimateManagerOverrides

    private void resetClimateManagerOverrides()
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`