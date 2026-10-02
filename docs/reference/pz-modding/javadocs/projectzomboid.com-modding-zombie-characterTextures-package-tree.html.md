[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#tree)

1. [zombie.characterTextures](package-summary.html)

Hierarchy For Package zombie.characterTextures
==============================================

Package Hierarchies:

* [All Packages](../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.asset.Asset
    - zombie.core.textures.[Texture](../core/textures/Texture.html "class in zombie.core.textures") (implements zombie.interfaces.IDestroyable, zombie.interfaces.[ITexture](../interfaces/ITexture.html "interface in zombie.interfaces"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
      * zombie.core.textures.[SmartTexture](../core/textures/SmartTexture.html "class in zombie.core.textures")
        + zombie.characterTextures.[CharacterSmartTexture](CharacterSmartTexture.html "class in zombie.characterTextures")
        + zombie.characterTextures.[ItemSmartTexture](ItemSmartTexture.html "class in zombie.characterTextures")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.characterTextures.[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")
    - zombie.characterTextures.[BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")