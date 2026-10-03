[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoChunk](IsoChunk.html)
3. [PhysicsShapes](IsoChunk.PhysicsShapes.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Solid](#Solid)
   2. [WallN](#WallN)
   3. [WallW](#WallW)
   4. [WallS](#WallS)
   5. [WallE](#WallE)
   6. [Tree](#Tree)
   7. [Floor](#Floor)
   8. [StairsMiddleNorth](#StairsMiddleNorth)
   9. [StairsMiddleWest](#StairsMiddleWest)
   10. [SolidStairs](#SolidStairs)
   11. [FIRST\_MESH](#FIRST_MESH)
7. [Constructor Details](#constructor-detail)
   1. [PhysicsShapes()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class IsoChunk.PhysicsShapes
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso")>

zombie.iso.IsoChunk.PhysicsShapes

All Implemented Interfaces:
:   `Serializable, Comparable<IsoChunk.PhysicsShapes>, Constable`

Enclosing class:
:   `IsoChunk`

---

private static enum IsoChunk.PhysicsShapes
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `FIRST_MESH`

  `Floor`

  `Solid`

  `SolidStairs`

  `StairsMiddleNorth`

  `StairsMiddleWest`

  `Tree`

  `WallE`

  `WallN`

  `WallS`

  `WallW`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PhysicsShapes()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoChunk.PhysicsShapes`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoChunk.PhysicsShapes[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Solid

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") Solid
  + ### WallN

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") WallN
  + ### WallW

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") WallW
  + ### WallS

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") WallS
  + ### WallE

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") WallE
  + ### Tree

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") Tree
  + ### Floor

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") Floor
  + ### StairsMiddleNorth

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") StairsMiddleNorth
  + ### StairsMiddleWest

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") StairsMiddleWest
  + ### SolidStairs

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") SolidStairs
  + ### FIRST\_MESH

    public static final [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") FIRST\_MESH
* Constructor Details
  -------------------

  + ### PhysicsShapes

    private PhysicsShapes()
* Method Details
  --------------

  + ### values

    public static [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoChunk.PhysicsShapes](IsoChunk.PhysicsShapes.html "enum class in zombie.iso") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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