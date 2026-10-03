[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.pathfind](package-summary.html)
2. [PathFindBehavior2](PathFindBehavior2.html)
3. [Goal](PathFindBehavior2.Goal.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [Character](#Character)
   3. [Location](#Location)
   4. [Sound](#Sound)
   5. [VehicleAdjacent](#VehicleAdjacent)
   6. [VehicleArea](#VehicleArea)
   7. [VehicleSeat](#VehicleSeat)
   8. [SitOnFurniture](#SitOnFurniture)
   9. [GrabCorpse](#GrabCorpse)
7. [Constructor Details](#constructor-detail)
   1. [Goal()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class PathFindBehavior2.Goal
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind")>

zombie.pathfind.PathFindBehavior2.Goal

All Implemented Interfaces:
:   `Serializable, Comparable<PathFindBehavior2.Goal>, Constable`

Enclosing class:
:   `PathFindBehavior2`

---

public static enum PathFindBehavior2.Goal
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Character`

  `GrabCorpse`

  `Location`

  `None`

  `SitOnFurniture`

  `Sound`

  `VehicleAdjacent`

  `VehicleArea`

  `VehicleSeat`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Goal()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static PathFindBehavior2.Goal`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static PathFindBehavior2.Goal[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### None

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") None
  + ### Character

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") Character
  + ### Location

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") Location
  + ### Sound

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") Sound
  + ### VehicleAdjacent

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") VehicleAdjacent
  + ### VehicleArea

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") VehicleArea
  + ### VehicleSeat

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") VehicleSeat
  + ### SitOnFurniture

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") SitOnFurniture
  + ### GrabCorpse

    public static final [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") GrabCorpse
* Constructor Details
  -------------------

  + ### Goal

    private Goal()
* Method Details
  --------------

  + ### values

    public static [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [PathFindBehavior2.Goal](PathFindBehavior2.Goal.html "enum class in zombie.pathfind") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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