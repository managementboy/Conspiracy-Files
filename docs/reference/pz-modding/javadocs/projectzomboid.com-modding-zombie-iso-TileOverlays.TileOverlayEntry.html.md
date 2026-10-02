[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [TileOverlays](TileOverlays.html)
3. [TileOverlayEntry](TileOverlays.TileOverlayEntry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [room](#room)
   2. [chance](#chance)
   3. [tiles](#tiles)
   4. [usage](#usage)
6. [Constructor Details](#constructor-detail)
   1. [TileOverlayEntry()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [matchUsage(IsoGridSquare)](#matchUsage(zombie.iso.IsoGridSquare))
   2. [pickRandom(int, int, int)](#pickRandom(int,int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileOverlays.TileOverlayEntry
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.TileOverlays.TileOverlayEntry

Enclosing class:
:   `TileOverlays`

---

private static final class TileOverlays.TileOverlayEntry
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `chance`

  `String`

  `room`

  `final ArrayList<String>`

  `tiles`

  `final TileOverlays.TileOverlayUsage`

  `usage`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileOverlayEntry()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `matchUsage(IsoGridSquare square)`

  `String`

  `pickRandom(int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### room

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room
  + ### chance

    public int chance
  + ### tiles

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tiles
  + ### usage

    public final [TileOverlays.TileOverlayUsage](TileOverlays.TileOverlayUsage.html "class in zombie.iso") usage
* Constructor Details
  -------------------

  + ### TileOverlayEntry

    private TileOverlayEntry()
* Method Details
  --------------

  + ### matchUsage

    public boolean matchUsage([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### pickRandom

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickRandom(int x,
    int y,
    int z)