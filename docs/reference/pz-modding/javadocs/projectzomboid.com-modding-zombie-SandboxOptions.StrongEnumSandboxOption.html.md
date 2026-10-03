[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SandboxOptions](SandboxOptions.html)
3. [StrongEnumSandboxOption](SandboxOptions.StrongEnumSandboxOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [enumConstants](#enumConstants)
   2. [defaultValue](#defaultValue)
7. [Constructor Details](#constructor-detail)
   1. [StrongEnumSandboxOption(SandboxOptions, String, Class, EnumType)](#%3Cinit%3E(zombie.SandboxOptions,java.lang.String,java.lang.Class,EnumType))
8. [Method Details](#method-detail)
   1. [getEnumValue()](#getEnumValue())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SandboxOptions.StrongEnumSandboxOption<EnumType extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<EnumType>>
===================================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](config/ConfigOption.html "class in zombie.config")

[zombie.config.IntegerConfigOption](config/IntegerConfigOption.html "class in zombie.config")

[zombie.config.EnumConfigOption](config/EnumConfigOption.html "class in zombie.config")

[zombie.SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie")

zombie.SandboxOptions.StrongEnumSandboxOption<EnumType>

All Implemented Interfaces:
:   `SandboxOptions.SandboxOption`

Enclosing class:
:   `SandboxOptions`

---

public static class SandboxOptions.StrongEnumSandboxOption<EnumType extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<EnumType>>
extends [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final EnumType`

  `defaultValue`

  `private final EnumType[]`

  `enumConstants`

  ### Fields inherited from class [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html#field-summary "class in zombie")

  `custom, pageName, shortName, tableName, translation, valueTranslation`

  ### Fields inherited from class [IntegerConfigOption](config/IntegerConfigOption.html#field-summary "class in zombie.config")

  `max, min, value`

  ### Fields inherited from class [ConfigOption](config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StrongEnumSandboxOption(SandboxOptions owner,
  String name,
  Class<EnumType> enumClass,
  EnumType defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `EnumType`

  `getEnumValue()`

  ### Methods inherited from class [SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html#method-summary "class in zombie")

  `asConfigOption, fromTable, getPageName, getShortName, getTableName, getTooltip, getTranslatedName, getValueTranslation, getValueTranslationByIndex, getValueTranslationByIndexOrNull, isCustom, setCustom, setPageName, setTranslation, setValueTranslation, toTable`

  ### Methods inherited from class [EnumConfigOption](config/EnumConfigOption.html#method-summary "class in zombie.config")

  `getNumValues, getType`

  ### Methods inherited from class [IntegerConfigOption](config/IntegerConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getMax, getMin, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### enumConstants

    private final [EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption")>[] enumConstants
  + ### defaultValue

    private final [EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption")> defaultValue
* Constructor Details
  -------------------

  + ### StrongEnumSandboxOption

    public StrongEnumSandboxOption([SandboxOptions](SandboxOptions.html "class in zombie") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<[EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption")> enumClass,
    [EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption") defaultValue)
* Method Details
  --------------

  + ### getEnumValue

    public [EnumType](#type-param-EnumType "type parameter in SandboxOptions.StrongEnumSandboxOption") getEnumValue()