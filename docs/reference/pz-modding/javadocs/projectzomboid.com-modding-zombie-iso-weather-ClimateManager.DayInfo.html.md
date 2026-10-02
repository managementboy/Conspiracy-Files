[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateManager](ClimateManager.html)
3. [DayInfo](ClimateManager.DayInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [day](#day)
   2. [month](#month)
   3. [year](#year)
   4. [hour](#hour)
   5. [minutes](#minutes)
   6. [dateValue](#dateValue)
   7. [calendar](#calendar)
   8. [season](#season)
6. [Constructor Details](#constructor-detail)
   1. [DayInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(int, int, int)](#set(int,int,int))
   2. [getDay()](#getDay())
   3. [getMonth()](#getMonth())
   4. [getYear()](#getYear())
   5. [getHour()](#getHour())
   6. [getMinutes()](#getMinutes())
   7. [getDateValue()](#getDateValue())
   8. [getSeason()](#getSeason())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.DayInfo
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.DayInfo

Enclosing class:
:   `ClimateManager`

---

public static class ClimateManager.DayInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `GregorianCalendar`

  `calendar`

  `long`

  `dateValue`

  `int`

  `day`

  `int`

  `hour`

  `int`

  `minutes`

  `int`

  `month`

  `ErosionSeason`

  `season`

  `int`

  `year`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DayInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `long`

  `getDateValue()`

  `int`

  `getDay()`

  `int`

  `getHour()`

  `int`

  `getMinutes()`

  `int`

  `getMonth()`

  `ErosionSeason`

  `getSeason()`

  `int`

  `getYear()`

  `void`

  `set(int day,
  int month,
  int year)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### day

    public int day
  + ### month

    public int month
  + ### year

    public int year
  + ### hour

    public int hour
  + ### minutes

    public int minutes
  + ### dateValue

    public long dateValue
  + ### calendar

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") calendar
  + ### season

    public [ErosionSeason](../../erosion/season/ErosionSeason.html "class in zombie.erosion.season") season
* Constructor Details
  -------------------

  + ### DayInfo

    public DayInfo()
* Method Details
  --------------

  + ### set

    public void set(int day,
    int month,
    int year)
  + ### getDay

    public int getDay()
  + ### getMonth

    public int getMonth()
  + ### getYear

    public int getYear()
  + ### getHour

    public int getHour()
  + ### getMinutes

    public int getMinutes()
  + ### getDateValue

    public long getDateValue()
  + ### getSeason

    public [ErosionSeason](../../erosion/season/ErosionSeason.html "class in zombie.erosion.season") getSeason()