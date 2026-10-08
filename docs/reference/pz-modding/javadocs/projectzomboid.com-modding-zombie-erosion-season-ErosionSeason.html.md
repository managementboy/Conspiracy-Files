[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.erosion.season](package-summary.html)
2. [ErosionSeason](ErosionSeason.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SEASON\_DEFAULT](#SEASON_DEFAULT)
   2. [SEASON\_SPRING](#SEASON_SPRING)
   3. [SEASON\_SUMMER](#SEASON_SUMMER)
   4. [SEASON\_SUMMER2](#SEASON_SUMMER2)
   5. [SEASON\_AUTUMN](#SEASON_AUTUMN)
   6. [SEASON\_WINTER](#SEASON_WINTER)
   7. [NUM\_SEASONS](#NUM_SEASONS)
   8. [lat](#lat)
   9. [tempMax](#tempMax)
   10. [tempMin](#tempMin)
   11. [tempDiff](#tempDiff)
   12. [highNoon](#highNoon)
   13. [highNoonCurrent](#highNoonCurrent)
   14. [seasonLag](#seasonLag)
   15. [rain](#rain)
   16. [suSol](#suSol)
   17. [wiSol](#wiSol)
   18. [zeroDay](#zeroDay)
   19. [day](#day)
   20. [month](#month)
   21. [year](#year)
   22. [isH1](#isH1)
   23. [yearData](#yearData)
   24. [curSeason](#curSeason)
   25. [curSeasonDay](#curSeasonDay)
   26. [curSeasonDays](#curSeasonDays)
   27. [curSeasonStrength](#curSeasonStrength)
   28. [curSeasonProgression](#curSeasonProgression)
   29. [dayMeanTemperature](#dayMeanTemperature)
   30. [dayTemperature](#dayTemperature)
   31. [dayNoiseVal](#dayNoiseVal)
   32. [isRainDay](#isRainDay)
   33. [rainYearAverage](#rainYearAverage)
   34. [rainDayStrength](#rainDayStrength)
   35. [isThunderDay](#isThunderDay)
   36. [isSunnyDay](#isSunnyDay)
   37. [dayDusk](#dayDusk)
   38. [dayDawn](#dayDawn)
   39. [dayDaylight](#dayDaylight)
   40. [winterMod](#winterMod)
   41. [summerMod](#summerMod)
   42. [summerTilt](#summerTilt)
   43. [curDayPercent](#curDayPercent)
   44. [per](#per)
   45. [seedA](#seedA)
   46. [seedB](#seedB)
   47. [seedC](#seedC)
   48. [names](#names)
   49. [namesTranslated](#namesTranslated)
7. [Constructor Details](#constructor-detail)
   1. [ErosionSeason()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init(int, int, int, int, int, float, int, int, int)](#init(int,int,int,int,int,float,int,int,int))
   2. [getLat()](#getLat())
   3. [getTempMax()](#getTempMax())
   4. [getTempMin()](#getTempMin())
   5. [getTempDiff()](#getTempDiff())
   6. [getSeasonLag()](#getSeasonLag())
   7. [getHighNoon()](#getHighNoon())
   8. [getSeedA()](#getSeedA())
   9. [getSeedB()](#getSeedB())
   10. [getSeedC()](#getSeedC())
   11. [setRain(float, float, float, float, float, float, float, float, float, float, float, float)](#setRain(float,float,float,float,float,float,float,float,float,float,float,float))
   12. [clone()](#clone())
   13. [getCurDayPercent()](#getCurDayPercent())
   14. [getMaxDaylightWinter()](#getMaxDaylightWinter())
   15. [getMaxDaylightSummer()](#getMaxDaylightSummer())
   16. [getDusk()](#getDusk())
   17. [getDawn()](#getDawn())
   18. [getDaylight()](#getDaylight())
   19. [getDayTemperature()](#getDayTemperature())
   20. [getDayMeanTemperature()](#getDayMeanTemperature())
   21. [getSeason()](#getSeason())
   22. [getDayHighNoon()](#getDayHighNoon())
   23. [getSeasonName()](#getSeasonName())
   24. [getSeasonNameTranslated()](#getSeasonNameTranslated())
   25. [isSeason(int)](#isSeason(int))
   26. [getWinterStartDay(int, int, int)](#getWinterStartDay(int,int,int))
   27. [getSeasonDay()](#getSeasonDay())
   28. [getSeasonDays()](#getSeasonDays())
   29. [getSeasonStrength()](#getSeasonStrength())
   30. [getSeasonProgression()](#getSeasonProgression())
   31. [getDayNoiseVal()](#getDayNoiseVal())
   32. [isRainDay()](#isRainDay())
   33. [getRainDayStrength()](#getRainDayStrength())
   34. [getRainYearAverage()](#getRainYearAverage())
   35. [isThunderDay()](#isThunderDay())
   36. [isSunnyDay()](#isSunnyDay())
   37. [setDay(int, int, int)](#setDay(int,int,int))
   38. [setYearData(int)](#setYearData(int))
   39. [setSeasonData(float, GregorianCalendar, int, int)](#setSeasonData(float,java.util.GregorianCalendar,int,int))
   40. [setDaylightData(long, GregorianCalendar)](#setDaylightData(long,java.util.GregorianCalendar))
   41. [dayDiff(GregorianCalendar, GregorianCalendar)](#dayDiff(java.util.GregorianCalendar,java.util.GregorianCalendar))
   42. [clerp(double, double, double)](#clerp(double,double,double))
   43. [lerp(double, double, double)](#lerp(double,double,double))
   44. [radian(double)](#radian(double))
   45. [degree(double)](#degree(double))
   46. [Reset()](#Reset())
   47. [setCurSeason(int)](#setCurSeason(int))
   48. [isEndlessDay()](#isEndlessDay())
   49. [isEndlessNight()](#isEndlessNight())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ErosionSeason
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.erosion.season.ErosionSeason

---

public final class ErosionSeason
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `ErosionSeason.YearData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `curDayPercent`

  `private int`

  `curSeason`

  `private float`

  `curSeasonDay`

  `private float`

  `curSeasonDays`

  `private float`

  `curSeasonProgression`

  `private float`

  `curSeasonStrength`

  `private int`

  `day`

  `private float`

  `dayDawn`

  `private float`

  `dayDaylight`

  `private float`

  `dayDusk`

  `private float`

  `dayMeanTemperature`

  `private float`

  `dayNoiseVal`

  `private float`

  `dayTemperature`

  `private float`

  `highNoon`

  `private float`

  `highNoonCurrent`

  `private boolean`

  `isH1`

  `private boolean`

  `isRainDay`

  `private boolean`

  `isSunnyDay`

  `private boolean`

  `isThunderDay`

  `private int`

  `lat`

  `private int`

  `month`

  `(package private) String[]`

  `names`

  `(package private) String[]`

  `namesTranslated`

  `static final int`

  `NUM_SEASONS`

  `private final zombie.erosion.utils.Noise2D`

  `per`

  `private final float[]`

  `rain`

  `private float`

  `rainDayStrength`

  `private float`

  `rainYearAverage`

  `static final int`

  `SEASON_AUTUMN`

  `static final int`

  `SEASON_DEFAULT`

  `static final int`

  `SEASON_SPRING`

  `static final int`

  `SEASON_SUMMER`

  `static final int`

  `SEASON_SUMMER2`

  `static final int`

  `SEASON_WINTER`

  `private int`

  `seasonLag`

  `private int`

  `seedA`

  `private int`

  `seedB`

  `private int`

  `seedC`

  `private float`

  `summerMod`

  `private float`

  `summerTilt`

  `private double`

  `suSol`

  `private int`

  `tempDiff`

  `private int`

  `tempMax`

  `private int`

  `tempMin`

  `private float`

  `winterMod`

  `private double`

  `wiSol`

  `private int`

  `year`

  `private final ErosionSeason.YearData[]`

  `yearData`

  `private final GregorianCalendar`

  `zeroDay`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ErosionSeason()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private double`

  `clerp(double t,
  double a,
  double b)`

  `ErosionSeason`

  `clone()`

  `private float`

  `dayDiff(GregorianCalendar date1,
  GregorianCalendar date2)`

  `private double`

  `degree(double a)`

  `float`

  `getCurDayPercent()`

  `float`

  `getDawn()`

  `float`

  `getDayHighNoon()`

  `float`

  `getDaylight()`

  `float`

  `getDayMeanTemperature()`

  `float`

  `getDayNoiseVal()`

  `float`

  `getDayTemperature()`

  `float`

  `getDusk()`

  `float`

  `getHighNoon()`

  `int`

  `getLat()`

  `double`

  `getMaxDaylightSummer()`

  `double`

  `getMaxDaylightWinter()`

  `float`

  `getRainDayStrength()`

  `float`

  `getRainYearAverage()`

  `int`

  `getSeason()`

  `float`

  `getSeasonDay()`

  `float`

  `getSeasonDays()`

  `int`

  `getSeasonLag()`

  `String`

  `getSeasonName()`

  `String`

  `getSeasonNameTranslated()`

  `float`

  `getSeasonProgression()`

  `float`

  `getSeasonStrength()`

  `int`

  `getSeedA()`

  `int`

  `getSeedB()`

  `int`

  `getSeedC()`

  `int`

  `getTempDiff()`

  `int`

  `getTempMax()`

  `int`

  `getTempMin()`

  `GregorianCalendar`

  `getWinterStartDay(int day,
  int month,
  int year)`

  `void`

  `init(int lat,
  int tempMax,
  int tempMin,
  int tempDiff,
  int seasonLag,
  float noon,
  int seedA,
  int seedB,
  int seedC)`

  `boolean`

  `isEndlessDay()`

  `boolean`

  `isEndlessNight()`

  `boolean`

  `isRainDay()`

  `boolean`

  `isSeason(int season)`

  `boolean`

  `isSunnyDay()`

  `boolean`

  `isThunderDay()`

  `private double`

  `lerp(double t,
  double a,
  double b)`

  `private double`

  `radian(double a)`

  `static void`

  `Reset()`

  `void`

  `setCurSeason(int season)`

  `void`

  `setDay(int day,
  int month,
  int year)`

  `private void`

  `setDaylightData(long dayValue,
  GregorianCalendar dayDate)`

  `void`

  `setRain(float jan,
  float feb,
  float mar,
  float apr,
  float may,
  float jun,
  float jul,
  float aug,
  float sep,
  float oct,
  float nov,
  float dec)`

  `private void`

  `setSeasonData(float dayValue,
  GregorianCalendar dayDate,
  int year,
  int month)`

  `private void`

  `setYearData(int year)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### SEASON\_DEFAULT

    public static final int SEASON\_DEFAULT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.SEASON_DEFAULT)
  + ### SEASON\_SPRING

    public static final int SEASON\_SPRING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.SEASON_SPRING)
  + ### SEASON\_SUMMER

    public static final int SEASON\_SUMMER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.SEASON_SUMMER)
  + ### SEASON\_SUMMER2

    public static final int SEASON\_SUMMER2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.SEASON_SUMMER2)
  + ### SEASON\_AUTUMN

    public static final int SEASON\_AUTUMN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.SEASON_AUTUMN)
  + ### SEASON\_WINTER

    public static final int SEASON\_WINTER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.SEASON_WINTER)
  + ### NUM\_SEASONS

    public static final int NUM\_SEASONS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.erosion.season.ErosionSeason.NUM_SEASONS)
  + ### lat

    private int lat
  + ### tempMax

    private int tempMax
  + ### tempMin

    private int tempMin
  + ### tempDiff

    private int tempDiff
  + ### highNoon

    private float highNoon
  + ### highNoonCurrent

    private float highNoonCurrent
  + ### seasonLag

    private int seasonLag
  + ### rain

    private final float[] rain
  + ### suSol

    private double suSol
  + ### wiSol

    private double wiSol
  + ### zeroDay

    private final [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") zeroDay
  + ### day

    private int day
  + ### month

    private int month
  + ### year

    private int year
  + ### isH1

    private boolean isH1
  + ### yearData

    private final [ErosionSeason.YearData](ErosionSeason.YearData.html "class in zombie.erosion.season")[] yearData
  + ### curSeason

    private int curSeason
  + ### curSeasonDay

    private float curSeasonDay
  + ### curSeasonDays

    private float curSeasonDays
  + ### curSeasonStrength

    private float curSeasonStrength
  + ### curSeasonProgression

    private float curSeasonProgression
  + ### dayMeanTemperature

    private float dayMeanTemperature
  + ### dayTemperature

    private float dayTemperature
  + ### dayNoiseVal

    private float dayNoiseVal
  + ### isRainDay

    private boolean isRainDay
  + ### rainYearAverage

    private float rainYearAverage
  + ### rainDayStrength

    private float rainDayStrength
  + ### isThunderDay

    private boolean isThunderDay
  + ### isSunnyDay

    private boolean isSunnyDay
  + ### dayDusk

    private float dayDusk
  + ### dayDawn

    private float dayDawn
  + ### dayDaylight

    private float dayDaylight
  + ### winterMod

    private float winterMod
  + ### summerMod

    private float summerMod
  + ### summerTilt

    private float summerTilt
  + ### curDayPercent

    private float curDayPercent
  + ### per

    private final zombie.erosion.utils.Noise2D per
  + ### seedA

    private int seedA
  + ### seedB

    private int seedB
  + ### seedC

    private int seedC
  + ### names

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] names
  + ### namesTranslated

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] namesTranslated
* Constructor Details
  -------------------

  + ### ErosionSeason

    public ErosionSeason()
* Method Details
  --------------

  + ### init

    public void init(int lat,
    int tempMax,
    int tempMin,
    int tempDiff,
    int seasonLag,
    float noon,
    int seedA,
    int seedB,
    int seedC)
  + ### getLat

    public int getLat()
  + ### getTempMax

    public int getTempMax()
  + ### getTempMin

    public int getTempMin()
  + ### getTempDiff

    public int getTempDiff()
  + ### getSeasonLag

    public int getSeasonLag()
  + ### getHighNoon

    public float getHighNoon()
  + ### getSeedA

    public int getSeedA()
  + ### getSeedB

    public int getSeedB()
  + ### getSeedC

    public int getSeedC()
  + ### setRain

    public void setRain(float jan,
    float feb,
    float mar,
    float apr,
    float may,
    float jun,
    float jul,
    float aug,
    float sep,
    float oct,
    float nov,
    float dec)
  + ### clone

    public [ErosionSeason](ErosionSeason.html "class in zombie.erosion.season") clone()

    Overrides:
    :   `clone` in class `Object`
  + ### getCurDayPercent

    public float getCurDayPercent()
  + ### getMaxDaylightWinter

    public double getMaxDaylightWinter()
  + ### getMaxDaylightSummer

    public double getMaxDaylightSummer()
  + ### getDusk

    public float getDusk()
  + ### getDawn

    public float getDawn()
  + ### getDaylight

    public float getDaylight()
  + ### getDayTemperature

    public float getDayTemperature()
  + ### getDayMeanTemperature

    public float getDayMeanTemperature()
  + ### getSeason

    public int getSeason()
  + ### getDayHighNoon

    public float getDayHighNoon()
  + ### getSeasonName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSeasonName()
  + ### getSeasonNameTranslated

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSeasonNameTranslated()
  + ### isSeason

    public boolean isSeason(int season)
  + ### getWinterStartDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") getWinterStartDay(int day,
    int month,
    int year)
  + ### getSeasonDay

    public float getSeasonDay()
  + ### getSeasonDays

    public float getSeasonDays()
  + ### getSeasonStrength

    public float getSeasonStrength()
  + ### getSeasonProgression

    public float getSeasonProgression()
  + ### getDayNoiseVal

    public float getDayNoiseVal()
  + ### isRainDay

    public boolean isRainDay()
  + ### getRainDayStrength

    public float getRainDayStrength()
  + ### getRainYearAverage

    public float getRainYearAverage()
  + ### isThunderDay

    public boolean isThunderDay()
  + ### isSunnyDay

    public boolean isSunnyDay()
  + ### setDay

    public void setDay(int day,
    int month,
    int year)
  + ### setYearData

    private void setYearData(int year)
  + ### setSeasonData

    private void setSeasonData(float dayValue,
    [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") dayDate,
    int year,
    int month)
  + ### setDaylightData

    private void setDaylightData(long dayValue,
    [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") dayDate)
  + ### dayDiff

    private float dayDiff([GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") date1,
    [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") date2)
  + ### clerp

    private double clerp(double t,
    double a,
    double b)
  + ### lerp

    private double lerp(double t,
    double a,
    double b)
  + ### radian

    private double radian(double a)
  + ### degree

    private double degree(double a)
  + ### Reset

    public static void Reset()
  + ### setCurSeason

    public void setCurSeason(int season)
  + ### isEndlessDay

    public boolean isEndlessDay()
  + ### isEndlessNight

    public boolean isEndlessNight()