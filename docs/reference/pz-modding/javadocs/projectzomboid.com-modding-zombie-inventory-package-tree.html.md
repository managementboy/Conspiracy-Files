[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#tree)

1. [zombie.inventory](package-summary.html)

Hierarchy For Package zombie.inventory
======================================

Package Hierarchies:

* [All Packages](../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.util.[AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html "class or interface in java.util")<E> (implements java.util.[Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<E>)
    - java.util.[AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<E> (implements java.util.[List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<E>)
      * java.util.[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<E> (implements java.lang.[Cloneable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Cloneable.html "class or interface in java.lang"), java.util.[List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<E>, java.util.[RandomAccess](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/RandomAccess.html "class or interface in java.util"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
        + zombie.inventory.[ItemContainer.InventoryItemList](ItemContainer.InventoryItemList.html "class in zombie.inventory")
  + zombie.inventory.[FixingManager](FixingManager.html "class in zombie.inventory")
  + zombie.entity.[GameEntity](../entity/GameEntity.html "class in zombie.entity")
    - zombie.inventory.[InventoryItem](InventoryItem.html "class in zombie.inventory")
  + zombie.inventory.[ItemContainer](ItemContainer.html "class in zombie.inventory")
  + zombie.inventory.[ItemContainer.CategoryPredicate](ItemContainer.CategoryPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.Comparators](ItemContainer.Comparators.html "class in zombie.inventory")
  + zombie.inventory.[ItemContainer.ConditionComparator](ItemContainer.ConditionComparator.html "class in zombie.inventory") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.inventory.[ItemContainer.EvalArgComparator](ItemContainer.EvalArgComparator.html "class in zombie.inventory") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.inventory.[ItemContainer.EvalArgPredicate](ItemContainer.EvalArgPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.EvalComparator](ItemContainer.EvalComparator.html "class in zombie.inventory") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.inventory.[ItemContainer.EvalPredicate](ItemContainer.EvalPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.Predicates](ItemContainer.Predicates.html "class in zombie.inventory")
  + zombie.inventory.[ItemContainer.TagEvalArgPredicate](ItemContainer.TagEvalArgPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.TagEvalPredicate](ItemContainer.TagEvalPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.TagPredicate](ItemContainer.TagPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.TypeEvalArgPredicate](ItemContainer.TypeEvalArgPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.TypeEvalPredicate](ItemContainer.TypeEvalPredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemContainer.TypePredicate](ItemContainer.TypePredicate.html "class in zombie.inventory") (implements java.util.function.[Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<T>)
  + zombie.inventory.[ItemPickerJava](ItemPickerJava.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.ItemPickerItem](ItemPickerJava.ItemPickerItem.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.ItemPickerUpgradeWeapons](ItemPickerJava.ItemPickerUpgradeWeapons.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.KeyNamer](ItemPickerJava.KeyNamer.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.ProceduralItem](ItemPickerJava.ProceduralItem.html "class in zombie.inventory")
  + zombie.inventory.[ItemPickerJava.VehicleDistribution](ItemPickerJava.VehicleDistribution.html "class in zombie.inventory")
  + zombie.inventory.[ItemSoundManager](ItemSoundManager.html "class in zombie.inventory")
  + zombie.inventory.[ItemSpawner](ItemSpawner.html "class in zombie.inventory")
  + zombie.network.statistics.counters.ObjectPoolCounter
    - zombie.popman.ObjectPool<T>
      * zombie.inventory.[ItemContainer.InventoryItemListPool](ItemContainer.InventoryItemListPool.html "class in zombie.inventory")
  + zombie.inventory.[RecipeManager](RecipeManager.html "class in zombie.inventory")