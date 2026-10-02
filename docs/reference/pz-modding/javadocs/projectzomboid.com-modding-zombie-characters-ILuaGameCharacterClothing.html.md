[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [ILuaGameCharacterClothing](ILuaGameCharacterClothing.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [dressInNamedOutfit(String)](#dressInNamedOutfit(java.lang.String))
   2. [dressInPersistentOutfit(String)](#dressInPersistentOutfit(java.lang.String))
   3. [dressInPersistentOutfitID(int)](#dressInPersistentOutfitID(int))
   4. [getOutfitName()](#getOutfitName())
   5. [getWornItems()](#getWornItems())
   6. [setWornItems(WornItems)](#setWornItems(zombie.characters.WornItems.WornItems))
   7. [getWornItem(ItemBodyLocation)](#getWornItem(zombie.scripting.objects.ItemBodyLocation))
   8. [setWornItem(ItemBodyLocation, InventoryItem)](#setWornItem(zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
   9. [removeWornItem(InventoryItem)](#removeWornItem(zombie.inventory.InventoryItem))
   10. [removeWornItem(InventoryItem, boolean)](#removeWornItem(zombie.inventory.InventoryItem,boolean))
   11. [clearWornItems()](#clearWornItems())
   12. [getBodyLocationGroup()](#getBodyLocationGroup())
   13. [setClothingItem\_Head(InventoryItem)](#setClothingItem_Head(zombie.inventory.InventoryItem))
   14. [setClothingItem\_Torso(InventoryItem)](#setClothingItem_Torso(zombie.inventory.InventoryItem))
   15. [setClothingItem\_Back(InventoryItem)](#setClothingItem_Back(zombie.inventory.InventoryItem))
   16. [setClothingItem\_Hands(InventoryItem)](#setClothingItem_Hands(zombie.inventory.InventoryItem))
   17. [setClothingItem\_Legs(InventoryItem)](#setClothingItem_Legs(zombie.inventory.InventoryItem))
   18. [setClothingItem\_Feet(InventoryItem)](#setClothingItem_Feet(zombie.inventory.InventoryItem))
   19. [Dressup(SurvivorDesc)](#Dressup(zombie.characters.SurvivorDesc))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface ILuaGameCharacterClothing
===================================

All Known Implementing Classes:
:   `IsoAnimal, IsoDummyCameraCharacter, IsoGameCharacter, zombie.characters.IsoLivingCharacter, IsoLuaMover, IsoPlayer, IsoSurvivor, IsoZombie, RandomizedBuildingBase.HumanCorpse`

---

public interface ILuaGameCharacterClothing

ILuaGameCharacterClothing
Provides the functions expected by LUA when dealing with objects of this type.

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `void`

  `clearWornItems()`

  `void`

  `dressInNamedOutfit(String outfitName)`

  `void`

  `dressInPersistentOutfit(String outfitName)`

  `void`

  `dressInPersistentOutfitID(int outfitID)`

  `void`

  `Dressup(SurvivorDesc desc)`

  `BodyLocationGroup`

  `getBodyLocationGroup()`

  `String`

  `getOutfitName()`

  `InventoryItem`

  `getWornItem(ItemBodyLocation location)`

  `WornItems`

  `getWornItems()`

  `void`

  `removeWornItem(InventoryItem item)`

  `void`

  `removeWornItem(InventoryItem item,
  boolean forceDropTooHeavy)`

  `void`

  `setClothingItem_Back(InventoryItem item)`

  `void`

  `setClothingItem_Feet(InventoryItem item)`

  `void`

  `setClothingItem_Hands(InventoryItem item)`

  `void`

  `setClothingItem_Head(InventoryItem item)`

  `void`

  `setClothingItem_Legs(InventoryItem item)`

  `void`

  `setClothingItem_Torso(InventoryItem item)`

  `void`

  `setWornItem(ItemBodyLocation location,
  InventoryItem item)`

  `void`

  `setWornItems(WornItems other)`

* Method Details
  --------------

  + ### dressInNamedOutfit

    void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)
  + ### dressInPersistentOutfit

    void dressInPersistentOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)
  + ### dressInPersistentOutfitID

    void dressInPersistentOutfitID(int outfitID)
  + ### getOutfitName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutfitName()
  + ### getWornItems

    [WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") getWornItems()
  + ### setWornItems

    void setWornItems([WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") other)
  + ### getWornItem

    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location)
  + ### setWornItem

    void setWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") location,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### removeWornItem

    void removeWornItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### removeWornItem

    void removeWornItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean forceDropTooHeavy)
  + ### clearWornItems

    void clearWornItems()
  + ### getBodyLocationGroup

    [BodyLocationGroup](WornItems/BodyLocationGroup.html "class in zombie.characters.WornItems") getBodyLocationGroup()
  + ### setClothingItem\_Head

    void setClothingItem\_Head([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setClothingItem\_Torso

    void setClothingItem\_Torso([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setClothingItem\_Back

    void setClothingItem\_Back([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setClothingItem\_Hands

    void setClothingItem\_Hands([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setClothingItem\_Legs

    void setClothingItem\_Legs([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setClothingItem\_Feet

    void setClothingItem\_Feet([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### Dressup

    void Dressup([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc)