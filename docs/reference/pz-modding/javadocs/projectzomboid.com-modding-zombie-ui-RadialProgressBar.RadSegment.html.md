[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [RadialProgressBar](RadialProgressBar.html)
3. [RadSegment](RadialProgressBar.RadSegment.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vertex](#vertex)
   2. [uv](#uv)
6. [Constructor Details](#constructor-detail)
   1. [RadSegment()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(int, float, float, float, float)](#set(int,float,float,float,float))
   2. [set(float, float, float, float, float, float)](#set(float,float,float,float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadialProgressBar.RadSegment
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.RadialProgressBar.RadSegment

Enclosing class:
:   `RadialProgressBar`

---

private static class RadialProgressBar.RadSegment
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) Vector2[]`

  `uv`

  `(package private) Vector2[]`

  `vertex`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RadSegment()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `set(float x0,
  float y0,
  float x1,
  float y1,
  float x2,
  float y2)`

  `private RadialProgressBar.RadSegment`

  `set(int index,
  float vx,
  float vy,
  float uv1,
  float uv2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vertex

    [Vector2](../iso/Vector2.html "class in zombie.iso")[] vertex
  + ### uv

    [Vector2](../iso/Vector2.html "class in zombie.iso")[] uv
* Constructor Details
  -------------------

  + ### RadSegment

    private RadSegment()
* Method Details
  --------------

  + ### set

    private [RadialProgressBar.RadSegment](RadialProgressBar.RadSegment.html "class in zombie.ui") set(int index,
    float vx,
    float vy,
    float uv1,
    float uv2)
  + ### set

    private void set(float x0,
    float y0,
    float x1,
    float y1,
    float x2,
    float y2)