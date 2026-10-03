[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoGameCharacter](IsoGameCharacter.html)
3. [BodyLocation](IsoGameCharacter.BodyLocation.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Head](#Head)
   2. [Leg](#Leg)
   3. [Arm](#Arm)
   4. [Chest](#Chest)
   5. [Stomach](#Stomach)
   6. [Foot](#Foot)
   7. [Hand](#Hand)
7. [Constructor Details](#constructor-detail)
   1. [BodyLocation()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class IsoGameCharacter.BodyLocation
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters")>

zombie.characters.IsoGameCharacter.BodyLocation

All Implemented Interfaces:
:   `Serializable, Comparable<IsoGameCharacter.BodyLocation>, Constable`

Enclosing class:
:   `IsoGameCharacter`

---

public static enum IsoGameCharacter.BodyLocation
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Arm`

  `Chest`

  `Foot`

  `Hand`

  `Head`

  `Leg`

  `Stomach`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BodyLocation()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoGameCharacter.BodyLocation`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoGameCharacter.BodyLocation[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Head

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Head
  + ### Leg

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Leg
  + ### Arm

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Arm
  + ### Chest

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Chest
  + ### Stomach

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Stomach
  + ### Foot

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Foot
  + ### Hand

    public static final [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") Hand
* Constructor Details
  -------------------

  + ### BodyLocation

    private BodyLocation()
* Method Details
  --------------

  + ### values

    public static [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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