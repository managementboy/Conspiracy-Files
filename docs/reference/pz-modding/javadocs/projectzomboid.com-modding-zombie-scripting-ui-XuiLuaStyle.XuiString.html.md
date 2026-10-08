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
3. [XuiString](XuiLuaStyle.XuiString.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [XuiString(XuiLuaStyle, String)](#%3Cinit%3E(zombie.scripting.ui.XuiLuaStyle,java.lang.String))
   2. [XuiString(XuiLuaStyle, String, String)](#%3Cinit%3E(zombie.scripting.ui.XuiLuaStyle,java.lang.String,java.lang.String))
6. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))
   2. [copy(XuiLuaStyle)](#copy(zombie.scripting.ui.XuiLuaStyle))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiLuaStyle.XuiString
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLuaStyle.XuiString](XuiLuaStyle.XuiString.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiLuaStyle.XuiString

Enclosing class:
:   `XuiLuaStyle`

---

public static class XuiLuaStyle.XuiString
extends [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLuaStyle.XuiString](XuiLuaStyle.XuiString.html "class in zombie.scripting.ui")>

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

  `XuiString(XuiLuaStyle parent,
  String key)`

  `protected`

  `XuiString(XuiLuaStyle parent,
  String key,
  String defaultVal)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected XuiLuaStyle.XuiString`

  `copy(XuiLuaStyle parent)`

  `protected void`

  `fromString(String val)`

  ### Methods inherited from class [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html#method-summary "class in zombie.scripting.ui")

  `acceptsKey, copyValuesTo, getAutoApplyMode, getDefaultValue, getLuaTableKey, getScriptKey, getType, getUiOrder, getValueString, isValueSet, load, setAutoApplyMode, setDefaultValue, setUiOrder, setValue, value`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### XuiString

    protected XuiString([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiString

    protected XuiString([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultVal)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiLuaStyle.XuiVar<String, XuiLuaStyle.XuiString>`
  + ### copy

    protected [XuiLuaStyle.XuiString](XuiLuaStyle.XuiString.html "class in zombie.scripting.ui") copy([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent)

    Specified by:
    :   `copy` in class `XuiLuaStyle.XuiVar<String, XuiLuaStyle.XuiString>`