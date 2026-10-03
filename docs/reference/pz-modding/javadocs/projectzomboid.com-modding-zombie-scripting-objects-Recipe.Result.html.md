[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Recipe](Recipe.html)
3. [Result](Recipe.Result.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [module](#module)
   2. [type](#type)
   3. [count](#count)
   4. [drainableCount](#drainableCount)
6. [Constructor Details](#constructor-detail)
   1. [Result()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [setType(String)](#setType(java.lang.String))
   3. [getCount()](#getCount())
   4. [setCount(int)](#setCount(int))
   5. [getModule()](#getModule())
   6. [setModule(String)](#setModule(java.lang.String))
   7. [getFullType()](#getFullType())
   8. [getDrainableCount()](#getDrainableCount())
   9. [setDrainableCount(int)](#setDrainableCount(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Recipe.Result
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Recipe.Result

Enclosing class:
:   `Recipe`

---

public static final class Recipe.Result
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `count`

  `int`

  `drainableCount`

  `String`

  `module`

  `String`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Result()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getCount()`

  `int`

  `getDrainableCount()`

  `String`

  `getFullType()`

  `String`

  `getModule()`

  `String`

  `getType()`

  `void`

  `setCount(int count)`

  `void`

  `setDrainableCount(int count)`

  `void`

  `setModule(String module)`

  `void`

  `setType(String type)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### module

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### count

    public int count
  + ### drainableCount

    public int drainableCount
* Constructor Details
  -------------------

  + ### Result

    public Result()
* Method Details
  --------------

  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### setType

    public void setType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getCount

    public int getCount()
  + ### setCount

    public void setCount(int count)
  + ### getModule

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModule()
  + ### setModule

    public void setModule([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") module)
  + ### getFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullType()
  + ### getDrainableCount

    public int getDrainableCount()
  + ### setDrainableCount

    public void setDrainableCount(int count)