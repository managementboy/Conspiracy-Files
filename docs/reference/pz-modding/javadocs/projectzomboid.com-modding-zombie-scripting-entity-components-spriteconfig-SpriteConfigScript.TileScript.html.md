[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.spriteconfig](package-summary.html)
2. [SpriteConfigScript](SpriteConfigScript.html)
3. [TileScript](SpriteConfigScript.TileScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tileName](#tileName)
   2. [isEmptySpace](#isEmptySpace)
   3. [blocksSquare](#blocksSquare)
6. [Constructor Details](#constructor-detail)
   1. [TileScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getTileName()](#getTileName())
   2. [isEmptySpace()](#isEmptySpace())
   3. [isBlocksSquare()](#isBlocksSquare())
   4. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigScript.TileScript
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.spriteconfig.SpriteConfigScript.TileScript

Enclosing class:
:   `SpriteConfigScript`

---

public static class SpriteConfigScript.TileScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `blocksSquare`

  `private boolean`

  `isEmptySpace`

  `private String`

  `tileName`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TileScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getTileName()`

  `private void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  `boolean`

  `isBlocksSquare()`

  `boolean`

  `isEmptySpace()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tileName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileName
  + ### isEmptySpace

    private boolean isEmptySpace
  + ### blocksSquare

    private boolean blocksSquare
* Constructor Details
  -------------------

  + ### TileScript

    public TileScript()
* Method Details
  --------------

  + ### getTileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTileName()
  + ### isEmptySpace

    public boolean isEmptySpace()
  + ### isBlocksSquare

    public boolean isBlocksSquare()
  + ### getVersion

    private void getVersion(zombie.world.scripts.IVersionHash hash)