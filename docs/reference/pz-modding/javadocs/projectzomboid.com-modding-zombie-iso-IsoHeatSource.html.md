[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoHeatSource](IsoHeatSource.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
   4. [radius](#radius)
   5. [temperature](#temperature)
6. [Constructor Details](#constructor-detail)
   1. [IsoHeatSource(int, int, int, int, int)](#%3Cinit%3E(int,int,int,int,int))
7. [Method Details](#method-detail)
   1. [getX()](#getX())
   2. [getY()](#getY())
   3. [getZ()](#getZ())
   4. [getRadius()](#getRadius())
   5. [setRadius(int)](#setRadius(int))
   6. [getTemperature()](#getTemperature())
   7. [setTemperature(int)](#setTemperature(int))
   8. [isInBounds(int, int, int, int)](#isInBounds(int,int,int,int))
   9. [isInBounds()](#isInBounds())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoHeatSource
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoHeatSource

---

public class IsoHeatSource
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `radius`

  `private int`

  `temperature`

  `private final int`

  `x`

  `private final int`

  `y`

  `private final int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoHeatSource(int x,
  int y,
  int z,
  int radius,
  int temperature)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getRadius()`

  `int`

  `getTemperature()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `boolean`

  `isInBounds()`

  `boolean`

  `isInBounds(int minX,
  int minY,
  int maxX,
  int maxY)`

  `void`

  `setRadius(int radius)`

  `void`

  `setTemperature(int temperature)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    private final int x
  + ### y

    private final int y
  + ### z

    private final int z
  + ### radius

    private int radius
  + ### temperature

    private int temperature
* Constructor Details
  -------------------

  + ### IsoHeatSource

    public IsoHeatSource(int x,
    int y,
    int z,
    int radius,
    int temperature)
* Method Details
  --------------

  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getZ

    public int getZ()
  + ### getRadius

    public int getRadius()
  + ### setRadius

    public void setRadius(int radius)
  + ### getTemperature

    public int getTemperature()
  + ### setTemperature

    public void setTemperature(int temperature)
  + ### isInBounds

    public boolean isInBounds(int minX,
    int minY,
    int maxX,
    int maxY)
  + ### isInBounds

    public boolean isInBounds()