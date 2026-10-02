[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemPickerJava](ItemPickerJava.html)
3. [KeyNamer](ItemPickerJava.KeyNamer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [badZones](#badZones)
   2. [bigBuildingRooms](#bigBuildingRooms)
   3. [restaurantSubstrings](#restaurantSubstrings)
   4. [restaurants](#restaurants)
   5. [roomSubstrings](#roomSubstrings)
   6. [rooms](#rooms)
6. [Constructor Details](#constructor-detail)
   1. [KeyNamer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [clear()](#clear())
   2. [nameKey(InventoryItem, IsoGridSquare)](#nameKey(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare))
   3. [getName(IsoGridSquare)](#getName(zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemPickerJava.KeyNamer
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemPickerJava.KeyNamer

Enclosing class:
:   `ItemPickerJava`

---

public static final class ItemPickerJava.KeyNamer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static ArrayList<String>`

  `badZones`

  `static ArrayList<String>`

  `bigBuildingRooms`

  `static ArrayList<String>`

  `restaurants`

  `static ArrayList<String>`

  `restaurantSubstrings`

  `static ArrayList<String>`

  `rooms`

  `static ArrayList<String>`

  `roomSubstrings`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `KeyNamer()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `clear()`

  `static String`

  `getName(IsoGridSquare square)`

  `static void`

  `nameKey(InventoryItem item,
  IsoGridSquare square)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### badZones

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> badZones
  + ### bigBuildingRooms

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bigBuildingRooms
  + ### restaurantSubstrings

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> restaurantSubstrings
  + ### restaurants

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> restaurants
  + ### roomSubstrings

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> roomSubstrings
  + ### rooms

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> rooms
* Constructor Details
  -------------------

  + ### KeyNamer

    public KeyNamer()
* Method Details
  --------------

  + ### clear

    public static void clear()
  + ### nameKey

    public static void nameKey([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)