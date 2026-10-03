[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [RoomDef](RoomDef.html)
3. [RoomRect](RoomDef.RoomRect.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [w](#w)
   4. [h](#h)
6. [Constructor Details](#constructor-detail)
   1. [RoomRect()](#%3Cinit%3E())
   2. [RoomRect(int, int, int, int)](#%3Cinit%3E(int,int,int,int))
7. [Method Details](#method-detail)
   1. [set(int, int, int, int)](#set(int,int,int,int))
   2. [getX()](#getX())
   3. [getY()](#getY())
   4. [getX2()](#getX2())
   5. [getY2()](#getY2())
   6. [getW()](#getW())
   7. [getH()](#getH())
   8. [contains(float, float)](#contains(float,float))
   9. [getClosestPoint(float, float, Vector2f)](#getClosestPoint(float,float,org.joml.Vector2f))
   10. [getClosestPointOnEdge(float, float, float, float, float, float, float, Vector2f)](#getClosestPointOnEdge(float,float,float,float,float,float,float,org.joml.Vector2f))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RoomDef.RoomRect
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.RoomDef.RoomRect

Enclosing class:
:   `RoomDef`

---

public static final class RoomDef.RoomRect
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `h`

  `int`

  `w`

  `int`

  `x`

  `int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RoomRect()`

  `RoomRect(int x,
  int y,
  int w,
  int h)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `contains(float x,
  float y)`

  `float`

  `getClosestPoint(float x,
  float y,
  Vector2f closestXY)`

  `private float`

  `getClosestPointOnEdge(float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float closestDist,
  Vector2f out)`

  `int`

  `getH()`

  `int`

  `getW()`

  `int`

  `getX()`

  `int`

  `getX2()`

  `int`

  `getY()`

  `int`

  `getY2()`

  `RoomDef.RoomRect`

  `set(int x,
  int y,
  int w,
  int h)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    public int x
  + ### y

    public int y
  + ### w

    public int w
  + ### h

    public int h
* Constructor Details
  -------------------

  + ### RoomRect

    public RoomRect()
  + ### RoomRect

    public RoomRect(int x,
    int y,
    int w,
    int h)
* Method Details
  --------------

  + ### set

    public [RoomDef.RoomRect](RoomDef.RoomRect.html "class in zombie.iso") set(int x,
    int y,
    int w,
    int h)
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getX2

    public int getX2()
  + ### getY2

    public int getY2()
  + ### getW

    public int getW()
  + ### getH

    public int getH()
  + ### contains

    public boolean contains(float x,
    float y)
  + ### getClosestPoint

    public float getClosestPoint(float x,
    float y,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") closestXY)
  + ### getClosestPointOnEdge

    private float getClosestPointOnEdge(float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float closestDist,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") out)