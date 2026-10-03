[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [BooleanConfigOption](BooleanConfigOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
   2. [defaultValue](#defaultValue)
7. [Constructor Details](#constructor-detail)
   1. [BooleanConfigOption(String, boolean)](#%3Cinit%3E(java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [resetToDefault()](#resetToDefault())
   3. [setDefaultToCurrentValue()](#setDefaultToCurrentValue())
   4. [parse(String)](#parse(java.lang.String))
   5. [getValueAsString()](#getValueAsString())
   6. [setValueFromObject(Object)](#setValueFromObject(java.lang.Object))
   7. [getValueAsObject()](#getValueAsObject())
   8. [isValidString(String)](#isValidString(java.lang.String))
   9. [getValue()](#getValue())
   10. [setValue(boolean)](#setValue(boolean))
   11. [getDefaultValue()](#getDefaultValue())
   12. [getTooltip()](#getTooltip())
   13. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BooleanConfigOption
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](ConfigOption.html "class in zombie.config")

zombie.config.BooleanConfigOption

Direct Known Subclasses:
:   `AnimationViewerState.BooleanDebugOption, BooleanDebugOption, DebugChunkState.BooleanDebugOption, IsoRegionsRenderer.BooleanDebugOption, SandboxOptions.BooleanSandboxOption, SeamEditorState.BooleanDebugOption, ServerOptions.BooleanServerOption, SpriteModelEditorState.BooleanDebugOption, TileGeometryState.BooleanDebugOption, ZombiePopulationRenderer.BooleanDebugOption`

---

public class BooleanConfigOption
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

  `protected boolean`

  `defaultValue`

  `protected boolean`

  `value`

  ### Fields inherited from class [ConfigOption](ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BooleanConfigOption(String name,
  boolean defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `getDefaultValue()`

  `String`

  `getTooltip()`

  `String`

  `getType()`

  `boolean`

  `getValue()`

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

  `setValue(boolean value)`

  `void`

  `setValueFromObject(Object o)`

  ### Methods inherited from class [ConfigOption](ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### value

    protected boolean value
  + ### defaultValue

    protected boolean defaultValue
* Constructor Details
  -------------------

  + ### BooleanConfigOption

    public BooleanConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
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
  + ### getValue

    public boolean getValue()
  + ### setValue

    public void setValue(boolean value)
  + ### getDefaultValue

    public boolean getDefaultValue()
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in class `ConfigOption`
  + ### makeCopy

    public [ConfigOption](ConfigOption.html "class in zombie.config") makeCopy()

    Specified by:
    :   `makeCopy` in class `ConfigOption`