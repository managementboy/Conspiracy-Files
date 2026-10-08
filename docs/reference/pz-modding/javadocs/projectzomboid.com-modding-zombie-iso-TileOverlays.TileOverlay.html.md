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
3. [TileOverlay](TileOverlays.TileOverlay.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tile](#tile)
   2. [entries](#entries)
6. [Constructor Details](#constructor-detail)
   1. [TileOverlay()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getEntries(String, IsoGridSquare, ArrayList)](#getEntries(java.lang.String,zombie.iso.IsoGridSquare,java.util.ArrayList))
   2. [pickRandom(String, IsoGridSquare)](#pickRandom(java.lang.String,zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileOverlays.TileOverlay
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.TileOverlays.TileOverlay

Enclosing class:
:   `TileOverlays`

---

private static final class TileOverlays.TileOverlay
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<TileOverlays.TileOverlayEntry>`

  `entries`

  `String`

  `tile`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileOverlay()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `getEntries(String room,
  IsoGridSquare square,
  ArrayList<TileOverlays.TileOverlayEntry> out)`

  `TileOverlays.TileOverlayEntry`

  `pickRandom(String room,
  IsoGridSquare square)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile
  + ### entries

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileOverlays.TileOverlayEntry](TileOverlays.TileOverlayEntry.html "class in zombie.iso")> entries
* Constructor Details
  -------------------

  + ### TileOverlay

    private TileOverlay()
* Method Details
  --------------

  + ### getEntries

    public void getEntries([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileOverlays.TileOverlayEntry](TileOverlays.TileOverlayEntry.html "class in zombie.iso")> out)
  + ### pickRandom

    public [TileOverlays.TileOverlayEntry](TileOverlays.TileOverlayEntry.html "class in zombie.iso") pickRandom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)