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
3. [ZLayer](SpriteConfigScript.ZLayer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [rows](#rows)
6. [Constructor Details](#constructor-detail)
   1. [ZLayer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getHeight()](#getHeight())
   2. [getRow(int)](#getRow(int))
   3. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigScript.ZLayer
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.spriteconfig.SpriteConfigScript.ZLayer

Enclosing class:
:   `SpriteConfigScript`

---

public static class SpriteConfigScript.ZLayer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<SpriteConfigScript.XRow>`

  `rows`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ZLayer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getHeight()`

  `SpriteConfigScript.XRow`

  `getRow(int y)`

  `private void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### rows

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteConfigScript.XRow](SpriteConfigScript.XRow.html "class in zombie.scripting.entity.components.spriteconfig")> rows
* Constructor Details
  -------------------

  + ### ZLayer

    public ZLayer()
* Method Details
  --------------

  + ### getHeight

    public int getHeight()
  + ### getRow

    public [SpriteConfigScript.XRow](SpriteConfigScript.XRow.html "class in zombie.scripting.entity.components.spriteconfig") getRow(int y)
  + ### getVersion

    private void getVersion(zombie.world.scripts.IVersionHash hash)