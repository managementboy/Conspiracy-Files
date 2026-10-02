[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiScript](XuiScript.html)
3. [XuiVector](XuiScript.XuiVector.html)

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
   1. [XuiVector(XuiScript, String, XuiScript.XuiUnit, XuiScript.XuiUnit, XuiScript.XuiUnit, XuiScript.XuiUnit)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String,zombie.scripting.ui.XuiScript.XuiUnit,zombie.scripting.ui.XuiScript.XuiUnit,zombie.scripting.ui.XuiScript.XuiUnit,zombie.scripting.ui.XuiScript.XuiUnit))
7. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))
   2. [load(String, String)](#load(java.lang.String,java.lang.String))
   3. [getX()](#getX())
   4. [getY()](#getY())
   5. [getWidth()](#getWidth())
   6. [getHeight()](#getHeight())
   7. [getW()](#getW())
   8. [getH()](#getH())
   9. [isxPercent()](#isxPercent())
   10. [isyPercent()](#isyPercent())
   11. [iswPercent()](#iswPercent())
   12. [ishPercent()](#ishPercent())
   13. [isValueSet()](#isValueSet())
   14. [getValueString()](#getValueString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript.XuiVector
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang"), [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiScript.XuiVector

Enclosing class:
:   `XuiScript`

---

public static class XuiScript.XuiVector
extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang"), [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final XuiScript.XuiUnit`

  `h`

  `private final XuiScript.XuiUnit`

  `w`

  `private final XuiScript.XuiUnit`

  `x`

  `private final XuiScript.XuiUnit`

  `y`

  ### Fields inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#field-summary "class in zombie.scripting.ui")

  `autoApply, defaultStyle, defaultValue, luaTableKey, parent, style, type, value, valueSet`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiVector(XuiScript parent,
  String key,
  XuiScript.XuiUnit x,
  XuiScript.XuiUnit y,
  XuiScript.XuiUnit w,
  XuiScript.XuiUnit h)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `fromString(String val)`

  `float`

  `getH()`

  `float`

  `getHeight()`

  `String`

  `getValueString()`

  `float`

  `getW()`

  `float`

  `getWidth()`

  `float`

  `getX()`

  `float`

  `getY()`

  `boolean`

  `ishPercent()`

  `boolean`

  `isValueSet()`

  `boolean`

  `iswPercent()`

  `boolean`

  `isxPercent()`

  `boolean`

  `isyPercent()`

  `protected boolean`

  `load(String key,
  String val)`

  ### Methods inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#method-summary "class in zombie.scripting.ui")

  `acceptsKey, getAutoApplyMode, getDefaultStyle, getDefaultValue, getLuaTableKey, getScriptKey, getStyle, getType, getUiOrder, getValueType, isIgnoreStyling, isScriptLoadEnabled, isStyle, setAutoApplyMode, setDefaultValue, setIgnoreStyling, setScriptLoadEnabled, setUiOrder, setValue, value`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") x
  + ### y

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") y
  + ### w

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") w
  + ### h

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") h
* Constructor Details
  -------------------

  + ### XuiVector

    public XuiVector([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") x,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") y,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") w,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") h)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiScript.XuiVar<Float, XuiScript.XuiVector>`
  + ### load

    protected boolean load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Overrides:
    :   `load` in class `XuiScript.XuiVar<Float, XuiScript.XuiVector>`
  + ### getX

    public float getX()
  + ### getY

    public float getY()
  + ### getWidth

    public float getWidth()
  + ### getHeight

    public float getHeight()
  + ### getW

    public float getW()
  + ### getH

    public float getH()
  + ### isxPercent

    public boolean isxPercent()
  + ### isyPercent

    public boolean isyPercent()
  + ### iswPercent

    public boolean iswPercent()
  + ### ishPercent

    public boolean ishPercent()
  + ### isValueSet

    public boolean isValueSet()

    Overrides:
    :   `isValueSet` in class `XuiScript.XuiVar<Float, XuiScript.XuiVector>`
  + ### getValueString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueString()

    Overrides:
    :   `getValueString` in class `XuiScript.XuiVar<Float, XuiScript.XuiVector>`