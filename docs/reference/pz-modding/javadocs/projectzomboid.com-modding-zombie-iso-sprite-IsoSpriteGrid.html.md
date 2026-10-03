[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.sprite](package-summary.html)
2. [IsoSpriteGrid](IsoSpriteGrid.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [sprites](#sprites)
   2. [width](#width)
   3. [height](#height)
   4. [levels](#levels)
6. [Constructor Details](#constructor-detail)
   1. [IsoSpriteGrid(int, int, int)](#%3Cinit%3E(int,int,int))
   2. [IsoSpriteGrid(int, int)](#%3Cinit%3E(int,int))
7. [Method Details](#method-detail)
   1. [getAnchorSprite()](#getAnchorSprite())
   2. [getSprite(int, int, int)](#getSprite(int,int,int))
   3. [getSprite(int, int)](#getSprite(int,int))
   4. [setSprite(int, int, int, IsoSprite)](#setSprite(int,int,int,zombie.iso.sprite.IsoSprite))
   5. [setSprite(int, int, IsoSprite)](#setSprite(int,int,zombie.iso.sprite.IsoSprite))
   6. [getSpriteIndex(IsoSprite)](#getSpriteIndex(zombie.iso.sprite.IsoSprite))
   7. [getSpriteGridPosX(IsoSprite)](#getSpriteGridPosX(zombie.iso.sprite.IsoSprite))
   8. [getSpriteGridPosY(IsoSprite)](#getSpriteGridPosY(zombie.iso.sprite.IsoSprite))
   9. [getSpriteGridPosZ(IsoSprite)](#getSpriteGridPosZ(zombie.iso.sprite.IsoSprite))
   10. [getSpriteFromIndex(int)](#getSpriteFromIndex(int))
   11. [getWidth()](#getWidth())
   12. [getHeight()](#getHeight())
   13. [getLevels()](#getLevels())
   14. [validate()](#validate())
   15. [getSpriteCount()](#getSpriteCount())
   16. [getSprites()](#getSprites())
   17. [isValidXYZ(int, int, int)](#isValidXYZ(int,int,int))
   18. [getSpriteIndex(int, int, int)](#getSpriteIndex(int,int,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoSpriteGrid
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.sprite.IsoSpriteGrid

---

public final class IsoSpriteGrid
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `height`

  `private final int`

  `levels`

  `private final IsoSprite[]`

  `sprites`

  `private final int`

  `width`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoSpriteGrid(int width,
  int height)`

  `IsoSpriteGrid(int width,
  int height,
  int levels)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoSprite`

  `getAnchorSprite()`

  `int`

  `getHeight()`

  `int`

  `getLevels()`

  `IsoSprite`

  `getSprite(int x,
  int y)`

  `IsoSprite`

  `getSprite(int x,
  int y,
  int z)`

  `int`

  `getSpriteCount()`

  `IsoSprite`

  `getSpriteFromIndex(int index)`

  `int`

  `getSpriteGridPosX(IsoSprite sprite)`

  `int`

  `getSpriteGridPosY(IsoSprite sprite)`

  `int`

  `getSpriteGridPosZ(IsoSprite sprite)`

  `int`

  `getSpriteIndex(int x,
  int y,
  int z)`

  `int`

  `getSpriteIndex(IsoSprite sprite)`

  `IsoSprite[]`

  `getSprites()`

  `int`

  `getWidth()`

  `boolean`

  `isValidXYZ(int x,
  int y,
  int z)`

  `void`

  `setSprite(int x,
  int y,
  int z,
  IsoSprite sprite)`

  `void`

  `setSprite(int x,
  int y,
  IsoSprite sprite)`

  `boolean`

  `validate()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### sprites

    private final [IsoSprite](IsoSprite.html "class in zombie.iso.sprite")[] sprites
  + ### width

    private final int width
  + ### height

    private final int height
  + ### levels

    private final int levels
* Constructor Details
  -------------------

  + ### IsoSpriteGrid

    public IsoSpriteGrid(int width,
    int height,
    int levels)
  + ### IsoSpriteGrid

    public IsoSpriteGrid(int width,
    int height)
* Method Details
  --------------

  + ### getAnchorSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getAnchorSprite()
  + ### getSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite(int x,
    int y,
    int z)
  + ### getSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSprite(int x,
    int y)
  + ### setSprite

    public void setSprite(int x,
    int y,
    int z,
    [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### setSprite

    public void setSprite(int x,
    int y,
    [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getSpriteIndex

    public int getSpriteIndex([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getSpriteGridPosX

    public int getSpriteGridPosX([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getSpriteGridPosY

    public int getSpriteGridPosY([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getSpriteGridPosZ

    public int getSpriteGridPosZ([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getSpriteFromIndex

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getSpriteFromIndex(int index)
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### getLevels

    public int getLevels()
  + ### validate

    public boolean validate()
  + ### getSpriteCount

    public int getSpriteCount()
  + ### getSprites

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite")[] getSprites()
  + ### isValidXYZ

    public boolean isValidXYZ(int x,
    int y,
    int z)
  + ### getSpriteIndex

    public int getSpriteIndex(int x,
    int y,
    int z)