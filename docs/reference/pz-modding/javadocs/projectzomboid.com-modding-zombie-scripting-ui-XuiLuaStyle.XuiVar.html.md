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
3. [XuiVar](XuiLuaStyle.XuiVar.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [uiOrder](#uiOrder)
   2. [type](#type)
   3. [parent](#parent)
   4. [valueSet](#valueSet)
   5. [autoApply](#autoApply)
   6. [defaultValue](#defaultValue)
   7. [value](#value)
   8. [luaTableKey](#luaTableKey)
6. [Constructor Details](#constructor-detail)
   1. [XuiVar(XuiVarType, XuiLuaStyle, String)](#%3Cinit%3E(zombie.scripting.ui.XuiVarType,zombie.scripting.ui.XuiLuaStyle,java.lang.String))
   2. [XuiVar(XuiVarType, XuiLuaStyle, String, T)](#%3Cinit%3E(zombie.scripting.ui.XuiVarType,zombie.scripting.ui.XuiLuaStyle,java.lang.String,T))
7. [Method Details](#method-detail)
   1. [copy(XuiLuaStyle)](#copy(zombie.scripting.ui.XuiLuaStyle))
   2. [copyValuesTo(XuiLuaStyle.XuiVar)](#copyValuesTo(zombie.scripting.ui.XuiLuaStyle.XuiVar))
   3. [getType()](#getType())
   4. [setUiOrder(int)](#setUiOrder(int))
   5. [getUiOrder()](#getUiOrder())
   6. [setDefaultValue(T)](#setDefaultValue(T))
   7. [getDefaultValue()](#getDefaultValue())
   8. [setValue(T)](#setValue(T))
   9. [setAutoApplyMode(XuiAutoApply)](#setAutoApplyMode(zombie.scripting.ui.XuiAutoApply))
   10. [getAutoApplyMode()](#getAutoApplyMode())
   11. [getLuaTableKey()](#getLuaTableKey())
   12. [getScriptKey()](#getScriptKey())
   13. [isValueSet()](#isValueSet())
   14. [value()](#value())
   15. [getValueString()](#getValueString())
   16. [acceptsKey(String)](#acceptsKey(java.lang.String))
   17. [fromString(String)](#fromString(java.lang.String))
   18. [load(String, String)](#load(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiLuaStyle.XuiVar<T, C extends XuiLuaStyle.XuiVar<?,?>>
==============================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiLuaStyle.XuiVar<T,C>

Direct Known Subclasses:
:   `XuiLuaStyle.XuiBoolean, XuiLuaStyle.XuiColor, XuiLuaStyle.XuiDouble, XuiLuaStyle.XuiFontType, XuiLuaStyle.XuiString, XuiLuaStyle.XuiStringList, XuiLuaStyle.XuiTexture, XuiLuaStyle.XuiTranslateString`

Enclosing class:
:   `XuiLuaStyle`

---

public abstract static class XuiLuaStyle.XuiVar<T, C extends XuiLuaStyle.XuiVar<?,?>>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected XuiAutoApply`

  `autoApply`

  `protected T`

  `defaultValue`

  `protected final String`

  `luaTableKey`

  `protected final XuiLuaStyle`

  `parent`

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
  XuiLuaStyle parent,
  String key)`

  `protected`

  `XuiVar(XuiVarType type,
  XuiLuaStyle parent,
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

  `protected abstract XuiLuaStyle.XuiVar<T,C>`

  `copy(XuiLuaStyle parent)`

  `protected XuiLuaStyle.XuiVar<T,C>`

  `copyValuesTo(XuiLuaStyle.XuiVar<T,C> c)`

  `protected abstract void`

  `fromString(String val)`

  `XuiAutoApply`

  `getAutoApplyMode()`

  `protected T`

  `getDefaultValue()`

  `String`

  `getLuaTableKey()`

  `protected String`

  `getScriptKey()`

  `XuiVarType`

  `getType()`

  `int`

  `getUiOrder()`

  `String`

  `getValueString()`

  `boolean`

  `isValueSet()`

  `protected boolean`

  `load(String key,
  String val)`

  `void`

  `setAutoApplyMode(XuiAutoApply autoApplyMode)`

  `protected void`

  `setDefaultValue(T value)`

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

    protected final [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent
  + ### valueSet

    protected boolean valueSet
  + ### autoApply

    protected [XuiAutoApply](XuiAutoApply.html "enum class in zombie.scripting.ui") autoApply
  + ### defaultValue

    protected [T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") defaultValue
  + ### value

    protected [T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") value
  + ### luaTableKey

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaTableKey
* Constructor Details
  -------------------

  + ### XuiVar

    protected XuiVar([XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") type,
    [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### XuiVar

    protected XuiVar([XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") type,
    [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") defaultVal)
* Method Details
  --------------

  + ### copy

    protected abstract [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiLuaStyle.XuiVar"),[C](#type-param-C "type parameter in XuiLuaStyle.XuiVar")> copy([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") parent)
  + ### copyValuesTo

    protected [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiLuaStyle.XuiVar"),[C](#type-param-C "type parameter in XuiLuaStyle.XuiVar")> copyValuesTo([XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<[T](#type-param-T "type parameter in XuiLuaStyle.XuiVar"),[C](#type-param-C "type parameter in XuiLuaStyle.XuiVar")> c)
  + ### getType

    public [XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") getType()
  + ### setUiOrder

    public int setUiOrder(int order)
  + ### getUiOrder

    public int getUiOrder()
  + ### setDefaultValue

    protected void setDefaultValue([T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") value)
  + ### getDefaultValue

    protected [T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") getDefaultValue()
  + ### setValue

    public void setValue([T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") value)
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
  + ### value

    public [T](#type-param-T "type parameter in XuiLuaStyle.XuiVar") value()
  + ### getValueString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueString()
  + ### acceptsKey

    protected boolean acceptsKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### fromString

    protected abstract void fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### load

    protected boolean load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)