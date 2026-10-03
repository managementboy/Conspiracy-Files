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
3. [XRow](SpriteConfigScript.XRow.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tiles](#tiles)
6. [Constructor Details](#constructor-detail)
   1. [XRow()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getWidth()](#getWidth())
   2. [getTile(int)](#getTile(int))
   3. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigScript.XRow
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.spriteconfig.SpriteConfigScript.XRow

Enclosing class:
:   `SpriteConfigScript`

---

public static class SpriteConfigScript.XRow
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<SpriteConfigScript.TileScript>`

  `tiles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XRow()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `SpriteConfigScript.TileScript`

  `getTile(int x)`

  `private void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  `int`

  `getWidth()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tiles

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteConfigScript.TileScript](SpriteConfigScript.TileScript.html "class in zombie.scripting.entity.components.spriteconfig")> tiles
* Constructor Details
  -------------------

  + ### XRow

    public XRow()
* Method Details
  --------------

  + ### getWidth

    public int getWidth()
  + ### getTile

    public [SpriteConfigScript.TileScript](SpriteConfigScript.TileScript.html "class in zombie.scripting.entity.components.spriteconfig") getTile(int x)
  + ### getVersion

    private void getVersion(zombie.world.scripts.IVersionHash hash)