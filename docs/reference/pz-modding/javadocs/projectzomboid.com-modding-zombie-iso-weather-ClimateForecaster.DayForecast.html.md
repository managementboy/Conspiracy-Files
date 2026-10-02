[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateForecaster](ClimateForecaster.html)
3. [DayForecast](ClimateForecaster.DayForecast.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [indexOffset](#indexOffset)
   2. [name](#name)
   3. [weatherPeriod](#weatherPeriod)
   4. [temperature](#temperature)
   5. [humidity](#humidity)
   6. [windDirection](#windDirection)
   7. [windPower](#windPower)
   8. [cloudiness](#cloudiness)
   9. [weatherStarts](#weatherStarts)
   10. [weatherStartTime](#weatherStartTime)
   11. [weatherEndTime](#weatherEndTime)
   12. [chanceOnSnow](#chanceOnSnow)
   13. [airFrontString](#airFrontString)
   14. [hasFog](#hasFog)
   15. [fogStrength](#fogStrength)
   16. [fogDuration](#fogDuration)
   17. [airFront](#airFront)
   18. [weatherOverlap](#weatherOverlap)
   19. [hasHeavyRain](#hasHeavyRain)
   20. [hasStorm](#hasStorm)
   21. [hasTropicalStorm](#hasTropicalStorm)
   22. [hasBlizzard](#hasBlizzard)
   23. [dawn](#dawn)
   24. [dusk](#dusk)
   25. [dayLightHours](#dayLightHours)
   26. [weatherStages](#weatherStages)
6. [Constructor Details](#constructor-detail)
   1. [DayForecast()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getIndexOffset()](#getIndexOffset())
   2. [getName()](#getName())
   3. [getTemperature()](#getTemperature())
   4. [getHumidity()](#getHumidity())
   5. [getWindDirection()](#getWindDirection())
   6. [getWindPower()](#getWindPower())
   7. [getCloudiness()](#getCloudiness())
   8. [getWeatherPeriod()](#getWeatherPeriod())
   9. [isWeatherStarts()](#isWeatherStarts())
   10. [getWeatherStartTime()](#getWeatherStartTime())
   11. [getWeatherEndTime()](#getWeatherEndTime())
   12. [isChanceOnSnow()](#isChanceOnSnow())
   13. [getAirFrontString()](#getAirFrontString())
   14. [isHasFog()](#isHasFog())
   15. [getAirFront()](#getAirFront())
   16. [getWeatherOverlap()](#getWeatherOverlap())
   17. [getMeanWindAngleString()](#getMeanWindAngleString())
   18. [getFogStrength()](#getFogStrength())
   19. [getFogDuration()](#getFogDuration())
   20. [isHasHeavyRain()](#isHasHeavyRain())
   21. [isHasStorm()](#isHasStorm())
   22. [isHasTropicalStorm()](#isHasTropicalStorm())
   23. [isHasBlizzard()](#isHasBlizzard())
   24. [getWeatherStages()](#getWeatherStages())
   25. [getDawn()](#getDawn())
   26. [getDusk()](#getDusk())
   27. [getDayLightHours()](#getDayLightHours())
   28. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateForecaster.DayForecast
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateForecaster.DayForecast

Enclosing class:
:   `ClimateForecaster`

---

public static class ClimateForecaster.DayForecast
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ClimateManager.AirFront`

  `airFront`

  `private String`

  `airFrontString`

  `private boolean`

  `chanceOnSnow`

  `private final ClimateForecaster.ForecastValue`

  `cloudiness`

  `private float`

  `dawn`

  `private float`

  `dayLightHours`

  `private float`

  `dusk`

  `private float`

  `fogDuration`

  `private float`

  `fogStrength`

  `private boolean`

  `hasBlizzard`

  `private boolean`

  `hasFog`

  `private boolean`

  `hasHeavyRain`

  `private boolean`

  `hasStorm`

  `private boolean`

  `hasTropicalStorm`

  `private final ClimateForecaster.ForecastValue`

  `humidity`

  `private int`

  `indexOffset`

  `private String`

  `name`

  `private final ClimateForecaster.ForecastValue`

  `temperature`

  `private float`

  `weatherEndTime`

  `private ClimateForecaster.DayForecast`

  `weatherOverlap`

  `private WeatherPeriod`

  `weatherPeriod`

  `private final ArrayList<Integer>`

  `weatherStages`

  `private boolean`

  `weatherStarts`

  `private float`

  `weatherStartTime`

  `private final ClimateForecaster.ForecastValue`

  `windDirection`

  `private final ClimateForecaster.ForecastValue`

  `windPower`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DayForecast()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ClimateManager.AirFront`

  `getAirFront()`

  `String`

  `getAirFrontString()`

  `ClimateForecaster.ForecastValue`

  `getCloudiness()`

  `float`

  `getDawn()`

  `float`

  `getDayLightHours()`

  `float`

  `getDusk()`

  `float`

  `getFogDuration()`

  `float`

  `getFogStrength()`

  `ClimateForecaster.ForecastValue`

  `getHumidity()`

  `int`

  `getIndexOffset()`

  `String`

  `getMeanWindAngleString()`

  `String`

  `getName()`

  `ClimateForecaster.ForecastValue`

  `getTemperature()`

  `float`

  `getWeatherEndTime()`

  `ClimateForecaster.DayForecast`

  `getWeatherOverlap()`

  `WeatherPeriod`

  `getWeatherPeriod()`

  `ArrayList<Integer>`

  `getWeatherStages()`

  `float`

  `getWeatherStartTime()`

  `ClimateForecaster.ForecastValue`

  `getWindDirection()`

  `ClimateForecaster.ForecastValue`

  `getWindPower()`

  `boolean`

  `isChanceOnSnow()`

  `boolean`

  `isHasBlizzard()`

  `boolean`

  `isHasFog()`

  `boolean`

  `isHasHeavyRain()`

  `boolean`

  `isHasStorm()`

  `boolean`

  `isHasTropicalStorm()`

  `boolean`

  `isWeatherStarts()`

  `private void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### indexOffset

    private int indexOffset
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### weatherPeriod

    private [WeatherPeriod](WeatherPeriod.html "class in zombie.iso.weather") weatherPeriod
  + ### temperature

    private final [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") temperature
  + ### humidity

    private final [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") humidity
  + ### windDirection

    private final [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") windDirection
  + ### windPower

    private final [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") windPower
  + ### cloudiness

    private final [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") cloudiness
  + ### weatherStarts

    private boolean weatherStarts
  + ### weatherStartTime

    private float weatherStartTime
  + ### weatherEndTime

    private float weatherEndTime
  + ### chanceOnSnow

    private boolean chanceOnSnow
  + ### airFrontString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") airFrontString
  + ### hasFog

    private boolean hasFog
  + ### fogStrength

    private float fogStrength
  + ### fogDuration

    private float fogDuration
  + ### airFront

    private [ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") airFront
  + ### weatherOverlap

    private [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather") weatherOverlap
  + ### hasHeavyRain

    private boolean hasHeavyRain
  + ### hasStorm

    private boolean hasStorm
  + ### hasTropicalStorm

    private boolean hasTropicalStorm
  + ### hasBlizzard

    private boolean hasBlizzard
  + ### dawn

    private float dawn
  + ### dusk

    private float dusk
  + ### dayLightHours

    private float dayLightHours
  + ### weatherStages

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> weatherStages
* Constructor Details
  -------------------

  + ### DayForecast

    public DayForecast()
* Method Details
  --------------

  + ### getIndexOffset

    public int getIndexOffset()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getTemperature

    public [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") getTemperature()
  + ### getHumidity

    public [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") getHumidity()
  + ### getWindDirection

    public [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") getWindDirection()
  + ### getWindPower

    public [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") getWindPower()
  + ### getCloudiness

    public [ClimateForecaster.ForecastValue](ClimateForecaster.ForecastValue.html "class in zombie.iso.weather") getCloudiness()
  + ### getWeatherPeriod

    public [WeatherPeriod](WeatherPeriod.html "class in zombie.iso.weather") getWeatherPeriod()
  + ### isWeatherStarts

    public boolean isWeatherStarts()
  + ### getWeatherStartTime

    public float getWeatherStartTime()
  + ### getWeatherEndTime

    public float getWeatherEndTime()
  + ### isChanceOnSnow

    public boolean isChanceOnSnow()
  + ### getAirFrontString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAirFrontString()
  + ### isHasFog

    public boolean isHasFog()
  + ### getAirFront

    public [ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") getAirFront()
  + ### getWeatherOverlap

    public [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather") getWeatherOverlap()
  + ### getMeanWindAngleString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMeanWindAngleString()
  + ### getFogStrength

    public float getFogStrength()
  + ### getFogDuration

    public float getFogDuration()
  + ### isHasHeavyRain

    public boolean isHasHeavyRain()
  + ### isHasStorm

    public boolean isHasStorm()
  + ### isHasTropicalStorm

    public boolean isHasTropicalStorm()
  + ### isHasBlizzard

    public boolean isHasBlizzard()
  + ### getWeatherStages

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getWeatherStages()
  + ### getDawn

    public float getDawn()
  + ### getDusk

    public float getDusk()
  + ### getDayLightHours

    public float getDayLightHours()
  + ### reset

    private void reset()