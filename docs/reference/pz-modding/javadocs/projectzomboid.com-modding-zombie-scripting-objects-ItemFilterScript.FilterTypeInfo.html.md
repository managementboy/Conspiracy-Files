[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ItemFilterScript](ItemFilterScript.html)
3. [FilterTypeInfo](ItemFilterScript.FilterTypeInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [loadedItems](#loadedItems)
   2. [loadedTypes](#loadedTypes)
   3. [items](#items)
   4. [itemTypes](#itemTypes)
   5. [tags](#tags)
6. [Constructor Details](#constructor-detail)
   1. [FilterTypeInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [hasEntries()](#hasEntries())
   3. [containsItem(InventoryItem)](#containsItem(zombie.inventory.InventoryItem))
   4. [containsItem(Item)](#containsItem(zombie.scripting.objects.Item))
   5. [containsItem(String, ItemType, Set)](#containsItem(java.lang.String,zombie.scripting.objects.ItemType,java.util.Set))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemFilterScript.FilterTypeInfo
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.ItemFilterScript.FilterTypeInfo

Enclosing class:
:   `ItemFilterScript`

---

private static class ItemFilterScript.FilterTypeInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<String>`

  `items`

  `private final ArrayList<ItemType>`

  `itemTypes`

  `private final ArrayList<String>`

  `loadedItems`

  `private final ArrayList<String>`

  `loadedTypes`

  `private final ArrayList<String>`

  `tags`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FilterTypeInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `containsItem(String itemFullType,
  ItemType itemType,
  Set<ItemTag> itemTags)`

  `private boolean`

  `containsItem(InventoryItem item)`

  `private boolean`

  `containsItem(Item item)`

  `private boolean`

  `hasEntries()`

  `private void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### loadedItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadedItems
  + ### loadedTypes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadedTypes
  + ### items

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items
  + ### itemTypes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemType](ItemType.html "class in zombie.scripting.objects")> itemTypes
  + ### tags

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tags
* Constructor Details
  -------------------

  + ### FilterTypeInfo

    private FilterTypeInfo()
* Method Details
  --------------

  + ### reset

    private void reset()
  + ### hasEntries

    private boolean hasEntries()
  + ### containsItem

    private boolean containsItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### containsItem

    private boolean containsItem([Item](Item.html "class in zombie.scripting.objects") item)
  + ### containsItem

    private boolean containsItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemFullType,
    [ItemType](ItemType.html "class in zombie.scripting.objects") itemType,
    [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[ItemTag](ItemTag.html "class in zombie.scripting.objects")> itemTags)