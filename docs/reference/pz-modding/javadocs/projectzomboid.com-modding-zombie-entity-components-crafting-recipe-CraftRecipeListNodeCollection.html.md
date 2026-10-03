[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeListNodeCollection](CraftRecipeListNodeCollection.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [nodes](#nodes)
   2. [groupNodes](#groupNodes)
7. [Constructor Details](#constructor-detail)
   1. [CraftRecipeListNodeCollection()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getNodes()](#getNodes())
   2. [add(CraftRecipe)](#add(zombie.scripting.entity.components.crafting.CraftRecipe))
   3. [addAll(List)](#addAll(java.util.List))
   4. [setInitialExpandedStates(BaseCraftingLogic, boolean)](#setInitialExpandedStates(zombie.entity.components.crafting.BaseCraftingLogic,boolean))
   5. [setInitialExpandedStates(BaseCraftingLogic, boolean, CraftRecipeListNode, List)](#setInitialExpandedStates(zombie.entity.components.crafting.BaseCraftingLogic,boolean,zombie.entity.components.crafting.recipe.CraftRecipeListNode,java.util.List))
   6. [clear()](#clear())
   7. [contains(CraftRecipe)](#contains(zombie.scripting.entity.components.crafting.CraftRecipe))
   8. [collectionContains(CraftRecipe, List)](#collectionContains(zombie.scripting.entity.components.crafting.CraftRecipe,java.util.List))
   9. [isEmpty()](#isEmpty())
   10. [removeIf(Predicate)](#removeIf(java.util.function.Predicate))
   11. [removeIf(Predicate, List)](#removeIf(java.util.function.Predicate,java.util.List))
   12. [sort(Comparator)](#sort(java.util.Comparator))
   13. [getFirstRecipe()](#getFirstRecipe())
   14. [getFirstRecipe(List)](#getFirstRecipe(java.util.List))
   15. [getAllRecipes()](#getAllRecipes())
   16. [getRecipesFromCollection(List)](#getRecipesFromCollection(java.util.List))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeListNodeCollection
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeListNodeCollection

---

public class CraftRecipeListNodeCollection
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `CraftRecipeListNodeCollection.RecipeNodeComparator`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<CraftRecipeGroup, CraftRecipeListNode>`

  `groupNodes`

  `private final List<CraftRecipeListNode>`

  `nodes`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftRecipeListNodeCollection()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(CraftRecipe recipe)`

  `void`

  `addAll(List<CraftRecipe> recipeList)`

  `void`

  `clear()`

  `private boolean`

  `collectionContains(CraftRecipe recipe,
  List<CraftRecipeListNode> collection)`

  `boolean`

  `contains(CraftRecipe recipe)`

  `List<CraftRecipe>`

  `getAllRecipes()`

  `CraftRecipe`

  `getFirstRecipe()`

  `private CraftRecipe`

  `getFirstRecipe(List<CraftRecipeListNode> collection)`

  `List<CraftRecipeListNode>`

  `getNodes()`

  `private List<CraftRecipe>`

  `getRecipesFromCollection(List<CraftRecipeListNode> nodes)`

  `boolean`

  `isEmpty()`

  `void`

  `removeIf(Predicate<? super CraftRecipe> filter)`

  `private void`

  `removeIf(Predicate<? super CraftRecipe> filter,
  List<CraftRecipeListNode> collection)`

  `void`

  `setInitialExpandedStates(BaseCraftingLogic logic,
  boolean isBuildCheat)`

  `private void`

  `setInitialExpandedStates(BaseCraftingLogic logic,
  boolean isBuildCheat,
  CraftRecipeListNode groupNode,
  List<CraftRecipeListNode> childNodes)`

  `void`

  `sort(Comparator<? super CraftRecipe> comparator)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### nodes

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> nodes
  + ### groupNodes

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CraftRecipeGroup](../../../../scripting/objects/CraftRecipeGroup.html "enum class in zombie.scripting.objects"), [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> groupNodes
* Constructor Details
  -------------------

  + ### CraftRecipeListNodeCollection

    public CraftRecipeListNodeCollection()
* Method Details
  --------------

  + ### getNodes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> getNodes()
  + ### add

    public void add([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### addAll

    public void addAll([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipeList)
  + ### setInitialExpandedStates

    public void setInitialExpandedStates([BaseCraftingLogic](../BaseCraftingLogic.html "class in zombie.entity.components.crafting") logic,
    boolean isBuildCheat)
  + ### setInitialExpandedStates

    private void setInitialExpandedStates([BaseCraftingLogic](../BaseCraftingLogic.html "class in zombie.entity.components.crafting") logic,
    boolean isBuildCheat,
    [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") groupNode,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> childNodes)
  + ### clear

    public void clear()
  + ### contains

    public boolean contains([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### collectionContains

    private boolean collectionContains([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> collection)
  + ### isEmpty

    public boolean isEmpty()
  + ### removeIf

    public void removeIf([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<? super [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> filter)
  + ### removeIf

    private void removeIf([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<? super [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> filter,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> collection)
  + ### sort

    public void sort([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> comparator)
  + ### getFirstRecipe

    public [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getFirstRecipe()
  + ### getFirstRecipe

    private [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getFirstRecipe([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> collection)
  + ### getAllRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getAllRecipes()
  + ### getRecipesFromCollection

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipesFromCollection([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> nodes)