[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ThunderStorm](ThunderStorm.html)
3. [ThunderCloud](ThunderStorm.ThunderCloud.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [currentX](#currentX)
   2. [currentY](#currentY)
   3. [startX](#startX)
   4. [startY](#startY)
   5. [endX](#endX)
   6. [endY](#endY)
   7. [startTime](#startTime)
   8. [endTime](#endTime)
   9. [duration](#duration)
   10. [strength](#strength)
   11. [angle](#angle)
   12. [radius](#radius)
   13. [eventFrequency](#eventFrequency)
   14. [thunderRatio](#thunderRatio)
   15. [percentageOffset](#percentageOffset)
   16. [isRunning](#isRunning)
   17. [suspendTimer](#suspendTimer)
6. [Constructor Details](#constructor-detail)
   1. [ThunderCloud()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getCurrentX()](#getCurrentX())
   2. [getCurrentY()](#getCurrentY())
   3. [getRadius()](#getRadius())
   4. [isRunning()](#isRunning())
   5. [getStrength()](#getStrength())
   6. [lifeTime()](#lifeTime())
   7. [setCenter(int, int, float)](#setCenter(int,int,float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ThunderStorm.ThunderCloud
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ThunderStorm.ThunderCloud

Enclosing class:
:   `ThunderStorm`

---

public static class ThunderStorm.ThunderCloud
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `angle`

  `private int`

  `currentX`

  `private int`

  `currentY`

  `private double`

  `duration`

  `private double`

  `endTime`

  `private int`

  `endX`

  `private int`

  `endY`

  `private float`

  `eventFrequency`

  `private boolean`

  `isRunning`

  `private float`

  `percentageOffset`

  `private float`

  `radius`

  `private double`

  `startTime`

  `private int`

  `startX`

  `private int`

  `startY`

  `private float`

  `strength`

  `private final GameTime.AnimTimer`

  `suspendTimer`

  `private float`

  `thunderRatio`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ThunderCloud()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getCurrentX()`

  `int`

  `getCurrentY()`

  `float`

  `getRadius()`

  `float`

  `getStrength()`

  `boolean`

  `isRunning()`

  `double`

  `lifeTime()`

  `void`

  `setCenter(int centerX,
  int centerY,
  float angle)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### currentX

    private int currentX
  + ### currentY

    private int currentY
  + ### startX

    private int startX
  + ### startY

    private int startY
  + ### endX

    private int endX
  + ### endY

    private int endY
  + ### startTime

    private double startTime
  + ### endTime

    private double endTime
  + ### duration

    private double duration
  + ### strength

    private float strength
  + ### angle

    private float angle
  + ### radius

    private float radius
  + ### eventFrequency

    private float eventFrequency
  + ### thunderRatio

    private float thunderRatio
  + ### percentageOffset

    private float percentageOffset
  + ### isRunning

    private boolean isRunning
  + ### suspendTimer

    private final [GameTime.AnimTimer](../../GameTime.AnimTimer.html "class in zombie") suspendTimer
* Constructor Details
  -------------------

  + ### ThunderCloud

    public ThunderCloud()
* Method Details
  --------------

  + ### getCurrentX

    public int getCurrentX()
  + ### getCurrentY

    public int getCurrentY()
  + ### getRadius

    public float getRadius()
  + ### isRunning

    public boolean isRunning()
  + ### getStrength

    public float getStrength()
  + ### lifeTime

    public double lifeTime()
  + ### setCenter

    public void setCenter(int centerX,
    int centerY,
    float angle)