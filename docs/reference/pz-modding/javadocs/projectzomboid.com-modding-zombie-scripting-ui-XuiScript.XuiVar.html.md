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
3. [XuiVar](XuiScript.XuiVar.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [uiOrder](#uiOrder)
   2. [type](#type)
   3. [parent](#parent)
   4. [style](#style)
   5. [defaultStyle](#defaultStyle)
   6. [valueSet](#valueSet)
   7. [scriptLoadEnabled](#scriptLoadEnabled)
   8. [autoApply](#autoApply)
   9. [defaultValue](#defaultValue)
   10. [value](#value)
   11. [luaTableKey](#luaTableKey)
   12. [ignoreStyling](#ignoreStyling)
6. [Constructor Details](#constructor-detail)
   1. [XuiVar(XuiVarType, XuiScript, String)](#%3Cinit%3E(zombie.scripting.ui.XuiVarType,zombie.scripting.ui.XuiScript,java.lang.String))
   2. [XuiVar(XuiVarType, XuiScript, String, T)](#%3Cinit%3E(zombie.scripting.ui.XuiVarType,zombie.scripting.ui.XuiScript,java.lang.String,T))
7. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [setUiOrder(int)](#setUiOrder(int))
   3. [getUiOrder()](#getUiOrder())
   4. [getStyle()](#getStyle())
   5. [getDefaultStyle()](#getDefaultStyle())
   6. [isStyle()](#isStyle())
   7. [setScriptLoadEnabled(boolean)](#setScriptLoadEnabled(boolean))
   8. [isScriptLoadEnabled()](#isScriptLoadEnabled())
   9. [setIgnoreStyling(boolean)](#setIgnoreStyling(boolean))
   10. [isIgnoreStyling()](#isIgnoreStyling())
   11. [setDefaultValue(T)](#setDefaultValue(T))
   12. [getDefaultValue()](#getDefaultValue())
   13. [setValue(T)](#setValue(T))
   14. [setAutoApplyMode(XuiAutoApply)](#setAutoApplyMode(zombie.scripting.ui.XuiAutoApply))
   15. [getAutoApplyMode()](#getAutoApplyMode())
   16. [getLuaTableKey()](#getLuaTableKey())
   17. [getScriptKey()](#getScriptKey())
   18. [isValueSet()](#isValueSet())
   19. [getValueType()](#getValueType())
   20. [value()](#value())
   21. [getValueString()](#getValueString())
   22. [acceptsKey(String)](#acceptsKey(java.lang.String))
   23. [fromString(String)](#fromString(java.lang.String))
   24. [load(String, String)](#load(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript.XuiVar<T, C extends XuiScript.XuiVar<?,?>>
==========================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiScript.XuiVar<T,C>

Direct Known Subclasses:
:   `XuiScript.XuiBoolean, XuiScript.XuiColor, XuiScript.XuiDouble, XuiScript.XuiFloat, XuiScript.XuiFontType, XuiScript.XuiFunction, XuiScript.XuiInteger, XuiScript.XuiSpacing, XuiScript.XuiString, XuiScript.XuiStringList, XuiScript.XuiTextAlign, XuiScript.XuiTexture, XuiScript.XuiTranslateString, XuiScript.XuiUnit, XuiScript.XuiVector, XuiScript.XuiVectorPosAlign`

Enclosing class:
:   `XuiScript`

---

public abstract static class XuiScript.XuiVar<T, C extends XuiScript.XuiVar<?,?>>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected XuiAutoApply`

  `autoApply`

  `protected XuiScript.XuiVar<T,C>`

  `defaultStyle`

  `protected T`

  `defaultValue`

  `private boolean`

  `ignoreStyling`

  `protected final String`

  `luaTableKey`

  `protected final XuiScript`

  `parent`

  `private boolean`

  `scriptLoadEnabled`

  `protected XuiScript.XuiVar<T,C>`

  `style`

  `protected final XuiVarType`

  `type`

  `private int`

  `uiOrder`

  `protected T`

  `value`

  `protected boolean`

  `valueSet`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `XuiVar(XuiVarType type,
  XuiScript parent,
  String key)`

  `protected`

  `XuiVar(XuiVarType type,
  XuiScript parent,
  String key,
  T defaultVal)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected boolean`

  `acceptsKey(String key)`

  `protected abstract void`

  `fromString(String val)`

  `XuiAutoApply`

  `getAutoApplyMode()`

  `XuiScript.XuiVar<T,C>`

  `getDefaultStyle()`

  `protected T`

  `getDefaultValue()`

  `String`

  `getLuaTableKey()`

  `protected String`

  `getScriptKey()`

  `XuiScript.XuiVar<T,C>`

  `getStyle()`

  `XuiVarType`

  `getType()`

  `int`

  `getUiOrder()`

  `String`

  `getValueString()`

  `XuiScriptType`

  `getValueType()`

  `boolean`

  `isIgnoreStyling()`

  `boolean`

  `isScriptLoadEnabled()`

  `boolean`

  `isStyle()`

  `boolean`

  `isValueSet()`

  `protected boolean`

  `load(String key,
  String val)`

  `void`

  `setAutoApplyMode(XuiAutoApply autoApplyMode)`

  `protected void`

  `setDefaultValue(T value)`

  `protected void`

  `setIgnoreStyling(boolean b)`

  `void`

  `setScriptLoadEnabled(boolean b)`

  `int`

  `setUiOrder(int order)`

  `void`

  `setValue(T value)`

  `T`

  `value()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### uiOrder

    private int uiOrder
  + ### type

    protected final [XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") type
  + ### parent

    protected final [XuiScript](XuiScript.html "class in zombie.scripting.ui") parent
  + ### style

    protected [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiScript.XuiVar"), [C](#type-param-C "type parameter in XuiScript.XuiVar") extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?>> style
  + ### defaultStyle

    protected [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiScript.XuiVar"), [C](#type-param-C "type parameter in XuiScript.XuiVar") extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?>> defaultStyle
  + ### valueSet

    protected boolean valueSet
  + ### scriptLoadEnabled

    private boolean scriptLoadEnabled
  + ### autoApply

    protected [XuiAutoApply](XuiAutoApply.html "enum class in zombie.scripting.ui") autoApply
  + ### defaultValue

    protected [T](#type-param-T "type parameter in XuiScript.XuiVar") defaultValue
  + ### value

    protected [T](#type-param-T "type parameter in XuiScript.XuiVar") value
  + ### luaTableKey

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaTableKey
  + ### ignoreStyling

    private boolean ignoreStyling
* Constructor Details
  -------------------

  + ### XuiVar

    protected XuiVar([XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") type,
    [XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiVar

    protected XuiVar([XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") type,
    [XuiScript](XuiScript.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [T](#type-param-T "type parameter in XuiScript.XuiVar") defaultVal)
* Method Details
  --------------

  + ### getType

    public [XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") getType()
  + ### setUiOrder

    public int setUiOrder(int order)
  + ### getUiOrder

    public int getUiOrder()
  + ### getStyle

    public [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiScript.XuiVar"),[C](#type-param-C "type parameter in XuiScript.XuiVar")> getStyle()
  + ### getDefaultStyle

    public [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiScript.XuiVar"),[C](#type-param-C "type parameter in XuiScript.XuiVar")> getDefaultStyle()
  + ### isStyle

    public boolean isStyle()
  + ### setScriptLoadEnabled

    public void setScriptLoadEnabled(boolean b)
  + ### isScriptLoadEnabled

    public boolean isScriptLoadEnabled()
  + ### setIgnoreStyling

    protected void setIgnoreStyling(boolean b)
  + ### isIgnoreStyling

    public boolean isIgnoreStyling()
  + ### setDefaultValue

    protected void setDefaultValue([T](#type-param-T "type parameter in XuiScript.XuiVar") value)
  + ### getDefaultValue

    protected [T](#type-param-T "type parameter in XuiScript.XuiVar") getDefaultValue()
  + ### setValue

    public void setValue([T](#type-param-T "type parameter in XuiScript.XuiVar") value)
  + ### setAutoApplyMode

    public void setAutoApplyMode([XuiAutoApply](XuiAutoApply.html "enum class in zombie.scripting.ui") autoApplyMode)
  + ### getAutoApplyMode

    public [XuiAutoApply](XuiAutoApply.html "enum class in zombie.scripting.ui") getAutoApplyMode()
  + ### getLuaTableKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaTableKey()
  + ### getScriptKey

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptKey()
  + ### isValueSet

    public boolean isValueSet()
  + ### getValueType

    public [XuiScriptType](XuiScriptType.html "enum class in zombie.scripting.ui") getValueType()
  + ### value

    public [T](#type-param-T "type parameter in XuiScript.XuiVar") value()
  + ### getValueString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueString()
  + ### acceptsKey

    protected boolean acceptsKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### fromString

    protected abstract void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### load

    protected boolean load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)