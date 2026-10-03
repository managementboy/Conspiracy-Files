[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.AttachedItems](package-summary.html)
2. [AttachedItems](AttachedItems.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [group](#group)
   2. [items](#items)
6. [Constructor Details](#constructor-detail)
   1. [AttachedItems(AttachedLocationGroup)](#%3Cinit%3E(zombie.characters.AttachedItems.AttachedLocationGroup))
   2. [AttachedItems(AttachedItems)](#%3Cinit%3E(zombie.characters.AttachedItems.AttachedItems))
7. [Method Details](#method-detail)
   1. [copyFrom(AttachedItems)](#copyFrom(zombie.characters.AttachedItems.AttachedItems))
   2. [getGroup()](#getGroup())
   3. [get(int)](#get(int))
   4. [setItem(String, InventoryItem)](#setItem(java.lang.String,zombie.inventory.InventoryItem))
   5. [getItem(String)](#getItem(java.lang.String))
   6. [getItemByIndex(int)](#getItemByIndex(int))
   7. [remove(InventoryItem)](#remove(zombie.inventory.InventoryItem))
   8. [clear()](#clear())
   9. [getLocation(InventoryItem)](#getLocation(zombie.inventory.InventoryItem))
   10. [contains(InventoryItem)](#contains(zombie.inventory.InventoryItem))
   11. [size()](#size())
   12. [isEmpty()](#isEmpty())
   13. [forEach(Consumer)](#forEach(java.util.function.Consumer))
   14. [indexOf(String)](#indexOf(java.lang.String))
   15. [indexOf(InventoryItem)](#indexOf(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AttachedItems
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.AttachedItems.AttachedItems

---

public final class AttachedItems
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final AttachedLocationGroup`

  `group`

  `protected final ArrayList<AttachedItem>`

  `items`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AttachedItems(AttachedItems other)`

  `AttachedItems(AttachedLocationGroup group)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clear()`

  `boolean`

  `contains(InventoryItem item)`

  `void`

  `copyFrom(AttachedItems other)`

  `void`

  `forEach(Consumer<AttachedItem> c)`

  `AttachedItem`

  `get(int index)`

  `AttachedLocationGroup`

  `getGroup()`

  `InventoryItem`

  `getItem(String location)`

  `InventoryItem`

  `getItemByIndex(int index)`

  `String`

  `getLocation(InventoryItem item)`

  `private int`

  `indexOf(String location)`

  `private int`

  `indexOf(InventoryItem item)`

  `boolean`

  `isEmpty()`

  `void`

  `remove(InventoryItem item)`

  `void`

  `setItem(String location,
  InventoryItem item)`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### group

    protected final [AttachedLocationGroup](AttachedLocationGroup.html "class in zombie.characters.AttachedItems") group
  + ### items

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AttachedItem](AttachedItem.html "class in zombie.characters.AttachedItems")> items
* Constructor Details
  -------------------

  + ### AttachedItems

    public AttachedItems([AttachedLocationGroup](AttachedLocationGroup.html "class in zombie.characters.AttachedItems") group)
  + ### AttachedItems

    public AttachedItems([AttachedItems](AttachedItems.html "class in zombie.characters.AttachedItems") other)
* Method Details
  --------------

  + ### copyFrom

    public void copyFrom([AttachedItems](AttachedItems.html "class in zombie.characters.AttachedItems") other)
  + ### getGroup

    public [AttachedLocationGroup](AttachedLocationGroup.html "class in zombie.characters.AttachedItems") getGroup()
  + ### get

    public [AttachedItem](AttachedItem.html "class in zombie.characters.AttachedItems") get(int index)
  + ### setItem

    public void setItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### getItemByIndex

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItemByIndex(int index)
  + ### remove

    public void remove([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### clear

    public void clear()
  + ### getLocation

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLocation([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### contains

    public boolean contains([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### size

    public int size()
  + ### isEmpty

    public boolean isEmpty()
  + ### forEach

    public void forEach([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[AttachedItem](AttachedItem.html "class in zombie.characters.AttachedItems")> c)
  + ### indexOf

    private int indexOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### indexOf

    private int indexOf([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)