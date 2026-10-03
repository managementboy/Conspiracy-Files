[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.sprite](package-summary.html)
2. [IsoSpriteManager](IsoSpriteManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [namedMap](#namedMap)
   3. [intMap](#intMap)
   4. [emptySprite](#emptySprite)
6. [Constructor Details](#constructor-detail)
   1. [IsoSpriteManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Dispose()](#Dispose())
   2. [getSprite(int)](#getSprite(int))
   3. [getSprite(String)](#getSprite(java.lang.String))
   4. [getOrAddSpriteCache(String)](#getOrAddSpriteCache(java.lang.String))
   5. [getOrAddSpriteCache(String, Color)](#getOrAddSpriteCache(java.lang.String,zombie.core.Color))
   6. [AddSprite(String)](#AddSprite(java.lang.String))
   7. [AddSprite(String, int)](#AddSprite(java.lang.String,int))
   8. [getNamedMap()](#getNamedMap())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoSpriteManager
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.sprite.IsoSpriteManager

---

public final class IsoSpriteManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final IsoSprite`

  `emptySprite`

  `static final IsoSpriteManager`

  `instance`

  `final gnu.trove.map.hash.TIntObjectHashMap<IsoSprite>`

  `intMap`

  `final HashMap<String, IsoSprite>`

  `namedMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoSpriteManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoSprite`

  `AddSprite(String tex)`

  `IsoSprite`

  `AddSprite(String tex,
  int id)`

  `void`

  `Dispose()`

  `Map<String, IsoSprite>`

  `getNamedMap()`

  `IsoSprite`

  `getOrAddSpriteCache(String tex)`

  `IsoSprite`

  `getOrAddSpriteCache(String tex,
  Color col)`

  `IsoSprite`

  `getSprite(int gid)`

  `IsoSprite`

  `getSprite(String gid)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [IsoSpriteManager](IsoSpriteManager.html "class in zombie.iso.sprite") instance
  + ### namedMap

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoSprite](IsoSprite.html "class in zombie.iso.sprite")> namedMap
  + ### intMap

    public final gnu.trove.map.hash.TIntObjectHashMap<[IsoSprite](IsoSprite.html "class in zombie.iso.sprite")> intMap
  + ### emptySprite

    private final [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") emptySprite
* Constructor Details
  -------------------

  + ### IsoSpriteManager

    public IsoSpriteManager()
* Method Details
  --------------

  + ### Dispose

    public void Dispose()
  + ### getSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite(int gid)
  + ### getSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gid)
  + ### getOrAddSpriteCache

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getOrAddSpriteCache([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### getOrAddSpriteCache

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getOrAddSpriteCache([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    [Color](../../core/Color.html "class in zombie.core") col)
  + ### AddSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") AddSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex)
  + ### AddSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") AddSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tex,
    int id)
  + ### getNamedMap

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoSprite](IsoSprite.html "class in zombie.iso.sprite")> getNamedMap()