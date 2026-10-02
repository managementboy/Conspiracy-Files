[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.AttachedItems](package-summary.html)
2. [AttachedLocationGroup](AttachedLocationGroup.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [locations](#locations)
6. [Constructor Details](#constructor-detail)
   1. [AttachedLocationGroup(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getLocation(String)](#getLocation(java.lang.String))
   2. [getOrCreateLocation(String)](#getOrCreateLocation(java.lang.String))
   3. [getLocationByIndex(int)](#getLocationByIndex(int))
   4. [size()](#size())
   5. [indexOf(String)](#indexOf(java.lang.String))
   6. [checkValid(String)](#checkValid(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AttachedLocationGroup
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.AttachedItems.AttachedLocationGroup

---

public final class AttachedLocationGroup
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final String`

  `id`

  `protected final ArrayList<AttachedLocation>`

  `locations`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AttachedLocationGroup(String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `checkValid(String locationId)`

  `AttachedLocation`

  `getLocation(String locationId)`

  `AttachedLocation`

  `getLocationByIndex(int index)`

  `AttachedLocation`

  `getOrCreateLocation(String locationId)`

  `int`

  `indexOf(String locationId)`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### locations

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AttachedLocation](AttachedLocation.html "class in zombie.characters.AttachedItems")> locations
* Constructor Details
  -------------------

  + ### AttachedLocationGroup

    public AttachedLocationGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### getLocation

    public [AttachedLocation](AttachedLocation.html "class in zombie.characters.AttachedItems") getLocation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") locationId)
  + ### getOrCreateLocation

    public [AttachedLocation](AttachedLocation.html "class in zombie.characters.AttachedItems") getOrCreateLocation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") locationId)
  + ### getLocationByIndex

    public [AttachedLocation](AttachedLocation.html "class in zombie.characters.AttachedItems") getLocationByIndex(int index)
  + ### size

    public int size()
  + ### indexOf

    public int indexOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") locationId)
  + ### checkValid

    public void checkValid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") locationId)