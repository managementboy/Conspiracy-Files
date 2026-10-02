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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [OffsetToday](#OffsetToday)
   2. [climateValues](#climateValues)
   3. [forecasts](#forecasts)
   4. [forecastList](#forecastList)
7. [Constructor Details](#constructor-detail)
   1. [ClimateForecaster()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getForecasts()](#getForecasts())
   2. [getForecast()](#getForecast())
   3. [getForecast(int)](#getForecast(int))
   4. [populateForecastList()](#populateForecastList())
   5. [init(ClimateManager)](#init(zombie.iso.weather.ClimateManager))
   6. [updateDayChange(ClimateManager)](#updateDayChange(zombie.iso.weather.ClimateManager))
   7. [sampleDay(ClimateManager, ClimateForecaster.DayForecast, int)](#sampleDay(zombie.iso.weather.ClimateManager,zombie.iso.weather.ClimateForecaster.DayForecast,int))
   8. [getWeatherOverlap(int, float)](#getWeatherOverlap(int,float))
   9. [getDaysTillFirstWeather()](#getDaysTillFirstWeather())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateForecaster
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateForecaster

---

public class ClimateForecaster
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ClimateForecaster.DayForecast`

  `static class`

  `ClimateForecaster.ForecastValue`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ClimateValues`

  `climateValues`

  `private final ArrayList<ClimateForecaster.DayForecast>`

  `forecastList`

  `private final ClimateForecaster.DayForecast[]`

  `forecasts`

  `private static final int`

  `OffsetToday`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateForecaster()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getDaysTillFirstWeather()`

  `ClimateForecaster.DayForecast`

  `getForecast()`

  `ClimateForecaster.DayForecast`

  `getForecast(int offset)`

  `ArrayList<ClimateForecaster.DayForecast>`

  `getForecasts()`

  `private ClimateForecaster.DayForecast`

  `getWeatherOverlap(int index,
  float hour)`

  `protected void`

  `init(ClimateManager climateManager)`

  `private void`

  `populateForecastList()`

  `protected void`

  `sampleDay(ClimateManager climateManager,
  ClimateForecaster.DayForecast dayForecast,
  int dayOffset)`

  `protected void`

  `updateDayChange(ClimateManager climateManager)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### OffsetToday

    private static final int OffsetToday

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateForecaster.OffsetToday)
  + ### climateValues

    private [ClimateValues](ClimateValues.html "class in zombie.iso.weather") climateValues
  + ### forecasts

    private final [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather")[] forecasts
  + ### forecastList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather")> forecastList
* Constructor Details
  -------------------

  + ### ClimateForecaster

    public ClimateForecaster()
* Method Details
  --------------

  + ### getForecasts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather")> getForecasts()
  + ### getForecast

    public [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather") getForecast()
  + ### getForecast

    public [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather") getForecast(int offset)
  + ### populateForecastList

    private void populateForecastList()
  + ### init

    protected void init([ClimateManager](ClimateManager.html "class in zombie.iso.weather") climateManager)
  + ### updateDayChange

    protected void updateDayChange([ClimateManager](ClimateManager.html "class in zombie.iso.weather") climateManager)
  + ### sampleDay

    protected void sampleDay([ClimateManager](ClimateManager.html "class in zombie.iso.weather") climateManager,
    [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather") dayForecast,
    int dayOffset)
  + ### getWeatherOverlap

    private [ClimateForecaster.DayForecast](ClimateForecaster.DayForecast.html "class in zombie.iso.weather") getWeatherOverlap(int index,
    float hour)
  + ### getDaysTillFirstWeather

    public int getDaysTillFirstWeather()