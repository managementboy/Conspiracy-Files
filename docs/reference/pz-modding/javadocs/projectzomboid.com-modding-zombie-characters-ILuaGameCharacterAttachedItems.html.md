[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [ILuaGameCharacterAttachedItems](ILuaGameCharacterAttachedItems.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [getAttachedItems()](#getAttachedItems())
   2. [setAttachedItems(AttachedItems)](#setAttachedItems(zombie.characters.AttachedItems.AttachedItems))
   3. [getAttachedItem(String)](#getAttachedItem(java.lang.String))
   4. [setAttachedItem(String, InventoryItem)](#setAttachedItem(java.lang.String,zombie.inventory.InventoryItem))
   5. [removeAttachedItem(InventoryItem)](#removeAttachedItem(zombie.inventory.InventoryItem))
   6. [clearAttachedItems()](#clearAttachedItems())
   7. [getAttachedLocationGroup()](#getAttachedLocationGroup())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface ILuaGameCharacterAttachedItems
========================================

All Known Implementing Classes:
:   `IsoAnimal, IsoDummyCameraCharacter, IsoGameCharacter, zombie.characters.IsoLivingCharacter, IsoLuaMover, IsoPlayer, IsoSurvivor, IsoZombie, RandomizedBuildingBase.HumanCorpse`

---

public interface ILuaGameCharacterAttachedItems

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `void`

  `clearAttachedItems()`

  `InventoryItem`

  `getAttachedItem(String location)`

  `AttachedItems`

  `getAttachedItems()`

  `AttachedLocationGroup`

  `getAttachedLocationGroup()`

  `void`

  `removeAttachedItem(InventoryItem item)`

  `void`

  `setAttachedItem(String location,
  InventoryItem item)`

  `void`

  `setAttachedItems(AttachedItems other)`

* Method Details
  --------------

  + ### getAttachedItems

    [AttachedItems](AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") getAttachedItems()
  + ### setAttachedItems

    void setAttachedItems([AttachedItems](AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") other)
  + ### getAttachedItem

    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getAttachedItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location)
  + ### setAttachedItem

    void setAttachedItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### removeAttachedItem

    void removeAttachedItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### clearAttachedItems

    void clearAttachedItems()
  + ### getAttachedLocationGroup

    [AttachedLocationGroup](AttachedItems/AttachedLocationGroup.html "class in zombie.characters.AttachedItems") getAttachedLocationGroup()