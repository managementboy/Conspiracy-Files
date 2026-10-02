[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateValues](ClimateValues.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [simplexOffsetA](#simplexOffsetA)
   2. [simplexOffsetB](#simplexOffsetB)
   3. [simplexOffsetC](#simplexOffsetC)
   4. [simplexOffsetD](#simplexOffsetD)
   5. [clim](#clim)
   6. [gt](#gt)
   7. [time](#time)
   8. [dawn](#dawn)
   9. [dusk](#dusk)
   10. [noon](#noon)
   11. [dayMeanTemperature](#dayMeanTemperature)
   12. [airMassNoiseFrequencyMod](#airMassNoiseFrequencyMod)
   13. [noiseAirmass](#noiseAirmass)
   14. [airMassTemperature](#airMassTemperature)
   15. [baseTemperature](#baseTemperature)
   16. [dayLightLagged](#dayLightLagged)
   17. [nightLagged](#nightLagged)
   18. [temperature](#temperature)
   19. [temperatureIsSnow](#temperatureIsSnow)
   20. [humidity](#humidity)
   21. [windIntensity](#windIntensity)
   22. [windAngleIntensity](#windAngleIntensity)
   23. [windAngleDegrees](#windAngleDegrees)
   24. [nightStrength](#nightStrength)
   25. [dayLightStrength](#dayLightStrength)
   26. [ambient](#ambient)
   27. [desaturation](#desaturation)
   28. [dayLightStrengthBase](#dayLightStrengthBase)
   29. [lerpNight](#lerpNight)
   30. [cloudyT](#cloudyT)
   31. [cloudIntensity](#cloudIntensity)
   32. [airFrontAirmass](#airFrontAirmass)
   33. [dayDoFog](#dayDoFog)
   34. [dayFogStrength](#dayFogStrength)
   35. [dayFogDuration](#dayFogDuration)
   36. [testCurrentDay](#testCurrentDay)
   37. [testNextDay](#testNextDay)
   38. [cacheWorldAgeHours](#cacheWorldAgeHours)
   39. [cacheYear](#cacheYear)
   40. [cacheMonth](#cacheMonth)
   41. [cacheDay](#cacheDay)
   42. [seededRandom](#seededRandom)
6. [Constructor Details](#constructor-detail)
   1. [ClimateValues(ClimateManager)](#%3Cinit%3E(zombie.iso.weather.ClimateManager))
7. [Method Details](#method-detail)
   1. [getCopy()](#getCopy())
   2. [CopyValues(ClimateValues)](#CopyValues(zombie.iso.weather.ClimateValues))
   3. [print()](#print())
   4. [pollDate(int, int, int)](#pollDate(int,int,int))
   5. [pollDate(int, int, int, int)](#pollDate(int,int,int,int))
   6. [pollDate(int, int, int, int, int)](#pollDate(int,int,int,int,int))
   7. [pollDate(GregorianCalendar)](#pollDate(java.util.GregorianCalendar))
   8. [updateValues(double, float, ClimateManager.DayInfo, ClimateManager.DayInfo)](#updateValues(double,float,zombie.iso.weather.ClimateManager.DayInfo,zombie.iso.weather.ClimateManager.DayInfo))
   9. [getTime()](#getTime())
   10. [getDawn()](#getDawn())
   11. [getDusk()](#getDusk())
   12. [getNoon()](#getNoon())
   13. [getAirMassNoiseFrequencyMod()](#getAirMassNoiseFrequencyMod())
   14. [getNoiseAirmass()](#getNoiseAirmass())
   15. [getAirMassTemperature()](#getAirMassTemperature())
   16. [getBaseTemperature()](#getBaseTemperature())
   17. [getDayLightLagged()](#getDayLightLagged())
   18. [getNightLagged()](#getNightLagged())
   19. [getTemperature()](#getTemperature())
   20. [isTemperatureIsSnow()](#isTemperatureIsSnow())
   21. [getHumidity()](#getHumidity())
   22. [getWindIntensity()](#getWindIntensity())
   23. [getWindAngleIntensity()](#getWindAngleIntensity())
   24. [getWindAngleDegrees()](#getWindAngleDegrees())
   25. [getNightStrength()](#getNightStrength())
   26. [getDayLightStrength()](#getDayLightStrength())
   27. [getAmbient()](#getAmbient())
   28. [getDesaturation()](#getDesaturation())
   29. [getDayLightStrengthBase()](#getDayLightStrengthBase())
   30. [getLerpNight()](#getLerpNight())
   31. [getCloudyT()](#getCloudyT())
   32. [getCloudIntensity()](#getCloudIntensity())
   33. [getAirFrontAirmass()](#getAirFrontAirmass())
   34. [getCacheWorldAgeHours()](#getCacheWorldAgeHours())
   35. [getCacheYear()](#getCacheYear())
   36. [getCacheMonth()](#getCacheMonth())
   37. [getCacheDay()](#getCacheDay())
   38. [getDayMeanTemperature()](#getDayMeanTemperature())
   39. [isDayDoFog()](#isDayDoFog())
   40. [getDayFogStrength()](#getDayFogStrength())
   41. [getDayFogDuration()](#getDayFogDuration())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateValues
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateValues

---

public class ClimateValues
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `airFrontAirmass`

  `private double`

  `airMassNoiseFrequencyMod`

  `private float`

  `airMassTemperature`

  `private float`

  `ambient`

  `private float`

  `baseTemperature`

  `private int`

  `cacheDay`

  `private int`

  `cacheMonth`

  `private double`

  `cacheWorldAgeHours`

  `private int`

  `cacheYear`

  `private final ClimateManager`

  `clim`

  `private float`

  `cloudIntensity`

  `private float`

  `cloudyT`

  `private float`

  `dawn`

  `private boolean`

  `dayDoFog`

  `private float`

  `dayFogDuration`

  `private float`

  `dayFogStrength`

  `private float`

  `dayLightLagged`

  `private float`

  `dayLightStrength`

  `private float`

  `dayLightStrengthBase`

  `private float`

  `dayMeanTemperature`

  `private float`

  `desaturation`

  `private float`

  `dusk`

  `private final GameTime`

  `gt`

  `private float`

  `humidity`

  `private float`

  `lerpNight`

  `private float`

  `nightLagged`

  `private float`

  `nightStrength`

  `private float`

  `noiseAirmass`

  `private float`

  `noon`

  `private final Random`

  `seededRandom`

  `private final double`

  `simplexOffsetA`

  `private final double`

  `simplexOffsetB`

  `private final double`

  `simplexOffsetC`

  `private final double`

  `simplexOffsetD`

  `private float`

  `temperature`

  `private boolean`

  `temperatureIsSnow`

  `private ClimateManager.DayInfo`

  `testCurrentDay`

  `private ClimateManager.DayInfo`

  `testNextDay`

  `private float`

  `time`

  `private float`

  `windAngleDegrees`

  `private float`

  `windAngleIntensity`

  `private float`

  `windIntensity`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateValues(ClimateManager clim)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `CopyValues(ClimateValues copy)`

  `float`

  `getAirFrontAirmass()`

  `double`

  `getAirMassNoiseFrequencyMod()`

  `float`

  `getAirMassTemperature()`

  `float`

  `getAmbient()`

  `float`

  `getBaseTemperature()`

  `int`

  `getCacheDay()`

  `int`

  `getCacheMonth()`

  `double`

  `getCacheWorldAgeHours()`

  `int`

  `getCacheYear()`

  `float`

  `getCloudIntensity()`

  `float`

  `getCloudyT()`

  `ClimateValues`

  `getCopy()`

  `float`

  `getDawn()`

  `float`

  `getDayFogDuration()`

  `float`

  `getDayFogStrength()`

  `float`

  `getDayLightLagged()`

  `float`

  `getDayLightStrength()`

  `float`

  `getDayLightStrengthBase()`

  `float`

  `getDayMeanTemperature()`

  `float`

  `getDesaturation()`

  `float`

  `getDusk()`

  `float`

  `getHumidity()`

  `float`

  `getLerpNight()`

  `float`

  `getNightLagged()`

  `float`

  `getNightStrength()`

  `float`

  `getNoiseAirmass()`

  `float`

  `getNoon()`

  `float`

  `getTemperature()`

  `float`

  `getTime()`

  `float`

  `getWindAngleDegrees()`

  `float`

  `getWindAngleIntensity()`

  `float`

  `getWindIntensity()`

  `boolean`

  `isDayDoFog()`

  `boolean`

  `isTemperatureIsSnow()`

  `void`

  `pollDate(int year,
  int month,
  int dayOfMonth)`

  `void`

  `pollDate(int year,
  int month,
  int dayOfMonth,
  int hourOfDay)`

  `void`

  `pollDate(int year,
  int month,
  int dayOfMonth,
  int hourOfDay,
  int minute)`

  `void`

  `pollDate(GregorianCalendar calendar)`

  `void`

  `print()`

  `protected void`

  `updateValues(double worldAgeHours,
  float time,
  ClimateManager.DayInfo currentDay,
  ClimateManager.DayInfo nextDay)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### simplexOffsetA

    private final double simplexOffsetA
  + ### simplexOffsetB

    private final double simplexOffsetB
  + ### simplexOffsetC

    private final double simplexOffsetC
  + ### simplexOffsetD

    private final double simplexOffsetD
  + ### clim

    private final [ClimateManager](ClimateManager.html "class in zombie.iso.weather") clim
  + ### gt

    private final [GameTime](../../GameTime.html "class in zombie") gt
  + ### time

    private float time
  + ### dawn

    private float dawn
  + ### dusk

    private float dusk
  + ### noon

    private float noon
  + ### dayMeanTemperature

    private float dayMeanTemperature
  + ### airMassNoiseFrequencyMod

    private double airMassNoiseFrequencyMod
  + ### noiseAirmass

    private float noiseAirmass
  + ### airMassTemperature

    private float airMassTemperature
  + ### baseTemperature

    private float baseTemperature
  + ### dayLightLagged

    private float dayLightLagged
  + ### nightLagged

    private float nightLagged
  + ### temperature

    private float temperature
  + ### temperatureIsSnow

    private boolean temperatureIsSnow
  + ### humidity

    private float humidity
  + ### windIntensity

    private float windIntensity
  + ### windAngleIntensity

    private float windAngleIntensity
  + ### windAngleDegrees

    private float windAngleDegrees
  + ### nightStrength

    private float nightStrength
  + ### dayLightStrength

    private float dayLightStrength
  + ### ambient

    private float ambient
  + ### desaturation

    private float desaturation
  + ### dayLightStrengthBase

    private float dayLightStrengthBase
  + ### lerpNight

    private float lerpNight
  + ### cloudyT

    private float cloudyT
  + ### cloudIntensity

    private float cloudIntensity
  + ### airFrontAirmass

    private float airFrontAirmass
  + ### dayDoFog

    private boolean dayDoFog
  + ### dayFogStrength

    private float dayFogStrength
  + ### dayFogDuration

    private float dayFogDuration
  + ### testCurrentDay

    private [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") testCurrentDay
  + ### testNextDay

    private [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") testNextDay
  + ### cacheWorldAgeHours

    private double cacheWorldAgeHours
  + ### cacheYear

    private int cacheYear
  + ### cacheMonth

    private int cacheMonth
  + ### cacheDay

    private int cacheDay
  + ### seededRandom

    private final [Random](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Random.html "class or interface in java.util") seededRandom
* Constructor Details
  -------------------

  + ### ClimateValues

    public ClimateValues([ClimateManager](ClimateManager.html "class in zombie.iso.weather") clim)
* Method Details
  --------------

  + ### getCopy

    public [ClimateValues](ClimateValues.html "class in zombie.iso.weather") getCopy()
  + ### CopyValues

    public void CopyValues([ClimateValues](ClimateValues.html "class in zombie.iso.weather") copy)
  + ### print

    public void print()
  + ### pollDate

    public void pollDate(int year,
    int month,
    int dayOfMonth)
  + ### pollDate

    public void pollDate(int year,
    int month,
    int dayOfMonth,
    int hourOfDay)
  + ### pollDate

    public void pollDate(int year,
    int month,
    int dayOfMonth,
    int hourOfDay,
    int minute)
  + ### pollDate

    public void pollDate([GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") calendar)
  + ### updateValues

    protected void updateValues(double worldAgeHours,
    float time,
    [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") currentDay,
    [ClimateManager.DayInfo](ClimateManager.DayInfo.html "class in zombie.iso.weather") nextDay)
  + ### getTime

    public float getTime()
  + ### getDawn

    public float getDawn()
  + ### getDusk

    public float getDusk()
  + ### getNoon

    public float getNoon()
  + ### getAirMassNoiseFrequencyMod

    public double getAirMassNoiseFrequencyMod()
  + ### getNoiseAirmass

    public float getNoiseAirmass()
  + ### getAirMassTemperature

    public float getAirMassTemperature()
  + ### getBaseTemperature

    public float getBaseTemperature()
  + ### getDayLightLagged

    public float getDayLightLagged()
  + ### getNightLagged

    public float getNightLagged()
  + ### getTemperature

    public float getTemperature()
  + ### isTemperatureIsSnow

    public boolean isTemperatureIsSnow()
  + ### getHumidity

    public float getHumidity()
  + ### getWindIntensity

    public float getWindIntensity()
  + ### getWindAngleIntensity

    public float getWindAngleIntensity()
  + ### getWindAngleDegrees

    public float getWindAngleDegrees()
  + ### getNightStrength

    public float getNightStrength()
  + ### getDayLightStrength

    public float getDayLightStrength()
  + ### getAmbient

    public float getAmbient()
  + ### getDesaturation

    public float getDesaturation()
  + ### getDayLightStrengthBase

    public float getDayLightStrengthBase()
  + ### getLerpNight

    public float getLerpNight()
  + ### getCloudyT

    public float getCloudyT()
  + ### getCloudIntensity

    public float getCloudIntensity()
  + ### getAirFrontAirmass

    public float getAirFrontAirmass()
  + ### getCacheWorldAgeHours

    public double getCacheWorldAgeHours()
  + ### getCacheYear

    public int getCacheYear()
  + ### getCacheMonth

    public int getCacheMonth()
  + ### getCacheDay

    public int getCacheDay()
  + ### getDayMeanTemperature

    public float getDayMeanTemperature()
  + ### isDayDoFog

    public boolean isDayDoFog()
  + ### getDayFogStrength

    public float getDayFogStrength()
  + ### getDayFogDuration

    public float getDayFogDuration()