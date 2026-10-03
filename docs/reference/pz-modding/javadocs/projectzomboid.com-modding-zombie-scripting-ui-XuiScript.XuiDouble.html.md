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
3. [XuiDouble](XuiScript.XuiDouble.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [XuiDouble(XuiScript, String)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String))
   2. [XuiDouble(XuiScript, String, double)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String,double))
6. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript.XuiDouble
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang"), [XuiScript.XuiDouble](XuiScript.XuiDouble.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiScript.XuiDouble

Enclosing class:
:   `XuiScript`

---

public static class XuiScript.XuiDouble
extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang"), [XuiScript.XuiDouble](XuiScript.XuiDouble.html "class in zombie.scripting.ui")>

* Field Summary
  -------------

  ### Fields inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#field-summary "class in zombie.scripting.ui")

  `autoApply, defaultStyle, defaultValue, luaTableKey, parent, style, type, value, valueSet`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `XuiDouble(XuiScript parent,
  String key)`

  `protected`

  `XuiDouble(XuiScript parent,
  String key,
  double defaultVal)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `fromString(String val)`

  ### Methods inherited from class [XuiScript.XuiVar](XuiScript.XuiVar.html#method-summary "class in zombie.scripting.ui")

  `acceptsKey, getAutoApplyMode, getDefaultStyle, getDefaultValue, getLuaTableKey, getScriptKey, getStyle, getType, getUiOrder, getValueString, getValueType, isIgnoreStyling, isScriptLoadEnabled, isStyle, isValueSet, load, setAutoApplyMode, setDefaultValue, setIgnoreStyling, setScriptLoadEnabled, setUiOrder, setValue, value`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### XuiDouble

    protected XuiDouble([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiDouble

    protected XuiDouble([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    double defaultVal)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiScript.XuiVar<Double, XuiScript.XuiDouble>`