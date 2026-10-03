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
3. [XuiSpacing](XuiScript.XuiSpacing.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [top](#top)
   2. [right](#right)
   3. [bottom](#bottom)
   4. [left](#left)
6. [Constructor Details](#constructor-detail)
   1. [XuiSpacing(XuiScript, String, XuiScript.XuiUnit, XuiScript.XuiUnit, XuiScript.XuiUnit, XuiScript.XuiUnit)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String,zombie.scripting.ui.XuiScript.XuiUnit,zombie.scripting.ui.XuiScript.XuiUnit,zombie.scripting.ui.XuiScript.XuiUnit,zombie.scripting.ui.XuiScript.XuiUnit))
7. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))
   2. [load(String, String)](#load(java.lang.String,java.lang.String))
   3. [getTop()](#getTop())
   4. [getRight()](#getRight())
   5. [getBottom()](#getBottom())
   6. [getLeft()](#getLeft())
   7. [isTopPercent()](#isTopPercent())
   8. [isRightPercent()](#isRightPercent())
   9. [isBottomPercent()](#isBottomPercent())
   10. [isLeftPercent()](#isLeftPercent())
   11. [isValueSet()](#isValueSet())
   12. [getValueString()](#getValueString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript.XuiSpacing
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang"), [XuiScript.XuiSpacing](XuiScript.XuiSpacing.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiScript.XuiSpacing

Enclosing class:
:   `XuiScript`

---

public static class XuiScript.XuiSpacing
extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang"), [XuiScript.XuiSpacing](XuiScript.XuiSpacing.html "class in zombie.scripting.ui")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final XuiScript.XuiUnit`

  `bottom`

  `private final XuiScript.XuiUnit`

  `left`

  `private final XuiScript.XuiUnit`

  `right`

  `private final XuiScript.XuiUnit`

  `top`

  ### Fields inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#field-summary "class in zombie.scripting.ui")

  `autoApply, defaultStyle, defaultValue, luaTableKey, parent, style, type, value, valueSet`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiSpacing(XuiScript parent,
  String key,
  XuiScript.XuiUnit top,
  XuiScript.XuiUnit right,
  XuiScript.XuiUnit bottom,
  XuiScript.XuiUnit left)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `fromString(String val)`

  `float`

  `getBottom()`

  `float`

  `getLeft()`

  `float`

  `getRight()`

  `float`

  `getTop()`

  `String`

  `getValueString()`

  `boolean`

  `isBottomPercent()`

  `boolean`

  `isLeftPercent()`

  `boolean`

  `isRightPercent()`

  `boolean`

  `isTopPercent()`

  `boolean`

  `isValueSet()`

  `protected boolean`

  `load(String key,
  String val)`

  ### Methods inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#method-summary "class in zombie.scripting.ui")

  `acceptsKey, getAutoApplyMode, getDefaultStyle, getDefaultValue, getLuaTableKey, getScriptKey, getStyle, getType, getUiOrder, getValueType, isIgnoreStyling, isScriptLoadEnabled, isStyle, setAutoApplyMode, setDefaultValue, setIgnoreStyling, setScriptLoadEnabled, setUiOrder, setValue, value`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### top

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") top
  + ### right

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") right
  + ### bottom

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") bottom
  + ### left

    private final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") left
* Constructor Details
  -------------------

  + ### XuiSpacing

    public XuiSpacing([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") top,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") right,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") bottom,
    [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") left)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiScript.XuiVar<Float, XuiScript.XuiSpacing>`
  + ### load

    protected boolean load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Overrides:
    :   `load` in class `XuiScript.XuiVar<Float, XuiScript.XuiSpacing>`
  + ### getTop

    public float getTop()
  + ### getRight

    public float getRight()
  + ### getBottom

    public float getBottom()
  + ### getLeft

    public float getLeft()
  + ### isTopPercent

    public boolean isTopPercent()
  + ### isRightPercent

    public boolean isRightPercent()
  + ### isBottomPercent

    public boolean isBottomPercent()
  + ### isLeftPercent

    public boolean isLeftPercent()
  + ### isValueSet

    public boolean isValueSet()

    Overrides:
    :   `isValueSet` in class `XuiScript.XuiVar<Float, XuiScript.XuiSpacing>`
  + ### getValueString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueString()

    Overrides:
    :   `getValueString` in class `XuiScript.XuiVar<Float, XuiScript.XuiSpacing>`