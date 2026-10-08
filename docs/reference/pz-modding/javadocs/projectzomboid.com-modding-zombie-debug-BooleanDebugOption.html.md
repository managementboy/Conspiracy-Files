[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [BooleanDebugOption](BooleanDebugOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [parent](#parent)
   2. [debugOnly](#debugOnly)
   3. [fullPath](#fullPath)
7. [Constructor Details](#constructor-detail)
   1. [BooleanDebugOption(String, boolean, boolean)](#%3Cinit%3E(java.lang.String,boolean,boolean))
8. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getValue()](#getValue())
   3. [isDebugOnly()](#isDebugOnly())
   4. [getParent()](#getParent())
   5. [setParent(IDebugOptionGroup)](#setParent(zombie.debug.options.IDebugOptionGroup))
   6. [onFullPathChanged()](#onFullPathChanged())
   7. [newOption(IDebugOptionGroup, String, boolean)](#newOption(zombie.debug.options.IDebugOptionGroup,java.lang.String,boolean))
   8. [newDebugOnlyOption(IDebugOptionGroup, String, boolean)](#newDebugOnlyOption(zombie.debug.options.IDebugOptionGroup,java.lang.String,boolean))
   9. [newOptionInternal(IDebugOptionGroup, String, boolean, boolean)](#newOptionInternal(zombie.debug.options.IDebugOptionGroup,java.lang.String,boolean,boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BooleanDebugOption
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](../config/ConfigOption.html "class in zombie.config")

[zombie.config.BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config")

zombie.debug.BooleanDebugOption

All Implemented Interfaces:
:   `zombie.debug.options.IDebugOption`

---

public class BooleanDebugOption
extends [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config")
implements zombie.debug.options.IDebugOption

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](../config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `debugOnly`

  `private String`

  `fullPath`

  `private zombie.debug.options.IDebugOptionGroup`

  `parent`

  ### Fields inherited from class [BooleanConfigOption](../config/BooleanConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, value`

  ### Fields inherited from class [ConfigOption](../config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BooleanDebugOption(String name,
  boolean debugOnly,
  boolean defaultValue)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `zombie.debug.options.IDebugOptionGroup`

  `getParent()`

  `boolean`

  `getValue()`

  `boolean`

  `isDebugOnly()`

  `static BooleanDebugOption`

  `newDebugOnlyOption(zombie.debug.options.IDebugOptionGroup parentGroup,
  String name,
  boolean defaultValue)`

  `static BooleanDebugOption`

  `newOption(zombie.debug.options.IDebugOptionGroup parentGroup,
  String name,
  boolean defaultValue)`

  `private static BooleanDebugOption`

  `newOptionInternal(zombie.debug.options.IDebugOptionGroup parentGroup,
  String name,
  boolean debugOnly,
  boolean defaultValue)`

  `void`

  `onFullPathChanged()`

  `void`

  `setParent(zombie.debug.options.IDebugOptionGroup parent)`

  ### Methods inherited from class [BooleanConfigOption](../config/BooleanConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getTooltip, getType, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](../config/ConfigOption.html#method-summary "class in zombie.config")

  `getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### parent

    private zombie.debug.options.IDebugOptionGroup parent
  + ### debugOnly

    private final boolean debugOnly
  + ### fullPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullPath
* Constructor Details
  -------------------

  + ### BooleanDebugOption

    public BooleanDebugOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean debugOnly,
    boolean defaultValue)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Specified by:
    :   `getName` in interface `zombie.debug.options.IDebugOption`

    Overrides:
    :   `getName` in class `ConfigOption`
  + ### getValue

    public boolean getValue()

    Overrides:
    :   `getValue` in class `BooleanConfigOption`
  + ### isDebugOnly

    public boolean isDebugOnly()
  + ### getParent

    public zombie.debug.options.IDebugOptionGroup getParent()

    Specified by:
    :   `getParent` in interface `zombie.debug.options.IDebugOption`
  + ### setParent

    public void setParent(zombie.debug.options.IDebugOptionGroup parent)

    Specified by:
    :   `setParent` in interface `zombie.debug.options.IDebugOption`
  + ### onFullPathChanged

    public void onFullPathChanged()

    Specified by:
    :   `onFullPathChanged` in interface `zombie.debug.options.IDebugOption`
  + ### newOption

    public static [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") newOption(zombie.debug.options.IDebugOptionGroup parentGroup,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
  + ### newDebugOnlyOption

    public static [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") newDebugOnlyOption(zombie.debug.options.IDebugOptionGroup parentGroup,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
  + ### newOptionInternal

    private static [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") newOptionInternal(zombie.debug.options.IDebugOptionGroup parentGroup,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean debugOnly,
    boolean defaultValue)