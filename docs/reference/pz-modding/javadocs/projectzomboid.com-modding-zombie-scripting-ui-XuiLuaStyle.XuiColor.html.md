[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiLuaStyle](XuiLuaStyle.html)
3. [XuiColor](XuiLuaStyle.XuiColor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [XuiColor(XuiLuaStyle, String)](#%3Cinit%3E(zombie.scripting.ui.XuiLuaStyle,java.lang.String))
   2. [XuiColor(XuiLuaStyle, String, Color)](#%3Cinit%3E(zombie.scripting.ui.XuiLuaStyle,java.lang.String,zombie.core.Color))
6. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))
   2. [getR()](#getR())
   3. [getG()](#getG())
   4. [getB()](#getB())
   5. [getA()](#getA())
   6. [getValueString()](#getValueString())
   7. [copy(XuiLuaStyle)](#copy(zombie.scripting.ui.XuiLuaStyle))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiLuaStyle.XuiColor
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[Color](../../core/Color.html "class in zombie.core"), [XuiLuaStyle.XuiColor](XuiLuaStyle.XuiColor.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiLuaStyle.XuiColor

Enclosing class:
:   `XuiLuaStyle`

---

public static class XuiLuaStyle.XuiColor
extends [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[Color](../../core/Color.html "class in zombie.core"), [XuiLuaStyle.XuiColor](XuiLuaStyle.XuiColor.html "class in zombie.scripting.ui")>

* Field Summary
  -------------

  ### Fields inherited from class [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html#field-summary "class in zombie.scripting.ui")

  `autoApply, defaultValue, luaTableKey, parent, type, value, valueSet`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `XuiColor(XuiLuaStyle parent,
  String key)`

  `protected`

  `XuiColor(XuiLuaStyle parent,
  String key,
  Color defaultVal)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected XuiLuaStyle.XuiColor`

  `copy(XuiLuaStyle parent)`

  `protected void`

  `fromString(String val)`

  `float`

  `getA()`

  `float`

  `getB()`

  `float`

  `getG()`

  `float`

  `getR()`

  `String`

  `getValueString()`

  ### Methods inherited from class [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html#method-summary "class in zombie.scripting.ui")

  `acceptsKey, copyValuesTo, getAutoApplyMode, getDefaultValue, getLuaTableKey, getScriptKey, getType, getUiOrder, isValueSet, load, setAutoApplyMode, setDefaultValue, setUiOrder, setValue, value`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### XuiColor

    protected XuiColor([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiColor

    protected XuiColor([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [Color](../../core/Color.html "class in zombie.core") defaultVal)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiLuaStyle.XuiVar<Color, XuiLuaStyle.XuiColor>`
  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### getA

    public float getA()
  + ### getValueString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueString()

    Overrides:
    :   `getValueString` in class `XuiLuaStyle.XuiVar<Color, XuiLuaStyle.XuiColor>`
  + ### copy

    protected [XuiLuaStyle.XuiColor](XuiLuaStyle.XuiColor.html "class in zombie.scripting.ui") copy([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent)

    Specified by:
    :   `copy` in class `XuiLuaStyle.XuiVar<Color, XuiLuaStyle.XuiColor>`