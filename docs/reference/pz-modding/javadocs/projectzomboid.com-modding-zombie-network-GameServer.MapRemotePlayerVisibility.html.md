[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [GameServer](GameServer.html)
3. [MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [NONE](#NONE)
   2. [FACTION\_ONLY](#FACTION_ONLY)
   3. [FACTION\_AND\_VISIBLE\_ONLY](#FACTION_AND_VISIBLE_ONLY)
   4. [ALL](#ALL)
8. [Field Details](#field-detail)
   1. [value](#value)
9. [Constructor Details](#constructor-detail)
   1. [MapRemotePlayerVisibility(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class GameServer.MapRemotePlayerVisibility
===============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network")>

zombie.network.GameServer.MapRemotePlayerVisibility

All Implemented Interfaces:
:   `Serializable, Comparable<GameServer.MapRemotePlayerVisibility>, Constable`

Enclosing class:
:   `GameServer`

---

public static enum GameServer.MapRemotePlayerVisibility
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ALL`

  `FACTION_AND_VISIBLE_ONLY`

  `FACTION_ONLY`

  `NONE`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final int`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MapRemotePlayerVisibility(int value)`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static GameServer.MapRemotePlayerVisibility`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static GameServer.MapRemotePlayerVisibility[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### NONE

    public static final [GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network") NONE
  + ### FACTION\_ONLY

    public static final [GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network") FACTION\_ONLY
  + ### FACTION\_AND\_VISIBLE\_ONLY

    public static final [GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network") FACTION\_AND\_VISIBLE\_ONLY
  + ### ALL

    public static final [GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network") ALL
* Field Details
  -------------

  + ### value

    public final int value
* Constructor Details
  -------------------

  + ### MapRemotePlayerVisibility

    private MapRemotePlayerVisibility(int value)
* Method Details
  --------------

  + ### values

    public static [GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [GameServer.MapRemotePlayerVisibility](GameServer.MapRemotePlayerVisibility.html "enum class in zombie.network") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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