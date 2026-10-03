[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoGridSquare](IsoGridSquare.html)
3. [WaterSplashData](IsoGridSquare.WaterSplashData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dx](#dx)
   2. [dy](#dy)
   3. [frame](#frame)
   4. [size](#size)
   5. [isBigSplash](#isBigSplash)
   6. [frameCount](#frameCount)
   7. [frameCacheShift](#frameCacheShift)
   8. [unPausedAccumulator](#unPausedAccumulator)
6. [Constructor Details](#constructor-detail)
   1. [WaterSplashData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getTexture()](#getTexture())
   2. [init(int, int, boolean, float, float)](#init(int,int,boolean,float,float))
   3. [initSmallSplash(float, float)](#initSmallSplash(float,float))
   4. [initBigSplash(float, float)](#initBigSplash(float,float))
   5. [update()](#update())
   6. [isSplashNow()](#isSplashNow())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGridSquare.WaterSplashData
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoGridSquare.WaterSplashData

Enclosing class:
:   `IsoGridSquare`

---

private static final class IsoGridSquare.WaterSplashData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `dx`

  `float`

  `dy`

  `float`

  `frame`

  `private int`

  `frameCacheShift`

  `private int`

  `frameCount`

  `boolean`

  `isBigSplash`

  `float`

  `size`

  `private float`

  `unPausedAccumulator`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WaterSplashData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Texture`

  `getTexture()`

  `void`

  `init(int frameCount,
  int frameCacheShift,
  boolean isRandomSize,
  float dx,
  float dy)`

  `void`

  `initBigSplash(float dx,
  float dy)`

  `void`

  `initSmallSplash(float dx,
  float dy)`

  `boolean`

  `isSplashNow()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dx

    public float dx
  + ### dy

    public float dy
  + ### frame

    public float frame
  + ### size

    public float size
  + ### isBigSplash

    public boolean isBigSplash
  + ### frameCount

    private int frameCount
  + ### frameCacheShift

    private int frameCacheShift
  + ### unPausedAccumulator

    private float unPausedAccumulator
* Constructor Details
  -------------------

  + ### WaterSplashData

    private WaterSplashData()
* Method Details
  --------------

  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### init

    public void init(int frameCount,
    int frameCacheShift,
    boolean isRandomSize,
    float dx,
    float dy)
  + ### initSmallSplash

    public void initSmallSplash(float dx,
    float dy)
  + ### initBigSplash

    public void initBigSplash(float dx,
    float dy)
  + ### update

    public void update()
  + ### isSplashNow

    public boolean isSplashNow()