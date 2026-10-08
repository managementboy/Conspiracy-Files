[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [MapObjects](MapObjects.html)
3. [Callback](MapObjects.Callback.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [spriteName](#spriteName)
   2. [functions](#functions)
   3. [priority](#priority)
6. [Constructor Details](#constructor-detail)
   1. [Callback(String)](#%3Cinit%3E(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MapObjects.Callback
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.MapObjects.Callback

Enclosing class:
:   `MapObjects`

---

private static final class MapObjects.Callback
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<se.krka.kahlua.vm.LuaClosure>`

  `functions`

  `(package private) final gnu.trove.list.array.TShortArrayList`

  `priority`

  `(package private) final String`

  `spriteName`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Callback(String spriteName)`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### spriteName

    final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName
  + ### functions

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<se.krka.kahlua.vm.LuaClosure> functions
  + ### priority

    final gnu.trove.list.array.TShortArrayList priority
* Constructor Details
  -------------------

  + ### Callback

    Callback([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)