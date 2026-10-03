[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateMoon](ClimateMoon.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [day\_year](#day_year)
   2. [moon\_phase\_name](#moon_phase_name)
   3. [units](#units)
   4. [lastYear](#lastYear)
   5. [lastMonth](#lastMonth)
   6. [lastDay](#lastDay)
   7. [currentPhase](#currentPhase)
   8. [currentFloat](#currentFloat)
   9. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [ClimateMoon()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [updatePhase(int, int, int)](#updatePhase(int,int,int))
   3. [getPhaseName()](#getPhaseName())
   4. [getMoonFloat()](#getMoonFloat())
   5. [getCurrentMoonPhase()](#getCurrentMoonPhase())
   6. [getMoonPhase(int, int, int)](#getMoonPhase(int,int,int))
   7. [daysInMonth(int, int)](#daysInMonth(int,int))
   8. [isLeapYearP(int)](#isLeapYearP(int))
   9. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateMoon
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateMoon

---

public final class ClimateMoon
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `currentFloat`

  `private int`

  `currentPhase`

  `private static final int[]`

  `day_year`

  `private static final ClimateMoon`

  `instance`

  `private int`

  `lastDay`

  `private int`

  `lastMonth`

  `private int`

  `lastYear`

  `private static final String[]`

  `moon_phase_name`

  `private static final float[]`

  `units`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateMoon()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private int`

  `daysInMonth(int month,
  int year)`

  `int`

  `getCurrentMoonPhase()`

  `static ClimateMoon`

  `getInstance()`

  `float`

  `getMoonFloat()`

  `private int`

  `getMoonPhase(int year,
  int month,
  int day)`

  `String`

  `getPhaseName()`

  `private boolean`

  `isLeapYearP(int year)`

  `void`

  `Reset()`

  `void`

  `updatePhase(int year,
  int month,
  int day)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### day\_year

    private static final int[] day\_year
  + ### moon\_phase\_name

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] moon\_phase\_name
  + ### units

    private static final float[] units
  + ### lastYear

    private int lastYear
  + ### lastMonth

    private int lastMonth
  + ### lastDay

    private int lastDay
  + ### currentPhase

    private int currentPhase
  + ### currentFloat

    private float currentFloat
  + ### instance

    private static final [ClimateMoon](ClimateMoon.html "class in zombie.iso.weather") instance
* Constructor Details
  -------------------

  + ### ClimateMoon

    public ClimateMoon()
* Method Details
  --------------

  + ### getInstance

    public static [ClimateMoon](ClimateMoon.html "class in zombie.iso.weather") getInstance()
  + ### updatePhase

    public void updatePhase(int year,
    int month,
    int day)
  + ### getPhaseName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPhaseName()
  + ### getMoonFloat

    public float getMoonFloat()
  + ### getCurrentMoonPhase

    public int getCurrentMoonPhase()
  + ### getMoonPhase

    private int getMoonPhase(int year,
    int month,
    int day)
  + ### daysInMonth

    private int daysInMonth(int month,
    int year)
  + ### isLeapYearP

    private boolean isLeapYearP(int year)
  + ### Reset

    public void Reset()