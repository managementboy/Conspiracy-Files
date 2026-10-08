[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [LuaManager](LuaManager.html)
3. [GlobalObject](LuaManager.GlobalObject.html)
4. [TimSortComparator](LuaManager.GlobalObject.TimSortComparator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [comp](#comp)
6. [Constructor Details](#constructor-detail)
   1. [TimSortComparator()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [compare(Object, Object)](#compare(java.lang.Object,java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager.GlobalObject.TimSortComparator
===============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaManager.GlobalObject.TimSortComparator

All Implemented Interfaces:
:   `Comparator<Object>`

Enclosing class:
:   `LuaManager.GlobalObject`

---

private static final class LuaManager.GlobalObject.TimSortComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) Object`

  `comp`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TimSortComparator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(Object c1,
  Object c2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Field Details
  -------------

  + ### comp

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") comp
* Constructor Details
  -------------------

  + ### TimSortComparator

    private TimSortComparator()
* Method Details
  --------------

  + ### compare

    public int compare([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") c1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") c2)

    Specified by:
    :   `compare` in interface `Comparator<Object>`