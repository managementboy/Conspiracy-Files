[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [DebugChunkState](DebugChunkState.html)
3. [IntegerDebugOption](DebugChunkState.IntegerDebugOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [IntegerDebugOption(String, int, int, int)](#%3Cinit%3E(java.lang.String,int,int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugChunkState.IntegerDebugOption
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](../config/ConfigOption.html "class in zombie.config")

[zombie.config.IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config")

zombie.gameStates.DebugChunkState.IntegerDebugOption

Enclosing class:
:   `DebugChunkState`

---

public class DebugChunkState.IntegerDebugOption
extends [IntegerConfigOption](../config/IntegerConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](../config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  ### Fields inherited from class [IntegerConfigOption](../config/IntegerConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, max, min, value`

  ### Fields inherited from class [ConfigOption](../config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IntegerDebugOption(String name,
  int min,
  int max,
  int defaultValue)`
* Method Summary
  --------------

  ### Methods inherited from class [IntegerConfigOption](../config/IntegerConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getMax, getMin, getTooltip, getType, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](../config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### IntegerDebugOption

    public IntegerDebugOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int min,
    int max,
    int defaultValue)