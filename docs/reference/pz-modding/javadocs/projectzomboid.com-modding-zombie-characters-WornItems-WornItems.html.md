[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.WornItems](package-summary.html)
2. [WornItems](WornItems.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [group](#group)
   2. [items](#items)
6. [Constructor Details](#constructor-detail)
   1. [WornItems(BodyLocationGroup)](#%3Cinit%3E(zombie.characters.WornItems.BodyLocationGroup))
   2. [WornItems(WornItems)](#%3Cinit%3E(zombie.characters.WornItems.WornItems))
7. [Method Details](#method-detail)
   1. [copyFrom(WornItems)](#copyFrom(zombie.characters.WornItems.WornItems))
   2. [getBodyLocationGroup()](#getBodyLocationGroup())
   3. [get(int)](#get(int))
   4. [setItem(ItemBodyLocation, InventoryItem)](#setItem(zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
   5. [getItem(ItemBodyLocation)](#getItem(zombie.scripting.objects.ItemBodyLocation))
   6. [getItemById(int)](#getItemById(int))
   7. [getItemByIndex(int)](#getItemByIndex(int))
   8. [remove(InventoryItem)](#remove(zombie.inventory.InventoryItem))
   9. [clear()](#clear())
   10. [getLocation(InventoryItem)](#getLocation(zombie.inventory.InventoryItem))
   11. [contains(InventoryItem)](#contains(zombie.inventory.InventoryItem))
   12. [size()](#size())
   13. [isEmpty()](#isEmpty())
   14. [forEach(Consumer)](#forEach(java.util.function.Consumer))
   15. [setFromItemVisuals(ItemVisuals)](#setFromItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   16. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   17. [addItemsToItemContainer(ItemContainer)](#addItemsToItemContainer(zombie.inventory.ItemContainer))
   18. [indexOf(ItemBodyLocation)](#indexOf(zombie.scripting.objects.ItemBodyLocation))
   19. [indexOf(int)](#indexOf(int))
   20. [indexOf(InventoryItem)](#indexOf(zombie.inventory.InventoryItem))
   21. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   22. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   23. [getItems()](#getItems())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WornItems
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.WornItems.WornItems

---

public final class WornItems
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final BodyLocationGroup`

  `group`

  `private final List<WornItem>`

  `items`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WornItems(BodyLocationGroup group)`

  `WornItems(WornItems other)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addItemsToItemContainer(ItemContainer container)`

  `void`

  `clear()`

  `boolean`

  `contains(InventoryItem item)`

  `void`

  `copyFrom(WornItems other)`

  `void`

  `forEach(Consumer<WornItem> c)`

  `WornItem`

  `get(int index)`

  `BodyLocationGroup`

  `getBodyLocationGroup()`

  `InventoryItem`

  `getItem(ItemBodyLocation location)`

  `InventoryItem`

  `getItemById(int id)`

  `InventoryItem`

  `getItemByIndex(int index)`

  `List<WornItem>`

  `getItems()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `ItemBodyLocation`

  `getLocation(InventoryItem item)`

  `private int`

  `indexOf(int id)`

  `private int`

  `indexOf(InventoryItem item)`

  `private int`

  `indexOf(ItemBodyLocation location)`

  `boolean`

  `isEmpty()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `remove(InventoryItem item)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setFromItemVisuals(ItemVisuals itemVisuals)`

  `void`

  `setItem(ItemBodyLocation location,
  InventoryItem item)`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### group

    private final [BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems") group
  + ### items

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WornItem](WornItem.html "class in zombie.characters.WornItems")> items
* Constructor Details
  -------------------

  + ### WornItems

    public WornItems([BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems") group)
  + ### WornItems

    public WornItems([WornItems](WornItems.html "class in zombie.characters.WornItems") other)
* Method Details
  --------------

  + ### copyFrom

    public void copyFrom([WornItems](WornItems.html "class in zombie.characters.WornItems") other)
  + ### getBodyLocationGroup

    public [BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems") getBodyLocationGroup()
  + ### get

    public [WornItem](WornItem.html "class in zombie.characters.WornItems") get(int index)
  + ### setItem

    public void setItem([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location)
  + ### getItemById

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItemById(int id)
  + ### getItemByIndex

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItemByIndex(int index)
  + ### remove

    public void remove([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### clear

    public void clear()
  + ### getLocation

    public [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") getLocation([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### contains

    public boolean contains([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### size

    public int size()
  + ### isEmpty

    public boolean isEmpty()
  + ### forEach

    public void forEach([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[WornItem](WornItem.html "class in zombie.characters.WornItems")> c)
  + ### setFromItemVisuals

    public void setFromItemVisuals([ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### addItemsToItemContainer

    public void addItemsToItemContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### indexOf

    private int indexOf([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location)
  + ### indexOf

    private int indexOf(int id)
  + ### indexOf

    private int indexOf([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WornItem](WornItem.html "class in zombie.characters.WornItems")> getItems()