[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [StringConfigOption](StringConfigOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
   2. [defaultValue](#defaultValue)
   3. [maxLength](#maxLength)
   4. [values](#values)
   5. [valueCacheSet](#valueCacheSet)
7. [Constructor Details](#constructor-detail)
   1. [StringConfigOption(String, String, int)](#%3Cinit%3E(java.lang.String,java.lang.String,int))
   2. [StringConfigOption(String, String, ConfigOption.ConfigOptionOnChangeCallback)](#%3Cinit%3E(java.lang.String,java.lang.String,zombie.config.ConfigOption.ConfigOptionOnChangeCallback))
   3. [StringConfigOption(String, String, String[])](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String%5B%5D))
8. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [resetToDefault()](#resetToDefault())
   3. [setDefaultToCurrentValue()](#setDefaultToCurrentValue())
   4. [parse(String)](#parse(java.lang.String))
   5. [getValueAsString()](#getValueAsString())
   6. [getValueAsLuaString()](#getValueAsLuaString())
   7. [setValueFromObject(Object)](#setValueFromObject(java.lang.Object))
   8. [getValueAsObject()](#getValueAsObject())
   9. [isValidString(String)](#isValidString(java.lang.String))
   10. [setValue(String)](#setValue(java.lang.String))
   11. [getValue()](#getValue())
   12. [getDefaultValue()](#getDefaultValue())
   13. [getTooltip()](#getTooltip())
   14. [makeCopy()](#makeCopy())
   15. [getSplitCSVList()](#getSplitCSVList())
   16. [setValueInternal(String)](#setValueInternal(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class StringConfigOption
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](ConfigOption.html "class in zombie.config")

zombie.config.StringConfigOption

Direct Known Subclasses:
:   `DebugChunkState.StringDebugOption, SandboxOptions.StringSandboxOption, ServerOptions.StringServerOption, ServerOptions.TextServerOption`

---

public class StringConfigOption
extends [ConfigOption](ConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected String`

  `defaultValue`

  `protected int`

  `maxLength`

  `protected String`

  `value`

  `private final Set<String>`

  `valueCacheSet`

  `protected String[]`

  `values`

  ### Fields inherited from class [ConfigOption](ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StringConfigOption(String name,
  String defaultValue,
  int maxLength)`

  `StringConfigOption(String name,
  String defaultValue,
  String[] values)`

  `StringConfigOption(String name,
  String defaultValue,
  ConfigOption.ConfigOptionOnChangeCallback onChange)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getDefaultValue()`

  `Set<String>`

  `getSplitCSVList()`

  `String`

  `getTooltip()`

  `String`

  `getType()`

  `String`

  `getValue()`

  `String`

  `getValueAsLuaString()`

  `Object`

  `getValueAsObject()`

  `String`

  `getValueAsString()`

  `boolean`

  `isValidString(String s)`

  `ConfigOption`

  `makeCopy()`

  `void`

  `parse(String s)`

  `void`

  `resetToDefault()`

  `void`

  `setDefaultToCurrentValue()`

  `void`

  `setValue(String value)`

  `void`

  `setValueFromObject(Object o)`

  `private void`

  `setValueInternal(String value)`

  ### Methods inherited from class [ConfigOption](ConfigOption.html#method-summary "class in zombie.config")

  `getName, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### value

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value
  + ### defaultValue

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue
  + ### maxLength

    protected int maxLength
  + ### values

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] values
  + ### valueCacheSet

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> valueCacheSet
* Constructor Details
  -------------------

  + ### StringConfigOption

    public StringConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    int maxLength)
  + ### StringConfigOption

    public StringConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    [ConfigOption.ConfigOptionOnChangeCallback](ConfigOption.ConfigOptionOnChangeCallback.html "interface in zombie.config") onChange)
  + ### StringConfigOption

    public StringConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] values)
* Method Details
  --------------

  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()

    Specified by:
    :   `getType` in class `ConfigOption`
  + ### resetToDefault

    public void resetToDefault()

    Specified by:
    :   `resetToDefault` in class `ConfigOption`
  + ### setDefaultToCurrentValue

    public void setDefaultToCurrentValue()

    Specified by:
    :   `setDefaultToCurrentValue` in class `ConfigOption`
  + ### parse

    public void parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Specified by:
    :   `parse` in class `ConfigOption`
  + ### getValueAsString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsString()

    Specified by:
    :   `getValueAsString` in class `ConfigOption`
  + ### getValueAsLuaString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsLuaString()

    Overrides:
    :   `getValueAsLuaString` in class `ConfigOption`
  + ### setValueFromObject

    public void setValueFromObject([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `setValueFromObject` in class `ConfigOption`
  + ### getValueAsObject

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getValueAsObject()

    Specified by:
    :   `getValueAsObject` in class `ConfigOption`
  + ### isValidString

    public boolean isValidString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Specified by:
    :   `isValidString` in class `ConfigOption`
  + ### setValue

    public void setValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### getValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValue()
  + ### getDefaultValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDefaultValue()
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in class `ConfigOption`
  + ### makeCopy

    public [ConfigOption](ConfigOption.html "class in zombie.config") makeCopy()

    Specified by:
    :   `makeCopy` in class `ConfigOption`
  + ### getSplitCSVList

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSplitCSVList()
  + ### setValueInternal

    private void setValueInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)