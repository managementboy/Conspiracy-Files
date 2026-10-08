[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoWaterGeometry](IsoWaterGeometry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempVector2f](#tempVector2f)
   2. [hasWater](#hasWater)
   3. [shore](#shore)
   4. [renderInit](#renderInit)
   5. [x](#x)
   6. [y](#y)
   7. [depth](#depth)
   8. [flow](#flow)
   9. [speed](#speed)
   10. [isExternal](#isExternal)
   11. [square](#square)
   12. [adjacentChunkLoadedCounter](#adjacentChunkLoadedCounter)
   13. [pool](#pool)
6. [Constructor Details](#constructor-detail)
   1. [IsoWaterGeometry()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(IsoGridSquare)](#init(zombie.iso.IsoGridSquare))
   2. [initRenderIfNeeded()](#initRenderIfNeeded())
   3. [initRender()](#initRender())
   4. [hideWaterObjects(IsoGridSquare)](#hideWaterObjects(zombie.iso.IsoGridSquare))
   5. [isShore()](#isShore())
   6. [isActualShore()](#isActualShore())
   7. [getFlow()](#getFlow())
   8. [getSpeed()](#getSpeed())
   9. [isValid()](#isValid())
   10. [hasWater()](#hasWater())
   11. [isbShore()](#isbShore())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoWaterGeometry
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoWaterGeometry

---

public final class IsoWaterGeometry
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `adjacentChunkLoadedCounter`

  `final float[]`

  `depth`

  `(package private) final float[]`

  `flow`

  `(package private) boolean`

  `hasWater`

  `(package private) float`

  `isExternal`

  `static final zombie.popman.ObjectPool<IsoWaterGeometry>`

  `pool`

  `(package private) boolean`

  `renderInit`

  `(package private) boolean`

  `shore`

  `(package private) final float[]`

  `speed`

  `(package private) IsoGridSquare`

  `square`

  `private static final Vector2f`

  `tempVector2f`

  `(package private) final float[]`

  `x`

  `(package private) final float[]`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWaterGeometry()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getFlow()`

  `float`

  `getSpeed()`

  `boolean`

  `hasWater()`

  `private void`

  `hideWaterObjects(IsoGridSquare square)`

  `IsoWaterGeometry`

  `init(IsoGridSquare square)`

  `private void`

  `initRender()`

  `void`

  `initRenderIfNeeded()`

  `boolean`

  `isActualShore()`

  `boolean`

  `isbShore()`

  `boolean`

  `isShore()`

  `boolean`

  `isValid()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempVector2f

    private static final [Vector2f](../../org/joml/Vector2f.html "class in org.joml") tempVector2f
  + ### hasWater

    boolean hasWater
  + ### shore

    boolean shore
  + ### renderInit

    boolean renderInit
  + ### x

    final float[] x
  + ### y

    final float[] y
  + ### depth

    public final float[] depth
  + ### flow

    final float[] flow
  + ### speed

    final float[] speed
  + ### isExternal

    float isExternal
  + ### square

    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square
  + ### adjacentChunkLoadedCounter

    int adjacentChunkLoadedCounter
  + ### pool

    public static final zombie.popman.ObjectPool<[IsoWaterGeometry](IsoWaterGeometry.html "class in zombie.iso")> pool
* Constructor Details
  -------------------

  + ### IsoWaterGeometry

    public IsoWaterGeometry()
* Method Details
  --------------

  + ### init

    public [IsoWaterGeometry](IsoWaterGeometry.html "class in zombie.iso") init([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### initRenderIfNeeded

    public void initRenderIfNeeded()
  + ### initRender

    private void initRender()
  + ### hideWaterObjects

    private void hideWaterObjects([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### isShore

    public boolean isShore()
  + ### isActualShore

    public boolean isActualShore()
  + ### getFlow

    public float getFlow()
  + ### getSpeed

    public float getSpeed()
  + ### isValid

    public boolean isValid()
  + ### hasWater

    public boolean hasWater()
  + ### isbShore

    public boolean isbShore()