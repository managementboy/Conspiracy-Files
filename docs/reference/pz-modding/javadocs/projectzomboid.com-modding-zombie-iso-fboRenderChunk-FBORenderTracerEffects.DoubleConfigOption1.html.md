[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderTracerEffects](FBORenderTracerEffects.html)
3. [DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [DoubleConfigOption1(String, double, double, double)](#%3Cinit%3E(java.lang.String,double,double,double))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderTracerEffects.DoubleConfigOption1
================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](../../config/ConfigOption.html "class in zombie.config")

[zombie.config.DoubleConfigOption](../../config/DoubleConfigOption.html "class in zombie.config")

zombie.iso.fboRenderChunk.FBORenderTracerEffects.DoubleConfigOption1

Enclosing class:
:   `FBORenderTracerEffects`

---

public class FBORenderTracerEffects.DoubleConfigOption1
extends [DoubleConfigOption](../../config/DoubleConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](../../config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  ### Fields inherited from class [DoubleConfigOption](../../config/DoubleConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, max, min, value`

  ### Fields inherited from class [ConfigOption](../../config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DoubleConfigOption1(String name,
  double min,
  double max,
  double defaultValue)`
* Method Summary
  --------------

  ### Methods inherited from class [DoubleConfigOption](../../config/DoubleConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getMax, getMin, getTooltip, getType, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](../../config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### DoubleConfigOption1

    public DoubleConfigOption1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double min,
    double max,
    double defaultValue)