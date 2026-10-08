[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoObjectPicker](IsoObjectPicker.html)
3. [ClickObject](IsoObjectPicker.ClickObject.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [height](#height)
   2. [square](#square)
   3. [tile](#tile)
   4. [width](#width)
   5. [x](#x)
   6. [y](#y)
   7. [lx](#lx)
   8. [ly](#ly)
   9. [scaleX](#scaleX)
   10. [scaleY](#scaleY)
   11. [flip](#flip)
   12. [score](#score)
   13. [z](#z)
6. [Constructor Details](#constructor-detail)
   1. [ClickObject()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(IsoObjectPicker.ClickObject)](#set(zombie.iso.IsoObjectPicker.ClickObject))
   2. [calculateScore()](#calculateScore())
   3. [getScore()](#getScore())
   4. [contains(float, float, int)](#contains(float,float,int))
   5. [isInteractiveEntity(IsoObject)](#isInteractiveEntity(zombie.iso.IsoObject))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoObjectPicker.ClickObject
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoObjectPicker.ClickObject

Enclosing class:
:   `IsoObjectPicker`

---

public static final class IsoObjectPicker.ClickObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `flip`

  `int`

  `height`

  `int`

  `lx`

  `int`

  `ly`

  `float`

  `scaleX`

  `float`

  `scaleY`

  `int`

  `score`

  `IsoGridSquare`

  `square`

  `IsoObject`

  `tile`

  `int`

  `width`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClickObject()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `calculateScore()`

  `boolean`

  `contains(float x,
  float y,
  int z)`

  `int`

  `getScore()`

  `private boolean`

  `isInteractiveEntity(IsoObject object)`

  `IsoObjectPicker.ClickObject`

  `set(IsoObjectPicker.ClickObject other)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### height

    public int height
  + ### square

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square
  + ### tile

    public [IsoObject](IsoObject.html "class in zombie.iso") tile
  + ### width

    public int width
  + ### x

    public int x
  + ### y

    public int y
  + ### lx

    public int lx
  + ### ly

    public int ly
  + ### scaleX

    public float scaleX
  + ### scaleY

    public float scaleY
  + ### flip

    public boolean flip
  + ### score

    public int score
  + ### z

    public int z
* Constructor Details
  -------------------

  + ### ClickObject

    public ClickObject()
* Method Details
  --------------

  + ### set

    public [IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso") set([IsoObjectPicker.ClickObject](IsoObjectPicker.ClickObject.html "class in zombie.iso") other)
  + ### calculateScore

    public int calculateScore()
  + ### getScore

    public int getScore()
  + ### contains

    public boolean contains(float x,
    float y,
    int z)
  + ### isInteractiveEntity

    private boolean isInteractiveEntity([IsoObject](IsoObject.html "class in zombie.iso") object)