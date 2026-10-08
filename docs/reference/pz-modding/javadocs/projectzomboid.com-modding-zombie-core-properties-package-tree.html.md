[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#tree)

1. [zombie.core.properties](package-summary.html)

Hierarchy For Package zombie.core.properties
============================================

Package Hierarchies:

* [All Packages](../../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.core.properties.[PropertyContainer.MostTested](PropertyContainer.MostTested.html "class in zombie.core.properties")
  + zombie.core.properties.[PropertyContainer.ProfileEntryComparitor](PropertyContainer.ProfileEntryComparitor.html "class in zombie.core.properties") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + gnu.trove.impl.hash.THash (implements java.io.[Externalizable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Externalizable.html "class or interface in java.io"))
    - gnu.trove.impl.hash.TPrimitiveHash
      * gnu.trove.impl.hash.TShortShortHash
        + gnu.trove.map.hash.TShortShortHashMap (implements java.io.[Externalizable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Externalizable.html "class or interface in java.io"), gnu.trove.map.TShortShortMap)
          - zombie.core.properties.[PropertyContainer](PropertyContainer.html "class in zombie.core.properties")
  + java.lang.[Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") (implements java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - java.lang.[Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")
      * java.lang.[RuntimeException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/RuntimeException.html "class or interface in java.lang")
        + zombie.core.properties.[IsoObjectChange.IsoObjectChangeNotFoundException](IsoObjectChange.IsoObjectChangeNotFoundException.html "class in zombie.core.properties")
        + zombie.core.properties.[IsoPropertyType.IsoPropertyTypeNotFoundException](IsoPropertyType.IsoPropertyTypeNotFoundException.html "class in zombie.core.properties")
  + zombie.core.properties.[TilePropertyKey](TilePropertyKey.html "class in zombie.core.properties")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.core.properties.[IsoObjectChange](IsoObjectChange.html "enum class in zombie.core.properties")
    - zombie.core.properties.[IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties")