[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.AttachedItems](package-summary.html)
2. [AttachedLocations](AttachedLocations.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [groups](#groups)
6. [Constructor Details](#constructor-detail)
   1. [AttachedLocations()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getGroup(String)](#getGroup(java.lang.String))
   2. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AttachedLocations
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.AttachedItems.AttachedLocations

---

public final class AttachedLocations
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected static final ArrayList<AttachedLocationGroup>`

  `groups`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AttachedLocations()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AttachedLocationGroup`

  `getGroup(String id)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### groups

    protected static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AttachedLocationGroup](AttachedLocationGroup.html "class in zombie.characters.AttachedItems")> groups
* Constructor Details
  -------------------

  + ### AttachedLocations

    public AttachedLocations()
* Method Details
  --------------

  + ### getGroup

    public static [AttachedLocationGroup](AttachedLocationGroup.html "class in zombie.characters.AttachedItems") getGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### Reset

    public static void Reset()