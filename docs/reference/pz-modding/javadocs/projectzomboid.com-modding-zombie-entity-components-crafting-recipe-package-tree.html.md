[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#tree)

1. [zombie.entity.components.crafting.recipe](package-summary.html)

Hierarchy For Package zombie.entity.components.crafting.recipe
==============================================================

Package Hierarchies:

* [All Packages](../../../../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.entity.components.crafting.[BaseCraftingLogic](../BaseCraftingLogic.html "class in zombie.entity.components.crafting")
    - zombie.entity.components.crafting.recipe.[HandcraftLogic](HandcraftLogic.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe")
    - zombie.entity.components.crafting.recipe.[CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe")
    - zombie.entity.components.crafting.recipe.[CraftRecipeData.OutputScriptData](CraftRecipeData.OutputScriptData.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeListNodeCollection](CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeListNodeCollection.RecipeNodeComparator](CraftRecipeListNodeCollection.RecipeNodeComparator.html "class in zombie.entity.components.crafting.recipe") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.entity.components.crafting.recipe.[CraftRecipeManager](CraftRecipeManager.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeManager.CraftRecipeListProvider](CraftRecipeManager.CraftRecipeListProvider.html "class in zombie.entity.components.crafting.recipe") (implements zombie.util.TaggedObjectManager.BackingListProvider<T>)
  + zombie.entity.components.crafting.recipe.[CraftRecipeSort](CraftRecipeSort.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[CraftRecipeSort.ValidCanPerformRecipeComparator](CraftRecipeSort.ValidCanPerformRecipeComparator.html "class in zombie.entity.components.crafting.recipe") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.entity.components.crafting.recipe.[CraftRecipeSort.ValidRecipeComparator](CraftRecipeSort.ValidRecipeComparator.html "class in zombie.entity.components.crafting.recipe") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.entity.components.crafting.recipe.[HandcraftLogic.CachedRecipeInfo](HandcraftLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[InputItemNode](InputItemNode.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[ItemDataList](ItemDataList.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[ItemDataList.ItemData](ItemDataList.ItemData.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[OutputMapper](OutputMapper.html "class in zombie.entity.components.crafting.recipe")
  + zombie.entity.components.crafting.recipe.[OutputMapper.OutputEntree](OutputMapper.OutputEntree.html "class in zombie.entity.components.crafting.recipe")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.entity.components.crafting.recipe.[CraftRecipeListNode.CraftRecipeListNodeExpandedState](CraftRecipeListNode.CraftRecipeListNodeExpandedState.html "enum class in zombie.entity.components.crafting.recipe")
    - zombie.entity.components.crafting.recipe.[CraftRecipeListNode.CraftRecipeListNodeType](CraftRecipeListNode.CraftRecipeListNodeType.html "enum class in zombie.entity.components.crafting.recipe")
    - zombie.entity.components.crafting.recipe.[CraftRecipeManager.FilterMode](CraftRecipeManager.FilterMode.html "enum class in zombie.entity.components.crafting.recipe")