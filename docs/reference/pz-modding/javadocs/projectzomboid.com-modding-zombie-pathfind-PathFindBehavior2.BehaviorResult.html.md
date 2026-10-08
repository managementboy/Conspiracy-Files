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
3. [BehaviorResult](PathFindBehavior2.BehaviorResult.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Working](#Working)
   2. [Failed](#Failed)
   3. [Succeeded](#Succeeded)
7. [Constructor Details](#constructor-detail)
   1. [BehaviorResult()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class PathFindBehavior2.BehaviorResult
===========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind")>

zombie.pathfind.PathFindBehavior2.BehaviorResult

All Implemented Interfaces:
:   `Serializable, Comparable<PathFindBehavior2.BehaviorResult>, Constable`

Enclosing class:
:   `PathFindBehavior2`

---

public static enum PathFindBehavior2.BehaviorResult
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Failed`

  `Succeeded`

  `Working`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BehaviorResult()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static PathFindBehavior2.BehaviorResult`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static PathFindBehavior2.BehaviorResult[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Working

    public static final [PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind") Working
  + ### Failed

    public static final [PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind") Failed
  + ### Succeeded

    public static final [PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind") Succeeded
* Constructor Details
  -------------------

  + ### BehaviorResult

    private BehaviorResult()
* Method Details
  --------------

  + ### values

    public static [PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [PathFindBehavior2.BehaviorResult](PathFindBehavior2.BehaviorResult.html "enum class in zombie.pathfind") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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