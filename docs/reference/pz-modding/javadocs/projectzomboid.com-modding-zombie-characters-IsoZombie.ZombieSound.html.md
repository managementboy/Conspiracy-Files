[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoZombie](IsoZombie.html)
3. [ZombieSound](IsoZombie.ZombieSound.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Burned](#Burned)
   2. [DeadCloseKilled](#DeadCloseKilled)
   3. [DeadNotCloseKilled](#DeadNotCloseKilled)
   4. [Hurt](#Hurt)
   5. [Idle](#Idle)
   6. [Lunge](#Lunge)
   7. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [radius](#radius)
   2. [values](#values)
9. [Constructor Details](#constructor-detail)
   1. [ZombieSound(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [radius()](#radius())
    4. [fromIndex(int)](#fromIndex(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class IsoZombie.ZombieSound
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters")>

zombie.characters.IsoZombie.ZombieSound

All Implemented Interfaces:
:   `Serializable, Comparable<IsoZombie.ZombieSound>, Constable`

Enclosing class:
:   `IsoZombie`

---

public static enum IsoZombie.ZombieSound
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Burned`

  `DeadCloseKilled`

  `DeadNotCloseKilled`

  `Hurt`

  `Idle`

  `Lunge`

  `MAX`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `radius`

  `private static final IsoZombie.ZombieSound[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ZombieSound(int radius)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoZombie.ZombieSound`

  `fromIndex(int index)`

  `int`

  `radius()`

  `static IsoZombie.ZombieSound`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoZombie.ZombieSound[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Burned

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") Burned
  + ### DeadCloseKilled

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") DeadCloseKilled
  + ### DeadNotCloseKilled

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") DeadNotCloseKilled
  + ### Hurt

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") Hurt
  + ### Idle

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") Idle
  + ### Lunge

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") Lunge
  + ### MAX

    public static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") MAX
* Field Details
  -------------

  + ### radius

    private final int radius
  + ### values

    private static final [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters")[] values
* Constructor Details
  -------------------

  + ### ZombieSound

    private ZombieSound(int radius)
* Method Details
  --------------

  + ### values

    public static [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### radius

    public int radius()
  + ### fromIndex

    public static [IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters") fromIndex(int index)