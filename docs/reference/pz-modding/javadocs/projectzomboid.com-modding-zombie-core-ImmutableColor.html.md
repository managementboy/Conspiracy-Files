[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [ImmutableColor](ImmutableColor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [transparent](#transparent)
   2. [white](#white)
   3. [yellow](#yellow)
   4. [red](#red)
   5. [purple](#purple)
   6. [blue](#blue)
   7. [green](#green)
   8. [black](#black)
   9. [gray](#gray)
   10. [cyan](#cyan)
   11. [darkGray](#darkGray)
   12. [lightGray](#lightGray)
   13. [pink](#pink)
   14. [orange](#orange)
   15. [magenta](#magenta)
   16. [darkGreen](#darkGreen)
   17. [lightGreen](#lightGreen)
   18. [a](#a)
   19. [b](#b)
   20. [g](#g)
   21. [r](#r)
6. [Constructor Details](#constructor-detail)
   1. [ImmutableColor(ImmutableColor)](#%3Cinit%3E(zombie.core.ImmutableColor))
   2. [ImmutableColor(Color)](#%3Cinit%3E(zombie.core.Color))
   3. [ImmutableColor(float, float, float)](#%3Cinit%3E(float,float,float))
   4. [ImmutableColor(float, float, float, float)](#%3Cinit%3E(float,float,float,float))
   5. [ImmutableColor(Color, Color, float)](#%3Cinit%3E(zombie.core.Color,zombie.core.Color,float))
   6. [ImmutableColor(int, int, int)](#%3Cinit%3E(int,int,int))
   7. [ImmutableColor(int, int, int, int)](#%3Cinit%3E(int,int,int,int))
   8. [ImmutableColor(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [toMutableColor()](#toMutableColor())
   2. [random()](#random())
   3. [decode(String)](#decode(java.lang.String))
   4. [add(ImmutableColor)](#add(zombie.core.ImmutableColor))
   5. [brighter()](#brighter())
   6. [brighter(float)](#brighter(float))
   7. [darker()](#darker())
   8. [darker(float)](#darker(float))
   9. [equals(Object)](#equals(java.lang.Object))
   10. [getAlphaInt()](#getAlphaInt())
   11. [getAlphaFloat()](#getAlphaFloat())
   12. [getRedFloat()](#getRedFloat())
   13. [getGreenFloat()](#getGreenFloat())
   14. [getBlueFloat()](#getBlueFloat())
   15. [getAlphaByte()](#getAlphaByte())
   16. [getBlueInt()](#getBlueInt())
   17. [getBlueByte()](#getBlueByte())
   18. [getGreenInt()](#getGreenInt())
   19. [getGreenByte()](#getGreenByte())
   20. [getRedInt()](#getRedInt())
   21. [getRedByte()](#getRedByte())
   22. [hashCode()](#hashCode())
   23. [multiply(Color)](#multiply(zombie.core.Color))
   24. [scale(float)](#scale(float))
   25. [toString()](#toString())
   26. [interp(ImmutableColor, float)](#interp(zombie.core.ImmutableColor,float))
   27. [HSBtoRGB(float, float, float)](#HSBtoRGB(float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ImmutableColor
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.ImmutableColor

---

public final class ImmutableColor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final float`

  `a`

  `final float`

  `b`

  `static final ImmutableColor`

  `black`

  `static final ImmutableColor`

  `blue`

  `static final ImmutableColor`

  `cyan`

  `static final ImmutableColor`

  `darkGray`

  `static final ImmutableColor`

  `darkGreen`

  `final float`

  `g`

  `static final ImmutableColor`

  `gray`

  `static final ImmutableColor`

  `green`

  `static final ImmutableColor`

  `lightGray`

  `static final ImmutableColor`

  `lightGreen`

  `static final ImmutableColor`

  `magenta`

  `static final ImmutableColor`

  `orange`

  `static final ImmutableColor`

  `pink`

  `static final ImmutableColor`

  `purple`

  `final float`

  `r`

  `static final ImmutableColor`

  `red`

  `static final ImmutableColor`

  `transparent`

  `static final ImmutableColor`

  `white`

  `static final ImmutableColor`

  `yellow`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ImmutableColor(float r,
  float g,
  float b)`

  `ImmutableColor(float r,
  float g,
  float b,
  float a)`

  `ImmutableColor(int value)`

  `ImmutableColor(int r,
  int g,
  int b)`

  `ImmutableColor(int r,
  int g,
  int b,
  int a)`

  `ImmutableColor(Color color)`

  `ImmutableColor(Color colorA,
  Color colorB,
  float delta)`

  `ImmutableColor(ImmutableColor color)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ImmutableColor`

  `add(ImmutableColor c)`

  `ImmutableColor`

  `brighter()`

  `ImmutableColor`

  `brighter(float scale)`

  `ImmutableColor`

  `darker()`

  `ImmutableColor`

  `darker(float scale)`

  `static ImmutableColor`

  `decode(String nm)`

  `boolean`

  `equals(Object other)`

  `byte`

  `getAlphaByte()`

  `float`

  `getAlphaFloat()`

  `int`

  `getAlphaInt()`

  `byte`

  `getBlueByte()`

  `float`

  `getBlueFloat()`

  `int`

  `getBlueInt()`

  `byte`

  `getGreenByte()`

  `float`

  `getGreenFloat()`

  `int`

  `getGreenInt()`

  `byte`

  `getRedByte()`

  `float`

  `getRedFloat()`

  `int`

  `getRedInt()`

  `int`

  `hashCode()`

  `static Integer[]`

  `HSBtoRGB(float hue,
  float saturation,
  float brightness)`

  `ImmutableColor`

  `interp(ImmutableColor to,
  float delta)`

  `ImmutableColor`

  `multiply(Color c)`

  `static ImmutableColor`

  `random()`

  `ImmutableColor`

  `scale(float value)`

  `Color`

  `toMutableColor()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### transparent

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") transparent
  + ### white

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") white
  + ### yellow

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") yellow
  + ### red

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") red
  + ### purple

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") purple
  + ### blue

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") blue
  + ### green

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") green
  + ### black

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") black
  + ### gray

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") gray
  + ### cyan

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") cyan
  + ### darkGray

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") darkGray
  + ### lightGray

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") lightGray
  + ### pink

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") pink
  + ### orange

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") orange
  + ### magenta

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") magenta
  + ### darkGreen

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") darkGreen
  + ### lightGreen

    public static final [ImmutableColor](ImmutableColor.html "class in zombie.core") lightGreen
  + ### a

    public final float a
  + ### b

    public final float b
  + ### g

    public final float g
  + ### r

    public final float r
* Constructor Details
  -------------------

  + ### ImmutableColor

    public ImmutableColor([ImmutableColor](ImmutableColor.html "class in zombie.core") color)
  + ### ImmutableColor

    public ImmutableColor([Color](Color.html "class in zombie.core") color)
  + ### ImmutableColor

    public ImmutableColor(float r,
    float g,
    float b)
  + ### ImmutableColor

    public ImmutableColor(float r,
    float g,
    float b,
    float a)
  + ### ImmutableColor

    public ImmutableColor([Color](Color.html "class in zombie.core") colorA,
    [Color](Color.html "class in zombie.core") colorB,
    float delta)
  + ### ImmutableColor

    public ImmutableColor(int r,
    int g,
    int b)
  + ### ImmutableColor

    public ImmutableColor(int r,
    int g,
    int b,
    int a)
  + ### ImmutableColor

    public ImmutableColor(int value)
* Method Details
  --------------

  + ### toMutableColor

    public [Color](Color.html "class in zombie.core") toMutableColor()
  + ### random

    public static [ImmutableColor](ImmutableColor.html "class in zombie.core") random()
  + ### decode

    public static [ImmutableColor](ImmutableColor.html "class in zombie.core") decode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nm)
  + ### add

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") add([ImmutableColor](ImmutableColor.html "class in zombie.core") c)
  + ### brighter

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") brighter()
  + ### brighter

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") brighter(float scale)
  + ### darker

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") darker()
  + ### darker

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") darker(float scale)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") other)

    Overrides:
    :   `equals` in class `Object`
  + ### getAlphaInt

    public int getAlphaInt()
  + ### getAlphaFloat

    public float getAlphaFloat()
  + ### getRedFloat

    public float getRedFloat()
  + ### getGreenFloat

    public float getGreenFloat()
  + ### getBlueFloat

    public float getBlueFloat()
  + ### getAlphaByte

    public byte getAlphaByte()
  + ### getBlueInt

    public int getBlueInt()
  + ### getBlueByte

    public byte getBlueByte()
  + ### getGreenInt

    public int getGreenInt()
  + ### getGreenByte

    public byte getGreenByte()
  + ### getRedInt

    public int getRedInt()
  + ### getRedByte

    public byte getRedByte()
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### multiply

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") multiply([Color](Color.html "class in zombie.core") c)
  + ### scale

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") scale(float value)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### interp

    public [ImmutableColor](ImmutableColor.html "class in zombie.core") interp([ImmutableColor](ImmutableColor.html "class in zombie.core") to,
    float delta)
  + ### HSBtoRGB

    public static [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")[] HSBtoRGB(float hue,
    float saturation,
    float brightness)