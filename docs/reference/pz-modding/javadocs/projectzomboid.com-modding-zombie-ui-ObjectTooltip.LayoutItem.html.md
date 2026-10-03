[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [ObjectTooltip](ObjectTooltip.html)
3. [LayoutItem](ObjectTooltip.LayoutItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [label](#label)
   2. [r0](#r0)
   3. [g0](#g0)
   4. [b0](#b0)
   5. [a0](#a0)
   6. [hasValue](#hasValue)
   7. [couldHaveValue](#couldHaveValue)
   8. [value](#value)
   9. [rightJustify](#rightJustify)
   10. [r1](#r1)
   11. [g1](#g1)
   12. [b1](#b1)
   13. [a1](#a1)
   14. [progressFraction](#progressFraction)
   15. [labelWidth](#labelWidth)
   16. [valueWidth](#valueWidth)
   17. [valueWidthRight](#valueWidthRight)
   18. [progressWidth](#progressWidth)
   19. [height](#height)
6. [Constructor Details](#constructor-detail)
   1. [LayoutItem()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [setLabel(String, float, float, float, float)](#setLabel(java.lang.String,float,float,float,float))
   3. [setValue(String, float, float, float, float)](#setValue(java.lang.String,float,float,float,float))
   4. [setValueRight(int, boolean)](#setValueRight(int,boolean))
   5. [setValueRightNoPlus(float)](#setValueRightNoPlus(float))
   6. [setValueRightNoPlus(int)](#setValueRightNoPlus(int))
   7. [setProgress(float, float, float, float, float)](#setProgress(float,float,float,float,float))
   8. [calcSizes()](#calcSizes())
   9. [render(int, int, int, int, ObjectTooltip)](#render(int,int,int,int,zombie.ui.ObjectTooltip))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ObjectTooltip.LayoutItem
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.ObjectTooltip.LayoutItem

Enclosing class:
:   `ObjectTooltip`

---

public static class ObjectTooltip.LayoutItem
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `a0`

  `float`

  `a1`

  `float`

  `b0`

  `float`

  `b1`

  `boolean`

  `couldHaveValue`

  `float`

  `g0`

  `float`

  `g1`

  `boolean`

  `hasValue`

  `int`

  `height`

  `String`

  `label`

  `int`

  `labelWidth`

  `float`

  `progressFraction`

  `int`

  `progressWidth`

  `float`

  `r0`

  `float`

  `r1`

  `boolean`

  `rightJustify`

  `String`

  `value`

  `int`

  `valueWidth`

  `int`

  `valueWidthRight`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LayoutItem()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `calcSizes()`

  `void`

  `render(int x,
  int y,
  int mid,
  int right,
  ObjectTooltip ui)`

  `void`

  `reset()`

  `void`

  `setLabel(String label,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setProgress(float fraction,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setValue(String label,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setValueRight(int value,
  boolean highGood)`

  `void`

  `setValueRightNoPlus(float value)`

  `void`

  `setValueRightNoPlus(int value)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### label

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") label
  + ### r0

    public float r0
  + ### g0

    public float g0
  + ### b0

    public float b0
  + ### a0

    public float a0
  + ### hasValue

    public boolean hasValue
  + ### couldHaveValue

    public boolean couldHaveValue
  + ### value

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value
  + ### rightJustify

    public boolean rightJustify
  + ### r1

    public float r1
  + ### g1

    public float g1
  + ### b1

    public float b1
  + ### a1

    public float a1
  + ### progressFraction

    public float progressFraction
  + ### labelWidth

    public int labelWidth
  + ### valueWidth

    public int valueWidth
  + ### valueWidthRight

    public int valueWidthRight
  + ### progressWidth

    public int progressWidth
  + ### height

    public int height
* Constructor Details
  -------------------

  + ### LayoutItem

    public LayoutItem()
* Method Details
  --------------

  + ### reset

    public void reset()
  + ### setLabel

    public void setLabel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") label,
    float r,
    float g,
    float b,
    float a)
  + ### setValue

    public void setValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") label,
    float r,
    float g,
    float b,
    float a)
  + ### setValueRight

    public void setValueRight(int value,
    boolean highGood)
  + ### setValueRightNoPlus

    public void setValueRightNoPlus(float value)
  + ### setValueRightNoPlus

    public void setValueRightNoPlus(int value)
  + ### setProgress

    public void setProgress(float fraction,
    float r,
    float g,
    float b,
    float a)
  + ### calcSizes

    public void calcSizes()
  + ### render

    public void render(int x,
    int y,
    int mid,
    int right,
    [ObjectTooltip](ObjectTooltip.html "class in zombie.ui") ui)