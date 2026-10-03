[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#tree)

1. [zombie.entity](package-summary.html)

Hierarchy For Package zombie.entity
===================================

Package Hierarchies:

* [All Packages](../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.entity.[Component](Component.html "class in zombie.entity")
  + zombie.entity.[EntityBucket](EntityBucket.html "class in zombie.entity")
    - zombie.entity.[EntityBucket.CustomBucket](EntityBucket.CustomBucket.html "class in zombie.entity")
    - zombie.entity.[EntityBucket.FamilyBucket](EntityBucket.FamilyBucket.html "class in zombie.entity")
    - zombie.entity.[EntityBucket.InventoryItemBucket](EntityBucket.InventoryItemBucket.html "class in zombie.entity")
    - zombie.entity.[EntityBucket.IsoObjectBucket](EntityBucket.IsoObjectBucket.html "class in zombie.entity")
    - zombie.entity.[EntityBucket.RendererBucket](EntityBucket.RendererBucket.html "class in zombie.entity")
    - zombie.entity.[EntityBucket.VehiclePartBucket](EntityBucket.VehiclePartBucket.html "class in zombie.entity")
  + zombie.entity.[EntityBucket.BucketListenerComparator](EntityBucket.BucketListenerComparator.html "class in zombie.entity") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.entity.[EntityBucket.BucketListenerData](EntityBucket.BucketListenerData.html "class in zombie.entity")
  + zombie.entity.[Family](Family.html "class in zombie.entity")
  + zombie.entity.[Family.Builder](Family.Builder.html "class in zombie.entity")
  + zombie.entity.[GameEntity](GameEntity.html "class in zombie.entity")
    - zombie.entity.[MetaEntity](MetaEntity.html "class in zombie.entity")
  + zombie.entity.[GameEntityFactory](GameEntityFactory.html "class in zombie.entity")

Interface Hierarchy
-------------------

* zombie.entity.[EntityBucket.EntityValidator](EntityBucket.EntityValidator.html "interface in zombie.entity")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.entity.[ComponentType](ComponentType.html "enum class in zombie.entity")
    - zombie.entity.[GameEntityType](GameEntityType.html "enum class in zombie.entity") (implements zombie.entity.util.enums.IOEnum)