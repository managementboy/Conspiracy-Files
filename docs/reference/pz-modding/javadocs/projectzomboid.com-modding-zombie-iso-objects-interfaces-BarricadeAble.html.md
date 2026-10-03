[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.objects.interfaces](package-summary.html)
2. [BarricadeAble](BarricadeAble.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [isBarricaded()](#isBarricaded())
   2. [isBarricadeAllowed()](#isBarricadeAllowed())
   3. [getBarricadeOnSameSquare()](#getBarricadeOnSameSquare())
   4. [getBarricadeOnOppositeSquare()](#getBarricadeOnOppositeSquare())
   5. [getBarricadeForCharacter(IsoGameCharacter)](#getBarricadeForCharacter(zombie.characters.IsoGameCharacter))
   6. [getBarricadeOppositeCharacter(IsoGameCharacter)](#getBarricadeOppositeCharacter(zombie.characters.IsoGameCharacter))
   7. [getSquare()](#getSquare())
   8. [getOppositeSquare()](#getOppositeSquare())
   9. [getNorth()](#getNorth())
   10. [addBarricadesFromCraftRecipe(IsoGameCharacter, ArrayList, CraftRecipeData, boolean)](#addBarricadesFromCraftRecipe(zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.entity.components.crafting.recipe.CraftRecipeData,boolean))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Interface BarricadeAble
=======================

All Known Implementing Classes:
:   `IsoDoor, IsoThumpable, IsoWindow, IsoWindowFrame`

---

public interface BarricadeAble

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsDefault Methods

  Modifier and Type

  Method

  Description

  `default IsoBarricade`

  `addBarricadesFromCraftRecipe(IsoGameCharacter chr,
  ArrayList<InventoryItem> items,
  CraftRecipeData craftRecipeData,
  boolean opposite)`

  `IsoBarricade`

  `getBarricadeForCharacter(IsoGameCharacter chr)`

  `IsoBarricade`

  `getBarricadeOnOppositeSquare()`

  `IsoBarricade`

  `getBarricadeOnSameSquare()`

  `IsoBarricade`

  `getBarricadeOppositeCharacter(IsoGameCharacter chr)`

  `boolean`

  `getNorth()`

  `IsoGridSquare`

  `getOppositeSquare()`

  `IsoGridSquare`

  `getSquare()`

  `boolean`

  `isBarricadeAllowed()`

  `boolean`

  `isBarricaded()`

* Method Details
  --------------

  + ### isBarricaded

    boolean isBarricaded()
  + ### isBarricadeAllowed

    boolean isBarricadeAllowed()
  + ### getBarricadeOnSameSquare

    [IsoBarricade](../IsoBarricade.html "class in zombie.iso.objects") getBarricadeOnSameSquare()
  + ### getBarricadeOnOppositeSquare

    [IsoBarricade](../IsoBarricade.html "class in zombie.iso.objects") getBarricadeOnOppositeSquare()
  + ### getBarricadeForCharacter

    [IsoBarricade](../IsoBarricade.html "class in zombie.iso.objects") getBarricadeForCharacter([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getBarricadeOppositeCharacter

    [IsoBarricade](../IsoBarricade.html "class in zombie.iso.objects") getBarricadeOppositeCharacter([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getSquare

    [IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### getOppositeSquare

    [IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") getOppositeSquare()
  + ### getNorth

    boolean getNorth()
  + ### addBarricadesFromCraftRecipe

    default [IsoBarricade](../IsoBarricade.html "class in zombie.iso.objects") addBarricadesFromCraftRecipe([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> items,
    [CraftRecipeData](../../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData,
    boolean opposite)