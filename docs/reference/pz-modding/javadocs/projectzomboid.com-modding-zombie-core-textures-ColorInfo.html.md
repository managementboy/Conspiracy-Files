[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.textures](package-summary.html)
2. [ColorInfo](ColorInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [a](#a)
   2. [b](#b)
   3. [g](#g)
   4. [r](#r)
6. [Constructor Details](#constructor-detail)
   1. [ColorInfo()](#%3Cinit%3E())
   2. [ColorInfo(float, float, float, float)](#%3Cinit%3E(float,float,float,float))
7. [Method Details](#method-detail)
   1. [equals(Object)](#equals(java.lang.Object))
   2. [set(ColorInfo)](#set(zombie.core.textures.ColorInfo))
   3. [set(float, float, float, float)](#set(float,float,float,float))
   4. [setRGB(float)](#setRGB(float))
   5. [setRGB(float, float, float)](#setRGB(float,float,float))
   6. [setABGR(int)](#setABGR(int))
   7. [min(float, float, float, float)](#min(float,float,float,float))
   8. [minRGB(float)](#minRGB(float))
   9. [minRGB(float, float, float)](#minRGB(float,float,float))
   10. [getR()](#getR())
   11. [getG()](#getG())
   12. [getB()](#getB())
   13. [toColor()](#toColor())
   14. [toImmutableColor()](#toImmutableColor())
   15. [getA()](#getA())
   16. [desaturate(float)](#desaturate(float))
   17. [interp(ColorInfo, float, ColorInfo)](#interp(zombie.core.textures.ColorInfo,float,zombie.core.textures.ColorInfo))
   18. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ColorInfo
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.ColorInfo

---

public final class ColorInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `a`

  `float`

  `b`

  `float`

  `g`

  `float`

  `r`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ColorInfo()`

  `ColorInfo(float r,
  float g,
  float b,
  float a)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `desaturate(float s)`

  `boolean`

  `equals(Object obj)`

  `float`

  `getA()`

  `float`

  `getB()`

  `float`

  `getG()`

  `float`

  `getR()`

  `void`

  `interp(ColorInfo to,
  float delta,
  ColorInfo dest)`

  `ColorInfo`

  `min(float r,
  float g,
  float b,
  float a)`

  `ColorInfo`

  `minRGB(float rgb)`

  `ColorInfo`

  `minRGB(float r,
  float g,
  float b)`

  `ColorInfo`

  `set(float r,
  float g,
  float b,
  float a)`

  `ColorInfo`

  `set(ColorInfo other)`

  `ColorInfo`

  `setABGR(int abgr)`

  `ColorInfo`

  `setRGB(float rgb)`

  `ColorInfo`

  `setRGB(float r,
  float g,
  float b)`

  `Color`

  `toColor()`

  `ImmutableColor`

  `toImmutableColor()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### a

    public float a
  + ### b

    public float b
  + ### g

    public float g
  + ### r

    public float r
* Constructor Details
  -------------------

  + ### ColorInfo

    public ColorInfo()
  + ### ColorInfo

    public ColorInfo(float r,
    float g,
    float b,
    float a)
* Method Details
  --------------

  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)

    Overrides:
    :   `equals` in class `Object`
  + ### set

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") set([ColorInfo](ColorInfo.html "class in zombie.core.textures") other)
  + ### set

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") set(float r,
    float g,
    float b,
    float a)
  + ### setRGB

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") setRGB(float rgb)
  + ### setRGB

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") setRGB(float r,
    float g,
    float b)
  + ### setABGR

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") setABGR(int abgr)
  + ### min

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") min(float r,
    float g,
    float b,
    float a)
  + ### minRGB

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") minRGB(float rgb)
  + ### minRGB

    public [ColorInfo](ColorInfo.html "class in zombie.core.textures") minRGB(float r,
    float g,
    float b)
  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### toColor

    public [Color](../Color.html "class in zombie.core") toColor()
  + ### toImmutableColor

    public [ImmutableColor](../ImmutableColor.html "class in zombie.core") toImmutableColor()
  + ### getA

    public float getA()
  + ### desaturate

    public void desaturate(float s)
  + ### interp

    public void interp([ColorInfo](ColorInfo.html "class in zombie.core.textures") to,
    float delta,
    [ColorInfo](ColorInfo.html "class in zombie.core.textures") dest)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`