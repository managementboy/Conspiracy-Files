[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.WornItems](package-summary.html)
2. [BodyLocations](BodyLocations.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [groups](#groups)
6. [Constructor Details](#constructor-detail)
   1. [BodyLocations()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getGroup(String)](#getGroup(java.lang.String))
   2. [reset()](#reset())
   3. [getAllGroups()](#getAllGroups())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BodyLocations
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.WornItems.BodyLocations

---

public final class BodyLocations
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final List<BodyLocationGroup>`

  `groups`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BodyLocations()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static List<BodyLocationGroup>`

  `getAllGroups()`

  `static BodyLocationGroup`

  `getGroup(String id)`

  `static void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### groups

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems")> groups
* Constructor Details
  -------------------

  + ### BodyLocations

    public BodyLocations()
* Method Details
  --------------

  + ### getGroup

    public static [BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems") getGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### reset

    public static void reset()
  + ### getAllGroups

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems")> getAllGroups()