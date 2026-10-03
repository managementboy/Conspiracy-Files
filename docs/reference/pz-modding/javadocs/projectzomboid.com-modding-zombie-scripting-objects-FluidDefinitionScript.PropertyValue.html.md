[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [FluidDefinitionScript](FluidDefinitionScript.html)
3. [PropertyValue](FluidDefinitionScript.PropertyValue.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [defaultValue](#defaultValue)
   3. [value](#value)
6. [Constructor Details](#constructor-detail)
   1. [PropertyValue(String, float)](#%3Cinit%3E(java.lang.String,float))
7. [Method Details](#method-detail)
   1. [matchesKey(String)](#matchesKey(java.lang.String))
   2. [set(float)](#set(float))
   3. [get()](#get())
   4. [isSet()](#isSet())
   5. [reset()](#reset())
   6. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FluidDefinitionScript.PropertyValue
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.FluidDefinitionScript.PropertyValue

Enclosing class:
:   `FluidDefinitionScript`

---

private static class FluidDefinitionScript.PropertyValue
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `defaultValue`

  `private final String`

  `name`

  `private float`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PropertyValue(String name,
  float defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `get()`

  `boolean`

  `isSet()`

  `boolean`

  `matchesKey(String name)`

  `void`

  `reset()`

  `void`

  `set(float value)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### defaultValue

    private final float defaultValue
  + ### value

    private float value
* Constructor Details
  -------------------

  + ### PropertyValue

    public PropertyValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float defaultValue)
* Method Details
  --------------

  + ### matchesKey

    public boolean matchesKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### set

    public void set(float value)
  + ### get

    public float get()
  + ### isSet

    public boolean isSet()
  + ### reset

    public void reset()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`