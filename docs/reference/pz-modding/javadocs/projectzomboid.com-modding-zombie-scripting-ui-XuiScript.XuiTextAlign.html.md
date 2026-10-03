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
3. [XuiTextAlign](XuiScript.XuiTextAlign.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [XuiTextAlign(XuiScript, String)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String))
   2. [XuiTextAlign(XuiScript, String, TextAlign)](#%3Cinit%3E(zombie.scripting.ui.XuiScript,java.lang.String,zombie.scripting.ui.TextAlign))
6. [Method Details](#method-detail)
   1. [fromString(String)](#fromString(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript.XuiTextAlign
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[TextAlign](TextAlign.html "enum class in zombie.scripting.ui"), [XuiScript.XuiTextAlign](XuiScript.XuiTextAlign.html "class in zombie.scripting.ui")>

zombie.scripting.ui.XuiScript.XuiTextAlign

Enclosing class:
:   `XuiScript`

---

public static class XuiScript.XuiTextAlign
extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[TextAlign](TextAlign.html "enum class in zombie.scripting.ui"), [XuiScript.XuiTextAlign](XuiScript.XuiTextAlign.html "class in zombie.scripting.ui")>

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

  `XuiTextAlign(XuiScript parent,
  String key)`

  `protected`

  `XuiTextAlign(XuiScript parent,
  String key,
  TextAlign defaultVal)`
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

  + ### XuiTextAlign

    protected XuiTextAlign([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiTextAlign

    protected XuiTextAlign([XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [TextAlign](TextAlign.html "enum class in zombie.scripting.ui") defaultVal)
* Method Details
  --------------

  + ### fromString

    protected void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `fromString` in class `XuiScript.XuiVar<TextAlign, XuiScript.XuiTextAlign>`