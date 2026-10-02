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
3. [XuiUnit](XuiScript.XuiUnit.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [isPercent](#isPercent)
6. [Constructor Details](#constructor-detail)
   1. [XuiUnit(XuiScript, String)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String))
   2. [XuiUnit(XuiScript, String, float)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String,float))
7. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))
   2. [setValue(float, boolean)](#setValue(float,boolean))
   3. [isPercent()](#isPercent())
   4. [isPercent(String)](#isPercent(java.lang.String))
   5. [getNum(String)](#getNum(java.lang.String))
   6. [getValueString()](#getValueString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript.XuiUnit
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang"), [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiScript.XuiUnit

Enclosing class:
:   `XuiScript`

---

public static class XuiScript.XuiUnit
extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang"), [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `isPercent`

  ### Fields inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#field-summary "class in zombie.scripting.ui")

  `autoApply, defaultStyle, defaultValue, luaTableKey, parent, style, type, value, valueSet`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `XuiUnit(XuiScript parent,
  String key)`

  `protected`

  `XuiUnit(XuiScript parent,
  String key,
  float defaultVal)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `fromString(String val)`

  `private float`

  `getNum(String s)`

  `String`

  `getValueString()`

  `boolean`

  `isPercent()`

  `private boolean`

  `isPercent(String s)`

  `void`

  `setValue(float val,
  boolean isPercent)`

  ### Methods inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#method-summary "class in zombie.scripting.ui")

  `acceptsKey, getAutoApplyMode, getDefaultStyle, getDefaultValue, getLuaTableKey, getScriptKey, getStyle, getType, getUiOrder, getValueType, isIgnoreStyling, isScriptLoadEnabled, isStyle, isValueSet, load, setAutoApplyMode, setDefaultValue, setIgnoreStyling, setScriptLoadEnabled, setUiOrder, setValue, value`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### isPercent

    protected boolean isPercent
* Constructor Details
  -------------------

  + ### XuiUnit

    protected XuiUnit([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiUnit

    protected XuiUnit([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    float defaultVal)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiScript.XuiVar<Float, XuiScript.XuiUnit>`
  + ### setValue

    public void setValue(float val,
    boolean isPercent)
  + ### isPercent

    public boolean isPercent()
  + ### isPercent

    private boolean isPercent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getNum

    private float getNum([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getValueString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueString()

    Overrides:
    :   `getValueString` in class `XuiScript.XuiVar<Float, XuiScript.XuiUnit>`