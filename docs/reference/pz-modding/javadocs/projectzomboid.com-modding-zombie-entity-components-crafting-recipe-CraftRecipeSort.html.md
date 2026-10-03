[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeSort](CraftRecipeSort.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [alphaNumComparator](#alphaNumComparator)
7. [Constructor Details](#constructor-detail)
   1. [CraftRecipeSort()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [alphaNumeric(List)](#alphaNumeric(java.util.List))
   2. [validRecipes(List, IsoGameCharacter)](#validRecipes(java.util.List,zombie.characters.IsoGameCharacter))
   3. [canPerformAndValidRecipes(List, IsoGameCharacter, ArrayList, ArrayList, ArrayList)](#canPerformAndValidRecipes(java.util.List,zombie.characters.IsoGameCharacter,java.util.ArrayList,java.util.ArrayList,java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeSort
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeSort

---

public class CraftRecipeSort
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CraftRecipeSort.ValidCanPerformRecipeComparator`

  sort order: Valid Recipes, CanPerform Recipe, AlphaNumeric

  `static class`

  `CraftRecipeSort.ValidRecipeComparator`

  sort order: ValidRecipes, AlphaNumeric
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Comparator<CraftRecipe>`

  `alphaNumComparator`

  sort order: AlphaNumeric
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftRecipeSort()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static List<CraftRecipe>`

  `alphaNumeric(List<CraftRecipe> listToSort)`

  `static List<CraftRecipe>`

  `canPerformAndValidRecipes(List<CraftRecipe> listToSort,
  IsoGameCharacter character,
  ArrayList<Resource> sourceResources,
  ArrayList<InventoryItem> sourceItems,
  ArrayList<ItemContainer> containers)`

  Note: fairly expensive sort added for UI
  in this case all recipes in passed list need to be tested if character can perform them prior to sorting

  `static List<CraftRecipe>`

  `validRecipes(List<CraftRecipe> listToSort,
  IsoGameCharacter character)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### alphaNumComparator

    private static final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> alphaNumComparator

    sort order: AlphaNumeric
* Constructor Details
  -------------------

  + ### CraftRecipeSort

    public CraftRecipeSort()
* Method Details
  --------------

  + ### alphaNumeric

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> alphaNumeric([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToSort)
  + ### validRecipes

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> validRecipes([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToSort,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### canPerformAndValidRecipes

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> canPerformAndValidRecipes([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToSort,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> sourceResources,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> sourceItems,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)

    Note: fairly expensive sort added for UI
    in this case all recipes in passed list need to be tested if character can perform them prior to sorting