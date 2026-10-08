[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion](package-summary.html)
2. [IsoRegionsRenderer](IsoRegionsRenderer.html)
3. [BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [index](#index)
   2. [zLevel](#zLevel)
7. [Constructor Details](#constructor-detail)
   1. [BooleanDebugOption(ArrayList, String, boolean, int)](#%3Cinit%3E(java.util.ArrayList,java.lang.String,boolean,int))
   2. [BooleanDebugOption(ArrayList, String, boolean)](#%3Cinit%3E(java.util.ArrayList,java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [getIndex()](#getIndex())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class IsoRegionsRenderer.BooleanDebugOption
===========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](../../../config/ConfigOption.html "class in zombie.config")

[zombie.config.BooleanConfigOption](../../../config/BooleanConfigOption.html "class in zombie.config")

zombie.iso.areas.isoregion.IsoRegionsRenderer.BooleanDebugOption

Enclosing class:
:   `IsoRegionsRenderer`

---

public static class IsoRegionsRenderer.BooleanDebugOption
extends [BooleanConfigOption](../../../config/BooleanConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](../../../config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `index`

  `private int`

  `zLevel`

  ### Fields inherited from class [BooleanConfigOption](../../../config/BooleanConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, value`

  ### Fields inherited from class [ConfigOption](../../../config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BooleanDebugOption(ArrayList<ConfigOption> optionList,
  String name,
  boolean defaultValue)`

  `BooleanDebugOption(ArrayList<ConfigOption> optionList,
  String name,
  boolean defaultValue,
  int zLevel)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getIndex()`

  ### Methods inherited from class [BooleanConfigOption](../../../config/BooleanConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getTooltip, getType, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](../../../config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### index

    private final int index
  + ### zLevel

    private int zLevel
* Constructor Details
  -------------------

  + ### BooleanDebugOption

    public BooleanDebugOption([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../../../config/ConfigOption.html "class in zombie.config")> optionList,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue,
    int zLevel)
  + ### BooleanDebugOption

    public BooleanDebugOption([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../../../config/ConfigOption.html "class in zombie.config")> optionList,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
* Method Details
  --------------

  + ### getIndex

    public int getIndex()