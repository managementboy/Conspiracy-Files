[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileSeamManager](TileSeamManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [textures](#textures)
   3. [vertices](#vertices)
7. [Constructor Details](#constructor-detail)
   1. [TileSeamManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [getTexture(TileSeamManager.Tiles)](#getTexture(zombie.tileDepth.TileSeamManager.Tiles))
   3. [getVertices(TileSeamManager.Tiles)](#getVertices(zombie.tileDepth.TileSeamManager.Tiles))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileSeamManager
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.tileDepth.TileSeamManager

---

public final class TileSeamManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `TileSeamManager.Tiles`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final TileSeamManager`

  `instance`

  `private final Texture[]`

  `textures`

  `private final float[][]`

  `vertices`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TileSeamManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Texture`

  `getTexture(TileSeamManager.Tiles tiles)`

  `float[]`

  `getVertices(TileSeamManager.Tiles tiles)`

  `void`

  `init()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [TileSeamManager](TileSeamManager.html "class in zombie.tileDepth") instance
  + ### textures

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures")[] textures
  + ### vertices

    private final float[][] vertices
* Constructor Details
  -------------------

  + ### TileSeamManager

    public TileSeamManager()
* Method Details
  --------------

  + ### init

    public void init()
  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture([TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") tiles)
  + ### getVertices

    public float[] getVertices([TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") tiles)