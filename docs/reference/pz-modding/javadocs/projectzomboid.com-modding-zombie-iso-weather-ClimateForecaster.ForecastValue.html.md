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
3. [ForecastValue](ClimateForecaster.ForecastValue.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dayMin](#dayMin)
   2. [dayMax](#dayMax)
   3. [dayMean](#dayMean)
   4. [dayMeanTicks](#dayMeanTicks)
   5. [nightMin](#nightMin)
   6. [nightMax](#nightMax)
   7. [nightMean](#nightMean)
   8. [nightMeanTicks](#nightMeanTicks)
   9. [totalMin](#totalMin)
   10. [totalMax](#totalMax)
   11. [totalMean](#totalMean)
   12. [totalMeanTicks](#totalMeanTicks)
6. [Constructor Details](#constructor-detail)
   1. [ForecastValue()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDayMin()](#getDayMin())
   2. [getDayMax()](#getDayMax())
   3. [getDayMean()](#getDayMean())
   4. [getNightMin()](#getNightMin())
   5. [getNightMax()](#getNightMax())
   6. [getNightMean()](#getNightMean())
   7. [getTotalMin()](#getTotalMin())
   8. [getTotalMax()](#getTotalMax())
   9. [getTotalMean()](#getTotalMean())
   10. [add(float, boolean)](#add(float,boolean))
   11. [calculate()](#calculate())
   12. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateForecaster.ForecastValue
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateForecaster.ForecastValue

Enclosing class:
:   `ClimateForecaster`

---

public static class ClimateForecaster.ForecastValue
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `dayMax`

  `private float`

  `dayMean`

  `private int`

  `dayMeanTicks`

  `private float`

  `dayMin`

  `private float`

  `nightMax`

  `private float`

  `nightMean`

  `private int`

  `nightMeanTicks`

  `private float`

  `nightMin`

  `private float`

  `totalMax`

  `private float`

  `totalMean`

  `private int`

  `totalMeanTicks`

  `private float`

  `totalMin`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ForecastValue()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `add(float val,
  boolean isDay)`

  `protected void`

  `calculate()`

  `float`

  `getDayMax()`

  `float`

  `getDayMean()`

  `float`

  `getDayMin()`

  `float`

  `getNightMax()`

  `float`

  `getNightMean()`

  `float`

  `getNightMin()`

  `float`

  `getTotalMax()`

  `float`

  `getTotalMean()`

  `float`

  `getTotalMin()`

  `protected void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dayMin

    private float dayMin
  + ### dayMax

    private float dayMax
  + ### dayMean

    private float dayMean
  + ### dayMeanTicks

    private int dayMeanTicks
  + ### nightMin

    private float nightMin
  + ### nightMax

    private float nightMax
  + ### nightMean

    private float nightMean
  + ### nightMeanTicks

    private int nightMeanTicks
  + ### totalMin

    private float totalMin
  + ### totalMax

    private float totalMax
  + ### totalMean

    private float totalMean
  + ### totalMeanTicks

    private int totalMeanTicks
* Constructor Details
  -------------------

  + ### ForecastValue

    public ForecastValue()
* Method Details
  --------------

  + ### getDayMin

    public float getDayMin()
  + ### getDayMax

    public float getDayMax()
  + ### getDayMean

    public float getDayMean()
  + ### getNightMin

    public float getNightMin()
  + ### getNightMax

    public float getNightMax()
  + ### getNightMean

    public float getNightMean()
  + ### getTotalMin

    public float getTotalMin()
  + ### getTotalMax

    public float getTotalMax()
  + ### getTotalMean

    public float getTotalMean()
  + ### add

    protected void add(float val,
    boolean isDay)
  + ### calculate

    protected void calculate()
  + ### reset

    protected void reset()