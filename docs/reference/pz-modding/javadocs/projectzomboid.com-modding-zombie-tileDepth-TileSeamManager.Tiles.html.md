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
3. [Tiles](TileSeamManager.Tiles.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [FloorSouth](#FloorSouth)
   2. [FloorEast](#FloorEast)
   3. [WallSouth](#WallSouth)
   4. [WallEast](#WallEast)
   5. [FloorSouthOneThird](#FloorSouthOneThird)
   6. [FloorEastOneThird](#FloorEastOneThird)
   7. [FloorSouthTwoThirds](#FloorSouthTwoThirds)
   8. [FloorEastTwoThirds](#FloorEastTwoThirds)
7. [Constructor Details](#constructor-detail)
   1. [Tiles()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class TileSeamManager.Tiles
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth")>

zombie.tileDepth.TileSeamManager.Tiles

All Implemented Interfaces:
:   `Serializable, Comparable<TileSeamManager.Tiles>, Constable`

Enclosing class:
:   `TileSeamManager`

---

public static enum TileSeamManager.Tiles
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `FloorEast`

  `FloorEastOneThird`

  `FloorEastTwoThirds`

  `FloorSouth`

  `FloorSouthOneThird`

  `FloorSouthTwoThirds`

  `WallEast`

  `WallSouth`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Tiles()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static TileSeamManager.Tiles`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static TileSeamManager.Tiles[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### FloorSouth

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") FloorSouth
  + ### FloorEast

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") FloorEast
  + ### WallSouth

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") WallSouth
  + ### WallEast

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") WallEast
  + ### FloorSouthOneThird

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") FloorSouthOneThird
  + ### FloorEastOneThird

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") FloorEastOneThird
  + ### FloorSouthTwoThirds

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") FloorSouthTwoThirds
  + ### FloorEastTwoThirds

    public static final [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") FloorEastTwoThirds
* Constructor Details
  -------------------

  + ### Tiles

    private Tiles()
* Method Details
  --------------

  + ### values

    public static [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [TileSeamManager.Tiles](TileSeamManager.Tiles.html "enum class in zombie.tileDepth") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null