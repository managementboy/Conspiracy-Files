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
3. [TileOverlayUsage](TileOverlays.TileOverlayUsage.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [usage](#usage)
   2. [zOnly](#zOnly)
   3. [zGreaterThan](#zGreaterThan)
   4. [alpha](#alpha)
   5. [tableTop](#tableTop)
6. [Constructor Details](#constructor-detail)
   1. [TileOverlayUsage()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [parse(String)](#parse(java.lang.String))
   2. [match(IsoGridSquare)](#match(zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileOverlays.TileOverlayUsage
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.TileOverlays.TileOverlayUsage

Enclosing class:
:   `TileOverlays`

---

private static final class TileOverlays.TileOverlayUsage
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `alpha`

  `(package private) boolean`

  `tableTop`

  `(package private) String`

  `usage`

  `(package private) int`

  `zGreaterThan`

  `(package private) int`

  `zOnly`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TileOverlayUsage()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) boolean`

  `match(IsoGridSquare square)`

  `(package private) boolean`

  `parse(String usage)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### usage

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") usage
  + ### zOnly

    int zOnly
  + ### zGreaterThan

    int zGreaterThan
  + ### alpha

    float alpha
  + ### tableTop

    boolean tableTop
* Constructor Details
  -------------------

  + ### TileOverlayUsage

    private TileOverlayUsage()
* Method Details
  --------------

  + ### parse

    boolean parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") usage)
  + ### match

    boolean match([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)