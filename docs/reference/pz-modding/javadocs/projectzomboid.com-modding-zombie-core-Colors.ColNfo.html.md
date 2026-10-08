[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Colors](Colors.html)
3. [ColNfo](Colors.ColNfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [colorSet](#colorSet)
   2. [name](#name)
   3. [hex](#hex)
   4. [color](#color)
   5. [r](#r)
   6. [g](#g)
   7. [b](#b)
   8. [rInt](#rInt)
   9. [gInt](#gInt)
   10. [bInt](#bInt)
6. [Constructor Details](#constructor-detail)
   1. [ColNfo(String, Color, Colors.ColorSet)](#%3Cinit%3E(java.lang.String,zombie.core.Color,zombie.core.Colors.ColorSet))
7. [Method Details](#method-detail)
   1. [getColorSet()](#getColorSet())
   2. [getColorSetIndex()](#getColorSetIndex())
   3. [getName()](#getName())
   4. [getHex()](#getHex())
   5. [getColor()](#getColor())
   6. [getR()](#getR())
   7. [getG()](#getG())
   8. [getB()](#getB())
   9. [getRInt()](#getRInt())
   10. [getGInt()](#getGInt())
   11. [getBInt()](#getBInt())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Colors.ColNfo
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.Colors.ColNfo

Enclosing class:
:   `Colors`

---

public static class Colors.ColNfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `b`

  `private final int`

  `bInt`

  `private final Color`

  `color`

  `private final Colors.ColorSet`

  `colorSet`

  `private final float`

  `g`

  `private final int`

  `gInt`

  `private final String`

  `hex`

  `private final String`

  `name`

  `private final float`

  `r`

  `private final int`

  `rInt`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ColNfo(String name,
  Color c,
  Colors.ColorSet colorSet)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getB()`

  `int`

  `getBInt()`

  `Color`

  `getColor()`

  `Colors.ColorSet`

  `getColorSet()`

  `int`

  `getColorSetIndex()`

  `float`

  `getG()`

  `int`

  `getGInt()`

  `String`

  `getHex()`

  `String`

  `getName()`

  `float`

  `getR()`

  `int`

  `getRInt()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### colorSet

    private final [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") colorSet
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### hex

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hex
  + ### color

    private final [Color](Color.html "class in zombie.core") color
  + ### r

    private final float r
  + ### g

    private final float g
  + ### b

    private final float b
  + ### rInt

    private final int rInt
  + ### gInt

    private final int gInt
  + ### bInt

    private final int bInt
* Constructor Details
  -------------------

  + ### ColNfo

    public ColNfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Color](Color.html "class in zombie.core") c,
    [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") colorSet)
* Method Details
  --------------

  + ### getColorSet

    public [Colors.ColorSet](Colors.ColorSet.html "enum class in zombie.core") getColorSet()
  + ### getColorSetIndex

    public int getColorSetIndex()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getHex

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHex()
  + ### getColor

    public [Color](Color.html "class in zombie.core") getColor()
  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### getRInt

    public int getRInt()
  + ### getGInt

    public int getGInt()
  + ### getBInt

    public int getBInt()